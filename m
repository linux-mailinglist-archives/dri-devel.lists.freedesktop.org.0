Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB35273CA0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B56E184;
	Tue, 22 Sep 2020 07:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFAB6E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 02:11:20 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id A31534827CA;
 Tue, 22 Sep 2020 10:11:13 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Brandon Syu <Brandon.Syu@amd.com>,
 Michael Strauss <michael.strauss@amd.com>,
 abdoulaye berthe <abdoulaye.berthe@amd.com>,
 Martin Leung <martin.leung@amd.com>, Bernard Zhao <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd/display: optimize code runtime a bit
Date: Mon, 21 Sep 2020 19:11:03 -0700
Message-Id: <20200922021106.24733-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSh5ISRhJSB5CQ0kaVkpNS0tMT0tNTE9LTEhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6EQw*Qj8hPA8PMEkONSJJ
 GQNPCxdVSlVKTUtLTE9LTUxPTk1PVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSElNQzcG
X-HM-Tid: 0a74b3944a0993bakuwsa31534827ca
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function dal_ddc_service_query_ddc_data,
get rid of dal_ddc_i2c_payloads_destroy, call
dal_vector_destruct() directly.
This change is to make the code run a bit fast.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
Changes since V1:
*get rid of dal_ddc_i2c_payloads_destroy, call
dal_vector_destruct() directly.

Link for V1:
*https://lore.kernel.org/patchwork/patch/1309014/
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
index b984eecca58b..dec12de37642 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
@@ -148,14 +148,6 @@ static uint32_t dal_ddc_i2c_payloads_get_count(struct i2c_payloads *p)
 	return p->payloads.count;
 }
 
-static void dal_ddc_i2c_payloads_destroy(struct i2c_payloads *p)
-{
-	if (!p)
-		return;
-
-	dal_vector_destruct(&p->payloads);
-}
-
 #define DDC_MIN(a, b) (((a) < (b)) ? (a) : (b))
 
 void dal_ddc_i2c_payloads_add(
@@ -582,7 +574,7 @@ bool dal_ddc_service_query_ddc_data(
 				ddc->link,
 				&command);
 
-		dal_ddc_i2c_payloads_destroy(&payloads);
+		dal_vector_destruct(&payloads.payloads);
 	}
 
 	return success;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
