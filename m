Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3797AA38179
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8353010E41C;
	Mon, 17 Feb 2025 11:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09D010E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:17:57 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7C5931F8F2;
 Mon, 17 Feb 2025 12:17:55 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Feb 2025 12:17:43 +0100
Subject: [PATCH v3 3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface
 in DSC topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-3-913100d6103f@somainline.org>
References: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
In-Reply-To: <20250217-drm-msm-initial-dualpipe-dsc-fixes-v3-0-913100d6103f@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Hai Li <hali@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=MgMGnmZBZiiXwg/TOFHX7DTi1si89IdnuyFW3h892yg=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnsxrgGM6TmLIP+Y8pCQpDj7IdZUB4VzZ8riqFj
 a30QyrxqXOJAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ7Ma4AAKCRDxYtIxx+SG
 dtN8EACFtQBw8cwzIfeyB/OhAWSC/pSEkfkYf0pCMHdtroktRTzvlw52AvGnd0yLBCTEBdnCPDt
 Et09anMQ9iA/Qi0jsDMDNnhXvANL6WuG8DDXlDzX6QyVWSKJWIFR3Kh8xBeLs8IQpZMAMjFVwzz
 10nFpVjFuedGsh8hVVD7Qg6DPqtbzagtRcg1AIJqwuynUJawrA9yrlW9GzdtYV4p5dZYdTiBHS5
 4eCHQn5l6q4XA+1WmfJVR+z5+4IA0fZB+IUmbocm1R9no8/X5l11eey6SDDNn+wW4ov5D0SLR3A
 9IQdf6Ma2bG8RgmJLwFYPOGHsk9zmR6BPzUO6VX1gQ/O9cxillPLO8/Uw6UVplCdFTiO1WcoJ84
 sllqEh1oNh9aerRb8iLUhPnr3bYl2XYmb2eHECTQLTBTuRol1126PIkFLUbSUXh48wzuSlXaz0S
 7r/JP5zWgHYPf+yY+Y8CNCf0+b8CXwpb6cEg+XCkHD9XnWycsbaLqFvbTsltis8FzAoPvEFe+9m
 FRmydy7vYSeR9DqBhmvpMKjMidKc2ZiMfI/UWKzuO/EBAt97vOJVt/ypptZjfsfd5gLbWXMvz4g
 17+cFQW/oYBfFth0DJMdJUTUb+oC/aKAK4rWqpTHASATUakVY8s4DlsZ26PxNqkQxjmdDG6pbDP
 MZoMDLeTEgEPqEg==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

When DSC is enabled the number of interfaces is forced to be 1, and
documented that it is a "power-optimal" layout to use two DSC encoders
together with two Layer Mixers.  However, the same layout (two DSC
hard-slice encoders with two LMs) is also used when the display is
fed with data over two instead of one interface (common on 4k@120Hz
smartphone panels with Dual-DSI).  Solve this by simply removing the
num_intf = 1 assignment as the count is already calculated by computing
the number of physical encoders within the virtual encoder.

Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d67127f67a4492f30329ee15267369ca7540288a..1b092fa45b1dadbeb06b5c086c7638556bd313dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -686,20 +686,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	if (dsc) {
 		/*
-		 * Use 2 DSC encoders and 2 layer mixers per single interface
+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
 		 * when Display Stream Compression (DSC) is enabled,
 		 * and when enough DSC blocks are available.
 		 * This is power-optimal and can drive up to (including) 4k
 		 * screens.
 		 */
-		if (dpu_kms->catalog->dsc_count >= 2) {
+		WARN(topology.num_intf > 2,
+		     "DSC topology cannot support more than 2 interfaces\n");
+		if (intf_count >= 2 || dpu_kms->catalog->dsc_count >= 2) {
 			topology.num_dsc = 2;
 			topology.num_lm = 2;
 		} else {
 			topology.num_dsc = 1;
 			topology.num_lm = 1;
 		}
-		topology.num_intf = 1;
 	}
 
 	return topology;

-- 
2.48.1

