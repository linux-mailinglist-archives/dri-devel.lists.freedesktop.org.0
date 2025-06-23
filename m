Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63341AE47AB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0310E3D5;
	Mon, 23 Jun 2025 14:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4a3hDCBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284A710E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 14:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkBrB7u+zkF08AdHiGaN1+g0l8HWg8fyT9EpDKIOwi1sylIy7nk5Tlut1TVpfzO00zxsPA1TAaJ4km4R3eZgdclopM7gMMcHYgTpPpCv+/lUSmmruUBh1aueuOD4aSgra3I3c1FTiF2ecfC1Tt56jmsW769e7vzY+l3/aQl8WkoU7yXb0KsN/nXx8TE4hj4Fu3qEtM37YJg91QLkeSJq4/6OcAigAnAFPH/rhRGRIJpobs69wAJgiLJTKXAZV1Q84vuSRuzz/ARqoP1zvkJHencNMjLLSU5BYuwhyqGjj9dv7edDZ1kF/4mcWj/tY7zz/r7ZbUTW+kMHCSs9KKfNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfonxUDkd2qnq7e/U6EUsl+OJ5Ro6CR+C7vOtxjs/kw=;
 b=biZyvUV9QtIVWIu0AXh+DO21O0eaYwa2XiXkhvFDshtAXYuYGbbbbYI8lKfiEkoPWH2UF1srLJ7A+I1Ahtho+co7HEtNrvGhS8MfmEnXWeCPvxdxLalzhfwrgGgDV/FlnwQXlsEs60jVB3t0yMQAgef9j5hu61GpiXs5KNLM53CLgctMDStMfJBWY2U01Sfh70VtfNj5WfORhqPXWzhi2N76OQ2yjCoHjUn6M6wIkEMNAFNxg/FJXRhwh9jU61Y671HsR6Oqxgx+ltUzYmQHDJm/SRbJCVbgFnjE6cOIegsXWppDiGYlbWk/fDesnXPyB0/m4uEGnuNmspQPVQMwUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfonxUDkd2qnq7e/U6EUsl+OJ5Ro6CR+C7vOtxjs/kw=;
 b=4a3hDCBPbO6KBe8/8CY7ABMfM2LzXle6Y9hcwKZNGv/aClV0FzhlJehN21NM8awayPOFokkwB0/bwLyRkwyEe9bpKsvbip3x3nwjI6CVNlBzJWKt9Tv8y19CWNXb0dL6H2JUr8xSFbMd10A9sQICZA/aOpn1Ot/oeacKJb3nxmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 14:59:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:59:06 +0000
