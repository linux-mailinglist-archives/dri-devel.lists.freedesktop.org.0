Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82577CA7F5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 14:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601BE10E1D0;
	Mon, 16 Oct 2023 12:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AC110E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 12:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1nPwwxgTuy1qkenXlPU+DQzdKhA6qUQ5EofkeGngnsHhA6CWrW6hFkfzsJ5/7xlLrs0KLIgtvREADsBh4X/9Zy2Jv5zhFhIeBH/+xPEpXZKULQTqI/bT5Fusy7zINrcpgdTzJvi4Lw22ducYWnyOkK8tvzlqYmZjXzbOnSUEAxaeMBIQg7ZT2Yt33UGV1g+y76HUTYHT+cCghCwBdro++Ad59VHacB56sw9s4meJlnkZ90CnwbSYA2xeJPXkamYDuMj/RZLKyAUHFl6K5bLahrLU5liBT7TpoTPKwDwJ5k4rhR0elW9ktdyGCske8ll3ZI7Lq06zRBCBPRIRaT0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zxhZVn6/bz4XtYN48ZxeAPZMHzmgKfW5Gp/NHEvsbM=;
 b=U6wZ0lfVZ9g1qrfE0VpMQXgP0gaijlKkzmHezmJYey9RHuf4Ok7h7yfcpJm2cpH46XEZAepUUYZ3lBo71DBumvfOVt0PrZhwoKExxPVkRGuJN3B3ORfsXThfJ136KMEhXwomG4olhovKKamWFrE0kkZRrN5lQtHE80Ho4BHkEOSb2emPxuAe1n5WN9uU1niuYVv9VqCee9/JVb2OOEYnpx/3XXz+gKoCAAxykFUh5VdGVioljXQUL63myoOiMRdpcylDmlzN9fBacXpwmT+ulY9F7d0wHz7Me24RCvmri7pzScC5CjOos59MTxT0MSrXWx/sTQvgEk9bNEPKA761ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zxhZVn6/bz4XtYN48ZxeAPZMHzmgKfW5Gp/NHEvsbM=;
 b=ubSjgyzjO0MBy1AKGQCWqNkHF4w4oOL09fSLX/5W9NDnj7cV/gkT8OkispHE23v7a5X62baXXPa9npmbJbW9OiAkLnHWewLeXr2w5X3zlORir0isjDLccwmblP+tb7ozA0Q9bq9iC1eul3RqTd6IVIjRoyffOfa6WJVGHlAhfhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 12:29:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 12:29:00 +0000
