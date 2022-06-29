Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989355FB70
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 11:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF2E113C85;
	Wed, 29 Jun 2022 09:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EF0113C85
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD41KtCc2xID56lqgk6oZnsyA4IuHsVVVinhqSwSxvfXa4uI/TURNtBZmkkrww5Gzr4OLvCZUgsu8iDmefdVcCMNtb0gv04IHVx/zc4O2iDDPelydsXTNfqlNwtPk8DqULxBcLt9dnFW7SgcONKnWSsnxp+bn4bEbN6xueBrT/vQsKzVzxkoZ82Ip9IQ/cmWiTnYGuMke0sTNKCJgej+2L6ty+OIDODAec3jDMpQIBFt5aZGxUHBJLCVE2mZfT9hA8nrKDfWfNxFrjOXWUsLP2PAqY3CjXVgtrCVS0oxKUJWc6pS7p2nSJh/1dg6HnL2IjqxOTtxDPRCqhPdPif+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKnjmI/D06DvqqJSU5BT8xKxvwJWeZgmuUEikkeXZrY=;
 b=isRtb3mFtsTw0kSIIUpRUPlKFOyLBrflKFvPrG+Gai3EIuhFzDBnMzmgsyGqA3lgD0cCBGJASZfmI7TSBK3T2tEx8vzDtmRMmRz5z5U4pryRtHVFggzCgVfytrj8vly/1P+CvE9JKL5Fk/wHXBM/81ezXH/LiiBPjFjpo6ILoVzPdDSNha9cum1XmrMkhQbycA5D21QS99zxBmQ3UwCTa85YlcvfDjkkjVOE59umfOqMMBrBnGY+Pg+ETUw0h7Hlkhvp7I8gtVa8xZouuyF46IKuSXpg/V0+EyRIvbQ0PfvSmX3XeeGf001Me7hJ7i5gCljhJkFgHP/O+DsoPD8pZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKnjmI/D06DvqqJSU5BT8xKxvwJWeZgmuUEikkeXZrY=;
 b=N7Gw13+KMXJkIxI5CEmmQSTLYYiEe9RhjNzXcP6EBv8SPbDqKT7/UBoXrgBirnX5ae7EK9lV1SAW5Lvai6jLQszc9vt3BieBnLVY7LRcAHFHm01d8z7fCuhpvlznJ22Z1pQbwYw0mH0U2jQ2ymjvKYsNGIpNOFHNdrx8n8dI23Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR1201MB0141.namprd12.prod.outlook.com (2603:10b6:301:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 09:12:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 09:12:34 +0000
Message-ID: <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
Date: Wed, 29 Jun 2022 11:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
Content-Language: en-US
To: jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220629060236.3283445-1-jesse.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220629060236.3283445-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e61abe0-4415-4f62-cda0-08da59af80ec
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0141:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/UcpfzSfzv6i6bKL116Qx7BeTevDwuDtAqnIfq9K5F5TObuaSCnpshEYLEVN+y0S2hxNRRWWpW21fGqTltcOHAmVXtljVC4kzOfoiXKUEiarA6+nhM70iS+ac77VLIaUMfczJLkLp6jbPTqB1MYQxzz7KSBYsGrmxkYUFiQmpI5BUUgfas6yrOQST/YrpOqFDuwlLII5qRq+Zo7UOyYiId1bwb8QKcnPDfXy+zHxscXexR+evgnNfCLt+9jPdYQvO6C/UVOB5wHTVIPSU7x22tqg1B7cSvioVIjW8sUJEvJtTvCzqAIqE3yrFA3H35PzzuQ8QrLFqBDGBlrG0d9jj2g2o8nYshm+T9nk0WVz+/h+Py7CTHKLztI8Cs3uk4T0TlThzUuyyVANzwM0Jnb1LWRBmkYuWskpNO5KT7ud/opRZ9CCkPzAIcPk2dxDHs1hikPTJNZBWPHtRiRuAML5iSGPM0UbEW2qZoht4zZ204BBTeLqH4JxguHjwvqyHyuYIUdWJCenH0P/vD+w7PGDsKpUMlbCORl4/+IeHUr/Fdv6G1S62b0tI9jdqZ8xaMOdokLpb8EH9INVdJ93EyrRZqUVU9QVY8kHyVTF0cLcjpX2RJK2QDurTVepJM7Ic4lPTJN+gdGsDsuemLTyWCDZd+9l6hXOlsk2xXTYqEKZtq2TjssvRANPNd3t7E9UAzZQ644cPG93yTryS8+SI7BfyqnIwfVYAhlpP7MikRQ6HnMSCDWu+xNBjtY7uYh+PiqmrcbnaurdE5gOlOnner2udmKJPbF4dOaXOKzWDpwLPwet0b5AZDnPBSekQTZ6rs9BjaP9AtFI3eilkNq44OgtDDsafe8+G4XhpNIxd/ENgb8S2IwQeUaVFWw5dZVZOuc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(31696002)(86362001)(38100700002)(8936002)(5660300002)(6486002)(478600001)(2906002)(41300700001)(7416002)(316002)(54906003)(6666004)(8676002)(4326008)(66476007)(66556008)(66946007)(66574015)(186003)(83380400001)(6506007)(2616005)(6512007)(36756003)(31686004)(45980500001)(43740500002)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uy9DRUR4S1h6Lzdhd3N2L2gyU2VMdHFXbFBwSE9lbFRMYkYwTlg4eDhWUDll?=
 =?utf-8?B?cWxGd09TWU1hK2pkeXhUUjFrTzk4YW00bUtMMWRwdzl3cEFmRVFYU2RtZkow?=
 =?utf-8?B?YmNnR0V4TzZzNjBuYWZkM1d2TjR3aU1ObGVPdjk3SWZxd1RyM3VDbzk1NjBn?=
 =?utf-8?B?KzVDSUdvT0xpVTg1bnEwMEhnM1pob1grdlhvUWtITDdoeVl0LzczSWpKT0o4?=
 =?utf-8?B?UFdxdy85cGxJNjNFVXhoc1JGRUJTcC9meHJoN0lYWjh6SGJ2RlBvcGFYc0g3?=
 =?utf-8?B?RzlJbG91Z0lHMExxeXQ4RVJUQmVWOEJoRDZkYWJndXUwaVNTa3JzeHlFOTFl?=
 =?utf-8?B?VHJ2OUhoL2hHZEFqOEdJZStrc2dRb0NBWTJPeGVodmF0VlBmZVNZM3ZXT2JX?=
 =?utf-8?B?Z1lvemY3eElzRG95LzVBSkk2bWlzTFFweldKbVpHaVlSVjl5Q2tKY2RsQ3Ev?=
 =?utf-8?B?VFlKSHduTFh3MmdpTTg3bFFyMXdnOHlBbE1PdFYxY3hpZDdoLzZnbFNqdXha?=
 =?utf-8?B?djlPZVNYczhNRExBbWU5MW5nRTZUZ2RCeW9KVnNiVFBUaWJJUUltZThDWVYv?=
 =?utf-8?B?OUhFbDZUNGRzWXFrUUluM0xKcXRPc0hvNktYVmkyTXUyZUtWWGFxUjhkd0ln?=
 =?utf-8?B?YXB0ZmV3YSt3V0dpUEVIb2VyV1dLWVl2c0lFdFRMdDU0NUNtVXVlOHBnS3hl?=
 =?utf-8?B?SjJkUHpRTGU1aXRCMXcyb213Z1NqT05uajZFbkxHZW5yd3V4R0htWVRQMzYy?=
 =?utf-8?B?cWdJZ3laL21Nd1VLbnI2ZlI0N1NQZjl3bHBwSndyREo2NUVSRm5JRE5mTW5R?=
 =?utf-8?B?QjUzc1pPWXpNV1haMEp3R2Z0VVQvZDMveG52cDRwZnAyU2NaRDhLZzV6MzNM?=
 =?utf-8?B?ZzFRbXp0b0JObjJ3NnR5Z0E0VCtrWTExTTVGRG1Dem1GTzl5R01sbkdkY2wx?=
 =?utf-8?B?dG1aNHE1OHNHVG01MjZYVzJDWVc3QzFreGRjMTl1NXZHV3I1a3JSNVFyQXd0?=
 =?utf-8?B?TW1YalNaWDVybkY5MjZwbnNHWnRhSVlIL3lIMHM3eUljL2gxeDJmS1o3S1da?=
 =?utf-8?B?dVE2am8wYzZNMTZDS0VUV0FFTGx4RFZzc3RnNVNpTnJTWTdRMUtrL3NZbTla?=
 =?utf-8?B?Zk04UUFVOGNTdGtwTzVCQVdhWmVBWndwSU5ZcC8xSSs3dFlvdTFxMjFkQ1Nu?=
 =?utf-8?B?M3JvRGsySXBNVUQzMmN0RHNoWmVsNDEwZWF0RHVsK2M5WWZLYzFWRjRmQ2ZJ?=
 =?utf-8?B?QU44ejkrbHNXYmwvejZnWE1vZEtSanU1REVjQ2ZKN0I3YkljRmVvRjlVaUJX?=
 =?utf-8?B?U05nZGlQeWNFNFhGYS9FRm02bjhZQzZmMHdmWktMNFNXYS8zb09mcE9xcmNn?=
 =?utf-8?B?aGhTWGNNVnBYd3ZqMVd2QUtIN3pVU3EyN0ViMWt3NVl5azhJWC9sTm13WWhn?=
 =?utf-8?B?blNvUHAyWkZjeFlwNUFuL3BlMCtSRkNMM0JuWG5RcTRkUUZTYmltR24xeWtJ?=
 =?utf-8?B?N0pIcUxod2dSZ2ZmSkk0dmh1L05aS1hrdC9kM1dBZkpPYXkxajVTMXZ3TW9h?=
 =?utf-8?B?eEZNSWxnVHVmdDkxbzdXSEZvcmdRMklLYWVudG5kdnJGcVlQbElDM0ZISi9J?=
 =?utf-8?B?cUR3bHE5ZlVyaThRTEI2Y0U3cERZYnVvcWY0YkF6NWJMKzl6NnVHcUF1UVVN?=
 =?utf-8?B?WjUrSU5WTTM3MjlMYlVmSkl2Z1hKbEIxVm9YREFzazJqU3czRzRjdVd6azh5?=
 =?utf-8?B?Zmw1UHNSd21sTi9abU5yYUQ0amJxRUMyODNyUjJNSHcyblNwSG1tZ0Z0QVlw?=
 =?utf-8?B?ckVNc3QyS1JzVW5DakVUWFBXbW4wOEFDTWtacEFWa0plY3FhbzNsbzAxY3dC?=
 =?utf-8?B?R3V0QXhtallTQXpkTkJtUU5wVVplc1JYNzVFbnVWVFo2aFdwSWNHN1BVK2xj?=
 =?utf-8?B?RGZ0NHI1SVlJMjdkNjRHOTlXeVY2RFM4ZTFoRFBWVHRveHluMWt6WFNXQXR4?=
 =?utf-8?B?aCsxdEZkK2YrUW1DcWdPM2FESTlhM0YwVUI3bFI1UDBKZDFxL1RJcFZBQnN5?=
 =?utf-8?B?T3hSeklJUGFEaVJsWnBFSDdaOXNOM2twRXhXcFcyR2tkUm9TUzI4dkF4aDZB?=
 =?utf-8?B?MlBLZHRIdUxkRGdNaUZFRUl0SDhBTUVqbjUwaVpCcVBvYXBxa3lnUWJCaDNB?=
 =?utf-8?Q?UW5Eb/xy7RVQVOTs2/UlsiCAt/CucRbRYgJqhFSnyghj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e61abe0-4415-4f62-cda0-08da59af80ec
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 09:12:34.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iybp/BPA0GSNVfZr7eLMfXvVxSm3LV2y1EXVgXHC14QFpnx8JpocjTHu/3jM5TCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0141
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nirmoy Das <nirmoy.das@linux.intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vijendar.Mukunda@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.06.22 um 08:02 schrieb jie1zhan:
>   The issue cause by the commit :
>
> 721255b527(drm/syncobj: flatten dma_fence_chains on transfer).
>
> Because it use the point of dma_fence incorrectly
>
> Correct the point of dma_fence by fence array

Well that patch is just utterly nonsense as far as I can see.

>
> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>

I have strong doubts that Nirmoy has reviewed this and I certainly 
haven't reviewed it.

Christian.

> ---
>   drivers/gpu/drm/drm_syncobj.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..d5db818f1c76 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -887,7 +887,7 @@ static int drm_syncobj_flatten_chain(struct dma_fence **f)
>   		goto free_fences;
>   
>   	dma_fence_put(*f);
> -	*f = &array->base;
> +	*f = array->fences[0];
>   	return 0;
>   
>   free_fences:

