Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7720A19416
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F350510E235;
	Wed, 22 Jan 2025 14:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RCcIuzI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AD010E235
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu1B82B0aeMoqbE7C+Un0z8a4rUoei579XcV3k8H0EV9okTY3pqGERsP9wJJ0CK1CvH1f50rNWBsLwIzlIxaz1nyd7kNIbZ9flSP4y2GWMhejjADYTa4hV0fE3vLLpxheK6dTqSHEDi5/I+Ymx0g1BNfEMpJqLl8C9ewdac6b2IYu9Vrjjf1Y9Gu/NSCe0t/xhyg+iwqcAPCivxWUdt58P3kZBpRtBNRC0PPiNtVW+rY+WeMSkbpGiX5jsb2n0xnqs87rTAlXZ5lQJl+mqziN5udkacjlkbMCnOlGMuaPgr5HZlXjXEP9GlSHU9FlHS+RZbYIGP8I1XXcAoDGykeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNcOQiU5hubf2pSx4QqR2AVr0z0Sl78vjJIcFMhEWsY=;
 b=mgYJz+Hi1isMhPPCO+BM1vBoV/gHVpEVe7fdgeNzSM8VdIO1Lr74mmIPlI/PcuAQzoWsWlWYs+wc9Q2oaE89RayLdOWn/I7PSdU+KA0McclakIKYPwDVM0Dl683+gkI1rUEmTKA7KkbrPIlyuIxWtbZNMUvbHV6q9fPOWSbuiEuslIy5OUSfhZbDq4OlvXC4Xhje2+K4HncP/PNufMDBWduXNpm78QmKMR0Y1nsnhFxXEbXcMbvirx7wyD6y8xSRSLSpQAEzbDCrhqf/PdouQ2XFE3DQxr8fn6sDiPsEcTm14sAPNkZi7kxtl4zMHjCF6eE5IIfc+f9bNcYLAtX6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNcOQiU5hubf2pSx4QqR2AVr0z0Sl78vjJIcFMhEWsY=;
 b=RCcIuzI177Q5wbi+ODPELSp2PCIFtNHSLTcnq17lGGL8DFHBqh+TUomFZBQ2IEYXpcAB5GNoI0JvL7QTl3XnRCCHtnbMFiprJFRhMmJXhrhzK0ANDy/dLOypvKDBOZuiKjFsMhxw+ABAGHXh4OMubdEaBcVP65yvtqWbljaBjeXgTFUNZpTikbp3aapceALwCy/vMCwKFs7rKgEZfZUAw/KBZDlVlRwqjPeyoRg8IHY3rmiepLBsXccqLgcKb3lvisOq8FuAtb8CBxlEeZ2CQyEo+vhzBC+r+heKDj8FgH6cdgzfDmHzgFwAbeUovHFM4AKpFk7mqGXg1gyBpETVIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 14:37:45 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Wed, 22 Jan 2025
 14:37:45 +0000
Date: Wed, 22 Jan 2025 10:37:44 -0400
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
Message-ID: <20250122143744.GF5556@nvidia.com>
References: <420bd2ea-d87c-4f01-883e-a7a5cf1635fe@amd.com>
 <Z4psR1qoNQUQf3Q2@phenom.ffwll.local>
 <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com>
 <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com>
 <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com>
 <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
 <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
