Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F553D3A53
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 14:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D396EC2B;
	Fri, 23 Jul 2021 12:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D976EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 12:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSvkoFP+0WgtNuQrrSzGngy5PnU1G/ngzZ93bG21f7VL/mhh2uWmvZ2xPvYKVW62Sfxuz1cVqGFAGA9reg4zTBxIMe2IY4RWGbHK8G8xgFtYpOU1dQi9feka7OHEyqTF4lbXFNOARwFHz2pv8dwwTIwbLFQ945LsdA1gFBH1O1J7zDfEa1oC9Ukis3DCa00rjAu9TsUSciufW9H9oHiBEAUZvXnR+PRJ+NqfUySY0L2szsXxUwffR3IW3qqEtG2/ukY93MdDDqPTNweRjqizC1iGMwbzZNNfqk6B4xj0pznY3DmkN8oETX+45MYdMcvXHQXLeqFhlHdTzR1+VPYCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17BJ+A+Cc5O9NEHfK6tTa6wCNCnayhVTsjcCXD5rLU4=;
 b=ei6lldzxP0s13OtfEvy6SmJZIfqfhHsWyyjQCI0hws6wKxWla5yZmx1mV5V0tuXYTiSbeCKmJIIY4rCBUSon/9RHWO5lDG33Z/pN5WxAz29AGmOqY5cNbo61X8NdAklE93JMDio/oR8tN2xfeTrUlqbId5z4dhNVTwAJGwsdVN8AfMt/FI3w8HQ+igi9e34DGoM2VNZUEYB/f0boCC8KqXXvNAxGvLR9MNYm893fs+KL24vJXGrlJaHsU/2UAq4/AgzwzqfsTey0MM9icUPxio3Mcw3VhiAGcsg6u5ExPQhaKliZtH5XCpOknMJl6NA/xzJXWaun0GErfF1oRhZzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17BJ+A+Cc5O9NEHfK6tTa6wCNCnayhVTsjcCXD5rLU4=;
 b=I5rM9K+CNsKqTav7ZDkMB8FtuNs3xu7/am/eOl8YNjbx7FnYcd/5S9fX7a/4rhv6R9ajqwMW2KxxGfuWskaYLyHzetqLAXcUNJzIUAzKzhA/2q2VYnu5O8tca2MV0/8+SXLsHpVLiPXEVjMKyet4SGjtIXbLHEh6wYWx1t532sY=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 12:34:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.028; Fri, 23 Jul 2021
 12:34:18 +0000
