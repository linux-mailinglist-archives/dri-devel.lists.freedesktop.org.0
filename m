Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB485A68638
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 08:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7ED10E2E5;
	Wed, 19 Mar 2025 07:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KLb4BHv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D810E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 07:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0zloUr0N3pY63OgKXvGkY+GMRqPNZbdQCT6oAaBhL2QWabnLwIf3nRkpYicEXBQKkHeeNKkJxLwV58KMTUwgaMTp3k7jifvY6zABuxl8AcPnlJ1MNrkkfYeWcblpZhh9RtJTfA8wAzXleMuJdnEKAJo79bZ2AHQe5IOGcqMkr/0wYoqzXA43t/8VlKHJMrLpqCc4A6cKfg2BYGWBYebFKiW933kNy9wALUSgotczubnTdHJlbJ1Vahp7DNvzvlpbrIs7WC2jLkYypIB0Z0B4ErWCKw+w8XvlXodS7K/UVBOeA5fqJg2bRcdJMxb6QcmgAgR7cIPjY+QKVXO9yi1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfjUB0N0DxTadwtDRYnYhR1+s+hCy4UJT3K5MNamjUE=;
 b=VmLZnMP4aEJiPLLzuT793OYBDhtzPd8zvnbb+f9kULb3LM9bWnB8kcUVEab9ea6UKDWhxXJJ1tKLtL+ZweAlrQU6ZXSzFBXUhd8efU4wRMhozb4kxujvFnjdu7ZC9m2eEPiZNju9fhrEHBCWGZIw8Y2GYTdIkuMRei8IumbEmXJF4BNRGWAxhnpF8G+MR84FicE1Rp+sHA0Ibmeg0skRckCj/BoBEgELcj09VTiQl1aQ8lvFG2y5+uVh7KtE8pIxPpGH2ohDPdhLojtAqmEOdk7A2BaOgw9DSlrnGGvbD6ISRHhSqvzs1opLxSSUSadpk8hjprjeDMZ0hkGN/R6TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfjUB0N0DxTadwtDRYnYhR1+s+hCy4UJT3K5MNamjUE=;
 b=KLb4BHv2ii5TMg/Wim98aglr2XjDHFXyvSksIQcgtcBVyHeS9qZoex54vwsdoDLN/Q/q/uPD0N7zvHBTcgUfXR6UQGCuuhg/cQFRZ4kOILkJoFcvHc/wX/QG4A79yROa4Hr9bPNBcVuZKVDVIIlEZUmP2OEcB0D6To0Ja6/HTZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 07:55:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 07:55:18 +0000
