Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31986ED5F3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 22:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB7C10E5EC;
	Mon, 24 Apr 2023 20:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D3110E5EC;
 Mon, 24 Apr 2023 20:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZxvey+DniFi/umthgxsJ/nMixe4eUeBpO+hVmicjK7brIhvxhxNJ5VdYChvRQmBtv5qgeDVfEv/1/zeu98sjHy9Hff5nM4nhOrs70N0XGcPz5jIqBNrzDDBEtQVhtb3me6qmVP3XyUGOT2bpZ0Fs3M511GIAA9buZMFwABVe49tVUlJkocsAxoQOeUOiVchGRrAZlxSILqKloppkSAVnxD+mwILngXbKnpckySB+by0iR/rH4aVeLaBAi+ROZ1ujnvrHrRd3s1Ge9uSwur0dRDTmhxX8HzKII1/BXwQgK8mll2I1UC9EcjESVrMornrkbB9G1qKGlerqVpvKZa3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTnNjZotmfTeQJm0GQGhiSOKfGexRbq+IeT/1Y0H2Gs=;
 b=QQbBBCJWnCbNnujWgZtSKxR7WCi+zxvhIUR0x9dnUBawul+zc+S8WV/CCNCR2FU0dAuw9C2JyXKZliOhmzH8JB/GMPlOHja6H7sH4+R/sPXcVbDWC/M5RPe0Dy5FjuWI7BXae4aFjBjjTr3vjUD8eUCqV2sj4Rnl1FZpWS02melBeVwPnfVVa5eN6D/NL9Y3Kp8Gno5rAtDxOegYbFudHfXrJzQ8v+Z8NJ04p44FokUmP5B6p8EUnv2JthtYNiYPWWlXjER9xnfBhWYE42ZcrbkQXxoANt3w/xxwOOkPyH9j6X6zHOcj4i2vALz7uuQjE0EICJADoqN6OTiXiK3GcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTnNjZotmfTeQJm0GQGhiSOKfGexRbq+IeT/1Y0H2Gs=;
 b=1NFnJK+Fy/GIjYnSN/cn9JtZTx5QZyoY1RoUR813GHQfBhiAMsJReNjOeLNRCPEavCwWgRoNqPg8DSvmdMXzS1+KS4zbLivsVXQ155xwobZztDMQsYrjMFvhmsFsmwjr23o5W94Jrf7Ha6enQnTHQSD9fYpB9djgFYe+H+zz9/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 20:11:47 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 20:11:47 +0000
