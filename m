Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO6rIgJxcGktYAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 07:24:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E8652035
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 07:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6410E120;
	Wed, 21 Jan 2026 06:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp93/SZh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721BA10E120
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 06:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768976637; x=1800512637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VuuA14N4zPKj1Bce6foeBkOHtZh/fTuR07rv7EdD15Q=;
 b=Yp93/SZhpLr50mF+TWx+Hu94sBC1foUasJ9BbIxeGeAMgFIAqBNNNxYN
 3ZJGq0BWeDbaMLlQFzrs1/JDSKBahHPrqJx1B1sbRxNNcUsXZ9XyziJX8
 PSsBwUvDTCfrEvSLPaV5da61rclVZTjuBYSWXRlQt8y+nxi5muU40swB/
 stn5xrVq5u6vMpAGhUEo3Rph/3Xg295lwryCC0yU1Qf40i3ELOQgasI5a
 4aaSVmU30qnjuh/zJs3uhSaOy6H6wn9q6b/FVzEPNX22IxvQ3iIm46zU3
 gQ0FK9mStqmjbF+iNILUABd+hmUBXHRLAZ5XV4+jd8QAKjYt7Dzozuq+7 Q==;
X-CSE-ConnectionGUID: 3sob77ENQ0KlmYAJhGYS5A==
X-CSE-MsgGUID: Kxrht+4VSFa32oReTKyYrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87776924"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87776924"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:23:56 -0800
X-CSE-ConnectionGUID: qrVcCyRKQkmwY8L4cPQvqw==
X-CSE-MsgGUID: GAklvGtOT6iP+Y9n4weXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="211214216"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:23:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:23:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:23:56 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:23:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yN48N7iglnBmFGJPQAhGLf8cI7pp3bfly32vAsverfqPWaaUmPTi5g85p4lVD9cEGAeGgEAKecFWIYvn67JQ2KAykRDRCbzJqMZWcWwjHaN518SuuDX0bGxFHMru0AnHZA0VhblEqcerCC+6mnTXSeIo1SH5I78rD3NkEygiAYtTeiIjayclnoCGpBJ3O9exn05LhfECkxJJJ+9YqTSD4P+nY4yXwfZ8Q2vPrRWhXw1A2EIs5svNkUtShitH1Z2NQfzpyTLGgCaRsIfA2SuzTv5qOAzNrrwp9/a0piI63r2Ynl757qITep5F7jS1r+UgI0ceBLTwUXVvhALfRARotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FUwZfkecA5d2644s0BXwtKkcaFrRAu69qoiMfmrqc4=;
 b=POBqIWFTc3DXwJubkYdo347Gg+ZEfz4TPSYq22G2U3daL6WQSH6zSGZyeLskWjK9ZgWpGWgaiVPjMung22WQJ59z2dMSaGlH2oWUTAzVIlV9dcVHkgeg8+sqcEhwljZjBs6295MP8o0udL5TFt14DCfQMqTqFdquA8G7YZy81nRGSErv4hFQqiS6231g+tYf2249xuopdy40dkUunPoscSWKigt/B4Sx38KkdNhvjYOM/lECbg3XH0/HYox5IIcBCEzeIXTGULz0McvgR/J+cv+qlnfke6GZ6EMSSpkktx5rAJLBfkIU9TMUtZx0bZz+Qc4rndan4N1xpdE2cFJ+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:23:54 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:23:54 +0000
