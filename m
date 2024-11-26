Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7749D9968
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D277210E8C6;
	Tue, 26 Nov 2024 14:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="YXvTH1yh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6610E8C6;
 Tue, 26 Nov 2024 14:16:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732630586; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cjmqaF/GIZj6aAUKbpn1mZEAsalC1q89ejEthPd74jo8R1iebUeg98jd0bTOMExrBnOMbzWzeXXRTQE35VDqCRCRssfjMrbuigal9yU1u6+WP61tWSxJx1zqA4j9bM6K1G1H22zSR++VqvQBa1Uuld0E7GPAqY7dlCbYlwSAQCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732630586;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FDO7eDQHyNV+5Ifxde9MtWfXA0DBzyust/9vl90ohIY=; 
 b=iZNYqAK6TlOeaX6gasgsysCoS1KoOYQUZ0qbNZB7vEC27KwDf5npR3Xr0vsp0YMDjx+01pE1cGYxkxV9Ti2CTs+1fQsmH2vH5T79IFHyMEU4ltGOT0D47oOwELaVygigs903+oNjlcqglEWbQ+jtlnhccfAjQ6D5y2aYSt2Jxfk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
 dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732630586; 
 s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Cc:Cc:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FDO7eDQHyNV+5Ifxde9MtWfXA0DBzyust/9vl90ohIY=;
 b=YXvTH1yhgRYSkp9fDzujm/yuQ6cqmNb4PF/7tgtPFAS6/JEHx/s3u+1qUmr6rl46
 7x0hcoslnKQbJnOr8pacYpoprbOrVANoxp6AdXRW9vzUXpxb80KkDnk6mbNqBa6+Mun
 NonstgqcmVsoV/TSrDvlX1uzDb3+h2rrIZcydzes=
Received: by mx.zohomail.com with SMTPS id 1732630582504831.1595780791179;
 Tue, 26 Nov 2024 06:16:22 -0800 (PST)
Message-ID: <bd40847e-e277-4f0f-b158-87c581192cef@collabora.com>
Date: Tue, 26 Nov 2024 19:16:19 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sunil Khatri <sunil.khatri@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jack Xiao <Jack.Xiao@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Subject: [Bug Report] Warning from __flush_work() on next-20241126
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

We are getting this warning on x86_64 and i386 targets:
[    8.677157] amdgpu 0000:03:00.0: [drm:amdgpu_ib_ring_tests] *ERROR* IB test failed on sdma0 (-110).
[    8.698661] ------------[ cut here ]------------
[    8.703310] WARNING: CPU: 1 PID: 49 at kernel/workqueue.c:4192 __flush_work+0xb8/0xd0
[    8.711206] Modules linked in:
[    8.714285] CPU: 1 UID: 0 PID: 49 Comm: kworker/1:1 Tainted: G        W          6.12.0-next-20241126 #1
[    8.723790] Tainted: [W]=WARN
[    8.726781] Hardware name: Google Shuboz/Shuboz, BIOS Google_Shuboz.13434.780.2022_10_13_1418 09/12/2022
[    8.736273] Workqueue: events amdgpu_device_delayed_init_work_handler
[    8.742768] EIP: __flush_work+0xb8/0xd0
[    8.746632] Code: 00 00 f3 90 8d 45 c0 e8 92 1d 04 00 84 c0 74 f2 eb d2 8d b4 26 00 00 00 00 90 0f 0b c6 45 9b 00 eb c2 8d b4 26 00 00 00 00 90 <0f> 0b eb ee 8d 74 26 00 0f 0b eb a6 8d 74 26 00 e8 8f c4 8d 01 8d
[    8.765410] EAX: 00000000 EBX: c272ee01 ECX: 00000001 EDX: 00000000
[    8.771726] ESI: c272eea8 EDI: c194d77c EBP: c17bbd64 ESP: c17bbcfc
[    8.778011] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[    8.784829] CR0: 80050033 CR2: 00000000 CR3: 1355b000 CR4: 003506d0
[    8.791120] Call Trace:
[    8.793591]  ? show_regs+0x51/0x58
[    8.797028]  ? __flush_work+0xb8/0xd0
[    8.800724]  ? __warn+0x8d/0x1b8
[    8.804024]  ? __flush_work+0xb8/0xd0
[    8.807710]  ? __flush_work+0xb8/0xd0
[    8.811403]  ? report_bug+0x186/0x1b0
[    8.815094]  ? __flush_work+0xb9/0xd0
[    8.818785]  ? exc_overflow+0x50/0x50
[    8.822474]  ? handle_bug+0x56/0x90

For complete details:
[1] https://kcidb.kernelci.org/d/test/test?orgId=1&var-datasource=default&var-build_architecture=i386&var-build_config_name=defconfig&var-id=maestro:67455b9a3be6da94b19fde77&from=now-100y&to=now&timezone=browser&var-origin=$__all&var-test_path=&var-issue_presence=$__all
[2]https://kcidb.kernelci.org/d/test/test?orgId=1&var-datasource=default&var-build_architecture=x86_64&var-build_config_name=cros:%2F%2Fchromeos-6.6%2Fx86_64%2Fchromeos-amd-stoneyridge.flavour.config&var-id=maestro:67455b923be6da94b19fde4b&from=now-100y&to=now&timezone=browser&var-origin=$__all&var-test_path=&var-issue_presence=$__all
[3]https://kcidb.kernelci.org/d/test/test?orgId=1&var-datasource=default&var-build_architecture=x86_64&var-build_config_name=cros:%2F%2Fchromeos-6.6%2Fx86_64%2Fchromeos-amd-stoneyridge.flavour.config&var-id=maestro:67455b923be6da94b19fde48&from=now-100y&to=now&timezone=browser&var-origin=$__all&var-test_path=&var-issue_presence=$__all
[4]https://kcidb.kernelci.org/d/test/test?orgId=1&var-datasource=default&var-build_architecture=x86_64&var-build_config_name=cros:%2F%2Fchromeos-6.6%2Fx86_64%2Fchromeos-amd-stoneyridge.flavour.config&var-id=maestro:67455b8c3be6da94b19fde34&from=now-100y&to=now&timezone=browser&var-origin=$__all&var-test_path=&var-issue_presence=$__all

-- 
BR,
Muhammad Usama Anjum
