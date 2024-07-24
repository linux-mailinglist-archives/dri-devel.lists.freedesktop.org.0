Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC093B407
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 17:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2206510E735;
	Wed, 24 Jul 2024 15:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="gd6EnazY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603310E735
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 Reply-To:Subject:Cc:To:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To
 :Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=crvD7PrqGMqV/Y/g69Di0jX+60ZadkqnzEmO6bIr5Ak=; t=1721835779;
 x=1722267779; b=gd6EnazYcDePayNzkUEccp7Wjx+BLYlCHyBpGgU7TsrWOGKwjGZdy3arXPOwr
 k40MDRjdOdVnwb8f5udrLX76qdlwQ2jCw2iLh3MvjNrMoc1kjiYw3zvau+7QBUR+jsZhq62/9t7CI
 Ik63V2NBY0aKKNl7B9N9ybJ516IUYnkMgp2uD69ijqf1dKLt5gCfDthYQhVkB2Hh6YYRUMgOME0R9
 25Qb/MuOSDRgY0tE/RbediLgSJlZgzoJC7Lm8U3wcldfgmBWzQAAcwm0HQEvvAZWEsRWE1OsrI6Oj
 A8GVMgwBfbu4Psip4dE6nq7cN1lpdhTiQj53aZZ8GbwnSuPmNw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sWe8m-0001Zq-LO; Wed, 24 Jul 2024 17:42:56 +0200
Message-ID: <1ff5b407-ff81-40ef-8aa3-9f155491f497@leemhuis.info>
Date: Wed, 24 Jul 2024 17:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Colin Ian King <colin.i.king@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [regression] opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1721835779;
 7bc63327; 
X-HE-SMSGID: 1sWe8m-0001Zq-LO
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a report about a regression in bugzilla.kernel.org that
appears to be related to the simpledrm driver. As many (most?) kernel
developers don't keep an eye on the bug tracker, I decided to write this
mail. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=219007 :

>  Colin Ian King 2024-07-05 16:05:27 UTC
> 
> The following code when run as root on a Debian sid amd64 server
> running in virt-manager (KVM QEMU) will shut the system down with
> 6.10.0-rc6.  The fork() is required to cause racing on the open/close on
> /dev/dri/card0
> 
> #include <fcntl.h>
> #include <unistd.h>
> 
> int main(void)
> {
> 	 pid_t pid = fork();
> 
> 	 while (1) {
> 	 	int fd;
> 
> 	 	fd = openat(AT_FDCWD, "/dev/dri/card0", O_WRONLY|O_NONBLOCK|O_SYNC);
> 	 	close(fd);
> 	 }
> }
> 
> This was originally found using: while true; do sudo ./stress-ng
> --dev 4 --dev-file /dev/dri/card0 -t 5; done and narrowed down to the
> above reproducer. (cf:
> https://github.com/ColinIanKing/stress-ng/issues/407 )
> 
> This does not occur on pre 6.10 kernels, so it looks like a 6.10 regression.

See the ticket for more details, which also contains a dmesg from a boot
in the VM: https://bugzilla.kernel.org/attachment.cgi?id=306610

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

P.S.: let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.9..v6.10
#regzbot title: drm: opening and closing /dev/dri/card0 in a QEMU KVM
instance will shutdown system
#regzbot from: Colin Ian King <colin.i.king@gmail.com>
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219007
#regzbot ignore-activity
