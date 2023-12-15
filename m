Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D58145DC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 11:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810710E0A7;
	Fri, 15 Dec 2023 10:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BD510E0A7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702637003; x=1734173003;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=f7VRIiLa3T6OBdzmDLTSHTs9wRWszoDvWFGIdhTryoo=;
 b=WfC7kyu7g0WXvrQfa9EWxIGYIQY5Ah3rMQzJyyM4wOukOus2mOmZv5u/
 wVLmPrBhUelXKzfgAEqBwP6Yy/tyLIvZrfMsDD+ddb7tHaZ8321iPdrIg
 paiEKVfNQamh+Pt+DWxtGdPf7lW6dCx+/x+8E8QvSgtWRajAWv75f7hAj
 AQwSnWIZun5oEPjooUs3U/MprWSRFRUSm8lq9b6D+be7rXng4toH/2mFD
 FEjLVsB/klVIcl3QL+DDx6xHUVA746xwgksFvUBYtAalneZhqKIIevXDO
 FNoc15/ReY49ioCii2msDXkL0vE8eRWh2MOXETmX07l36RAIkvDQw7z96 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394134707"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="394134707"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 02:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="898098679"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="898098679"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 02:43:19 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] dma-buf: Fix dma reservation with zero fences
In-Reply-To: <3a47cd8d-fc54-44b0-98ae-e90e81d53f91@amd.com>
References: <20231214120824.655946-1-mika.kuoppala@linux.intel.com>
 <3a47cd8d-fc54-44b0-98ae-e90e81d53f91@amd.com>
Date: Fri, 15 Dec 2023 12:39:14 +0200
Message-ID: <87h6kj4unh.fsf@mkuoppal-desk>
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian K=C3=B6nig <christian.koenig@amd.com> writes:

> Am 14.12.23 um 13:08 schrieb Mika Kuoppala:
>> Driver can initialize without any fences. If so
>> roundup_power_of_two will overflow as it will try to
>> subtract one from initial value before shift,
>> (1 << fls_long(-1)).
>
> Ah, yes that reminds me that I wanted to take care of this as well.
>
> But solving it like this is the wrong approach. A couple of driver=20
> calculate the number of fences needed based on userspace input. If that=20
> results in zero then you certainly have a bug in your driver.
>
> Since calling dma_resv_reserve_fences() with num_fences=3D=3D0 does make=
=20
> much sense we should really just warn about it and just return early=20
> from the function.

Sounds like a plan. I will fix our driver to just omit the call
if no fences (yet).

Thanks,
-Mika

> Regards,
> Christian.
>
>
>>
>> Fix this using default (4) if num_fences is zero.
>>
>> Another more radical option would be to return error on
>> zero but that would need a callsite comb.
>>
>> Caught-by: UBSAN
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 38b4110378de..f5ad3ecd0d4f 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -192,7 +192,10 @@ int dma_resv_reserve_fences(struct dma_resv *obj, u=
nsigned int num_fences)
>>   			return 0;
>>   		max =3D max(old->num_fences + num_fences, old->max_fences * 2);
>>   	} else {
>> -		max =3D max(4ul, roundup_pow_of_two(num_fences));
>> +		if (num_fences)
>> +			max =3D max(4ul, roundup_pow_of_two(num_fences));
>> +		else
>> +			max =3D 4ul;
>>   	}
>>=20=20=20
>>   	new =3D dma_resv_list_alloc(max);
