Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B54A126F3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 16:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CD010E06B;
	Wed, 15 Jan 2025 15:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pSmgixfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14FA10E508
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 15:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcQjB1F4RZ0uujAUjcHT0Ceuzky8wAtv2LOgzvNtYQ/rICcyTiQqgkCzQ00gAG4S+ROdmET/7gm1VzogyxYHJFU+3EwkAkBwR1SbMAr41FWwQgc4PXXNpCR+Q13FoQiRbSkEtVggfyJJGBiqUBBQcXm72/UopXanoSDpOMSjyMIpEjZgtHl7Tc+SawDPnORUghkWpxj0khMtmXliYB/0HZuWgFTUK1gIrQLgACubKN7ZWIq3fOQ3/zq19ybKTK367js7gdMMy1hnzFtRNO61paYPqrVzcKzgcS6MMhoDs+86GnxdW8AehLZJbRezphnU6oZhJXTjIc1gqqAsoLgTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l73z8496Yb2BtWB609biLJ2hTccV1KqS2qgDESvHoNc=;
 b=p0xriaZ7shP2EcD3PUPO0mQKQxCJ9NS1kKrD5p+RqR5DaByD+dyWHLQ2owqJwIbG1LlZ1klHqavhgRDnlj/CsnglPu4tee9AxKaaqkGvX71dcWrm8lYWzLNJzTAnHxyE37rmhhRsmuDQeAacsHeFPunoQzveSrE8KiYhiuxRQmROI6c6L3p1x5P5sFK3u9qlMbd/IZm9NYGcP6IcVrlPAq82cpVpWf70/0dpi6vPYQRRFSJp7bgmkf5hG9ivrIPqYKw06K0bDJOCI0cDgxf46PjJKAZYSB+96KU+HkUNC6ME7a6kIL17IEQQfLtwccbuMpzjAFmQohikeoayMgXfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l73z8496Yb2BtWB609biLJ2hTccV1KqS2qgDESvHoNc=;
 b=pSmgixfiySi/PsyePN5hAzYGg/DlXH5qjZ2YUhGsYCGbQiAJATwz7hRer5ySYJN8egz+xpFpsWpT8LGeWf2u3ZvwY4+kkafM57Nu59b2Gj4EZwADowwV86bL41fZkJTGMJdNjDpgbZ3DTt7NgIa0FhnLgc+YlE3Y+tho+QZ6P0IPCIwdeI/zQnZwvFEJPF991abeC2ZASDoNYCQssBK4jqoyCOEHxl9GyYnNQ0MvhEmWaGpuyT2FOqjBiab2eXbuSSsKPH5X6+Je943+NQkkXe7s4hRYMS9hyti9IoDW8Dq7QEEnJ9SnV3WfiSp/1ZXX0F8IcDj7UZ1lfpPktcV+Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 15:10:58 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 15:10:58 +0000
