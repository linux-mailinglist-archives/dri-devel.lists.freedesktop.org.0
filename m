Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD83164C52
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80206E849;
	Wed, 19 Feb 2020 17:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5325D6E83F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:43:11 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id p78so1428918ilb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IzyYw7B/gnmIiB8zBgCiB2Gye+qMEp8YKV0TJCS5+hg=;
 b=F/hABZcd0qPX7fTkWV56QcOC9FPPjKmFYJxDk0XYJXUVCyTP6/V4MpaQ47ii0GRgjO
 4S9GjZHqh4AeEzq3w47QIsiPwxG6azMNHn8sKHfwEWqQyhsnZBq0/Pk8bAZeLi5fitx8
 c+8prxe6MwoCVnQLm0ekg7g4tEUMKOHQZauhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzyYw7B/gnmIiB8zBgCiB2Gye+qMEp8YKV0TJCS5+hg=;
 b=QgSOe14WDQGJwoY1DMHUrLRaCS1acwRJi+iU8RzTdojA8iFKR/oaWXoJony7lGuRGW
 VEmJmd6+CXcY6OTsC2kiJq8Vqa5md4JliX4iAP4Yhgcum0XUt1b836blccutTzMU3tIk
 8PFph2m2ihg16ofUGe+CNQDFeHnQDlQfKowGFLK1ydmSGpri2fF7PEb2BFa70auojx5K
 Ig8b6jR7hZYdPp34CieWTUTApVxjBhUizH5puwbtvKam3IryDBfo1upru3qdUnb1GadJ
 c2EmdyS6Ze+96r3mvie2lYOrLnTdnuRC8qIBW1ONLCesERajd60zHMSchOLeuI2Ejrfb
 D0Pg==
X-Gm-Message-State: APjAAAW+ezv7l3EggwsjyTmnnpIaJzADhkHkmyGugHL8OF81x3AjAm4q
 Eyqoefcq+bAYNIEhW8xdzaEZsrblFv0=
X-Google-Smtp-Source: APXvYqzthAMDzr5smPDrx1dpnJ413pLiDkLKKDjmBc3Nbhrrt2gKclr4BD/f1dBzCWuuLp/uCACndQ==
X-Received: by 2002:a05:6e02:8e2:: with SMTP id
 n2mr26249882ilt.167.1582134190104; 
 Wed, 19 Feb 2020 09:43:10 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id a21sm60355ioh.29.2020.02.19.09.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:43:09 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm/dpu: Refactor rm iterator
Date: Wed, 19 Feb 2020 10:42:25 -0700
Message-Id: <20200219104148.2.I2c848e8f8ab1bcd4042d8ebcf35de737cceec5fe@changeid>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
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
Cc: freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 Shubhashree Dhar <dhar@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 zhengbin <zhengbin13@huawei.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make iterator implementation private, and add function to
query resources assigned to an encoder.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 59 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 10 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 10 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 31 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 47 ++-------------
 5 files changed, 76 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f8ac3bf60fd60..6cadeff456f09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -957,11 +957,11 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct drm_connector *conn = NULL, *conn_iter;
 	struct drm_crtc *drm_crtc;
 	struct dpu_crtc_state *cstate;
-	struct dpu_rm_hw_iter hw_iter;
 	struct msm_display_topology topology;
-	struct dpu_hw_ctl *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
-	struct dpu_hw_mixer *hw_lm[MAX_CHANNELS_PER_ENC] = { NULL };
-	int num_lm = 0, num_ctl = 0;
+	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_pp;
 	int i, j, ret;
 
 	if (!drm_enc) {
@@ -1005,42 +1005,31 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		return;
 	}
 
-	dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_PINGPONG);
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
-		dpu_enc->hw_pp[i] = NULL;
-		if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
-			break;
-		dpu_enc->hw_pp[i] = (struct dpu_hw_pingpong *) hw_iter.hw;
-	}
-
-	dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_CTL);
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
-		if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
-			break;
-		hw_ctl[i] = (struct dpu_hw_ctl *)hw_iter.hw;
-		num_ctl++;
-	}
+	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
+		DPU_HW_BLK_PINGPONG, hw_pp, ARRAY_SIZE(hw_pp));
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
+		DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
+		DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 
-	dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_LM);
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
-		if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
-			break;
-		hw_lm[i] = (struct dpu_hw_mixer *)hw_iter.hw;
-		num_lm++;
-	}
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
+						: NULL;
 
 	cstate = to_dpu_crtc_state(drm_crtc->state);
 
 	for (i = 0; i < num_lm; i++) {
 		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
 
-		cstate->mixers[i].hw_lm = hw_lm[i];
-		cstate->mixers[i].lm_ctl = hw_ctl[ctl_idx];
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
 	}
 
 	cstate->num_mixers = num_lm;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		int num_blk;
+		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
 		if (!dpu_enc->hw_pp[i]) {
@@ -1056,17 +1045,15 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		}
 
 		phys->hw_pp = dpu_enc->hw_pp[i];
