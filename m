Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA0897B909
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 10:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F060910E55D;
	Wed, 18 Sep 2024 08:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ckuC0Om9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F8710E55D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1726647163; x=1727251963; i=markus.elfring@web.de;
 bh=kInQ//rPSsqlgcK7FpGZP43VvDdx4dvgsVxHv3VH3nI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ckuC0Om92SIu+UHVBmv0FIG+p2lPJY37ZtpYU6/TF8VabNiMYID6V2d6PoOP49Yv
 hyiZKldZckMoa5Zz8eECGaMEBgwECB9kzeYssSmB912p7Pf8CIne30bdzdkCIdoKl
 SZ8ADiEVc4ZRrXaa0nG1u1tzGJAjFkQaaEHdoH7Zkn2VbFsYeSgwKDr8oRuZzLv+S
 3Sb3T+0cdZS+qma0CV9RR/vISMHaTeOqzI6wcpSNBIbiEYvFrL2kbND+ul+0S9rxz
 wueje130/Hj9j0uweR7R2Wb/1OIZ02hLXn4pfzXr/W5hc4X1IMGKpupCwOT/XBHKQ
 IVVI4hBJe6hK1TXOoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mfc8y-1sJhy70VPE-00ixjw; Wed, 18
 Sep 2024 10:12:43 +0200
Message-ID: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
Date: Wed, 18 Sep 2024 10:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Philippe Lecluse <philippe.lecluse@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/xe/query: Refactor copy_to_user() usage in four functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1KMy0yAdh4GMhkxbk+tvy/qZLdxiPwbW85tozVJiNzbZLOB1351
 y1EfCORR2QuAvKPUa3Uu4Ky2IV+rP4QYTjXAWmNPfRbFlIwWIc00b9COnmrgieUmd6iIzpC
 fdVGkt7xuob2v19OTCBJk5tqpLbZ5+ESSPbTb+cnm9KVR2HlxH3Y4UZ4bb14+s3XPmzZAnM
 bJiYIpXwLw0AGvmQ6xqjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mr+sK1Kvv0Q=;TWQfCzjh0yjiyT5cJLK1+Oj1u3v
 dXTfDQggGDJfrvpK2pY7OBiGx+Xux+scjcqkAFHmbvRfW/+//rno/UCiYTVDCJ9WxVz3EF7I3
 fQ2PFV4VgTvr9gkW3q83We0dkBQ1zvnU1o110qtWEjsvHRy7h7uA1nFP+Xo9CfuUefbrwuCT0
 WdulMAy4IIoETB9dUnzgA0S2gpvVT8jNCzkm8yz1oSZxmBLx1a5LznByJpW+mcsK/47Z181sl
 Hd8Sq6AmG1L/VgLg98oFh204tqmTn4eE8PbNb8d59fFUaGWr2U1PTz+dEv6Z7XZ1x1uY4xVZE
 WslD4da9QagicmTTrAS44yHzmIG+tATnuFXgyCyW2GWuoq8RBHYxgPH7F31jS2zICTaVQge6X
 hUbdEgJQ5NYRDW3qA7+CSnmm4BUYHf1mShwG2oR1NGae1UAhSeUSQ2F0nL+QFDbrfzLlARTjW
 2yn9y9xdjQJkFX37oehc6UKArgxmVg3RFsfoYiS35sX2H/a75NjAaqC8z0z5KT58NpRQvbQHN
 t5dG5QYn6veLuwu42vQVGZ2pYB95nzDxVdcEe5QL7WPtyWjYcqe3diaKIARppGWbEFGBkImPL
 7wOd/FDULHDc2Wk0Fid9SxcnToQH9pvfMBGWz3Sr3K46v5xbs5ChQCtkbh5ONjJFGJDKHtMWs
 Jx0NiR18sXnotG7RrRxvNNds9m4t2o5Jls6Mv8IgUR3SRqD1hZYVB5fk3Dt+aN+X2MxmxW7mY
 zNhnctiU0cPC2JJJvtf3mYaKeWkWvjAHnj5y6S4crqtUnI2XwuIwIIPBr56YVKSwxZRzoMlcb
 iQARlY43W2pNq031OQGlTs8w==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2024 09:43:07 +0200

Assign return values from copy_to_user() calls to additional local variabl=
es
so that four kfree() calls and return statements can be omitted accordingl=
y.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/xe/xe_query.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..6195e720176d 100644
=2D-- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -220,13 +220,11 @@ static int query_engines(struct xe_device *xe,

 	engines->num_engines =3D i;

-	if (copy_to_user(query_ptr, engines, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, engines, size);
 		kfree(engines);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(engines);
-
-	return 0;
 }

 static size_t calc_mem_regions_size(struct xe_device *xe)
@@ -344,13 +342,11 @@ static int query_config(struct xe_device *xe, struct=
 drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =3D
 		xe_exec_queue_device_get_max_priority(xe);

-	if (copy_to_user(query_ptr, config, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, config, size);
 		kfree(config);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(config);
-
-	return 0;
 }

 static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query=
 *query)
@@ -414,13 +410,11 @@ static int query_gt_list(struct xe_device *xe, struc=
t drm_xe_device_query *query
 			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
 	}

-	if (copy_to_user(query_ptr, gt_list, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, gt_list, size);
 		kfree(gt_list);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(gt_list);
-
-	return 0;
 }

 static int query_hwconfig(struct xe_device *xe,
@@ -444,13 +438,11 @@ static int query_hwconfig(struct xe_device *xe,

 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);

-	if (copy_to_user(query_ptr, hwconfig, size)) {
+	{
+		unsigned long ctu =3D copy_to_user(query_ptr, hwconfig, size);
 		kfree(hwconfig);
-		return -EFAULT;
+		return ctu ? -EFAULT : 0;
 	}
-	kfree(hwconfig);
-
-	return 0;
 }

 static size_t calc_topo_query_size(struct xe_device *xe)
=2D-
2.46.0

