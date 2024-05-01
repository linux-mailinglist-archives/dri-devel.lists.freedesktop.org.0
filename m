Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775448B8DF2
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 18:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CC210F659;
	Wed,  1 May 2024 16:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGvG9/SO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9925510F659
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714580399; x=1746116399;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kT4MVXkx3Wm0MmyTv/P3zIK9QbmYqdq7tp3gYMThCDc=;
 b=ZGvG9/SOLUsVFLg4mr/RFOVmHcYS4sKhlmCv/8E3gOwq7NMSlqutRS7t
 ln1f2n6EV2JTmFa6T31XgX8GQF+BSKTPxw4Pel/0hI4nX9FCekO83+SMF
 0QBw+w6R1pTs0/4aRhcgogsib7Dmjs4zAjYgYfzG+NpJsFcyNM5TKSgQ8
 IzwauRZFIa/E4oAiaH4fOVNljqBMiK8ek5hksQyj4DDuPOQBzvmwFBq3C
 8ZNe7OuFr4cy5qVb532v3o2GzB2oV7EGEIrL41NDo8W4jjDDbO4QLxMra
 yMcbjAjSkoKah4FaT8GXcgpdKelq6afn6TLUEWS6I/KbWcdW+z0yq2myN Q==;
X-CSE-ConnectionGUID: pjhjp3ZEQamcFUTlyNRi1Q==
X-CSE-MsgGUID: iVnIZjcUR9eqOdCF7cOjZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10143181"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10143181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 09:19:58 -0700
X-CSE-ConnectionGUID: xcx442xdSlCwcja5g8m+lw==
X-CSE-MsgGUID: jAAzs1qaT0m+zlDO4z/kzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="27316398"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 09:19:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 09:19:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 09:19:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 09:19:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 09:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnR78VMu5jK08BGnEjD/t4dcU8lgD+Yd/Oaq8HE4IUwBVt9IVuadx2W7SoMz9cAXl+fVhx1NIq9y/Mh83fg/ba+MKjvQ/Adoi55v1FEn+AE81Tlsn8p8KpqxCImPyseccWKVSzM1b9LMC7fDCO0fmEo4IBKZzr0RCpA7eNXkXG054V4ldMF2IrNVY457cK5ikiGxcXgckdtQBiMtdCw9mHRFZkQHmUbtzLGzPzfFgFzvzqASUwT0whbq7v60t38WALp8Rio6VVcKfj+42InO/AcB+kbQj/7CDSY5vtkTjggAPhWI/fi5XpwM6B92D3dqImkldxhaTyCwUzWfNmELTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24OsQDyo/JwvRWiZEoOMQg2gupZfX+tKKSlQXEwIxTE=;
 b=HorWq8X0+IJFrQaQEce8EWhl4BgDKP1ZzQVhjXMR3u301Rm3gzRN4cPpyXEnt/XhbceVmAR4zMKZvdfqFmBGVHhu84ji3UbrNW/waak4BhW/iFt6WHMYWvsUjr8UPka3akpRbH21nox79Wq3B4tRDumXC7Xoh9sMEMzZOOOkiRVkZTVH8J4SxTGLIZ2xqLaezNcntkJ2oY/HL7iLstWBGqDha18iBmeBk278FtsZoqX/qBZOba5Fh/CeAzSfG0Obs8yfADHrkHXifNrDVH4DNPL6lgT3lXwLuZoN+GVO63VxsZprgf7RYoGgBTjdfjKZ9Un/ZsbjUSM9v2P3dWmPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 16:19:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 16:19:53 +0000
Date: Wed, 1 May 2024 11:19:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>, Rob Clark
 <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Hans de
 Goede" <hdegoede@redhat.com>, <kernel@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Christopher Healy <healych@amazon.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sysfs: Add drm class-wide attribute to get active
 device clients
