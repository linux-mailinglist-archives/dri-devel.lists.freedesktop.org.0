Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360A9A980AB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727BB10E0C6;
	Wed, 23 Apr 2025 07:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="lYaZJFnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD8710E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3nQs3BeDh/sxltz7WC8jvpluJ9F+CFwYmtAn9fY9frzj9y5lhjP7BNNekaGhCAdGrTaA+JhVneynT4Dv2R2mk4UAXahC8LNfsPUl7Xrs8CK260k4u8BcFA69JwgJ3PGImaSmdl/XmBNCGpGu9EMuR9qnsfXwcSVuVG3Qle2jHCCCJVwgFI8jAMy/QyAZtYOtF/1mLT9P/WdCVnQLAO8lfpHXBy287MH1FXum9O75b7dGqX9P7BI3RZxzKBqlkqdtZ9RrKKNNC8HABvrXh4LJ3kuvHvbVjF2Wouon+QDk5OuvCxSVCnTPzann6iGgam7+lG7c6Fsj0IPbABiTsCUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/Hher/0vVjuQFLizgUG0Vq+oluo6oiEEymW8fTbIiY=;
 b=TkZ1QUsY7QGT9T/Oie5DHSP0xOH4A7LFu1ghzytnl10dVDshleOlFj9sonTtqhFWw/PREbiea5sPY37xV+XrSLZfsS5ff8D9FcCUFmvas2F2rAUW/gyvcuOTT3ngRC6kZ+/taLy60P/JmOD43cJt9JZNi8ug6pkBpUMZsUE2kfrrY/GmrFcLCBUwPPh0UqNOnYosApXAZ1R4exjYTLyWb5F0YvadmyA0gdRYaE5DKqakj/HFLxokmbS2rFM5ajp2/z2FUPnfwJE11+hq/O6tJmB8aSrydTXenoH3EdIO8sCrP+ODlKANp4bRfUVNNy90Pm4Xw5z7zymshcoCFVJAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/Hher/0vVjuQFLizgUG0Vq+oluo6oiEEymW8fTbIiY=;
 b=lYaZJFnPdL90FYAjzEWZhvHTJy8tuQWgDbpmuenw0oJOFeSz7O1RF/UPqx3SRnYrhuWWIZxp57Ur4dsGK0HzO39FvmxIxhMcH0nT05RFeXJ+pBi397c397zoFec89tuRwgQBuCN+LdfZKXgqezY5hZzo20/AqGMPIgbiFJN37AE/i4IvWEDCV9f4qDAVhw/PdBENb7EuAdYF4oEw/S1o//uou960pMknvsjrYfIawii+iqDVAcxQupuWT6kuylHC/QgxI0QMpIsZO4BUeOcl+gahqOhBbu7KiOp6TYjOYQDYf9/LyLaI0+F8kbxT2mWJbooHp/MwF/sh7i36I9s8hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB6853.apcprd06.prod.outlook.com (2603:1096:405:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 07:25:51 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.8632.036; Wed, 23 Apr 2025
 07:25:51 +0000
