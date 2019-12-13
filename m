Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1611EC18
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5746ED0C;
	Fri, 13 Dec 2019 20:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329376ECFA;
 Fri, 13 Dec 2019 20:52:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 12:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="211479210"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga007.fm.intel.com with ESMTP; 13 Dec 2019 12:52:22 -0800
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 13 Dec 2019 12:52:22 -0800
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.96]) by
 FMSMSX151.amr.corp.intel.com ([169.254.7.125]) with mapi id 14.03.0439.000;
 Fri, 13 Dec 2019 12:52:22 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/4] drm/etnaviv: Use dma_resv locking wrappers
Thread-Topic: [PATCH 1/4] drm/etnaviv: Use dma_resv locking wrappers
Thread-Index: AQHVsfEe00DUW/MMX0uVJDAmNAcPPKe4ilCA
Date: Fri, 13 Dec 2019 20:52:21 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663EE150D92@fmsmsx107.amr.corp.intel.com>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-2-daniel.vetter@ffwll.ch>
 <20191213200826.GK624164@phenom.ffwll.local>
In-Reply-To: <20191213200826.GK624164@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2UwOWUyNGYtODQyZS00OTJiLWI1ZDItZWJiODk4ZDA0NjEzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNlBHdjJadWY4VkU2dWsyKzlwYWV0eHpORHpFTGh3VVFib21abnZqU3pRS3hZTWdvMUxVdHphSmEzZFFyN1JneiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Daniel Vetter
>Sent: Friday, December 13, 2019 3:08 PM
>To: DRI Development <dri-devel@lists.freedesktop.org>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; Intel Graphics Development
><intel-gfx@lists.freedesktop.org>; etnaviv@lists.freedesktop.org; Russell
>King <linux+etnaviv@armlinux.org.uk>; Vetter, Daniel
><daniel.vetter@intel.com>
>Subject: Re: [PATCH 1/4] drm/etnaviv: Use dma_resv locking wrappers
>
>On Mon, Nov 25, 2019 at 10:43:53AM +0100, Daniel Vetter wrote:
>> I'll add more fancy logic to them soon, so everyone really has to use
>> them. Plus they already provide some nice additional debug
>> infrastructure on top of direct ww_mutex usage for the fences tracked
>> by dma_resv.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: etnaviv@lists.freedesktop.org
>
>Ping for some review/acks.
>
>Thanks, Daniel
>
>> ---
>>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> index aa3e4c3b063a..947b21868e72 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> @@ -113,7 +113,7 @@ static void submit_unlock_object(struct
>etnaviv_gem_submit *submit, int i)
>>  	if (submit->bos[i].flags & BO_LOCKED) {
>>  		struct drm_gem_object *obj = &submit->bos[i].obj->base;
>>
>> -		ww_mutex_unlock(&obj->resv->lock);
>> +		dma_resv_unlock(obj->resv);
>>  		submit->bos[i].flags &= ~BO_LOCKED;
>>  	}
>>  }
>> @@ -133,8 +133,7 @@ static int submit_lock_objects(struct
>etnaviv_gem_submit *submit,
>>  		contended = i;
>>
>>  		if (!(submit->bos[i].flags & BO_LOCKED)) {
>> -			ret = ww_mutex_lock_interruptible(&obj->resv-
>>lock,
>> -							  ticket);
>> +			ret = dma_resv_lock(obj->resv, ticket);

Should this be dma_resv_lock_interruptible()?

Mike

>>  			if (ret == -EALREADY)
>>  				DRM_ERROR("BO at index %u already on
>submit list\n",
>>  					  i);
>> @@ -161,8 +160,7 @@ static int submit_lock_objects(struct
>etnaviv_gem_submit *submit,
>>  		obj = &submit->bos[contended].obj->base;
>>
>>  		/* we lost out in a seqno race, lock and retry.. */
>> -		ret = ww_mutex_lock_slow_interruptible(&obj->resv->lock,
>> -						       ticket);
>> +		ret = dma_resv_lock_slow_interruptible(obj->resv, ticket);
>>  		if (!ret) {
>>  			submit->bos[contended].flags |= BO_LOCKED;
>>  			slow_locked = contended;
>> --
>> 2.24.0
>>
>
>--
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
