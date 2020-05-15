Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE611D4817
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CCF6E39C;
	Fri, 15 May 2020 08:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AED6E3AC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:26:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F8PsoG018359;
 Fri, 15 May 2020 03:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589531154;
 bh=wo1viBSz+UU+XEhVTlUn5Xt1kcyL3FUqz2ByY4yEDj0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fF1k2IGxGrOuos+bQoXmh+BExWfMIoCXLGLzSyjSI9R83lttfFDtFRvwACPnEySme
 PH/wbUwkvzzDwyObKKDPTLJeHGuxKnbxq68ke8RZ9DfbSfosxoxJxYBNOOoV2XQ7uM
 s63rJZAwhKOKyjRuGQuFJ/7HJPF2teMoSdYUUeTk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F8PsvU086517
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 May 2020 03:25:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:25:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:25:54 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F8Pl1Z008089;
 Fri, 15 May 2020 03:25:48 -0500
Subject: Re: [PATCH v1 02/18] drm/tilcdc: use devm_of_find_backlight
To: Sam Ravnborg <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>, Jingoo
 Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
References: <20200514191001.457441-1-sam@ravnborg.org>
 <20200514191001.457441-3-sam@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9e234824-3cf6-ead4-561b-70c1966ac5fd@ti.com>
Date: Fri, 15 May 2020 11:25:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514191001.457441-3-sam@ravnborg.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/05/2020 22:09, Sam Ravnborg wrote:
> Look up backlight device using devm_of_find_backlight().
> This simplifies the code and prevents us from hardcoding
> the node name in the driver.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>   drivers/gpu/drm/tilcdc/tilcdc_panel.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
