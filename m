Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8F258925
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754E36E5C5;
	Tue,  1 Sep 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903616E598
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:23:58 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200901042356epoutp0464320dd23b22d5d8fbec7a97df546f16~wjjdmelRK0186401864epoutp04r
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:23:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200901042356epoutp0464320dd23b22d5d8fbec7a97df546f16~wjjdmelRK0186401864epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598934236;
 bh=HEleXd154gvtjOYUHD9LEA9e4nbT1EF1jtvkB6V95Lg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=fHbUjcMUX7VjNoHDYeGGxorN1o8u3lh1bybhe2OGa3TsOb626C/xeQBURhn/t43BT
 Gxta8mlFhTn3YLG5UysuXMxoFNusqBPvjECrjccgUwJrDCMvMKmJnjq/kOS24XAFat
 TJBhYVYiOS9LkhWNsCXLBFODgHpjKOhg3VD+Hr5g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200901042356epcas1p17eab17f52fdcfdf244aa8ef518002097~wjjdcTY_m2881228812epcas1p1r;
 Tue,  1 Sep 2020 04:23:56 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BgYqC6zbhzMqYm7; Tue,  1 Sep
 2020 04:23:51 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 3E.84.28578.6DCCD4F5; Tue,  1 Sep 2020 13:23:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200901042349epcas1p4c0906c49619e7fcaf04eb28ac495eb90~wjjXIZqRX1004910049epcas1p4n;
 Tue,  1 Sep 2020 04:23:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901042349epsmtrp1b69f539acfdf8a54c5d044446e63d24c~wjjXHebWk0757407574epsmtrp1v;
 Tue,  1 Sep 2020 04:23:49 +0000 (GMT)
X-AuditID: b6c32a39-8dfff70000006fa2-32-5f4dccd6017f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 23.31.08303.5DCCD4F5; Tue,  1 Sep 2020 13:23:49 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901042349epsmtip161026905ebc73cab9b7dde031bca6d24~wjjW30X411709917099epsmtip1f;
 Tue,  1 Sep 2020 04:23:49 +0000 (GMT)
