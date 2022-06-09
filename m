Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2ED544C7C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB5D10F388;
	Thu,  9 Jun 2022 12:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E5010F388
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:49:37 +0000 (UTC)
Received: from smtp.vodafone.de (unknown [10.0.0.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mr4.vodafonemail.de (Postfix) with ESMTPS id 4LJkSb4Wg0z1yQ9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
 s=vfde-mb-mr2-21dec; t=1654778975;
 bh=zwhFgGTxzT06Re0cygr1h1oR7WtqkXsjsLWAcnUieWk=;
 h=Message-ID:Date:User-Agent:To:Content-Language:From:Subject:
 Content-Type:From;
 b=Qti+hgmGW+6qE4vBwrDD7rd8/8vNPf2i/BtKgr11aNnt6t145dmx/ocpvjyXWwLfh
 zl2qX6iNW5OcIEiwk/OMTZbMwEvEPhacHn3kz/HAUOmqQcDOqEuIJMVIOZfv7ZmH6E
 J5LPhkX+iMQAXzVX4luAHxyq829CXW26xnirq/J0=
Received: from schreibtisch (p2e579e8f.dip0.t-ipconnect.de [46.87.158.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id 4LJkSb0fXjz9vYH
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:49:31 +0000 (UTC)
Message-ID: <5d81e922-fa5b-7a81-0e91-7f79a3646289@arcor.de>
Date: Thu, 9 Jun 2022 14:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To: dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Peter Mattern <pmattern@arcor.de>
Subject: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 2082
X-purgate-ID: 155817::1654778975-EA3593BB-CD2BB902/0/0
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

 > Which kernel config do you use (is it a defconfig)?
These are custom configs provided by the distribution, the origin of 
which I do not know.
You can find them at [1] (5.17.0, used in 5.17.1 as well) and [2] 
(5.18.0, modified in 5.18.1).
The difference between these files and their upstream (kernel.org) 
counterpart as created by running 'make ARCH=arm64 defconfig' is about 
11k lines, the difference between the two files of the distribution 
around 800 lines. Didn't investigate the differences in detail yet.

 > Do you use the mainline device tree blob or the Raspberry Pi DTB?
It's the one from the kernel.org sources.
Note: At times you'll find claims that the DTBs of the Raspberry Pi 
Foundation were used on Arch Linux ARM. These probably are due to the 
fact that those blobs happen to be around. But U-Boot's boot.scr does 
pick the "mainline" ones in /boot/dtbs/.

 > Please provide the version/date of the GPU firmware?
It is provided by the Broadcom bootloader package (which is used to 
chainload U-Boot). It happened to be updated in parallel with kernel 
5.18.0 to commit f145afcf [3] and has since been updated to upstream 
commit 8f91a969. Those latest changes don't seem to have an impact on 
the problem we're discussing here (not all combinations bootloader / 
kernel tested).

 > Do you have any KMS related setting in the config.txt?
No.
My epic config.txt is: enable_uart=1

 > Can you provide a full dmesg for the bad case?
I sure could. But grepping through it yields the exact same results 
included in my first post. And assuming this list scrubs attachments I'm 
not sure whether posting those 500 lines in a mail would make sense?

[1] 
https://github.com/archlinuxarm/PKGBUILDs/blob/ae861a830e6e1d6d3e37c94462c8f48671aa9b79/core/linux-aarch64/config
[2] 
https://github.com/archlinuxarm/PKGBUILDs/blob/9c5b51b25ecc038cd505b26e15bb80464783a713/core/linux-aarch64/config
[3] 
https://github.com/archlinuxarm/PKGBUILDs/blob/722080b0aaa7e158d91b323d27c41839d1ef42f0/alarm/raspberrypi-bootloader/PKGBUILD

