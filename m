Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6E3BDA05
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED216E02D;
	Tue,  6 Jul 2021 15:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737546E02D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 15:21:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166F6dNG025235; Tue, 6 Jul 2021 17:21:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lLGR8C8rrnqtM2RD7BZasUGPpC8PxB8+w4cxLfW4Uq4=;
 b=tSDbaBK/81YI+n/PD1miwCO7NPWX/60hIbjZxNkPQ/LqsLqWVXQxH67ZBY0WsKMbPs3k
 DdXewsocnRWz0SBY3UVw0yPc9g7GGO5MfUbROJpb+Vyrxd2wceFKI5XqSXy5TlArOJhl
 fC3C4P4infB9Aof1zyEdQai5CHmteGc1ZiR5VFf/T0GQtA91gNwy8JFZY8tTlspsmQvZ
 ggqIDDg9K+P4EZAnHi0PxocE0fFU15C8adoHfyEwa7jPL/1O4g+F4XuAcl9g5FqnpjaG
 l9WlIv+OByPh9kRs4+Z6Dg2LtvqTuelJ615eZatsLhNZXOQTLX8DNoXt8Cizq3NreBsg Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39mneb9f4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 17:21:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1CFC10002A;
 Tue,  6 Jul 2021 17:21:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A430621BF5A;
 Tue,  6 Jul 2021 17:21:04 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul
 2021 17:21:03 +0200
Subject: Re: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Philippe
 CORNU - foss" <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <40f82de6-5340-347a-ae37-32c0928a5536@foss.st.com>
Date: Tue, 6 Jul 2021 17:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_07:2021-07-06,
 2021-07-06 signatures=0
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
Cc: Yannick FERTRE <yannick.fertre@st.com>, Marek Vasut <marex@denx.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Raphaël,

thanks for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>



On 6/29/21 1:58 PM, Raphael GALLAIS-POU - foss wrote:
> Bugzilla ticket: https://intbugzilla.st.com/show_bug.cgi?id=60620
> Gerrit patch: https://gerrit.st.com/c/mpu/oe/st/linux-stm32/+/208093/
> 
> In the LTDC driver, pm_runtime_get_sync was wrongly used and caused the
> LTDC pixel clock to be systematically enabled in the clock summary.
> 
> After one simple use of the LTDC by activating and deactivating,
> the clock summary results as below:
> 
> ~# cat /sys/kernel/debug/clk/clk_summary | grep ltdc
>          ltdc_px               1        1        0    29700000          0     0  50000         N
>                ltdc            0        0        0   133250000          0     0  50000         N
> 
> By doing so, pm_runtime_get_sync only increments the clock counter when
> the driver was in not active, displaying the right information when the
> LTDC is not in use, resulting of the below clock summary after deactivation
> of the LTDC.
> 
> ~# cat /sys/kernel/debug/clk/clk_summary | grep ltdc
>          ltdc_px               0        0        0    29700000          0     0  50000         N
>                ltdc            0        0        0   133250000          0     0  50000         N
> 
> The clocks are activated either by the crtc_set_nofb function or
> by the crtc_atomic_enable function. A check of pm_runtime activity must
> be done before set clocks on. This check must also be done for others
> functions which access registers.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 08b71248044d..bf9d18023698 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>   	struct drm_device *ddev = crtc->dev;
> +	int ret;
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	pm_runtime_get_sync(ddev->dev);
> +	if (!pm_runtime_active(ddev->dev)) {
> +		ret = pm_runtime_get_sync(ddev->dev);
> +		if (ret) {
> +			DRM_ERROR("Failed to set mode, cannot get sync\n");
> +			return;
> +		}
> +	}
>   
>   	/* Sets the background color value */
>   	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
> @@ -783,6 +790,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	struct drm_plane_state *newstate = drm_atomic_get_new_plane_state(state,
>   									  plane);
>   	struct drm_framebuffer *fb = newstate->fb;
> +	struct drm_device *ddev = plane->dev;
>   	u32 lofs = plane->index * LAY_OFS;
>   	u32 x0 = newstate->crtc_x;
>   	u32 x1 = newstate->crtc_x + newstate->crtc_w - 1;
> @@ -792,6 +800,11 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	u32 val, pitch_in_bytes, line_length, paddr, ahbp, avbp, bpcr;
>   	enum ltdc_pix_fmt pf;
>   
> +	if (!pm_runtime_active(ddev->dev)) {
> +		DRM_DEBUG_DRIVER("crtc not activated");
> +		return;
> +	}
> +
>   	if (!newstate->crtc || !fb) {
>   		DRM_DEBUG_DRIVER("fb or crtc NULL");
>   		return;
> @@ -897,8 +910,14 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
>   	struct drm_plane_state *oldstate = drm_atomic_get_old_plane_state(state,
>   									  plane);
>   	struct ltdc_device *ldev = plane_to_ltdc(plane);
> +	struct drm_device *ddev = plane->dev;
>   	u32 lofs = plane->index * LAY_OFS;
>   
> +	if (!pm_runtime_active(ddev->dev)) {
> +		DRM_DEBUG_DRIVER("crtc already deactivated");
> +		return;
> +	}
> +
>   	/* disable layer */
>   	reg_clear(ldev->regs, LTDC_L1CR + lofs, LXCR_LEN);
>   
> 
