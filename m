Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744974E8A2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C59810E331;
	Tue, 11 Jul 2023 08:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86C810E330
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689062597; x=1720598597;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=eyGG6dzB9CZXuAsyxkAbXw//cArH8N9tfew36H3vcQI=;
 b=XenKIbs3c8CpPK7EhUozwdZh/K1gajc2o0sV84iBKlQ2hmcmG44bKCyq
 Zm+3CbKNGv2fx7forYAUv/e1eNLU3j5VXUsowZmf/ZTveC3tKn29aFKCZ
 14rl3OdbBcSAUQLPClLhrL+2TjYCi+VTrANkRusUYYxdSpkeMA7qC8+kd
 a0jA3oEUogT5D85x2nGmUw8CJBNeshLlNa99DMVcG/DEEhuT73axEPO4H
 s/7zgs32CNPvUPfdj23vmtMEirdwq+jWOKxpoV+5TGOrq76BvraG34k88
 KdbxmYPHM3D/tVqU3v8klfmyAVttX9Mobvmh3IdOrcSTkji3rbTb4ithF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430643159"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="430643159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 01:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="715108432"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="715108432"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 01:03:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Li Yi <liyi@loongson.cn>
Subject: Re: [PATCH] drm/loongson: Fix two warnings because of passing wrong
 type
In-Reply-To: <afbbda82-0635-bef3-b9ff-d5c6575631b8@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230710100931.255234-1-suijingfeng@loongson.cn>
 <87h6qcjc46.fsf@intel.com>
 <afbbda82-0635-bef3-b9ff-d5c6575631b8@loongson.cn>
Date: Tue, 11 Jul 2023 11:03:11 +0300
Message-ID: <87edlej2o0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023, suijingfeng <suijingfeng@loongson.cn> wrote:
> Hi,
>
> On 2023/7/10 18:26, Jani Nikula wrote:
>> On Mon, 10 Jul 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>> When accessing I/O memory, we should pass '__iomem *' type instead of
>>> 'void *' simply, otherwise sparse tests will complain. After applied
>>> this patch, the following two sparse warnings got fixed.
>> Usually the commit message should explain why it's okay to cast away the
>> warning.
>>
>> Because realistically this doesn't "fix" the warning, this merely hides
>> it.
>
>
> My understanding is that a point itself is just a variable where store a=
=20
> address,
>
> if this address originally point to I/O memory,
>
> then, we can other cast it to u64 type, then cast it back to '__iomem *'=
=20
> again.
>
> as long as the type's=C2=A0 bit-width is width enough to store this addre=
ss,=20
> we won't lost the information.
>
>
> 'void *' or 'u64' is just a intermediate represent of the address.
>
> we can other cast it to u64 type, then cast it back to 'void __iomem *'=20
> or 'void *' again.
>
>
> Why it's okay ? My answer is that
>
> As long as a address is really point to the I/O memory, cast it to 'void=
=20
> __iomem *' is OK.
>
> As long as a address is really point to the system memory, cast it to=20
> 'void *' is OK.

The point of __iomem is to have sparse help you in tracking that, so you
don't accidentally mix up the two.

BR,
Jani.


>
>
>> BR,
>> Jani.
>>
>>> 1) drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35:
>>>     sparse:     expected void volatile [noderef] __iomem *
>>>     sparse:     got void *kptr
>>>
>>> 2) drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51:
>>>     sparse:     expected void const volatile [noderef] __iomem *
>>>     sparse:     got void *kptr
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202307100243.v3hv6aes-lkp=
@intel.com/
>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> ---
>>>   drivers/gpu/drm/loongson/lsdc_benchmark.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/dr=
m/loongson/lsdc_benchmark.c
>>> index b088646a2ff9..36e352820bdb 100644
>>> --- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
>>> +++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
>>> @@ -24,7 +24,7 @@ static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo =
*src_bo,
>>>   	lsdc_bo_kmap(dst_bo);
>>>=20=20=20
>>>   	while (n--)
>>> -		memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
>>> +		memcpy_toio((void __iomem *)dst_bo->kptr, src_bo->kptr, size);
>>>=20=20=20
>>>   	lsdc_bo_kunmap(src_bo);
>>>   	lsdc_bo_kunmap(dst_bo);
>>> @@ -39,7 +39,7 @@ static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo =
*src_bo,
>>>   	lsdc_bo_kmap(dst_bo);
>>>=20=20=20
>>>   	while (n--)
>>> -		memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
>>> +		memcpy_fromio(dst_bo->kptr, (void __iomem *)src_bo->kptr, size);
>>>=20=20=20
>>>   	lsdc_bo_kunmap(src_bo);
>>>   	lsdc_bo_kunmap(dst_bo);
>

--=20
Jani Nikula, Intel Open Source Graphics Center