-		phys->hw_ctl = hw_ctl[i];
+		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
-		dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id,
-				    DPU_HW_BLK_INTF);
-		for (j = 0; j < MAX_CHANNELS_PER_ENC; j++) {
+		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
+			drm_enc->base.id, DPU_HW_BLK_INTF, hw_blk,
+			ARRAY_SIZE(hw_blk));
+		for (j = 0; j < num_blk; j++) {
 			struct dpu_hw_intf *hw_intf;
 
-			if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
-				break;
-
-			hw_intf = (struct dpu_hw_intf *)hw_iter.hw;
+			hw_intf = to_dpu_hw_intf(hw_blk[i]);
 			if (hw_intf->idx == phys->intf_idx)
 				phys->hw_intf = hw_intf;
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 85468981632de..0ead64d3f63d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -89,6 +89,16 @@ struct dpu_hw_intf {
 	struct dpu_hw_intf_ops ops;
 };
 
+/**
+ * to_dpu_hw_intf - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_intf *to_dpu_hw_intf(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_intf, base);
+}
+
 /**
  * dpu_hw_intf_init(): Initializes the intf driver for the passed
  * interface idx.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 3d6f46b1db308..d73cb73e938b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -96,6 +96,16 @@ struct dpu_hw_pingpong {
 	struct dpu_hw_pingpong_ops ops;
 };
 
+/**
+ * to_dpu_hw_pingpong - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_pingpong, base);
+}
+
 /**
  * dpu_hw_pingpong_init - initializes the pingpong driver for the passed
  *	pingpong idx.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index dea1dba441fe7..779df26dc81ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -40,7 +40,21 @@ struct dpu_rm_hw_blk {
 	struct dpu_hw_blk *hw;
 };
 
-void dpu_rm_init_hw_iter(
+/**
+ * struct dpu_rm_hw_iter - iterator for use with dpu_rm
+ * @hw: dpu_hw object requested, or NULL on failure
+ * @blk: dpu_rm internal block representation. Clients ignore. Used as iterator.
+ * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder
+ * @type: Hardware Block Type client wishes to search for.
+ */
+struct dpu_rm_hw_iter {
+	void *hw;
+	struct dpu_rm_hw_blk *blk;
+	uint32_t enc_id;
+	enum dpu_hw_blk_type type;
+};
+
+static void dpu_rm_init_hw_iter(
 		struct dpu_rm_hw_iter *iter,
 		uint32_t enc_id,
 		enum dpu_hw_blk_type type)
@@ -83,7 +97,7 @@ static bool _dpu_rm_get_hw_locked(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
 	return false;
 }
 
-bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
+static bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
 {
 	bool ret;
 
@@ -635,3 +649,16 @@ int dpu_rm_reserve(
 
 	return ret;
 }
+
+int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
+	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
+{
+	struct dpu_rm_hw_iter hw_iter;
+	int num_blks = 0;
+
+	dpu_rm_init_hw_iter(&hw_iter, enc_id, type);
+	while (num_blks < blks_size && dpu_rm_get_hw(rm, &hw_iter))
+		blks[num_blks++] = hw_iter.blk->hw;
+
+	return num_blks;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 9c580a0170946..982b91e272275 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -24,26 +24,6 @@ struct dpu_rm {
 	struct mutex rm_lock;
 };
 
-/**
- *  struct dpu_rm_hw_blk - resource manager internal structure
- *	forward declaration for single iterator definition without void pointer
- */
-struct dpu_rm_hw_blk;
-
-/**
- * struct dpu_rm_hw_iter - iterator for use with dpu_rm
- * @hw: dpu_hw object requested, or NULL on failure
- * @blk: dpu_rm internal block representation. Clients ignore. Used as iterator.
- * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder
- * @type: Hardware Block Type client wishes to search for.
- */
-struct dpu_rm_hw_iter {
-	void *hw;
-	struct dpu_rm_hw_blk *blk;
-	uint32_t enc_id;
-	enum dpu_hw_blk_type type;
-};
-
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
@@ -93,28 +73,9 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc);
 
 /**
- * dpu_rm_init_hw_iter - setup given iterator for new iteration over hw list
- *	using dpu_rm_get_hw
- * @iter: iter object to initialize
- * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder
- * @type: Hardware Block Type client wishes to search for.
+ * Get hw resources of the given type that are assigned to this encoder.
  */
-void dpu_rm_init_hw_iter(
-		struct dpu_rm_hw_iter *iter,
-		uint32_t enc_id,
-		enum dpu_hw_blk_type type);
-/**
- * dpu_rm_get_hw - retrieve reserved hw object given encoder and hw type
- *	Meant to do a single pass through the hardware list to iteratively
- *	retrieve hardware blocks of a given type for a given encoder.
- *	Initialize an iterator object.
- *	Set hw block type of interest. Set encoder id of interest, 0 for any.
- *	Function returns first hw of type for that encoder.
- *	Subsequent calls will return the next reserved hw of that type in-order.
- *	Iterator HW pointer will be null on failure to find hw.
- * @rm: DPU Resource Manager handle
- * @iter: iterator object
- * @Return: true on match found, false on no match found
- */
-bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *iter);
+int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
+	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 #endif /* __DPU_RM_H__ */
+
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
