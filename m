Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17AF7D7B27
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 05:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1110E743;
	Thu, 26 Oct 2023 03:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 26 Oct 2023 03:07:29 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2DE10E743
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 03:07:29 +0000 (UTC)
X-UUID: 481f77edae6f497cb21b70ea84cbe3e5-20231026
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:6b262220-f460-431a-acea-bc1b81d06392, IP:5,
 U
 RL:-32768,TC:0,Content:0,EDM:-30,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ha
 m,ACTION:release,TS:-40
X-CID-INFO: VERSION:1.1.32, REQID:6b262220-f460-431a-acea-bc1b81d06392, IP:5,
 URL
 :-32768,TC:0,Content:0,EDM:-30,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,
 ACTION:release,TS:-40
X-CID-META: VersionHash:5f78ec9, CLOUDID:9bd954d7-04a0-4e50-8742-3543eab8cb8e,
 B
 ulkID:231026110216IKV1SZ4E,BulkQuantity:0,Recheck:0,SF:66|24|17|19|44,TC:n
 il,Content:0,EDM:2,IP:-2,URL:nil,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 481f77edae6f497cb21b70ea84cbe3e5-20231026
X-User: oushixiong@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1144456334; Thu, 26 Oct 2023 11:02:15 +0800
From: oushixiong <oushixiong@kylinos.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/atomic-helper: Call stall_checks() before allocate
 drm_crtc_commit
Date: Thu, 26 Oct 2023 11:02:13 +0800
Message-Id: <20231026030213.115505-1-oushixiong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Shixiong Ou <oushixiong@kylinos.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shixiong Ou <oushixiong@kylinos.cn>

It is wrong to call stall_checks() after allocating memory
for struct drm_crtc_commit as it will cause memory leaks if
too many nonblock commit works return -EBUSY.
So it needs to call stall_checks() before allocate drm_crtc_commit.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2444fc33dd7c..94ea878b240d 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2283,6 +2283,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 	funcs = state->dev->mode_config.helper_private;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		ret = stall_checks(crtc, nonblock);
+		if (ret)
+			return ret;
+
 		commit = kzalloc(sizeof(*commit), GFP_KERNEL);
 		if (!commit)
 			return -ENOMEM;
@@ -2291,10 +2295,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 
 		new_crtc_state->commit = commit;
 
-		ret = stall_checks(crtc, nonblock);
-		if (ret)
-			return ret;
-
 		/*
 		 * Drivers only send out events when at least either current or
 		 * new CRTC state is active. Complete right away if everything
-- 
2.25.1

