Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C4AA9D18
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 22:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B143510E434;
	Mon,  5 May 2025 20:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RuXklaL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B1410E434
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 20:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2N3i4PRmniqJ1zuQXV7zVbE8KCnQnD45Od/6NhO7QnGdOIidcVPYBpMBPanTaHOobeIDWzFOOEIXJNhpj4sfWGStCEwgqGWyKQH/xILqiU6yRix1bZ1vHIXU651paNYBjrNRuIVSiMQdrBx27oAktxcS/IAOyc/Vq+OFYaGVL9LT4i99mWUfn/WPZtUdSv1J7+GSfFpl/FYM8XaJTmoIQrJWUC59nSZEeFRmqrADt/h7gTTEC2c9esFJYK1HJ7JSOps2sqb9q3vMxDrsY/zmOQ5QI4qQYOANdeCCVBGfhwS2BX5ueyxcYEWmJU/wVXGbcKk9bxaCJkvYWk/io/8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q2VyFr+ppKDQ652EVnycPgh+RJp++7ULf6uH/0BjU4=;
 b=DU9CGl5yrRntL07jDlieX1BDu3V14o0OddycAFvMPCj0pddalariV06iSKxny9ahwRMPRaWTokSEebvhT/RB6D22YPbA2nRev7LY/lrvkFdwMS0oFkKKCAbr7GBnpKdr+fwAaHlYM3sqpiHFmKATboIg4OQ2xVYlIiGYNU73d76sPALJk12MpE0TbRJbstJu8xLiKIavLXAjGwDz4/tz8hd4rRVRORuuXTc61TWibQ0Bfs1j6Lrzx8mjg0ubBGuByAYJphFTqFQ7+fgN3YfKDpuL9oAtG4XISEsIxIELQ5/pRfWO7+B9JeVO6xPUC8FUdNh4q/Oa5sOZTiFx2I74eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q2VyFr+ppKDQ652EVnycPgh+RJp++7ULf6uH/0BjU4=;
 b=RuXklaL2RD+juFZdtRVe9O5+K0dk/+BBnSK2h/ISPaYJjknrvTXS8N15s21JimOF2gYNlQAz82WyjY8thRTFhsaF/VHUTKtFmhFv1nQhc0mnAnlPU/6f13NqudelQ1Py9E5HHD7Iqk+kZ9WaBUvpk9uiHupnxT99WveyO6HxN/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Mon, 5 May 2025 20:22:17 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%3]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 20:22:17 +0000
