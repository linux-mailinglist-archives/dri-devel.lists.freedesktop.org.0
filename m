Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C9CC8F16
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5A110E1B8;
	Wed, 17 Dec 2025 17:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SwDx7NPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013015.outbound.protection.outlook.com
 [40.107.201.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6CB10E1B8;
 Wed, 17 Dec 2025 17:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v88YGf9zLy8urtAGGidUCskiCZ5WGHoCN2hThytbSCSmx1XQJPaPuW8sE4Ei+f7XIreRVxTAdZjp91iUitk0GybOmMMxH5HgQWsOiLth9y4mA5qUJbxFiKb+dENPvwMR1E+BJSwD5S6+KZuqm1g6esZMWwtYLQOdDsvblEewAlytBPHLWR6slPekLXi5SHn86bKuJjG4d2EOnxVuynSpBKkqh48CznbEu/ZFmtJu/dpOL2oEFl5eVOJxJCQf25EkONO5mKAObrJ/VQTQnNE1ses7yO3MS3EAoTHdp1iKeWWWx35f8GV0reiVZwerO5yZp1ST2Gk5kp2HC4Hp/e5XAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeiDIfyrXr4KzslAKVbLaYVHdSmvaiVn4+fH2hgywbU=;
 b=UL5I5RQjRDlFeVUK6GtWz+JWLxyOwTSdChClTTy/c0gSrKXkJcRxiyPh4Otoce5LJUtLMK8rjV0Kj4MSnrMHvl/d6BmlpbyY0ydjRuvt73zepMU/UyZ60oQdFzrr7MbznQtlJAJdtBgz0XjCy/LCdLBOawRqWvu3thlUSaVBvxg1c1acwTSb4HpZuiYlcEYOG/fgnTFwceB/9xUwYlp0PsqPvievEJZDSgBu3dQqJ1jWfTxsfUq/lb4pRmewc6ZK8ZqkFVbxRMhFPUXF2UmzxTTl15nu7m16h868DNWYE/6yhHP8gF2BN8pDv0YC9MR0H+bVgk/Sy7JiAJo7o8na+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeiDIfyrXr4KzslAKVbLaYVHdSmvaiVn4+fH2hgywbU=;
 b=SwDx7NPglBPt6FxVNqTrPuUSZWbwzZzbHLYHoh0CgwnAg/4igO2kIeEKNToKUmQxp3H7xKtw6UFUhJ0Djecv84RBDBstdVFUyF3eAWFDapy1eOwzHl3bwjLu6qP4K6TUcfNP2k7yG+KumeZ2SQDlDffzGEn+7LgizCI1fuqX2+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:02:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:02:44 +0000
Message-ID: <4f872e73-5961-4cc1-a826-850445235a36@amd.com>
Date: Wed, 17 Dec 2025 11:02:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: suryasaimadhu <suryasaimadhu369@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, wayne.lin@amd.com, roman.li@amd.com,
 timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0077.namprd04.prod.outlook.com
 (2603:10b6:806:121::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e08222a-6a6c-4d14-0710-08de3d8e1872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVFWd3Y2L0U1UDNVc1lPcW9QMTdEMzFOQnFuNFh2SVlZMEJaQnpteEdFeXVH?=
 =?utf-8?B?YmhqOTRudVVxSkhpdnFaaUUvUkFQN3NuK2VYc1dNeE1oaUhoNWxCN3hmLytj?=
 =?utf-8?B?TWtKdzNpSk14a0tHOFgwcHpXbTlCYWdZeXcxczBFN2J3cFMwVE5HVEN5bkVy?=
 =?utf-8?B?VVpLR1NJWjJ3TTAzaTJjWjYvMzVmVVFBZDZzbEdjVjNDeUNSTjZSZE9TY1Rp?=
 =?utf-8?B?dXFaYTRtRmpMbnk2V0N6OThncXY0RnNpWlNZM0VvMnVqMDJnRldQOWlVcUZU?=
 =?utf-8?B?MFhCbURBemVVdXZEWExvL2drOS9IZWk3WVZCZFVVRlJCSGg0MXRORVFlc2Jo?=
 =?utf-8?B?OVlMVmJlVUhlbDluaHhaV0VHSDJzc0diaUU2MzdubnRIM0ZPUk9IUzd3MTJX?=
 =?utf-8?B?MjZJUStQdlM3R2lEK29ZVlEwRmEzc2twcXVkWXVxNDR1djZ1YzJHUnZCNXBE?=
 =?utf-8?B?cnhKUFBKNFFTM3VJdDU4RnlsODVBRnVLMkQzamxvVW5FTE1wMjJBKzdHNk11?=
 =?utf-8?B?WUh1VlExVE96M0hNRWF4OTRsb1J6UjdTZVZoSlNWUklpVHZlanY0T1YydXhR?=
 =?utf-8?B?eEZUVUdsblBKeWdjN2UzRzNDK3dMTG52Nk0zQU0rWmdqd3N4Mm1iQzM5U3Jv?=
 =?utf-8?B?ckZxQ3U4Q2ZEc1cyV3lCckN0Zkxsb2hjcDdadnFVR1Q0OEV3bTFKZzRIRVdy?=
 =?utf-8?B?RTVqSDI2eHhkOVBUZWxVZFNjcnZNTTluVEQ3V1prOGwyZFNHMFM0b3g1QllV?=
 =?utf-8?B?b041VjRxRlpNSW1Eb2dUR1RWaGRqUDBSc0dmVU1BY28ybk9DdDNsbTQzTzBN?=
 =?utf-8?B?K2tpaGtSSzVZanBad1BtRlduLytZMjBlSlU5b0p3V1Z2YlNJWlo3c3hoaTF2?=
 =?utf-8?B?VnhxaUxKdzdESW9zRTFITEtYNGhZQ216M2hzTS9GNW81SUdpYjVNcC8wandZ?=
 =?utf-8?B?SDZiTFo3V1pnd2p3SjlHV1d3bU9tZzlUZGYxVk9TeWxzLy85bTBoSFJqTzBk?=
 =?utf-8?B?bW1ja1Y3UlhjTm1uVXlPN3ZURHBCRHlmRThPSC8rbHMzSHdrempzWmt4Yll0?=
 =?utf-8?B?K0pTZUFmM0t5dnRyYnZGOXpiTnV6dktoSFZ4TXRMcjFKVmZyTGpCWFhiWXZm?=
 =?utf-8?B?cnM4dUM4aEx3b0oxZ0ovRFJyWDV6VXphSTB6aDRWUkVHTDg3SkJiRGtmUUxv?=
 =?utf-8?B?RFNMZ1lkMWVtaGN4Q2lWNFVrWEc4RHoyeHA1QVJNcGhwWU41akFhMUVUOXNa?=
 =?utf-8?B?N2xYQk41NjhUNFFnbU1iMWRmV3N4bmVRTHEwTzVxZ3pWZVUzZENaVEI0WkZG?=
 =?utf-8?B?dnJPSTJiM21QZE0xYS9zZWU4WUlvQmdTREtIaHY2NklrK0FWQjdMcGY5Z2Vm?=
 =?utf-8?B?S2p4OTVBOGZ0dzZQY3VRcGc4WTZPLzdTMVNUQXFsbWxmYnJjNlVyOS85bDJZ?=
 =?utf-8?B?N3lnN0EvNnZiTmpTTndsbldJV3NFYXdKd2dZUjM5WUhHQTcwUU5xNEp4VU1q?=
 =?utf-8?B?U3BmRmRhSWJjZkdzTU56azRRN0wxSFRpRFJUNkhjVGNhaG1wU25tbmxWSUQ2?=
 =?utf-8?B?Nm5Xa3RyNDhPZVUxRC9KOWg3YndBS0lWaGRNemdrTm44QUxtWFdqVUk4S0Ji?=
 =?utf-8?B?dnQrK2trMm5ISlJGTXFKMjB4NDNzdVpTTGR2bHROai80OWlzV3JvYStRZXZa?=
 =?utf-8?B?dTUvN25wcUhTWjVmclRBaXNqWGRDd0ZJT1BtYVQ1djFkUWtjRDdRaGswd2dh?=
 =?utf-8?B?d3Y1QlkvQmEzMGhyWE1vY1BpckNBUVczbDFrYnIvQmV3Ym12NjhaUWN0S0Uw?=
 =?utf-8?B?b0xDbjRKQTg4QUtKVFg5b3o4MkNmWnlrK28xbGMxTTUrQ2lCUW5WZ0x4TkFD?=
 =?utf-8?B?R1B3WEJjSFhvT2kyTDgvUnIwRkc1NEVnQXdCR01nWEFCaDRVZ2trNW9FRDNY?=
 =?utf-8?Q?H9VdWyV8DbhuQO/VqcTBR+yLgp1pNALU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9HUDc3T2VjVWZLYnNaTGlNTVFCUGJLdDQ3bjk0ektDSmtFc1REQkZDYXdl?=
 =?utf-8?B?dEdLTGxKdG16cU90NE90YmNBQ1NIQkpVQmZVNjNEYy9VZlVUQ0g2Yld3Z3pH?=
 =?utf-8?B?TkJkbGd0OEtXVXN6bGNGMXlIdFV4Q1F4QlpkV2tqZ3FZZVRMRkVUQlE1UGhO?=
 =?utf-8?B?Rk95ME5ZQzFoREhRMDhLWjg0M083TXNtdk1iclBsNjJobXMybU5YYWN6WTR3?=
 =?utf-8?B?U0FiNnUxYmxqRW5HRWtxakZneEtXakNiNi9FcC80SE5wN2pkTUI2QnVzRkNT?=
 =?utf-8?B?NTg2cmJpdkR2Q2JXdjhSdnZEaHJWMjdTUjBpRnM5QVl4aldudFFOdzZ1Z004?=
 =?utf-8?B?SmVrUmMxOVh5WnBVWDIwN1pFZVhjOUhYYk5lSEZFZi9uSlJuNXRuZlpDS1dC?=
 =?utf-8?B?OVY4dlp0OCt3T2V4L1ExT2kzQmtPdnorQ2pCUGtMc3loUUs0ZVc0UUZjVkRF?=
 =?utf-8?B?ZVdHSWFGdGdTZGFEVElGQ0JPU2pPRVRRbXZRQ1JQYnhPWkR3b3BaRURKVHJF?=
 =?utf-8?B?eXA0am13dFR2bzlLQjE3dFlWd1V5S014ckxKZ3IyYk1BN1pzQkpacGs0eXRZ?=
 =?utf-8?B?cVA0bGovWDRuVHpRMnJyTFduT091RUdRdnpCdExod2ZrNlJLcUV1MkxJK2xi?=
 =?utf-8?B?UmxOZHNqcW1mRFZnMHUreGZqb1FKTDRSWjk4NlAvalVRbjNacEtDai9yejhq?=
 =?utf-8?B?M1Y5NUt5d1JpN3JNTUYrekdBazNBVzgyTEIrS0xwd0FiWEpmWW5KQUdydzZ4?=
 =?utf-8?B?VklyaUJOWHZLZXZ1RzJWbzJtbWlZb1loZ21Ddi8zSnNuWUtsU0hEc2k4NFBP?=
 =?utf-8?B?M0cyYm9PSHVXbjV4SitRa1FpK2FPbXk0TEplZElZbTl4blJYd0FPWUVVTGtG?=
 =?utf-8?B?QVJYR1lwN2w3a1ZjY2FlWnAxSTYzdmRUdGhKWFVCRzlxYXRQd3F2OUF0czRz?=
 =?utf-8?B?SE01Rm5kOWt6UnJEZmNtelRCYklOV3prWUVLMSs3dUtvVitCckFQTU1sYjNq?=
 =?utf-8?B?c1c2T25tTzYrUEFodFRSRk11Ulh1YkFCQVZpNmYxTlZlMWZOQ3l3Rk0wdVh1?=
 =?utf-8?B?V2RXWmJLL1ZXOWorc1J1WGoySDFWd1FSWk5qNFJsNW8rRnJ6c1RWQ2RNN3Rk?=
 =?utf-8?B?QUxKRXN1WFZwN2hOODlmd3h3eXlKSTdrZW9lYVJUL1hlVnZ0Z2ZvYXNtKzZr?=
 =?utf-8?B?NGM5OWhhaXBXVjJXRjNiUGRYWGNUK3dzVTNrYy8xVEc4U1B5cHhvNzgxWnla?=
 =?utf-8?B?VmN3Z3lvTWk5NHg1RVZTS0xEL0VtZGdpY2tDSklSUTVyYUlhWXhYR1ZqN1V6?=
 =?utf-8?B?eEFCMUlYa0tESEpkQ2ppTUwvVlRFMjFkVFk0aWovbnFGR2dqMllGeFNsY2xT?=
 =?utf-8?B?c1cxRjhTMnFrTFhaeFBLTUQ3eHFwcFFJZWpKajZIcDM4MHdKYW9vdzlnM1I1?=
 =?utf-8?B?VEtHVHRIR04wNGxBWjVIOEZOSkdaV21hNWVuUUhBSFZwaEpSSHFzNHFLMEhk?=
 =?utf-8?B?a2FhMDBJQ3ZpZEVPUTBYQW1xZyt6c1NhYkpWYS9FRGYrb0d2ZFNCRk1rQkhF?=
 =?utf-8?B?eCtQRDRZSjJwQWNIUlg5VVlZNEhER0ltRFU3OHZOMnZqYVovdUNweGVUOVV2?=
 =?utf-8?B?N0J1cUFZMjlOQ1c2cEZDN0FTcm1IYTNqZXR6aytRaUFlZlpsYVQyU2l1TFFS?=
 =?utf-8?B?K0R4d3JWc0hsVjdOczVwNzdTZnZjWHVpclI2MTJOMURtS2FJMnp6WVF2SDlh?=
 =?utf-8?B?bkY0NjlMZ3drQW1GMWlwOGxLdk1aVUcrNHFiWUx3OEhwUTdxVjlOVUgvUm9p?=
 =?utf-8?B?dk9hT2NJT3U2bHJXZzBNdGVnbXV6MUtYYkhMc2d1VjE2L3VPWG5yYTI0RU5O?=
 =?utf-8?B?Ri8yZUZuRG5Iai9OenVPUGNJc0hkdms4Tlp3aS96OUl0SHhFNElTRHNZUmp4?=
 =?utf-8?B?UDVpb1E0cE5RdUNLakdteFg4cGJUelNqeVBpTnNtZmlZQlQzL25Md3BNb0lm?=
 =?utf-8?B?eTAxU2dNdk9OUlBCbmh6R0FWVm84VUlwSTY5WTdsRFNHU3BjbGRTM2pQc3NM?=
 =?utf-8?B?MHBVMDV3NUdocVJieEJBWWk1K1JyY09qSVhVWVZ6bGI0Sjk5TkZnMFhFTXZM?=
 =?utf-8?Q?1sAJYWnCrRBXzbybJmdP99Wef?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e08222a-6a6c-4d14-0710-08de3d8e1872
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:02:44.1962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amrxGnGOPZ26DcF+t1rggyw/3CGDDqPeM6lJdKzSlfkMfUKFWYlBtApf8nIP7TWGJsZt6G7mzuYve7QH8sgM2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897
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

On 12/17/25 11:01 AM, suryasaimadhu wrote:
> Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
> 
> The drm_* logging helpers take a struct drm_device * as their first
> argument, allowing the DRM core to prefix log messages with the
> specific device name and instance. This is required to correctly
> differentiate log messages when multiple AMD GPUs are present.
> 
> This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
> logging macros to the device-scoped drm_* helpers while keeping
> debug logging unchanged.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> 
> diff --git a/Makefile b/Makefile
> index 2f545ec1690f..e404e4767944 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
>   VERSION = 6
> -PATCHLEVEL = 18
> +PATCHLEVEL = 19
>   SUBLEVEL = 0
> -EXTRAVERSION =
> +EXTRAVERSION = -rc1
>   NAME = Baby Opossum Posse
Unrelated changes.

>   
>   # *DOCUMENTATION*
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> index 0a2a3f233a0e..4401059ff907 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> @@ -238,22 +238,22 @@ static void unregister_all_irq_handlers(struct amdgpu_device *adev)
>   }
>   
>   static bool
> -validate_irq_registration_params(struct dc_interrupt_params *int_params,
> +validate_irq_registration_params(struct drm_device *dev, struct dc_interrupt_params *int_params,
>   				 void (*ih)(void *))
>   {
>   	if (NULL == int_params || NULL == ih) {
> -		DRM_ERROR("DM_IRQ: invalid input!\n");
> +		drm_err(dev, "DM_IRQ: invalid input!\n");
>   		return false;
>   	}
>   
>   	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
> -		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
> +		drm_err(dev, "DM_IRQ: invalid context: %d!\n",
>   				int_params->int_context);
>   		return false;
>   	}
>   
>   	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
> +		drm_err(dev, "DM_IRQ: invalid irq_source: %d!\n",
>   				int_params->irq_source);
>   		return false;
>   	}
> @@ -261,16 +261,18 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
>   	return true;
>   }
>   
> -static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
> -					       irq_handler_idx handler_idx)
> +static bool validate_irq_unregistration_params(
> +	struct drm_device *dev,
> +	enum dc_irq_source irq_source,
> +	irq_handler_idx handler_idx)
>   {
>   	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
> -		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
> +		drm_err(dev, "DM_IRQ: invalid handler_idx==NULL!\n");
>   		return false;
>   	}
>   
>   	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
> +		drm_err(dev, "DM_IRQ: invalid irq_source:%d!\n", irq_source);
>   		return false;
>   	}
>   
> @@ -310,12 +312,12 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
>   	unsigned long irq_table_flags;
>   	enum dc_irq_source irq_source;
>   
> -	if (false == validate_irq_registration_params(int_params, ih))
> +	if (false == validate_irq_registration_params(&adev->ddev, int_params, ih))
>   		return DAL_INVALID_IRQ_HANDLER_IDX;
>   
>   	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
>   	if (!handler_data) {
> -		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +		drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq handler!\n");

Use adev_to_drm().

>   		return DAL_INVALID_IRQ_HANDLER_IDX;
>   	}
>   
> @@ -375,7 +377,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>   	struct dc_interrupt_params int_params;
>   	int i;
>   
> -	if (false == validate_irq_unregistration_params(irq_source, ih))
> +	if (false == validate_irq_unregistration_params(&adev->ddev, irq_source, ih))
>   		return;
>   
>   	memset(&int_params, 0, sizeof(int_params));
> @@ -396,7 +398,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>   		/* If we got here, it means we searched all irq contexts
>   		 * for this irq source, but the handler was not found.
>   		 */
> -		DRM_ERROR(
> +		drm_err(&adev->ddev,
>   		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
>   			ih, irq_source);
>   	}
> @@ -596,7 +598,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>   		/*allocate a new amdgpu_dm_irq_handler_data*/
>   		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
>   		if (!handler_data_add) {
> -			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +			drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq handler!\n");
>   			return;
>   		}
>   
> @@ -611,11 +613,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>   		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
>   
>   		if (queue_work(system_highpri_wq, &handler_data_add->work))
> -			DRM_DEBUG("Queued work for handling interrupt from "
> +			drm_dbg(&adev->ddev, "Queued work for handling interrupt from "
>   				  "display for IRQ source %d\n",
>   				  irq_source);
>   		else
> -			DRM_ERROR("Failed to queue work for handling interrupt "
> +			drm_err(&adev->ddev, "Failed to queue work for handling interrupt "
>   				  "from display for IRQ source %d\n",
>   				  irq_source);
>   	}
> @@ -720,7 +722,7 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
>   	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
>   
>   	if (!acrtc) {
> -		DRM_ERROR(
> +		drm_err(&adev->ddev,
>   			"%s: crtc is NULL at id :%d\n",
>   			func,
>   			crtc_id);

