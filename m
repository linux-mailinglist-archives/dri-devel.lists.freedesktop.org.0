Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6C62C147
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D6A10E4B9;
	Wed, 16 Nov 2022 14:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A02810E06D;
 Wed, 16 Nov 2022 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668610069; x=1700146069;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZF0I5ON9tHhKpJFmn+7j3wXzHpVRTkjkQdVNIdb6gGo=;
 b=hGVtyWWC6EulIhdpU1daho+FiUUTQ45WgL7RlYghFRXEzcFX6A9u0K2R
 KhxZl6mp5+uQ8PQHVp7FOzm7jHriomIikDa03fQ3ChNQcJzZnJpZIGxhU
 kOzUfjvp0e4vWkAxONq9yZwv/R+F/gVOGACsce5+UttlfUEy3GMcaJ/Y1
 ctq7AkgNC5Yzj5OOet+VnaxqAWHvrF4MRrHOJyWx8yrzmnvy5VgS33Ici
 qc8zCCgT/40HC6QREa3T+r9Jc/8QHV66Z7a955BBORHtV7uM+mAfp2IS+
 Ywvbl1CEwr59pgvVcu0Ho8SZtK2Gm4LBPJJHmE75fzQtFvxDY0FC62Yw2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295923608"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="295923608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:47:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="641667105"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="641667105"
Received: from wenlian1-mobl1.ger.corp.intel.com (HELO [10.213.209.198])
 ([10.213.209.198])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:47:45 -0800
Message-ID: <03dc2d0b-5766-3305-daa5-6088c87db037@linux.intel.com>
Date: Wed, 16 Nov 2022 14:47:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] drm/etnaviv: allocate unique ID per drm_file
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20220916151205.165687-1-l.stach@pengutronix.de>
 <20220916151205.165687-2-l.stach@pengutronix.de>
 <20221116131802.GA12239@pengutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221116131802.GA12239@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/11/2022 13:18, Philipp Zabel wrote:
> On Fri, Sep 16, 2022 at 05:12:04PM +0200, Lucas Stach wrote:
>> Allows to easily track if several fd are pointing to the same
>> execution context due to being dup'ed.
>>
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 3 +++
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.h | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> index 1d2b4fb4bcf8..b69edb40ae2a 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>> @@ -49,6 +49,7 @@ static void load_gpu(struct drm_device *dev)
>>   static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
>>   {
>>   	struct etnaviv_drm_private *priv = dev->dev_private;
>> +	static atomic_t ident = ATOMIC_INIT(0);
>>   	struct etnaviv_file_private *ctx;
>>   	int ret, i;
>>   
>> @@ -56,6 +57,8 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
>>   	if (!ctx)
>>   		return -ENOMEM;
>>   
>> +	ctx->id = atomic_inc_return(&ident);
> 
> I suppose we can ignore that this could theoretically wrap around.

Depends on your usecases - if you can envisage a long running client, 
say the compositor, while other clients come and go then eventually 
these will not be unique and will break the fdinfo spec. Hence I used a 
cyclic xarray in i915 (aka idr). I would recommend you just do that and 
remove future debug sessions around the area of "why does gputop show 
nonsense all of a sudden".

Regards,

Tvrtko

> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
