Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5982FACCE2B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 22:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A123110E62D;
	Tue,  3 Jun 2025 20:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WpAnrupq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F82710E62D;
 Tue,  3 Jun 2025 20:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpKA61pQTEsUp9syyYn422OBGxm6hv5Pb+7tjRpRjbc7lQkkjcqYHB+Ji0skrtqgHdtiW3v6+GxN1VqTknSO2Gc/qjVZLeQX0DlAJm96N73XYFDcW1FYheGLZen/2aWxrx/UuHpIWWIRz/dvlVkHvGiWCMjbuiR0PvLJCWQB/huEdHGstthaEBBvYu12Ez9tXSXbQrrnuu0ere2oYBTge/9KATyWHa0VJukOiu5o3Zb1JYZa0bcDrMMF9nAtOTWlY8iixWzkFYeaPQtl10zrGyOOwmwJQbOjnf0adsWB2cgAy56bD6z3bvLFzXdYicfups/yv3h6IYfNcGSUJ2eK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOeSCbKyZ9xv0fBjlJ0OKkrIp8fSeYT0rISX35zQTp8=;
 b=Rzioedofo2Y0DyxjHHzpApEu6E0lhefQVZU/Tm4JcTUQ1oaMNBnQUSN2SU+230bVaFgx75nlaV1cTbPzQ0NHMblhVaiwpqd0O8/jr0IgYhrFLMfQ14WGlRqeNVnl8LcZ0zhvxdOMj0k3HdhB5u4CjVFlSTzoXUGNlyBzq0J/htlpKrfw9EJdTjm2PkG8LLMOJdcZFP6n9/9kTpdYl0IddjLEASD/R8Z9FG5N9Uw86dwrXcICK1Xi4XrqBOxod7QNnWPJ8CIYxIg7fE6XxEK8WtrmAXExyNn348bfVmABfNLYJmIN0V8mYX8dSgbxXiakcS/tNjO570wT8HA+fI5KHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOeSCbKyZ9xv0fBjlJ0OKkrIp8fSeYT0rISX35zQTp8=;
 b=WpAnrupqTnWK/Pr+IWHOKbg6S8LRakPSNl1B0aq2N7Gj4r7SNDxHYqRiKj3R8D0ERm+Dmu8RdxV/3eFqsXXXTxk7H4un8Kj5TELnNUozSdPmPnVv06amTaewn511HrXY8qxoX9Ez7eDUPSHbqBOXXZzCIamwDNw9l7miTp41his=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Tue, 3 Jun
 2025 20:26:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 20:26:53 +0000
