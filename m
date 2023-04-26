Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BA6EF959
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 19:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCC710E8B2;
	Wed, 26 Apr 2023 17:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345710E8A8;
 Wed, 26 Apr 2023 17:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTRV6mZ6hTL/Ww2nch3C0Xnx6nFSMCkMj2S8zj5pOtY7lnqIkWwTfitAZ+VUOra8KPpMQGj/NCqzfMPv5y6FC1vmAoF5dwhe8oalcKZ7DB1AFpSRLDmPeoxf1x5oI4G0/uhR8jP+75oYf+vEkJ3+CPq1x8DcQ6UmMFsYmVui1mGMQK9d8Fuh70Nce3ErapAUSkFmMOGT4AQ/gM3Mjc10q9XtNvJ+US/Na9I3tOKe0SK2T8e/wxvokPvLCuSTkLQhDd5GvDwZ9Up3R1RxclCshXJkFKpsuUzo0Hz/7JXwDNSXa6hp5ISsTMaKlLQe1xjdRgAQKLYRR+tU7Y2gcYv77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRcA6KQFeRb3isEh+ZXnkTbPfm3mzvIcwZae34g/RLE=;
 b=oDnkyYXyqGTDQX05QvJ88oLPndavyr6DUyzIB9ui+gu4tBUIXQoOKMZc+rnld0s/FJ6XoPpJfGC1f3uH+oE05Fhv0Z5TS0MAsCZFXsAS5lnkP+ys1GnPqXztHYkAJFzWcRF58NnmIKV7RFPpyC0yBegkEB77qVw24lWktzeltj2nTRLae8aF3uW7GD5qf/JZTKRxrh78/4w+IKwfYmp5dqrJ46MZq8muR/mVCis3GdOuxU6tT7k2S3Uxjc0t8dh2HYoxL995S07IAAD1rUFdZDrroebFzBFwFkB8anJMNvptIuBg5Q8+sBTU9BEzP6Hu/f+OJ7KhQq/verEDB/WSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRcA6KQFeRb3isEh+ZXnkTbPfm3mzvIcwZae34g/RLE=;
 b=MwfL25LRTH/XcsCLuH8DjvEBXOLUq2ew9wvpLAVNkgEDg8c9wwmWURkDP0ZzAPWq41E7xxch/ievslLWLzyKV0cX/T8N0KDpXqDXAmTrhIwWXyZf67AI/RLhqm3XWY1tFmlC8pBXwUZEzZRyK8ohMfIfa3QIWl/gQrbDtdo3K5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21; Wed, 26 Apr 2023 17:27:29 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 17:27:29 +0000
