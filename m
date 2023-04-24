Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F106ED5F9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 22:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651E710E5F2;
	Mon, 24 Apr 2023 20:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23DD10E1ED;
 Mon, 24 Apr 2023 20:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAJHdIflK84B6J5bH8eTyhJwBY+Oe+IGVpvN7JlG9L0ECTeB6q2Z1a4mU2hWbBw3f1WYQ+EJcdhqxAhNUX8RczrqZZOtIsICB/boeOepyPPh6iIyu4d6fFwW+XAa47GbKYToD/L0FeA1grMhbUU8u/q5UL1BZeh+66fTQB2rlhuk88vYZltNbymy2L/jDo8ncso5qkU5zCcHd8a6Agm9tURGkXSyRwCj22ZcBS1Fk/d161bx43od9G7+90dxBD6KadSGmsxnzJE/2sKZuzzqSoGuovMq9YtlSUTRksLhpQHWLdV6JHcYngVtYf5jgnoCmJ27ttDOibrQ5UybKR0cMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8JMNhUDPRgmbYsnaf7D4ahQKq3z65iGwiNwvB071PU=;
 b=CTbpUQ165p0knL88wN8rruPcZ4lRRHhtR27Y5RSgWSVLityHV+k81z/HJG7nIdHm5z4zYFwPshA+DrfGgelox7t+7sTZEQDClwxhVH2YQCKfoUL8tm8qbT8PgCAo9Sy6As6blQG0etz23HPQH7/5AMhWJXcFvyZbJFnT48Z/YLwEyHj9HGoz5sg4fMdytfYdcKFtYBMTRhFjWy7DacZB7yNVY93EgNz9gs+mdwN3i2+PHV49gfjsVIWbUSoWhxmlPCDrkjVHjAEkYsWqtV+ua+54ppS9lVeqq80ELRczQIcL9R/E6GtA4SpbaNjQfXhTtTodJ7BXvZn2sF4uQzGaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8JMNhUDPRgmbYsnaf7D4ahQKq3z65iGwiNwvB071PU=;
 b=LdB3vQHmVaXe58kjPvjt0IbfC9VhuRdTICSJmqRcZ4wsVlN3BzsCf4/vMCcuFKiOXbBb+5/FtXv6yUo24uu8Gx8AthfJlL22gFU3oAH6qt2yiCFJv4lH6eC86ThwUB9Fwv1ukCms3RsUbGcHWWwQmUhl2b+tjv5fiWeA9Z30mC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 20:12:15 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 20:12:14 +0000