Date: Wed, 15 Jan 2025 11:10:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250115151056.GS5556@nvidia.com>
References: <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
X-ClientProxiedBy: BL1P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::15) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 80603e98-66bb-42e8-f0e1-08dd3576d074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3RQVWZEN3lHWGZvSlBjWXRLQ2dnaXlEekNyaTFFdW9KanhNUmxJY2JpWVl5?=
 =?utf-8?B?ZStsTlFTN0FaVUJ5UzU0RkFXLzU5cHdSUEFLRG43UUZQOWM1ZzkrSmxKeldn?=
 =?utf-8?B?VWswS0dLYWdYenc2YzFGclUxL3VQK0VJNlYwblloWUU4T1lFRVl6YmdmWGdX?=
 =?utf-8?B?NDFJWWdDUUIwOFZJRlN2Y2RjMmgwd2lRdGJPNkNUYndaTGdiTkhuKzliejds?=
 =?utf-8?B?ZmpIV3Y2SkpHSFJ2NEo2YVYvcERhb1FabzVXVm1aL3lqWXZaVzhucXFBR0Zx?=
 =?utf-8?B?Tyt0aS9hSk10b2Z6U3RscUNmS1dIWTFTeGk0K1ZjM3BsV0lTN2xiaEZESGgx?=
 =?utf-8?B?b0Rub0h0VGg3emgxY2YxamozNE1MQW14TUltSUx4QjB1Tkg0c2o5cUE1TTlz?=
 =?utf-8?B?V3ZTZEZjQmNVMVR3M1gwSThxQmZVQjBzWFdIeUFubjNhOTZkN3N3L1ZsMGhs?=
 =?utf-8?B?UUxCQXVJUnRORFl3Wm9nNGx2WFFSY2tMb2JFMVJzNWdNOE9jM2M2RUFvamNl?=
 =?utf-8?B?R0FmbFRKSVN2MlZhMFhNdk9keDZVbHhDd2VacVFNakRRSGU2Z2l5Sm9Tdlht?=
 =?utf-8?B?MGtUQ2FsVUZHQjVOSGlORklmQTF4ZjRRSDN4c2lYZW5CVzF5ZzQ0d0xJTDZF?=
 =?utf-8?B?L1k1U1kzR0FPYTByZ3h1Kys0a1VpZFlSZHhZd1diYlJPMHk4ZHlYSUNaUUVN?=
 =?utf-8?B?UUhrelFhbTRURko1U0t3SzhTaUsvaG9JZ2xFZGphSTlIaUdDbzhLRGk5bXBp?=
 =?utf-8?B?UmhpYzlhbzRvbGRiRmJlYVJ0UGVKdWtQSlIwclVKY3hVWWMxRUhVVS9hTmg0?=
 =?utf-8?B?aEd4blRjMVBvTlByRmNwWUlmWXZMVXMxb1RHUjgvQmoxc0k5UllFMDM5Qzl0?=
 =?utf-8?B?bDJZcnY3eitPL3pXTzR5alNIY2F2amU5RlpueHNYR0o5bG1EdDIyRlEzbXdt?=
 =?utf-8?B?bmFDRFpxSU1paExZekIyczZJelRxRW84YkJOZ1E3NkdWZ2VnNkVpaWliR2ll?=
 =?utf-8?B?YVY4b2hYN083UzdDVUhxcVVYeVBzUGdwTDYzT0dLTjlaK0FhSTl5by9RTitM?=
 =?utf-8?B?RDZjUHpPYlZVK0Z4dXhwdjlGQStkTm9OMmRKb2wxVUIvdCtONGdHek5YNkx6?=
 =?utf-8?B?Y0RaL01ETURRYklhM2NRSVRLeVQ3QzBBMVJVVjBPcGNGWU9ZNjB1eldML0tY?=
 =?utf-8?B?UzluWE5XYVdlQXJ5L0cwWS9YQUthbmRmUDZ0OWFrMnhKS0ZldU1ZMzVIb0Zl?=
 =?utf-8?B?dE94MUdpa1ZEZTI1Z25HYmxKWHFiWnlSclphdmJPSjBnOTgyZ0hNZklvYnJI?=
 =?utf-8?B?NTNHM3JsMHlYS3FGQVR0VWJ1M1BqM0MvQkxOWHEvM0UyaFk3Y0c3eXFRWkNR?=
 =?utf-8?B?dkxhdVlMRmI1MEVMdHEzb080cXQ1VnpZa2tLdDIvUkpEcDZzK3dhMlJXdXc5?=
 =?utf-8?B?U212aDUzNEdFRUt1dkN3N3hnS2RqSEJ1MVpranlEWjE4WEFNaUdpZHNzcFVr?=
 =?utf-8?B?OXlWV0poTFFaaWdLWXZ4dUhVZitLMDh3T3YzUDM5eVFYZ0JkTGpEWVRwZVEz?=
 =?utf-8?B?RlJ5UzVQTDlMZmFKMWVtSnlhMlRMRnhVWEJiMVlua25uaTNmb0VHcUZ3K2FV?=
 =?utf-8?B?NmpET3NRTTYxVVFLaFNwcW5tVldmZlNzbkNPd2NwR1AxOERPb1NpL3lDcy9x?=
 =?utf-8?B?MlZHSnR1cW5YbGtSaWRjTmRMMWM2emVLeUp3cjIvUkJhdndEbmN0aEx4ZWNE?=
 =?utf-8?B?OC9idWtaWnBnSmc1S0piL0x6OHRtVkR4VmNSZjlhdWV0SDF6K2xCQ05iUmR4?=
 =?utf-8?B?SFh3dFp5cmZVSHpMTHpkZGhmSzlNWFZTY3FsNEk0MWMxekVaNDM5bFZndDh3?=
 =?utf-8?Q?MVHM4obrfHzk5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFBjMnJRdWI0YjVCaVQ0NjRxSGlLczFheTVVNytvdFNDSTE1R1dTVlJac210?=
 =?utf-8?B?Q0svdHIwcEl2UDJySzBlNnNuM0p2cHFDLy9YMkZIYkRQbFVQbzZiVy85KzZt?=
 =?utf-8?B?UmxDYVNQUWgyeXJtY2lYeERWbnNQdXVKdU5JeGQvZTJ0MDJXNWg5a0E4TklT?=
 =?utf-8?B?NWsyMUIzVWRDYm45VEVGejVPQTBFNkJabVZoaDBQclFyb0g4K1BrSGFBYWVD?=
 =?utf-8?B?WFo4Rk82MlErZ0VTaHNjZk5XYTkzR0JITEtXSlNQcXhBVXJVeFVSUE56Wm5k?=
 =?utf-8?B?QXBuaGd3cGhMTGJTd2JsVk5RVmFzcGRXL3Vucjk5RWpVZkluSFBKUHNJZC8z?=
 =?utf-8?B?QWRFTVZ2dEpxR01XMGg3RS90cjhiVS9aalNrTWNwbWFoZXRkbkxGT0xETWFE?=
 =?utf-8?B?SFdwekk3NjBlMDU0TmMzZENVZVU3MGE1ZWZOdXkxS1ZWcmJrL1hod3M5ZExz?=
 =?utf-8?B?a1E0cC9ZdDlQdzhOaVBUTHYvNTFmUm1Qd0FWOWlzWGJTSnpkdWhWVW1Dbi9J?=
 =?utf-8?B?aDcxOXRWa3dCNHFTbDI4YUpOWm55R1F0bDc3V2w2Ylhpdm9tYnhDcGNHWEVP?=
 =?utf-8?B?SWpzVHBScGlrRDI4eXMvZmFkby83OEorbUZEWEVLOVBhcUJoM0ZnVFJxU1JL?=
 =?utf-8?B?LzFoUk1JYktrK3JNSHlQajFwRUpNK1VIdlVISWpuN1M0dS8yWnFMRnVMOSsy?=
 =?utf-8?B?SXpBazRjRkhVd2xCR2l3ajNwK290b0JjSGFLV2g1TkdaZFZMMm96MFd5MTdX?=
 =?utf-8?B?U2FBK1B1N1U3Z3ZOTFRBZFBLcmt4VG5ySURhNlFQWTJreTRLQy9xSmcxdzEz?=
 =?utf-8?B?VGRkYUdwQlRhcUFna0kxYk5sZ1Y3KytVTEJPdVhOUXhTeUFiaUZRaFBhSzZM?=
 =?utf-8?B?VVYxbEllaU5VL1dtKzFqbDFrcUVNVDlqcUFjTW1ZUEJBa2hkN3J2bUN4MUxR?=
 =?utf-8?B?TjNiQmtNWjFJOEVqMkxBOG5oTWxZV0tKbEwxWkhvaFN1dnpUbnZRSmxWUDBm?=
 =?utf-8?B?Rkk2Si9xSmk4dDdtbUdQSHg2VnI2QzdDZ3RaV2crcWp5eGgyMnFMY3ZuMEtL?=
 =?utf-8?B?SVd1RVhobHZlaVkybkpkbk53dDRzYmlQaGtDYjZkUzRUSEV0UHc5N0VjeU9D?=
 =?utf-8?B?ZXBISzZzLzJTN2dSYjhaWk1jcnpyc0g2RmZ6dDZwYVFHbjdUdjFuQjVqSVZP?=
 =?utf-8?B?QW1yVzJFU281bGcwNDF0a2ZvckE3M0ZMblZNUUtVYWsydzd2NVVwL3BOVmIw?=
 =?utf-8?B?ZlM5eU9YdGZzSkRFTXRYeEhYOE5RNlZrQVN3RWpxT1ZwWVlIekJzUWJEb21B?=
 =?utf-8?B?MnRsL1I3T0ZtVXJvQzlPSy8wRmJFdzlRenpuS2ExMzd1eU05bngxeWVzTjhO?=
 =?utf-8?B?TjVLbEI4WkNJYXBFMTJHVFFoZC81bnorcTZveU1tdVRmZ1pJc05WVFpRZUxv?=
 =?utf-8?B?bVdwMmJ6cXdoVGpxb0orN0ZjS09QbHBCbTdWTk1IVVl5TEZQTndteGNLUUVh?=
 =?utf-8?B?byt6cDRnZTEzUVhzODliQlhURVBMaXR6dVhGUkt5RnVLbC9NZlliRnExUExv?=
 =?utf-8?B?YmxaREw0UE1HNytoRVVNdHpHT2tnUkw0WFR5Y0pCc1hDLzdNa3V6bFIvMG5v?=
 =?utf-8?B?QXc1WnBXWTI5eEl3c1k5NS93T2RGbFJmd1kyTVZRaUtJYnNPWTE0Y1pJT0k0?=
 =?utf-8?B?YWttUU96QVNLK1Y2cldTemJ2NXFMcHVGUVVVdkdId2NKMzBoeDgyUHdjUDg2?=
 =?utf-8?B?RVBNWTh2TzNVbmxLREY3T1BKcUk0SVp5T0VrLzBPSEZFQXJQSjA3U0YxakFa?=
 =?utf-8?B?RzJLaGl0aERtZENlVlZSRVluWElvVDBZb3dFeUtLc3N0UkdLUWRXWTR3bjB4?=
 =?utf-8?B?VzhuaE5pV1g1emVnK2FReDRKc2F4VlA1dkFmRFJFZkNMWUl4bElSWStFVDhz?=
 =?utf-8?B?U3ErNkJscmdmekNtSzM2b0ZMallKWE04L3lMa1NTMjR0OWRydWhJSkhaaDBM?=
 =?utf-8?B?dVFDT0pIZFE0ZlR6NG5hZXZleUgwTEtCaXZ3M2w5VWFDZlA4dEFYWStheUxD?=
 =?utf-8?B?VUxYK0NEbGFhd01wMllIaGQ2QWV5RDBmbHg2eVdQeUJEYjlHcUM0eXhSaCtR?=
 =?utf-8?Q?779QwyXsy8vlGOEIpYoxeBvnZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80603e98-66bb-42e8-f0e1-08dd3576d074
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:10:57.8675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOnaZkoZ2DUn4EgoeoOYBCvIXfrK2OiGFiv0HqN1DWSrqdPzKeF+DOzFh4rC1T9Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

