Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A452586A3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 06:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B686E595;
	Tue,  1 Sep 2020 04:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66E06E578
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:08:56 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200901040855epoutp0310b4e84ee3b32af284d6879afc458280~wjWWflQgS0597105971epoutp03g
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:08:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200901040855epoutp0310b4e84ee3b32af284d6879afc458280~wjWWflQgS0597105971epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598933335;
 bh=aV0x4n6wQckii0JDBHb/o4LkoOEhIHxl7xns9Eg3VhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hf8DGWlHDtIiMeG73eyxSzFBAYzmoxTvY394InsdbfmJjaJ5f0t7J+sHrE5L2sryZ
 TvpMQBjHNoj0o7RLAuSUfYZMn+gIPS5uRmc/juNazbFqunjeGc5bdjcHlTuvhLGbhN
 lfJlb0UK9+CmGXZzVPhiNPy6CVBSEf/K3cE8sgOk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200901040854epcas1p443d27e0bcaca9af33ddbfd8cfc4dff5c~wjWWE9Ni-3231032310epcas1p4a;
 Tue,  1 Sep 2020 04:08:54 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4BgYTv4sNpzMqYkZ; Tue,  1 Sep
 2020 04:08:51 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.E7.29173.359CD4F5; Tue,  1 Sep 2020 13:08:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200901040851epcas1p3124094e38175758b2310bdae6d76793c~wjWSq0pmZ1717817178epcas1p3i;
 Tue,  1 Sep 2020 04:08:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901040851epsmtrp1d08ddbf21bbdc2721eaaf5d97955ed9e~wjWSpx1NR3200332003epsmtrp18;
 Tue,  1 Sep 2020 04:08:51 +0000 (GMT)
X-AuditID: b6c32a37-9b7ff700000071f5-92-5f4dc9532ba0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5C.03.08382.359CD4F5; Tue,  1 Sep 2020 13:08:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901040850epsmtip135477003d71b962546776499199b06ce~wjWSWXrx90868108681epsmtip1i;
 Tue,  1 Sep 2020 04:08:50 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: nsaenzjulienne@suse.de, eric@anholt.net, maxime@cerno.tech,
 stefan.wahren@i2se.com, dave.stevenson@raspberrypi.com