Message-ID: <6b686a90-d4b5-5f02-92f2-270637736680@amd.com>
Date: Mon, 24 Apr 2023 16:13:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: Fix a test dml32_rq_dlg_get_rq_reg()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <3ba86bbe8cca149774835659885ddf39034a4306.1681767659.git.christophe.jaillet@wanadoo.fr>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <3ba86bbe8cca149774835659885ddf39034a4306.1681767659.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0305.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::13) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW4PR12MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 000194a7-4bcd-465e-0d31-08db450031df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wovGoGeZR7NhTPdSfweayQY9imd8d54IAMc79PicB29RRqbykTgBbNs3L9AsrbZvu4d0lQxH5QsG2MYFy1oKUS/C6fCetOV+CUhfUvamDB33Ql1dhbXKZOtmv8xkNIlEI7tGT/2qJZg8d8SVEan3kGkIlqghJJVtr8GIvvvH3llgUOFCl5pQ0VTcfb/nPl76R/9I9tHEPATeR7fwrqIyggZocUiexi38pNkmSAAJzbYLb7F+jECh8WaNYY8fNMegA14ITyD2yVYVkOGBvey70xlEC+5Ygz2NTosE4GjjWbVqjoqX7My+U3W41eknJ9XlZYrqPX4dsNx5tR/f8M4j31GY0L+q2M1yKxtagVD1y0JY+YEKhIwacOivjKUjeY8nWyR0kDRA550HO11e6kRu8QQK0S+1qo+sZiG66DoZ11Cszo/ze6l2PiMxnVRfHOB/wnMCPjn0zgUCGITEQDFWVrvutIvUjHPA1tXhHKzk0Wk09dVXsDW8a+70lRfNd3LfDXi3is3M8xQX1Z4bIh0eqepfuofQdjTOQMLf9n4s36CoYdcrm5+bEzFzhGoK2cCY922yNZdrTMM62uzVKsa5L5KQ09ftbU4q3kqqjIMTpm+RLeA7e/cXypNtnAGKzUONyu4eZRtHFwWrVRMjrLlv5BWIQhNQcrAtcTLNdKg6sYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(31686004)(2906002)(6486002)(83380400001)(86362001)(36756003)(31696002)(8676002)(8936002)(66946007)(66556008)(66476007)(478600001)(41300700001)(4326008)(316002)(6666004)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(921005)(38100700002)(44832011)(110136005)(5660300002)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3p6Rmt2Rk9NWDZPUWZwRGtmbXEwOXUwUjd1NWM5YTM4VG1Hd0RWQTVWaEsw?=
 =?utf-8?B?dHhyZXp6UVI5R0JsUnNhK2xlUzlnZXpZZDZ3eURVdk0vc1NmUTZrZWdnTDFV?=
 =?utf-8?B?eE0rQkhVdWxkT3ZQMjFOUlhNeEhld1NMbVF5WnVzWWd2Z09rTEd2dnJNaFpz?=
 =?utf-8?B?YmdiNFhOem5XU3BRT3U3ZEZUVjdUa1hDcG9vRmUwRUZYV2JoTjFrMGxYNmlC?=
 =?utf-8?B?d0FyaEFUUmdtVVgwbTR3dWZXd3lHQUtLYWF2TXlEVkRQMnNpVHFuZFB1SUE1?=
 =?utf-8?B?WjVmOURWSTNGS0ZnQlFkak1zRFZsV1VXOStvczNWdmlHK01CS1ZmTkwyRDRx?=
 =?utf-8?B?OVlXNnhrcWN0ODMxbVF1UnlNVFFybnFwWitLSGFFQUs2b1cxZmFreWlKRk5v?=
 =?utf-8?B?b1dzc2pjS3VnZ1RMbUtNcXREWWFqWVpoNDVJMU9oT0N2dytTTXdXbkNDbWhs?=
 =?utf-8?B?ejV2MjR1M1d0R3B6U3hGdk5HaHZ6S1poVFZoeE91SWxMZ3MyY0RPZmdaY0FT?=
 =?utf-8?B?T1FEenp6Y0FUTlNrYnJtK3NiZTN1QXVqZm5vZG80WDdtZnFLZDNaTURBakth?=
 =?utf-8?B?WkY1S1B1eGNlcWVwRkFoOHVtZmw4OXBQTGljMkJYaU1CYnBMWURPZUluMHFq?=
 =?utf-8?B?RmpTS3N1eGE1YXh4b0tmV1JZdGoyK1RhSVhOQzJhVk1SazVjdXJqc0lWOWRm?=
 =?utf-8?B?eFc2aldEbFFwSEtMWWR0eWlSWHlVU3pWMFJTYU9FUG5ZNEF0UjN3cHFqa1J0?=
 =?utf-8?B?aURyMk5zQWFzWWlKK0pNN211LytnL1g2TUdTbDZjcmlUYklkNW1nbzNHbmxL?=
 =?utf-8?B?VmRvdENxd1hadzk5dFZDUHg0UXpPSkN4TFdwRXY5QklWVzZpM1pGT3ErbXhY?=
 =?utf-8?B?WHFveEpDRzNEVW9uMjRGcVRvZDIxVDdDeUIrbE5wLzVNVjJoRVVPNng3a1lX?=
 =?utf-8?B?RXEyOVplam9FMDFXNlNoQ3FIUnVkaVdlWlYvaTZDZ1djdWF3NUxPaTZudDV5?=
 =?utf-8?B?WWJ0RnhVWlFKTHJ0Rzg0Y1lVcUV0Q2I1Vm1UMnBvM21iaDVYWTN1Yi90ckR6?=
 =?utf-8?B?eEFJTmt3MWd3aWUwcng1M1VtZGl0MVZQaW9nSFgrdjJySnFwUWo1WVpyMmJw?=
 =?utf-8?B?UktHSlphRHdhVWJGcktXR0N6U0N6WUllZDZ3YVVKZERLYVg0YnQxYUxwRTQr?=
 =?utf-8?B?UDRORzRxS0c0Sng3Vk1KbVRqVFR3K3Y2RFQzckRvSmV0WldBSlBoN3pFeWsx?=
 =?utf-8?B?Y0dpdmFNNnZBMGFiL1NPZzQxRWhpRXVkRk1qZjVjYmtDYjVMSHV1dmhUTGxi?=
 =?utf-8?B?MWVMM1pDeDYxVXBBMlZiUllick1lSlpOdXF4WEVLV25Kb2ZiQ1MrVG1FcUdH?=
 =?utf-8?B?eWJ1bWVSWlpqK0xQL3pQV25vTVZoVlBMb3VhbkJ6QXBZTUtYbjVRcnBtclZL?=
 =?utf-8?B?Y1BVM0lqYXk3aUhHeTA0bkNYRDlXZnM4KzkyZkc4NXR4QmNpcEhNUTFBM21z?=
 =?utf-8?B?N2RwTXg1aE85ejd0eU52U2lPWFEzQm80SEcxeGlKSmdwSVVESEJSaEtoVFcx?=
 =?utf-8?B?WThkTHY3aDdpY3hiaGRuakxTR2d5L3JkVVREQm1sd1F1c0ErZ09qdWtGei9Z?=
 =?utf-8?B?NkFUM0VsNjhwSGJiQ040SUJqcW5KZDR4ektZRytpTnIxaEJMRU53TmRjWVpQ?=
 =?utf-8?B?Wm1EZHpsdjdnaCsvVUNHTXlyYWV1bEVqcC80aHJpNUxMUEdsSFlad1lPNExQ?=
 =?utf-8?B?MVhaZTFmeEJYSGpmSGNHZlEycFh5eWp3RkYyUitSeEoybk43WXJDRmJTR3Fj?=
 =?utf-8?B?U2ZZUWFrNzRsNGZOTUxnaWlpNE5OQk9vckpxTmYwbG5vTWhXa29hOEp1YzNv?=
 =?utf-8?B?N2lvdXh1bEltbG5ySzE3SndRSlgxcndHcWRDUCt2YXdUZ0oxVVNLTjFIQjFN?=
 =?utf-8?B?ZnlmNmJLQVhXVWtiMU5PNDZzQWpQdHRJaTJ4WkprMnl4UXh2OHljY2s2QmtW?=
 =?utf-8?B?bzF5dlpteHhwakFCWExxRTFnNFVaS3RTUXVCT2htK09xKzZqcjU4SjFhOExZ?=
 =?utf-8?B?eFU0OXZ6NWpoaDcyL1lDdU4xMzR3NHVyNUpBNjAzZC9zVEtyazZDMHVJaEti?=
 =?utf-8?Q?YwlKp47+PEumprJ0/b4l+Sh5s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000194a7-4bcd-465e-0d31-08db450031df
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:12:14.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 746D6BtPNnVctWtISD+UgHM7MHS3Xe0tisawu6joWbs/r19+jmH4nswTWm3uCRhg4impjVeyknRk49hHGTY6gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8610
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

On 4/17/23 17:41, Christophe JAILLET wrote:
> It is likely p1_min_meta_chunk_bytes was expected here, instead of
> min_meta_chunk_bytes.
> 
> Test the correct variable.
> 
> Fixes: dda4fb85e433 ("drm/amd/display: DML changes for DCN32/321")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!

> ---
>   .../gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
> index 395ae8761980..9ba6cb67655f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
> @@ -116,7 +116,7 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
>   	else
>   		rq_regs->rq_regs_l.min_meta_chunk_size = dml_log2(min_meta_chunk_bytes) - 6 + 1;
>   
> -	if (min_meta_chunk_bytes == 0)
> +	if (p1_min_meta_chunk_bytes == 0)
>   		rq_regs->rq_regs_c.min_meta_chunk_size = 0;
>   	else
>   		rq_regs->rq_regs_c.min_meta_chunk_size = dml_log2(p1_min_meta_chunk_bytes) - 6 + 1;
-- 
Hamza