Message-ID: <d9816efd-7677-4c72-9f30-3049d1df05ac@amd.com>
Date: Mon, 16 Oct 2023 14:28:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Reorder sys manager cleanup step
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20231016121525.2237838-1-karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231016121525.2237838-1-karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: cc59d46a-d349-4bfe-3f9f-08dbce437975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJuYGAVUphmbYrKIJy+073f9Y07fMFj44tYp2yRRGbX0TyRDXW6p2CUJABkz80W69tATovwXiVeNcOKvGuR094q0CITZ+PwK9REt9V9H93qsFMxndtpA//KqjQZ4spvAE85hSsC2RLTaVtCb03qM2LWy0rH6BIU12WR39PAyfYRxqQuWioQTMAfWFQOoLjkZFlhPwWj8+qhsG0eg+pisJC/aFvnSDiMx0QoqBi28TyqEGf9q8wNVgi3wwx09K41jQiA1O/jM5c7LsgvFimG+JtN2+QkH7ImvkDRNUrT/4gaRC7/KQAXp0lR5l6NNiGPf9BgTt5j9MTMVGhTQc5+Hn8ij4HbM71IymoGoEqCua2AEgwtDBxSpHifRlSDpW6WC0yGU+NDZ9XQ1JkEngnXAx4ggl9Rnbfc3KgHSuP7UmxD9x7ehD+JoK76ASPtopaHligYDEET0UxCkvtTf/brCMJlOGLvH/3rpg3tPiIa5iGpNnR0UoEMKra4xldjsrOfVYELiwc3WslKccHN5k8JKB06r4hsTBKAQD8t3aVXcz5U0vDn216LVAm7xGVuMGMbjH1UpAijeujCn7bm/0E8XSPGmiFEKaUY7v4OMZ7Ea4jYzzG2q+npl68lIpx6B0iWF5Jiq3EgqdJOB2JMowJDkEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(316002)(478600001)(6486002)(66476007)(66556008)(66946007)(6666004)(26005)(6506007)(2616005)(6512007)(8936002)(8676002)(2906002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVpjV3JYWnhWaGwveXRSem5CbGo2T2huTjZqbGRwL3ErNjNjYy8yTzUyQkZZ?=
 =?utf-8?B?RzJISnRyWnplVlBqTVRoQjJxbU5Oa1FiVzdYM3lqUkNaSUNmdGYvcXFLSFZ0?=
 =?utf-8?B?cTZrOW1hSEx0eHM2N3JNUURZdUZGTTNISnFHMkJrbm9LbmJScTF5MGI1WUVU?=
 =?utf-8?B?Slc0bU1YM2F2UkpHN0IrdWJwWHhUL1pONk5Dd1h4MFErZ2Z2ZFpKZkJxeE5r?=
 =?utf-8?B?K2lWNGhEeWpYbFRqeEFLa3F4SW8zTWdwdkRFZUxLNzMxWDRsUHpzSjJNVjZI?=
 =?utf-8?B?V21td2ZtTXJZSUtUNnR4VUVtK2gwcForaEdoa3F2bFYxMm5acElqQUdIMnhX?=
 =?utf-8?B?aGs1c3l2ZDVSZzRpcDlCOEtpNWZaTUI3MjZ1R2pqMFI0OEl0blN6ZVpCbnli?=
 =?utf-8?B?a1ZEbEREdk1hVFpCVktNTUJhcTJ3OTVSb2xHZEs5Q29qOE1mUVpQSFdlQWZq?=
 =?utf-8?B?cUJEd1RLZmltcG9mWW9idkk2azFyRHI3ZXhGb2JwSmtwb3NzbVRPdGQvQmVS?=
 =?utf-8?B?U05obHRkcmM0aUx1YkIwdEJhbXVJbW1LaDh4SVExdjBXSUF1UlJhZW8xT3lI?=
 =?utf-8?B?RkJBY0hHQkxXalBNdko5Y1FhRTgyRXZ1Qy9oMkwwRytldC8wUjc1T3A5UEtv?=
 =?utf-8?B?ZGU5WjBmaXVjaERMUG1PTFJ0NHh1Q0pWdTA1L2EzM2hwQWdKOEpsdkVoNEVD?=
 =?utf-8?B?UzNyRGgxSFNXb2dhVlV0Rk5LNVVXYk01SnFMZUVJQWhweTBDUWRjdXNWMW5N?=
 =?utf-8?B?UXdFZG9Ba0NBc0dRMjdNVlk4WHVwa2VyOG1TMkVnYmVkK0NlbHUrY2FxZmRF?=
 =?utf-8?B?Zm01T1BzV0Y1a1JUb2VNamRRVm1kcGxYMDE1YmIycm1rVm9vUXUvaWU5OU00?=
 =?utf-8?B?Y1VROUxqaStVanFITE54dkJDQi9aaURMUUI4QVFRUUVOd2V1NkxZZFhsdGhZ?=
 =?utf-8?B?S2dLQjd5Ry9CVE5Zd3ZjbnRaZmhtdmxJQUpUUWxMeWo3VXFyUUc1R2RzdjdS?=
 =?utf-8?B?R0dWKzYyWVZoWEljaithTWRxT25JZWI1cW5CcmFzMlQ1UFZSMnZ6dnNJVzNW?=
 =?utf-8?B?NU1Ea1hPRDJBVmpwaG02dktFL2sxRzdyYVYxRWVNcnpVYTFUTkZvb1hrK3Yv?=
 =?utf-8?B?R3l2bC9ZaEdVdmovQkVUc0J0bmFVN0p5eGQ5S1E4VFBFQ1UyeFRNYUlqTXdM?=
 =?utf-8?B?OXFhZS9uNzlUb1pCK3hCb1NGb0dqS0hIVUFqVlNyVmtNbkY0L25KcU5XVXJG?=
 =?utf-8?B?OEhCeXNhTkp6OWpzTkFsMHBjc1RrRkxwMGtQR3lQV2I2VEl0VTRjekZmc3l0?=
 =?utf-8?B?OG1KeGltbjBOSFpTN0RRRGQ0dTFXSUUrTHd6WVU1YzcxL2JsL2xIWWxyazdm?=
 =?utf-8?B?VzZJUjQ5Z1czNG80eldpZ3QveFY4aHJMbzZrd2pLRnNGbXoxT3VOd1duMnl5?=
 =?utf-8?B?L05Ja1dzTUFiUnRXWmtEd1RmNWZRb0hnY3pZZHJ0YzBuYXNSYnF2a0tnZ3VY?=
 =?utf-8?B?dlVxL0d3NW1xbXJuc0Fmckxmb2hwMWQxaXRwaEZhS09JKzNqdDg4M0xiZjlI?=
 =?utf-8?B?YVNqZ2dCRGRZNHY3cGRSb3VkSHRmZ3QxRkswVXU1TkdGeTRvWHdPckdrbDUy?=
 =?utf-8?B?dzJ0VWhuWUhTaXlvZ1NCdzRoZTYxTUJ6K0pVQ1RmZU9MUG9Kbm5aZ0o5aVpX?=
 =?utf-8?B?Ylh5QTFoMHpjWXY4MG0vSkYvTHNiUUJCRGpQcVhsbWRIMU0xWjVwYjhWM25Q?=
 =?utf-8?B?UlZLSDJSTnFGdHJacW5rMHJ4TlZ0R3V5bzFqekt1eVNWL09ZOURTclE3WFJ1?=
 =?utf-8?B?SERRY2ZPcXVHdEJkM3RkYk15eWt0M1VyRzZxUzlzVGlvbDhmbnFQdlJaYVB1?=
 =?utf-8?B?bWhkUWJDdVZhQWcyRDI2QWtoYm1vSkVmeXl1WTJ6eFZ3Z1lKODhXWHlmUjU4?=
 =?utf-8?B?UkNlUXQyb3NFbTV0cy9acFQ0K29uUDdjN0w4aFNkVGJNOVhpYnA3cFJvdWJB?=
 =?utf-8?B?UVh3aWdXOFNBK0ovZHJsV2VYTVhoOTFOQUlMNnpYcVJRK1krbW5GdTNhWkVz?=
 =?utf-8?B?M0ZDc0FTb2pleHRXZWR2N0c1YkIwQzVZbGdSM2NyTXpVQVFrVTdGMzJST0NX?=
 =?utf-8?Q?8rPs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc59d46a-d349-4bfe-3f9f-08dbce437975
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 12:29:00.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o8+T7Snv1PbHB4hCI7ZLi63L8OmW8xg2CRLU/OhfQ6pVOxzRcXWz+Eojz9zPjoB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
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