On Wed, Jan 15, 2025 at 03:30:47PM +0100, Christian König wrote:

> > Those rules are not something we cam up with because of some limitation
> > of the DMA-API, but rather from experience working with different device
> > driver and especially their developers.

I would say it stems from the use of scatter list. You do not have
enough information exchanged between exporter and importer to
implement something sane and correct. At that point being restrictive
is a reasonable path.

Because of scatterlist developers don't have APIs that correctly solve
the problems they want to solve, so of course things get into a mess.

> > Applying and enforcing those restrictions is absolutely mandatory must
> > have for extending DMA-buf.

You said to come to the maintainers with the problems, here are the
problems. Your answer is don't use dmabuf.

That doesn't make the problems go away :(

> > > I really don't want to make a dmabuf2 - everyone would have to
> > > implement it, including all the GPU drivers if they want to work with
> > > RDMA. I don't think this makes any sense compared to incrementally
> > > evolving dmabuf with more optional capabilities.
> > 
> > The point is that a dmabuf2 would most likely be rejected as well or
> > otherwise run into the same issues we have seen before.

You'd need to be much more concrete and technical in your objections
to cause a rejection. "We tried something else before and it didn't
work" won't cut it.

There is a very simple problem statement here, we need a FD handle for
various kinds of memory, with a lifetime model that fits a couple of
different use cases. The exporter and importer need to understand what
type of memory it is and what rules apply to working with it. The
required importers are more general that just simple PCI DMA.

