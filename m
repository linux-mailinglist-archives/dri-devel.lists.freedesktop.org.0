Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B814F1C0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 19:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18BD6FBAC;
	Fri, 31 Jan 2020 18:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F896FBAC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 18:00:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206351] RX 5600 XT Not Correctly Recognized, Max Memory
 Frequency Below Where it Should Be
Date: Fri, 31 Jan 2020 18:00:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206351-2300-wgPXT93MW1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206351-2300@https.bugzilla.kernel.org/>
References: <bug-206351-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=206351

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
We expose the actual memory controller clock rate in Linux, not the effective
memory clock of the DRAMs.  To translate it, it follows the following formula:

Clock conversion (Mhz):
HBM: effective_memory_clock = memory_controller_clock * 1
G5:  effective_memory_clock = memory_controller_clock * 1
G6:  effective_memory_clock = memory_controller_clock * 2

DRAM data rate (MT/s):
HBM: effective_memory_clock * 2 = data_rate
G5:  effective_memory_clock * 4 = data_rate
G6:  effective_memory_clock * 8 = data_rate

Bandwidth (MB/s):
data_rate * vram_bit_width / 8 = memory_bandwidth

Some examples:
G5 on RX460:
memory_controller_clock = 1750 Mhz
effective_memory_clock = 1750 Mhz * 1 = 1750 Mhz
data rate = 1750 * 4 = 7000 MT/s
memory_bandwidth = 7000 * 128 bits / 8 = 112000 MB/s

G6 on RX5600:
memory_controller_clock = 900 Mhz
effective_memory_clock = 900 Mhz * 2 = 1800 Mhz
data rate = 1800 * 8 = 14400 MT/s
memory_bandwidth = 14400 * 192 bits / 8 = 345600 MB/s

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
