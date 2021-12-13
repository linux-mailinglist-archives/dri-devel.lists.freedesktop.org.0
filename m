Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8BD473616
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 21:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5A410E8FA;
	Mon, 13 Dec 2021 20:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F9310E8C3;
 Mon, 13 Dec 2021 20:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWZ8VDZamLfQq5GcCHOntSW3tkgL5k2jJNxR5K2GAZ1hYWxZevr6hQfhrChk3ErLjL4jKRrLsVXS71E5BLPu6heqvIGyxuvuG9xKgjDGsspsIasrBRz2V3GWbonsbwGv6de4Rpax1RRVlMOBan87Oud5OZOBbxojnXyz+t0s+gjlueXpcY9y0hP5+tIGZUahGrIXk6xjAvL8QcQ2A/JMoX3Kof21FSLN/4PqGYMauiIRyFT7PqUzC/u3PmSvn3OkPY/ZoCGTKJkK6dkRcVBbYFNUl2fxVSaGQOlMw37t6d/io9RkqUnUx+tzhiXQgeTi0uO20bsr3o25iShMLBdS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcB/FWWh2jehFSkHHhNZWLhjvScpQOIkNrm9EvqHOfk=;
 b=BGY94EDj3Y8g/kMHMoy9EI2JTFLnp0DvF4RH08UkCX35Hd1xgA7F8Ei6XL0CnHY2x6eGxHy6IZJ//GIk8wVt0zsdG8VKjrKm9c8xsFP9Qu4zEw0tQdulz8r5R3+wl0rSbkFN2bV6oeFAIHLc4P4gHEZYGSL8f6YPDtPRGogAwRa6MekKB+F9+YMxSXQtAsPVdnugYbY+zFlt2EJJAjacgit2SvyJx+EwMeQQm1laJBR1BBDpJ2b/DbqWfdYynpJHsxiiOW3UX79cCWFuoFb/AHPDggKztebrHlgSIl+xS2vsSgbC7aq5/+NqpE5Jvew8TWDvhVS08O20P/o7lAL2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcB/FWWh2jehFSkHHhNZWLhjvScpQOIkNrm9EvqHOfk=;
 b=mArDwuEmi826+g60KdYJ6O63gK+jdIaiTI74yDZ0omMX4QaekREnAqQef4f3MrHotvBDVizBTC50GSUByXBfuDBttAIuyhiilVDlE5s4hM2qMKFT/LMlAmhbEtpAiJ6cFrUUHjxw0acS8EmpKiFAflCg91f3nQmQ6osRPzK1NVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0190.namprd12.prod.outlook.com
 (2603:10b6:301:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 20:37:43 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Mon, 13 Dec
 2021 20:37:42 +0000
Subject: Re: [PATCH 6/7] drm/amdgpu: Ensure kunmap is called on error
To: ira.weiny@intel.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-7-ira.weiny@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5bbd3c48-1388-9469-8b6f-deed64406d7d@amd.com>
Date: Mon, 13 Dec 2021 21:37:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211210232404.4098157-7-ira.weiny@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::17) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2a3f2f1-ee9c-46f1-7244-08d9be78696c
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0190:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0190771CFE94D55A5B66889283749@MWHPR1201MB0190.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p03LLgmuMMBjkGWsW3ptOqkM3ibFxUbGIIEv+qX42bwW0wjwTXz77a1OUBcqtZuglNTOsXQ/AIxIVj3DwGAu5NhXWtAP3q5dT9vTCUINhDzRwvIzyiUWKAkVDO7fc0M8E8pC5rbUCGZ84YsORdKSydyhx8iF+bv7Ag1N7KspwtGQx+rpyWAP6cxmYmPXs786aA4B/OF94a1JIcX7MnCQOeXg21Th9YwpBIRwSN9UHlazVrNGo7hyyA9o1xvN4/rmg1OWOaweDBiIgx9PqINaBBshSEPz4cTMTasER4SBE9L/kL43+dHyttqeg1kSoHuFJ7/0N3UABnCIqy1hlVdm+L5a+h/R9cu1ttPpViqbFPfEtz4/dsAQlO6dU0w2c+0NDPLGC4X4cfIdEucz3/D2+SIxBhN8k/TOD/xiqdlVKT3A8Mu+CWklcao/JyHqwK6nnWgphOG2kTzzlu1ujqUoGQVUMnXhj7TGK835/WYljDKFrFJT/CtJY0kAd4yV6GY9Y2NieW1wiNUL98QodsEfdsW5vmbo8zHT5LlHi3QgI3CkEdqWXzx8uBNyqqArlJkkxBbYFLv+dZHrPkNCu/mzU4m1s0UlSGJi5wgNwtv6wFJ07k/P2VfdObTy9iSnPVF5bWJzO+dJF/LWVQOww96KSQSamxQRokQzQtXztX/6dF1eT5nmFDLyqfVkuir6k5d8Siup5+TN5G4h+TSCm9Wx+2dXeD32oz71nBE4Kde0bG3u6Dxo9yPXrzuVDzvov7zk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6666004)(316002)(83380400001)(7416002)(31696002)(4326008)(2906002)(110136005)(2616005)(86362001)(186003)(508600001)(6512007)(6506007)(8676002)(6486002)(36756003)(5660300002)(66556008)(66946007)(31686004)(38100700002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXdGdlVyUUtITGR2Wlk5c0FzZm9FT3J0QlVlL1JhbzNyZWlWb1I2VWs4b2My?=
 =?utf-8?B?MWdialB0Q3J3RjlGY1haTjBYYXlBelBEVWlIaXN3WTR5eHE1cWZYdWY5cEtC?=
 =?utf-8?B?QkpjSVVoVkxlTHV3L0ViUEs2RVVlVGVRYXVCdUsxN2tUT05mV1dqaUNySGg5?=
 =?utf-8?B?bmJEVTI2TmtaZk5tV3h5WkkyU0hZL2dEekZhT2UzUzUyZ0tWaVVMQy94L3Zh?=
 =?utf-8?B?WmVsYXV5ZS85VlNvdzNpS0l2bkdwZi9uZVdwUTdwYU00cHFtWCtYVkxqdGE0?=
 =?utf-8?B?eS9EUjlwVDBwelByVHdvMEM2TFphekEreVh5empvMmE5Q203WEpYcytHTm84?=
 =?utf-8?B?bDExOTFIREFQM21XNld3YUdzNlJqbVpid0ZsYVRmOXdXc2c2U3JLY2VjckxG?=
 =?utf-8?B?dTQrcldMRWVIRUtaaXh0d29pbCtQT3F2djQ0bytKY2VzZEdVWjBlZ0JrTWZN?=
 =?utf-8?B?QVFkWC9UK0MvZVVqZVgybUNDUXBBVGNtTHZHRkRMOWR3aXo1NjZieUNtUVZH?=
 =?utf-8?B?SzcvMXVMUmgvY3ozVmYvSWRqVzF2T2wrVGpXeE5WVW1VaTAvRUFWVVZVY3Vo?=
 =?utf-8?B?TmcyNWYrcHgycGJEUXcrZWdyb3NVTHdva1ZkeWl3aEE2azEvN3lNeUkxRHI4?=
 =?utf-8?B?VlBLRFdyeHJBQmFkMDMvbk02eWJzZEwyR2JjNk91ejVsdi9CVHRkNHhIbUdK?=
 =?utf-8?B?aEpqSWNnWDZPakFxU0Zzd3FBTmNMbVJ1T0FyUU1jdjlOeUFGTzlzV3NDMFA0?=
 =?utf-8?B?ZHY5TVNRV3hZVEdLYjNYT2FBcU81Y2VyN1U2SE15M05ZN2FwMU9IRTFJejRY?=
 =?utf-8?B?ZWRSb1U3U3N4TzR6OUE1WmNla2dFZlVqSE4raDFSVW85T3hqYUpjZk5kUGJV?=
 =?utf-8?B?cTlFb2ZrY2JnYjJYczMyUUQwZUR4WE5yK05sblVabk5nUlE5cFZ0d2hLUndP?=
 =?utf-8?B?YlhBVWttVjhHRDlQSGJzYS9BenFBdmFmcm9Xa3EwRjFQT0FWd2NPU2ZoSXk0?=
 =?utf-8?B?TzByWURETHR5Vlhhei9OT2hDalVQZldPZVFueTFYZlA2L3FJbVA3OCtVbkZ2?=
 =?utf-8?B?eEh6Z25JNlVhNDZIejlwemNTbmpKZlkrdkFRVEYrTmJMODlxTTR0M25mdlFp?=
 =?utf-8?B?ZmluZUlkN1I3L3BVMkc1cGpGdE1CMXN1VFg3SW5ma3N5ZHNKaG01bmZZZ0Iy?=
 =?utf-8?B?Q294VXlJOTRRak96UDRnaUxwV1VIN3kyWW0vcXdjU1RRa2JGc3dWd2VyNkRD?=
 =?utf-8?B?OWZUOG5rcEVUQlVJQ2RZQ1RNMlNUeHROT1p0Q1Z0LzQ0NGpMTTJqZEdSOVIw?=
 =?utf-8?B?M0FJdnVmc2VZUURtcGQvNjJGRkZKeXZORUlsTEhSMmp0Ly9rVVVHVTlRZHll?=
 =?utf-8?B?SU9wZ240NDBNQVh0aHVkU2xyVWtLaUpzMUh3L1NLakoyN2VZQytiNW8ycVBy?=
 =?utf-8?B?RU9sK2ZaVERqOXNLNFp0b3hCSUNPaWtXdzNucGx4TWRBaGpFM1hMQnBhU2ZY?=
 =?utf-8?B?WG9JMXM1YW02V3dmTVFqd3R2bGRHNGJpYldUWkpMdDl2bGxOOEpEMkcxN3dD?=
 =?utf-8?B?S2RPdnBiOHNDVC9ySWZPdW03OVc2U0kwbWlzcGR3aVFiTm1meU5DekFURjVn?=
 =?utf-8?B?WmNnZm9nNHRrZDlqYVRPczcyNTh0L0h6ZFhpVkJJazA0WXNjcUdpSVdoZXo2?=
 =?utf-8?B?d24xTkErZFBZazVGeTh3QVFYeW16bW5oc0hCZEtTWGpvWVZKMEpYdUtOak05?=
 =?utf-8?B?T1RvL042MDRmN2Y1WjJpZUlCRkJCdy9YNGUwN1dTQWtrNEhZT1Uwc1JoaGd5?=
 =?utf-8?B?eUd0VUJQbHBUYm9Rb29SSEhsb3lTZHF2V2JqSlBuRmJkR2NNN1Jzb2I4Smsy?=
 =?utf-8?B?R0FKdDg0dW5rU0NwN3A1bXBJdzd4ZHZHeDh3SkZhekR4YzhQQWVYdXQzV1hu?=
 =?utf-8?B?d1NDSkJUeHFXdWorays3eWVsUjY4RzQ5ZXVCOElPYnRLcHBHalRBUEl3WElD?=
 =?utf-8?B?djRxTTJXZUpsTVR6SklBbmJhZitIakluUGlsMVhmbXU4Ny9wK2N3NnZYNTYx?=
 =?utf-8?B?NXVyeEdTNytFdllSTi93SFhuZDhubUdmaG0yaFdPZU1ZZ3ZPU3pvc1JmS1RD?=
 =?utf-8?B?L1dBTkJGOGdjTGwvdVNGc2lMWUh3RW5MZXJ4UVdkTFlGWjNIZ01xaDN2RFRD?=
 =?utf-8?Q?hVWuBtxwihBks+c90zXlkIA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a3f2f1-ee9c-46f1-7244-08d9be78696c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 20:37:42.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsfo83zXekknniXXeeQly49pQpxTnPeizRom8XBPduC2lM6UqNQtz7rk8yD2mAuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0190
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.12.21 um 00:24 schrieb ira.weiny@intel.com:
> From: Ira Weiny <ira.weiny@intel.com>
>
> The default case leaves the buffer object mapped in error.
>
> Add amdgpu_bo_kunmap() to that case to ensure the mapping is cleaned up.

Mhm, good catch. But why do you want to do this in the first place?

Christian.

>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>
> ---
> NOTE: It seems like this function could use a fair bit of refactoring
> but this is the easiest way to fix the actual bug.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
>   1 file changed, 1 insertion(+)
> nice
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 6f8de11a17f1..b3ffd0f6b35f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -889,6 +889,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>   		return 0;
>   
>   	default:
> +		amdgpu_bo_kunmap(bo);
>   		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>   	}
>   