Am 16.10.23 um 14:15 schrieb Karolina Stolarek:
> With the current cleanup flow, we could trigger a NULL pointer
> dereference if there is a delayed destruction of a BO with a
> system resource that gets executed on drain_workqueue() call,
> as we attempt to free a resource using an already released
> resource manager.
>
> Remove the device from the device list and drain its workqueue
> before releasing the system domain manager in ttm_device_fini().
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed and pushed to drm-misc-fixes.

Thanks,
Christian

> ---
> This is actually a reiteration of a patch sent in [1], but the
> solution and commit message changed significantly, so I decided
> not to send it as v2.
> [1] - 20231013143423.1503088-1-karolina.stolarek@intel.com
>
>   drivers/gpu/drm/ttm/ttm_device.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 7726a72befc5..d48b39132b32 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -232,10 +232,6 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	struct ttm_resource_manager *man;
>   	unsigned i;
>   
> -	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> -	ttm_resource_manager_set_used(man, false);
> -	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> -
>   	mutex_lock(&ttm_global_mutex);
>   	list_del(&bdev->device_list);
>   	mutex_unlock(&ttm_global_mutex);
> @@ -243,6 +239,10 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	drain_workqueue(bdev->wq);
>   	destroy_workqueue(bdev->wq);
>   
> +	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> +
>   	spin_lock(&bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		if (list_empty(&man->lru[0]))