Message-ID: <zz7tsf5ozqh24br7qgnslwmhgtgazeceif6ih22rjkl3bjfws4@u5bvmdjddzj6>
References: <20240403182951.724488-1-adrian.larumbe@collabora.com>
 <CAF6AEGsWtJs2xcZx59P9_maxn1RqCO6-4GwEp2fL31bZtTyuoA@mail.gmail.com>
 <e6500d5b-0151-4c31-9032-3a23157b3126@ursulin.net>
 <4btlparspmb47v3nq3mip6cjr2adwejepnglvh6q5nlbmdzwvt@74gg6tjpngbv>
 <54ebd0a0-dc9d-43d7-b530-065832cda160@ursulin.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54ebd0a0-dc9d-43d7-b530-065832cda160@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:303:b4::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7c1c06-4169-4a75-8544-08dc69fa887e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1VucGlYcHFSQmROMDFFREJRL3NFMElxN3UzSnN0NFlZQVV3Y1p2cXVhcVht?=
 =?utf-8?B?QTlSRkYrYS83WlYrdzBnbGxKL2xqLzZIb1FRTDBlTUlIYnNQbXBWeGRWQUQw?=
 =?utf-8?B?TGFMNFc2eW4zNHRxRit3U3hpbjc1RXNjNkRnWmpmeEFJMlFUUmJSdEdVQW14?=
 =?utf-8?B?R3JyU2JiaTVMZ0k2YmlIVHprdTVwMXczWHZ3aW5XelVIczc4VlZOaEFkWlUv?=
 =?utf-8?B?MDd1WHE3a2FHV09zL3MxcTEydG9iVlR6eVNVM2pCdGg2MlN1RWh3Z2ZLS2tp?=
 =?utf-8?B?dFlVdzlqWFQ3eDBvZCtlVzFzMVcvdnRvYzZjdnViN2J6SDZ4RzFwRzJNM2c2?=
 =?utf-8?B?QmZZb0doaUlIU3RNcHVUNTc2c0V0ZTg1YTAxMHRreEJnZm92S1FnTGd2anlx?=
 =?utf-8?B?KzZuaVZVVUZ4VUgzQXBsZlpjK3hMeFZodFFLbzJyak5hSG16bkdsWGZaKzk1?=
 =?utf-8?B?VzNVYmZDSmlaTXoySlRiY2VGRHl6dVpBMTlYcnRDQWQ0UEdSR05TV2FVVU1n?=
 =?utf-8?B?RkxqOTRRUnEwYUFFQmRyalJSYmE3dWVMYy94ZUhxSE4vNFFJVy9Ma1pqMmZC?=
 =?utf-8?B?VEFKaGRMTVJOaFBKTDlhOXpOQVNmQ1Jta1cwb0t2ZGxhbDdwYnQ5aFdlNUUx?=
 =?utf-8?B?SjltOHVFYzRlM3lxcHFKUmZ0d2p3aFh3Q0phZ3d5K1Q3c05UazRLdVFDbk0w?=
 =?utf-8?B?QlRpeXNOSTdKV3B4SXNNbGNKZWFtRnJVUWFsWEUzSE91OEtqemFPd0krNGJx?=
 =?utf-8?B?R2RsQmgyYko4em5yMkw1M2NSUmwwenUrME1YZWpNWld6YlhuREROS2ZHNEZR?=
 =?utf-8?B?aXB2aEFiZkFpUkE0SGkwd1NSei9xS2RBa3Z0TnlxRUdPNGNUNVhIdGZhTWpt?=
 =?utf-8?B?amJEN3ZUR1JYbHMxTEV5OWJGeGZMUytvTG5BSDJNTVV6OUk1L0FGaHZWbmxZ?=
 =?utf-8?B?UDgrZlJEVWtyZkQ2OWR1Uk9SSjdLWmowRFpGcHBxTjZnaC91SUpUZkVKYUt1?=
 =?utf-8?B?NXc2WEhTZnY4bERZWU9VclJiUUxqMWhFZ3A1N1hPYm9OMXpnMnRXQnkxMWpv?=
 =?utf-8?B?ZllMcEhOSjFOMWszMExkOEw2S3FJdStaMFBnbS80eGtuQy9MNWR4M241bTZT?=
 =?utf-8?B?RmRRMEF4YklaY2xscjBHWEs5aWQzd1V3djZJb1lXcjFNZnlKYXY5ZFR0Mkk1?=
 =?utf-8?B?QXh2eGcrS0pFZlF0MUdOT25BMEpmZFk4YmU2eGlSWFJpMVV1QjNRY1dpRjJ1?=
 =?utf-8?B?ekw5aUZISnZodjg2M0JlMXJrSmhhTDFEaExHSlVQWXhSWkgrdzRoSzN3cjFG?=
 =?utf-8?B?ZDljS0lrUU1Eb1U3bjhPY01zZ2EweXl3SDFpRG10Ny9GVDZ0L1NPbzVpdWsr?=
 =?utf-8?B?VE5KNUNSeTFvelUzcVpQM2FYejdHbldzWkdVaHR6ajRSVDZKVGQzeWxoMFB6?=
 =?utf-8?B?bVFOOExRV09vQWU4OHhGUjVDVGlCTFZaSmFKbndUVVlYd3AxVEl3aFhXUTc3?=
 =?utf-8?B?YzViSENlMHQxQzdyazdWbzhpMWg1NTEvRkpmcU9IRFpqT0MyZXR3ZXRhMThE?=
 =?utf-8?B?bElUV0ZMSVJuVHJaUkx2RWhXRk12QWVPSUFpZ0NORzBKZVdhWUczUU1RWFpu?=
 =?utf-8?B?SlRWdnVaUzE4ZWp3M1l3bVhTUSswQ3VLYTVlcDBhMXozZlB4ZkRVZmZmZWUy?=
 =?utf-8?B?Q3RYS3ZxaldZem9aN1lpaXlPd3ZacENlUlZ2N1NKUERGbmdaMlRHZUJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lpdkgyeDFzZ1QxZWJPZTFZQTNSTWFyUlM2Umo0ZlZlWEpKY1habUp5R3k0?=
 =?utf-8?B?bWpJTE9scURjaC9XaGVPOTVXYkYxaGo4QzVYbk5XU1BWNWlWUjl3eEJZU0hE?=
 =?utf-8?B?dEk2SjZJNUtyRVM5WFJMTmFqTUpXd0VGMmxrcVhoZ1JzN2hiTjhja1lwL2wv?=
 =?utf-8?B?VG9zeUc4bEdPd0xVUjRsajNXU1BwejBlcTdseEdzYmJtV2pnWFp1dFFWS2pw?=
 =?utf-8?B?bGJxTHFJazZJQVdqVkpoc2lBSTN5bFVwZ2YwT0tKa2hnM1ppbmZPWjNYZ3B3?=
 =?utf-8?B?MTZCMnJnekdabWNjNVVWZUwyWU9CNFdIamdQRVVjOE1pQUsrcHY0MGhjRUpU?=
 =?utf-8?B?MzFwVVNpeTRTdW90ZW5wMzduQjd3ZjhvTXZoT2hCS3pOTFRvdHJseHNjdm5G?=
 =?utf-8?B?aTFrNER6OEZBTlJ6T293bExvaEE4SktQUWYrdFFvU055KzJZQ1N0SkpmSW1E?=
 =?utf-8?B?TC90VE1CMDJwcjhzOTQ0Ti9TeHJhcGJDMDUvTVVlWHVSYWVGbzF6TXpmUE8x?=
 =?utf-8?B?STJtajNqTkRhdXpVTVFKR3ZVUGV2bVBvcWFaV01haGlNVlNPSDg2K3hMakVX?=
 =?utf-8?B?ZjQ3VURqeVRyODh1OWJMTzh3L3dxbldSSnZsd0o0YXZKOHViQ0FheDFUaVJN?=
 =?utf-8?B?cHJ0UG96M3JiSGhHdmRaWVFOQmY0WUZhUCsyUENKMVhyV1ZIcHI3bVp1d3k2?=
 =?utf-8?B?ZnoyUUR0dk03TkVQSHY1cFc1MWczRzlWaHdPL1dlRk5xOGxJQjkvc2pmZVRC?=
 =?utf-8?B?TDlUL0JNaFRRSVh1ckF1by9lajRmRUw1cVllQ05pY3h0Wm1KZENIdE1wd1Jn?=
 =?utf-8?B?NU04M3dwd1g1NU4zNEx6dTl2d2tsWWszOUVUb3pEZ3NySTVKVFVtd0ttdDYw?=
 =?utf-8?B?S0NKb0JuUlZONWYxaFU2MU43VTYvc3Y2R01qWXBJZTdHWXc3bk9sZy8vOVJG?=
 =?utf-8?B?cVp6TlYrazdoODRpcllvSitBV05VckZBUEl5QWNhRXM1MzJMalRieVRnK3Z2?=
 =?utf-8?B?SzdXR1lzMkVIWWV1UExjdm5CbDJMQ2tNMk02bUVQakc5VEFsTG1BNXRuTEpS?=
 =?utf-8?B?V2VPMTRITmdTaFpJLzJxWHJZZVIxZldGUkpFNEgzSVUzbUU3NkZ6T01lVVU1?=
 =?utf-8?B?czlESE5ZQzN4bGRaTFpwMGFtR2xrMUR0OEQvR2hodEtlNjlMN1VWcmsrUENx?=
 =?utf-8?B?SG9pTUl1cFhVWm4ycGxkM1NZejFVa3lMOUZaMzZQOW50K08zVTlCMEIvZXlP?=
 =?utf-8?B?cU1jZEIzam1wMTdIbW44OUpDTlljbmNBRzJodTdCdlNvMVFuNnRGYVdxcTV2?=
 =?utf-8?B?NjJKZEMvSmwyOE9wS1VQVFdxaEt0aWVpTnlMbFYyVEd2TU1vek12aVFPdzJo?=
 =?utf-8?B?Z1pNb1ducmN0ZGx0RmIrWjBLK2FYeXhJeDJoK2RhSDlRZ25mRGsxdisrc0RN?=
 =?utf-8?B?a1J2N1EybU5NOWlMS3YzbDRoM29NSnNPMG83ZG44U1Y5RmtnbDNkeHY1S1VX?=
 =?utf-8?B?aytvZll0aTNUeTRmVEtIbkJIYk81ZlIzRU9vQUJGYXFlc2w0VytXSjk0b016?=
 =?utf-8?B?MDR6N1FWTmhvcXJUblg1K2pvbGFQVGl6SzhkZ0ptZXZRMFJYZFhmajJXSnBV?=
 =?utf-8?B?U3lZVjZBc2dseW14WTVXTWxhRUpGbURWOWRUK1FIRFdKbzR0SjZyM2Q3UmZw?=
 =?utf-8?B?R1Z1Skdwa2VXazJ1cnBIQVZUUzhGeS9LV3p1c25KRTlGQWM1K2VqbktTMjc2?=
 =?utf-8?B?VVNOYkFUeFc4NVlNSjhVY1N0Nk16RzlLS3dUT3Yza1hDMHdBYmMyMGJVbzRp?=
 =?utf-8?B?eVN0NExCV2RRNzhPQkVRKzRjU1oxRk0yTVlGcDNSYWtHNURVV1NDbi9USDlV?=
 =?utf-8?B?Z1R0TkRma0xwaTRWVGJ5OTJQdE9tcEdtanNia1lhK3V1Q1ZOa2llc2dSYW5O?=
 =?utf-8?B?ejN5N09KUExlS3hWNnJJaTRpSE9FeTFveTEvOFVoV3V0V1dkWEdIdGQ4SmZu?=
 =?utf-8?B?V0lxZHVLNFE3ak56Z0haOUliMjRVQ2ZGZk1RaS9oOUM5UERObi9EU3ZhSkVp?=
 =?utf-8?B?dXE0cHJ1ejBDMnlBdVZkOTd1UisrV0NZTXl1Q29WM2wzYlBCeWM4cE1KYnhK?=
 =?utf-8?B?SFYyeTJRcDBZUzB3MVhrcm5SbDNyRUhJMWQ1bGFHMDBtOEtPUkkyUXB4ZDIv?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7c1c06-4169-4a75-8544-08dc69fa887e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 16:19:53.5305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQVMLxUlpTZnrHO1vUuhtYynIoLhuo4zPOBUZgCOdExj4wgCzNGzLWSHKLgE1YdoVDCM/HAmkOV9Dw60zZ++BSCSi9e274HIdgFaE3CGLpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 01, 2024 at 04:58:05PM GMT, Tvrtko Ursulin wrote:
