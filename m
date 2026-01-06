Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D7CF6A2D
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 05:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFE310E309;
	Tue,  6 Jan 2026 04:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjsCOVa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7F510E45E;
 Tue,  6 Jan 2026 04:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767672278; x=1799208278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GfEg4N4UjxAq6M97ptRmxdMGHQf8cVnKFidJL6va5fs=;
 b=gjsCOVa3rGWGaVMPnz4BxX2T70zQqjjWZ/N1VNBJQKKcei3zRGPG5kHT
 Y+HXmk2tNLBMLxxM9BrNHSujRJgA2vbEOf5sakgcSZ+JSMkVJEvUr50Q1
 wtX8Rn97ConslQbGsOWdfbN6x2tPVG9V1l9PfOrY+JPYKZkhB4x2QfXQC
 sjK0GQUInUwUioXYeft9Dsj+JJJ1/+J72pejOvCjQdnt1BRvKICeIu3Bl
 Ok9IVCdQZr8Myih10Ky3A0KI3aeDKj8Uimd5qF4JOJczIqzGcrRKV9DSe
 fxn+xiROYjqG9mjq9XMBg1h2EfDJiEEqfWjaf8gY5oNnGcThHqSr6wA0h g==;
X-CSE-ConnectionGUID: R+0+00N9RBaQP8698iUQKg==
X-CSE-MsgGUID: q+jILqJxTjqCbISRAFuI0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68779895"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68779895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:04:37 -0800
X-CSE-ConnectionGUID: 242D60tGTumZgE+nv5j19A==
X-CSE-MsgGUID: T2WHWsqlSRuZehjIVyJecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202324846"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:04:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 20:04:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 20:04:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 20:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwM2tOm7ooEFiU3X+r6hldUWaB9Ejkx9LqBusd47RiyIQ4kK0MSPcjA7CCpWs9RvOqNs0a0RotUaEqncIaELv41uD/gGUqlZLyklVUFrQqaCIr59F3Z+uChEKMVOuO9uD/b7B1jF3ik7OucikzyGb/+ALDQIzwK1lzVMjRrC86bOBlcbwCYYp3FC22BK7WBP4y5iqlZwZHj/2/bchEQNeE1MEeS5o2hL5PSUfG8x0lASGLHZei/YrHQ6VJ2C9teLvq4LGg1Q26nqhdSmpp58cXjN8UTTcygYl3oys8jcaYMkcHsp6NNecFRM69wdc4hRfz+B4O9bZRq+dT0STJHRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Usy5g8X9vIhuyId+1iCfNXPcp+po6iOfVFNXKbO8+6U=;
 b=az/CmDUKODDRwAEqCMnVsce6qisR3+bSH/zZd9BjCVGSgh4H9fa2EfRDk8NZ2QdXHMp3vqiM0TjyY4pLtblWyzdfg4/VCrShMOMO2n48nnwP2JsYE+hsDf9K29bk0ZVAqoMuekLnKrk4HRTPM1nH2qVdTKIt2fN1FktjD1kCN/nZnd6ydSNHSmgbkDbhf56aaEH+/pIL3CZvfl21h7M09EA3f7mig5Bl6KpEckgbUIGIuGuQmpSo62ntsQsDzMoSIbNd6+2CqfK63q9a7u1Uvvmz6S9+tg5aN0PQN6ZLEweAO1gZT/bTQ6VqyicY8L7uA0bWRyxAgEttaj6VunPIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 04:03:24 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 04:03:24 +0000