Subject: Re: [PATCH] dma-buf: WARN on dmabuf release with pending attachments
To: Charan Teja Reddy <charante@codeaurora.org>, sumit.semwal@linaro.org
References: <1627043468-16381-1-git-send-email-charante@codeaurora.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b057b0fe-75ae-d872-f500-a307543d8233@amd.com>
Date: Fri, 23 Jul 2021 14:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1627043468-16381-1-git-send-email-charante@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4ae7:63c0:5e49:6388]
 (2a02:908:1252:fb60:4ae7:63c0:5e49:6388) by
 PR0P264CA0085.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Fri, 23 Jul 2021 12:34:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 723abce7-5b5e-479f-c837-08d94dd63065
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4111CF20691913E345EC211583E59@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AGKMy6Tk/BoqskVWfstwgwltvWgFp9aYmypnhG7E8ScLAAYQn3XvwrfHC2YLwDre3Y2TaTAzDrS3R4Y4IORGS1Iz4xudWiAlPPEgvBD3Cqz8HYi/nw2y7QEsvrB1A6dNhC0XDVNtK7Sr534dFK/pYuxZxxTYfgjVeCc1EO1v4oQENqv6Y1m39aiIY9jzI+JXQyGbjESjddn/MG1sjGUj8gIhjOGm2qDi6eIuKOWsopVr3t/lbQlY9nCp8ptOfpTWNJ/+TSkBFBMACPrkqkK9oVw7nw9U9oPV29GS7Y7wqAwWqumwle3gqDElEofMNhccRAASoYVciDLaW6FFnFQFW8UOFLJhKE14jsUEFnPeJtjbvR5E9m4E6qgGfyaLQgYLby6TolPQz/+8WkkfjS6+S0kEi7tmCGWQDeJeWwq7XuGHEt0GvTCjjWQCpt+V3m9ZWQGSq3jXUmSA0YZmEy2nOtpQ3S00IEBF0cpMHX54+0IUa8hRfoa9b4K3ki1hUN5cygguxfvg7TBWNILFKeAOA4L5FLubKlQC06PhWZcIBwz/7OfbDYyfog69pV3TZOnkD2hr5fHVmgUXedD/OTtkc1EMK3fKKLpjrbstyCTuoug0eQHjVHt8m2ElnGgeKuF1/sTmW2NMTLAd+6RGlcicOsUrOoF+1zHnGaAKhspYTklA1qexoRFUMEb9aC5RJspqhnVaZKRiiGAZ1yi9f3r/ccKnjWwQI1x10u+cfnAB/ceOMhjbujsWCRShU4KCKEY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(83380400001)(31686004)(36756003)(31696002)(38100700002)(86362001)(5660300002)(8936002)(8676002)(66574015)(2906002)(186003)(478600001)(6666004)(316002)(4326008)(6486002)(66946007)(66556008)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJOdnhyU1FsOGVidHprTzVubkRZdzc2RzBGSk5Cclp4MlF4RStnNTdYSkJ5?=
 =?utf-8?B?WUlTZmNHL0R6NmF2L2V4ZjEwdTYyYWVIUG5OcDFBcWJVbGJQcnV2dFBsbUh2?=
 =?utf-8?B?RTVLR2V5MjJtZmtxZHNzU0hYNzAxd3J1MzdYMlcyUFJGZ0YxWlhFclVuQmdZ?=
 =?utf-8?B?Y2JSbE9zY0xldFQrOWlLSlpKNkpxR29vOHU5NVVHZVR4eEd3QURtSmZhRmtK?=
 =?utf-8?B?aUd0NWoxR2dPUFZCakVDUU1UQkVkTlZKeGhORG1FMlBVUi9DYW9KNDcwNG12?=
 =?utf-8?B?L2liejduUGJxc0ttSVU4TmN3cEJzUkc0QnRKOEw5d0hlOG1GVTlrRnFLWEZ1?=
 =?utf-8?B?K1UvUW5kdHFIZlFHZk11YWI5cWxEMHRkUU0wL2YyVVZNelBHZDdEU2RHSURt?=
 =?utf-8?B?NmlKampyRzBveVlwQnNxQmdHS0pKOU5wWngxR3JOVXVPS08xR3V1TXBWT2dy?=
 =?utf-8?B?cy9FbE9yQTYrbHRPRDJpMVU5QXVqSkJCSHpsWGN5WnZqSWxyL3hEM2RheW9o?=
 =?utf-8?B?YldHU3lyNktJWVlhaS9hOFVlM2hjQmJoM08vNUliN2JZT0ZtRXRYVDhadEFj?=
 =?utf-8?B?Y1hWWGt5K0lwa0E4ZjV2bEQ5NUt2VFpVY2xuekZhWTM1dGJkaTR2TCtsa0tD?=
 =?utf-8?B?dXZsdy9uSTNpMkUySzE3VWNrUWJIZGRQT1lEc2E3NEp3NklvNWZYamNjQkM3?=
 =?utf-8?B?S1dHVXdETE5VUGs1ekF1bDJLSGJjUkJEVTk1RW94c0FHN0c3WFdPbXlUNmo4?=
 =?utf-8?B?MjJwcXQvK2RNOUw3NHFFTkl2MjBmVUxhNzZNb09SY0RzWTJmQUpZS210VTk1?=
 =?utf-8?B?NkZ5Zk54NzEvWkd5R1pRMXdOK2lVRDc4R3FLcFE5QVBYQXdaTzRNWUlXc0RS?=
 =?utf-8?B?L0VqUDkwRXF5Z1gvWUZXTjVHZ0tjRHd2cHpaN1hqc01yOEFnaGJwYit3M2R5?=
 =?utf-8?B?YjQvcjlBMmw2NHgxYW91NktCWnJaYVRqWHEybGdidUpHOGx0bk9FOVZheTNH?=
 =?utf-8?B?M0VjSTVlS3oxVUZUV3dzNzU2bU5jNndIR2pwaGk3c25ya3g2ckxudlM2ZVpJ?=
 =?utf-8?B?UStYa05pbjFXVWRGVGdIRVBuK3F1YitWYm9JTHNnYkZkYUhzUnpkQ2NBQXp6?=
 =?utf-8?B?cUtvV0JqZmdJdWRVU3lOd3hKV2RvSHBOM0YyeGxBTzdNcFd5aDBRV0VrK2c4?=
 =?utf-8?B?SmplZ0hVU2VmNnp1WlVobGVISzc1RWhlOGRnQUYxaUozOE9IRTgxUUxPU3Ba?=
 =?utf-8?B?UzNwQS93amQramQ3SFVWdGNxaS85alpOa2xQdWQ5azRBV3dBeHdXSy80dWhV?=
 =?utf-8?B?Y1JtYThjeEE4NXRZYmhxN09VLzBSaUk4UC9OK2pHcVBVQ25GS1NsNzZpWjFE?=
 =?utf-8?B?dUVQUUg1cW9LSG9mVTNDRUZNMzdMaTNDNzYzM0VPQWV1UkdWbElRZy9PajNH?=
 =?utf-8?B?ZGh4Sm5CTktjTnFDeU1oYllGcVdkMjdEZ1k3UHNTUExRcy9ZUlYvZ09YQmly?=
 =?utf-8?B?eExIN2RGRVJ1cXRUbksrdW1OU2xXTlIvaGJXUlBOUGFNTXBUeDNCUVliRUpL?=
 =?utf-8?B?a2I4NkZpSU5zVy9OT1JLTWhYcy9PdUJiQXNXTEh4SEJOV01vNjBQMGNkUmZT?=
 =?utf-8?B?bDU4RFAvekNPTnZKLytJeFR2VEt6bzcvZndkcmloZ0Vqc3FtOTNmeEtHNzhx?=
 =?utf-8?B?cFFiVW5wOWIxVCtHUlJYOEtHQWFwamIxcWthQTh0dEI1SXY0Wmw3UGxoenpN?=
 =?utf-8?B?RGJjdXBJZmQyTDFkMWRjNDc4a1I1Rjd5SUgxSW8zUk5xakV0eU0vMnJ4eW1W?=
 =?utf-8?B?OUV0MFBxa2JFWWxpNzRaQ3hCakNNcGIyN1dKZVVleDFOTWduR3ZWQms0MXV6?=
 =?utf-8?Q?c/FfwW8zh9Xnr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723abce7-5b5e-479f-c837-08d94dd63065
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 12:34:18.2161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGrVsVmWeL6nii9JwK1n1BCUNWvwxIeaHWWqdvP7+ViSXCiwm723HjETn6QS9oIF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: linaro-mm-sig@lists.linaro.org, vinmenon@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 14:31 schrieb Charan Teja Reddy:
> It is expected from the clients to follow the below steps on an imported
> dmabuf fd:
> a) dmabuf = dma_buf_get(fd) // Get the dmabuf from fd
> b) dma_buf_attach(dmabuf); // Clients attach to the dmabuf
>     o Here the kernel does some slab allocations, say for
> dma_buf_attachment and may be some other slab allocation in the
> dmabuf->ops->attach().
> c) Client may need to do dma_buf_map_attachment().
> d) Accordingly dma_buf_unmap_attachment() should be called.
> e) dma_buf_detach () // Clients detach to the dmabuf.
>     o Here the slab allocations made in b) are freed.
> f) dma_buf_put(dmabuf) // Can free the dmabuf if it is the last
> reference.
>
> Now say an erroneous client failed at step c) above thus it directly
> called dma_buf_put(), step f) above. Considering that it may be the last
> reference to the dmabuf, buffer will be freed with pending attachments
> left to the dmabuf which can show up as the 'memory leak'. This should
> at least be reported as the WARN().
>
> Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>

Good idea. I would expect a crash immediately, but from such a backtrace 
it is quite hard to tell what the problem is.

Patch is Reviewed-by: Christian König <christian.koenig@amd.com> and I'm 
going to push this to drm-misc-next on Monday if nobody objects.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d..733c8b1 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -79,6 +79,7 @@ static void dma_buf_release(struct dentry *dentry)
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> +	WARN_ON(!list_empty(&dmabuf->attachments));
>   	module_put(dmabuf->owner);
>   	kfree(dmabuf->name);
>   	kfree(dmabuf);