Message-ID: <20b45faa-bc4f-3e90-f61a-f6d7407df6c0@amd.com>
Date: Wed, 26 Apr 2023 13:28:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: Correctly initialize some memory in
 get_available_dsc_slices()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <f7953bb41b7d5e28ec6bc3abfa06c8aaa0193ca4.1682409190.git.christophe.jaillet@wanadoo.fr>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <f7953bb41b7d5e28ec6bc3abfa06c8aaa0193ca4.1682409190.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c520c29-5029-4299-6e94-08db467b82b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8RZG3biDl2ytXVkKii3rPq+5WyCnNqgS9wwCaRaRvWl8FIh/v8eXOjXK2rx3OwUvZ7TXBFcgS8CDai4n23mdl0bt5qqNBwpjUxnwbuw69n0oSfLGKsbb4M/S+TRvirrHOe5+SGArClzWLriUZgzgknvvyzjYfjoreB2wECHEvm4syJ6IWzzWlQevIjMWfbnUyPpxdT/Qufh2ZCD/eP3qUYNSk5Hn+wI/d6zewTvmTXYGpRNNMZF/2IqIHpWH5ah37B1oEXh+YDrl/sIlrrK2GY63r3vyndzK6wX4NkYPHJ/gyJ53/3mn5Rfd9FfEX9lIlJ820hpiII5CeZ/XPM2mJazeTExAAOhgnP8skQY45z/n8QbB71gzzrlztWpkZy52O9y1g5IexCDvQSxx2K6owYQJno4Y4H8g3dlmQnYfLbgCD1e7+yYLiAID0cvAN819PxF988CYHo+L2bADS6MGObrKuS1sT9teBBTnU5zAk+uHbH9EgP/fcLKIISbFvyuxhhwRfz4g5lk+/6wSlC4HopJ3nRWgwfrw25jdjxmx3NrpdaCttdvif8FeRQUrtdayiYFdGWmN1l8kg1LOrtHaESZluCmiNGq4b0w8+uY80CAGqwkFLDtb1UGb2JkYyNpOrZszKr6Rv6Q4zNAy+T2rhx0iWf+WkD5UWuu31tMcOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199021)(5660300002)(38100700002)(66946007)(8676002)(8936002)(31696002)(66476007)(66556008)(86362001)(921005)(41300700001)(4326008)(316002)(44832011)(2906002)(6506007)(26005)(186003)(6512007)(53546011)(6486002)(36756003)(6666004)(83380400001)(2616005)(31686004)(478600001)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWFCQ2s1eVpjeFVMMnBub0Q4NVV3cjc0TUZ1UWFObXRIdHZ5dmhTeDFTUFNJ?=
 =?utf-8?B?U1ordnlKNnAvMk9pbnlTcUViSm1zWU9DZzZvVnFFdGwvOEZZVVllaGJiRE41?=
 =?utf-8?B?OGF0TnJGKzcvN1d3VHJUbndqbnZyazA3N3VyeHNRNTNML0FLSzdOSDh2WWdJ?=
 =?utf-8?B?MkYyWlU4UlFsYVRMdDlPQldsSHlQOGFOMUp1emJZWDZTN015a3J4RGFSYXZ5?=
 =?utf-8?B?aHdTWGJuYllDTS9iaWo0c0VXOHF3OWNZWXFOVDJzVXJOSXN2bjgvb09aYnRU?=
 =?utf-8?B?cEZEZnMxWEU4bGxwMEFlS1ZVWmMyVjE2Y0pBeGMwMEtISXJYaklvUU9NaHRy?=
 =?utf-8?B?SFNFeldzUG96bDdwdzlRTmpEOFQ2Tk1iUXlNQUxqSGlrUDFrNEhtaEJMWnpx?=
 =?utf-8?B?ZFV3NmtZZGNFMjdUMHd0UzI0MjQrTS8rQ2FBRTZIN2cxS05HUnFsSk43ZlIv?=
 =?utf-8?B?S0tERE9NS0pTWHY5VDhaM3FwbjFtcTJNS0RMeU0yOUhZMEVjdFNkTk9IMFJQ?=
 =?utf-8?B?bEw1eVpraXhNNDMwSTAzcTV5S3hWenRzelpnNlZsc1VKWCtrbVdscWxHNy81?=
 =?utf-8?B?L3dDbWpCbi91S0ZGR1E5WmIrQ2dzNXdrSnFzRmI0U2Q2N1BBWUo0YU4xaXRm?=
 =?utf-8?B?MlBYLzBTa3Y3ZXFrYkpMelp6em95NFhuNFpYYzhuSE5YdU94LzVsWUJPSUJG?=
 =?utf-8?B?a3JCcTBpT2dYTXRXT1hrMTI0cjhWZitKcTJKdEd4cTI5azZPcEtBZnBXV0tq?=
 =?utf-8?B?M2tRYi8yVFUrYjFpdTFqVndCbzFkYUNDRFR3YzE4bzIrb1dNa2VxdFVYYzgy?=
 =?utf-8?B?bm5hbys5K1gyd2ZoejNKM1E1aDZGZTBNaUZmTDNVOVB0M2VteFl3Yk11c01W?=
 =?utf-8?B?NzNwOUdmbmtwakI2ZlNlSFNJb1BPalNPUmkyTkVMOXFLNDFQN3A1RCtwc3BZ?=
 =?utf-8?B?blV5UDlNeXBVZ3VyR0RjSDdJQjM3VVREZlZwUitUM0R3aVh6MFY2amZhZmxM?=
 =?utf-8?B?WXN4SWxXRFFYZmhVZGliU0MrWDNVajF6YmFudW9DUjR4akFPY0hZZVQ5ZnJz?=
 =?utf-8?B?M3dVVi8vaVJGMzRFNTFvckZPK2tESVQraVYzTTJVNVN6ejFmcy96emVLMlUv?=
 =?utf-8?B?UGpwYVM3bjdXdkJKOTFyNk9YVFdoenIxMWhoOGlBVzVDRlRiT2hjcEtPVUMx?=
 =?utf-8?B?VXJpVnRwMDNLd1p6eGM0ZEIwTE9UcWR0WHpPYmhzTWQ2SitITUpIRm8zOGo4?=
 =?utf-8?B?ckNuVmVZVEtoWnBqRFVENEZjQXdvYTVtOFR2VHh5TTRYTTF4NVl4TktkMjAz?=
 =?utf-8?B?ZW1BeDRkczhFRlFvSDRCT3BhVm02VXcvQUg0a2Fvd2VQTjRURFo4c0JLMGk1?=
 =?utf-8?B?N1BlQjVkdmt5VHkxbWRqTzljMFZBbm1KZWNsSTUwQlNvc04wV0JMUjhLNHhz?=
 =?utf-8?B?akdqVGUxS24yaVZOMGdjOTVYWWJHd0pHRFFXSjc2MjRyNEh2TlNNYTB5Zlpt?=
 =?utf-8?B?QmU3YjExY1Y5c3IyclVRL1VTU0hxUGU0dkliQi83UkhtV2VTUFFKY09zMDVh?=
 =?utf-8?B?ZHRkRkYxdVNvMDRzMjBvMGQ1bUdLZ29na1FZQXJhalF3N2daRXJmcUZreGh3?=
 =?utf-8?B?cDAxN3MwdXVGbi9TQWVIaEJWeHRBSXgxUWsvYk1VY0hGbkc2Z0RRbEorMmg4?=
 =?utf-8?B?alpZa0JhKzJiK1EyQkY1Q3lXL25jK2RPWGN6SGJWUnYvQmp5RFpYUzNhYWMw?=
 =?utf-8?B?WVd0K3NLN0drSDVRR1IxM044TVhCbGsyQU1yZVkxYWcxNUVNbGlNYmNmM3BN?=
 =?utf-8?B?RC95QmlmdmU2Mk4vdHNnZ3l2NVhuRzNOaUU1Y3psOU9hVW15TFh0Z2ROWU4v?=
 =?utf-8?B?eERmcS8wRVZpcWFrRi91dUsvUDduNndDTXBVU1YvRG95RUxBTU9XVUJ3aTlM?=
 =?utf-8?B?NWhKODFnQzNueE5sMldQV2wzaHNSRCtmRzlJVGZLY1BGWkwwdlVydHdQcU45?=
 =?utf-8?B?N0VrdjRSMFRvOUN3NUh2cWRCdG1EaGZPVGNVNjNVQUxyRldhYnRzQ2FWZll0?=
 =?utf-8?B?R2Z5VzRNazAzZHk1SzIxc0pMRTNqWHl0aHBDRWQrNXRiVmt2VHltYWRpVyt2?=
 =?utf-8?Q?6k9MNlGoQRDNBsr8kdWLFqpZd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c520c29-5029-4299-6e94-08db467b82b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 17:27:29.2687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5WYKHZjipbYKfBcvQd6lLfvNXM+lxGtCF43qDr4x8yOoe69xo/1YKnzCHelZ2uRM2ady70JPMGveTytplzwdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746
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
Cc: amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/25/23 03:53, Christophe JAILLET wrote:
> The intent here is to clear the 'available_slices' buffer before setting
> some values in it.
> 
> This is an array of int, so in order to fully initialize it, we must clear
> MIN_AVAILABLE_SLICES_SIZE * sizeof(int) bytes.
> 
> Compute the right length of the buffer when calling memset().
> 
> Fixes: 97bda0322b8a ("drm/amd/display: Add DSC support for Navi (v2)")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> NOT even compile-tested.
> 
> make -j7  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.o
> 
> on my setup, it fails with:
>    CC      drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.o
> drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c:27:10: fatal error: dc_hw_types.h: Aucun fichier ou dossier de ce type
>     27 | #include "dc_hw_types.h"
>        |          ^~~~~~~~~~~~~~~
> 
> I've not investigated why.
> ---
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index b9a05bb025db..1d7384b2be28 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -645,7 +645,7 @@ static int get_available_dsc_slices(union dsc_enc_slice_caps slice_caps, int *av
>   {
>   	int idx = 0;
>   
> -	memset(available_slices, -1, MIN_AVAILABLE_SLICES_SIZE);
> +	memset(available_slices, -1, MIN_AVAILABLE_SLICES_SIZE * sizeof(*available_slices));

Actually, I believe we can drop this memset(). Since,
get_available_dsc_slices() returns the number of indices set, and all of
the users of get_available_dsc_slices() don't cross that bound.

>   
>   	if (slice_caps.bits.NUM_SLICES_1)
>   		available_slices[idx++] = 1;
-- 
Hamza