Message-ID: <b140f4cc-d231-4a6f-baa1-3d00ab1c2a3d@intel.com>
Date: Tue, 6 Jan 2026 09:33:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-3-d209709cc3ba@intel.com>
 <DM3PPF208195D8D7DFDB5695BD42A3B437DE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <DM3PPF208195D8D7DFDB5695BD42A3B437DE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0253.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: f1790cfa-264c-40d9-872e-08de4cd889b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekhrMUtZWE1sWmZCR2lFbGw3aUlHQUo4Vit2K0UxTDNSQUpYY3FoTmZtY3Vq?=
 =?utf-8?B?K0cwL2J2U0x5NGtNMUNQRE1BR1J0US9CNHJsVU9NSVB2S2Q3eDd2ZFoxeHlS?=
 =?utf-8?B?cUdyd090MkZMcGNsNURLazgwdlhnVUtxa3NzSmVtK2swcUFwMC84V1JpbkR6?=
 =?utf-8?B?dGI1RVRYdTZjZVV0RnQ2SHBnREJnMEpQV00rN3hLL0RIZ2tjNURaZTBrYjBW?=
 =?utf-8?B?R1ZMYlpJSExiemVuNkc4TXQvN1FwRTdJWS9oeFZvbFRIRlJBY1VyOEN1VlFu?=
 =?utf-8?B?UFdWUXl2N2FVWWlEWG5ZbFVGQUpSdEJEN3FwMEtUd2hIc0h2T3pyaXh5M0Uy?=
 =?utf-8?B?anJwMktkTmVOS29rWHdiQU8vZU5TT3V3ekhnOGdIZWdzdjdyM0lEaWhESVZl?=
 =?utf-8?B?VUJ3MWFLMFBQZ3RqeXpKdGlyL1dZVWpmUFBMSkhtaDI0SU5xb09Xb0VTTzBN?=
 =?utf-8?B?Z01FVklwTW1xci9jVnFVakhoSTdBOHJ5cFhPRFN5Nm1EbkMzRnNLcE1jSzkw?=
 =?utf-8?B?bllCZ3RtbHJMTWF1YlNjL3JYSHlXUDVMM2dJM08zTmJJYnp3L2FYL0hhYkk5?=
 =?utf-8?B?VC9MdlhjczNoYWRYWEhvU1BlNnV5bUFYOHBnNklzcGRjZXdBTEVTNU9hbnVL?=
 =?utf-8?B?RURId0ppWEJxTCtjZyt5Uitja0YrT1NYWHhvR3RVTkhMN2JZZTR1THdsOFBG?=
 =?utf-8?B?ZS9YMUJ6ZlpuWVhtcVJzbHpCNGZUb2U4YWc5TXp6NW85dlJycXpRczM4YWRT?=
 =?utf-8?B?bkNhNk45cnppMyt5NTFGMGphSUlSR0dXWUlBY2d6NDVQUmpwWWU3bGhYMjFL?=
 =?utf-8?B?dHpEVVY5WlNibVFkbzFkZDdmbXpFRmZPZStoUnVlWEd0akxmSE91b2F6S05Q?=
 =?utf-8?B?Y0hkeXQzb241akdaK0FvMmVrMXVlcXJiRm9FdVFKVFAvdUdWekFtRGtmZVF0?=
 =?utf-8?B?N0NHeWRPVjcxT2FneXNFMnVFQWYrMklEelg5RE5hajNHZmw5SjFCVUQxRjRH?=
 =?utf-8?B?NCtRM1VNcncrSXYzRkVyS0prcWVNcEhMRWVWeEYyZVJZMHB2dnZUdnpLOHdp?=
 =?utf-8?B?SmZNNkxlakxjSWR2ZlpCcjhLbWVRdi9JZ0ZtRGtvSzBMbzJKQlJRT0U0SU14?=
 =?utf-8?B?WWJrRFM3UjBON3ZJTGJ2c3RVWldLL3l6STlid1FLOU9IQmFKSTFiWlE4RFd2?=
 =?utf-8?B?cktaWVBsV0ZUWVVNR0g1R0QrZVRRM2g3dEFOSjROeDUyMHI0a0pHR2lBZVpQ?=
 =?utf-8?B?UHRnY2d6TUxyL3E3bW1jSzhYOGJqK1didG1MM21JbmV3S213NHErMmZ6QmJS?=
 =?utf-8?B?c09mdXhzL3k5T1AwM1FUY2V2R0dnekYwamNxMGFJcVpqNW1zTEZ3NlE0cy9l?=
 =?utf-8?B?Mlh4SHg3Y3MwMlc0RzhoeW4yZGYydTVqR3VwTnliSTBQOFVhYXlXRFlDZGVn?=
 =?utf-8?B?N3lvYy9NMVIvQ2FpMXkyYk9wMVJrTmo3cmFvUi9qNjNFY3hpUGRBTUlDUFZY?=
 =?utf-8?B?MXU2WUNxb0d5TEZCaE1QNkZ3S1ZadTJqSVVSMSs3Z25sMmUxb0hFMjBEVlAx?=
 =?utf-8?B?L1RpL2NOZVVYMzhXZ1ZwejQ0enBUbGRnN3RrWnlWb0RUbGpGRjJvYUtkTC9x?=
 =?utf-8?B?V2ZPbWVKd3BxaFA3Sld5RTljWkRHK0pEQll1RG9NOTVkQlVXWitaU0FEQWxm?=
 =?utf-8?B?TlFTd2w0MU9hNk5XTVQ2eTVGUTMvNEQyMXZMa0xsNmxJUUlnS3RkNC9ucVJU?=
 =?utf-8?B?ZDBLZUFOTkV5WExqbDVxVGZjRDJmbHJOdVh2L1kwR3JxZGV5NGc0S3JsbVhW?=
 =?utf-8?B?VDhDUTJnaGVhZ3QzQzRHeWRsbzlNUzBkVFRycHFKeHo3ZWl2V1dNdFB4UDhv?=
 =?utf-8?B?YWt0bFN6R2x4anNjNXR4d2hhR2FXTGU5S0hWYWc1VmF1WXJTNmZSZktDOHFK?=
 =?utf-8?B?NVZXSUY3SkNteW0vQUtXckJoMUxHL0JBR2djSTJJYkFkZWtiRHB5bTlyOFl6?=
 =?utf-8?Q?uC71baIRX7cwGX+rQfICjJvRkaWmrE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlhY0FvSTAyNzAzRThMbzZUcWt4L25PNjU2eSs1TnphcmhYblR1aGE2YW1q?=
 =?utf-8?B?bUVqMkN5ZngwcjhQMG1GakEvbDF4U0J3VlhFY0VyRCthWnorbEFTenVxaDBw?=
 =?utf-8?B?RStYLys5QXhsaVp0dDJBVnh5UTV5Mm8rS0x3TTVlV3d2cWRveFBUWW5KSWdB?=
 =?utf-8?B?Mm01VlpsTTJzbE8yd1VOa1A1VmFlbjM2cXlOQmZ2REs5ejRsYWZSZ0N2d3FC?=
 =?utf-8?B?c3BMLytyemdUU0oyU2drMDlWRElZWFE5Wmx6S1RDZXBpT0tSOWw4QytTbzBw?=
 =?utf-8?B?TFAvZ0xTZHI5Wi90L3RoNjk3TjduQnpNd2hnRVcvTEN4aDZxU2NjdHVvL0Ix?=
 =?utf-8?B?aFNNWjAySjBXZlgxcStBNGlFNmJ6d1VFTjlITkx2Z3JMTlEyY3V5SzJaRVUv?=
 =?utf-8?B?Z3ZXYmRzWGZYZmFMTEFYR3RKZkNhOXJNNXpBRVI3TkhkTU82eUNzN21OSGV6?=
 =?utf-8?B?UmVnTjNtMGZGaVhjeFJnWEd5RS91RXNUN21HTHNQS1N2MDlsMFRQa0dUWGVB?=
 =?utf-8?B?TTdxVjlkdDFKa3FTb3ZxYnloWE5pRU50U1RpT2VoSm9FdDJGVWN3NkJMR2xB?=
 =?utf-8?B?OURydXdjbDNLdmpDa3FiQVd0OXlJQ2N6bXpDYUxXYXdISnhOZW4zak16SXdJ?=
 =?utf-8?B?aWhvODNnOTFkMWhRb0R4bm9XVSthcXJmenhWQjFhRDNQak5ZRmUxN0E5WW50?=
 =?utf-8?B?Smp4L1VLT3RuYnkzMXhVY1pPemFRNzBuWWUyZjhuSS9hVFlOMElMdVpDdlBZ?=
 =?utf-8?B?a0Rqc3NKUkk1Y1QvRitCL0hKMGdvb2FCQkFIOGpkU3A1RDBQZ3A2RDd3REQx?=
 =?utf-8?B?TTJiL2k5d1RyREJtUFlBQzhKcG1QZDl3anJnVTFCdnVMSnJ2d3hKcVhNelhY?=
 =?utf-8?B?QlJWNUN4SitKQmFQZnk1Q1RrMWNqK2FZb2FkanNQdlo3UVZRTHI0Rm1RWXJy?=
 =?utf-8?B?bVV0bytyakMzdEN0bmx2T3FSNmVtUWZRdXd4aGpRY3BiR0dzeEUyMnpnZ0hD?=
 =?utf-8?B?MEhZT0xlbGI5eUR2S0dVY0pjb203VVRUcmJyNk9GVnhQWUNZV3BWY3lNYnRh?=
 =?utf-8?B?c29XSzVlMTI4Y1pYWDczWkRQdnZrNlJqUGlDNTZYbENZZnNTQmVIcG5xV2hQ?=
 =?utf-8?B?MEhXUGVDbndQUWRHVkNheUpzQjJxTVg2QnVmVnphWmFZdUJiY1ZoNXJOM1hm?=
 =?utf-8?B?M1E2dm9IdTRYeVV1UmRuMmNCbjVqQzA4czV0WWVlc3ljT1dXdFh5dkdXWXgv?=
 =?utf-8?B?SEROSlJDVWZuSUFqZkJGUlZ4S2JKRlducUZnS3Y5YU1UQmxDOTFScWt5aitP?=
 =?utf-8?B?QktET3crTWxZM3hQMzVhL3dwTWlBWEFkZWdEa012Q2NzSmdNWHVqZXpiRHFE?=
 =?utf-8?B?MjZheGR0SGJJMUdWTks5V1FWT2lvdStTTHBzWWM2c1NwMzd4RHFWT0g4aVgr?=
 =?utf-8?B?amRTMUZjSFY3eWF4SG5ZTGFFaXZnVytReWttcUZZYnlZNHBYanA1bDBxTk1z?=
 =?utf-8?B?TEw1QzRmK0dCdGJJdXNETHA3WmgwMjA1Zm5qSmVObitKMGZUTDlOeFhBQ0RY?=
 =?utf-8?B?RWFERm85U2VmWmFueFVUN1daZjJxVFBsa3M4bnIwaHFuaCtlMm9aWE9zR0Ja?=
 =?utf-8?B?ck80MlkxUFE5NmdJYmU4V0xqWWNNd2hOZlhFVFh0SXZuVWlQMGIrSkJ1d3dq?=
 =?utf-8?B?MUJlK3hqTEo1ZFFSZnJHK0QyMWtIbW5WdVN2Uit3YVZJRm00ZExPYml1dVBs?=
 =?utf-8?B?WXIrYzJtQ3Fxcld1a2ZTdHZXTU0zZWRKL2VCUktiUC9mdktOQUZBd0ZyWWE3?=
 =?utf-8?B?c3lGbXNXZUZzd2dNLzM1TFRoR2c5ZGZ6ak1WOFVoQ1M1c0txOWgyUldXVVJJ?=
 =?utf-8?B?REZZeFdmUjFFTi9XallDMTFSdmE5Q0l0ZTBOT3BackxtVUV0V3JTNlgzeEM3?=
 =?utf-8?B?bllmNk1qRTNxYm4zTmkyREJLbXNHVkZYaERvYnRoc0VXMFU3a0c2U1c2cy9G?=
 =?utf-8?B?b3VReEtrYWNtTUdHQWNXQmdaay9tbGtPYkhyaEhqZ3YxMFIraTJqMlZoYjJ6?=
 =?utf-8?B?bVVpb0YyQzRiNXJQSXFDUlRTcFhpK0U4aFVxNG1RcnNGRXJQK3lWRFcyYnVB?=
 =?utf-8?B?RUtwN2NYK1pqUWNCU2xqdWtHMG5aWkxEOVBrSXBFazM2bDBtNmdVaWFQTXU1?=
 =?utf-8?B?SmpzS3pBajVVclZTd0I4ZGp5WThkbUY0MDFabHBzQUZnUG9XS2laZitURlU1?=
 =?utf-8?B?WjF3Z2ladlJkSlNQTEJVcWpsTUR1NXByb055R1BRRHpjbHRkcEZkczdGY0kw?=
 =?utf-8?B?M09ITVVVblBibUxEUW5Gek5tMWpZYktoT01OeTNtRnVGTU10aHo2QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1790cfa-264c-40d9-872e-08de4cd889b3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 04:03:24.2685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajahSHgbZvW0ijvQG9Ttjz40utg8knBV4LSXK5VKwrHTWve/pZlYLCtAx5ftQyQ4nopFLH6lhSE7YYaTqRiKQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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