I feel like this is already exactly DMABUF's mission.

Besides, you have been saying to go do this in TEE or whatever, how is
that any different from dmabuf2?

> > > > > > > That sounds more something for the TEE driver instead of anything DMA-buf
> > > > > > > should be dealing with.
> > > > > > Has nothing to do with TEE.
> > > > > Why?
> > > The Linux TEE framework is not used as part of confidential compute.
> > > 
> > > CC already has guest memfd for holding it's private CPU memory.
> > 
> > Where is that coming from and how it is used?

What do you mean? guest memfd is the result of years of negotiation in
the mm and x86 arch subsystems :( It is used like a normal memfd, and
we now have APIs in KVM and iommufd to directly intake and map from a
memfd. I expect guestmemfd will soon grow some more generic
dmabuf-like lifetime callbacks to avoid pinning - it already has some
KVM specific APIs IIRC.

But it is 100% exclusively focused on CPU memory and nothing else.

> > > This is about confidential MMIO memory.
> > 
> > Who is the exporter and who is the importer of the DMA-buf in this use
> > case?

In this case Xu is exporting MMIO from VFIO and importing to KVM and
iommufd.

> > This is also not just about the KVM side, the VM side also has issues
> > with DMABUF and CC - only co-operating devices can interact with the
> > VM side "encrypted" memory and there needs to be a negotiation as part
> > of all buffer setup what the mutual capability is. :\ swiotlb hides
> > some of this some times, but confidential P2P is currently unsolved.
> 
> Yes and it is documented by now how that is supposed to happen with
> DMA-buf.

I doubt that. It is complex and not fully solved in the core code
today. Many scenarios do not work correctly, devices don't even exist
yet that can exercise the hard paths. This is a future problem :(

Jason