>
>Hi,
>
>On 24/04/2024 15:48, Adrián Larumbe wrote:
>>Hi Tvrtko,
>>
>>On 15.04.2024 13:50, Tvrtko Ursulin wrote:
>>>
>>>On 05/04/2024 18:59, Rob Clark wrote:
>>>>On Wed, Apr 3, 2024 at 11:37 AM Adrián Larumbe
>>>><adrian.larumbe@collabora.com> wrote:
>>>>>
>>>>>Up to this day, all fdinfo-based GPU profilers must traverse the entire
>>>>>/proc directory structure to find open DRM clients with fdinfo file
>>>>>descriptors. This is inefficient and time-consuming.
>>>>>
>>>>>This patch adds a new device class attribute that will install a sysfs file
>>>>>per DRM device, which can be queried by profilers to get a list of PIDs for
>>>>>their open clients. This file isn't human-readable, and it's meant to be
>>>>>queried only by GPU profilers like gputop and nvtop.
>>>>>
>>>>>Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>>Cc: Christopher Healy <healych@amazon.com>
>>>>>Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>>
>>>>It does seem like a good idea.. idk if there is some precedent to
>>>>prefer binary vs ascii in sysfs, but having a way to avoid walking
>>>>_all_ processes is a good idea.
>>>
>>>I naturally second that it is a needed feature, but I do not think binary
>>>format is justified. AFAIR it should be used for things like hw/fw
>>>standardised tables or firmware images, not when exporting a simple list of
>>>PIDs. It also precludes easy shell/script access and the benefit of avoiding
>>>parsing a short list is I suspect completely dwarfed by needing to parse all
>>>the related fdinfo etc.
>>
>>I'd rather keep it as a binary file for the sake of easily parsing the number
>>list on the client side, in gputop or nvtop. For textual access, there's already
>>a debugfs file that presents the same information, so I thought it was best not
>>to duplicate that functionality and restrict sysfs to serving the very specific
>>use case of UM profilers having to access the DRM client list.
>>
>>I should mention I did something controversial here, which is a semantically
>>binary attribute through the regular attribute interface. I guess if I keep it
>>as a binary attribute in the end, I should switch over to the binary attribute
>>API.
>>
>>Another reason why I implemented it as a binary file is that we can only send
>>back at most a whole page. If a PID takes 4 bytes, that's usually 1024 clients
>>at most, which is probably enough for any UM profiler, but will decrease even
>>more if we turn it into an ASCII readable file.
>
>I'm afraid I still think there is no reason for a binary file, even 
>less so artificially limited to 1024 clients. Any consumer will have 
>to parse text fdinfo so a binary list of pids is not adding any real 
>cost.

