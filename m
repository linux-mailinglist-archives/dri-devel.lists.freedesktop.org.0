Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18489FBD82
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 13:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6810E03F;
	Tue, 24 Dec 2024 12:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="YFi9Zbs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3960B10E472
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1735044441;
 bh=aPJ6ydAdvdNnVcVpPHJYbUDApdothXqe1OmXEwX1GuM=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:
 x-icloud-hme;
 b=YFi9Zbs7f4LygIMuRnfGAXJ8oAU/9NiGTlnsMwAwdl4a8TA148y4phA5sa53tvWn1
 wuyo3qCRvNidXq8BXE7SS6XZezmBPn36kbc9b4PlewqM4KmvENpNwql5lFJo8eLCM/
 rV7X0FHJAudDGIbDucP/wtt1tsqYh4IqQR8yDZm136vx5P9zlio1tRDO+usLuKn2Ji
 Oy2/Mosdtw1/XDgdas1WxNREnH2fDCfk4zeW4xz2HUVjbA2AnZAd0qugcGxt14mOB9
 r/wdDZ4qHr4sgJYQN0YxwRALPc+C4a8M9mVvJQwcNf0fN+FTNbWSRvCrQ2lTNJH4/l
 mvWeYVRv/tnmw==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 48DE04A0324;
 Tue, 24 Dec 2024 12:47:09 +0000 (UTC)
Message-ID: <534318f9-b040-4839-b6dc-585810ad8362@icloud.com>
Date: Tue, 24 Dec 2024 20:47:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zijun Hu <zijun_hu@icloud.com>
Subject: Re: [PATCH v4 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
 <20241223203309.00004d51@huawei.com>
Content-Language: en-US
In-Reply-To: <20241223203309.00004d51@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kDjRjbNqxndWcj5UTxaD9i644sdeCsbD
X-Proofpoint-GUID: kDjRjbNqxndWcj5UTxaD9i644sdeCsbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_04,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412240110
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

On 2024/12/24 04:33, Jonathan Cameron wrote:
> On Wed, 11 Dec 2024 08:08:06 +0800
> Zijun Hu <zijun_hu@icloud.com> wrote:
> 
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> Constify the following API:
>> struct device *device_find_child(struct device *dev, void *data,
>> 		int (*match)(struct device *dev, void *data));
>> To :
>> struct device *device_find_child(struct device *dev, const void *data,
>>                                  device_match_t match);
>> typedef int (*device_match_t)(struct device *dev, const void *data);
>> with the following reasons:
>>
>> - Protect caller's match data @*data which is for comparison and lookup
>>   and the API does not actually need to modify @*data.
>>
>> - Make the API's parameters (@match)() and @data have the same type as
>>   all of other device finding APIs (bus|class|driver)_find_device().
>>
>> - All kinds of existing device match functions can be directly taken
>>   as the API's argument, they were exported by driver core.
>>
>> Constify the API and adapt for various existing usages by simply making
>> various match functions take 'const void *' as type of match data @data.
> 
> There are a couple of places I noticed where you changed types
> that aren't related to the specific change this is making.
> They are almost certainly fine but I'd either like a specific note
> on that in this patch description or just change the elements
> that are directly affected by this change.
> 

okay, will correct commit message in v5.

v5 will mention these changes will bring extra code improvement as side
effects during achieving main purpose.

>>
>> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
>> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> 
>> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
>> index d778996507984a759bbe84e7acac3774e0c7af98..bfecd71040c2f4373645380b4c31327d8b42d095 100644
>> --- a/drivers/cxl/core/region.c
>> +++ b/drivers/cxl/core/region.c
> 
>> @@ -1722,10 +1722,12 @@ static struct cxl_port *next_port(struct cxl_port *port)
>>  	return port->parent_dport->port;
>>  }
>>  
>> -static int match_switch_decoder_by_range(struct device *dev, void *data)
>> +static int match_switch_decoder_by_range(struct device *dev,
>> +					 const void *data)
>>  {
>>  	struct cxl_switch_decoder *cxlsd;
>> -	struct range *r1, *r2 = data;
>> +	const struct range *r1, *r2 = data;
> 
> As below. I'd not touch type of things you don't need to touch.
> 
explained below.

>> +
>>  
>>  	if (!is_switch_decoder(dev))
>>  		return 0;
>> @@ -3176,9 +3178,10 @@ static int devm_cxl_add_dax_region(struct cxl_region *cxlr)
>>  	return rc;
>>  }
>>  
>> -static int match_root_decoder_by_range(struct device *dev, void *data)
>> +static int match_root_decoder_by_range(struct device *dev,
>> +				       const void *data)
>>  {
>> -	struct range *r1, *r2 = data;
>> +	const struct range *r1, *r2 = data;
> 
> From the point of view of keeping the patch to what it 'needs'
> to touch, should leave type of r1 alone.
> I've not looked at whether this causes any problems, just whether
> it is relevant to this change.
> 

1) i have checked that will not cause problem, may have code improvement

2) this change (2 lines) is simpler than below(3 lines)
   -	struct range *r1, *r2 = data;
   +    struct range *r1;
   +    const struct range *r2 = data;

3) r1 and r2 are used for range_contains() whose prototype was changed
to takes 2 const pointers recently.

4) make r1 & r2 keep the same type as original.

>>  	struct cxl_root_decoder *cxlrd;
>>  
>>  	if (!is_root_decoder(dev))
>> @@ -3189,11 +3192,11 @@ static int match_root_decoder_by_range(struct device *dev, void *data)
>>  	return range_contains(r1, r2);
>>  }
>>  
>> -static int match_region_by_range(struct device *dev, void *data)
>> +static int match_region_by_range(struct device *dev, const void *data)
>>  {
>>  	struct cxl_region_params *p;
>>  	struct cxl_region *cxlr;
>> -	struct range *r = data;
>> +	const struct range *r = data;
>>  	int rc = 0;
>>  
> 


