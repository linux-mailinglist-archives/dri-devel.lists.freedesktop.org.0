Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D3164C54
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3EF6EC5A;
	Wed, 19 Feb 2020 17:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4C16E849
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:43:12 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id h8so1513961iob.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+mwmVZpHHv6ErN+IN9HcD1iU1ojAAuKQ5EpxfPcQ/U=;
 b=I4J/FtPkKoK7vOTjtT7HNr7ZH71J0LZ5Nmi8aBpoDBqn45pteWndjHxbHRF2CIMAz1
 Peljw+2hFXe1xNa/mp+11bQ4O3HWTb7VT7usaCQdxNZgYoow1k/DYUUpy6sfV9UqoxQz
 jOgLkx+tse5+8p3B+OXw9oZTlZdsmwH0r7VsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+mwmVZpHHv6ErN+IN9HcD1iU1ojAAuKQ5EpxfPcQ/U=;
 b=JlBDbhnSFupgbrBCWUG9vMCzGUtjZFimAxK0ENuKhKhC2FYPD4G39Y2JIuOPY5XfzU
 2PGI3MyGvYALBaxTMi55LXIASoHUw94j84/PCkKmMjK0I23lw5OKeF2vTEBG7H7czrnO
 RBNDMr8CUqZIwILv4nVocYPWIioioMEBOH3maPjjNRwi+m2Qy1CAXkTCvRrlD9usqGaA
 MCZPHl3vpgpHeruNNPMWgNvJ7pV8jPz/ID0fGJ7fktVcCRLqSsE10vjfJUCbXqldJUhI
 5LdcQe0T1EfcSYKQBJ7Hq0wF9PETzayuUav9ivu+EODTsEyw8aZeMM+N853IMzMd1Pkm
 dWMQ==
X-Gm-Message-State: APjAAAVgDpDIIkNFcxljf2oonApJ1Bf8XoJzOLvaTojEdU6//7jsVH1k
 0wdPAIpzvDww+y9ijbjKG5E8WIplVvk=
X-Google-Smtp-Source: APXvYqwZjuFkNHgIcXl5KmZUb7DNcdAn9d4AOzRZ5ZoIRX8aF76C2pqlyJOWGW4icoMw2OX4oVtDJg==
X-Received: by 2002:a6b:fc02:: with SMTP id r2mr19698205ioh.183.1582134191326; 
 Wed, 19 Feb 2020 09:43:11 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id a21sm60355ioh.29.2020.02.19.09.43.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:43:10 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dpu: Refactor resource manager
Date: Wed, 19 Feb 2020 10:42:26 -0700
Message-Id: <20200219104148.3.I8c1f8bbe0cb01e69b5ee66ccf3aa1ee0c9c32bef@changeid>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 linux-arm-msm@vger.kernel.org, Drew Davenport <ddavenport@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Track hardware resource objects in arrays rather than
a list and remove the resource manager's iterator idiom. Separate
the mapping of hardware resources to an encoder ID into a different
array.

Use an implicit mapping between the hardware blocks' ids, which
are 1-based, and array indices in these arrays to replace iteration
with index lookups in several places.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 553 +++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  22 +-
 2 files changed, 255 insertions(+), 320 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 779df26dc81ae..f1483b00b7423 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -12,8 +12,12 @@
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
 
