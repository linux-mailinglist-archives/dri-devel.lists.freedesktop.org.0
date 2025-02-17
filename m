Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13CA38F03
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BC810E5F6;
	Mon, 17 Feb 2025 22:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wQEMfErZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="JIaY0D+9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wNcb9J4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA5910E5F5;
 Mon, 17 Feb 2025 22:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DTtf3dRsDzoF2fh8vK/wvzkc8YmGR5tRTNS9d+zXWTg=; 
 t=1739831124;x=1739921124; 
 b=wQEMfErZ0bzutl5IE0mpA8E/CZQV0eE20+RQDAI3MS5k/u3G1vxOtd/IhkTxpXK7DSj0o8e5HJdIKbokDt1i01HFJftAnlKyJwhy2I1B2hZfsAmPscY9XbcSfhdK9VdMIonVQoPV4P5qJWWjX9Af4EJ4n8gcONnXXUFK14KhPsU=;
Received: from [10.113.230.39] (port=33570 helo=send170.i.mail.ru)
 by fallback1.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tk9YH-002lqW-WF; Tue, 18 Feb 2025 01:25:22 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=DTtf3dRsDzoF2fh8vK/wvzkc8YmGR5tRTNS9d+zXWTg=; t=1739831122; x=1739921122; 
 b=JIaY0D+9piP0IL2J+K66aw5HUH+uFAOX4NEAOuarr/oKoSyEghrXCwCD8J9+tMdBXZPUbs644Lf
 M8gQeyTxagomtZihCCKr1FJuTlg4xEZPE9SMHvLr57PnQOI5RV9Rrd89/WvHPeq9qW4eBurRYifcy
 fOOB5k0OsFvBM4tKJlA=;
Received: from [10.113.64.249] (port=40510 helo=send80.i.mail.ru)
 by exim-fallback-c85fcfddd-z4klk with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tk9Y8-00000000M7C-1p1e; Tue, 18 Feb 2025 01:25:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=DTtf3dRsDzoF2fh8vK/wvzkc8YmGR5tRTNS9d+zXWTg=; t=1739831112; x=1739921112; 
 b=wNcb9J4cgenq/iJlZNRKIpq7gdL2NatZ6DhyD2FEZOXen1ojHvcEX0w7QbpN7pgwwZbSxtTMiNZ
 NenudeAF8+a2qGcFXPE5uw94DohYFwI89RgYCg8F+kZooORbpicM5wT7uZCyeuTj4oAnPkN4cglLP
 Vsivd+FXfDgyUk1K4AI=;
Received: by exim-smtp-844687bc8-889bz with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tk9Xs-00000000D2z-0DBQ; Tue, 18 Feb 2025 01:24:59 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 3/4] drm/msm/dsi: Allow values of 10 and 12 for bits per
 component
Date: Tue, 18 Feb 2025 01:24:30 +0300
Message-ID: <20250217222431.82522-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C5959CB4E76AE07DB3784C1E73497DAF14A182A05F53808504018234A075CC2813D3DE06ABAFEAF670556D0C6ABDA54B31D18405E59E443B95415F97051F6725EC3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78BAADB77C21FF6F2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063720E5706DB08A2EAB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A9C7ECD2716096876C30ED7C9CE18612B7314DB471FB9415CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F92C6DAC308276C8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D95D32202655EC45F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C4B6F6234D9065C972D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C356F5B1E582025211BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE73D56AD9F5B48EAD3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A525C340E439B8F7CC5002B1117B3ED69623E85D8CE23D503BB74D9144D44E4FCF823CB91A9FED034534781492E4B8EEAD5DF1C2DF01CE7211C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF00B7B360322702E8BFC3B26E4048ED82A95C9481826C384544430614E61066EEE4A5F4FEF661E8B50526A8B1FD8BF66B4DA323B4D815FEF6F965E601AD7A576DCD86839DA5AF28058FC4A39FA5EEE4B702C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdr9tkOmJVYB8A=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F9233EC877BA2ACDA05E38EDE555C280687E94BB9960E33DD5DE77BB456C503102C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B71052A0F16B60AFC0049FFFDB7839CE9E3D3BB30DB6F99D604F3EBE040C6C546E1BFC17FF46E93610EC210DB30E65F8EC2300A00CDC5BCF89
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2sfrh64bjX5QA0SoXgDYpQ==
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B7C7A580BE3300C170049FFFDB7839CE9E3D3BB30DB6F99D60314D183422CD3D2BFFD75F014E9ECAC269ED35FA8A7C2B65
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2sfrh64bjX7glJpyBuU9Lw==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
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

From: Eugene Lepshy <fekz115@gmail.com>

The DRM DSC helper has various bits_per_component values - not just 8.
But the DSC 1.1 block supports only 8, 10, and 12. Extend the guard
accordingly and add a comment noting this limitation.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fda..b9e247a23953 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1767,8 +1767,20 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 		return -EINVAL;
 	}
 
-	if (dsc->bits_per_component != 8) {
-		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
+	switch (dsc->bits_per_component) {
+	case 8:
+	case 10:
+	case 12:
+		/*
+		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
+		 * If additional bpc values need to be supported, update
+		 * this quard with the appropriate DSC version verification.
+		 */
+		break;
+	default:
+		DRM_DEV_ERROR(&msm_host->pdev->dev,
+			      "Unsupported bits_per_component value: %d\n",
+			      dsc->bits_per_component);
 		return -EOPNOTSUPP;
 	}
 
@@ -1779,7 +1791,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 	drm_dsc_set_const_params(dsc);
 	drm_dsc_set_rc_buf_thresh(dsc);
 
-	/* handle only bpp = bpc = 8, pre-SCR panels */
+	/* DPU supports only pre-SCR panels */
 	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
 	if (ret) {
 		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
-- 
2.48.1

