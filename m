Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E64224CEB8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548F46EAA4;
	Fri, 21 Aug 2020 07:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Fri, 21 Aug 2020 07:16:50 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105706EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:16:49 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200821071127epoutp03599c5e8999a6b3e04896152d357b9820~tNvlH5VdU2303823038epoutp03V
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:11:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200821071127epoutp03599c5e8999a6b3e04896152d357b9820~tNvlH5VdU2303823038epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597993887;
 bh=aV0x4n6wQckii0JDBHb/o4LkoOEhIHxl7xns9Eg3VhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UtVhY1IT7h8a7RPeMP8EH0ah3Fz7mAeOoxmpmz9GefxUhZUfAZV5+NTsGFIePBtH6
 aPsKL3regcqJ4GseeXzLFGQQe/M7xzxD+3BxUS9TQfFkM97Nh8XuvGfN5kq5wlCR2l
 2P1j3Ks7W+N1c4X8KJRWDfmTj4YP7HFmako+vQhw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200821071126epcas1p4d9ce4f46c18803992d1d7e22986ac3b3~tNvknpofv3245032450epcas1p4c;
 Fri, 21 Aug 2020 07:11:26 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BXt3Z4g0JzMqYkr; Fri, 21 Aug
 2020 07:11:22 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.8D.18978.A937F3F5; Fri, 21 Aug 2020 16:11:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d~tNvgqLEzS1277912779epcas1p3n;
 Fri, 21 Aug 2020 07:11:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200821071122epsmtrp2da61cd56d43dbcb30a9004682fdccc9e~tNvgpY4TN2521125211epsmtrp25;
 Fri, 21 Aug 2020 07:11:22 +0000 (GMT)
X-AuditID: b6c32a35-603ff70000004a22-63-5f3f739ae0fc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.C1.08382.A937F3F5; Fri, 21 Aug 2020 16:11:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200821071121epsmtip2b93ad01672ed278eec482ed19b1d61e6~tNvgXmNBO2424724247epsmtip2y;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: nsaenzjulienne@suse.de, eric@anholt.net, maxime@cerno.tech
Subject: [PATCH 3/3] drm/vc4: hdmi: Add pixel bvb clock control
Date: Fri, 21 Aug 2020 16:10:45 +0900
Message-Id: <20200821071045.24501-4-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmge6sYvt4g7PP5SzW9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20ji8WjqfcZHYQ8mt4fY/N4f6OV3WPW/bNsHnfOnWfz
 2DnrLrvHplWdbB73u48zeWxeUu/RevQXi0ffllWMHptPV3t83iQXwBOVbZORmpiSWqSQmpec
 n5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkD9J2SQlliTilQKCCxuFhJ386m
 KL+0JFUhI7+4xFYptSAlp8CyQK84Mbe4NC9dLzk/18rQwMDIFKgwITvj36fVTAVbRCuOz+hk
 bWDsFupi5OSQEDCRaFr9jr2LkYtDSGAHo8Sl00dZQRJCAp8YJeYdC4VIfGOUuPfwKhtMx94l
 j9kgEnsZJRZOugfV/plRYsOuz+wgVWwCuhJfe64zgdgiAnYSbT0HGUGKmAW2M0tcb+8GKxIW
 sJeYcO4R0D4ODhYBVYnH37hBwrwCthI3516D2iYvsXrDAWYQmxNozuI7S1lA5kgIXOCQWLRo
 CTtEkYvE0S23mCFsYYlXx7dAxaUkPr/bCzWoWOLKzFdQzQ2MEv0TZ0MVGUvsXzqZCeQIZgFN
 ifW79CHCihI7f89lBLGZBfgk3n3tAbtTQoBXoqMNGnZqEs8aDrBC2DISp3qXM0HYHhLvJx+G
 BspERonnJ88xT2CUm4WwYQEj4ypGsdSC4tz01GLDAkPkKNvECE6+WqY7GCe+/aB3iJGJg/EQ
 owQHs5IIb+9e63gh3pTEyqrUovz4otKc1OJDjKbAwJvILCWanA9M/3kl8YamRsbGxhYmhmam
 hoZK4rwPbynECwmkJ5akZqemFqQWwfQxcXBKNTDVpBUwrph/aeVaz417Zdk/8LI4Hm8XXpKS
 oOX0ZZq405XX4bOnfTyk3CMrnc7wQKVl0grbsN2KF7Q3djx/bOwVFzPx34pTbleckvY/vevK
 YiZ95t6mgLodrlt632QVcFW+cMlc0tXLsSv8PFeZzmcTqSiRt20eZf//e5Q6rVjJO3nZeZ6W
 WOH+b5Urk+bWupfZPM19omk8xfAis8mBdw2Hpx2fcFllTQq75oHHixcJhhmUr/SfYfrT0vBE
 ZuDLHdfNktwCtNoqLa7Vn1q3OEqrOohXa4ZnF8vp5l1WXxkWzEw80efiPfHzcRs1H7ktX+be
 kHuq8Uv5hUbFEnMXtfvfW5ZaxJVrq1v0Bcc52CmxFGckGmoxFxUnAgAyuvKxRwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO6sYvt4g29HOS3W9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20ji8WjqfcZHYQ8mt4fY/N4f6OV3WPW/bNsHnfOnWfz
 2DnrLrvHplWdbB73u48zeWxeUu/RevQXi0ffllWMHptPV3t83iQXwBPFZZOSmpNZllqkb5fA
 lfHv02qmgi2iFcdndLI2MHYLdTFyckgImEjsXfKYrYuRi0NIYDejxI6G0ywQCRmJVf1bWLsY
 OYBsYYnDh4shaj4ySkw7t5YRpIZNQFfia891JhBbRMBJ4sHffcwgRcwCx5klpvcfYAVJCAvY
 S0w49whsEIuAqsTjb9wgYV4BW4mbc6+xQeySl1i94QAziM0pYCex+M5SsBuEgGpOdXxknsDI
 t4CRYRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnCMaGnuYNy+6oPeIUYmDsZDjBIc
 zEoivL17reOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ894oXBgnJJCeWJKanZpakFoEk2Xi4JRq
 YLLa8c5iyvf3NzQ/h0pPXOCf27ZQIqpn9nbPSt+X0086vdK4+oa5/8bhcPVwNe4vOW0vZkg/
 O/os98rcibqdnfF5Vm87cytSj/qUqVs9dv2QJ6pyYt6rS7uy1dpUfEsV+sV6V1Qwyt11TU99
 Yhz29uup2wuTH86ScRBdututMnrJCUuZW29/SIc2LLry99Ph9cpZlSs+HTpyQO35dq5N6xlu
 5RSeZkovmrDMYHPfhTvSK63mSJfNfG2a9bz3oVD0sX6W0KCpalP/b1HavfKz7sbGK8cZGv7O
 YOcJ/XNP+VincrKX+zbzhl/9LG7qX39ueislfdopU9Bx46Ro3cKJJ0ImZgud+Z+0LPTy3NNl
 h9YqsRRnJBpqMRcVJwIAetHsOwADAAA=
