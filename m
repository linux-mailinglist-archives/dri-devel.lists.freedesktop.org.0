Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPc0N7AEemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C1A16EE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0F510E6CA;
	Wed, 28 Jan 2026 12:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hKKR45NP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0416310E6CF;
 Wed, 28 Jan 2026 12:44:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDDE443483;
 Wed, 28 Jan 2026 12:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670DDC4CEF1;
 Wed, 28 Jan 2026 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604267;
 bh=SAR4DfPJD3TKkpeD6a81F0d/LFgqYTJUZhxwwVbTssQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hKKR45NPj68te+o9XFdXd32HhxT5rP3W4mlVsUVTgFCUIbf03w+sTlqcFpcdR50wC
 jacmxD5peRiqUYrchKOA6QpvmM0VrdK27iQqQzDobYD6pId6pmTEgsK8Y50fa9VOK6
 PdCf8PqVvVb7FFQbvuuM1UwWuemPHV3CMfH+ethUSHVdR/mUdQgWY4V4D7DPEk7rdo
 2SUCqMPjIzhZWiy1Pj7U0wlh2hCgehBQebH4x5usV2QV3QFC5E6/ZRW9soHtLxa7qM
 BVzJ2wBiEg4LENUc8ZQFzOOda1OXIm1jE3G0tT3xAmb+z2Eyn4jMJBFgDhvNncyEi5
 wk8DuXvrFfTzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:54 +0100
Subject: [PATCH v4 10/15] drm/msm: mdp5: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-10-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3643; i=mripard@redhat.com;
 h=from:subject:message-id; bh=SAR4DfPJD3TKkpeD6a81F0d/LFgqYTJUZhxwwVbTssQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLJ3z/0tmzm0MlnJxYVEzSJTctWh607QEXj4Rpp31Z
 p3cTnYdU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCIhWYwNd2Y2H2DfferTQvX7
 5uLXVs8o6lmYecjnQeqG1iXsPNM9tucrrBThDA9J2rDg1o/ly08/YGz4kabzUHN+4WHFv6IqK6u
 3JjPHenIcOpcR8sX3c0vRhdPLpwulHGpZksaQG8v3bLPl1scA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:email,lists.freedesktop.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 8F6C1A16EE
X-Rspamd-Action: no action

The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 41 +++++++++++++++++---------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 61edf6864092664afe474cc8d1fd097ca495ebb8..1fc9671590762b800bdeb6cd440b1ae6ee634679 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -112,41 +112,44 @@ static void mdp5_global_destroy_state(struct drm_private_obj *obj,
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	kfree(mdp5_state);
 }
 
+static struct drm_private_state *
+mdp5_global_create_state(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
+	struct mdp5_global_state *mdp5_state;
+
+	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &mdp5_state->base);
+	mdp5_state->mdp5_kms = mdp5_kms;
+
+	return &mdp5_state->base;
+}
+
 static void mdp5_global_print_state(struct drm_printer *p,
 				    const struct drm_private_state *state)
 {
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	if (mdp5_state->mdp5_kms->smp)
 		mdp5_smp_dump(mdp5_state->mdp5_kms->smp, p, mdp5_state);
 }
 
 static const struct drm_private_state_funcs mdp5_global_state_funcs = {
+	.atomic_create_state = mdp5_global_create_state,
 	.atomic_duplicate_state = mdp5_global_duplicate_state,
 	.atomic_destroy_state = mdp5_global_destroy_state,
 	.atomic_print_state = mdp5_global_print_state,
 };
 
-static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
-{
-	struct mdp5_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	state->mdp5_kms = mdp5_kms;
-
-	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
-				    &state->base,
-				    &mdp5_global_state_funcs);
-	return 0;
-}
-
 static void mdp5_enable_commit(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	pm_runtime_get_sync(&mdp5_kms->pdev->dev);
 }
@@ -711,13 +714,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
 	mdp5_kms->dev = dev;
 
-	ret = mdp5_global_obj_init(mdp5_kms);
-	if (ret)
-		goto fail;
+	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
+				    NULL,
+				    &mdp5_global_state_funcs);
 
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */

-- 
2.52.0

