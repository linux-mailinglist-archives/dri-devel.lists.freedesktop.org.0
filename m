Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC66BAE4DB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A313210E63B;
	Tue, 30 Sep 2025 18:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+7DYRzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF40710E626;
 Tue, 30 Sep 2025 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256726; x=1790792726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+FOpux1F7Re7IbpfZSQYyUqXWAINgXU7aXlY+BJndEU=;
 b=c+7DYRzFkHATlSxAH8UceytSlX48xKfybajDIrTkjN6LJuzXekYW8qxL
 wx4SoXJwjJ81nHXspMCojdX5TGNkRwP5nrEsgqiElUNRNpQV6mMnhpyey
 m+YxwAO020RpAOUC1bqeT7WoBC65yu7Eu3wP7mXI6JkuY75TOKJXFHUhb
 12fgOcAEtBX7/hpoPMKIrwOFz1TEj6WT/8Qky4/1PP63apTCkt63YmBxB
 SPinRwe9n+VInu5WQEeTYT8McjWysrJFAKAaNTjYX+noWOiL1rU6agnl5
 zf3ryLeB3Bu2uEx9lpsQSvoRaajMNdrijVVs7icULraZ7o+s3salRaJMl Q==;
X-CSE-ConnectionGUID: u6sIDuG2QRe3j8GnzPQAxQ==
X-CSE-MsgGUID: lxRqGMXaSw2MSmFs6LQ9BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61634172"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61634172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:25 -0700
X-CSE-ConnectionGUID: MmbW0xh7T6O3FAlfPntyLA==
X-CSE-MsgGUID: biABDbspSXiz65yl4L3iPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177863745"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfHy+8ZQHp4lpQFmAm7OHIeT+yRLEODw1GcSXR9dVRHSaZZ4u3Gx8IFS7j7wynvwkc2AcPMjhJCVcB7PfZcub7mmUa4Xn6qq6IWtUGRXPSYUl3/EqkNUSL6cnzupyAc4hwFLlgDFzyJkI272uKh5+Kf9E2S/5Dnqnt4ZkhBQ9f+d1uk29tjMwwHLRKagkCsP+acNhqdyKV8H/T0m5QDXRr47D9xc+kN37rUIjCsHYXpk1zOBw/FpvsbsZQXBrQ9MldfaP6ibO1vMc1UM93IGQKvGcNxWqDPAgQgHRIvjMfGJwOPfB35rGpKMyUVK5zNhJjiWBmtYpUW0YO8nTrQVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/XuNA/Bvd3bhfsFct6DuL9+m9B58hSh9tIUtsGo4tM=;
 b=iakMvYVoDOGwnw8+F3Wu/eVXURSyHUfPrdN2PLRi/5+M6gLj7qjOtSkGMSO2e2YufrDAqUJWv91RCHvDSgnbyG6ZKhjQuzmr2tMOJczYVD1gjldoD6J9Fj2+9pj1Y3SX3D+Xkt4zKqYZZU5MgwJGgwnkVPv3Sm9Z3VQ+CI0PfvV2pACcoX6bWJpkFmHlMSmesfMI8v3BxoM8GvyelQWCzYspTa9gu7B3I1Re4XynMse5NcwsiczZi6hqgRBLpMxRyLu+QZztIaH2aNSR1khcduVI4/u/cSN12wDfDTbsNGDdBcksofDyrUEAAOjZSi5kT0C5y6T4Cyv8+bXJbtioaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:18 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:18 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v6 3/6] drm/i915/dp: Calculate DSC slice count based on
 per-slice peak throughput