Message-ID: <613d9b41-148c-4b18-9067-df6950ea288b@amd.com>
Date: Mon, 23 Jun 2025 16:59:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/tegra: Avoid using import_attach directly
To: Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com, sumit.semwal@linaro.org,
 simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20250619113100.70292-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250619113100.70292-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:208:e8::36) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: e644eb5c-a814-4d7b-efe0-08ddb2667fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnVwOVUvd0M4M0hSZTN3cEdGYkp6QnFBWkk0ZHdKalBsbUFCVEZIZjdwREVI?=
 =?utf-8?B?Q1FJSDl4NE9JSzJ1TUZlVmsvRjhWRVJVb3Ftc0JLektxRmorVzZSSlhIVnVH?=
 =?utf-8?B?ZjRuUWlQMTZPYW5kSTlpSGhzbHREd2tBaEFydEdDaVZ0STV3UC9SZTRMdkVW?=
 =?utf-8?B?UERVaUZSVlhYVXNkVlZLSHpGVkZLNURNNVJ2WVc2RlE3M24rN2dPaHZFU2w5?=
 =?utf-8?B?eUcwMVdjMHdHR21UZExzUXh3U3lPTjVzTTZtVE5ETU43ejUzM0lmMmJyRnND?=
 =?utf-8?B?K21XTi9jeWNzV240bVo2UnBvSDJsMGpYa05rMWgxTVBCalA2OVBDZkhTZHEv?=
 =?utf-8?B?T3lOL1BwQ0gvcjVJUG9CSlRIVWNJNkxvK0JKMmVQTFZuQ3QveldRRkZMQUZK?=
 =?utf-8?B?c2UxaXFUYUZEVU9kMCsvTjhVODgxSjBZN3NWM1o2VC9aeCt1ekE0R2RUbmpW?=
 =?utf-8?B?ODJYVzBTaUhsbVhFOFlGMmVEeGNtZ3dmZ0F0WHB0TjJ3WFI5SmpkTUlrOXRZ?=
 =?utf-8?B?YjlPS2ptMytaNmRoUHd4NTNpWUJoYlgyS1MvSlMxaXp2WFcyYXdGVlhxL0Y4?=
 =?utf-8?B?d0NHTjNIV0Z6MU45UnpleU5QRCtiZm9VQzM5bjA2NEtMbUVCUER1NzNYcU81?=
 =?utf-8?B?UlU4RVJmaHdldkhMYkgzbDlGZjdlZThoQU9vR0o3c1JjclVqSG5BbStGdEpa?=
 =?utf-8?B?ZHR5YTBwd01TL1g4eXVtTkpKNWZhMzZYY2hIcWhaWkMra2F2UVVUaXBPV2Fu?=
 =?utf-8?B?aGp4eERCSTFSVXBKVjlaUXFYejBTblNiS1hpd0JHL1B1Z2paZElCRHJ3T3lh?=
 =?utf-8?B?cXRvK0hYblY2NUtiVElsUEVHWVdONytWaWltSTFvOENVYnB3ZThBRkwvREF0?=
 =?utf-8?B?ZUR0ZVEzNWVNanlqdFlCa2VSWXJBSVEwUzRlYVo2TnVQcGxRR0NEaUJtS2FB?=
 =?utf-8?B?Uk9HVWpuVWo5UUNVN05HS0VZZUlHNEdXSGdQc1R6cTh6czM4VjZUYUlnaXB6?=
 =?utf-8?B?dGRBR29zbjZlZms1bllsckpwNmRmU1d1R3FoNVMyWGl4NmczOXEzaWpCK1dD?=
 =?utf-8?B?VnBwWWVyenJ6QlQ2YndEOFgwTGw4NyswRWdQdkcyRHhPVmdITGh2bTJhdlMz?=
 =?utf-8?B?UTM5UU1uczZ1R2J5UEdYTW0vbXl3K2VQOHhKOUgrNEZxWjdQZHhOZFJTeDIx?=
 =?utf-8?B?VHFMYlpHNm13bU1yNWFicTlvTXpRT3lsRGVqU0NscmwxanlhN2tVcDJxM1pK?=
 =?utf-8?B?VFFqdWFadHJmNE1XNWkzM2ZienU3emFZRExDWkRtUnJ2ZktFclJkcHdOeFdX?=
 =?utf-8?B?dlhBTCtmdjRvQ1VDQWdWZUpETUQwK0x5cHRYTmhDSzVKVy9xVXAxT3Z6VHpv?=
 =?utf-8?B?b3ByQ1N1Z2xpNTJKdTRNUWZlREE0cDRjbEJFNVJqazRURE1HcU8ydjFMNVJR?=
 =?utf-8?B?TThxL01RWThhQlpmYXR4SnZuQ294YU5GVWsyaXQ1SmFGbnhuL2kzYjJ1a3Ri?=
 =?utf-8?B?TmtDeUFPdE8wWjRhUUxMWm90V2tacitiVk50dWFaSmZxQVpOaXRpYUdoOUpQ?=
 =?utf-8?B?WVBXdXlzOUJlTitEeFJHRWJsYUlaTUdlMmRvNEN6aGZVOTBOQ0dYYzlNcmcw?=
 =?utf-8?B?MzQ0bm9uc09BUklPUnQ0VzUxcExnRW9vUytwWTBVTzRxNFFNd3RCZlkxcVFa?=
 =?utf-8?B?M3VjdU9yTmJCTmJaSU43b3Y2bHpKNUxQYmZleTZXcDlaSlhpeDhsRGFMMWUy?=
 =?utf-8?B?K2gzbWtwWVZlWFRMbWRSTWllbW9jci9MOVFLeHN6eHR3RGE3dDRqWTBYeDh5?=
 =?utf-8?B?NTUwUVR6UENXdkk0VUhQQjVTVWg4TlZoeDg4d0RuZEhITHpRZ0I2dDl5Rm1o?=
 =?utf-8?B?Sit1RHFMS1QwZW1KY2QxZ0x6RlloQmRhWjRWV2d6Y2hNYVRDQ1VtUEZKaHdi?=
 =?utf-8?Q?voat3JGVZb8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2VlMlNvc0VzTjQwalR5VEhkMndnUEV5YmdhR2RURU9UZGI0T0kzUFpETEFZ?=
 =?utf-8?B?dmFQSy8xalM0ZHdGdHFJNmlsaGZNN3IxazNaRURqd0RLaS9BWWRoWDhveCti?=
 =?utf-8?B?UDFLNk9ZdlQxNVF4cHFiblhESi85ckdlc21Va09QS1NZRWU5Um1RU09tTVVm?=
 =?utf-8?B?cWNmUXIvc2ZIMWMwSUk5QmF4UkFTeWtBY2s2aGtuQjFVNER1R2tBb0R2WjJv?=
 =?utf-8?B?UVNwelRSQjNQMUV5cHlqYlRkckxXb2RGaW9EcTUrSWVKZ1VhWlRzWDZ2OXpy?=
 =?utf-8?B?YjliMlJMbXd0OUpsTTJwVDVUeWw3Wk9LN3kvcjhmZTNXaVJNV3Q3UGNBZGtD?=
 =?utf-8?B?Y0VGRkF6WDFXVE5MZXl4dm0zcTEvM1VETjhPeXFJTW01RXEvLy85azdxejV4?=
 =?utf-8?B?MldGRzlPRWdiZHh4cTUzRlhlWjF1NXVpelZEUkFCUEJtQXpNdlFoaVVmdWlW?=
 =?utf-8?B?K0tPbWZkWFJ4Z1hrUnZWakZ6SEgxYmJnMERscjh3K29IVVliZ0FHdW03a2dz?=
 =?utf-8?B?QWRWeHU4bTFBNEYxa1YwaE9aMEg3N0VCYWtTWTdTRU9CNStmaVFPT2ZXWjBZ?=
 =?utf-8?B?cFBQSGhUT0NnbnlwdDhHM1NjcG5CUlU1Qk55SXpmMHRiS0k4aGF5ZTJDMm9P?=
 =?utf-8?B?TlY1VUZjWUpvRXBET2M5VDNPODhNdG1uSW9zVWd3YlNlK1QvSnNKTnF0Mndp?=
 =?utf-8?B?dnAxYzROSEcyb2xxSWN4aEZWMDlBczVkVGhKVVVva21TUWpnKzd0cFpNM3Aw?=
 =?utf-8?B?QlYzK1dzNkZrdWNaNnloSkltMUkxaFhQVk9LZEdkSWVlRHNwZjFaQ0ZNdUow?=
 =?utf-8?B?NElUeGVQUDJibUkrMmxhVXVQVms1dlU2bXF3Ni90d1ZkU25GNWhLeFUycG1V?=
 =?utf-8?B?UUNxS2hFbDVQTzh1NlB3S2lUSlpXZk5nMEZrVW5ZWGNWUkUrckpzWlE0UHk4?=
 =?utf-8?B?d0FsZ2RiV3pYbVpnUFFUZE0xRWxwMEhqSHJKVlQwU0s4bTRlcEhTbXVLakd0?=
 =?utf-8?B?QTY0bVM1a0dwMnVlcXJqK1RHUWR6MUpoc1NoOXNNd0planVyRlRwakVZd0do?=
 =?utf-8?B?Y3dCMXl0SEdDK3NpdkxSV1RMell4OTROU1VOdUZ5ME1FVWhDNkJIT0k1Nm5o?=
 =?utf-8?B?dzJoWklNeE9tVG16NHpkNzdkQkxDczR1czZnVGo5ekp2QnB2Q25zcUJKeXh5?=
 =?utf-8?B?ZzgrcUxFL053QlZrRy9jOVVtQ29VTnpscHNrMVBJR2w3bW1iS0FOQ0dtWE05?=
 =?utf-8?B?cGcrTy8ybDN3c2Nia2tmZ0RCMFAwUXpJZ3hEbzBtaXZnZVNEZVdGbk5wc0V1?=
 =?utf-8?B?OGlxbWRaTGY2VFl3MEFmUWJvVmdUWXB1Qys2a1NRL0ZlVmpvdFRyWFJCKytY?=
 =?utf-8?B?d3J6TlVOc3FiUkg1REdEbXhYOXZsTS80Z1NTa0pnMmZ4SXowN201Zm05b1Bn?=
 =?utf-8?B?M2pnQUU5NG5ObUpSOW1ic25OSCs0YTFZd1c1Qk5wS2hML1Ztd2ZFRVJRZEZ1?=
 =?utf-8?B?eUphem10MkNoRnJaRTdscnJaZFQ2VGJub1pKZ1p4K2xtSy92a3J4ZWJReWtJ?=
 =?utf-8?B?MGZRcDBhT0VnQnc1NkYyeHA5VjFud255aFNlR2NQYXl2YS8rbWVRMVcwR2V0?=
 =?utf-8?B?elRBTEcrZzNiRmFOcEtoK3lXUk45d3F4cFgrektCTWVJa1o0RE8ydlpBNlJQ?=
 =?utf-8?B?eFJvaE0xQWYwNzhNRjR2Q0t0N2U5WStPRzQrMDNsbWVVYnd6cXlaWGFRcHZG?=
 =?utf-8?B?RWQwVmFrRUdJUkV3aVpqQVVGbjN0WVdOTmtsZGQ5ODFwRDJoSDRRR3Budito?=
 =?utf-8?B?YkZ1NForM0FnS1pjUGd3RGRhN3VYZURQc3dmamtZeUkwajBySlQ1b0F4M2NJ?=
 =?utf-8?B?M0ZYTkl4NHlFdlBnSERYclRrclc3N2UxTGkyY0JBc0NoNlNuYWtXQnp1dHg2?=
 =?utf-8?B?WXliTklxd1BaMEc1Sy9TMHQ5RXJBY0hwc3UzQ0JCSEZOcDlOblkwdzhTUmNN?=
 =?utf-8?B?RFNuL1RQZ3hjNXRGaDdZS2xvc29KdVRiekp3bm1OUTBCL0ZQbXRSWlNib0xR?=
 =?utf-8?B?Qk8zaTc0c2dpWWhhc3VjZEJpOFJ6QlhodHpZbEFKYmovNlR5RTB6SnpDVkJh?=
 =?utf-8?Q?fYjdfQmOiivUlnyjE353yv2im?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e644eb5c-a814-4d7b-efe0-08ddb2667fe6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:59:06.0502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKvAMO0DHF5Mo5L7DgJWQjTPAJYk78Y0SLbQ+c8y01eZq1aPIVeozBdW5f/Mym2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
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

Reviewed-by: Christian König <christian.koenig@amd.com> for both patches.

On 19.06.25 13:26, Thomas Zimmermann wrote:
> The field import_attach of struct drm_gem_object is often only
> required by PRIME code. In other places, replace its use with
> clearer alternatives.
> 
> Thomas Zimmermann (2):
>   drm/tegra: Test for imported buffers with drm_gem_is_imported()
>   drm/tegra: Use dma_buf from GEM object instance
> 
>  drivers/gpu/drm/tegra/gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

