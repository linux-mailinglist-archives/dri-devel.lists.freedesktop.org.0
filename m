Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB866BC68
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857B110E3C5;
	Mon, 16 Jan 2023 11:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA7A10E3C2;
 Mon, 16 Jan 2023 11:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsEuS26x6oHUDKe/eP4pe3BNDLY5Msz/yRFcYbg2IXiH/n1nn59w1/kheEbKu52wk2nnXZh9azfeUBmGH2zCYczNmnoEO+pXaoEPizshFulf7os9zGxJWgZXMmxacGVTtjdfnCYeG89kXH70Ww50Vcqq4nptdALGyZDpr2z5ccttH5kEYrXgGYosSNtr7E+a+nWBFfFs+CDH/rBWsHUEn5JkQww971WOCml1o4sGqV7TDSznaEYia54+8q/TiMP8XV72JUy6+PeWHXQgyjeXQ5Nf5VbY2jQbAALN7msgeakBHJw1vqga7HRzZOwcXpcNo5h8vOYTvU/8QOSPv4oO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzhNsPA+dSFaar7rtyXFM30lV/FKGtF782wgh1MPzQY=;
 b=fa5VZwdJJ5fO9lgrMOAcP1SsG4zseHp6VQeozFLFfjxZnrXcMmRHOMFvxsxOo97L0fMkH6nq7Xcv2wtAGBYO48Jqnhapix5rhQQEs6ZYZFrSU73yppJz2B8dyYGtH9yTmFEj41v1LMh3D2YyA7mN/g4cUvK7wjpt4yVV3dfGTJViAMmX7i4ItDpl7TozjiSjb4ybMoCxsszz+ENXyHzVRkD9KfHPyHrVF/m0D/kff5pr0MqcPOg2hAK1ypa9caoW+v3SyMQlTZwF4FFdeaMUIk0QTtyDJfNP740asrgg0uluDZKLFM6O2KS0S7hPdfdrTuaQNpDHqJNFArneSAHCQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzhNsPA+dSFaar7rtyXFM30lV/FKGtF782wgh1MPzQY=;
 b=nKDA9Yo0hUpvR3idFBNlLsFKdKQjXcW9yFFv5GE3sQSlQLGqz6b7NtYz1OxdlegWWRWSYlHU/bJctxi4LnIjHrq5bRORMfvNchp9x4PxKzXrLyirl5fw0c2mYKoHhMxSfh1+xruHMMM5F72MjTpnbu+LyHOr93B2tnnoWXCyFQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 11:06:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.022; Mon, 16 Jan 2023
 11:06:51 +0000
Message-ID: <6d50c833-d4cc-56f4-6ca8-10362e93934b@amd.com>
Date: Mon, 16 Jan 2023 12:06:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] drm/ttm: Use debugfs_remove_recursive to remove ttm
 directory