Message-ID: <bb249aaa-a51f-4a50-99de-dd6ab5d71898@vivo.com>
Date: Wed, 23 Apr 2025 15:25:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] udmabuf: fix vmap missed offset page
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-3-link@vivo.com>
 <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 680ff38b-ebc0-44a6-1b7f-08dd82381330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0lyZVB4V0FKc1RVbnkrMXhBK0swNStJUFA1MnpBd2wrK3R4L3lVZEU1VFZ0?=
 =?utf-8?B?RFQ1Nkl6eGViTWZBdjJDN2NKNTdtWTM0TlRwSHRHQW1LVEEwYXJiZ2k2UFZw?=
 =?utf-8?B?Uzl2ZzVEa2FteUFONmFaTnNzRVVRR3h5NktvbUR6UHpxNk9USkN6V00vS3R2?=
 =?utf-8?B?bWYzeFRhaEtCSzZYZ01ERzYzZElldjdaWFRNVmNrZjlKdWtXMElVM0tIM3Fa?=
 =?utf-8?B?WHNRbVlSUERjYUtaNitPUTBob24wRmh5VUZCcUdUazkzYXVPVnVzalBwd2Zh?=
 =?utf-8?B?RTBUdGVTSEhpVDgxaEhCajdMbUxXcmlTS0NhckZRZFE1d3YwbGsrMXVxa2hF?=
 =?utf-8?B?bDlqWk9jSWIwelR3Y0ZLdUpPK1lRY2lIeGRIR3NKaURiNThtbmRxQ0NDNEh0?=
 =?utf-8?B?R1dFZTBkS0NYSittcjVzYTBPOGVNUTJKSEVaRmFHbk1DMnVBRGEyTi9tRFJ3?=
 =?utf-8?B?UXRuVmlkMERXZ0V4NHdCeW13T3NyOFRyWnA4SGRWZEszMlJWYnhGcFJMK0pE?=
 =?utf-8?B?M1E2MEtFRU5GdFNoVXJ5TGxHSW0weEQxS1NadFhrMlJJSk9Xd01ma01sQTdF?=
 =?utf-8?B?Nzg1V25McGJ1em01UG9obS92Nko5cHFjSVN5VFhtbEVlMy9kdGxyRUdCZ0hC?=
 =?utf-8?B?dGlDbHVhYjhwV2ZQZnA1Wkp2eXBjSVJLTzdSU0FVMWZFaWtpbVo5UzY2NVB0?=
 =?utf-8?B?WTlpN2ZTZnl3NE5Sam1vTlArYkcwRWI2TStYTjJ0Si80Vm0wUnEzcWJ2amRP?=
 =?utf-8?B?VWpheC9peEdWVCtQZ28xN3Z6d0RmM3huWG53b0RneWF6SVZJZGNkNm03cXEz?=
 =?utf-8?B?U3JsL3FMRnBkejcwb3hhU01FeS9sQ1JhVmZKcU5oeHlWN2RwWTJJV0xVVERU?=
 =?utf-8?B?d0tlckkxSk5LRjlGd1VjZXFtSXVMWGhFcEJQUDBLdmw3d2NOZkNqbUYxdGFW?=
 =?utf-8?B?MFk1eUl0aHVyWUY4Q2x3OWc3ZURoNkF3ZTdNQTNvQ1hyV3J2a0dPenBYNnRp?=
 =?utf-8?B?RnFQNmd6MjZyampkVHdJS1JMWUJxYTdiVW9CSzFGK2UvSXZzaGRqeExpRXdE?=
 =?utf-8?B?WC9ac09hakk1bGQ5VFlQTTJMbDlFMms0VU9rNFJGbUJrR2xqNCs4SWdzQmt2?=
 =?utf-8?B?ZVovdVBTZDQ5U0pVNklvV3RING5FMWh6VkE5RG5lZFZYMzNaYUgzak5uWktL?=
 =?utf-8?B?YVV6ZDJ6SzVGTElBeVRPQVpERVJiNFJkWFpCbFhHOFhaaDR5RWsva25iejRZ?=
 =?utf-8?B?QzdvRDkzd2FOUitneXlFTkUxeGNlSDAxanhQdEVkVjlVS2t6TTQrRGdhNmFa?=
 =?utf-8?B?Rkp6YzNNTDdBQ3BqMFo2a2VSYU1xYmJmNFNXQXdYWmhtYmRVRERudkVqSThQ?=
 =?utf-8?B?TzFIQnR0dU9XRlZyRnlyM3l0VFhyaWdKeXRHRERYQldpR1FIOHprM1d0c1pN?=
 =?utf-8?B?SHRaRE1ObVNLT0NmTGcxNEFOSzlPVDVubkpjT2YycUs4ZWx1d2pDWUxsZkQ4?=
 =?utf-8?B?WWN2SEk4MkJ1V2FiYVhsZUN1djB1OUZDZFYyWW1wcXE5QllnVUg2MEJsZWNQ?=
 =?utf-8?B?b2krcm8xQ1E5VTc2Qyt3ei9Od29GVzdlQkx3NTNGdWExY1JhSXBtSVNnc1Z2?=
 =?utf-8?B?LzhmeHhOcU5YSlBtSkhEOHN6SlNncnBOYzdhRDJFMytuOG82cTFIdlZGeWMz?=
 =?utf-8?B?aFFqZTNPMkVQSmUydVdWdUk1aXVGd0oxbXE4Z2RtS3pmckd5a0llTkl1K3V5?=
 =?utf-8?B?VDUyYWg2dDBJOXlBQmlTdUV5SDl3VThUV1l5MXdYUStVOFlYSFNZRjBja08z?=
 =?utf-8?B?cExhbi9HSFA4SmYrYlhpRjdiRStwY3Mxd0x3RUUxRXFEZng5SWRpTTBueTRM?=
 =?utf-8?B?OURZeGs0cjYxdS83QmpCZDEvanYyMXN2WHo2VTZOYVBWMzNFTW9KK2FJbjd4?=
 =?utf-8?B?cjdEMTcxOW5yZ2M5cm5MbDF5U2N0cDNJMkhWVXdmS2R0cXA3SHhXMlZPSmNr?=
 =?utf-8?Q?Gzr1j0mo4REdq+NooUxSumYFiXGE64=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpuRkhiUHhzSGxkNHBBeUEvUEdabVhWNVVZeWdHSXIzUHp2QWNUcW43SU1I?=
 =?utf-8?B?bW9PZHVCNThyVWdJOVovdnFMTXRNT1VwZkI2TEx5WmRTVm5aYnpWM1A1S0Vq?=
 =?utf-8?B?WXVpZVJIVjFVd2hNMy9hUWYzeTJOdlEzbFI5NkFVdGduUGplOEFmcVN4NlpD?=
 =?utf-8?B?Z2xxdkMzK0pYNGkzai9sMndMTUwvTXk5dkRBZ3YvM2ZTdC80ZmZoYlpGcS9j?=
 =?utf-8?B?dW1SUWVaMTZsVk5PZEc2QUlUL2gvZHIzZ0k2RmlsaERKZHdFS2ZvaXVzVktj?=
 =?utf-8?B?ZGltRXNWaU5kUDNaMG1RbGNYTXNpZVVXSVQ0bGJ5K25DMndQL2tVaVBJNFA2?=
 =?utf-8?B?MnJZblluektqaFdSZTlUMGg2bUZqejlHK2dkbXRHdGJLZEVxK3JBQ2Z2Wkts?=
 =?utf-8?B?OFRjTFpNL2pHazR4K25aRGpLR2Y2dll4dVZwZFBaV1Boc1doZTFSUlJpQzB3?=
 =?utf-8?B?VytsR3dDeEplTEZSODRXWVI3RHlmYXdyT2NPczJKNFFyRW94NUJ4RDNlWCtE?=
 =?utf-8?B?bkYvM0lJRUdtQTY5MDR0MUxWY29PN1V5LzJoa3E0cXlKRzVxdmF6bEJsSnNt?=
 =?utf-8?B?a0dKNWIrU2RidFdEa3YrZHRvNVJZOEU0a09ZUXNZZ0pKRG5MK3B4NlRpejlw?=
 =?utf-8?B?d1ZOMExaQ1oyWkYxUFpZdGR6MExOenVNRHRnQmQ0d1VjT3NxRWtlTDltVXNO?=
 =?utf-8?B?ZCtWeDF2M0hZQXNwNXpKR2w0c3lXRUY4YkoxUlowQTNaWmV1ME1tY29lSmZF?=
 =?utf-8?B?MHFwSWZnQUhvSzN4VFl3NWRwV3FBcGR4TVZnVXprTjB4ODdXeU9tVFYxZ0Ur?=
 =?utf-8?B?b0xYQUxZUmpIdnhRRzU3QW85RFVLKzROdThUV2FySnVlOWFpTjF0QVNtTEwz?=
 =?utf-8?B?TW9wT2JxQ3h0cGoyT2xaSWtJLzdKZ3B6ZE4xN2xKcVJpWGNRWk5NU3BROUdG?=
 =?utf-8?B?SSs0MlA2L3pzMXRVSTVZL1Bid0Fub2tKWjVZQzFqZkkrUXZLc2QrZ0djOXJF?=
 =?utf-8?B?Ymd5L1I4VmZXZTMwNnBqdDZIanZSNDJZMHNqU01oSXVaOXhNQ1hJN1hjQlJF?=
 =?utf-8?B?Mzhoby9BV3RyZ0ZJR3p6RkNHZmIxR20vWlZPcS9qL093Mnhmam5ldldlSnU4?=
 =?utf-8?B?c1UwUVNjNi9VQnlSL0grMDFFZTk0VVhkTG1zZWhndUcvd2xFSFpidUhncFhD?=
 =?utf-8?B?MjJKUXhBa2RNWVpqMEp1VXhUZEdMb1NQUUQ4M0p3UFIyNThOU2V1MU1JZ2tS?=
 =?utf-8?B?YVRRQjNmVjVNek9FUjdlK1ltbU1pYjFsdmdhWW9PeUVEbERRZU9MZjBYVGpl?=
 =?utf-8?B?YmxkL3RlblNBVkdqUFYyTTM2UkZoYkhkTjBEdWhjTFhmeUtINHdHdHJpMXdj?=
 =?utf-8?B?Vm53QmdVZWxvRHREUEZwaDRySC9kdEEyMi9lZVd3eTJqc2RWTERJOEdBa0w2?=
 =?utf-8?B?d1dIOW1nQTFBcXJ0VDZYNjdTamlEbmtIcTFNdkpDZUxNREpxQTltVFArb252?=
 =?utf-8?B?VzREWHJudnRtZXN6aXNDQ3FzVkNTVHlIRC9CdURnVEwwRytQdC9USVZOTTRM?=
 =?utf-8?B?Q3Q1WHhEUjB6RUdHTjNoWWhUNnNDc1JwQjkwTDBXT1JrcCswdGR2QkhZZnNN?=
 =?utf-8?B?ZjVGS2x2R0h4V2lOZC9qQWd3QkNHMnJmQkJKZ1lhd1ZNM3NaeDdPNWR0emxa?=
 =?utf-8?B?U2UwMFMySjE4UVp0TzBYT1FjT3JLaDRQSVpnNWd5OS8rcnByNzc2eGVrY2ZQ?=
 =?utf-8?B?YzRFUFRzWnZpZVhoSUpHWjFPMGdXTTZhbE9vZitoOTMwZVpsc1BqZEx6U2JM?=
 =?utf-8?B?aDRSZmVRUThaK3ExbDFJRGhKek0zWEVBdm93WWM1UkR4dlV6SzE2MWZseUtW?=
 =?utf-8?B?a1dpQy9Sb2FzekJ4NUJlU1RWd2hITU1DcnNxb0ptdHdQa2owR2VFblFYdjRW?=
 =?utf-8?B?angwYmhFblVWbUEwVi85SmhoM25EYTljSUFmNHJyaGtYTC8ycjZnbUU2WEZW?=
 =?utf-8?B?SEtkRUpzNzJxUDNoVFdOWTlLcUFwTm5rWDhyMFV0aEpKVkdnVmFPZ2VpSzZS?=
 =?utf-8?B?b2VJOWxLL05ldXdhcithUU92eDdENU1wNHpHTGpvTGp1b2pIQUh4bFI0ZTUv?=
 =?utf-8?Q?eOIZSk8LpfCuhUeaUeJ0dc8TL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680ff38b-ebc0-44a6-1b7f-08dd82381330
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 07:25:51.0415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wU6Gs0l2ZnN3FLCG4ps8QuGHEj2C2hV5U2kkFIY81BjBOePz6I46w3/LZszxizYhjcMm7m4+EXE9xnPGTXIBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6853
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