Message-ID: <f80f66d1-38a8-4e45-ba63-ae2427c91317@amd.com>
Date: Tue, 3 Jun 2025 16:26:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Cc: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
 <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
 <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250530165818.0e6cb846@eldfell>
 <DM4PR11MB6360BFCB5756A16F38945DE7F46DA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250603135108.603fa6e6@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250603135108.603fa6e6@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 589439cf-f64d-4c74-d815-08dda2dcfa37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnpqM21XaU1VaVk5NlZFTkJYVUVRUzA0VDBORHdUWUJyM0dURWUxeHBEOU9Q?=
 =?utf-8?B?OU9FSllmdHFxU3l5K1AyUk9mQzN6VFdBMVNPcjJ5RktkWmFORlZFazJYcElE?=
 =?utf-8?B?UXJxUFZ1Nkg3VlU4VFBTRG5PK0JoZWRQa1g4Q2V3REJTcFc2U1hMR2JtVWk3?=
 =?utf-8?B?bWxFT2sxNndndTBaRWxtZXlzbk1UdWplcGpWakgvaEgyeU1vcUhGM2xLYWp1?=
 =?utf-8?B?NkVUTW54WDd4Y1hmdFVDZndybGhRemNvK3NTNzlEQjFLa2V2OG9ZQ1k3b0gy?=
 =?utf-8?B?MkVEbjh0YVhhc1FERUhtZnNHRXRkR2V2Z1dLZkgvQkZLUXBSeEx0OHdhMmVq?=
 =?utf-8?B?SzFyOFJwTDQ1ZkxXZkRWdnV6R3NrY0hoZjhFMlhGWmtJdFgzRkZSL3BMYjAz?=
 =?utf-8?B?QjhCcFJOcTY3alNBWTA3ZlRnTnN6dXA1eXhXeExrN05aN0poVlEyaXE4anlP?=
 =?utf-8?B?RURSR1RxSHBKdDQycEdOTHZ4Zzh2c01UREpnYzJYbVZueDJUVVFaQUtvVVpD?=
 =?utf-8?B?bGJ6NUlUMTI4V0xrZWJBUXJ6NVphdVozQ001N0MrazZEL2tjVjVVOW5MN0xB?=
 =?utf-8?B?ZXFkcEpQRHZlN2VwUStQbG05RXRGSDFQMFNLQkdLRTNBeWhDcjRSQjgzNFlo?=
 =?utf-8?B?WnMwRGV6Z0NJc29XUzBjUjM1MjRhYUMvM2ZlNUpob0IzSEsyaTlKaHRLTmhV?=
 =?utf-8?B?cVBiM2lWTC8wVFg1WlB4cW1oMmdEWjNiYnl3ZUxGMkZYa2poNXNLbHFBdTNv?=
 =?utf-8?B?NGpFV3F4czZMdTJrVG53Qm5ndTFTeGVneEoveHVoZlc2WDN5Uy9OUyt6YS96?=
 =?utf-8?B?V0cyQ3VQRHhaOVlXWDZscWkvUEp1ZjZYMnVQTTd6c3V1ZjZCUVJDR245aGQy?=
 =?utf-8?B?dEpoYTJmc3hmbWhRc0xtWHllZHVoRVJBT1pMVWVKQTEraDhiRjR3YkV0R256?=
 =?utf-8?B?SGZmUWFIZEtoZldCK3NrQ3NTejlDbDE3RG5adHZ3RkV6NzFCRytKY0MwQytR?=
 =?utf-8?B?S2hHZXhMc3JhcmNzZE8wMjZ4UFR6WFBBd2xnT25JY2Vyb0dKdkcrTklOaDdu?=
 =?utf-8?B?N2lob1BwektBaFZNS0crZWRSRlFDVFVKYzllQWd1Sm1VTTJTOTJOVWphNy9X?=
 =?utf-8?B?SEtPNGZWejk5L1MzMW1vT3AxYjZ5S1g3ZEw5RU9YYTM1Z3NqbWQ3TnpUU2FY?=
 =?utf-8?B?TE1sV3drenRMaWJraFNkOFExREJGMFFkb2JQdjJJdmNSL2QvQXVwZVdack9N?=
 =?utf-8?B?UG9iWUp6Uy91VCtFOTYvZXNQdzNnUjVSMjFWVUZHaTRUTDAyZ3VXNHRlbVJO?=
 =?utf-8?B?VUVMQTZNT3cyS3NhS3VDdTZra3MvWmxjRDZ0U1ljZHpJS2NhTTRSTHVWTENv?=
 =?utf-8?B?QmVjZUNKZm12Tm5rTURtUFYzY1hGbEsxaHdxQ3o4U2ljU0M1UG5HUnBMTG94?=
 =?utf-8?B?ZVV0Qkw3ZTU3eWJ3WEFMRVRrK3BZN2dyL2NDZXNSR2VKRjBMazlFekRxd0h6?=
 =?utf-8?B?eUhBTXRYQlpUdkM0SjJ0bXNlSGpyNWdWQktzRlpaL09nMGtVVnhpZlNKWXEw?=
 =?utf-8?B?L3RGQ2RjMVRQUXBDWU92ODd3bTJTQzdsNTQxYWF1aklzNHFOSEcza0FOU1RG?=
 =?utf-8?B?MHlCTDI0WEhHcFNTM05hUUlMWTZNa3o4SllTNCtZcTVwMnhMc1pLT2VrV2U3?=
 =?utf-8?B?aWs0SnN2Z05zd3p4WlJwWnBKc3NCY2pUK0FsLzJtam92UzBMU3dYZjdYWmRC?=
 =?utf-8?B?NzlDaUZkRW5mbU9YMFI1R0xqN3ExNkJIYWxVSWg4T0RqVkc3WkY3dmhrSzNR?=
 =?utf-8?Q?Zk3QFSysWnpIQtH0Xzq04Rn036A/SBBu3rWgY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empPaHlyMkljcDAwYUNsVWRrQjNrdytxaTNEYThUYzlaeCtMR3dEeUZxMEpY?=
 =?utf-8?B?dTI5WW1kMFUwbXZJU1h5bnZVaXp2OUxWSnlTUlRGVEovOTNPcEVuY2JSRCtW?=
 =?utf-8?B?MEgzVlJiOCtOM1JLUzVVOGpkOCtxUlMydUIxbnlNaDQ1b3g2clNqQ2tZa2lq?=
 =?utf-8?B?SmQzL2xhMnlXcmhpQXVSbkorSlpQaCt1WE1rTmJpTncxM2ZTeFhIaHN1cUIv?=
 =?utf-8?B?eTdIcmlCZUZWc1F4WWRTMFl5TUovd1RrbmZlMVNYeldnT2dYUUFlNlZkWU5l?=
 =?utf-8?B?bDY0NGY5WnNLYlZOcWtnek9JcEhIYXF6THJjNUJ0cTRLdGRvWDFMRFp6Y0pl?=
 =?utf-8?B?QlNMTUJRZUtQTmpwWERLUnhnUXNVMWJiWVk0MklIcG5md0U0bEJmMGZObjkv?=
 =?utf-8?B?b25iMmtVVCtKNmJyMHpMdlN1dVZyTzBTSm11Mk1JcnI1NzNWMy8xTVpRMC90?=
 =?utf-8?B?aC9ILzZoNE5OLzlkZEdvcU5zajBFcGRtMGx1aC80ZEtFcjNzNEl6T2tueDVG?=
 =?utf-8?B?bjNYczZLcHlzeGNRVlZPRjUvdW5uL203TnpuTDBWYlJLbGc0aDdZUG5lYi9J?=
 =?utf-8?B?WXoyRGdoUk5Ob2FaT2w1RTBEbkN3a0NQdVpzS0dlZ0RCQWZ3NUtKUlpiTkNq?=
 =?utf-8?B?TVE3YXJ6aEhhYUswb2FKUjY4TW44Q2pPakNWQ3dMQ1dYTlJ1VzZ4aEVRSDNa?=
 =?utf-8?B?a2pqMVU1bXBQeWVzRkRQbHRpV2E3dTFucVQzczlCU1oyVC9JZXlqSXdSU3dO?=
 =?utf-8?B?K2lOZzNSVHdqa1I3SC8vTm9iZFBROGJubEM5MXdUVS9OQ0VBeGJ0RXpHOTZs?=
 =?utf-8?B?ekJBYnBOSW82RW9PMWFLOWpjbWM5YmJUODZuRmREV2tKV3g4dHk3Mk1tZXE4?=
 =?utf-8?B?aEZDNWpjalVKM0k4cmJENDREbGkxbzA1dStmdXY3S093YXh2NVJsRnBKeDV4?=
 =?utf-8?B?STNCcU5YbnpsbTZsUkd3WGQzY002V1Q1YTg0QlJSS0lJVlg1M0xIRWJ4MTBW?=
 =?utf-8?B?K3NOZkNQakUzWUF2S3M3SmRPcWdvZnpNVHNZbjd6MUxJRWhJVkg4ZHMrSGM5?=
 =?utf-8?B?THBCZ1dRN0UzVTFDelFINThuMmhKbWphK1dPYTB3S0ZMSWRsQ2c0Q29WVzBn?=
 =?utf-8?B?aXNWQ1lvYlE1ekowaXFaMHZsNDZHT3ltQXhockhnUWlhQ3hOaUlQZ3R6MGxn?=
 =?utf-8?B?TnExSFE3ZlRtSEttOWFrWHNiVUtQVlBlWG92YXVzVktoNFpoR0t2S0tpSHlC?=
 =?utf-8?B?cThXRWtOZmt6UjlTK0NkUG1QNm56MkdvSHlxbVpIVUUyT3hkVmcvSXFGcE8v?=
 =?utf-8?B?VnJCTG1kSytLNm9VQ3J1alNKcEt6YUhpZ3A4MDJuR1pScng4eVhtZEg2em1w?=
 =?utf-8?B?SUkyekRZMXF1WkozblVrdVh0OFl0OTZuRXllalgzU3praFdqc1l5NUhIUjdP?=
 =?utf-8?B?c3BFSzFvd2kycTR4Rmo3aW9pQVJzRHBWZnIzUXdNaTFGWmVQbHQ2SVhDdzJK?=
 =?utf-8?B?NlBZaFM4NnFtU1pIcERsdXduQVZyYUhkdHFOd2Z5aHBEdGM1Nm5HOXo4V2FX?=
 =?utf-8?B?alZ0RjZIeWFadStseDhvdEoyVGdPeXgwY1RMc3M0VmpQQjIwQ3d1M0hTaFlG?=
 =?utf-8?B?emRVQnpDMUtJOVB3VUo0WlZENTViTFd4eFJGb3F2U2RaczVaL2NJMEx2djV3?=
 =?utf-8?B?M0FnUU83d2laN1QwS1p6SEIweGtuUnhkbEN5RmxncGRsREVGYTZTcXRZRU1z?=
 =?utf-8?B?c1ZJSHZzNjZUZ2U1SlFBQTJjUStUbTFsTStDYmI2VWFNWnp1Mm5zSWFPRkFC?=
 =?utf-8?B?Y0FJZDF6RnJvRXhLZ01BMXZtTjhzU3oyZmxHc0JGNFQyTWcxNmVSRjJvWXRG?=
 =?utf-8?B?QVAwMkhUVHNCamw4S2FmSGYreGlia0w2QVJaMnBaWjVoL2ZNN1FuQ25Da3Fp?=
 =?utf-8?B?M0cwQ0F4NWhhM3IvQ2tJcTlPdmYzVFVWYnBPQ3FRdWRZLzdNZUYwMERINk51?=
 =?utf-8?B?YmNVTWlYWENzSW5QUG1wZWhiZERuRFYrS0o0dE1ySlBYb2tJeUM2S0EwYkxT?=
 =?utf-8?B?eTNaK1hXVmsrVEs5VlJuVXlzWGYrd0g2emZIQUh6RmFWR21ETys0VmxWZkFx?=
 =?utf-8?Q?1kOZEMHFSNzH/Pkmh7+OUDGtG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589439cf-f64d-4c74-d815-08dda2dcfa37
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 20:26:53.4130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMeo7+h3xT8OnzZ038BLd0cunZupyoV/YXpHQsOiMrnMnZvhMi8EiTXi0NKPwhQ8bkpu2VK56vVh97Bv6+q3GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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