Message-ID: <19955673-4296-46a6-8b0b-2baab3cf68d0@amd.com>
Date: Wed, 19 Mar 2025 08:55:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/gem-shmem: Export VM ops functions
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Asahi Lina <lina@asahilina.net>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
 <20250318-drm-gem-shmem-v1-2-64b96511a84f@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-2-64b96511a84f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5b73d7-2f33-49e4-e3eb-08dd66bb6412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHk1SGdYVUYzaXlOK1hRZEJYTFdsWUs1L2lQeVJmYUwrOEpkaGh6S0V3QS9V?=
 =?utf-8?B?QzJZYzFyNld0Rms1cWU4SE9ZOG9ZYkpNemk3N2lpTm51MmRybys4eFNoNkxo?=
 =?utf-8?B?TG1ETXY4Z05CYU50LzhTL21iTEtibklqWFFKMnVKN2NvdWJVWDhQTlJIZ0Jj?=
 =?utf-8?B?STNpaFE5MW4yU3ZTc1dDT3F3UzI3QXcrQ2V1YjlBekRpbWpkRHZDS2ErME9k?=
 =?utf-8?B?QVJ1MnlKYndpeXBSMUNuL1NlRWhmazAvSlJOUXh2OVpmOEFwZ2h4Q3Q2Y0Ji?=
 =?utf-8?B?eEpCYmxJajN5NnowTTZ2ZkpaV28zR2daVU1KOExYT1Y3MHVaaTAyclpNdUNp?=
 =?utf-8?B?c0VJWmF1RFJZRC80ejdQa1pXUjIwVURLdWJ6SmtUTURqdk9veVFKV0hpTVhS?=
 =?utf-8?B?ZFpsL0t0VVVxLy96ckIyd1BMUGMzbkF1cjBPTFZYTWwvai9pczljVmN5NzMv?=
 =?utf-8?B?Nmh4R2VYVXZTSmRxOUZaWGNCaXFONWlLM083SjA3Vjg0MGZQUkU4UHVveStE?=
 =?utf-8?B?S3ZJMFlXcEVPbll3V0tNbmpqM1dtbS9KQ1g2Y24raE1JSXVlY0dlZVFncVdE?=
 =?utf-8?B?dk8zUkN6TGVQd2diNStxMXltZjBCZ3RLN1g1Ky9SaTltMEhza1ZhdU5ld254?=
 =?utf-8?B?eHhscEFkUmRvdUljT0hOSkN3Vk84dlZ5Z0Exa1FzS2dESDVJQno4TjNnZ0FN?=
 =?utf-8?B?c3Zhc0UvWVZUby9Mc1EzZWtlRlhoZnp3aDNwcWl0WU84NWdQMnhnS3RQMlV6?=
 =?utf-8?B?WGFPZ01BR3g2blpZK0o0Sks0NVNmQi9ReEZ6RFhBbzVGV0FjdFV0dG8vNXM3?=
 =?utf-8?B?aUNZUU9hRkFUeFNWblZqNWRPWkRPZVp2MWR0bGpOemY2MEU0RkVTTkdXNHE2?=
 =?utf-8?B?ajZDc2pncXV5NzhVMnpLeUozOC9WK1hlMGZ1N0VFWEkwcGNUZnJFeEFUK0pT?=
 =?utf-8?B?YlVMNmxzS0czbFJ3QkVFbkF5akNRUGxlK1NLc0FUdzd5MllXVFR5VXlYMHZT?=
 =?utf-8?B?ejVXTERuWGFVS1pWSXhaQ1JLdVBvdXNEME9iYk5XZm1iS2YyVk12TVJmVlAz?=
 =?utf-8?B?NTk0a29GL2tuWFRWVmkwbmZxL01wYUtydzAzc1UwVGRZS3NhOVFZMkhrQ2hW?=
 =?utf-8?B?aFpRNTVVTUEzSFlNcitqRlY2QVgyQlNMaEgyRnR6Sjk2ZzcxanFaUFBpWUlT?=
 =?utf-8?B?bjJkb0lZSy9Dd29YTGJXNWpFenpyNkh5eCt1R3ZpT2xhUlVOZzZxQUI0Tmpk?=
 =?utf-8?B?MkIzLzBBZWNXUUpxKzEyUDVmY3B6eVRhVWh5ZGdtaDdNTVRLRlAwcFlhSnNu?=
 =?utf-8?B?VjFlR0Yzc2ZQa0JJWkN3QnhMTnllbjRpYlJSMWxPL1JSQXIrcTJPU0NabmRG?=
 =?utf-8?B?TFJhSmNkcDhSa2ZTb0Z4Y2UyUDdKUjlKNUZMT3pOOG44SFJab2FCRUlDcWY4?=
 =?utf-8?B?aU9zK3B5ZnpsazA2elM0ZHFLWGUwbzdXYXBFMkwya2N0Vk9sai9zajU3S0NM?=
 =?utf-8?B?TjlyT3JvTzhTdy9oQlNranFtTG1IVTZTYkR5dDJmSWcxM2ovUm9VOCtOMURx?=
 =?utf-8?B?Y3BuWVFtZmpjdUdEV2c0MG5Bekt3RTF5K3gydHNacTkrNFlScnFJNFdnenJZ?=
 =?utf-8?B?RGVubzlLWGgzcm1sNUttWC9peDRzb3NnSTdnZVhiQTE1NXR5TGxBRjE0TlRt?=
 =?utf-8?B?VUx6cW9jWnR1Q0U3S2tPUFNaWE5JS1MrZVViRnVrZjdtY3QrQ1NRWjRSSmRK?=
 =?utf-8?B?eTdRZGhQaW4xY1R4dGR5L0FETStjcXVVWHhpaDJCTDVaZVIyWUUxREI2UURF?=
 =?utf-8?B?aWQwSmtUM0l6d3ZKWHB1cW9yY3k3NGRxaStYSkJHVEZyTTZ2QklRR3RneUtV?=
 =?utf-8?B?RXJzaGY0OUU3OFdZZE05WXhoN1daN21oMFdGQ005ZzhnREE1RXFBYVIvdktO?=
 =?utf-8?Q?mrTdez7udGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJtSXZiNGI0QzdPcjRscW5vdGlVK2lPUWRJbFY0cHVoU2xxY1gvNlRJeGQ3?=
 =?utf-8?B?Q3hESmZ5RWJlZDByM3hjOUMxUlpzeE5oZ1MvM1JPYm9JdWtBRHlKRGhpWWkr?=
 =?utf-8?B?VnRhV2FDYkxPRHMwWHN1bnZ3N3NHUjVNM2ZCS0JDVVdpanNweHlqZWFaVWhz?=
 =?utf-8?B?WWxPUEJESHpQZ0NRTXF4bXo1WGFYV1g0WlZIT045VWhLRG9GemxpVm9yRzB4?=
 =?utf-8?B?emxBSHBBZTkvUzlpU3ZQSEpxcUpKbFZGUVpPTjliODg5V0p6ZVhNajVjNk5U?=
 =?utf-8?B?WGFvWUlZYkgySXZBendQNm9KdVFhdDg3MjNQQ2MrMVU4elFxTjNFbzZEbzJY?=
 =?utf-8?B?RUFCNTlUTEp5NmJhRXFCUDlQUythQ3JkdGR1UGo0cGIxZzZWU0ZVVjM1b3JY?=
 =?utf-8?B?Z1FjY0daTXVDYmVXZGkyZHU2aGgyazVvWnJyL1NiMVpnaHlDYklnLzVIWmh5?=
 =?utf-8?B?Q0Y0L3VUZmlpWjRUT2ErVWUrb0kyc1lFTDVic2hadmtwNkh4SlN6UUlrbTAv?=
 =?utf-8?B?NjlxKzgzcktGeDJqMGRwOVJYQVBWSjQzMHpybFVmeWIxNmNYMXdLbmY4Ym1T?=
 =?utf-8?B?Z29ZejNzd2w0dXdrU2NxMVVWSEorL1cwWFJjWlpnZDJzcGNIVzQ1R09HL0lR?=
 =?utf-8?B?eFRjMmdUWm5XWXJtVmprU0x0RTdTR3VvYjFyY3V6eXJDbXFDM3hmbEJRY3Vi?=
 =?utf-8?B?U2hnT1dmZmppNU1lUStaQ2dENzU5T3ZMaGEzMHFTSFlIcERPWGFwdWgrcGxu?=
 =?utf-8?B?dmVFY2RLRWZHVUtla0JkV3hFeDUzUnUwWVRaL0tSLy9ZOTdpTzNKd1prSFhk?=
 =?utf-8?B?M0p6VXNrM1VZYnpyamNNNW96Vk8rSXVKUkEvL1BDZWUxU3l5V1dwR2s2K3Vo?=
 =?utf-8?B?MlRPWGNGSjM4RnVDTjB4THNGMFhWeTNiYS9hNkVWWmZmNk5jZTRrZXRGM0ZD?=
 =?utf-8?B?R1pkR0twR3JyMDZVN3dmaUNoejkwcHpwY1hldVZXOEJseUx1SmdvR25vOUgy?=
 =?utf-8?B?cERXNjFDZ0ExS1B1aFloNnp6R3lxdEFXNkVtMHgyeloyN2tJYkxac3dhT3RU?=
 =?utf-8?B?SW9pcGtTQ3RoSXErZi9xV052anNQUDA1ckd1TllrRFREellJNmV5bXpGTnN3?=
 =?utf-8?B?R2YzWTR4NFoyVXZseEhwanRVcU1kOXB4RHhpdklqR2dNaFVOek1vSGNBNHFz?=
 =?utf-8?B?MGV4NUtXSGlkUUxJcUtiaTVEajF0WWF6UU8vempYN2JTS3dwcnJId2ZZQ2t3?=
 =?utf-8?B?VW10U0N5TGVxZXJkSTlIMnRpMnpGSmxaY1BrcGM1SnhGWkRZMW0vM09nRU9w?=
 =?utf-8?B?UGFiQXlOckhMemNaYWk3SzFyRlVKWWVoby85em45cllRd2FzeExNNTI3NFhn?=
 =?utf-8?B?Y2hiYkRqSmRSVEFlSWQwUk5mTkVxV3dUVlMzaUpxbG8ydWJOcWtsRDRPSk5M?=
 =?utf-8?B?aW9lZUdleXN5UlMwZTV4WmZHVnVpU0w0ZllPdHU3MVpDRmtua3RUd0NBTi9Z?=
 =?utf-8?B?NzVob2tqTzdCUFVQK2dvR3VDRXpPZEpqcEpoU2JqRTZUQWdZeEdKVnRvb1VJ?=
 =?utf-8?B?NXNwNUNMd2VwSWJWVGZUdWw3TisrcDRvYktNcmJPQ09EaDdibDcyNHFkdW00?=
 =?utf-8?B?Nmd6L3gwUTJnWHYwMjVlY0QzT0p4V1FlaW44aWZuL0hYZlI5eDJEcENUUCtp?=
 =?utf-8?B?Vkc3blc3U014d1M3UHhrdVdWSDRDSkU5b3JZTG1kSHRsdGdXd3NMZ0Y3TVhk?=
 =?utf-8?B?d0dqTmtBc2Z0TFNRSUozbUh0MXBDWkdpTmtQWXM5V1JjYi8vTEJDZm0yY3Uw?=
 =?utf-8?B?REdKVzN4NllJRi92dFRxSUhRZ21RaGcrbVp4bWVYb3RERHd0c0MvTVoremJW?=
 =?utf-8?B?VXJjMmZFK2krU0pCR2JtUWN3QUM1VnliaUtBRm1HZDRuNkxUSG1EZGNjdWxj?=
 =?utf-8?B?bGVHSXZkU1dhUURzVXFhZ3VvYUpHd0VxWEdsVnlqTC8vanhjbkhqZ01TSVJN?=
 =?utf-8?B?eEhCeURqaVJYVTh3RU05Y2VLNkM1OE52a01qYksxdWg3UWVLbFlIL3RIMTlY?=
 =?utf-8?B?dlpTQ2xRNjZ4MzVEQ0EwTFpoVVkxczZYZTZueUdnM1RLNzlWMnhRRy8yVnNt?=
 =?utf-8?Q?Hwq7NizcYwFGqnCmZN/m68Xnj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5b73d7-2f33-49e4-e3eb-08dd66bb6412
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 07:55:18.1720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNa7lMQgLWFX8yUJSF1y2dsj+Fbo2ta0pStB7JbZO2s76Pdq4wPa+8sWZGzJsv4H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624
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