Hi Vivek

在 2025/4/22 13:22, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH 2/2] udmabuf: fix vmap missed offset page
>>
>> Before invoke vmap, we need offer a pages pointer array which each page
>> need to map in vmalloc area.
>>
>> But currently vmap_udmabuf only set each folio's head page into pages,
>> missed each offset pages when iter.
>>
>> This patch set the correctly offset page in each folio into array.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
>> ---
>>   drivers/dma-buf/udmabuf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 79845565089d..af5200e360a6 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -120,7 +120,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
>> iosys_map *map)
>>   		return -ENOMEM;
>>
>>   	for (pg = 0; pg < ubuf->pagecount; pg++)
>> -		pages[pg] = &ubuf->folios[pg]->page;
>> +		pages[pg] = folio_page(ubuf->folios[pg],
>> +				       ubuf->offsets[pg] >> PAGE_SHIFT);
> IIUC, it does not look like vm_map_ram() or the other functions it calls would
> write to these tail page pointers (struct page*), which should be safe even
> when HVO is enabled (based on your conversations with Muchun). However,

Yes, and need point, each write to tail page's va pointer is no permit.(HVO changed this va in vmemmap's prot

into RO), so, easy to observe. And  I see each vmap-api, only turn to read it, no write. :)

Thanks,

Huan

> I am wondering whether Bingbu can test this out with HVO enabled?
>
> Regardless,
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
> Thanks,
> Vivek
>
>>   	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>>   	kvfree(pages);
>> --
>> 2.48.1