Subject: Re: [PATCH v4 62/78] drm/vc4: hdmi: Adjust HSM clock rate depending
 on pixel rate
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <95172a9a-e861-5e5d-bf51-2ec03c730237@samsung.com>
Date: Tue, 1 Sep 2020 13:36:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <5919dccdd4a792936e6cb7eb55983c530c9a468d.1594230107.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmnu61M77xBitmyFus7T3KYvF27mIW
 iytf37NZHGi8zGix6fE1VovLu+awWUy8vYHdYsaPf4wW22YtZ7NYd+s1m8WjqfcZHbg9mt4f
 Y/OYdf8sm8edc+fZPO53H2fy2Lyk3qP16C8Wj82nqz0+b5IL4IjKtslITUxJLVJIzUvOT8nM
 S7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulNJoSwxpxQoFJBYXKykb2dTlF9a
 kqqQkV9cYquUWpCSU2BZoFecmFtcmpeul5yfa2VoYGBkClSYkJ2x9d1RxoKHDhWf35xmb2C8
 atzFyMkhIWAiMW/dTrYuRi4OIYEdjBJNe/YyQjifGCW67y2FynxmlGg5ep0NpuX663VQiV2M
 Eht3vGcGSQgJvAdqOSEOYgsLxEgc69/PCGKLCJRLtHfuZwZpYBbYwSTRcWo62CQ2AS2J/S9u
 gNn8AooSV388BmvgFbCTWPJnDdhQFgEVif+HPrOA2KICYRInt7VA1QhKnJz5BCzOKRAvseDC
 alYQm1lAXOLWk/lMELa8xPa3c5ghrr7CIXG5NQPCdpFYt3IlC4QtLPHq+BZ2CFtK4mV/G5Rd
 LbHy5BGwLyUEOhgltuy/wAqRMJbYv3Qy0AIOoAWaEut36UOEFSV2/p7LCLGXT+Ld1x5WkBIJ
 AV6JjjYhiBJlicsP7jJB2JISi9s72SYwKs1C8s0sJB/MQvLBLIRlCxhZVjGKpRYU56anFhsW
 mCLH9iZGcBrWstzBOP3tB71DjEwcjIcYJTiYlUR4D+zyjhfiTUmsrEotyo8vKs1JLT7EaAoM
 34nMUqLJ+cBMkFcSb2hqZGxsbGFiaGZqaKgkzvvwlkK8kEB6YklqdmpqQWoRTB8TB6dUAxPb
 X12HR5liulwBRcw/SmXEX1YIVb5f92Pp6U2G2lVeZrNC9m07H3PDSHDZcb6DDxn6kg/yTAzK
 OvpbiqP8VcWz6sY899ooz6xjFpvn+6/Tu6L+YVGwU0DHS6Fjxtd++J3RT4pL33JZW+WscJvh
 80mv7d9UJpyw6b92/2HXd4eP4kvKHRtrIpZdLP6ux9UaMmV6jswnCX5VA/1Hh6LnKJzZuD3P
 Ya236lTDM1EhZzpjuZgv3wxtvijqvOhE+J+1vaaSD7dlJYivbZer9wt6fHD9ylydi3GaP1Zw
 9/F6VTivrXmeaFil8S9luwu3a9bc3Y8f/MhwMtWttNg4edoMXc5t2VWXdnCdYzKbc95svRJL
 cUaioRZzUXEiAD0MPpVMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWy7bCSnO7VM77xBjv6BC3W9h5lsXg7dzGL
 xZWv79ksDjReZrTY9Pgaq8XlXXPYLCbe3sBuMePHP0aLbbOWs1msu/WazeLR1PuMDtweTe+P
 sXnMun+WzePOufNsHve7jzN5bF5S79F69BeLx+bT1R6fN8kFcERx2aSk5mSWpRbp2yVwZWx9
 d5Sx4KFDxec3p9kbGK8adzFyckgImEhcf72OrYuRi0NIYAejxOWJB9ghEpIS0y4eZe5i5ACy
 hSUOHy6GqHnLKLFzwWQmkBphgRiJY/37GUFsEYFKic9zdjGDFDEL7GCS6Hp8mgWio5dJYsXm
 WWBVbAJaEvtf3GADsfkFFCWu/ngMFucVsJNY8mcNM4jNIqAi8f/QZxYQW1QgTGLnksdMEDWC
 EidnPgGLcwrESyy4sJoVxGYWUJf4M+8SM4QtLnHryXwmCFteYvvbOcwTGIVnIWmfhaRlFpKW
 WUhaFjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI5JLa0djHtWfdA7xMjEwXiI
 UYKDWUmE98Au73gh3pTEyqrUovz4otKc1OJDjNIcLErivF9nLYwTEkhPLEnNTk0tSC2CyTJx
 cEo1MPm/2tV82ngFY+TjmUn1b4ol1kptS7xp2D63a8O+/erGKy+xTn6rY1jbXv9QKt5H8sNP
 mYsTdmyeoSDLuvNP972LHq83qzMcCoh7Jj916W7pdC29W1b3H1h9X2kxp55viunvaaZKEyTP
 7zzkvfLHCcFtviU6X/YeC2HLWsz/axHjXwm3mi/nbBbmNst7ZKUbZl00CKyPqFtWbG3EnXxo
 4xqpxbu2NwtemtmvyPG7wc24UIX3whKuFc3XOVMn+8RoP3KZpbzvtHLGQcHDuy/pnZnnIVCi
 lBDccddepMMipXgtQ4pbbG71e4ftf1ZdmHdqf/RJw2npLErvj+wxUPPYXt3L/GNazv7J0o8n
 Xt/A8liJpTgj0VCLuag4EQC62TWmOAMAAA==
X-CMS-MailID: 20200901042349epcas1p4c0906c49619e7fcaf04eb28ac495eb90
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200708174513epcas1p2c059db88d8dad1d58aae3651b3c98c2b
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <CGME20200708174513epcas1p2c059db88d8dad1d58aae3651b3c98c2b@epcas1p2.samsung.com>
 <5919dccdd4a792936e6cb7eb55983c530c9a468d.1594230107.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/9/20 2:42 AM, Maxime Ripard wrote:
