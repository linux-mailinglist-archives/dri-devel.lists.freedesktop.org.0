Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE5A3ABC4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 23:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487E10E13C;
	Tue, 18 Feb 2025 22:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WfBirGDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FADA10E131;
 Tue, 18 Feb 2025 22:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PZJN69dTbzUpr9g2692pepdc2Y56+VhBGXt64maR1Kc=; b=WfBirGDW+Ngw1BulF82h+Oi9s1
 kh8WeokoIhRE6qsnxIciBIcgTz/Bq2ySkBKZrgQmbUMgslLtVCzDGCShm3HaZKv7qoiiLZJPZmbCc
 xO1m+1Glr+rb/0lP5QjjwArnz0jDncOfUmPh7ZkJrpv2L0R1cAq/TtdUuyquXlgjTVW95wJqej9Tk
 UFAU3Gxvh3iAElTXxz6hdwgWgwiTTagc4Hw9pWnO1zSyP/HlPznIE9EVHYBKkGexawGK4pcGXf/bf
 sAOLWJTCFAi8Otg7FRXyiSgnHKlJj1hQ6Sx2866MGeLPTHxgb5rXTdsVAij175d/lSMqpTFV0/vCh
 rDKiuPKw==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tkWCr-00C9Fy-Kd; Tue, 18 Feb 2025 23:36:52 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [RFC PATCH] drm/amd/display: fix page fault on dpms off with MST
Date: Tue, 18 Feb 2025 19:28:58 -0300
Message-ID: <20250218223643.214942-1-mwen@igalia.com>
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

A page fault occurs when running the IGT test:
amdgpu@amd_vrr_range@freesync-parsing-suspend with MST. Fix that by
skipping handling a stream state when stream is NULL when setting DPMS
off.

[  +7.435304] [drm] DM_MST: stopping TM on aconnector: 00000000951db0f4 [id: 101]
[  +0.535828] BUG: unable to handle page fault for address: 0000000000006458
[  +0.000017] #PF: supervisor read access in kernel mode
[  +0.000007] #PF: error_code(0x0000) - not-present page
[  +0.000007] PGD 0 P4D 0 
[  +0.000011] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[  +0.000011] CPU: 6 UID: 0 PID: 365 Comm: kworker/6:1H Not tainted 6.12.12-amd64 #1  Debian 6.12.12-1
[  +0.000010] Hardware name: HP HP ENVY x360 Convertible 13-ay1xxx/8929, BIOS F.01 07/14/2021
[  +0.000006] Workqueue: events_highpri dm_irq_work_func [amdgpu]
[  +0.000379] RIP: 0010:dc_stream_get_status+0x9/0x30 [amdgpu]
[  +0.000258] Code: 00 00 01 00 00 00 48 89 d8 5b e9 2d 5a ac ca 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 <48> 8b 87 58 64 00 00 48 89 fe 48 8b 00 48 8b b8 78 05 00 00 e9 0e
[  +0.000003] RSP: 0018:ffffbb7f40853a68 EFLAGS: 00010246
[  +0.000005] RAX: 0000000000000000 RBX: ffff91c08e9c0000 RCX: 0000000000000000
[  +0.000002] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  +0.000003] RBP: 0000000000000000 R08: ffffbb7f40853c28 R09: ffff91c08e9c0000
[  +0.000002] R10: 0000000000000004 R11: 0000000000000000 R12: 0000000000000000
[  +0.000003] R13: 0000000000000000 R14: ffff91c05cc00000 R15: ffffbb7f40853c28
[  +0.000003] FS:  0000000000000000(0000) GS:ffff91c33e500000(0000) knlGS:0000000000000000
[  +0.000003] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000002] CR2: 0000000000006458 CR3: 000000012e622000 CR4: 0000000000f50ef0
[  +0.000003] PKRU: 55555554
[  +0.000003] Call Trace:
[  +0.000005]  <TASK>
[  +0.000006]  ? __die_body.cold+0x19/0x27
[  +0.000007]  ? page_fault_oops+0x15a/0x2d0
[  +0.000009]  ? exc_page_fault+0x7e/0x180
[  +0.000006]  ? asm_exc_page_fault+0x26/0x30
[  +0.000010]  ? dc_stream_get_status+0x9/0x30 [amdgpu]
[  +0.000243]  ? srso_alias_return_thunk+0x5/0xfbef5
[  +0.000004]  update_planes_and_stream_v1+0x9f/0x4c0 [amdgpu]
[  +0.000254]  dc_commit_updates_for_stream+0x7a/0x100 [amdgpu]
[  +0.000242]  ? link_get_master_pipes_with_dpms_on+0x38/0x80 [amdgpu]
[  +0.000297]  link_set_all_streams_dpms_off_for_link+0xc5/0x110 [amdgpu]
[  +0.000304]  link_detect+0x3f9/0x4e0 [amdgpu]
[  +0.000296]  handle_hpd_rx_irq+0x1c0/0x2e0 [amdgpu]
[  +0.000292]  process_one_work+0x177/0x330
[  +0.000007]  worker_thread+0x252/0x390
[  +0.000005]  ? __pfx_worker_thread+0x10/0x10
[  +0.000004]  kthread+0xd2/0x100
[  +0.000004]  ? __pfx_kthread+0x10/0x10
[  +0.000004]  ret_from_fork+0x34/0x50
[  +0.000006]  ? __pfx_kthread+0x10/0x10
[  +0.000003]  ret_from_fork_asm+0x1a/0x30
[  +0.000009]  </TASK>

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

I found this issue by accident when testing some changes to improve
`drm_edid` usage in the driver. It's not related to any `drm_edid` code
because it happens in kernel 6.12.12 that doesn't have any `drm_edid`
code, and current asdn. I'm running the
amdgpu@amd_vrr_range@freesync-parsing-suspend in a Cezanne laptop with a
dock station where HDMI and DP cables are plugged and active. I'm not
sure if it's expected that stream is NULL at this point or something is
missing in the MST code. The page fault doesn't happen when MST isn't
enabled.

Any thoughts?

Melissa


 drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index ec7de9c01fab..98644e86275c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -161,6 +161,9 @@ void link_set_all_streams_dpms_off_for_link(struct dc_link *link)
 	link_get_master_pipes_with_dpms_on(link, state, &count, pipes);
 
 	for (i = 0; i < count; i++) {
+		if (!pipes[i]->stream)
+			continue;
+
 		stream_update.stream = pipes[i]->stream;
 		dc_commit_updates_for_stream(link->ctx->dc, NULL, 0,
 				pipes[i]->stream, &stream_update,
-- 
2.47.2