yeah, I don't really understand why you'd want the binary number that
you'd then have to turn into a string to open the /proc/<pid>/. To me it
sounds more like we want a text output and that output to be:

<pid>/fdinfo/<fd>

So gputop could just read this file to know where the info is.
Too bad we can't symlink cross fs, otherwise we could just add symlinks
to e.g. /sys/class/drm/card<N>/clients/*, which then nicely separate it
per gpu too.

But see below.

>
>>I did some research into sysfs binary attributes, and while some sources mention that
>>it's often used for dumping or loading of driver FW, none of them claim it cannot
>>be used for other purposes.
>>
>>>>>---
>>>>>   drivers/gpu/drm/drm_internal.h       |  2 +-
>>>>>   drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>>>>>   drivers/gpu/drm/drm_sysfs.c          | 89 ++++++++++++++++++++++------
>>>>>   3 files changed, 74 insertions(+), 19 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>>>>index 2215baef9a3e..9a399b03d11c 100644
>>>>>--- a/drivers/gpu/drm/drm_internal.h
>>>>>+++ b/drivers/gpu/drm/drm_internal.h
>>>>>@@ -145,7 +145,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
>>>>>   void drm_master_internal_release(struct drm_device *dev);
>>>>>
>>>>>   /* drm_sysfs.c */
>>>>>-extern struct class *drm_class;
>>>>>+extern struct class drm_class;
>>>>>
>>>>>   int drm_sysfs_init(void);
>>>>>   void drm_sysfs_destroy(void);
>>>>>diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
>>>>>index 6cc39e30781f..2fbd24ba5818 100644
>>>>>--- a/drivers/gpu/drm/drm_privacy_screen.c
>>>>>+++ b/drivers/gpu/drm/drm_privacy_screen.c
>>>>>@@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>>>>>          mutex_init(&priv->lock);
>>>>>          BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>>>>>
>>>>>-       priv->dev.class = drm_class;
>>>>>+       priv->dev.class = &drm_class;
>>>>>          priv->dev.type = &drm_privacy_screen_type;
>>>>>          priv->dev.parent = parent;
>>>>>          priv->dev.release = drm_privacy_screen_device_release;
>>>>>diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>>>>>index a953f69a34b6..56ca9e22c720 100644
>>>>>--- a/drivers/gpu/drm/drm_sysfs.c
>>>>>+++ b/drivers/gpu/drm/drm_sysfs.c
>>>>>@@ -58,8 +58,6 @@ static struct device_type drm_sysfs_device_connector = {
>>>>>          .name = "drm_connector",
>>>>>   };
>>>>>
>>>>>-struct class *drm_class;
>>>>>-
>>>>>   #ifdef CONFIG_ACPI
>>>>>   static bool drm_connector_acpi_bus_match(struct device *dev)
>>>>>   {
>>>>>@@ -128,6 +126,62 @@ static const struct component_ops typec_connector_ops = {
>>>>>
>>>>>   static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>>>>>
>>>>>+static ssize_t clients_show(struct device *cd, struct device_attribute *attr, char *buf)
>>>>>+{
>>>>>+       struct drm_minor *minor = cd->driver_data;
>>>>>+       struct drm_device *ddev = minor->dev;
>>>>>+       struct drm_file *priv;
>>>>>+       ssize_t offset = 0;
>>>>>+       void *pid_buf;
>>>>>+
>>>>>+       if (minor->type != DRM_MINOR_RENDER)
>>>>>+               return 0;
>>>
>>>Why this?
>>
>>I return nothing in case of a non-render node because we don't want display drivers
>>to confuse UM GPU profilers.
>
>Feels to arbitrary to me. Let them handle it.
>
>>>>>+
>>>>>+       pid_buf = kvmalloc(PAGE_SIZE, GFP_KERNEL);
>>>
>>>I don't quite get the kvmalloc for just one page (or why even a temporay
>>>buffer and not write into buf directly?).
>>
>>Should've used kmalloc, you're right. Or else I could just write everything straight into 'buf'.
>>
>>>>>+       if (!pid_buf)
>>>>>+               return 0;
>>>>>+
>>>>>+       mutex_lock(&ddev->filelist_mutex);
>>>>>+       list_for_each_entry_reverse(priv, &ddev->filelist, lhead) {
>>>>>+               struct pid *pid;
>>>>>+
>>>>>+               if (drm_WARN_ON(ddev, (PAGE_SIZE - offset) < sizeof(pid_t)))
>>>>>+                       break;
>>>
>>>Feels bad.. I would suggest exploring implementing a read callback (instead of
>>>show) and handling arbitrary size output.
>>
>>I think regular class attributes can only implement show() and set(). For a more complex
>>interface, I would have to turn it into an actual binary attribute, and that would be the only
>>choice if we want the list of clients to be of arbitrary size.
>
>Yeah, i915 uses that to dump the error capture file which can be huge 
>and is text so it is doable.
>
>>>>>+
>>>>>+               rcu_read_lock();
>>>>>+               pid = rcu_dereference(priv->pid);
>>>>>+               (*(pid_t *)(pid_buf + offset)) = pid_vnr(pid);
>>>>>+               rcu_read_unlock();
>>>>>+
>>>>>+               offset += sizeof(pid_t);
>>>>>+       }
>>>>>+       mutex_unlock(&ddev->filelist_mutex);
>>>>>+
>>>>>+       if (offset < PAGE_SIZE)
>>>>>+               (*(pid_t *)(pid_buf + offset)) = 0;
>>>
>>>Either NULL terminated or PAGE_SIZE/sizeof(pid) entries and not NULL
>>>terminated feels weird. If I got that right.
>>>
>>>For me everything points towards going for text output.
>>
>>Yes, I know it might sound weird, but my reasoning was: either there are PAGE_SIZE/sizeof(pid) entries
>>and the file isn't NULL terminated (which should be picked up by clients as being one page worth
>>of data, the sysfs attribute maximum transfer unit), or else there aren't enough entries to fill
>>a page and after the last one there's a NULL entry.
>>
>>
>>>>>+
>>>>>+       memcpy(buf, pid_buf, offset);
>>>>>+
>>>>>+       kvfree(pid_buf);
>>>>>+
>>>>>+       return offset;
>>>>>+
>>>>>+}
>>>>>+static DEVICE_ATTR_RO(clients);