-#define RESERVED_BY_OTHER(h, r)  \
-		((h)->enc_id && (h)->enc_id != r)
+
+static inline bool reserved_by_other(uint32_t *res_map, int idx,
+				     uint32_t enc_id)
+{
+	return res_map[idx] && res_map[idx] != enc_id;
+}
 
 /**
  * struct dpu_rm_requirements - Reservation requirements parameter bundle
@@ -25,126 +29,40 @@ struct dpu_rm_requirements {
 	struct dpu_encoder_hw_resources hw_res;
 };
 
-
-/**
- * struct dpu_rm_hw_blk - hardware block tracking list member
- * @list:	List head for list of all hardware blocks tracking items
- * @id:		Hardware ID number, within it's own space, ie. LM_X
- * @enc_id:	Encoder id to which this blk is binded
- * @hw:		Pointer to the hardware register access object for this block
- */
-struct dpu_rm_hw_blk {
-	struct list_head list;
-	uint32_t id;
-	uint32_t enc_id;
-	struct dpu_hw_blk *hw;
-};
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
-static void dpu_rm_init_hw_iter(
-		struct dpu_rm_hw_iter *iter,
-		uint32_t enc_id,
-		enum dpu_hw_blk_type type)
-{
-	memset(iter, 0, sizeof(*iter));
-	iter->enc_id = enc_id;
-	iter->type = type;
-}
-
-static bool _dpu_rm_get_hw_locked(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
+int dpu_rm_destroy(struct dpu_rm *rm)
 {
-	struct list_head *blk_list;
+	int i;
 
-	if (!rm || !i || i->type >= DPU_HW_BLK_MAX) {
-		DPU_ERROR("invalid rm\n");
-		return false;
-	}
+	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
+		struct dpu_hw_pingpong *hw;
 
-	i->hw = NULL;
-	blk_list = &rm->hw_blks[i->type];
-
-	if (i->blk && (&i->blk->list == blk_list)) {
-		DPU_DEBUG("attempt resume iteration past last\n");
-		return false;
+		if (rm->pingpong_blks[i]) {
+			hw = to_dpu_hw_pingpong(rm->pingpong_blks[i]);
+			dpu_hw_pingpong_destroy(hw);
+		}
 	}
+	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
+		struct dpu_hw_mixer *hw;
 
-	i->blk = list_prepare_entry(i->blk, blk_list, list);
-
-	list_for_each_entry_continue(i->blk, blk_list, list) {
-		if (i->enc_id == i->blk->enc_id) {
-			i->hw = i->blk->hw;
-			DPU_DEBUG("found type %d id %d for enc %d\n",
-					i->type, i->blk->id, i->enc_id);
-			return true;
+		if (rm->mixer_blks[i]) {
+			hw = to_dpu_hw_mixer(rm->mixer_blks[i]);
+			dpu_hw_lm_destroy(hw);
 		}
 	}
+	for (i = 0; i < ARRAY_SIZE(rm->ctl_blks); i++) {
+		struct dpu_hw_ctl *hw;
 
-	DPU_DEBUG("no match, type %d for enc %d\n", i->type, i->enc_id);
-
-	return false;
-}
-
-static bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
-{
-	bool ret;
-
-	mutex_lock(&rm->rm_lock);
-	ret = _dpu_rm_get_hw_locked(rm, i);
-	mutex_unlock(&rm->rm_lock);
-
-	return ret;
-}
-
-static void _dpu_rm_hw_destroy(enum dpu_hw_blk_type type, void *hw)
-{
-	switch (type) {
-	case DPU_HW_BLK_LM:
-		dpu_hw_lm_destroy(hw);
-		break;
-	case DPU_HW_BLK_CTL:
-		dpu_hw_ctl_destroy(hw);
-		break;
-	case DPU_HW_BLK_PINGPONG:
-		dpu_hw_pingpong_destroy(hw);
-		break;
-	case DPU_HW_BLK_INTF:
-		dpu_hw_intf_destroy(hw);
-		break;
-	case DPU_HW_BLK_SSPP:
-		/* SSPPs are not managed by the resource manager */
-	case DPU_HW_BLK_TOP:
-		/* Top is a singleton, not managed in hw_blks list */
-	case DPU_HW_BLK_MAX:
-	default:
-		DPU_ERROR("unsupported block type %d\n", type);
-		break;
+		if (rm->ctl_blks[i]) {
+			hw = to_dpu_hw_ctl(rm->ctl_blks[i]);
+			dpu_hw_ctl_destroy(hw);
+		}
 	}
-}
+	for (i = 0; i < ARRAY_SIZE(rm->intf_blks); i++) {
+		struct dpu_hw_intf *hw;
 
-int dpu_rm_destroy(struct dpu_rm *rm)
-{
-	struct dpu_rm_hw_blk *hw_cur, *hw_nxt;
-	enum dpu_hw_blk_type type;
-
-	for (type = 0; type < DPU_HW_BLK_MAX; type++) {
-		list_for_each_entry_safe(hw_cur, hw_nxt, &rm->hw_blks[type],
-				list) {
-			list_del(&hw_cur->list);
-			_dpu_rm_hw_destroy(type, hw_cur->hw);
-			kfree(hw_cur);
+		if (rm->intf_blks[i]) {
+			hw = to_dpu_hw_intf(rm->intf_blks[i]);
+			dpu_hw_intf_destroy(hw);
 		}
 	}
 
@@ -153,65 +71,11 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 	return 0;
 }
 
-static int _dpu_rm_hw_blk_create(
-		struct dpu_rm *rm,
-		const struct dpu_mdss_cfg *cat,
-		void __iomem *mmio,
-		enum dpu_hw_blk_type type,
-		uint32_t id)
-{
-	struct dpu_rm_hw_blk *blk;
-	void *hw;
-
-	switch (type) {
-	case DPU_HW_BLK_LM:
-		hw = dpu_hw_lm_init(id, mmio, cat);
-		break;
-	case DPU_HW_BLK_CTL:
-		hw = dpu_hw_ctl_init(id, mmio, cat);
-		break;
-	case DPU_HW_BLK_PINGPONG:
-		hw = dpu_hw_pingpong_init(id, mmio, cat);
-		break;
-	case DPU_HW_BLK_INTF:
-		hw = dpu_hw_intf_init(id, mmio, cat);
-		break;
-	case DPU_HW_BLK_SSPP:
-		/* SSPPs are not managed by the resource manager */
-	case DPU_HW_BLK_TOP:
-		/* Top is a singleton, not managed in hw_blks list */
-	case DPU_HW_BLK_MAX:
-	default:
-		DPU_ERROR("unsupported block type %d\n", type);
-		return -EINVAL;
-	}
-
-	if (IS_ERR_OR_NULL(hw)) {
-		DPU_ERROR("failed hw object creation: type %d, err %ld\n",
-				type, PTR_ERR(hw));
-		return -EFAULT;
-	}
-
-	blk = kzalloc(sizeof(*blk), GFP_KERNEL);
-	if (!blk) {
-		_dpu_rm_hw_destroy(type, hw);
-		return -ENOMEM;
-	}
-
-	blk->id = id;
-	blk->hw = hw;
-	blk->enc_id = 0;
-	list_add_tail(&blk->list, &rm->hw_blks[type]);
-
-	return 0;
-}
-
 int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_mdss_cfg *cat,
 		void __iomem *mmio)
 {
 	int rc, i;
-	enum dpu_hw_blk_type type;
 
 	if (!rm || !cat || !mmio) {
 		DPU_ERROR("invalid kms\n");
@@ -223,11 +87,9 @@ int dpu_rm_init(struct dpu_rm *rm,
 
 	mutex_init(&rm->rm_lock);
 
-	for (type = 0; type < DPU_HW_BLK_MAX; type++)
-		INIT_LIST_HEAD(&rm->hw_blks[type]);
-
 	/* Interrogate HW catalog and create tracking items for hw blocks */
 	for (i = 0; i < cat->mixer_count; i++) {
+		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
 		if (lm->pingpong == PINGPONG_MAX) {
@@ -235,12 +97,17 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 
-		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_LM,
-				cat->mixer[i].id);
-		if (rc) {
-			DPU_ERROR("failed: lm hw not available\n");
+		if (lm->id < LM_0 || lm->id >= LM_MAX) {
+			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
+			continue;
+		}
+		hw = dpu_hw_lm_init(lm->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed lm object creation: err %ld\n", rc);
 			goto fail;
 		}
+		rm->mixer_blks[lm->id - LM_0] = &hw->base;
 
 		if (!rm->lm_max_width) {
 			rm->lm_max_width = lm->sblk->maxwidth;
@@ -256,35 +123,59 @@ int dpu_rm_init(struct dpu_rm *rm,
 	}
 
 	for (i = 0; i < cat->pingpong_count; i++) {
-		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_PINGPONG,
-				cat->pingpong[i].id);
-		if (rc) {
-			DPU_ERROR("failed: pp hw not available\n");
+		struct dpu_hw_pingpong *hw;
+		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
+
+		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
+			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
+			continue;
+		}
+		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed pingpong object creation: err %ld\n",
+				rc);
 			goto fail;
 		}
+		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
 	for (i = 0; i < cat->intf_count; i++) {
-		if (cat->intf[i].type == INTF_NONE) {
+		struct dpu_hw_intf *hw;
+		const struct dpu_intf_cfg *intf = &cat->intf[i];
+
+		if (intf->type == INTF_NONE) {
 			DPU_DEBUG("skip intf %d with type none\n", i);
 			continue;
 		}
-
-		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_INTF,
-				cat->intf[i].id);
-		if (rc) {
-			DPU_ERROR("failed: intf hw not available\n");
+		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
+			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
+			continue;
+		}
+		hw = dpu_hw_intf_init(intf->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed intf object creation: err %ld\n", rc);
 			goto fail;
 		}
+		rm->intf_blks[intf->id - INTF_0] = &hw->base;
 	}
 
 	for (i = 0; i < cat->ctl_count; i++) {
-		rc = _dpu_rm_hw_blk_create(rm, cat, mmio, DPU_HW_BLK_CTL,
-				cat->ctl[i].id);
-		if (rc) {
-			DPU_ERROR("failed: ctl hw not available\n");
+		struct dpu_hw_ctl *hw;
+		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
+
+		if (ctl->id < CTL_0 || ctl->id >= CTL_MAX) {
+			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
+			continue;
+		}
+		hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed ctl object creation: err %ld\n", rc);
 			goto fail;
 		}
+		rm->ctl_blks[ctl->id - CTL_0] = &hw->base;
 	}
 
 	return 0;
@@ -292,7 +183,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 fail:
 	dpu_rm_destroy(rm);
 
-	return rc;
+	return rc ? rc : -EFAULT;
 }
 
 static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
@@ -300,72 +191,69 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 	return top->num_intf > 1;
 }
 
+/**
+ * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
+ * @rm: dpu resource manager handle
+ * @primary_idx: index of primary mixer in rm->mixer_blks[]
+ * @peer_idx: index of other mixer in rm->mixer_blks[]
+ * @Return: true if rm->mixer_blks[peer_idx] is a peer of
+ *          rm->mixer_blks[primary_idx]
+ */
+static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
+		int peer_idx)
+{
+	const struct dpu_lm_cfg *prim_lm_cfg;
+	const struct dpu_lm_cfg *peer_cfg;
+
+	prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
+	peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
+
+	if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
+		DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
+				peer_cfg->id);
+		return false;
+	}
+	return true;
+}
+
 /**
  * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
  *	proposed use case requirements, incl. hardwired dependent blocks like
  *	pingpong
  * @rm: dpu resource manager handle
  * @enc_id: encoder id requesting for allocation
- * @lm: proposed layer mixer, function checks if lm, and all other hardwired
- *      blocks connected to the lm (pp) is available and appropriate
- * @pp: output parameter, pingpong block attached to the layer mixer.
- *      NULL if pp was not available, or not matching requirements.
- * @primary_lm: if non-null, this function check if lm is compatible primary_lm
- *              as well as satisfying all other requirements
+ * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
+ *      if lm, and all other hardwired blocks connected to the lm (pp) is
+ *      available and appropriate
+ * @pp_idx: output parameter, index of pingpong block attached to the layer
+ *      mixer in rm->pongpong_blks[].
  * @Return: true if lm matches all requirements, false otherwise
  */
-static bool _dpu_rm_check_lm_and_get_connected_blks(
-		struct dpu_rm *rm,
-		uint32_t enc_id,
-		struct dpu_rm_hw_blk *lm,
-		struct dpu_rm_hw_blk **pp,
-		struct dpu_rm_hw_blk *primary_lm)
+static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
+		uint32_t enc_id, int lm_idx, int *pp_idx)
 {
-	const struct dpu_lm_cfg *lm_cfg = to_dpu_hw_mixer(lm->hw)->cap;
-	struct dpu_rm_hw_iter iter;
-
-	*pp = NULL;
-
-	DPU_DEBUG("check lm %d pp %d\n",
-			   lm_cfg->id, lm_cfg->pingpong);
-
-	/* Check if this layer mixer is a peer of the proposed primary LM */
-	if (primary_lm) {
-		const struct dpu_lm_cfg *prim_lm_cfg =
-				to_dpu_hw_mixer(primary_lm->hw)->cap;
-
-		if (!test_bit(lm_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
-			DPU_DEBUG("lm %d not peer of lm %d\n", lm_cfg->id,
-					prim_lm_cfg->id);
-			return false;
-		}
-	}
+	const struct dpu_lm_cfg *lm_cfg;
+	int idx;
 
 	/* Already reserved? */
-	if (RESERVED_BY_OTHER(lm, enc_id)) {
-		DPU_DEBUG("lm %d already reserved\n", lm_cfg->id);
+	if (reserved_by_other(rm->mixer_to_enc_id, lm_idx, enc_id)) {
+		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
 		return false;
 	}
 
-	dpu_rm_init_hw_iter(&iter, 0, DPU_HW_BLK_PINGPONG);
-	while (_dpu_rm_get_hw_locked(rm, &iter)) {
-		if (iter.blk->id == lm_cfg->pingpong) {
-			*pp = iter.blk;
-			break;
-		}
-	}
-
-	if (!*pp) {
+	lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[lm_idx])->cap;
+	idx = lm_cfg->pingpong - PINGPONG_0;
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks)) {
 		DPU_ERROR("failed to get pp on lm %d\n", lm_cfg->pingpong);
 		return false;
 	}
 
-	if (RESERVED_BY_OTHER(*pp, enc_id)) {
-		DPU_DEBUG("lm %d pp %d already reserved\n", lm->id,
-				(*pp)->id);
+	if (reserved_by_other(rm->pingpong_to_enc_id, idx, enc_id)) {
+		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
+				lm_cfg->pingpong);
 		return false;
 	}
-
+	*pp_idx = idx;
 	return true;
 }
 
@@ -373,11 +261,9 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 			       struct dpu_rm_requirements *reqs)
 
 {
-	struct dpu_rm_hw_blk *lm[MAX_BLOCKS];
-	struct dpu_rm_hw_blk *pp[MAX_BLOCKS];
-	struct dpu_rm_hw_iter iter_i, iter_j;
-	int lm_count = 0;
-	int i, rc = 0;
+	int lm_idx[MAX_BLOCKS];
+	int pp_idx[MAX_BLOCKS];
+	int i, j, lm_count = 0;
 
 	if (!reqs->topology.num_lm) {
 		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
@@ -385,36 +271,39 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 	}
 
 	/* Find a primary mixer */
-	dpu_rm_init_hw_iter(&iter_i, 0, DPU_HW_BLK_LM);
-	while (lm_count != reqs->topology.num_lm &&
-			_dpu_rm_get_hw_locked(rm, &iter_i)) {
-		memset(&lm, 0, sizeof(lm));
-		memset(&pp, 0, sizeof(pp));
+	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
+			lm_count < reqs->topology.num_lm; i++) {
+		if (!rm->mixer_blks[i])
+			continue;
 
 		lm_count = 0;
-		lm[lm_count] = iter_i.blk;
+		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(
-				rm, enc_id, lm[lm_count],
-				&pp[lm_count], NULL))
+				rm, enc_id, i, &pp_idx[lm_count])) {
 			continue;
+		}
 
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		dpu_rm_init_hw_iter(&iter_j, 0, DPU_HW_BLK_LM);
+		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
+				lm_count < reqs->topology.num_lm; j++) {
+			if (!rm->mixer_blks[j])
+				continue;
 
-		while (lm_count != reqs->topology.num_lm &&
-				_dpu_rm_get_hw_locked(rm, &iter_j)) {
-			if (iter_i.blk == iter_j.blk)
+			if (!_dpu_rm_check_lm_peer(rm, i, j)) {
+				DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
+						LM_0 + i);
 				continue;
+			}
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(
-					rm, enc_id, iter_j.blk,
-					&pp[lm_count], iter_i.blk))
+					rm, enc_id, j, &pp_idx[lm_count])) {
 				continue;
+			}
 