Date: Tue, 30 Sep 2025 21:24:47 +0300
Message-ID: <20250930182450.563016-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: b386eaa8-f669-4961-2f54-08de004eb516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkdlbjhkV2phVjFWUEM3QTdiWFBOU1ljWk9mS3h1NEY1L1hGelAwcWJHNzlq?=
 =?utf-8?B?WHhQV0t2Qng3QzNqM3JENDAvSjJaRDFMRTJBOG9GNURlbGYvMHllbzBsbkky?=
 =?utf-8?B?OHNRYkYwZVROSnR0MFZ5N0lUMU5PVTFpVzNpNld0djhmWUZXQUFGYXpUMXpM?=
 =?utf-8?B?S0hncThoQ1ZzVGNLNkl2aitQZFYxT1hMK0w0ejEvcWlnc2krT092R1FpM0Vo?=
 =?utf-8?B?OXVaZ2dydi8rMTYwQ2tBWWVnWkZUdENORW4zVUJ1bEJ0ODN4WnNhUUltUjRF?=
 =?utf-8?B?MEhWRHZOWXYrMUdyZnVBZnNvZi82V2pUUjVkNm1CSGZWS2R2OUxkM2xiT1RH?=
 =?utf-8?B?SEpWaktQeTVzaHpVNXh2VTlrUVduRDZEYldCSzBoRWVGQW5Qc24rbVhPMk44?=
 =?utf-8?B?b2VRNWZLUHJOVE92ZjFKbkFhV2hmOC85R2NNUDZleEpOTEpDSHh5d012ODYv?=
 =?utf-8?B?OU0vVWptK05SaVJyTkhqRXA4aE1jREtBcmpZK3lKbmVBUnhQeUNQanFLZGJN?=
 =?utf-8?B?WmEyc0dVTDBIWTY4S3dwMVhiRGJZZStPSzhGRVduMzRRUW5qVWhaRVlEd3N2?=
 =?utf-8?B?SjVrdU83ZnpJYzJITUxIQ255L0lKbVRIbnk2c285WjNGN1J3cTk0TmFQUkU3?=
 =?utf-8?B?ajQ5bXFEYklRQXJnYldBRzZvRkU4WGYxa1BOZUJZeHI5c290RnlwRlQ1aVBU?=
 =?utf-8?B?aDg4NGJsdVo2bVdVSm9kL3ZNdllOeU0xT21FQVJQS2xySXc4RVI3VTN0cU5x?=
 =?utf-8?B?STVjU3VWSTdzR1FSOW5jdGFEL1FCRHR6QXNRb3VRdjhhUWVNY2QrYmt0elIr?=
 =?utf-8?B?VE5QTEptOU1zVjJoSkNhSXBkdDRkbFlVUW9DRFoveTZ5akFFWDQ2R3hpMnZs?=
 =?utf-8?B?OWdmem9ZOUJpNzhqbVREN0NyTmRSemFrcmVYeVVGcktGQ2xyQW9DUGNrSnFH?=
 =?utf-8?B?MVhaRG04cGpMYmhDRFp4NCtVSmZEaEcxTi9WbFJjUk5MUlZDbndzVzFINjUw?=
 =?utf-8?B?NjlCR3hzTFdYdUtEREl2VDY4YnVYNHM4OXcxeFZDeFNaYTh6MFBxNHFibW1K?=
 =?utf-8?B?U1M3RTJ1ajY1dXhUMXFMQzN1Z0VURmR4Sy9qbXJkQnVQRkc2SXJVVFZYdzJY?=
 =?utf-8?B?QjVpMTN2UFphQllKYzV4ak1CSmh1b0pLRGIxa2E3L2NocTJDTEl6ek1JSU9j?=
 =?utf-8?B?VHBjaUtOcnBUUUFjVDlvdzlPVytSRUQwb0hvQjQrTkJHeWd0QWNNbmJyUkM1?=
 =?utf-8?B?MytBaU1zUHNqZWZuVUFCWiswS1d3Qng0YnU0THhUVFFJMko1QTFUY004ZCtV?=
 =?utf-8?B?emo0aFFoUzFEYmVDZnFJeE13clB1MlBOWWhBRTEwYTB1b0NtNkNhRkMvdTRy?=
 =?utf-8?B?eVVJMzJhVEUvSlZXcjlqQWFjVUhEUFREWnRIYWRtK2w3Rk1vdUE0dmhMdnlq?=
 =?utf-8?B?SS9sb3hUcksxUE51d3JzUmlIWGk1eVJsU3B1K0ZocUErMk5IYzFrcWhHS3l3?=
 =?utf-8?B?eUQrWDNIbk5kMUxoSi8yUHFTMEw2ekpjRnFJYkRuKzNVSkVXSXJaK1drbWFF?=
 =?utf-8?B?bEdUbTM1NEFBakdBaDBkZzZtZHhOZ09EWnh6a2xoNDZTR1lHWldaQlc4RUEy?=
 =?utf-8?B?bzZHZzFLakZSaHhaZWJVcXhvS2p4ZFRSSkNET1ZQTVp6elkrUTJObnFkYmJr?=
 =?utf-8?B?ODdKaUpvNGNCRTNISkc1dDZEeEtTM3dpMVhmVm00eURjeGFIRllEejY2bi9t?=
 =?utf-8?B?VkRKMHRTME9NUnNDQWpBMHNneVUvUldCM2pVUnJMZ2lHK3p4eHA5aUdkdDZE?=
 =?utf-8?B?aHJvaXZmR1NzczV1RndpVGhIOHY2NENJbk1xNm5GUkRwKzlndG9Rd09YYlAy?=
 =?utf-8?B?UUV1b3JIblYyNGxVQjIzV3RTdEw5WnF2WEhHcTJqOVJ6SkoyTkltZzVCOFRu?=
 =?utf-8?Q?8BW/WySI/PHoMMs8/3Moh5Fq4/W5IdpZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXlDUk8rMUF4bXd6STljc2lsVEd6L2h1Q3h3NVBhcFVzNU1BbVlNZll4UVF0?=
 =?utf-8?B?SzhCKzhub2ZaVWtyZ0hKb3VKQVJaSDNudTVYY1NzdWoyMkdnKzc2Sk5pN3Fr?=
 =?utf-8?B?ZXFXdjRFYUFqN25BVGtKbDJlVEJkeWJFdmhGTGNkczEvNDh0bmQ3M0MxSFNL?=
 =?utf-8?B?bSttdExPQmZDbGwrNUc0QllFempsY2pvUTgzVEFzTEVua2x3T0JibTF4eWtG?=
 =?utf-8?B?WHU1aWRKb0tabk84Uk5RL3I2V2VZb284TStlYzd5VnRPTmROSjJnS3VEcXBR?=
 =?utf-8?B?YmZla3FJT21CU3FTZmJNL0gzRTFnak1qUXlteHlrM2tWeHJldTQ3VzYyTmlX?=
 =?utf-8?B?TFFKZUIzdDUxY1hreVNRRnpnMU9ocTZGbUc1NzNJNVY3YVlJVGgxRXlpcVls?=
 =?utf-8?B?UHl3RmRCVkZzSjlSN0kvVEM0cmlXbFFTRjJTVzNTM2ExZ2VtdVJaRytRV2xZ?=
 =?utf-8?B?SXByMkJ6OTFPTlJwTmJKN01kSjE4REJRbEZrbS9FSWtmY1F0Qmk2Q0JRMU9R?=
 =?utf-8?B?Z081c3VURDBWY3AvUXhjRlJxVklDZCswNlI0L2RPMzNGaXFqN2k5bFpKK0Rm?=
 =?utf-8?B?K01FL2VKUStEYkpaNmswcDF6bXp1U1dBQWM3TmFvN0hLdXd6cHgwdXNjRGtW?=
 =?utf-8?B?QVRkNVo1Z2hLM2JhNVA3NFFMakkramsxb2ZuaHhBbjdTMmZObFNnbGFmQy9X?=
 =?utf-8?B?Q3NQREFhZTdmOElYandpU3gvd1hYQmJCWGd0ZGhYcnd4dFhIYUlpcjdJMEly?=
 =?utf-8?B?SmZZUFJFQkxEbFZXL3RjWHVCaGtLNWc1eGkvSWZBZE9IUWQzdGYzZVdrUm5p?=
 =?utf-8?B?ZFFvQ2RvU2JTcithQnJ5Nnphejg5aXNORlBMM1Vtd1RPKzQ4SHZiakI0YzhE?=
 =?utf-8?B?T05wS2djMlAyQitnK1VuRXdwalFRSGlIQ3JZcXBIV0UvQ1kxcGxRMTV0dllm?=
 =?utf-8?B?U2NFWStzbVcwMXlTNUFRYWxJM0VHQ1FFbTNDSm9ISEdnaGRmSHBobEs2RUpm?=
 =?utf-8?B?MUZpWHh1RUVvK3ZpWjcrM0crTTV5WlBxUmtqMEpBT21iWUxIWkx3czAwLzAr?=
 =?utf-8?B?b2h3M21veGlvbVBuTHJTYmpLdUc3Y2MvT2VlOWltMnU1d1FNUFRLMEo2U1c1?=
 =?utf-8?B?LzVlMFpJazcyY2oyUjhienVjeGVBM3hFZ3didDl6N0VuUUxRTkVZQzlSZ1pL?=
 =?utf-8?B?TG9jcW9nTk14TStqZGRQZzNoYm5ZbStyUlJtOVpDSGdqZmN5SGVka2pFR3pG?=
 =?utf-8?B?ays1dS9PMHNiOHZURUxGUVBRTEh2aEZ6b3hpK1k5R3NnM2JZcXA0SThlRDBz?=
 =?utf-8?B?YTZScXh1T2dTQkFmVEVwdmh0Wkhpa2ZVNitaQUJ2aFMzK2F0R3N5RGh4dGlF?=
 =?utf-8?B?eUczZEhob1Q3cEg2bitxbmpTMHRNS29hTmsvK0Y1eWRFajZvbm1sZWl5MFZv?=
 =?utf-8?B?SkpwZmJCS2k2dFF4Q0ZGa1dLSGRZaTFSaEJDZS9MaVZFT2svQ3NXa3h5aU9Z?=
 =?utf-8?B?aDRMMWNubWFURll1RDBYTk0xZWZBcTNFNVdrdXBUaFNURUNldnNpbk1QazQv?=
 =?utf-8?B?NGVUKzZSME9BUkxPOFFFdmJYekQ5cUl4VWNsYThSNWI1ekh4OUpCQWhHLzBL?=
 =?utf-8?B?dGdWdDUwYzF3dTRkdUZkZDhjTEhESnhWMW9qRG5qUXVzM3NmMFNEaVo0Rmxu?=
 =?utf-8?B?Q2ZNSzF2QUgzWGJReDU5ZUhXdDhNOWRVYjFndUowLzcwTFA2ZGQzWjFsem5Y?=
 =?utf-8?B?dHlWVzV6RHAxYmltWXpxcjRTNHpyM3VRMjJoVC9ITm5nbCtZRUZEeUQ1Tlkr?=
 =?utf-8?B?b1RubytYaytLVXNLUEN5L2pPOW0xayt0aTA1MTN1SElwdm4xclNTU3hva28r?=
 =?utf-8?B?bktsdVg0c0hBTDBRSkZ5dk91WDcxeU5VUmM2aVhwcGUrNjdRQVRzWTNiRlVj?=
 =?utf-8?B?MU5jL1RSVlEvMUF4MHJHSzBWTkprYURScUZ3VE44VEFxME5NM1liaWZuNnN2?=
 =?utf-8?B?V3AyRHpaQ3BmYkM3YnhpZUFrT3FkSGN3TTc5NTFuYW1pTUlma2F4NXg5cGR1?=
 =?utf-8?B?MG8zbkRIWVl3OVZTKzVlZVNjdkM2dGp5Y3B6dWFkWjZZRGNlelVsZnBxTXdI?=
 =?utf-8?B?Uld2blpkcEZkL3lVdGh2RGk1WFAyYTlucC9RK0JYNUdoZzhSMWp0VXJtS3Fi?=
 =?utf-8?Q?7HQamWR7IqYekEwKSHsrBElg78TrM6NcELx/E5MQN9cs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b386eaa8-f669-4961-2f54-08de004eb516
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:18.1373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSCDnxMDOqCCu2dppLwxISe9qBsWTO7lTTNpiIKeTck2/aou/bVLzVYo3j1DRI6dchPv1oVENWUwYWYSYWDJZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