On 2025-06-03 06:51, Pekka Paalanen wrote:
> On Tue, 3 Jun 2025 08:30:23 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
> 
>>> -----Original Message-----
>>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>>> Sent: Friday, May 30, 2025 7:28 PM
>>> To: Shankar, Uma <uma.shankar@intel.com>
>>> Cc: Simon Ser <contact@emersion.fr>; Harry Wentland
>>> <harry.wentland@amd.com>; Alex Hung <alex.hung@amd.com>; dri-
>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-
>>> gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
>>> leo.liu@amd.com; ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
>>> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
>>> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
>>> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
>>> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
>>> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
>>> Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya Kumar
>>> <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
>>> Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
>>>
>>> On Thu, 22 May 2025 11:33:00 +0000
>>> "Shankar, Uma" <uma.shankar@intel.com> wrote:
>>>   
>>>> One request though: Can we enhance the lut samples from existing
>>>> 16bits to 32bits as lut precision is going to be more than 16 in certain hardware.  
>>> While adding the new UAPI, lets extend this to 32 to make it future proof.  
>>>> Reference:
>>>> https://patchwork.freedesktop.org/patch/642592/?series=129811&rev=4
>>>>
>>>> +/**
>>>> + * struct drm_color_lut_32 - Represents high precision lut values
>>>> + *
>>>> + * Creating 32 bit palette entries for better data
>>>> + * precision. This will be required for HDR and
>>>> + * similar color processing usecases.
>>>> + */
>>>> +struct drm_color_lut_32 {
>>>> +	/*
>>>> +	 * Data for high precision LUTs
>>>> +	 */
>>>> +	__u32 red;
>>>> +	__u32 green;
>>>> +	__u32 blue;
>>>> +	__u32 reserved;
>>>> +};  
>>>
>>> Hi,
>>>
>>> I suppose you need this much precision for optical data? If so, floating-point would
>>> be much more appropriate and we could probably keep 16-bit storage.
>>>
>>> What does the "more than 16-bit" hardware actually use? ISTR at least AMD
>>> having some sort of float'ish point internal pipeline?
>>>
>>> This sounds the same thing as non-uniformly distributed taps in a LUT.
>>> That mimics floating-point input while this feels like floating-point output of a LUT.
>>>
>>> I've recently decided for myself (and Weston) that I will never store optical data in
>>> an integer format, because it is far too wasteful. That's why the electrical
>>> encodings like power-2.2 are so useful, not just for emulating a CRT.  
>>
>> Hi Pekka,
>> Internal pipeline in hardware can operate at higher precision than the input framebuffer
>> to plane engines. So, in case we have optical data of 16bits or 10bits precision, hardware
>> can scale this up to higher precision in internal pipeline in hardware to take care of rounding
>> and overflow issues. Even FP16 optical data will be normalized and converted internally for
>> further processing.
> 
> Is it integer or floating-point?
> 

