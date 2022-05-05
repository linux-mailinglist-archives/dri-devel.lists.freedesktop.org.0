Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112551C659
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A71A10E9D9;
	Thu,  5 May 2022 17:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7E10E9D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 17:40:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 73DD483F4C;
 Thu,  5 May 2022 19:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651772450;
 bh=yDL+EIKGDMlakCG7m5Zsqqs/AOTcisCsQ/cUKeLPBxQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wez2A4Su77HG4EG2kvUJCO/zaxRbmn9xtFj39ChYxxGETnt7GGRV/vt0P3UtKctn2
 xRviBGv9aIBTa3G8pD8e6coArbxZHyRODgNGgE7ZTsi+Sfj/8sMjWJBhgcllkjfT4f
 qSCAsjFUI5nwkHL+YymQpBh9NKOkb5H7ms/1BZGs+oFHw6T5K3rxs8zvPxNY33dJm4
 lj/p/v9GNqADpgDQ02vL2HZ2QvzLjn7K5WVkRkF1Z49SFBWpoQjod5kjKcFvIB1XUt
 4C5aB50/VGGG55DU/WWTAqeIw4QF0tkZ2agk5KiruVTAvOgWh3MRwmfUTuF6McY9hj
 85WnpEhcLb5sw==
Message-ID: <24f18d45-09d9-05b6-b1ad-9ee2854c53ec@denx.de>
Date: Thu, 5 May 2022 19:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/stm: dsi: Enable wrapper glue regulator early
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 dri-devel@lists.freedesktop.org
References: <20220429204519.241549-1-marex@denx.de>
 <56f6fc01-4f33-b240-5539-492b2c115476@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <56f6fc01-4f33-b240-5539-492b2c115476@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robert.foss@linaro.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 09:59, Raphael Gallais-Pou wrote:
> Hi Marek,

Hi,

[...]

>> @@ -499,8 +512,16 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
>> +
>> +	ret = dw_mipi_dsi_phy_regulator_on(dsi);
>>   	clk_disable_unprepare(pclk);
>>   
>> +	if (ret) {
>> +		DRM_ERROR("%s: Failed to enable wrapper regulator, ret=%d\n",
>> +			  __func__, ret);
>> +		goto err_dsi_probe;
>> +	}
>> +
> 
> I have no problem until here. If I understand this correctly, it enables the regulator during all the life of the driver.
> 
> If you feel an urge to merge this patch into the Linux kernel, the st display team could gladly do it because it enables more hardware bridges. However another solution could be to rework a bit the regulator part of the driver so that you would have only device tree to change, introducing a 'reg-always-on' property.
> 
> This driver needs in fact a bit of a rework with the power management. A solution could be to move the regulator-related part in dw_mipi_dsi_stm_power_on/off() so that it is only activated when needed. Those functions would integrate the enabling of the regulator, the switch for the internal regulator, and eventually handle the PLL if it cannot lock when the regulator is off.
> 
> With the DT property, the power management would be only in the probe()/remove(). In that way the DSI bridges would have the logic they need to work.
> 
> Ultimately there is two possibilities :
>   * You really need this patch to be merged asap
>   * You are ok to wait until we send the solution described above
> 
> If you want to write those patches (each for DT and regulator), feel free to do it.
> 
> What do you think about it ?

Maybe a more generic question first -- is there a way to pull the data 
lanes to LP11 without enabling the regulator ?

Also note that you likely want to wait with this patch, there is likely 
soon going to be a discussion about how to handle all those different 
requirements for initial DSI LP states and clock needed by DSI bridges, 
encoding such policy into DT is not the right approach.