-			lm[lm_count] = iter_j.blk;
+			lm_idx[lm_count] = j;
 			++lm_count;
 		}
 	}
@@ -424,17 +313,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 		return -ENAVAIL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(lm); i++) {
-		if (!lm[i])
-			break;
-
-		lm[i]->enc_id = enc_id;
-		pp[i]->enc_id = enc_id;
+	for (i = 0; i < lm_count; i++) {
+		rm->mixer_to_enc_id[lm_idx[i]] = enc_id;
+		rm->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 
-		trace_dpu_rm_reserve_lms(lm[i]->id, enc_id, pp[i]->id);
+		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
+					 pp_idx[i] + PINGPONG_0);
 	}
 
-	return rc;
+	return 0;
 }
 
 static int _dpu_rm_reserve_ctls(
@@ -442,47 +329,48 @@ static int _dpu_rm_reserve_ctls(
 		uint32_t enc_id,
 		const struct msm_display_topology *top)
 {
-	struct dpu_rm_hw_blk *ctls[MAX_BLOCKS];
-	struct dpu_rm_hw_iter iter;
-	int i = 0, num_ctls = 0;
-	bool needs_split_display = false;
-
-	memset(&ctls, 0, sizeof(ctls));
+	int ctl_idx[MAX_BLOCKS];
+	int i = 0, j, num_ctls;
+	bool needs_split_display;
 
 	/* each hw_intf needs its own hw_ctrl to program its control path */
 	num_ctls = top->num_intf;
 
 	needs_split_display = _dpu_rm_needs_split_display(top);
 
-	dpu_rm_init_hw_iter(&iter, 0, DPU_HW_BLK_CTL);
-	while (_dpu_rm_get_hw_locked(rm, &iter)) {
-		const struct dpu_hw_ctl *ctl = to_dpu_hw_ctl(iter.blk->hw);
-		unsigned long features = ctl->caps->features;
+	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
+		const struct dpu_hw_ctl *ctl;
+		unsigned long features;
 		bool has_split_display;
 
-		if (RESERVED_BY_OTHER(iter.blk, enc_id))
+		if (!rm->ctl_blks[j])
+			continue;
+		if (reserved_by_other(rm->ctl_to_enc_id, j, enc_id))
 			continue;
 
+		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
+		features = ctl->caps->features;
 		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", iter.blk->id, features);
+		DPU_DEBUG("ctl %d caps 0x%lX\n", rm->ctl_blks[j]->id, features);
 
 		if (needs_split_display != has_split_display)
 			continue;
 
-		ctls[i] = iter.blk;
-		DPU_DEBUG("ctl %d match\n", iter.blk->id);
+		ctl_idx[i] = j;
+		DPU_DEBUG("ctl %d match\n", j + CTL_0);
 
 		if (++i == num_ctls)
 			break;
+
 	}
 
 	if (i != num_ctls)
 		return -ENAVAIL;
 
-	for (i = 0; i < ARRAY_SIZE(ctls) && i < num_ctls; i++) {
-		ctls[i]->enc_id = enc_id;
-		trace_dpu_rm_reserve_ctls(ctls[i]->id, enc_id);
+	for (i = 0; i < ARRAY_SIZE(ctl_idx) && i < num_ctls; i++) {
+		rm->ctl_to_enc_id[ctl_idx[i]] = enc_id;
+		trace_dpu_rm_reserve_ctls(i + CTL_0, enc_id);
 	}
 
 	return 0;
@@ -493,32 +381,20 @@ static int _dpu_rm_reserve_intf(
 		uint32_t enc_id,
 		uint32_t id)
 {
-	struct dpu_rm_hw_iter iter;
-	int ret = 0;
-
-	/* Find the block entry in the rm, and note the reservation */
-	dpu_rm_init_hw_iter(&iter, 0, DPU_HW_BLK_INTF);
-	while (_dpu_rm_get_hw_locked(rm, &iter)) {
-		if (iter.blk->id != id)
-			continue;
-
-		if (RESERVED_BY_OTHER(iter.blk, enc_id)) {
-			DPU_ERROR("intf id %d already reserved\n", id);
-			return -ENAVAIL;
-		}
+	int idx = id - INTF_0;
 
-		iter.blk->enc_id = enc_id;
-		trace_dpu_rm_reserve_intf(iter.blk->id, enc_id);
-		break;
-	}
-
-	/* Shouldn't happen since intfs are fixed at probe */
-	if (!iter.hw) {
+	if (!rm->intf_blks[idx]) {
 		DPU_ERROR("couldn't find intf id %d\n", id);
 		return -EINVAL;
 	}
 
-	return ret;
+	if (reserved_by_other(rm->intf_to_enc_id, idx, enc_id)) {
+		DPU_ERROR("intf id %d already reserved\n", id);
+		return -ENAVAIL;
+	}
+
+	rm->intf_to_enc_id[idx] = enc_id;
+	return 0;
 }
 
 static int _dpu_rm_reserve_intf_related_hw(
@@ -583,22 +459,29 @@ static int _dpu_rm_populate_requirements(
 	return 0;
 }
 
-static void _dpu_rm_release_reservation(struct dpu_rm *rm, uint32_t enc_id)
+static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
+				  uint32_t enc_id)
 {
-	struct dpu_rm_hw_blk *blk;
-	enum dpu_hw_blk_type type;
-
-	for (type = 0; type < DPU_HW_BLK_MAX; type++) {
-		list_for_each_entry(blk, &rm->hw_blks[type], list) {
-			if (blk->enc_id == enc_id) {
-				blk->enc_id = 0;
-				DPU_DEBUG("rel enc %d %d %d\n", enc_id,
-					  type, blk->id);
-			}
-		}
+	int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (res_mapping[i] == enc_id)
+			res_mapping[i] = 0;
 	}
 }
 
+static void _dpu_rm_release_reservation(struct dpu_rm *rm, uint32_t enc_id)
+{
+	_dpu_rm_clear_mapping(rm->pingpong_to_enc_id,
+		ARRAY_SIZE(rm->pingpong_to_enc_id), enc_id);
+	_dpu_rm_clear_mapping(rm->mixer_to_enc_id,
+		ARRAY_SIZE(rm->mixer_to_enc_id), enc_id);
+	_dpu_rm_clear_mapping(rm->ctl_to_enc_id,
+		ARRAY_SIZE(rm->ctl_to_enc_id), enc_id);
+	_dpu_rm_clear_mapping(rm->intf_to_enc_id,
+		ARRAY_SIZE(rm->intf_to_enc_id), enc_id);
+}
+
 void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc)
 {
 	mutex_lock(&rm->rm_lock);
@@ -653,12 +536,48 @@ int dpu_rm_reserve(
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
 {
-	struct dpu_rm_hw_iter hw_iter;
-	int num_blks = 0;
+	struct dpu_hw_blk **hw_blks;
+	uint32_t *hw_to_enc_id;
+	int i, num_blks, max_blks;
+
+	switch (type) {
+	case DPU_HW_BLK_PINGPONG:
+		hw_blks = rm->pingpong_blks;
+		hw_to_enc_id = rm->pingpong_to_enc_id;
+		max_blks = ARRAY_SIZE(rm->pingpong_blks);
+		break;
+	case DPU_HW_BLK_LM:
+		hw_blks = rm->mixer_blks;
+		hw_to_enc_id = rm->mixer_to_enc_id;
+		max_blks = ARRAY_SIZE(rm->mixer_blks);
+		break;
+	case DPU_HW_BLK_CTL:
+		hw_blks = rm->ctl_blks;
+		hw_to_enc_id = rm->ctl_to_enc_id;
+		max_blks = ARRAY_SIZE(rm->ctl_blks);
+		break;
+	case DPU_HW_BLK_INTF:
+		hw_blks = rm->intf_blks;
+		hw_to_enc_id = rm->intf_to_enc_id;
+		max_blks = ARRAY_SIZE(rm->intf_blks);
+		break;
+	default:
+		DPU_ERROR("blk type %d not managed by rm\n", type);
+		return 0;
+	}
 
-	dpu_rm_init_hw_iter(&hw_iter, enc_id, type);
-	while (num_blks < blks_size && dpu_rm_get_hw(rm, &hw_iter))
-		blks[num_blks++] = hw_iter.blk->hw;
+	num_blks = 0;
+	for (i = 0; i < max_blks; i++) {
+		if (hw_to_enc_id[i] != enc_id)
+			continue;
+
+		if (num_blks == blks_size) {
+			DPU_ERROR("More than %d resources assigned to enc %d\n",
+				  blks_size, enc_id);
+			break;
+		}
+		blks[num_blks++] = hw_blks[i];
+	}
 
 	return num_blks;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 982b91e272275..9c8a436ba6cc1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -11,15 +11,31 @@
 #include "msm_kms.h"
 #include "dpu_hw_top.h"
 
+
 /**
  * struct dpu_rm - DPU dynamic hardware resource manager
- * @hw_blks: array of lists of hardware resources present in the system, one
- *	list per type of hardware block
+ * @pingpong_blks: array of pingpong hardware resources
+ * @mixer_blks: array of layer mixer hardware resources
+ * @ctl_blks: array of ctl hardware resources
+ * @intf_blks: array of intf hardware resources
+ * @pingpong_to_enc_id: mapping of pingpong hardware resources to an encoder ID
+ * @mixer_to_enc_id: mapping of mixer hardware resources to an encoder ID
+ * @ctl_to_enc_id: mapping of ctl hardware resources to an encoder ID
+ * @intf_to_enc_id: mapping of intf hardware resources to an encoder ID
  * @lm_max_width: cached layer mixer maximum width
  * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
-	struct list_head hw_blks[DPU_HW_BLK_MAX];
+	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
+	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
+	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
+	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
+
+	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
+	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
+	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
+	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
+
 	uint32_t lm_max_width;
 	struct mutex rm_lock;
 };
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
