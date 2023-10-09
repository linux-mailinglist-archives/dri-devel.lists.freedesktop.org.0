Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EAA7BE07A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 15:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDC310E118;
	Mon,  9 Oct 2023 13:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8978 seconds by postgrey-1.36 at gabe;
 Mon, 09 Oct 2023 13:40:30 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5606610E118
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 13:40:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399BAZnH029406;
 Mon, 9 Oct 2023 06:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1696849835;
 bh=gF3ltA5crJt+JrOf3lwJUGac88GUPpKqmKtpfO96kSo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ywhUeh3NcbHDhCo4C4TZLyH8RuZ7wfJcPY501IF/1caj3C1SDkrtW2l1Jq8c20zLi
 HYUJU5LYd7U2szDazrrzKPB5KZzV5OUT59NapIbhLHO4+n7H51gSTCASO78BIxt/cT
 NFkM9su9hYmh0KwXXnqgGzC9JKreG8nLAfPZL1Wc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399BAZJC006911
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Oct 2023 06:10:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 06:10:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 06:10:34 -0500
Received: from [172.24.227.6] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399BASAh024013;
 Mon, 9 Oct 2023 06:10:29 -0500
Message-ID: <3c6e6538-bce6-e9f0-4307-72b3ffe6030e@ti.com>
Date: Mon, 9 Oct 2023 16:40:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/tidss: Power up attached PM domains on probe
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20231009075018.2836020-1-devarsht@ti.com>
 <bmemgnq3emddmjsho3c3h4cj2fyyyp3xll73ozpsxxmxxcr3bn@lffrmuqqpbl3>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <bmemgnq3emddmjsho3c3h4cj2fyyyp3xll73ozpsxxmxxcr3bn@lffrmuqqpbl3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: nm@ti.com, j-choudhary@ti.com, j-luthra@ti.com, a-bhatia1@ti.com,
 praneeth@ti.com, tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, r-ravikumar@ti.com, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thanks for the review.

On 09/10/23 14:53, Maxime Ripard wrote:
> Hi Devarsh,
> 
> On Mon, Oct 09, 2023 at 01:20:18PM +0530, Devarsh Thakkar wrote:
>> Some SoC's such as AM62P have dedicated power domains
>> for OLDI which need to be powered on separetely along
>> with display controller.
>>
>> So during driver probe, power up all attached PM domains
>> enumerated in devicetree node for DSS.
>>
>> This also prepares base to add display support for AM62P.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>>  drivers/gpu/drm/tidss/tidss_drv.c | 76 +++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/tidss/tidss_drv.h |  5 ++
>>  2 files changed, 81 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>> index 4d063eb9cd0b..a703a27d17bf 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/of.h>
>>  #include <linux/module.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/pm_domain.h>
>>  
>>  #include <drm/drm_atomic.h>
>>  #include <drm/drm_atomic_helper.h>
>> @@ -114,6 +115,72 @@ static const struct drm_driver tidss_driver = {
>>  	.minor			= 0,
>>  };
>>  
>> +static int tidss_detach_pm_domains(struct tidss_device *tidss)
>> +{
>> +	int i;
>> +
>> +	if (tidss->num_domains <= 1)
>> +		return 0;
>> +
>> +	for (i = 0; i < tidss->num_domains; i++) {
>> +		if (tidss->pd_link[i] && !IS_ERR(tidss->pd_link[i]))
>> +			device_link_del(tidss->pd_link[i]);
>> +		if (tidss->pd_dev[i] && !IS_ERR(tidss->pd_dev[i]))
>> +			dev_pm_domain_detach(tidss->pd_dev[i], true);
>> +		tidss->pd_dev[i] = NULL;
>> +		tidss->pd_link[i] = NULL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tidss_attach_pm_domains(struct tidss_device *tidss)
>> +{
>> +	struct device *dev = tidss->dev;
>> +	int i;
>> +	int ret;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct device_node *np = pdev->dev.of_node;
>> +
>> +	tidss->num_domains = of_count_phandle_with_args(np, "power-domains",
>> +							"#power-domain-cells");
>> +	if (tidss->num_domains <= 1) {
>> +		dev_dbg(dev, "One or less power domains, no need to do attach domains\n");
>> +		return 0;
>> +	}
>> +
>> +	tidss->pd_dev = devm_kmalloc_array(dev, tidss->num_domains,
>> +					   sizeof(*tidss->pd_dev), GFP_KERNEL);
>> +	if (!tidss->pd_dev)
>> +		return -ENOMEM;
>> +
>> +	tidss->pd_link = devm_kmalloc_array(dev, tidss->num_domains,
>> +					    sizeof(*tidss->pd_link), GFP_KERNEL);
>> +	if (!tidss->pd_link)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < tidss->num_domains; i++) {
>> +		tidss->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
>> +		if (IS_ERR(tidss->pd_dev[i])) {
>> +			ret = PTR_ERR(tidss->pd_dev[i]);
>> +			goto fail;
>> +		}
>> +
>> +		tidss->pd_link[i] = device_link_add(dev, tidss->pd_dev[i],
>> +						    DL_FLAG_STATELESS |
>> +						    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
>> +		if (!tidss->pd_link[i]) {
>> +			ret = -EINVAL;
>> +			goto fail;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +fail:
>> +	tidss_detach_pm_domains(tidss);
>> +	return ret;
>> +}
> 
> My understanding is that this will be done automatically at probe time.
> Why do we need to roll our own there? A comment on top of the function
> and the commit log would help.

By default, the TI SCI power domain controller driver only powers up one power
domain associated with device, With AM62P, we now have separate power domains
for OLDI Tx ports (for more efficient power-saving control) which is different
from core DSS device power domain, so this patch powers on the associated
power domains too if enumerated in device-tree.

Regards
Devarsh

> 
> Thanks!
> Maxime