Am 18.03.25 um 20:22 schrieb Daniel Almeida:
> From: Asahi Lina <lina@asahilina.net>
>
> There doesn't seem to be a way for the Rust bindings to get a
> compile-time constant reference to drm_gem_shmem_vm_ops, so we need to
> duplicate that structure in Rust... this isn't nice...

Well "isn't nice" is an understatement. We can have that as a short term hack, but I don't think that this is a doable long term solution.

For this particular case here it most likely doesn't matter, but operation pointer structures are often used to identify a certain class of object.

So exporting the functions and then re-creating the constant operation pointer structure in Rust doesn't work in some cases.

Regards,
Christian.

>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
>  include/drm/drm_gem_shmem_helper.h     | 3 +++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index ec89e9499f5f02a2a35713669bf649dd2abb9938..be310db5863871604f3502ad1f419937d4c20a84 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -535,7 +535,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>  
> -static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> +vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -564,8 +564,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_fault);
>  
> -static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> +void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  {
>  	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> @@ -586,8 +587,9 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  
>  	drm_gem_vm_open(vma);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_open);
>  
> -static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
> +void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  {
>  	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> @@ -598,6 +600,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  
>  	drm_gem_vm_close(vma);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_close);
>  
>  const struct vm_operations_struct drm_gem_shmem_vm_ops = {
>  	.fault = drm_gem_shmem_fault,
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index d22e3fb53631ab655748d7f6c628ffdb402f6324..b70d3cc35bd194e7cd718bee220408b5dda568bf 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -132,6 +132,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);
>  
>  extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
> +vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf);
> +void drm_gem_shmem_vm_open(struct vm_area_struct *vma);
> +void drm_gem_shmem_vm_close(struct vm_area_struct *vma);
>  
>  /*
>   * GEM object functions
>

