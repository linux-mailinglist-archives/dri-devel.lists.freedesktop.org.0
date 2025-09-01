Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87880B3F0A2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 23:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274CD10E52C;
	Mon,  1 Sep 2025 21:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r/ZIL6Gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609A410E0B0;
 Mon,  1 Sep 2025 21:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KrzNv9NALera0+8aa8w+zcyEmYmMJIPmHFBIQRrXJWk=; b=r/ZIL6Gmv/GRKO6eKJbnzMza4o
 3QYEK4hLpl3ggjpIyptwvGyv4Qr0KsiBAHqHP2Tz8IP4csv/ZTCTnMUzarhqFtjF55ykvsweToUix
 nxtMfaSHUIhxsRW0VgvqqB27x9tTdbkGRzxTweNdMtkxpXGoaCF4FDidhVRFLr4sfxPByTMDTWvD0
 26p39JMt3qBFFIl9JL0m3KwLtulCPsph48iAHcYrYCwSDRTqrV4sjbRVIDfDDP313Q0LFf0IatgaU
 4zp6oQjQHY5aX95rrCDbYFhACfC3pB3F4ddJtgv2GDR7b7qE/xmGJRkwLRzOkaOWKbyY5Dno/NXZa
 S9LX0oGA==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utCK4-005Rmr-RF; Mon, 01 Sep 2025 23:44:21 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, sunpeng.li@amd.com
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Christopher Snowhill <kode54@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v2 0/2] drm/amd/display: don't overwrite regamma LUT with
 empty data
Date: Mon,  1 Sep 2025 18:33:15 -0300
Message-ID: <20250901214413.12675-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Xaver first reported flickering when changing GAMMA_LUT often in KDE
with an HDR-enabled display:
https://gitlab.freedesktop.org/drm/amd/-/issues/4444

This issue is reproducible on Fedora 42 from [1], with integrated and/or
external monitors. I was able to reproduce it on DCN3.01,  but other
users also reported similar issue with DCN3 and DCN4 families. Besides
that, when setting Night Light mode and changing a Display setting, such
as Overscan, colors on the screen look like gamma LUT was lost (and it
was).

After further investigation, the root cause of all these problems
appears to be the way DM updates the DC stream's color state at
`atomic_check`, allowing test-only commit settings to override
non-blocking commit settings before it is committed in `commit_tail`.
Xaver explained that KWin always performs a test commit without the LUT,
then another with the LUT, and finally a non-test-only commit with the
same LUT value still set. This sequence makes the issue more likely to
occur, as the commit_tail of a non-blocking commit can delay until a
subsequent test-only commit without the LUT "removes" the gamma LUT set
by the non-blocking commit at `atomic_check` from the DC stream's state.

I first tried to address this issue by only programming output transfer
func if and only if out_tf flag is set (v1 [2]), but this approach
doesn't solve all problems, it only addressed the gamma LUT loss in the
case of Night Light mode + Display settings change. Therefore, this
version targets the same problem but with a completly different
approach.

This series resolves all reported issues by moving DC stream color
changes from `atomic_check` to `atomic_setup_commit`, preventing
test-only commit CRTC color properties from being programmed into
`commit_tail`. I see this change in line with the kernel-doc on
amdgpu_dm_atomic_check(), which says: "It is important not to modify the
existing DC state.  Otherwise, atomic_check may unexpectedly commit
hardware changes."

Adding here a shortened trace that exemplifies this bad sequence with
some custom printk to track color settings in `drm_atomic_state`:

[  +0.000046] DRM: non block commit call: begin
[  +0.000003] amdgpu 0000:04:00.0: [drm:drm_atomic_check_only [drm]] checking 00000000183d1556 <-- non-blocking commit
[  +0.000053] amdgpu: AMD DM: atomic_check: CHECK color mgmt: color change: 1, AMD regamma Tf update: 0, needs modeset: 0 for drm_atomic_state: 00000000183d1556
[  +0.000005] amdgpu: program atomic regamma? 1 for drm_atomic_state: 00000000183d1556
[  +0.000003] amdgpu: AMD DM: set_atomic_regamma: PROGRAM regamma
[  +0.000699] amdgpu 0000:04:00.0: [drm:drm_atomic_nonblocking_commit [drm]] committing 00000000183d1556 nonblocking
[  +0.000076] DRM: non block commit call: end
[  +0.000002] amdgpu 0000:04:00.0: [drm:drm_atomic_get_connector_state [drm]] Added [CONNECTOR:93:eDP-1] 00000000c74c75cc state to 00000000bce01e59 <-- test-only commit
[[  +0.000046] amdgpu 0000:04:00.0: [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:79:crtc-0] 000000004fe38ea2 state to 00000000bce01e59
[  +0.000048] amdgpu 0000:04:00.0: [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:76:plane-6] 00000000a3ba0680 state to 00000000bce01e59
[  -0.000252] amdgpu 0000:04:00.0: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] amdgpu_crtc id:0 crtc_state_flags: enable:1, active:1, planes_changed:1, mode_changed:0,active_changed:0,connectors_changed:0
[  +0.000045] amdgpu 0000:04:00.0: [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:58:plane-3] 0000000007ae0fe5 state to 00000000bce01e59
[  +0.000073] DRM: color mgmt changed for DEGAMMA? 0
[  +0.000054] DRM: color mgmt changed for CTM? 0
[  +0.000314] DRM: color mgmt changed for REGAMMA? 1
[  +0.000004] DRM: TEST ONLY call: begin
[  +0.000003] amdgpu 0000:04:00.0: [drm:drm_atomic_check_only [drm]] checking 00000000bce01e59 <-- test-only commit
[  +0.000055] amdgpu: AMD DM: atomic check: CHECK color mgmt: color change: 1, AMD regamma Tf update: 0, needs modeset: 0 for drm_atomic_state: 00000000bce01e59
[  +0.000005] amdgpu: program atomic regamma? 0 for drm_atomic_state 00000000bce01e59
[  +0.000003] amdgpu: AMD DM: set atomic regamma: REMOVE regamma
[  +0.000247] amdgpu 0000:04:00.0: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] [HDCP_DM] pipe_ctx dispname=ANX7530 U
[  +0.000441] amdgpu 0000:04:00.0: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] crtc:0, pflip_stat:AMDGPU_FLIP_SUBMITTED
[  +0.000731] amdgpu: AMD DM: commit planes: color mgmt changed, out tf type: 2 for drm_atomic_commit 00000000183d1556 <-- non-blocking commit taking out TF = BYPASS
[  +0.000570] DC: set_output_transfer_func? enable: 0, out_tf:1
[  +0.000005] DC: set_output_transfer_func: begin
[  +0.000004] DC: set_output_transfer_func: configure output gamma: 2 <-- BYPASS
[  +0.000004] DC: set_output_gamma: begin
[  +0.000002] DC: set_output_gamma: DISABLE OGAM
[  +0.000107] amdgpu 0000:04:00.0: [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state 00000000183d1556
[  +0.000053] DRM: TEST ONLY call: end
[  +0.000008] amdgpu 0000:04:00.0: [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state 00000000bce01e59
[  +0.000012] amdgpu 0000:04:00.0: [drm:__drm_atomic_state_free [drm]] Freeing atomic state 00000000bce01e59
[  +0.000085] amdgpu 0000:04:00.0: [drm:__drm_atomic_state_free [drm]] Freeing atomic state 00000000183d1556

I hope this trace can illustrate the situation.
 
[1] https://bodhi.fedoraproject.org/updates/FEDORA-2025-b58c14c454

[2] https://lore.kernel.org/amd-gfx/20250822211552.1472375-1-mwen@igalia.com/

PS: maybe we should do a follow-up refactor in the
amdgpu_dm_atomic_check() and move other DC state changes from
`atomic_check` to `atomic_setup_commit`.

Best Regards,

Melissa

Melissa Wen (2):
  drm/amd/display: update color on atomic commit time
  drm/amd/display: change dc stream color settings only in atomic commit

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  38 ++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 105 +++++++++++++++++-
 3 files changed, 139 insertions(+), 5 deletions(-)

-- 
2.47.2