Use the DSC sink device's actual per-slice peak throughput to calculate
the minimum number of required DSC slices, falling back to the
hard-coded throughput values (as suggested by the DP Standard) if the
device's reported throughput value is 0.

For now use the minimum of the two throughput values, which is ok,
potentially resulting in a higher than required minimum slice count.
This doesn't change the current way of using the same minimum throughput
value regardless of the RGB/YUV output format used.

While at it add a TODO comment for MST tiled displays to calculate the
slice count for these based on the total pixel rate of all the tiles.

v2: Use drm helpers to query the throughput caps. (Ville)
v3: Add TODO comment to account for MST tiled displays. (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 33 ++++++++++++++++---------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2eab591a8ef56..491a804c1f6a0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -96,11 +96,6 @@
 #include "intel_vdsc.h"
 #include "intel_vrr.h"
 
-/* DP DSC throughput values used for slice count calculations KPixels/s */
-#define DP_DSC_PEAK_PIXEL_RATE			2720000
-#define DP_DSC_MAX_ENC_THROUGHPUT_0		340000
-#define DP_DSC_MAX_ENC_THROUGHPUT_1		400000
-
 /* Max DSC line buffer depth supported by HW. */
 #define INTEL_DP_DSC_MAX_LINE_BUF_DEPTH		13
 
@@ -1018,13 +1013,29 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 	struct intel_display *display = to_intel_display(connector);
 	u8 min_slice_count, i;
 	int max_slice_width;
+	int tp_rgb_yuv444;
+	int tp_yuv422_420;
 
-	if (mode_clock <= DP_DSC_PEAK_PIXEL_RATE)
-		min_slice_count = DIV_ROUND_UP(mode_clock,
-					       DP_DSC_MAX_ENC_THROUGHPUT_0);
-	else
-		min_slice_count = DIV_ROUND_UP(mode_clock,
-					       DP_DSC_MAX_ENC_THROUGHPUT_1);
+	/*
+	 * TODO: Pass the total pixel rate of all the streams transferred to
+	 * an MST tiled display, calculate the total slice count for all tiles
+	 * from this and the per-tile slice count from the total slice count.
+	 */
+	tp_rgb_yuv444 = drm_dp_dsc_sink_max_slice_throughput(connector->dp.dsc_dpcd,
+							     mode_clock, true);
+	tp_yuv422_420 = drm_dp_dsc_sink_max_slice_throughput(connector->dp.dsc_dpcd,
+							     mode_clock, false);
+
+	/*
+	 * TODO: Use the throughput value specific to the actual RGB/YUV
+	 * format of the output.
+	 * For now use the smaller of these, which is ok, potentially
+	 * resulting in a higher than required minimum slice count.
+	 * The RGB/YUV444 throughput value should be always either equal
+	 * or smaller than the YUV422/420 value, but let's not depend on
+	 * this assumption.
+	 */
+	min_slice_count = DIV_ROUND_UP(mode_clock, min(tp_rgb_yuv444, tp_yuv422_420));
 
 	/*
 	 * Due to some DSC engine BW limitations, we need to enable second
-- 
2.49.1