> The HSM clock needs to be setup at around 101% of the pixel rate. This
> was done previously by setting the clock rate to 163.7MHz at probe time and
> only check in mode_valid whether the mode pixel clock was under the pixel
> clock +1% or not.
> 
> However, with 4k we need to change that frequency to a higher frequency
> than 163.7MHz, and yet want to have the lowest clock as possible to have a
> decent power saving.
> 
> Let's change that logic a bit by setting the clock rate of the HSM clock
> to the pixel rate at encoder_enable time. This would work for the
> BCM2711 that support 4k resolutions and has a clock that can provide it,
> but we still have to take care of a 4k panel plugged on a BCM283x SoCs
> that wouldn't be able to use those modes, so let's define the limit in
> the variant.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 79 ++++++++++++++++-------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +-
>  2 files changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 17797b14cde4..9f30fab744f2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -53,7 +53,6 @@
>  #include "vc4_hdmi_regs.h"
>  #include "vc4_regs.h"
>  
> -#define HSM_CLOCK_FREQ 163682864
>  #define CEC_CLOCK_FREQ 40000
>  
>  static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
> @@ -326,6 +325,7 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
>  	HDMI_WRITE(HDMI_VID_CTL,
>  		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>  
> +	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>  	clk_disable_unprepare(vc4_hdmi->pixel_clock);
>  
>  	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
> @@ -423,6 +423,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>  	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
>  	bool debug_dump_regs = false;
> +	unsigned long pixel_rate, hsm_rate;
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> @@ -431,9 +432,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  		return;
>  	}
>  
> -	ret = clk_set_rate(vc4_hdmi->pixel_clock,
> -			   mode->clock * 1000 *
> -			   ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1));
> +	pixel_rate = mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1);
> +	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
>  		return;
> @@ -445,6 +445,36 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  		return;
>  	}
>  
> +	/*
> +	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
> +	 * be faster than pixel clock, infinitesimally faster, tested in
> +	 * simulation. Otherwise, exact value is unimportant for HDMI
> +	 * operation." This conflicts with bcm2835's vc4 documentation, which
> +	 * states HSM's clock has to be at least 108% of the pixel clock.
> +	 *
> +	 * Real life tests reveal that vc4's firmware statement holds up, and
> +	 * users are able to use pixel clocks closer to HSM's, namely for
> +	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
> +	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
> +	 * 162MHz.
> +	 *
> +	 * Additionally, the AXI clock needs to be at least 25% of
> +	 * pixel clock, but HSM ends up being the limiting factor.
> +	 */
> +	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
> +	ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
> +	if (ret) {
> +		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> +	if (ret) {
> +		DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
> +		clk_disable_unprepare(vc4_hdmi->pixel_clock);
> +		return;
> +	}

About vc4_hdmi->hsm_clock instance, usually, we need to enable the clock
with clk_prepare_enable() and then touch the clock like clk_set_rate().
I think that need to enable the clock before calling clk_set_rate().

When I tested this patchset, it is well working because I think that
vc4_hdmi->hsm_clock was already enabled on other side.

> +
>  	if (vc4_hdmi->variant->reset)
>  		vc4_hdmi->variant->reset(vc4_hdmi);
>  
> @@ -559,23 +589,9 @@ static enum drm_mode_status
>  vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>  			    const struct drm_display_mode *mode)
>  {
> -	/*
> -	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
> -	 * be faster than pixel clock, infinitesimally faster, tested in
> -	 * simulation. Otherwise, exact value is unimportant for HDMI
> -	 * operation." This conflicts with bcm2835's vc4 documentation, which
> -	 * states HSM's clock has to be at least 108% of the pixel clock.
> -	 *
> -	 * Real life tests reveal that vc4's firmware statement holds up, and
> -	 * users are able to use pixel clocks closer to HSM's, namely for
> -	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
> -	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
> -	 * 162MHz.
> -	 *
> -	 * Additionally, the AXI clock needs to be at least 25% of
> -	 * pixel clock, but HSM ends up being the limiting factor.
> -	 */
> -	if (mode->clock > HSM_CLOCK_FREQ / (1000 * 101 / 100))
> +	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> +
> +	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;
> @@ -1349,23 +1365,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  		return -EPROBE_DEFER;
>  	}
>  
> -	/* This is the rate that is set by the firmware.  The number
> -	 * needs to be a bit higher than the pixel clock rate
> -	 * (generally 148.5Mhz).
> -	 */
> -	ret = clk_set_rate(vc4_hdmi->hsm_clock, HSM_CLOCK_FREQ);
> -	if (ret) {
> -		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
> -		goto err_put_i2c;
> -	}
> -
> -	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> -	if (ret) {
> -		DRM_ERROR("Failed to turn on HDMI state machine clock: %d\n",
> -			  ret);
> -		goto err_put_i2c;
> -	}
> -
>  	/* Only use the GPIO HPD pin if present in the DT, otherwise
>  	 * we'll use the HDMI core's register.
>  	 */
> @@ -1413,9 +1412,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  err_destroy_encoder:
>  	drm_encoder_cleanup(encoder);
>  err_unprepare_hsm:
> -	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>  	pm_runtime_disable(dev);
> -err_put_i2c:
>  	put_device(&vc4_hdmi->ddc->dev);
>  
>  	return ret;
> @@ -1454,7 +1451,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
>  	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
>  	drm_encoder_cleanup(&vc4_hdmi->encoder.base.base);
>  
> -	clk_disable_unprepare(vc4_hdmi->hsm_clock);
>  	pm_runtime_disable(dev);
>  
>  	put_device(&vc4_hdmi->ddc->dev);
> @@ -1479,6 +1475,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
>  static const struct vc4_hdmi_variant bcm2835_variant = {
>  	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
>  	.debugfs_name		= "hdmi_regs",
> +	.max_pixel_clock	= 162000000,
>  	.cec_available		= true,
>  	.registers		= vc4_hdmi_fields,
>  	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 3f07aebe89f1..342f6e0227a2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -36,6 +36,9 @@ struct vc4_hdmi_variant {
>  	/* Set to true when the CEC support is available */
>  	bool cec_available;
>  
> +	/* Maximum pixel clock supported by the controller (in Hz) */
> +	unsigned long long max_pixel_clock;
> +
>  	/* List of the registers available on that variant */
>  	const struct vc4_hdmi_register *registers;
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