Message-ID: <98a49d10-72ef-4dcc-a836-d7b5d21a6ca3@intel.com>
Date: Wed, 21 Jan 2026 11:53:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display: Bump LSPCON mode switch timeout to 1000ms
To: TrainedPro <hassaananwar12345@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260111180320.4047086-1-hassaananwar12345@gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260111180320.4047086-1-hassaananwar12345@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: f62344e6-d6b3-48e7-d451-08de58b5a684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUxubmdQWGh6UEtMRi9YYm0zZmxMNEdsVXg1cUFqd0Y4dW5QeEQrWUxZZzdD?=
 =?utf-8?B?emlXdkRzQm8zaVJMUWdmbE1QQ3JqSzJYVlpnQXRxUzhsYnNXYUVHcFlpQ3dy?=
 =?utf-8?B?L1BvYVZGS1hzRTNUd0Q3bTBTVVB5dDlidXlTL1pqMWxyMWZsMEU0S2NaclFl?=
 =?utf-8?B?Y0pvbUo5ZzV3ZWoxTjRDMmJQeXJCeWljcFNlTksxNDZlOUs4ZU9lRGVqVFhp?=
 =?utf-8?B?K3BuWU1UazBaWG1sZW5JWmk0RlN0WW9UYld6WUR2ai9mcHBJLzVsdFRyTE9F?=
 =?utf-8?B?clBIZmhQTXBkS0tJWXR6Q3pzQ2l3MTdyYkh1SVQ4NzJBVTVCU1Vkd2xGWjlX?=
 =?utf-8?B?dHZMQVpDalVKdGpmaEl5VUtVeHFkZmloVGovTHZqNmpYY3lwNVVFN2I1OGhU?=
 =?utf-8?B?MDRydm9BU3JzWldUVDBQWWwwRE5sbTFEZXFTL1dwdW9HUitZVlVDaEtMUDc4?=
 =?utf-8?B?amloL2hnRDE4eWZobEFvemJKNWRyaExiTHcxSy9sTnRqZDBteU9hQnovOTE3?=
 =?utf-8?B?WGw3UitSMnYrZEpDYmFYT0d2eENCc2ZEeFZOVzdkOVRWa1RGK3hiSDJxVjR1?=
 =?utf-8?B?VHlyTDlhNnJMT29pN0pNS0hSazA2ejNXUkNENkpiWDQwTHo1RFFjKzJQaysw?=
 =?utf-8?B?dzZPRVN2TDIrNkFNekxDWjZBa2pOc2k4SEhhOHhzQ3JLM0lSS1VVU2QzVURW?=
 =?utf-8?B?cXhML1ZQem5ycUdHdUdKSFV6K3B0WG1lZ0N2aFltVm81UkdFOEd5WEFEYkxa?=
 =?utf-8?B?M3h6bm5JQ0Ixc085UzNTVTlBQWRNV21PTEp4ZGV0clVBcHc3dzRpYVNvaDY0?=
 =?utf-8?B?UjcwTS91eVd5YlFnNVU4M1dMTExYNFRWRXBGdmUxa1lSdnJuMlgvWWpJVFFu?=
 =?utf-8?B?QkhHeUNjekIwR2hVQVBMNS9YeGNIbTh4L2pUczV1ZGIwT0YyUk1ybFR0S3M1?=
 =?utf-8?B?SndFWFBocldDdHFGc1BvMFNQWVJ4NlJtNFVGSXVMaUc0SkE1UWNjc2FKdHo4?=
 =?utf-8?B?dEpHZjRvMExaSzFJTGx6VTUzOGRBUnFiS1dXdVpKSnByZHoveTJkNFFoai9I?=
 =?utf-8?B?cXRUdVh3aUVNYVNnVHZXTnBoenE5aHc0d2t3SHRQdjQ5TlF5a3B1TUpjN0Qw?=
 =?utf-8?B?YlFibHV2SlVWK0ZoNmptQkwzVFZaZ3BpSHZPa2lQSnM1NWJUT21iNjBqeEtK?=
 =?utf-8?B?VnpZQi9WYmJ3L1BabjNIcGx0QkpnWVZTemkwM2tKQWk1bktLRUpXNTdRTUxC?=
 =?utf-8?B?K3N1d0JzaU9VOG5oeE9sYWFEendjL3I4eGxPNVErZDU1M05uVHFqOWNKQm1y?=
 =?utf-8?B?dk1MSkJGdEEzV0NiNklqbFloK003ZG1QRXY5V0NtckdSdHpLcEQycmJRWTZ3?=
 =?utf-8?B?L3d3Q3gwOVJrbjRjS2RuTXNRNlpMTWduMVNDWnAyRStPNGpDTUxTdk8xQVR5?=
 =?utf-8?B?T3dvV01RcDRLNmlFK0JzOW03TlNGWTJMUnBWTTJUU0ZGdnhJbmN4MUdnRUds?=
 =?utf-8?B?bS8zZXRUWWRqUysya1NVcGxZSExZUVo0ajlTUjRpQmpCc1YvR1JGSlAycEpR?=
 =?utf-8?B?MUVPNW84RE0zVUdLa0YzQmdaRGk3UjJaTHJ2UnVtNkNpMFVpdk5nQUVzbm5N?=
 =?utf-8?B?R2EyWlBlN2V1ZjFZZXJlQXlXSUwwQ01RNzhGempjRmhBeVBzOEp2dVBsekRL?=
 =?utf-8?B?NnpUNTBUSmVSdFkvVGk0b0ovZ1NVQnEzTDdGczdEbEpEL0VCRzVCeUpMckZM?=
 =?utf-8?B?Nk9mYmZYR0pEYzZjSmhlM3c2VEZvNFhINDdVdDdiMDdLS1NaNjRmbjdzblhs?=
 =?utf-8?B?VU5rc1llZU45NzV1amowd1lPcFVuRnZIaSswZThJUGpOYWZTbkYvZG9XQTYv?=
 =?utf-8?B?ak9NQTlKMW40dFpJQ3JVMnBMUWRReERKdW45ZzIvMi9jUUhDa3dMak12V0N3?=
 =?utf-8?B?MGNsOVpMM1JXcC9uOFU2K1FxR0lNUGE5cTN3SElhWmNLNnZVYlhmMjhQcmhw?=
 =?utf-8?B?eS9YR3pVOGpFdHBsczRQaUMyWmNwanQ1cTZqT2hwbS9tL2hvSHp2ZTY3Qyto?=
 =?utf-8?B?S2VPd3pQLzB6OFhGc1JlNW95SU9IeGRUN28ydnQ4NTdIbjVzL1g0UFovb0ly?=
 =?utf-8?Q?DBCs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BXN2JmZy9ickRodStQeURuZ3ZDLzZoQUhPTWJVQTBSdmJpRWp1aGtOSXpQ?=
 =?utf-8?B?ZGZEd0U2R1IwLzdwODZnaGJqRlJKUExyaHNQTGJhVWhzWmhGSGFzVXozV2Na?=
 =?utf-8?B?RFRzazRKSGhxLys4dmJjd2NJRXBJVUh5cllMVGxVaG9KTFhRVllDbEhMRHJ2?=
 =?utf-8?B?eE9mdmp3QWd3WUs0WW1TMWRua3lJZ29yK3c5dUlUeWZrc2tTblllbmRYd3BQ?=
 =?utf-8?B?NVh5bi9oTXVqMjhGWFA2L3gwYjlYcCsvVnlVV25GanpXUXNPWDc5Q0FRWmNq?=
 =?utf-8?B?bXc1SDczeEZSbHV6ZjJrdkhJdHpZT1hkRzJjN3dGY05HMkVBaVRHeGNPaGsz?=
 =?utf-8?B?Ykt4aFBFZ291UTA2UncwSHNHbVNlK2dDNStGN3ZvVWI2SWZBa2NpN0tGa09a?=
 =?utf-8?B?VThzZ1VSRU5scEJPaEF5cUdiYjFDbUdSbElCendSRkZPc2Z1cTBRbjBHT2xU?=
 =?utf-8?B?MHlXdTZkUmtTcWdMNjFoUXRVS28vVXlMdmk2QWRQVmdQbjQ3U2FmckJSYzFP?=
 =?utf-8?B?RjU4MFdtT2FWSDJ3WmpBTGFEK2JsYy90MXpsb2dHTXZmcHV4aVBVOWMvYWlD?=
 =?utf-8?B?T21vMzRQYnROaGdpUzQrZlJaaklEL3RYbENOQWVXN280ZXZQTkpnZEZzcnpo?=
 =?utf-8?B?dEdzZkNwdWtPaU5FSkswUSt0ck9pTkRKL2ZHQWF6cElnQU1sTDRBZTlVT1lE?=
 =?utf-8?B?NG84Z2FFNUlZVWJIY0J0VVZxRkZTYU9EdGZPVGV5aHlRTEhaNkZFMmN2K1pt?=
 =?utf-8?B?SWhEaXBuZjcxbjBaQUdXRjREb3htWTFINldRWlZNZHVHVG5pUW1uV2VUZDFB?=
 =?utf-8?B?SFByOEdHYTBReDQvcVJiY0NHenFXWFVPekVpRHUwSnJHOFE5c2ZHQjBUWGdS?=
 =?utf-8?B?K2x0dU9oUXNzZ09Pd1d3dm83RnFyd1JLUkRybUJLVm82a3E5U1VUb0ZVS01h?=
 =?utf-8?B?OGFUU1RpaG1yTjNOZi90cEEwSjNlUmV1alVOT3FLVlorWjZQRU9YYmFFK2M0?=
 =?utf-8?B?ODd5SmprcmRNWU9zOGJaNW5YcVFUSEtZNEUvRUwreGcyc20raCtnbEJkRUE0?=
 =?utf-8?B?c0w1aVJPZXp2NTUxSXdKOWM0T3FYZmwxQm5GT1plUVNmaCtHTE9jbGJOOXZ4?=
 =?utf-8?B?SmluenA1VnhaQlB4Q0JUeVh1NkZadEgxVE40OTZxTlNGbHBZdTBrVXFiN3ds?=
 =?utf-8?B?bksxdEk3SC9TSVhEYWVvcHpibmZsUzhKNzRYankzcW4xTVl1WnZiN2l5Qklj?=
 =?utf-8?B?b3Vyd0JkYVU5a2tTVEtSNmRpT2JnMEVGY0VuNHQvc3FSSG1oMkZqTS9vTHl4?=
 =?utf-8?B?UDRraURUbmxqMkdhVzFkSFlZQ3h4MytTa3ArcUc3Wi9GdFRiaUhEVVZQVWRG?=
 =?utf-8?B?OU5Wd1l5cDZnZTR4ZTRUalBMbVU0OENXSTNGNm10SFhTOHkxcEllSmZaT3pR?=
 =?utf-8?B?aXZSU3RLeFVaWXFQeFNqdXRuZWFOcnJ5QzNyQ2h3ODZvZnlNOUJWb0ZxL1R3?=
 =?utf-8?B?cHFjNDlxZGgxSG4xMkNPQklqU0VGblM5Uk1hRFUyREQyZ2V6MWQvK0hnTHQv?=
 =?utf-8?B?bE0wYmc1N2k3VFcrTU05VEFtSVpPbVBjY2lFWi8xT043LzZFanBzK2V6UlhK?=
 =?utf-8?B?Q0RBVkxMNXRHL3A0MzNyOXpIVFMvaEtGaEE2Y21FTFlhMXZ5d0dtTVlmWlFD?=
 =?utf-8?B?Z0xOS0I4WHVVZ3dWNXpiT1hXRWwwd2NabitGbW1qOENKYm1XVm4rd2s5THp0?=
 =?utf-8?B?UXBlNWdmQ1dRS3A5cHo3VmtFRjNXak5kRTFteloyK1lYMlE4WnhaYkVYMFBo?=
 =?utf-8?B?V1N4dnR4NG05RE5ZcWlqT2o2Q3FMMGt5NEhNNkhjVUhZZEYxcVFVVStRamEw?=
 =?utf-8?B?UHZIdkNDWGxJTTJ4NVh1Q05wSEtQa3U3RnJSQVFLN25yekdNWWhrQnNXaU1U?=
 =?utf-8?B?M3RPNm5VVzFCOHE4VjJCNVcrWjFUdHMvK2VKSk5rNzZXaU52S3llVlNFZmNh?=
 =?utf-8?B?YkNPZFNlNVB6bFZvenprSktNeGgrcllmTGY0SnBhTCtWUW1JbTdMdkQwL2ZZ?=
 =?utf-8?B?SmdmbXQrNEtJdmFIdnltT2lXUVRWWnRjWUw0aGRLeGJoajZsSE10N3pmaWhl?=
 =?utf-8?B?dDBHNlVLaE5zYU4zRVljWUpjbk13a2QzSXA5OWRyYkJTVjd0Wkt2R0RzbVBJ?=
 =?utf-8?B?RFRXZWJXbSsrbTJ1TCtINk1HeVRkOHg0R1JURE03d1hxWjY5SkpPNlE4bnFv?=
 =?utf-8?B?MXZCVWY0d1JjU2V3NEJtK2wrcG9GVUF2S256UVdPd01NajBaSHplMEhyMXJC?=
 =?utf-8?B?OTFTUWdjQVJYZXBoUE02bFV3aDFteFE4a1RvSGw0TVo5ZUZyVjg4cUNrUnNa?=
 =?utf-8?Q?2aNu+BbbAwb0Vr1c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f62344e6-d6b3-48e7-d451-08de58b5a684
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 06:23:54.3243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nfJDTqh1Rr+5Hm0+iop5+Dbq6PNDPJBWgrJyAsXWW2Z3oG9UtAhriSY7ox3mmcKkAUgnq32aQeh/afJWu1ZiofeJMlU3Nyb28wKCT4aUN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hassaananwar12345@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER(0.00)[ankit.k.nautiyal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:mid,intel.com:dkim,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ankit.k.nautiyal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D8E8652035
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 1/11/2026 11:33 PM, TrainedPro wrote:
> The Parade PS175 LSPCON chip often requires up to 800ms to settle after a mode change, particularly during resume.
>
> Although the Intel driver (intel_lspcon.c) is aware of this 800ms requirement, it calls the shared helper `drm_lspcon_set_mode()`, which currently hardcodes a 200ms timeout. This specific implementation forces a 200ms limit, effectively overriding the driver's knowledge and causing the mode change to time out prematurely, which results in a black screen (never waking up).
>
> This patch increases the hardcoded timeout in the helper from 200ms to 1000ms. Since the function polls for the status bit, this change does not penalize faster chips but ensures correct operation for slower ones like the PS175.
>
> Signed-off-by: TrainedPro <hassaananwar12345@gmail.com>
> ---
>   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index 719da3610310f..fda3cb4966adf 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -495,7 +495,7 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
>   {
>   	u8 data = 0;
>   	int ret;
> -	int time_out = 200;
> +	int time_out = 1000;


The change to increase the timeout was already made more than a year ago 
[1].
Could you please try with the latest drm-tip and see if the issue still 
persists?

[1] 
https://gitlab.freedesktop.org/drm/tip/-/commit/2e0727c347467775a2dfa7d850a3a029f3212e58 



Regards,

Ankit

>   	enum drm_lspcon_mode current_mode;
>   
>   	if (mode == DRM_LSPCON_MODE_PCON)