/proc/<pid>/fdinfo/ is only readable by the owner. if we report what are
the open fds (or even what are the pids with a drm fd), we are
leaking that info. So we should probably make this
DEVICE_ATTR_ADMIN_RO.

Lucas De Marchi

>>>
>>>Shouldn't BIN_ATTR_RO be used for binary files in sysfs?
>>
>>Like I said above, I sort of faked a binary attribute through the regular sysfs attr API,
>>which is most likely a bad idea.
>>
>>>Regards,
>>>
>>>Tvrtko
>>>
>>>P.S. Or maybe it is time for drmfs? Where each client gets a directory and
>>>drivers can populate files. Such as per client logging streams and whatnot.
>>
>>Yes, but maybe this is something we can discuss in depth in an RFC at a later time?
>
>Yes of course, it is just a long standing idea for flexible per client 
>stuff.
>
>Regards,
>
>Tvrtko
>
>>
>>>>>+
>>>>>+static struct attribute *drm_device_attrs[] = {
>>>>>+       &dev_attr_clients.attr,
>>>>>+       NULL,
>>>>>+};
>>>>>+ATTRIBUTE_GROUPS(drm_device);
>>>>>+
>>>>>+struct class drm_class = {
>>>>>+       .name           = "drm",
>>>>>+       .dev_groups     = drm_device_groups,
>>>>>+};
>>>>>+
>>>>>+static bool drm_class_initialised;
>>>>>+
>>>>>   /**
>>>>>    * drm_sysfs_init - initialize sysfs helpers
>>>>>    *
>>>>>@@ -142,18 +196,19 @@ int drm_sysfs_init(void)
>>>>>   {
>>>>>          int err;
>>>>>
>>>>>-       drm_class = class_create("drm");
>>>>>-       if (IS_ERR(drm_class))
>>>>>-               return PTR_ERR(drm_class);
>>>>>+       err = class_register(&drm_class);
>>>>>+       if (err)
>>>>>+               return err;
>>>>>
>>>>>-       err = class_create_file(drm_class, &class_attr_version.attr);
>>>>>+       err = class_create_file(&drm_class, &class_attr_version.attr);
>>>>>          if (err) {
>>>>>-               class_destroy(drm_class);
>>>>>-               drm_class = NULL;
>>>>>+               class_destroy(&drm_class);
>>>>>                  return err;
>>>>>          }
>>>>>
>>>>>-       drm_class->devnode = drm_devnode;
>>>>>+       drm_class.devnode = drm_devnode;
>>>>>+
>>>>>+       drm_class_initialised = true;
>>>>>
>>>>>          drm_sysfs_acpi_register();
>>>>>          return 0;
>>>>>@@ -166,12 +221,12 @@ int drm_sysfs_init(void)
>>>>>    */
>>>>>   void drm_sysfs_destroy(void)
>>>>>   {
>>>>>-       if (IS_ERR_OR_NULL(drm_class))
>>>>>+       if (!drm_class_initialised)
>>>>>                  return;
>>>>>          drm_sysfs_acpi_unregister();
>>>>>-       class_remove_file(drm_class, &class_attr_version.attr);
>>>>>-       class_destroy(drm_class);
>>>>>-       drm_class = NULL;
>>>>>+       class_remove_file(&drm_class, &class_attr_version.attr);
>>>>>+       class_destroy(&drm_class);
>>>>>+       drm_class_initialised = false;
>>>>>   }
>>>>>
>>>>>   static void drm_sysfs_release(struct device *dev)
>>>>>@@ -372,7 +427,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>>>>>                  return -ENOMEM;
>>>>>
>>>>>          device_initialize(kdev);
>>>>>-       kdev->class = drm_class;
>>>>>+       kdev->class = &drm_class;
>>>>>          kdev->type = &drm_sysfs_device_connector;
>>>>>          kdev->parent = dev->primary->kdev;
>>>>>          kdev->groups = connector_dev_groups;
>>>>>@@ -550,7 +605,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>>>>                          minor_str = "card%d";
>>>>>
>>>>>                  kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>>>>>-               kdev->class = drm_class;
>>>>>+               kdev->class = &drm_class;
>>>>>                  kdev->type = &drm_sysfs_device_minor;
>>>>>          }
>>>>>
>>>>>@@ -579,10 +634,10 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>>>>    */
>>>>>   int drm_class_device_register(struct device *dev)
>>>>>   {
>>>>>-       if (!drm_class || IS_ERR(drm_class))
>>>>>+       if (!drm_class_initialised)
>>>>>                  return -ENOENT;
>>>>>
>>>>>-       dev->class = drm_class;
>>>>>+       dev->class = &drm_class;
>>>>>          return device_register(dev);
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(drm_class_device_register);
>>>>>
>>>>>base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
>>>>>--
>>>>>2.44.0
>>>>>
>>
>>Adrian Larumbe
