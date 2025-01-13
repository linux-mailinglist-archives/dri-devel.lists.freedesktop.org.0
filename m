Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DDAA0BC49
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F5110E6E5;
	Mon, 13 Jan 2025 15:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BNqboy7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7061D10E6E5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:42:54 +0000 (UTC)
Message-ID: <c552b800-b3d5-477c-b7f8-53761e40ea36@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736782942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+onY5bWJ3UEue2WR6kGb2y8tSjvnXFzhPBeSezdlb0=;
 b=BNqboy7dUqLPiEtmuCOiHGNuELeEfFbytP2xKd+JiAWjx6Ys+SZq2GQVEAF4LDFjzC844n
 +EkLYo5tCKwHUagkV34Rh2aMQdI5cU1vQptj3Nydnu2ZkFT3Iek2JIA435sDcucQiRR56c
 zO0xakgHYlb7ZI6Tr3o0TLx1abkkEDA=
Date: Mon, 13 Jan 2025 21:12:02 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v6 05/12] drm/bridge: cdns-dsi: Fix the clock variable for
 mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-6-aradhya.bhatia@linux.dev>
 <urkosp5w2ush3br6xvxx3vpxvkea4tmaeas3vvlcb54ofknjat@tnievb37sfx4>
Content-Language: en-US
In-Reply-To: <urkosp5w2ush3br6xvxx3vpxvkea4tmaeas3vvlcb54ofknjat@tnievb37sfx4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On 1/13/25 15:10, Dmitry Baryshkov wrote:
> On Sun, Jan 12, 2025 at 12:57:31AM +0530, Aradhya Bhatia wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> Allow the D-Phy config checks to use mode->clock instead of
>> mode->crtc_clock during mode_valid checks, like everywhere else in the
>> driver.
> 
> Please describe why, not what.

It is unclear why the rest of the code uses mode->crtc_* parameters at
all during the non mode validation phase.

But during that phase, the crtc_* parameters are not generated
(duplicated in this case) from the regular ones, and so the validation
fails. The patch prevents that from happening by streamlining with
other instances.

I will update the commit text with this.

Regards
Aradhya

> 
>>
>> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> ---
>>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> index 3b3c45df1399..9c743fde2861 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> @@ -568,13 +568,14 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
>>  	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
>>  	unsigned long dsi_hss_hsa_hse_hbp;
>>  	unsigned int nlanes = output->dev->lanes;
>> +	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
>>  	int ret;
>>  
>>  	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
>>  	if (ret)
>>  		return ret;
>>  
>> -	phy_mipi_dphy_get_default_config(mode->crtc_clock * 1000,
>> +	phy_mipi_dphy_get_default_config(mode_clock * 1000,
>>  					 mipi_dsi_pixel_format_to_bpp(output->dev->format),
>>  					 nlanes, phy_cfg);
>>  
>> -- 
>> 2.34.1
>>
> 