X-ClientProxiedBy: BN9PR03CA0921.namprd03.prod.outlook.com
 (2603:10b6:408:107::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: a652811b-5c28-4122-f992-08dd3af255cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVhUS3lESmk3WnF6bjFyUXdtMkFMcHJUL3Q5N0xDNmpDaXU5WXM4by9DOFBw?=
 =?utf-8?B?Nnp5N3AvNUJUcEcwekxTcHNObXExN001OGx1Nm9GRnNLMDBFKytZVS91Y1Nz?=
 =?utf-8?B?cy9jK1U3aFlSTFVORnlxL1A1aUdvelNLZFN2S0MvbVM5THBrTjNQc0Vibmd4?=
 =?utf-8?B?dUQxZVhuRWt3bnl6Z0pkRXFta1k5WjJ6akIwM2Q4c1FIbkJDUmRSWGlreld3?=
 =?utf-8?B?VjJJc1FSemZRQUgvZEpueEdDQi9kWkV1RE1uV3NLUzNrbjZ3Z09JYjYrdVNm?=
 =?utf-8?B?ZXpTUG1JN3pzaWZ6RVNYb1E5WW9yYnJkZGFsWGpoV2pqYng1blJCM3hBMXIx?=
 =?utf-8?B?U29QWEYyOFcwVk5SUGw5TFdENzF3Y3dqMDJITnQxU1lqWk8xTnpoRjREZUlh?=
 =?utf-8?B?OEgvWUxycnNscEdjekhkV0xIdVpHNElBY1pYTHN0NEtMRDlWREZTNklnUEx5?=
 =?utf-8?B?VXprZVlxd2VVc21qck4xRDRxQ1llRXNTTklGcy9SK1hpbGZ6M1haZWxQYVM3?=
 =?utf-8?B?bDFYeTd6cXFYS0xTa1g1NytWMk9QcFdmWmdvRThubjdyVjRGVS9sZkFTaDlT?=
 =?utf-8?B?UlU1SGhzRlVrbkZpRzdrWWJ1eDZ6eVBIOHV2ZVhOSzhJZFcxelRwQWNLSE1I?=
 =?utf-8?B?bjF6dWJ0KzZvcTRPNWJMRUN4VitlcTdtNU8xWDlLMWNJSEYvNmtuK3dTMTNo?=
 =?utf-8?B?WUl0ZVRhVno2cXpYNVAvbHl4UU4yVllVY29YaWt2WW12SHdCRmlVaFJqRHdx?=
 =?utf-8?B?dUtkSytkcjVINEN3VUQ2YVlMZzF3eTh5SHBUSHY1RXB1MlVuVGJvcUFVT3FK?=
 =?utf-8?B?dWxvYVE2S2xETW1vOFN1Mm1US2c4SUVBQlQ0dCtiQ1J5dEZUWDhFR2RZTjFr?=
 =?utf-8?B?YWlnN1lxVCtkNk9VNVdINVJKVmJSaUxtRThYYUxMYXFiYURiWnIrNFBEazJJ?=
 =?utf-8?B?RTFPWDRhanBSMGpraE5sVmtaK0pudUE5L1llcldBZHdQdkJxVzVlQkdvYzds?=
 =?utf-8?B?enFXcW5UNks2Z2R2TExrTzlOSWJUZWZYUHdubUMwcUpNRkVIRm52MEd0TTlE?=
 =?utf-8?B?QjBGTUpJU2dmQXFPZUFnUzJXOHVtWXZZQndhSWtpbVF3WUZiSmp5WGxIOU5D?=
 =?utf-8?B?SGJJQzR2RTNldHg1THRFbkQzb1htZ2F0c1Z1MjVwbVNHM0NmUHBwLzFMZGV2?=
 =?utf-8?B?TE1QTTkwV0U3aC96bHovWmVDbnBYazl1MWc4U0pGWFpHSElrR3V4OWFhbEh4?=
 =?utf-8?B?Y3lVU2Z2dWpOd3A2TnNGV3Z0MlY0NWxQUHhpT0JscWRjZUNpaDJhdm1UajF1?=
 =?utf-8?B?UFhvbTJKVnJ1emJmL3d5d1FJSFpGUHp6d2M2Q1pxVjd4Q21OVUc2ZUtiamFy?=
 =?utf-8?B?K2hraFh1NHVlZjFQcWNlazY3WE5Yd0NmR0krQjRSbjU4ckp5WVZCVWdURE8z?=
 =?utf-8?B?QU5WcjQwVHRPemlnbkFWTmxNc280dXRtRU1FQ3UySzlZaXUzb3NtZUVJTm8w?=
 =?utf-8?B?cjhoRG90czhTdzFWSUpwQlpWTXJsOHN3WURHZURLWFZHdUxIMW9MemgvaklL?=
 =?utf-8?B?T01qempqSmVhY0pqN2JGRnFjdG10Y29oSjM3czB3aksxOEQ0akdoNDdQZE9P?=
 =?utf-8?B?RmtUREcvUFRVdUIvK0hjR0Vud2Rjclg3dzM3WFZkM2NITXZkTXpBdXA3MWlS?=
 =?utf-8?B?WEM3bDQ0eGpDUEM1Nk5CQWt3K3pHbysyM1dmelk1bWNkSkRFSnp5elE0OG9s?=
 =?utf-8?B?RW5pdVNCRExEVlowWDZkR2hWZ3dvREJIYS8zVFFLYVdSemtEWmlaK0FCYVpZ?=
 =?utf-8?B?Si9ONmV2RjBxMmdSV085Q3lnb0pnYXI4VE4vb1c1QXpLSkhxRDRCTUpwRmtZ?=
 =?utf-8?Q?OhI7H/a63KI+c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUdtWmFIM2VLWUhPWmc0TGJxUHFCd3ZLRGYzc0ZldFRjRXdIQUpXVmJHd3BO?=
 =?utf-8?B?c3FqdGttL0psSThCcFJmN1EydHFRM0J3b3pMdnlST2NGdjAxYU05eGlnSk40?=
 =?utf-8?B?MkloTjJMNkpDMEV2Um55dllyYXQxUkI0SkxYdGozNmRhMXNDcjdFR1dxVjdI?=
 =?utf-8?B?Y3IrYmlnUGhwZEd6dkZzemluN1YzUHg1UWErcGdaRzhvY1JIZTZFMjZBbjhw?=
 =?utf-8?B?azdrUWNjUlAydWZrZjR4dWxxZjdYenVOVll0bzBZNmQ1VHUycTJuTkNOSmdE?=
 =?utf-8?B?MXRUbEVlTkZsblhkTXRzUEx3eUpSMEtmdjJzdUJxSTloNGZBSklKTDZvMTd3?=
 =?utf-8?B?ZW1KOTh5clErUFY0TDFFbGtad1I5WnlwaFB2OGFnTUZFTDV2WWxsSm8yUVpa?=
 =?utf-8?B?OG13SEFxN05RTHBWU0djWE4zL3pKcEdIMVAyOHBaT0JZcXZZblluajZkbklq?=
 =?utf-8?B?eElBWHVlV05VR0NFWWh1SCtaT0RsRjFJeklaVzY5enlvV0xWcElaa1F1bEk4?=
 =?utf-8?B?WmlQYnhNYWVsbENiaDNNajh5WGxuU2tUTTJtZDVMOXh6WW92QzgvZmpCTmFr?=
 =?utf-8?B?d21QUWduZFFBKzdYelRrMnE3RFZOdUNXdVFnbDJwN1JyTGVDOXRMaUx0WFJy?=
 =?utf-8?B?SzFvZ09qbzYwaTRsOTBUdmZ6c2xPWVl1UEdsb1FEK0M4MlBtVm5MQW5xMWdq?=
 =?utf-8?B?ZWRoOUlOUU52eTd3M3BTenhJbTBJQkZYYWFsbVIxZTJsSnlEV0VvK0h3SnMx?=
 =?utf-8?B?RWRsVkQ4WHJ2VG5zc2hZTUVLcUVGd2Iza05KVGVGZzVlaUxjRnhiS1lxRVpP?=
 =?utf-8?B?NDlxQkFJMWU3d0RaN0pEaG9KL0FvUzl0Uyt4NURqN2lTL0xkQ29qUWR4U1FM?=
 =?utf-8?B?KzVuSHYvMzFFK21sR1JPbllkVmc1MUZnd1oxTVhZbFdRRXNmdTd1WUpsUmdV?=
 =?utf-8?B?akJlVFQwdHU3WFp6U2lZZUJSamZ4OFFwbmlzenpuYlNNdGNzQVRVUEQ3Z1l6?=
 =?utf-8?B?YnJvWGFodzI4c0FnWUg2OTVmNHY3M0RUNU9kd2k1YTdnejEybmdFSGVGbjlC?=
 =?utf-8?B?UVhFbzRvbjJWazEzeVBXOFJtMUNrdVRuTDdTZ25XNGpMMUtFVXF0QlpKaWYy?=
 =?utf-8?B?ZzIxdWl4K0g1dDRYcldxUmFiYzdyWkpzQ0tEWEhHZ2xBaElURVFGQ0t0UVZD?=
 =?utf-8?B?SDVSUzJlb2MwdmtYWHRENjF2TlAxbGRlVkRIbmU0eC9oeGZpRmVONCtqREF5?=
 =?utf-8?B?TU5FU00ybDZ4Qk1lRFBqTE9YSHc4UjBnRVY2eFpVREI5VnczajBueGNkUGlH?=
 =?utf-8?B?blJ1eVlXWFJlQ2hPUnozanlNRS9PTzBkc25OcW15cGtaMmNPM2JwS1lETUtm?=
 =?utf-8?B?VW5KRVAreEVvV0tucmxwSks1ZFlHa0lTWjI0Sk9lVWdJYXc4RTExUmVsMm5o?=
 =?utf-8?B?M0xiQ1NvRkFoYjdBVWpQa0gwUCtxL01GTUY3SHBrd2RYa2NVcyt0VUlWN0Z6?=
 =?utf-8?B?NUhhU2Y4ajNxMDBGOEgvbS85SGptRCtvalhWQThOMklBNXZYKytVaEdOTktq?=
 =?utf-8?B?cjBtbHVoTnU5Mkk3MkZEellxTXZUK2kyK0JzSjUzM0xTdHdEYkl5RnoydE5x?=
 =?utf-8?B?cnZleXlVWWpNZVhmamh0Wmlvbzg1dU0xSDBDcXJESk9HTS9xdHd4c2JhSGVH?=
 =?utf-8?B?V0FFSGluSnlxY3Izc0NDNDVxT0I3K0FCU01kZkljTW5ncTNFV2trc0VUSktO?=
 =?utf-8?B?aDcyNEpHdHROQnZDbXQrUFQ3dXRMMnBJdTR1WDR0eU01b2JYQlFXc3VYa05m?=
 =?utf-8?B?dDN0WmVEd1VJKzZsbGZiUzF6UFRDR3hLcHozM3hkVUpLc3pwelozOGtvYWpG?=
 =?utf-8?B?WnNNY01uaVpsVjdYRThFZFYvbk1kR1RBRUpybCt2c1ZyQXRiZytvZmZsbmgv?=
 =?utf-8?B?amt6Y25zbW1Ya3NRdzdaNlhzV3hXMENaN1JNd2VqMjFncFIxYlFVR2JGdi9V?=
 =?utf-8?B?NnNIZTNnQVFiVEtFdEs5S0ZzYUlTdEM3WFY1YkFLUkpNMVNPWHF1bEd4MWwz?=
 =?utf-8?B?eURRSGEvSHdDQXNIQzZ1VVFhdVMvYjBtYkhGaFNobEF5WWdvQjBleVJBUkc3?=
 =?utf-8?Q?f861oBX3u3n0UiWajov2zSNl7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a652811b-5c28-4122-f992-08dd3af255cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 14:37:45.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpHm/HqXFq29mLRgibsjUiYc0s4BW3JdUbrD+brGfoyCNQaZc4fj/jjeuHabyKk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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

On Wed, Jan 22, 2025 at 02:29:09PM +0100, Christian König wrote:

> I'm having all kind of funny phenomena with AMDs mail servers since coming
> back from xmas vacation.

:(

A few years back our IT fully migrated our email to into Office 365
cloud and gave up all the crazy half on-prem stuff they were
doing. The mail started working fully perfectly after that, as long as
you use MS's servers directly :\

> But you don't want to handle mmap() on your own, you basically don't want to
> have a VMA for this stuff at all, correct?

Right, we have no interest in mmap, VMAs or struct page in
rdma/kvm/iommu.
 
> > > My main interest has been what data structure is produced in the
> > > attach APIs.
> > > 
> > > Eg today we have a struct dma_buf_attachment that returns a sg_table.
> > > 
> > > I'm expecting some kind of new data structure, lets call it "physical
> > > list" that is some efficient coding of meta/addr/len tuples that works
> > > well with the new DMA API. Matthew has been calling this thing phyr..
> 
> I would not use a data structure at all. Instead we should have something
> like an iterator/cursor based approach similar to what the new DMA API is
> doing.

I'm certainly open to this idea. There may be some technical
challenges, it is a big change from scatterlist today, and
function-pointer-per-page sounds like bad performance if there are
alot of pages..

RDMA would probably have to stuff this immediately into something like
a phyr anyhow because it needs to fully extent the thing being mapped
to figure out what the HW page size and geometry should be - that
would be trivial though, and a RDMA problem.

> > > Now, if you are asking if the current dmabuf mmap callback can be
> > > improved with the above? Maybe? phyr should have the neccessary
> > > information inside it to populate a VMA - eventually even fully
> > > correctly with all the right cachable/encrypted/forbidden/etc flags.
> 
> That won't work like this.

Note I said "populate a VMA", ie a helper to build the VMA PTEs only.

> See the exporter needs to be informed about page faults on the VMA to
> eventually wait for operations to end and sync caches.

All of this would still have to be provided outside in the same way as
today.

> For example we have cases with multiple devices are in the same IOMMU domain
> and re-using their DMA address mappings.

IMHO this is just another flavour of "private" address flow between
two cooperating drivers.

It is not a "dma address" in the sense of a dma_addr_t that was output
from the DMA API. I think that subtle distinction is very
important. When I say pfn/dma address I'm really only talking about
standard DMA API flows, used by generic drivers.

IMHO, DMABUF needs a private address "escape hatch", and cooperating
drivers should do whatever they want when using that flow. The address
is *fully private*, so the co-operating drivers can do whatever they
want. iommu_map in exporter and pass an IOVA? Fine! pass a PFN and
iommu_map in the importer? Also fine! Private is private.

> > But in theory it should be possible to use phyr everywhere eventually, as
> > long as there's no obviously api-rules-breaking way to go from a phyr back to
> > a struct page even when that exists.
> 
> I would rather say we should stick to DMA addresses as much as possible.

I remain skeptical of this.. Aside from all the technical reasons I
already outlined..

I think it is too much work to have the exporters conditionally build
all sorts of different representations of the same thing depending on
the importer. Like having alot of DRM drivers generate both a PFN and
DMA mapped list in their export code doesn't sound very appealing to
me at all.

It makes sense that a driver would be able to conditionally generate
private and generic based on negotiation, but IMHO, not more than one
flavour of generic..

Jason
