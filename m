Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1B8C867B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5045410EE9C;
	Fri, 17 May 2024 12:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EUztVS29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2E10EE9A;
 Fri, 17 May 2024 12:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X67zHXwnNNpbqX5kH5mfw2XS4JGpBVwE3McBkS/g3VxA0tcB3jFd4Qetrnvww5v3x6LgsnjhlbR35+QnEGyJ445DkycJbkxpZN1qooZ/TG7yOVQY7l8sKuemzp56Bx47AYDYcORIilURKx9BmRKSxHCcWrq70vwJJNP6WsNHNrJebJd+XGrfA47/YiPhdprGimzMvY/5kUnMLNSQArClUoE2t6YsrlhoODy0OPg0YbjrjYJ5NNyqe55pBN7fA194qiBzhCvsgmbIR0iNU3XO/IEVhnLOGHbkvJ4Xn+cDBqUNwrq81obP7EFP5Z60l90p1LQU+86+Ku/ZvUcIQJgfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf0I1gd+BwlYv76W5EXdhXgQedNDLOXPbkyuupIgWMc=;
 b=FoQJwIcZMFVgxxawwYHQwqBO6HFVJ/MCNoJ5S1GhJ0QW4Iv5h3Q36N+5+mhemv4F3GP6H6M5OQs2Z2VDH/Uu7uhabCCxyI4+vAcF4YRPyvYWLUJefmPJ5O5an3FA6bQfwirsHimxvf3+xuRjK5UgqMM85xY2n0ojt+qsBi+3im+ClphBV6EMjcF/mZPE9MLNd4WsEXQxG3toOn+zknEzqBpRvrmhK64IdLyny3eupC5uqcqjOEtrUWZXP0Av6n2lMEsL5qOVKjLWC/hdYBDP699exEbjhpM56h1D3kzmQ9zCq2bXPvFlpsVCRO+4STbWQ/36HQ95hd2Ac/ZV0/elZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cf0I1gd+BwlYv76W5EXdhXgQedNDLOXPbkyuupIgWMc=;
 b=EUztVS293Erph0jWSMvpPymzTbXcYxM381GFKdwuOIE4IRsPyJrn6F/fDKbpbOu8h7AKrYll/0TAkKpjTTKupXiwAqbZwqBNCAmswjOBJcFj2m/0i2mCbZgXgcSuRoe0ownQT5SR1In4wm3ewlPIHGlESRsH0/VFSfiFsghk2HQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by PH7PR12MB8040.namprd12.prod.outlook.com (2603:10b6:510:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 12:47:44 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 12:47:43 +0000
Message-ID: <befda794-b7cd-403a-84e6-1e134fa1c965@amd.com>
Date: Fri, 17 May 2024 18:17:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Merge back blocks in bias range function
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, Dave Airlie <airlied@gmail.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com
References: <20240517123804.2816-1-Arunpravin.PaneerSelvam@amd.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240517123804.2816-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|PH7PR12MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ddc52d-2ead-494e-8124-08dc766f8ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkoxMDFYVkkrc0tHZ0lXNE1jSWNkOFJMY1F0dGFsVmh5M3IvWCsvanBac3E0?=
 =?utf-8?B?dERtVW0zRTJuMisyS1dPRXZsNFd5RmtKN1ZDb2FTRWhsYUNtQzh5alBjRWVU?=
 =?utf-8?B?YitMN2RZTldmYlBGakoxMGJsK041cWF0S1pORkdVenY4QU5vUWU4ZlNRcUVS?=
 =?utf-8?B?NGozM2JtWXJhOU9tVDVUN0IrNGs4U0c1NmJ5TDBsakNZejY1QW9jVkxZc0hH?=
 =?utf-8?B?MXBsMWROL1B4c3FyTUczd3NIY09yRjVVS3NYTUxHSHhzY09BYi9abWpVVkxC?=
 =?utf-8?B?UUgzTE5xUlI3Q09VTGNHMm9zSkNBalZNUU1lcnpZT0FNSmVXK2M5Y2l4d1Mz?=
 =?utf-8?B?QkxTTkNxbFlqL1I2Y3l2bENDUWpyUG1iSnVEWWpjaFZzd3lOYitRTFlqdlFJ?=
 =?utf-8?B?Q0FQK2RwN3M4K0RGaXFER2p1SnFJYS8wUm5GV1d3SmNXRWVFYTBzM2ZiQ2RJ?=
 =?utf-8?B?aGRBUyt3M1VpRUtIS0ptaCtoTUxDUHBIRVZTWGRwWTF6bDBvTWZsWUIyWkpq?=
 =?utf-8?B?czAxVUlTVVczVG91TVczVlhOakJxbHNPZWtURU1hNlk2Wmo2SHhhUDY0Nmlm?=
 =?utf-8?B?L3FhWWQ4dUFGWmRpM2ZXNEZ2OVRrUUV4c0ZibWRyWVpMUmlXNzNnekhsb0F3?=
 =?utf-8?B?UHdMYzBUbUlNNy8yL3JoVUw0a0l1UVNQU3luMUtZa3REMkVTM3Y4dC9QSnZB?=
 =?utf-8?B?NEwzUFZNd1l2QW1hMmNodU5USzZKVFlWdjZWSFBpajRMMW1mRjZpdjJBaXd5?=
 =?utf-8?B?aFlLL1pFaHdzSG5UZ1B5OEd5djJjbnJJOC9SdkFXZHRidlFIZHlPbFVEaUhi?=
 =?utf-8?B?MERqOVpOcVBKVERXaVEvQU1YR3NKMHhYdWJJQm5uNlBWU3lGVElNRUNhbkUw?=
 =?utf-8?B?RmF1bHYweXBwcHhDTGlCWmdhbzVBeHFDa1JPMHRYYXF6RDFtQWJoNzNSZGxa?=
 =?utf-8?B?cFEwSUEwOEN1c0NSU2lFaDVHNSs1QzRMWGlvd0ozemlQWkJzVFVSMTdJUHZy?=
 =?utf-8?B?ait0bTJYK0JBMWRPajBQZ0VVNWdxWGJYdTZla2tWT0p1ckppdy90UUFnb2xt?=
 =?utf-8?B?am0vd3dYMTRTOFlnc3RneThBWFcrTEFjcXFTSElsYzBMUHM2SlpFbWxiUEVu?=
 =?utf-8?B?bFZiRFRVeldlM0JQL052WU43eU1UK3pVK0J5Z1pCQVJ6TEJKeFBWSjhtNFFn?=
 =?utf-8?B?NmVhaFdlWWptdnlkZVlhUHhaeEh6U1J0ci9RdXl5TGJrMlJFOWtQSEltYU9O?=
 =?utf-8?B?MXptNjdjYVJaZzhoTit1M215SjBoT0hTUmoyZkdocGhPajdQVVUvRlJDcXJp?=
 =?utf-8?B?Wmh1TFM5cTVBckZ4d1NkT0lNaVVuN2h0WXhPZFlsY3psY255bVVFZlM1MTdI?=
 =?utf-8?B?dVUzUngwcVhQUUtEVFdlVE1QdDlsTGgxdXExb3luQ3BlaFlsQ2p0SXZzWERk?=
 =?utf-8?B?OGc2Y2hGMVJtMDRIZUE4YWdkMnlualF0QTNmMDVCY29Qa2s5NVN3cWdxUytC?=
 =?utf-8?B?clU4cUxPOS9LTkdlbGw5cUk3UGZGVlgvY2ZCNnlBU2l2WGJ0WXkwM1NYMSt0?=
 =?utf-8?B?d0s4NDZHRG5BaE1BQzRvRFJKbXhsaGpuK0JuR1BPYm04dTNrWFZqK2ZoNUZz?=
 =?utf-8?B?ZEF3K3p0VUhNWXA4UHhmNXA1eG5CenZhMTF0S0FLVkQwTlh5Q2h4K29HaHdD?=
 =?utf-8?B?dndPYUwwM0FXNjk2YWN2YUdYcUFSeW84Kzc0eVROaW9vMms4MXpxdGhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFV3eVd0UXh0MzFyNFdiOERQMEpyUnNJTkhPMnFSdmJTMGtEOEp2Um51a1dE?=
 =?utf-8?B?MjNEQ3FpMUVkRk52dTFGaEprazJuVUU0d0lFdCt2cVJOdyt4L2lkTmZ2dXBQ?=
 =?utf-8?B?UjYrNEN3Wk0yR29DSlhJU2x4UkJGTW8yNWxYd1JxSXFxSkhITHV6eHM5NEJn?=
 =?utf-8?B?SUV1c2FDMklheGJ2QkJwcW10SS9seEhwVXdBRmp1aEJaVnN4azVGTUxrdUlo?=
 =?utf-8?B?ZzA4aVpBV0VPNWY2RXlJOGRmS1NicmV1ajI5OFMxUmVSR1UyREJWb1hkUVgy?=
 =?utf-8?B?ZkRHYmRrUHdkR2RkeHpqd0kxN3owa0RKaDhlTU5QMWozeUkvbG9tUDlYaHJm?=
 =?utf-8?B?WThMRDlza0JreDFJUjJjYWs0L0RHK3daOG9MWDEzR1ladk5SaEd4ZmxsUVY1?=
 =?utf-8?B?cllOOWJ3WnFJL2RCeHRKeDB6Wk1haUNwblBFY200dzBJakJZbFplSFpVTkF4?=
 =?utf-8?B?dE1IaXJua1BSdVViMmRlajRaYVFYZXZGY0NzZTVyVHZwa0pPRFpLUURTcWk3?=
 =?utf-8?B?WU9MZDR3TjJJenZHOUJlNjQ4OXQ3QjRSOXV2a0lKeVhIWVgzdDcrMnl3OGFs?=
 =?utf-8?B?OWo0Q053UFpucWg0bTViM1lmVVl6V0JQVmozMFlwajZYWGFuOXJFRUkvUzZV?=
 =?utf-8?B?SkZ6UlJjNWtsQXRnTTVhY1ZmbXVxblpTYmQwYys5UmVPZHpOY3p4RmRnNjAz?=
 =?utf-8?B?TDhyQWdGRTY0b0xydWlJUE1uYWZROW5td1gzUWNiTWVGZm9Lem54Y3VKenIv?=
 =?utf-8?B?SEVLUG5adnBxemY5bU5wc3pPQW5PUlRDdnVrQTBhTkpjN1p5bmQ4QXcwV3hW?=
 =?utf-8?B?SHJOdG84ZU5ybTRXZDE4RTZqRXV3WVAzaXBPL0U5ek9OS1lENW5wbTNiSUlT?=
 =?utf-8?B?UC80cTNVSVVLQVV6bXNVcmNvcktiZmM1Wmg5c25hbmVUdGxyWEVkK2JMRjd2?=
 =?utf-8?B?UFNjc1Y1a0NzN2U4WmRQTWVEWldxcXhhbVd5YStudFVsQmh3Y0lGN1BkWnRY?=
 =?utf-8?B?cytWcmErbnYvK3c5Z0RqdjlNcjZneWNnd3R3TWh0NDZ0RnZZa1l2cDY5b1B5?=
 =?utf-8?B?Y1lCNnVhdGp4OWZscXNCcW03Z2trMTAxMG1uYXFQbERGKzd2bE1BM1U1U1Jh?=
 =?utf-8?B?SFRNUzdCdWlkTU5DL0phV1dPYUU1R1VncG0wV3pZZ2VYMnpORWhPblFaVjJo?=
 =?utf-8?B?MXU0eFhLalIwd2ZldlI1di9UZHJyZzBWVmFrTjBNaGgzcTYweW5UMG9EdHdp?=
 =?utf-8?B?b1BkenhhRjNZYXlGcHVkYTVHNkNxSmVxL1Z3MitjTkpFejY3NE5kSWgyTS9r?=
 =?utf-8?B?Tmp2bTlTeFlET2RMSmlhYS9IZnJwVThaUmd6TVE3VzhjL0FCMWNBUVpyelh1?=
 =?utf-8?B?YWpMU1RBMHlKbXRhR0dwZjdqWjRNeWZoSjJoOUp5MEpUdERnajR5NlNNSitj?=
 =?utf-8?B?a3NXZTZLeWhPQWpuV1cra0ZDckZxVFA1QjQ1Z3Z6cE1tcytiMDFxblhSdXBq?=
 =?utf-8?B?MGZTSllZQmdpMytjOG00aFY4LzJoV2VzSCtYMkt1dHZmRVRVbFAzU20rTnIy?=
 =?utf-8?B?aEQvNGhMR3RneGN5NFQxTmJtMGpzK212YTkzOHgrczdmMGpPWHR6LzY4Q2RU?=
 =?utf-8?B?WDJEaU44bS9tVDVDNXNxc2w0SU5CQmVNVExDc002TjNhTWtmNzRvaWNVdjlH?=
 =?utf-8?B?Yk5SNDR4VktvU2Vkc1lkb3I2eWRXY3gxSTI3c2ZtdWFrTWxBeUpTTmFFL1pv?=
 =?utf-8?B?Y29lY3RybVlpK0lYVS96ejJKNThqMkt5dzRJdzFyUklaM1VpQ2xKaTBZUVdt?=
 =?utf-8?B?NGN1VnBtTmpCZVZGcUJVRldNZmZsbzl4c2llS1F1bG5yLzk3Nk9BQXdPc0Ri?=
 =?utf-8?B?amNEbUt5SmNmYVNPQmsvZVJzVGRzaTJsTlVkL2hRVHRTRmJnZ2ZjcytQR0k4?=
 =?utf-8?B?NzlIejMyc2dGTDVQRVlmdy8xWmE3Uk5leFVGNVdaMVQ5b2VNc1JFcEpEcFJR?=
 =?utf-8?B?aFFRandOazYyVTdta3lNLzVpVGNlaHh2NE5PTUoyS0RpamxFTTRUUzZob3R4?=
 =?utf-8?B?RFpQZlVWN296eGRIYSs1and0YnpHOUNDUnZnc1p6QVMrM3NOUElRQitZTDlt?=
 =?utf-8?Q?EY8M0zm3q9kcf/zq8Bjlb4DfZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ddc52d-2ead-494e-8124-08dc766f8ba6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 12:47:43.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB3MaNkSE8kheKOlCbnhW09RWyEg9Fwlv6SCBhkcaW3LscIKMY88jN2netkya2JuAO1fsnv8O9x/YgEshhDR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8040
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

Hi Matthew,
Could you help review this patch quickly.

Hi Dave
This patch just fixes the unnecessary warn on's triggered during
the force_merge call.

Regards,
Arun.

On 5/17/2024 6:08 PM, Arunpravin Paneer Selvam wrote:
> In bias range allocation, when we don't find the required
> blocks (i.e) on returning the -ENOSPC, we should merge back the
> split blocks. Otherwise, during force_merge we are flooded with
> warn on's due to block and its buddy are in same clear state
> (dirty or clear).
>
> Hence, renamed the force_merge with merge_blocks and passed a
> force_merge as a bool function parameter. Based on the requirement,
> say, in any normal situation we can call the merge_blocks passing
> the force_merge variable as false. And, in any memory cruch situation,
> we can call the merge_blocks passing the force_merge as true. This
> resolves the unnecessary warn on's thrown during force_merge call.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> ---
>   drivers/gpu/drm/drm_buddy.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 1daf778cf6fa..111f602f1359 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -161,10 +161,11 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>   	return order;
>   }
>   
> -static int __force_merge(struct drm_buddy *mm,
> -			 u64 start,
> -			 u64 end,
> -			 unsigned int min_order)
> +static int __merge_blocks(struct drm_buddy *mm,
> +			  u64 start,
> +			  u64 end,
> +			  unsigned int min_order,
> +			  bool force_merge)
>   {
>   	unsigned int order;
>   	int i;
> @@ -195,8 +196,9 @@ static int __force_merge(struct drm_buddy *mm,
>   			if (!drm_buddy_block_is_free(buddy))
>   				continue;
>   
> -			WARN_ON(drm_buddy_block_is_clear(block) ==
> -				drm_buddy_block_is_clear(buddy));
> +			if (force_merge)
> +				WARN_ON(drm_buddy_block_is_clear(block) ==
> +					drm_buddy_block_is_clear(buddy));
>   
>   			/*
>   			 * If the prev block is same as buddy, don't access the
> @@ -210,7 +212,7 @@ static int __force_merge(struct drm_buddy *mm,
>   			if (drm_buddy_block_is_clear(block))
>   				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   
> -			order = __drm_buddy_free(mm, block, true);
> +			order = __drm_buddy_free(mm, block, force_merge);
>   			if (order >= min_order)
>   				return 0;
>   		}
> @@ -332,7 +334,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   
>   	for (i = 0; i < mm->n_roots; ++i) {
>   		order = ilog2(size) - ilog2(mm->chunk_size);
> -		__force_merge(mm, 0, size, order);
> +		__merge_blocks(mm, 0, size, order, true);
>   
>   		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>   		drm_block_free(mm, mm->roots[i]);
> @@ -479,7 +481,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>   		   unsigned long flags,
>   		   bool fallback)
>   {
> -	u64 req_size = mm->chunk_size << order;
> +	u64 size, root_size, req_size = mm->chunk_size << order;
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
>   	LIST_HEAD(dfs);
> @@ -487,6 +489,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>   	int i;
>   
>   	end = end - 1;
> +	size = mm->size;
>   
>   	for (i = 0; i < mm->n_roots; ++i)
>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> @@ -548,6 +551,15 @@ __alloc_range_bias(struct drm_buddy *mm,
>   		list_add(&block->left->tmp_link, &dfs);
>   	} while (1);
>   
> +	/* Merge back the split blocks */
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		__merge_blocks(mm, start, end, order, false);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
> +	}
> +
>   	return ERR_PTR(-ENOSPC);
>   
>   err_undo:
> @@ -1026,7 +1038,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			if (order-- == min_order) {
>   				/* Try allocation through force merge method */
>   				if (mm->clear_avail &&
> -				    !__force_merge(mm, start, end, min_order)) {
> +				    !__merge_blocks(mm, start, end, min_order, true)) {
>   					block = __drm_buddy_alloc_blocks(mm, start,
>   									 end,
>   									 min_order,