For AMD the internal format is floating point with slightly
higher precision than FP16.

> If we take the full range of PQ as optical and put it into 16-bit
> integer format, the luminance step from code 1 to code 2 is 0.15 cd/m².
> That seems like a huge step in the dark end. Such a step would
> probably need to be divided over several taps in a LUT, which wouldn't
> be possible.
> 

Right, and with 32-bpc we'll get a luminance step size of
~0.0000023 cd/m^2, which seems plenty fine-grained.

> In that sense, if a LUT is used for the PQ EOTF, I totally agree that
> 16-bit integer won't be even nearly enough precision.
> 
> This actually points out the caveat that increasing the number of taps
> in a LUT can cause the LUT to become non-monotonic when the sample
> precision runs out. That is, consecutive taps don't always increase in
> value.
> 
>> Input to LUT hardware can be 16bits or even higher, so the look up table we program can
>> be of higher precision than 16 (certain cases 24 in Intel pipeline). This is later truncated to bpc supported
>> in output formats from sync (10, 12 or 16), mostly for electrical value to be sent to sink.
>>
>> Hence requesting to increase the container from current u16 to u32, to get advantage of higher
>> precision luts.
> 
> My argument though is to use a floating-point format for the LUT samples
> instead of adding more and more integer bits. That naturally puts more
> precision where it is needed: near zero.
> 
> A driver can easily convert that to any format the hardware needs.
> 
> However, it might make best sense for a driver to expose a LUT with a
> format that best matches the hardware precision, especially
> floating-point vs. integer.
> 
> I guess we may eventually need both 32 bpc integer and 16 (or 32) bpc
> floating-point.
> 

While I like floating point better for representing these things
I don't think it's a great idea to pass floating point values
via IOCTLs but 32 bpc integer values make sense here.

Thanks, Uma, for pushing on this.

Harry

> 
> Thanks,
> pq

