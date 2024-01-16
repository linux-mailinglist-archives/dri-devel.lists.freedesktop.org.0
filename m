Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7482F2F2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F0F10E20A;
	Tue, 16 Jan 2024 17:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 17:13:22 UTC
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2FD10E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 17:13:22 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 5DAF244023D;
 Tue, 16 Jan 2024 19:06:06 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1705424766;
 bh=XI/97lEXxQjnyFeWWFvmUnGKCIYeJT6Fts70j+TRXMg=;
 h=From:To:Cc:Subject:Date:From;
 b=MyvjPZ/kum+OZM/P+JmvPng7vYaZBQUXwvvO6ozaZNtJIe+XQZBhSMaZPE6oOm87o
 /85LQryXh1cbrilhDTHuNjSO6hc3tal/5TV5it+dsKnghCVly0g3pgyeJdm+ic+Xzl
 2wGRRl+sqWmZbqJmQg20pMRad6IX8k7/xUhPzzsfJJVZ1A/cELkyY/mcgh6eDeT7sy
 1qMijMV9fH1GRralDU3hF3gmC7yFMf29B+KFNEAJemBJBKq1HKZ9zwdN5tdwwuxAEJ
 iLIZeTHgmQ5ApUVcc2Ekeqo1e1cFH/C/NkVmyWQmfj34EP11gvPrP4rAGIdNCFzg1y
 oUfuoRwFy6Wng==
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Carl Vanderlip
 <quic_carlv@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>
Subject: QAIC reset failure
Date: Tue, 16 Jan 2024 18:58:30 +0200
Message-ID: <87ttndw6m6.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arm-msm@vger.kernel.org, Orr Mazor <orrm@neureality.ai>,
 Ramon Fried <ramon@neureality.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi qaic driver maintainers,

I am testing an A100 device on arm64 platform. Kernel version is current
Linus master as of commit 052d534373b7. The driver is unable to reset
the device properly.

[  137.706765] pci 0000:01:00.0: enabling device (0000 -> 0002)
[  137.712528] pci 0000:02:00.0: enabling device (0000 -> 0002)
[  137.718230] qaic 0000:03:00.0: enabling device (0000 -> 0002)
[  137.725720] [drm] Initialized qaic 0.0.0 20190618 for 0000:03:00.0 on minor 0
[  137.734326] mhi mhi0: Requested to power ON
[  137.738520] mhi mhi0: Power on setup success
[  137.855108] mhi mhi0: Wait for device to enter SBL or Mission mode
[  137.861578] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
[  137.870733] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
[  137.879063] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
[  137.887334] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
[  137.894866] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
[  137.904006] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
[  137.912263] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
[  137.920517] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
[  140.807091] mhi mhi0: Device failed to enter MHI Ready
[  143.695094] mhi mhi0: Device failed to enter MHI Ready

This is with firmware from SDK version 1.12.2.0. I tried also version
1.10.0.193 with similar results.

Some more state information from MHI debugfs below.

/sys/kernel/debug/mhi/mhi0/regdump:
Host PM state: SYS ERROR Process Device state: RESET EE: DISABLE
Device EE: PRIMARY BOOTLOADER state: SYS ERROR
MHI_REGLEN: 0x100
MHI_VER: 0x1000000
MHI_CFG: 0x8000000
MHI_CTRL: 0x0
MHI_STATUS: 0xff04
MHI_WAKE_DB: 0x1
BHI_EXECENV: 0x0
BHI_STATUS: 0xa93f0935
BHI_ERRCODE: 0x0
BHI_ERRDBG1: 0xc0300000
BHI_ERRDBG2: 0xb
BHI_ERRDBG3: 0xcabb0

/sys/kernel/debug/mhi/mhi0/states:
PM state: SYS ERROR Process Device: Inactive MHI state: RESET EE: DISABLE wake: true
M0: 2 M2: 0 M3: 0 device wake: 0 pending packets: 0

Any idea?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
