Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F452C4EA3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 07:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DF789D56;
	Thu, 26 Nov 2020 06:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FAF89D56
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 06:19:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AQ6Ja20042813;
 Thu, 26 Nov 2020 00:19:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606371576;
 bh=e4U46c/ZSWjtdN/RPRLl1RQ1O+XoGB2Xmee9a5TINmg=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=brlZupJw8a+dBQPyhJEqKe1cHWhEfpGdi44KHI7/OpJbwgUGOvHVbCfZe/lSOMbvb
 iip+p4b6SFFai9jYp0m/oD+eg4kib50eKS3SLwcdysO2ZzL4zc24ev4Ib5vKRMUObi
 8yMZnUiujnLe1M/iCQHpLqw93n3iN0jQ6ZJjw2qs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AQ6Jaso064916
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Nov 2020 00:19:36 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 26
 Nov 2020 00:19:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 26 Nov 2020 00:19:36 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AQ6JYCb102804;
 Thu, 26 Nov 2020 00:19:35 -0600
Subject: Re: [PATCH] drm/omap: dmm_tiler: fix return error code in
 omap_dmm_probe()
To: Thomas Zimmermann <tzimmermann@suse.de>, Yang Yingliang
 <yangyingliang@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20201117061045.3452287-1-yangyingliang@huawei.com>
 <04c96207-3c67-0cab-d3e7-919b96fbb46b@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5b671522-1a98-3935-33e6-bfa307debb53@ti.com>
Date: Thu, 26 Nov 2020 08:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04c96207-3c67-0cab-d3e7-919b96fbb46b@suse.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2020 15:41, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.11.20 um 07:10 schrieb Yang Yingliang:
>> Return -ENOMEM when allocating refill memory failed.
>>
>> Fixes: 71e8831f6407 ("drm/omap: DMM/TILER support for OMAP4+ platform")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
>> index 42ec51bb7b1b..7f4317248812 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
>> @@ -889,6 +889,7 @@ static int omap_dmm_probe(struct platform_device *dev)
>>  					   &omap_dmm->refill_pa, GFP_KERNEL);
>>  	if (!omap_dmm->refill_va) {
>>  		dev_err(&dev->dev, "could not allocate refill memory\n");
>> +		ret = -ENOMEM;
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks for the patch. I'll add it to drm-misc-next. There are more such
> errors here. If the very first allocation fails, the function returns
> -EFAULT, which makes no sense.

Indeed. -EFAULT is quite an odd default value for ret... I'll drop the default and assign a real
error value where needed.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