Message-ID: <0a9c2b8c-1c90-da11-1852-ff29550a7950@amd.com>
Date: Mon, 24 Apr 2023 16:13:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: Fix a test CalculatePrefetchSchedule()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Pavle Kotarac <Pavle.Kotarac@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Aric Cyr <aric.cyr@amd.com>
References: <13ab79d7a6c7ec6292c803ce1e52c8ac12af320f.1681767298.git.christophe.jaillet@wanadoo.fr>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <13ab79d7a6c7ec6292c803ce1e52c8ac12af320f.1681767298.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0308.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::19) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e9a946-d85f-406b-bc4b-08db450021c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/R9B2XE2D00+veocipxqzFFAvgo1We7dxji2XmHmpHwJOzOszeXfhjSSGJ0ByP+sqUFuUmbRrgW22YN+Hhe/Pap9gcteZiKkgyHXZMcfOB/pPaf6h/ovXBmaal9BkK8wOWWQPKKdwbB0SrZt+QaaB25FG0RBIYE8sSw5dryplhSDWmSBljnS/PXlHsA280ih4usLDosip2dgxARDb8E3A65ENIp0MbA3u2ixjqRYZqSwJUVC2ad7WSh5zcdE9agE+BkBVYEGsUH7ZGVUOsTyvDHLOqutVaRtpmq1gVFHXmR0L07KlCBuaAu8gIHfzmom5pU0sxQRYrrg1U/AfXbW2iK0RqSMT/gB7W5zbfVLgjWMnKX9dT2o0da5ETSIGMvc1xQhJHvr1ydXlxwjinZ0JuD8JFpy6R1Ck9gPsM0rCi+ePAnuXJ2f0qgUgynanRwt1zJO3mj5hpyVn7P6YEcbQsNtUjzRuO0oYreEn8jQ6bpQjVqjNti1nkQaBqF/Y1EOegzfsoSVvpw+7H8gdox/xBKAL8fUsDYyNmkQ3KSfiLY/lWz4GWoQ8y5RKc8Wv0ks8PplGMdxxiQPD0YgwEyWksdT8E+AK4LqlGPpwUAGlX1apg705bYzE9VFcCBfgeV6WbW33PVe4KozqDirpf8jlhS+2lqDsGsaTHoro0bUAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(41300700001)(31686004)(2616005)(478600001)(8676002)(8936002)(38100700002)(4326008)(66556008)(66946007)(31696002)(921005)(83380400001)(2906002)(316002)(66476007)(5660300002)(44832011)(86362001)(186003)(53546011)(6506007)(6512007)(110136005)(6636002)(26005)(6666004)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJNa083T2RhOEQxR1dTMVZQeU5XcHBTcld4ZTI1WERYMkh4bDZTTFBOd0JS?=
 =?utf-8?B?bEhSVFpuRjRxRmFaRlp1c1haZ3hZTkxFaUU1R3lPRUIrQmpvM2JrK2Y5ZGl2?=
 =?utf-8?B?aW54akF1d2xYaVoyZWRUNGExRUJiSkhKajJ2VVNlOVZ2bFNyL2ZmeGpScTVK?=
 =?utf-8?B?SzBnZGR3WllDVFFHNFh4UUVmQkRicjNNNTJjWmowRDFRMWxBRFBHbmFlRFJm?=
 =?utf-8?B?b0VvRStudzVNVDFXeTlSeWdCcUdhUUJDdTNvM1B6cHBlb294S3BhNjM2eVRX?=
 =?utf-8?B?a3p3UUlseTlkYU11RmFxNmdrcFdFdE9EbWpYNXZhdGFaVU92eUd3U09QTnVJ?=
 =?utf-8?B?Kzl2Y1RzV0xPMHZ3QXVFU1A3dm5lNit1TzJia3hJS0VHSXR1ZTdseTdpVVZo?=
 =?utf-8?B?QStBelVKV1F2RHJyUGkxLy9UaWRuR3ptdTFhMWVjbnJhM29qZ3RHdk96MlRN?=
 =?utf-8?B?eHIxRzZ3NmxNeTYxQlE4WDlPWXNSOTlzWDB6WEZmem9PTXpuUWdlOGxZcENj?=
 =?utf-8?B?eE1EVWtDcTNzTHQ0S2hDc0pGaE9qSjlwUnIyelFGUkF5Sk5wU2pmdlN4T2Nq?=
 =?utf-8?B?QzBlbmRieExvTXdwK0lCYU8zQUt3cWZkSUxDYllQa0FPRDZJcmNWQXptOXdQ?=
 =?utf-8?B?YkEyTTV4dFV4N25GekEzRzFQZHBLV29sMmlZMWcwM1VCVE5FRE5ONER6TS9p?=
 =?utf-8?B?R1dRbzErbnJOcnU2MTRyR09IbStNZXdRQmZZN0s0Z1BvQlZYTnFQdFdzMDdL?=
 =?utf-8?B?alBpTFNna21raVNVMzZFZnRmZER0NFJUTzVoeCtuS2xpY09RekZKK0lncDlN?=
 =?utf-8?B?aFpFeDVUYnNkVng4MER4UU93S0hsYkk0TmlFUG1VMW8wTGdDTWVNVGIwbmRI?=
 =?utf-8?B?V0FsSlhsSnhlOUc0VHNFQmQzYUVub1JXY3U3WmNOcHEya21BWlM1ZEhLNnVv?=
 =?utf-8?B?OVdZQlhqcVl1TnZqT2hBZkk3d1lBWkZOcXd0bnI4WGg1OGx1M3U0MXlrdVo2?=
 =?utf-8?B?NFVTODhUT0tBQlZWM2twY1hkSkllYUJFMjF5K010VkdmMFJXRnVFR1lRWUps?=
 =?utf-8?B?WmtXaGE3L2YvUHJwbUhnUnJTQkFoVzNQSkI1MEhjS3EybEhBbXE4N1dNTCtk?=
 =?utf-8?B?QkJpbEVMdUpQd0M5bkZwWmFsT3I2YUVwRGgwUVRVWEtHdDRrNjJ1N0JhU1dt?=
 =?utf-8?B?ZFhHMG1ldjdZVzFGNWJMaFFTVnlCdkJUU1hYNVVHNlpPdWZuWXozT1dsTGIz?=
 =?utf-8?B?Mzc1aW5HOStUT3VraVBuekFCSXJ6cnZOZWVYcnQ4Y1hxdThrTklHaVVuaWNZ?=
 =?utf-8?B?bkZkb0hHd1I5N1VIVGhyMFNHNzM1d096bU4wbmtoZGovdEMrQm44K1BDN2VI?=
 =?utf-8?B?a3BXS1lZd2FUODZ1cEtvNGRiMGZRRHhiKzdBckhwNTVvSldkMENCYzNWUmh5?=
 =?utf-8?B?ZHdIZHdFQlNoc21LaFB4OWEyQ0hkZHk4Sks1OXV3THVTQlFsWWN2UmswaXlp?=
 =?utf-8?B?ek5CWjVNQ2hpY2crVTRoekZ1aXZlWlFDNkc1WnZCQkFkWDZNZHFxMTNCNkRq?=
 =?utf-8?B?MXFib1grbFRTb0s2Uy9ESDVFZnphZkkzUFd2T285VlNTWlJLVWZJWXYxUy8r?=
 =?utf-8?B?L1d0UUdUS1dFb2x5c3JCc1IxYyszVmpBcVloaXdUY21zMWxXY2J0OWVBRFZN?=
 =?utf-8?B?QVJKNUdIUW9ad0xmTEE3VW5WdFM0d0haaTZkY010OGg5N2Z2RG9CVWl4eGNP?=
 =?utf-8?B?cDRzV0RpYmVLNzFTTGJjbTh2VXA2R0N1QjJOd09HL08xbkZmZzBwL2NQS1Nk?=
 =?utf-8?B?VEZKa3FOdUQ2Wlhza2t3T1ZVL2tRV3lBalNVQTk4a1hkWVdPeFJWbGxGd1Br?=
 =?utf-8?B?eUh0T0Y5ZXVUckZSKytCMW5QdmpzOEJNTTZ1Nm1sZjZaSjRnMVF4bXVxN2NR?=
 =?utf-8?B?NjVhSVZzTHMwTzBEN2F3RjJ1NERPSE5FS3NCNS95ZWxyaDUwdHROcXdBUUd6?=
 =?utf-8?B?M2cwWlhMTm01eTliZVJ3MjVZaE5UZkcvYms5eko1OEg1T2ptMlB5SlJaOEto?=
 =?utf-8?B?TUdITlBzd3UxQmQ5Y01OK1FOdmVIRStBVzM5SFFrRU5CRHF0Nllpd2VraDZj?=
 =?utf-8?Q?6rmDe4PfSsBm1SODCVI6zUPVk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e9a946-d85f-406b-bc4b-08db450021c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:11:47.4682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPcOlI2R7GARgrxAR040m9KVVtgcKMQIjuoLhzIUzq7kHrUqNXPNqRmNU9BvWMv6sTtmDZUNEIwKtH0bKKsSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
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

On 4/17/23 17:35, Christophe JAILLET wrote:
> It is likely Height was expected here, instead of Width.
> 
> Test the correct variable.
> 
> Fixes: 17529ea2acfa ("drm/amd/display: Optimizations for DML math")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index b7c2844d0cbe..f294f2f8c75b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -810,7 +810,7 @@ static bool CalculatePrefetchSchedule(
>   			*swath_width_chroma_ub = dml_ceil(SwathWidthY / 2 - 1, myPipe->BlockWidth256BytesC) + myPipe->BlockWidth256BytesC;
>   	} else {
>   		*swath_width_luma_ub = dml_ceil(SwathWidthY - 1, myPipe->BlockHeight256BytesY) + myPipe->BlockHeight256BytesY;
> -		if (myPipe->BlockWidth256BytesC > 0)
> +		if (myPipe->BlockHeight256BytesC > 0)
>   			*swath_width_chroma_ub = dml_ceil(SwathWidthY / 2 - 1, myPipe->BlockHeight256BytesC) + myPipe->BlockHeight256BytesC;
>   	}
>   
-- 
Hamza

