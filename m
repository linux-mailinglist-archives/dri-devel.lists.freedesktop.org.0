Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29C7686C25
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 17:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E140910E18D;
	Wed,  1 Feb 2023 16:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9C10E18D;
 Wed,  1 Feb 2023 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OITP1I6H+zo4Bt+dgUjPEOIxUPOIlD+1eS8Lgl3f+30=; b=oy0k0LH2gOOXKcO2U0/S5fMUl/
 glCRwk8k6wwA6jio+Wt7usNyW+CaUqjj7FSeUoAKl6L7ZW5eu4PJTAh//BoNAEaPwC7M1kdE2O6mr
 iWgERuRyTiYadFZHBKIFAZgSXdLY9smvrR3V4GoiXdY7Z7xuV01m1HthDPLiMmWeZcWEB1ijKcR/A
 bRkUc1Hc8jyHnkbc5Q4n9GxYbOqd3tq1x7NBnus/AyMQDl7Jvtisf9+T6+x9ZdRyNt/E7ufmIVO05
 x/oZfzXWtcXKDsVk2z/hk9TZaakyCry/jy2bfhFqRokzB+uwGFDjfwN+oUxzBAqWbXQ4f9OYs7blD
 D/X3HN8g==;
Received: from [187.10.60.187] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pNGMq-006Vmp-76; Wed, 01 Feb 2023 17:53:52 +0100
Message-ID: <f7c6a511-4112-6177-29d9-3e431839e6ac@igalia.com>
Date: Wed, 1 Feb 2023 13:53:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>, Luben Tuikov
 <luben.tuikov@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <52dbfde8-8865-6b30-c32f-33cff2c87fcc@gmail.com>
 <CADnq5_NLHqXxqcVMJRgxmc8cJfu6N0HML=cfETvijimimtoWbQ@mail.gmail.com>
 <8caaabda-25d3-61bb-a541-f81f851115c0@amd.com>
 <8701ac2b-8ac9-a477-8d18-e2bc334ad201@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <8701ac2b-8ac9-a477-8d18-e2bc334ad201@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2023 13:21, Luben Tuikov wrote:
> Hi Guilherme,
> 
> Since setting sched->ready to false, seems to be taking place in, directly amdgpu_ring_fini()
> and in amdgpu_fence_driver_sw_fini() indirectly as that function calls drm_sched_fini()
> which sets it to false, we seem to have two competing policies of,
> "set ready to false to show that _fini() was called, and set to false to disable IB submissions".
> 
> To that effect, your patch is generally correct, as it would be the case of an early failure
> and unroll from (indirectly) amdgpu_device_init_schedulers().
> 
> Please resubmit your patch but using .ops as Christian suggested, as .name is sufficient,
> but .ops is necessary.
> 
> On a side-note: in the future we should probably discern between
> "this ring has an initialized and working scheduler" (looking up at DRM), from
> "this ring can take on IBs to send them down to the hardware" (looking down at hardware).
> Sched->ready seems to be overloaded with these disparate states, and this is why you need
> to use .ops to guard calling drm_sched_fini().
> 
> Regards,
> Luben

Thanks a lot Luben, makes perfect sense!

Also, thanks for everyone that provided feedback here, very interesting
discussion.

Submitted V2:
https://lore.kernel.org/dri-devel/20230201164814.1353383-1-gpiccoli@igalia.com/
Cheers,


Guilherme