X-CMS-MailID: 20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071122epcas1p3d00dda4665f94192ac5e9ee829d0557d@epcas1p3.samsung.com>
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, mturquette@baylibre.com, dave.stevenson@raspberrypi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hoegeun.kwon@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a problem that the output does not work at a resolution
exceeding FHD. To solve this, we need to adjust the bvb clock at a
resolution exceeding FHD.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 95ec5eedea39..eb3192d1fd86 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -80,6 +80,7 @@
 # define VC4_HD_M_ENABLE			BIT(0)
 
 #define CEC_CLOCK_FREQ 40000
+#define VC4_HSM_MID_CLOCK 149985000
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
@@ -380,6 +381,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
 
+	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
@@ -638,6 +640,23 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 		return;
 	}
 
+	ret = clk_set_rate(vc4_hdmi->pixel_bvb_clock,
+			(hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+	if (ret) {
+		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
+		clk_disable_unprepare(vc4_hdmi->hsm_clock);
+		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		return;
+	}
+
+	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
+	if (ret) {
+		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
+		clk_disable_unprepare(vc4_hdmi->hsm_clock);
+		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		return;
+	}
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
@@ -1593,6 +1612,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->audio_clock);
 	}
 
+	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
+	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
+		DRM_ERROR("Failed to get pixel bvb clock\n");
+		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
+	}
+
 	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(vc4_hdmi->reset)) {
 		DRM_ERROR("Failed to get HDMI reset line\n");
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 0806c6d9f24e..63c6f8bddf1d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -147,6 +147,7 @@ struct vc4_hdmi {
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
 	struct clk *audio_clock;
+	struct clk *pixel_bvb_clock;
 
 	struct reset_control *reset;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
