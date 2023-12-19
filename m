Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E9818BFE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 17:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FD310E1A5;
	Tue, 19 Dec 2023 16:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www61.your-server.de (www61.your-server.de [213.133.104.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3559F10E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 16:15:56 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www61.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <stefan.hoffmeister@econos.de>)
 id 1rFcl8-000AKj-Gu; Tue, 19 Dec 2023 17:15:54 +0100
Received: from [192.168.0.30] (helo=webmail.your-server.de)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (Exim 4.92)
 (envelope-from <stefan.hoffmeister@econos.de>)
 id 1rFcl8-000QNI-9N; Tue, 19 Dec 2023 17:15:54 +0100
Received: from [2a02:1210:249e:f00:24d4:59da:a98b:e722]
 ([2a02:1210:249e:f00:24d4:59da:a98b:e722]) by webmail.your-server.de (Horde
 Framework) with HTTPS; Tue, 19 Dec 2023 17:15:54 +0100
Date: Tue, 19 Dec 2023 17:15:54 +0100
Message-ID: <20231219171554.Horde.U9YedWH6peFYoNUi4CA_Wzp@webmail.your-server.de>
From: Stefan Hoffmeister <stefan.hoffmeister@econos.de>
To: dri-devel@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>, VMware
 Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Subject: BUG / design challenge: vmwgfx + PRIME handle free == clobbering errno
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-Authenticated-Sender: stefan.hoffmeister@econos.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27128/Tue Dec 19 10:36:48 2023)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

vmwgfx implements drmPrimeFDToHandle in terms of the TTM resource manager.

At the same time, the driver advertises

	.driver_features =
	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM,

Given that, a userland application will call drmCloseBufferHandle to  
correctly release any previously acquired handle.

In kernel language, this translates to ioctl  
DRM_IOCTL_PRIME_FD_TO_HANDLE and DRM_IOCTL_GEM_CLOSE.

Problems:

a) because the application uses drmCloseBufferHandle, and that goes  
through GEM (the driver claims "I am GEM"!), vmwgfx will always return  
EINVAL, because the driver is _not_ GEM, but TTM on that aspect.

This will always clobber errno for userspace, which is not at all  
helpful for meaningful error handling.

Additionally, the driver offers no formal API contract which would  
allow applications to detect that the driver does not like be talked  
to like a GEM driver, although it is _claims_ to be GEM driver.

b) there is no (documented) means to release the handle acquired from  
a call to drmPrimeFDToHandle; this implies that in principle any call  
to drmPrimeFDToHandle will leak the handle.

Questions:

a) how can errno clobbering by vmwgfx with EINVAL be avoided?

b) what is the correct way to release the TTM resources allocated  
through drmPrimeFDToHandle?


For context: the KDE Plasma Desktop kwin DRM integration layer makes  
extensive use of drmPrimeFDToHandle. With the way the VMware vmwgfx  
driver behaves, I see these options:

a) correctly check the return code of drmCloseBufferHandle and blindly  
log all the EINVAL errors triggered by the VMware driver, putting  
blame on the application for mis-managing handles
b) drop any return code from drmCloseBufferHandle onto the floor,  
completely disregarding application integrity checking
c) hard-code a check for "vmwgfx" as the driver in use and spam "this  
driver owned by VMware / Broadcom is broken, ignore the following  
EINVAL and secondary effects" for integrity checks

I do not like any of these options, to be honest.

Many thanks for any input
Stefan