On 29-10-2025 13:16, Kandpal, Suraj wrote:
>> Subject: [PATCH v6 3/5] drm/atomic: Allocate atomic_state at the beginning of
>> atomic_ioctl
>>
>> Moving atomic_state allocation to the beginning of the atomci_ioctl to
> This needs to be in imerative language so something like "Move ..."
> Also Typo *atomic_ioctl
Corrected!
>> accommodate drm_mode_atomic_err_code usage for returning error code on
>> failures.
>>
> Also maybe mention why drm_mode_atomic_err_code cannot be accommodated at previous place
Done!
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index
>> 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..3ef478e717bec917d1b8803c
>> 72bbcc8d6409d745 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1394,13 +1394,21 @@ int drm_mode_atomic_ioctl(struct drm_device
>> *dev,
>>   	struct drm_modeset_acquire_ctx ctx;
>>   	struct drm_out_fence_state *fence_state;
>>   	int ret = 0;
>> -	unsigned int i, j, num_fences;
>> +	unsigned int i, j, num_fences = 0;
>>   	bool async_flip = false;
>>
>>   	/* disallow for drivers not supporting atomic: */
>>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>>   		return -EOPNOTSUPP;
>>
>> +	state = drm_atomic_state_alloc(dev);
>> +	if (!state)
>> +		return -ENOMEM;
>> +
>> +	drm_modeset_acquire_init(&ctx,
>> DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
>> +	state->acquire_ctx = &ctx;
>> +	state->allow_modeset = !!(arg->flags &
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>> +
>>   	/* disallow for userspace that has not enabled atomic cap (even
>>   	 * though this may be a bit overkill, since legacy userspace
>>   	 * wouldn't know how to call this ioctl) @@ -1439,14 +1447,6 @@ int
>> drm_mode_atomic_ioctl(struct drm_device *dev,
>>   		return -EINVAL;
>>   	}
>>
>> -	state = drm_atomic_state_alloc(dev);
>> -	if (!state)
>> -		return -ENOMEM;
>> -
>> -	drm_modeset_acquire_init(&ctx,
>> DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
>> -	state->acquire_ctx = &ctx;
>> -	state->allow_modeset = !!(arg->flags &
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>> -
>>   retry:
>>   	copied_objs = 0;
>>   	copied_props = 0;
>> @@ -1543,7 +1543,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   	}
>>
>>   out:
>> -	complete_signaling(dev, state, fence_state, num_fences, !ret);
>> +	if (num_fences)
>> +		complete_signaling(dev, state, fence_state, num_fences, !ret);
> Why the need to check num_fences before we complete signalling
> Also this seems like a separate change maybe should be in its own patch

Even before creating signals there are few error checks where we return 
back with failure code, hence checking for signals created before 
signalling.

Thanks and Regards,
Arun R Murthy
-------------------

> Regards,
> Suraj Kandpal
>
>>   	if (ret == -EDEADLK) {
>>   		drm_atomic_state_clear(state);
>>
>> --
>> 2.25.1