Subject: [PATCH v2 2/4] drm/vc4: hdmi: Add pixel bvb clock control
Date: Tue,  1 Sep 2020 13:07:57 +0900
Message-Id: <20200901040759.29992-3-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmvm7wSd94g3lz1CzW9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20jUMOKG2wWj6beZ3QQ9mh6f4zN4/2NVnaPWffPsnnc
 OXeezWPnrLvsHltvmXpsWtXJ5nG/+ziTx+Yl9R6tR3+xePRtWcXosfl0tcfnTXIBvFHZNhmp
 iSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAbyoplCXmlAKF
 AhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL89L1kvNzrQwNDIxMgQoTsjP+fVrN
 VLBFtOL4jE7WBsZuoS5GTg4JAROJgy/2sXUxcnEICexglPjQ/4MdwvnEKLH02QeozDdGiWPf
 pgE5HGAtO0/UQcT3MkpcmH6AFcL5zCgx5/55NpC5bAK6El97rjOB2CICFRL7nl9nBCliFpjK
 LPF0zjKwhLCAk8TOLa0sIDaLgKrEokP/GUFsXgFbiWdTO5ggDpSXWL3hADOIzSlgJ3F9yVsW
 kEESAlc4JLb/PM8McZKLxNOTXBD1whKvjm9hh7ClJF72t0HZxRJXZr6C6m1glOifOBsqYSyx
 f+lkJpA5zAKaEut36UOEFSV2/p4Ldg+zAJ/Eu689rBCreCU62qBhpybxrAHkeRBbRuJU73Ko
 kz0kbr47xwwJlImMEo8XX2WewCg3C2HDAkbGVYxiqQXFuempxYYFxshRtokRnI61zHcwTnv7
 Qe8QIxMH4yFGCQ5mJRHeA7u844V4UxIrq1KL8uOLSnNSiw8xmgIDbyKzlGhyPjAj5JXEG5oa
 GRsbW5gYmpkaGiqJ8z68pRAvJJCeWJKanZpakFoE08fEwSnVwJSXKPhw9+nkmm7PlK/zD5Yf
 vcNR735Z5kR6wNdLsWJRLz0PFax7rOsqm5WnVSH5P9/txL2zoqdNvZufbFJwsbu71SxuxpWM
 irdtZ2X6UnT3Kux/vitgQVggQ/yjQCadPZUp+9x+LajPWPnxcdHq2xrCLDO3J13kMzGbtyFD
 dHrNkhnd8z0W6gX+XymioH8o/OvTs0u1kvJbmT/N7HQUeXg4iqF3jcyDVo4LGxb4M1/osNr6
 TLrHaIe2/gIvPnf2JasVRV0WPftssvAAo4Jb6sZtnK5R73IaizqXi3330FZ/avvMfOnsTytS
 nQ5MvvpSWC/hUPS5L33yfTtDVC9vdM5/t2Otp+5lXvG3lwKeciixFGckGmoxFxUnAgDyAImL
 UAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSnG7wSd94g6d9HBZre4+yWLydu5jF
 Yv6Rc6wWV76+Z7M40HiZ0eL98i42i51X1rJYbHp8jdXiY889VovLu+awWUy8vYHdYsaPf4wW
 F0+5WmybtZzNYt2t12wWrXuPsFv8u7YRqGHFDTaLR1PvMzoIezS9P8bm8f5GK7vHrPtn2Tzu
 nDvP5rFz1l12j623TD02repk87jffZzJY/OSeo/Wo79YPPq2rGL02Hy62uPzJrkA3igum5TU
 nMyy1CJ9uwSujH+fVjMVbBGtOD6jk7WBsVuoi5GDQ0LARGLnibouRi4OIYHdjBIPp31h6WLk
 BIrLSKzq38IKUSMscfhwMUTNR0aJnb/PMYLUsAnoSnztuc4EYosI1Ek86WgE62UWWMos0TJJ
 AcQWFnCS2LmlFSzOIqAqsejQf7BeXgFbiWdTO5ggdslLrN5wgBnE5hSwk7i+5C1YvRBQzfE3
 G9gmMPItYGRYxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHDNamjsYt6/6oHeIkYmD
 8RCjBAezkgjvgV3e8UK8KYmVValF+fFFpTmpxYcYpTlYlMR5bxQujBMSSE8sSc1OTS1ILYLJ
 MnFwSjUwuYs5+qStMyot2FV2r/mZUueJnrfXWq+YuwZY9zYz5FyI0TV9WanTtH9jHvfS2Z/f
 sL0KjNC9/3rllQkb+/cXRZVuMzd+vNzDa6epmfJRCZfNMwW6GDcs6dsZnPPyy8M/q+pjua8a
 FoWZTVFseRfLrJQ696uHgemU2nml+TtYNm1dUG5v5c/qufrFGRNVmT2lksdeFXufZP925Zjz
 iRUKvAk/0jY/tlkZk7H+HX+0u77DmVv85068lX5+O/nyO9+VpU8CziqV7d6b/+lQzZ6sP7O+
 tt64PmXpx5pgK5a1xlm7Zx2Ue3DActn+gONOW9+zVzwv+7/axTg9zfVLUeAfvgr/F9EMAX3r
 H7Rq7z+3VomlOCPRUIu5qDgRAIXJgroIAwAA
X-CMS-MailID: 20200901040851epcas1p3124094e38175758b2310bdae6d76793c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200901040851epcas1p3124094e38175758b2310bdae6d76793c
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
 <CGME20200901040851epcas1p3124094e38175758b2310bdae6d76793c@epcas1p3.samsung.com>
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
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
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
