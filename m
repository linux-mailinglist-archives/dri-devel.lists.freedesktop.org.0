Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D76EB08B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366F610E2FE;
	Fri, 21 Apr 2023 17:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10B210E0FD;
 Fri, 21 Apr 2023 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682098047; x=1713634047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=G6ykw53ucbYuDviFxstZUeRqgb+Fpsq4wJxko0VcDG0=;
 b=XDRMAXtYfC0OofxIkVYXWmlTwwL6DyRbWn5jGT1Rxdx41FvvF8WuT+f1
 5uQNLSTmqk4v3/hJS5XrimJ2KbW7kvEQWZx7c9jdp/1fLuIPi83pLa286
 t8myJapahGJoe1eWZ81hYw4ti6kkDmg5kFje+5MFokXHDljHAHKLhwT1P
 /O0jkKv6OqILlVKNgweL0JYmkuuGHxGX588DIpH8OHqg7ajLLvM+V9zrp
 isY1G7f+yXAQRYZVqe2E38nU2m3YNOE0bxdxLJ4XaySF4kJoMPkof+Pw4
 k75fqe9jjeG66WvJTL6nAGNgk1+DAV+WhXcS11kQ1DpDz3o2pOnbjN+hc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="343527451"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
 d="scan'208,217";a="343527451"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761641161"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
 d="scan'208,217";a="761641161"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 10:27:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 10:27:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 10:27:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 10:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU7a9reQPP7dLtvpf/HD0T/XuYZHpt/s72zAVQA1CbsPnd9UpKryP6lViw4yG62MPCBmGNqAuo99CIJGY/qNqpOZJ99zR45MLwZWk2iFVDcBAF3ADcK+nPgAODw/Ba7Izi//oRxeFgNTDQRKR6n4jexjwIRNUl1ih1tkexWU9Myu85jNo1OwCvrkwupETYHg50aHIcPOLD7sXzqE0DDvfsMknLNWggmGbDej4YmSMHwxMW9EuHfeyVuJmdjDE+LdHprTbedQdJcyeoa2+S/zYMfO3a7YvQHV5nXVDK42dEOWcfG9BIlZLjnbM5habzMaZukwKXKzv2g3v/6AB5JVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAkbOdMeOJb/356nTxG83pnX07QBeNKD3wJLZN2lYQI=;
 b=kuWg07+FEo69hIj84QND3xl4NxTSl9xaOKZxQRflq1CQoYZstx48r8H7Ygt4JKVK6EZVI7e1GMf4noRljOIgJTxa+41oIw1XkV1juYbR2mLbZPEQfgdBuYVADug1UiVzp7JzPChX49nu4Aku62zQebqDcouTC/F2ggaH0QpR6lYuVnfYLrBY560kqFQG2zpIhJEbtUCMOk66IqaNHs4zhgBh0sWLvzdFS0e8bo/7K4mrd42bWoLrR8Gyz8hGYnAnbhJUjBbnG1+ooirqByI3Rycc+wDf+mOxuk/IFL4XMiWvz8PrYjvemWzrTz4gKIsxnJJvzHTOa4oNykqM08hGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 17:27:23 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 17:27:22 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Thread-Topic: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Thread-Index: AQHZcxKnCuG3NwvExEaiiwkKEl7V0K80qqoAgAFaUAA=
Date: Fri, 21 Apr 2023 17:27:22 +0000
Message-ID: <BYAPR11MB2567042124B3E0D09E1696489A609@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-4-fei.yang@intel.com>
 <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH8PR11MB6927:EE_
