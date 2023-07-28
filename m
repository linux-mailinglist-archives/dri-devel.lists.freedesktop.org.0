Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFAF766D1B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5A110E1FA;
	Fri, 28 Jul 2023 12:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B1410E1FA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 12:22:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPMTE-00071I-In; Fri, 28 Jul 2023 14:21:24 +0200
Message-ID: <f511c66b-10b3-0af1-3bb5-801060c3a55e@pengutronix.de>
Date: Fri, 28 Jul 2023 14:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] drm/panel-simple: allow LVDS format override
Content-Language: en-US, de-DE
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20230523-simplepanel_support_nondefault_datamapping-v3-0-78ede374d3d9@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v3-3-78ede374d3d9@pengutronix.de>
 <1cd00596-604d-4fbf-b9d1-9ee0f05cb373@kadam.mountain>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <1cd00596-604d-4fbf-b9d1-9ee0f05cb373@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, kernel@pengutronix.de,
 patchwork-jzi@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

thanks for your feedback.

On 7/28/23 14:03, Dan Carpenter wrote:
> On Fri, Jul 28, 2023 at 01:54:40PM +0200, Johannes Zink wrote:
>> @@ -556,7 +602,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>>   	struct device_node *ddc;
>>   	int connector_type;
>>   	u32 bus_flags;
>> -	int err;
>> +	int err, ret;
> 
> I don't like this at all...
> 
>>   
>>   	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>>   	if (!panel)
>> @@ -601,6 +647,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>>   			panel_simple_parse_panel_timing_node(dev, panel, &dt);
>>   	}
>>   
>> +	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
>> +		/* Optional data-mapping property for overriding bus format */
>> +		ret = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
>> +		if (ret)
>> +			goto free_ddc;
> 
> This *looks* like we are returning an error but we aren't.  I think we
> should be.  If not then we need to have a discussion about that and
> add some comments.
> 

Good catch. This should actually be err instead of ret. This way we'd make sure
to return -ENOMEM from panel_simple_probe() in case an error occured due
to devm_kmemdup failing in panel_simple_override_nondefault_lvds_datamapping().

I'll send a v4 with that fixed.

Thanks for having my back!
Johannes

> regards,
> dan carpenter
> 
>> +	}
>> +
>>   	connector_type = desc->connector_type;
>>   	/* Catch common mistakes for panels. */
>>   	switch (connector_type) {
>>
>> -- 
>> 2.39.2
> 
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