Message-ID: <1f0a3a95-9dbf-4456-aa6f-f9ef49a560d8@amd.com>
Date: Mon, 5 May 2025 15:22:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request format
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, stable@vger.kernel.org
References: <20250427095053.875064-1-Wayne.Lin@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250427095053.875064-1-Wayne.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0146.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::28) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: b967afbb-0f37-4e3f-3540-08dd8c1287e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3lKZUgveVJ0NXNjN0xlcTNGQ3VxNy8weTNwYkZlVXNOVTN5VnhiaVN2Lzh4?=
 =?utf-8?B?UmNFUjdMRXhPbkN4cVZBYi9lUC9wMFZIeTdpZThjWTBrTmtMTFJYaWpqL2Nn?=
 =?utf-8?B?ZEl6dERPL1dwSDF0cFBHRGYrWTBCUWdMclkxSG44WUtqYWNNbjRlNmhHTjQ3?=
 =?utf-8?B?Z2crVThRejBWQS8yby9rbjRQd1dyTGNpdTlBak5mbWpXV1huSHVsQ1J1M0tB?=
 =?utf-8?B?STRjS01NLzhjbjd3djd3eklUUUwwdTUxSFhTWFNubzNUU3JtS00yUzRUM1kz?=
 =?utf-8?B?Wkg0SElCZ2lWTzRJSFFuOWp3aFZtQXJsUWZQalR5bDFmUWJhejIzM2MzdU9u?=
 =?utf-8?B?UUlwSkRDaHNWTmFlc1puWG9yaytwVmhPNEVrVXFqaGhiNHZ1Z0MwTWZtMm9Y?=
 =?utf-8?B?ajlRS0xUM2VuTzFjdjJ6T2ZGRzRZVjU0bkdQdnQ1Tm16YUFEeno2ZUJUYWQ3?=
 =?utf-8?B?aGc5d3piQ04vVEZjMDhjNXU5eU5jamd6Um5oYUdoMXFQd2t0dW4rUnV0OTB0?=
 =?utf-8?B?N1dvQVU2L1k2aEgwK1grN3NFWXAzL0VNNVJxM01rOWxJdkRDMkF4YmYyNE5F?=
 =?utf-8?B?ZzFXaTZxKzlkdEFmT2dCdHB2Y2Y3dmZpcCszaEg0T3ltZ0RZYkh0M05HZXRo?=
 =?utf-8?B?ZUNXWlRCcWlQa2lXaHp3S1VLU1ZQVFhlTEhHb1ZBaVRnL3BVb1FlcG5BWEFi?=
 =?utf-8?B?ZlUwMDlCZUgrTUxWcTl6Y1Q0VVZEUncvT3ZTMDJrbG82NE1IcVMvOXAzVE9G?=
 =?utf-8?B?ek9RWTRROFhZNVJOZGw5RE93YnNSLzFZc1d5RFVjVHZhNkYzWC9PM3pSZ3A1?=
 =?utf-8?B?a3NFckdPenNCTzc5bGVXNHVrdE4yUFF3Um9CdUIwUi84emZxdWQvNGRsQ3lG?=
 =?utf-8?B?NzVWUlVFUU81blFXN2RVS3hpanVCYXlkcWsxNlcya3d6YVRVNkE1Si9lTU5v?=
 =?utf-8?B?NGpnSmJWSjJFaGM4Y1hVQlJvYUhvZHBCREMvMEkwOHlsTWw5clErYUJIODdE?=
 =?utf-8?B?enUyRkFLQzdEWGxQeWV0SnFSOStTNStsYmNTYmpHR1kzLzZwdTJTeFk1ZDRT?=
 =?utf-8?B?MXoyLzlFZ1hnR1QxT0V1L2M0eXNXa3lMOFU5bGpkTVV2Yjc3alRLZzhsR0pv?=
 =?utf-8?B?Q0tkZVovd3hPMG5hTHM4bUhFN0J4THUrNnE2TldhSThDUnB2TjM5REUrT0lu?=
 =?utf-8?B?V053eldEeUhCZmJnRk1wc2kxNWpYKzhuZjJwYm96cEkrL0VpaEpGdWR2MUU5?=
 =?utf-8?B?R1BJTmo4L09NZXhRd216ZUFhRkhtbjZXVVYrTThEVHJPN2dYVmkwTTRTbDlH?=
 =?utf-8?B?V1FYcGZIQ054cmxLOHF1MDRzUFRNOWx3TTVjbWRXQmV4Q3JSUUdSV25XTFVU?=
 =?utf-8?B?YUFQL254RnhUTnY1a2M1K0ZzNFMveUZBRFZqUUliNlNGbmsvc3FaWUU5d1A1?=
 =?utf-8?B?SHZvNmN0R2d5NU41NjBxMWsvR0xYcG1rcDlOVys3Wk1odEtMOWFOeXA4eDJM?=
 =?utf-8?B?T0J4cHRWcWpYd2dqTE9Jdi9ZUnFnd21udlptbFoxa09kekpWY1o5b1VPMFc2?=
 =?utf-8?B?dHhPZmpFOWJEZVQ3ZEc0enZYdnJSOFptWHFHd0o3bTFIKzJSclFVSGpyYW03?=
 =?utf-8?B?bXY4UW11Y0FQSi9tbkUvc25NOU84WkVHRUVmZ012YnpxaUxBRXBMTHhqekFG?=
 =?utf-8?B?NDFFMUNaYUdIaEttcnlrTG90VnpEZTNRT1dyNk8yUDJaV3YzRXdabUJTV0Q4?=
 =?utf-8?B?d1B4VUc3RTg1RHV5dG05UGVjTkFzWGlDeWJVMUttZWZLcTVVSndpQU1CVFJH?=
 =?utf-8?B?SnN2cTJtMVJkQ0JlREJFMFlBSG1iczlFNm4rVHFhMnIyVXRralpRLzhFdHFG?=
 =?utf-8?B?b3BQS01ONFJzVjdTUTNWaDQxK3Z0WGpvRFY0Tlp2bHpZMnZpYTdRcENKZFRa?=
 =?utf-8?Q?zsAy2td0rIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1hZS0t3K2R1a1lCMlZQU3poaGc5cGpVRXBvUG9VOE1QZlYwVXhmaWV1aC9o?=
 =?utf-8?B?RythTFFmdWRqL0ZML1lCQTZOSHBTVnE1eUxNQk5UdFdjZUozK0lkSGNTUzlz?=
 =?utf-8?B?c3dVb251b3VGSitWaWRpZUVLRVIvZ2c0MjlVWkFUMGhFOHp4NzZxZm14eVJi?=
 =?utf-8?B?VWxZa0JNN3VNNy93YU9BSVlUK1Brclp6Szk0S2JyQnhhbTZCUndhU29VR1NK?=
 =?utf-8?B?ckNqL3YvSWxrZzk5cTZ2Vk9pRjgwblcwM25WaFlkSmRnZGVZcU9PbTRTMFNS?=
 =?utf-8?B?ZnhaYTdvWnJYL1BWR2dmZ0xYOGw5RVpBTmhOdk9VQlBXUEo2YUhHYnZ3L3pV?=
 =?utf-8?B?QWJuQkQ1QTFhV1pCMnFua3lCYnF3MG4wZ1FMZUxUOHpIbTBCSVNBZDBaais3?=
 =?utf-8?B?YVkyeStlQjdxMUoyY2NzbWU4b1JMQ3BxREdmMEkwKytkcUkyWThab0ZUWC9H?=
 =?utf-8?B?VXdaR2pYc2p5Yms1Y2huQ2RYSmNzVTF1VFlKcnZXZ3QyTkl6RHVpSjB0NURz?=
 =?utf-8?B?eXJvcmdtREhlRG9CVTNOaVZNcCs5dlptYUpwVVFkV2hZcnZPekNQWnlMSUZw?=
 =?utf-8?B?a015L0lUQ2xpNUdlZ0hncTV5NWNGeHZpZ2FJa1VFbllMNitZMkhSVmQ3Zncv?=
 =?utf-8?B?UERCODB3bU54SDFGc1VoWGpObFV5Y1Q4c0pHWFpoRFMvTm8xNU1xNDdyVkow?=
 =?utf-8?B?SG1SZ01YcW9henhyZDE5c3p2U0JnbkY5RXYrR1lPSytiTXQ5MTdqRVN6Q3hh?=
 =?utf-8?B?ZTJPTVVTL3hJTmVmLzJrdUc4VkhKQ1hXUExlSVdhNFBMdFI1MjdsenFQT1M3?=
 =?utf-8?B?clBxSS9PKzAzRXE0OU1OR0ZSS2NXcHpJWStTMmhGcGIxOWl6WGFESWJUNjNz?=
 =?utf-8?B?T0NMZENiRE5MVVluQkhRTXJMQnN5aGE3aEF4MEttU2NjYmZ3aU8yRVdNd0ND?=
 =?utf-8?B?ODBnNHBrSlBoV3ZHQXFuUmNLdmZWQ1VrSTR6dlpuZGRaMC9sM00rMUR5TjZh?=
 =?utf-8?B?cnBSNUY0K3BpL3N1c0h2elFkN2VVM1UyTW1NWWpLUVorbjFEYjNuVmg5YnM1?=
 =?utf-8?B?cDZjVGhoNTlPMkZzM3A5emNYazVPcWtNUmtiVjVrMk5tc2JJY1FOQjVHcmNx?=
 =?utf-8?B?SlhkazBtMjhjdkxtWjJEVmI0YkNWQ2lGWUY3L2JiOUliRVMzNTRrSDd5L1BK?=
 =?utf-8?B?a1gyaDRCbkFZWENJODUyMjJHM2JVaU9rTSt4bkhUZUFzOGZyQjZKM2xtMUhz?=
 =?utf-8?B?NFFjS2hmdEdRSFVhZ1hHNHQwem8zbHRCZFM4Yi9NdnpvM21idWJvY1krSGxr?=
 =?utf-8?B?RStIMzYxN3E5bHdmY0E1VUhIcW5LMVh0M0ZJQjc2WlU3eXQvVjRJUy9oeGlQ?=
 =?utf-8?B?K0k2ZXdnd2hZczRlT2lscFVWeEpHcmVxT3RrSWI1b2hlRnhLOEtMN3hJTStF?=
 =?utf-8?B?L0F1Z3dadzFVOGZjZStOR3U4b295Ui8yQVVtSlBhS1Nla3pvd09raE1LVjF0?=
 =?utf-8?B?ZkYvNkpLbjNleE5WUjdPdlZOQ3dnQUg1UmRnNUFOUmFHL0FZbCtodlNZY1hL?=
 =?utf-8?B?dWNEaTNUZ3ZOaDNqUGhTRmt0bk1jSU5DT0t6dzk1a2VHdHRseGxmemlxbXY3?=
 =?utf-8?B?eEg3anNXRDgwcUM1WHI5QnNSQ0Vsd29vUytmM0pQWm1LOEtiejB6dkEwYnNI?=
 =?utf-8?B?TmdEdkRBR2VVTERqcDNGRVN3Uzgrd09Id3FFMnJjdTUyUUtVdjVvYUR4ZEF0?=
 =?utf-8?B?R2YwaXIxdmRRbFViUW00aC80YnMxdGJJcDVuVVdlKzNiMkR3czgyUzZTRkhF?=
 =?utf-8?B?c0cyeXlHNUpJaHp1UFo3OUUyd09LSkJWMjF2Wm1seEZhMXFkZ0d5RkZFeGhX?=
 =?utf-8?B?Qm94M2t6czU0TVUwSGpTV3ZpN21zaVpwRDExa1dpdEFmdmRVdjUwNWFVNG82?=
 =?utf-8?B?bVdnUkNZUS9nMGdGeitTd0psdjJDZUx5MVRyUG5PdisxcE5YMytWTFZHbEE5?=
 =?utf-8?B?bk42TVFXa0cvZFNvdVBRaFh5UGh0dEduS2tuTDRZTkw4WU1oTUhjcUtXcU5o?=
 =?utf-8?B?Q04wRU1JWjZ4R3JkUjUzNkNna3pwTVArKy9DMy9qQ1FaZVdtWWtyWnNBbURI?=
 =?utf-8?Q?Vs3fK/kwoKrTkVHucaPLaTOZN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b967afbb-0f37-4e3f-3540-08dd8c1287e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 20:22:17.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2ykeM7IeGeh8sdqLFZi1CesrQgHPBrGJv1265vUF33vVUm+8zUtLNJNY7BVNZ7VAyoQv1WqKUE0iwDIaZDjfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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