x-ms-office365-filtering-correlation-id: 3213f02f-a999-433e-6e5e-08db428daadb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0sspQPhClfobV2qkwRzTALbqyinp9LQvJvvSdMaOOKVEENFXW2k4bD1e5ydY+7zSuNLc9gUHEwOoATK97WCYXUsgeP3Cgk1CLHawD+Tm/XCXqTB/KDcjfzFiP+H/1sMKKui8mBtsgVdRotIlmRg9haqji9BweJkUfcxUVdADyvEhTGFdO5sGtHauDYBbsbj2K/7EGu9o9F7X+bZNXNcREHP5YDZqGqJbU7tyryCwMHeg2BTWK5rkGXtNMsiNqzFC05KCxSNAd9PDAJLCnzTC814IW7HBbu1D+kkR+Qh9reniN2KAgCpBGzvAWLqGxqv7Ks6x/sDVW0ONT9sw5YcwqNdgSHO7638V3cfBGnh4LiAOQj2B2doDfXGHkIBGQ1/V44MXFsVlRt7wO9RxKRuv12x0PfDhWLbJtGWfGzfVOWlNL7CZKy+xYU0jxMdAAFS6ugk049QQkoQtLLiyJHP2MgyZZkvBdgHG49aWuznUBg2FjQgPyIAyQ9ximAq67joDgTOiH9FmtWAJWbstZKbMs6mU1hpXSvECLcNq81/XfbSxNgemAYrKFKMsbHF82JV/fSMW80tqQyiT57zjaRXx9s52/Hsi4JoDRcil70m23R3Kbz2e5VstN+tBcPpTw3bU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(19627405001)(33656002)(186003)(38100700002)(71200400001)(82960400001)(478600001)(122000001)(54906003)(86362001)(7696005)(26005)(9686003)(6506007)(4326008)(6636002)(316002)(66476007)(66946007)(76116006)(64756008)(66556008)(66446008)(450100002)(41300700001)(8936002)(8676002)(6862004)(38070700005)(83380400001)(5660300002)(52536014)(2906002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HuyDBGdyGq6pQTMKt4iveKGHMxlZRL/ZmomJaI/7C6az2uk8W+qu8dmfIb?=
 =?iso-8859-1?Q?4CQyRpDmopWZ8IGfYqkn7sGgHJT2zSP6sd6ETz9k1M491dHw4vKD+USlVu?=
 =?iso-8859-1?Q?y9n/WVuyu2H/evW8KM3NkpcQrljCZb4qgU5xYFr8BotyJkU+CLtoRS973H?=
 =?iso-8859-1?Q?WrfI6HT4yL3JNP7x1UUBsX/3atbstTn/v9vjY+pbIUmE+5Idr1SxaopTSy?=
 =?iso-8859-1?Q?1acHJs0QdCkmZOzr74Wjrq4kF8npBlAoxDEYnULjacXW0UWb5d34H+FL2U?=
 =?iso-8859-1?Q?/LgCGhuYkUJODhU3zPmyR1u4VlEVIyZF7lCKlDl7MHLhS9u/tnjtjujO/W?=
 =?iso-8859-1?Q?LSFmz+lrd5qq16pG3BmQMrdZTxa+3A7MQsWdXNDG8jjnPFEyzjKi9gUUMx?=
 =?iso-8859-1?Q?F870XgXj1R1fxLf6csTPaKS429dQpcle0FUmdX8/M+a0oqAlpXU8HPmJb6?=
 =?iso-8859-1?Q?EuWYS0ZUuVJf6EVrel3s52DZ6uZEnS3fD0m+T8BJ0odyXKJY/My4mFc7lt?=
 =?iso-8859-1?Q?SHEhv1Kc7aZJV+0WIuHtW3ihVM17K7MYdCtgpwLHtJb3vVnzAlS/bmJyOW?=
 =?iso-8859-1?Q?8VkQk3Pgpu7aEO+0vROHnNilsbB0I9mky4h16cZdSq6XDzU9lnhS78shP3?=
 =?iso-8859-1?Q?Nh82XHslGupYasBk41CPLOPgOBjamRbN1ue/GWc9aL0khUmJp8vcRK0bQU?=
 =?iso-8859-1?Q?e0O0rFE2nwwXuaVJvCl0l/ajjEshVLfT09MCSjF6TZvHWXUyXHB16OODPf?=
 =?iso-8859-1?Q?1RtNS2ogTjcZI4y/MVJYNSFjoDutSyaPoig18BMa/2E5eJGo+XFzlpZ99J?=
 =?iso-8859-1?Q?A+7pxKt6BzqQ6ag+7bJ0LCRFyGcN12QM7bNMEeUwRXKdZGQPgWf267ERB8?=
 =?iso-8859-1?Q?JF8Cov6AYbnqPPb5S3hZVa/p7zYvt/D1m6uuHDLumcVqxh66LsB0rXUkIq?=
 =?iso-8859-1?Q?5kqUuuLcoCzHz6XJBhBU4+fF+V8vgu1wnP4pwUzJp0296lh4mIODP3lUB6?=
 =?iso-8859-1?Q?B9xetF3MpiR2CM1lUvYEsMzzpCXIgfuTSikRaL6E1Idz/zOpmze75eoYgt?=
 =?iso-8859-1?Q?iQBo0fSIeOyPofdaY3SzV0zPmNeqsyxKCHSKIxdmZjibSAKBcjF0wn+YA/?=
 =?iso-8859-1?Q?4jY1I5wISxnH3v1V8W649gdRr9/0DTyruxHi3M3T/LaP3LObRIT83xPGq6?=
 =?iso-8859-1?Q?EJJyXR/gr/a81dtSftxc5VHLfFwIOUtSLRO/ZRrv59r6OGGtqaH02kcDhh?=
 =?iso-8859-1?Q?frbkSBcpmefzvGqIlL1mDw8iPpGaKr0+X5g52ghh4tzdHKuiMgNp5NFTqj?=
 =?iso-8859-1?Q?TmvBv2RXStiTEWKL6ypvrlFD5xGFUPc0Xi3RvywHc/EurN8n8MUMmzN2p/?=
 =?iso-8859-1?Q?N2ykltwEXryPScfAV7ccD0TYgFgybJReq9G37v/eW6AaQpTqmpyAxB6qWj?=
 =?iso-8859-1?Q?KpmjIleqjLU7bx/bwSOv+3c7gjRF2FIoYkEFRvOEY69+L74jY8F97XXcL8?=
 =?iso-8859-1?Q?XcF4HphdzFLwkr3crwVYWqVHHsNROPeMwqypRsmn9SUu01E800Ie7MrEUM?=
 =?iso-8859-1?Q?7KTNXwciQWSBz4JxNt0u2wjJZn2fvCVZ9z/zO7FQYmdzt2yjuyvMBSWX+w?=
 =?iso-8859-1?Q?+F5rp1XHJfNy8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567042124B3E0D09E1696489A609BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3213f02f-a999-433e-6e5e-08db428daadb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 17:27:22.6939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SeHlbkoL3df4qozNRXVLUNjVzezsPCYCP+IJI/WiQG6/6OvafXguN+ksZG/vxiwb/g7i/S0n95f3jI5j646jsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-OriginatorOrg: intel.com
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567042124B3E0D09E1696489A609BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> PTE encode functions are platform dependent. This patch implements
>> PTE functions for MTL, and ensures the correct PTE encode function
>> is used by calling pte_encode function pointer instead of the
>> hardcoded gen8 version of PTE encode.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Bspec: 45015, 45040
>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++----
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
>>  3 files changed, 72 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/=
i915/display/intel_dpt.c
>> index b8027392144d..c5eacfdba1a5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>        vm->vma_ops.bind_vma    =3D dpt_bind_vma;
>>        vm->vma_ops.unbind_vma  =3D dpt_unbind_vma;
>>
>> -     vm->pte_encode =3D gen8_ggtt_pte_encode;
>> +     vm->pte_encode =3D vm->gt->ggtt->vm.pte_encode;
>>
>>        dpt->obj =3D dpt_obj;
>>        dpt->obj->is_dpt =3D true;
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915=
/gt/gen8_ppgtt.c
>> index 4daaa6f55668..11b91e0453c8 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>        return pte;
>>  }
>>
>> +static u64 mtl_pte_encode(dma_addr_t addr,
>> +                       enum i915_cache_level level,
>> +                       u32 flags)
>> +{
>> +     gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>> +
>> +     if (unlikely(flags & PTE_READ_ONLY))
>> +             pte &=3D ~GEN8_PAGE_RW;
>> +
>> +     if (flags & PTE_LM)
>> +             pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>
> GEN12_PPGTT_PTE_NC got defined in the previous patch as BIT(5).  But
> according to bspec 45040, bit 5 is ignored in the PTE encoding.  What is
> this trying to do?

This takes effect only for PTE_LM, doesn't affect MTL.
PTE_NC is needed for PVC (use of access counter).

I believe this function was writen based on the one for PVC. And this funct=
ion
did get extended to cover all gen12 in a later patch.

-Fei

> Matt
>
>> +
>> +     switch (level) {
>> +     case I915_CACHE_NONE:
>> +             pte |=3D GEN12_PPGTT_PTE_PAT1;
>> +             break;


--_000_BYAPR11MB2567042124B3E0D09E1696489A609BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0 ContentPasted1">
&gt; On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; PTE encode functions are platform de=
pendent. This patch implements</div>
<div class=3D"ContentPasted0">&gt;&gt; PTE functions for MTL, and ensures t=
he correct PTE encode function</div>
<div class=3D"ContentPasted0">&gt;&gt; is used by calling pte_encode functi=
on pointer instead of the</div>
<div class=3D"ContentPasted0">&gt;&gt; hardcoded gen8 version of PTE encode=
.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Andrzej Hajda &lt;andrz=
ej.hajda@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Acked-by: Nirmoy Das &lt;nirmoy.das@=
intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Bspec: 45015, 45040</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;drivers/gpu/drm/i915/display/i=
ntel_dpt.c | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c &nbsp; &nbsp; | 45 ++++++++++++++++++++----</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/intel_=
ggtt.c &nbsp; &nbsp; | 36 +++++++++++++++++--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;3 files changed, 72 insertions=
(+), 11 deletions(-)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/di=
splay/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index b8027392144d..c5eacfdba1a5 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/display/i=
ntel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/display/i=
ntel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -300,7 +300,7 @@ intel_dpt_create=
(struct intel_framebuffer *fb)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;vm=
a_ops.bind_vma &nbsp; &nbsp;=3D dpt_bind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;vm=
a_ops.unbind_vma &nbsp;=3D dpt_unbind_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;pte_encode =
=3D gen8_ggtt_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;pte_encode =
=3D vm-&gt;gt-&gt;ggtt-&gt;vm.pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dpt-&gt;o=
bj =3D dpt_obj;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dpt-&gt;o=
bj-&gt;is_dpt =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 4daaa6f55668..11b91e0453c8 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -55,6 +55,34 @@ static u64 gen8_p=
te_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return pt=
e;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;}</div>
&gt;&gt;
<div class=3D"ContentPasted1">&gt;&gt; +static u64 mtl_pte_encode(dma_addr_=
t addr,</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</di=
v>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted1">&gt;&gt; +{</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; gen8_pte_t pte =3D a=
ddr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; if (unlikely(flags &=
amp; PTE_READ_ONLY))</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte &amp;=3D ~GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; if (flags &amp; PTE_=
LM)</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; GEN12_PPGTT_PTE_NC got defined in the pr=
evious patch as BIT(5). &nbsp;But</div>
<div class=3D"ContentPasted1">&gt; according to bspec 45040, bit 5 is ignor=
ed in the PTE encoding. &nbsp;What is</div>
<div class=3D"ContentPasted1">&gt; this trying to do?</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">This takes effect only for PTE_LM, doesn't af=
fect MTL.</div>
<div class=3D"ContentPasted1">PTE_NC is needed for PVC (use of access count=
er).</div>
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1 elementToProof">I believe this function was wr=
iten based on the one for PVC. And this function</div>
<div class=3D"ContentPasted1 elementToProof">did get extended to cover all =
gen12 in a later patch.</div>
<div class=3D"elementToProof"><br class=3D"ContentPasted1">
</div>
<div class=3D"elementToProof">-Fei</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"ContentPasted1">&gt; Matt</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; switch (level) {</di=
v>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; case I915_CACHE_NONE=
:</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567042124B3E0D09E1696489A609BYAPR11MB2567namp_--
