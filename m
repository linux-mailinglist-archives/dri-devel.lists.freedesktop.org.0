Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C94BA508
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EB710EB12;
	Thu, 17 Feb 2022 15:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F87110EB12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:54:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4JzzsQ4RFyz9sTK;
 Thu, 17 Feb 2022 16:54:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1645113256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbaevKaSp6yULErLP4A6MNOZsJSMp3WymdgLk6RMCTo=;
 b=daoQs4G9tRpAwZ1fBdamxLTs1THj0knLJ/HR5uzSMLzlIrw93kqxqG7eFvz3+/a5Kqa5c1
 xSh7PpoAwks25VWXeBtYAN7Q3Gqu0B5RYcm3H26DNeC3tA2JeJOSp+OqKxzpNNk8GN+Wob
 dUOrWEhJ9uy+GZ4M7VMRbjGfSTyNL55TlzKjouoweilvCvgH8PkEJ+ULQQoR9C5od/jpN8
 BNUH6txao69SnGtj5SfZAWzYPu7WGemwMYXbqMBwjzPShR3WN4e7flv4GJHKzivD455lBK
 F1glGRKtDZ+5URTavVON2YV2oyZOPiAumAuQhpZiUHJVQJDefv4w9u056IH85Q==
Message-ID: <4c5c5325-3e6d-d1a7-bc4d-c38ad769701a@mailbox.org>
Date: Thu, 17 Feb 2022 16:54:13 +0100
MIME-Version: 1.0
Subject: Re: [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr
 0x4b0 for 1 bytes NAKed
Content-Language: en-CA
To: Jocelyn Falempe <jfalempe@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <47101f87-48d7-0c93-adbf-9b84cd3754a3@redhat.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <47101f87-48d7-0c93-adbf-9b84cd3754a3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Richard Hughes <rhughes@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-16 15:39, Jocelyn Falempe wrote:
> Hi,
> 
> When using a Lenovo dock, I often get this error message on dmesg:
> 
> [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
> 
> It's caused by fwupd which tries to read from /dev/drm_dp_aux4
> 
> I opened an issue on fwupd:
> https://github.com/fwupd/fwupd/issues/4284
> 
> But it turns out, it's probably an issue in the drm mst code instead.
> 
> When I connect my Dock (Lenovo Thinkpad Thunderbold 3 Gen 2), I get 3 drm_dp_aux[] created:
> 
> /dev/drm_dp_aux[456]
> 
> Reading from this devices at any address will always get the NAKed error above, unless there is an actual DP monitor connected (HDMI monitor or nothing connected gives a NAK)
> 
> Each time I connect or disconnect a monitor on the dock, this 3 /dev/drm_dp_aux[] are destroyed and recreated.
> 
> So I think the device /dev/drm_dp_aux[] should be created only if there is an actual monitor connected that can reply to it.
> What's the purpose of providing userspace a device which can't be read or written ? (or maybe just fail the open() call, like Mario suggested on the fwupd issue, so the devices are still there with the same numbering)
> 
> On the other hand, we can also consider that it's expected to get NAck in drm_dp_send_dpcd_read() and replace drm_err() with drm_dbg()
> 
> what do you think ?
> 

Adding Lyude, AFAIK she's looked into this before.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