On 4/27/2025 4:50 AM, Wayne Lin wrote:
> [Why]
> Notice AUX request format of I2C-over-AUX with
> Write_Status_Update_Request flag set is incorrect. It should
> be address only request without length and data like:
> "SYNC->COM3:0 (= 0110)|0000-> 0000|0000->
> 0|7-bit I2C address (the same as the last)-> STOP->".
> 
> [How]
> Refer to DP v2.1 Table 2-178, correct the
> Write_Status_Update_Request to be address only request.
> 
> Note that we might receive 0 returned by aux->transfer() when
> receive reply I2C_ACK|AUX_ACK of Write_Status_Update_Request
> transaction. Which indicating all data bytes get written.
> We should avoid to return 0 bytes get transferred under this
> case.
> 
> Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 45 +++++++++++++++++++++----
>   1 file changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a..0c8cba7ed875 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1857,6 +1857,12 @@ static u32 drm_dp_i2c_functionality(struct i2c_adapter *adapter)
>   	       I2C_FUNC_10BIT_ADDR;
>   }
>   
> +static inline bool
> +drm_dp_i2c_msg_is_write_status_update(struct drm_dp_aux_msg *msg)
> +{
> +	return ((msg->request & ~DP_AUX_I2C_MOT) == DP_AUX_I2C_WRITE_STATUS_UPDATE);
> +}
> +
>   static void drm_dp_i2c_msg_write_status_update(struct drm_dp_aux_msg *msg)
>   {
>   	/*
> @@ -1965,6 +1971,7 @@ MODULE_PARM_DESC(dp_aux_i2c_speed_khz,
>   static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   {
>   	unsigned int retry, defer_i2c;
> +	struct drm_dp_aux_msg orig_msg = *msg;
>   	int ret;
>   	/*
>   	 * DP1.2 sections 2.7.7.1.5.6.1 and 2.7.7.1.6.6.1: A DP Source device
> @@ -1976,6 +1983,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   	int max_retries = max(7, drm_dp_i2c_retry_count(msg, dp_aux_i2c_speed_khz));
>   
>   	for (retry = 0, defer_i2c = 0; retry < (max_retries + defer_i2c); retry++) {
> +		if (drm_dp_i2c_msg_is_write_status_update(msg)) {
> +			/* Address only transaction */
> +			msg->buffer = NULL;
> +			msg->size = 0;
> +		}
> +
>   		ret = aux->transfer(aux, msg);
>   		if (ret < 0) {
>   			if (ret == -EBUSY)
> @@ -1993,7 +2006,7 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   			else
>   				drm_dbg_kms(aux->drm_dev, "%s: transaction failed: %d\n",
>   					    aux->name, ret);
> -			return ret;
> +			goto out;
>   		}
>   
>   
> @@ -2008,7 +2021,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   		case DP_AUX_NATIVE_REPLY_NACK:
>   			drm_dbg_kms(aux->drm_dev, "%s: native nack (result=%d, size=%zu)\n",
>   				    aux->name, ret, msg->size);
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   
>   		case DP_AUX_NATIVE_REPLY_DEFER:
>   			drm_dbg_kms(aux->drm_dev, "%s: native defer\n", aux->name);
> @@ -2027,24 +2041,35 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   		default:
>   			drm_err(aux->drm_dev, "%s: invalid native reply %#04x\n",
>   				aux->name, msg->reply);
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   		}
>   
>   		switch (msg->reply & DP_AUX_I2C_REPLY_MASK) {
>   		case DP_AUX_I2C_REPLY_ACK:
> +			/*
> +			 * When I2C write firstly get defer and get ack after
> +			 * retries by wirte_status_update, we have to return
> +			 * all data bytes get transferred instead of 0.
> +			 */
> +			if (drm_dp_i2c_msg_is_write_status_update(msg) && ret == 0)
> +				ret = orig_msg.size;
> +
>   			/*
>   			 * Both native ACK and I2C ACK replies received. We
>   			 * can assume the transfer was successful.
>   			 */
>   			if (ret != msg->size)
>   				drm_dp_i2c_msg_write_status_update(msg);
> -			return ret;
> +
> +			goto out;
>   
>   		case DP_AUX_I2C_REPLY_NACK:
>   			drm_dbg_kms(aux->drm_dev, "%s: I2C nack (result=%d, size=%zu)\n",
>   				    aux->name, ret, msg->size);
>   			aux->i2c_nack_count++;
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   
>   		case DP_AUX_I2C_REPLY_DEFER:
>   			drm_dbg_kms(aux->drm_dev, "%s: I2C defer\n", aux->name);
> @@ -2063,12 +2088,18 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>   		default:
>   			drm_err(aux->drm_dev, "%s: invalid I2C reply %#04x\n",
>   				aux->name, msg->reply);
> -			return -EREMOTEIO;
> +			ret = -EREMOTEIO;
> +			goto out;
>   		}
>   	}
>   
>   	drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up\n", aux->name);
> -	return -EREMOTEIO;
> +	ret = -EREMOTEIO;
> +out:
> +	/* In case we change original msg by Write_Status_Update*/

As there are multiple cases that jump to the "out" label, would it be 
clearer to use:

if (drm_dp_i2c_msg_is_write_status_update(msg)) {
   	msg->buffer = orig_msg.buffer;
   	msg->size = orig_msg.size;
}

return ret;

> +	msg->buffer = orig_msg.buffer;
> +	msg->size = orig_msg.size;
> +	return ret;
>   }
>   
>   static void drm_dp_i2c_msg_set_request(struct drm_dp_aux_msg *msg,