Content-Language: en-US
To: "Ma, Jun" <majun@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
 <20230113053416.2175988-2-Jun.Ma2@amd.com>
 <7cafcbb2-f2bf-b7f8-8627-acdcaea258c1@amd.com>
 <ada9ea13-37af-16c3-f662-e6e4cb20cbaf@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ada9ea13-37af-16c3-f662-e6e4cb20cbaf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b74c28d-2cf5-4b48-edee-08daf7b1c52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnZaEBnIDc+DPG5wOhKTrVyVwV7rgG/YUyJjdEr+8qHGSPo6YXEilHx7VZcJsCzmX0GoO+kBkpAiR2dPNFrKf9PVkVhTurj+7BnDIww8SSBulI1aNh9BwffAJ1mEgd+uys0LvaVOzdXOdzQPjg9xXtvBpD5rPcg2mmCH/yo2Ztwm2LlCIYkiaygEQLPcnYYZ5mggxz1mkrfGqBbIs2nXP66NLzvRqeq5CJ3TjW6OKyZuxphXQfhs+JsGUUYXTsCqz9JpFMdd6/eJOidoIicLXnBe4AB/TsxVY24gym1+vsqORCrTRWwn+uOoiZ3zQ4MgrLld2YTFYPXZNBRZwTXHs16hF2/e+dLNl5RkWdhWwfEtSYin6F6OWueFJeCVl8jRocoNqkv7CDjkwEn0vuyu5Z0groV5uUF82KZTl2EqmxcDQUguP3fTuA3pDFoD3qdimr42D/+9704DpPjODM8qjHgBUt0B3Wm5ettQXwu9jmQvwwfXsUyu9R6eEaJoaGPuA6hlxJIHqKYCs4g8eUauuoofiM/rZfRw3okWS08AX5tkCZzfJ1uXXpVQyGYygm8KN+9Yx6JPvNP2nXOFpMSbOtSqwXa+zvPDEobGhNVoLpEvYwGVUEp5jqlaK2ZhDiqoQVE2AnemQY9vvMDEqYq3TrD9dBIMxj7tpvwW5AjZan/k67ITC+6dBr4jaVXK7CpmBL6/0zlaTi43goxhnmyhzd2oEWpqtBT6GDytZ6YDkWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(83380400001)(66574015)(31696002)(38100700002)(86362001)(2906002)(5660300002)(8936002)(41300700001)(53546011)(6666004)(478600001)(6506007)(2616005)(26005)(6512007)(6486002)(186003)(316002)(8676002)(66946007)(66476007)(66556008)(450100002)(110136005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFqZzdiaUdLeFREQk5PRnYzYmE5dHh3VlNYZGQ0VUZzRUJINUtWTXBTV0hE?=
 =?utf-8?B?M0VCdi9VaHZoK3FESUplajU4SzJLWGxnNGNjMDRVcnB5cE84RVpVM0ZPRkZs?=
 =?utf-8?B?QXVGT1ZUY0w4amgrVm5xeTJKL2tWcyt2OUdCY01zMDhQcWxSSUtzMGx6UnlM?=
 =?utf-8?B?eUlFMEhwblBiNSs2T3ZlSWV6czB2SjNmRkFORS9xdVRSUmhucURnVzR6YkVl?=
 =?utf-8?B?RDduRHBUWWVrWm5UTHFKN1I1dk1qblVpSjNJdFU2c05qbms1SW5FckpMa2tl?=
 =?utf-8?B?SDRuTldmNGZlNXpsaGEyVUdyc2FwSVNyRzVReERpUHBCTnk4amhkcU11MjA0?=
 =?utf-8?B?QjloT1BPaXdkMTlpSVI5VnQrRjFTdTNGa0RhVHZEak11UzZGTFVETXg2b0hl?=
 =?utf-8?B?RHVsRElCcmJaUHFwdFVNYiszdjA4VGkvbTQ5eGZpdkZva2IyVCtBblBwNzhn?=
 =?utf-8?B?MTZxNHhTbU54N1N6SnFQRkp3MS8wek9yQmZKaFlEeWRvNWNMNDh4eDUyRDFy?=
 =?utf-8?B?NGFjbmNwbzBza1NPU09IclAycVJUUlpQVzlwVjc4Sm0rbG0ySTdWa2FqemFp?=
 =?utf-8?B?MXcrZlM4L09vVXV0OVlrdmRmcmlqWU1xTVk0Y09SMzhuWXA0ZGczVWdQdzNW?=
 =?utf-8?B?V0V3eDYxdFBWTWg1SHc2aUlEd09NblVHU2dyOGxhRWhQWHpFVjlTdjY1V2RD?=
 =?utf-8?B?Y3hFcTBJZ0dXcEFZaHlzRHk3VjEzTEZHYmw1bVQ1WmdndlpScjlLRnZqdnFK?=
 =?utf-8?B?SStUaXNUamRSRE4rdzAxSFRCSnFyT1V4OEQySkxac0RmUUdSVkl0SFhHV1dF?=
 =?utf-8?B?dVhvMEpaZFdDL0dtL2ZFd215dGhxamovUXdzenovUXV1MVhnYnZBcGUwdlFR?=
 =?utf-8?B?UkNEL3dWMHVLZUlGbTBoTmJGekxOYmptR0RjcWFTdVdKdEQ5OHhTSStocEpn?=
 =?utf-8?B?R0RlR3pJRHBGb0Nkb05VK3d0VVdFN1BVSG55ZHltdlQvMVZWZFF1bGJUTmtm?=
 =?utf-8?B?ckcxcjM4V0JCUXV6MmdKVEV2UmhUVGFhWklXdlZFc3JCK001OTd1NncxSXI5?=
 =?utf-8?B?OHI3WkRvbDA4WTFNejA2M09sUko4NzVhc05Uc2x5QlB3dWdnOW10a1l5WFpN?=
 =?utf-8?B?ZFB4ZlJUcWJPZ3Ztb2lYMXpFSEdwN3ZPZG9ra1Vrb1NVbTd2UVVhVjM1WkFG?=
 =?utf-8?B?WU4ycUpCWmI2Vkp0eDRVRVNSL3Z6TmpkU3dCd0I0Nm0zZmU0TkY3WnV6NStz?=
 =?utf-8?B?c1ZrZlJlUitXQjQ0a1VPdEh4ZWM3d25udnlKem1BbXVIc0hjRmZIZDFmdldE?=
 =?utf-8?B?cnFVNmdQbCtrWUFDaW1MaUl4MG1BdmRFczJrNjd5L20wMlNWeEgwNGtXN2Z4?=
 =?utf-8?B?QUl4eFVBdlMzM1lyZXNxdnBDOUxYQys4aGc4N252RlhFbWN4d2VuVm9tQlB1?=
 =?utf-8?B?YlJGREJYMUlEcUh3MStFRUpZOGlPYkp5Y1dJUU9IVml1QnlEYVcvaVNlYlBC?=
 =?utf-8?B?WG80bUhkN1lFOWFjcmlJR2dBK0VuWitwbkFNK0FyWUlLUEEyQW1RbW5MZ0s1?=
 =?utf-8?B?L2E5NDNib1RZTHZiNnBhQjRVcTRtZnV3N0tBNHozQ1I3eFpaU1VuWlNWNTVH?=
 =?utf-8?B?bzJFZ3d2NE1yaU1jMjFTdmgxejRPa3U1dEtxNWNPQVZtTDd1c3RwOGJUQng1?=
 =?utf-8?B?UnZOS3AyVE5saGIrNU9FZDl6cEh6VkxZQUJzL1BSN2FKSUV3Q0Y1VnEweXNK?=
 =?utf-8?B?RURuaWh0MUo0VXFRbDdBQkdIRDZKQ05iaWZwU29nWUJSek1lN3R2dDMwY3VR?=
 =?utf-8?B?R0NKK3ZqZ0g1UVovUFhGTFhQTmxwQzZKSkxjS1ZjZG4zWHUxcnpvNHh0dXBU?=
 =?utf-8?B?K1VKQlgvMjhyUjFIRCt2dHNhaDE0VEtmbkM2cnZ0TG00cGs1ZE9DR2tuMUw3?=
 =?utf-8?B?MkhxZHd0d3dWUFhFeXBJMXMveldRS290bmN3YnJpejBhT01GejA2N0owRTFh?=
 =?utf-8?B?cnpMSzB1ZHJrTVIrbjBQaFFwYU5aRlBtSnJ2NkVLSk00Z0lrODN6STBMRnZp?=
 =?utf-8?B?dWpKV3YwQ20xOVc1d3JsWXdidThRaUo2SkpqdDZQOUs3c0crNHNDUDkxVFlG?=
 =?utf-8?Q?Iur769mzeEDDAut5ljMTDRKh2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b74c28d-2cf5-4b48-edee-08daf7b1c52a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 11:06:51.7574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cA02uYDuwFIkixTkSHfBb2fyAIIU2MAbaEloaICDqxdnazwkMXcxO9ofh+CuuVTl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
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

Am 16.01.23 um 03:44 schrieb Ma, Jun:
> On 1/13/2023 5:38 PM, Christian König wrote:
>> Am 13.01.23 um 06:34 schrieb Ma Jun:
>>> Use debugfs_remove_recursive to remove the /sys/kernel/debug/ttm
>>> directory for better compatibility. Becuase debugfs_remove fails
>>> on older kernel.
>> Again NAK for upstreaming.
>>
>> The upstream kernel is made for the newest kernel version and should not
>> contain any compatibility handling for older kernels.
>>
> Yes, generally so.
>
> But the debugfs_remove_recursive() and debugfs_remove() are same function now.
> The debugfs_remove_recursive is used here so that we don't need to make kcl patch
> for it.

Well making our internal kcl simpler is not a valid justification for 
upstreaming code.

My educated guess is that either debugfs_remove or 
debugfs_remove_recursive will go away in the near future, so it can 
happen that we will revert this again then.

What you could do is double checking with Greg what his preferences 
regarding debugfs_remove/debugfs_remove_recursive is.

You could then write something like "Replace debugfs_remove with 
debugfs_remove_recursive to better document what actually happens here. 
Also makes our internal KCL code simpler to maintain since 
debugfs_remove might go away in the future.".

Regards,
Christian.

>
> Regards,
> Ma Jun
>
>> Christian.
>>
>>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>>> index 967bc2244df3..590297123bb2 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -55,7 +55,7 @@ static void ttm_global_release(void)
>>>    		goto out;
>>>    
>>>    	ttm_pool_mgr_fini();
>>> -	debugfs_remove(ttm_debugfs_root);
>>> +	debugfs_remove_recursive(ttm_debugfs_root);
>>>    
>>>    	__free_page(glob->dummy_read_page);
>>>    	memset(glob, 0, sizeof(*glob));

