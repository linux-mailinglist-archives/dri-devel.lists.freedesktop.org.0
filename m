Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579E243431
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F056E314;
	Thu, 13 Aug 2020 06:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C36E314
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 06:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjPkTQrWzPmLsd+XwZ9UNOFvMCREQ5kGY6SB0cw8MWoIfDv4YnMNdgJU205enyIpqQvzPzoCDt3wdi+ORNJjyK4qzA5NXIPXUT2UZb/BCDvy5utLpSatrAQ3UR6MT6NN380jNxxLt9pJ6XZZQt87X8vpHXNjHzer5y5vObN6hmrzDD1JYduwfRBfEu5wHnZbytfUFZFrTDM4PGNWIjAfLunH5qQ0wZp9om1V1mlSB23Y5yRZINw851/OFpHSgnDsXu8mXgp8EcEOgydmRXBLYhqvYKStxlGriaPEa85InIiQBm+Bhj4+vyAGDn9QrKnBaSXBMVYiakVvhRo1gkc5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQyYbddJcbaAJotwqUdcIQNKNUPPxaWAlM9co7i7KMo=;
 b=P2Momxa3MvVVzgZbvEtd7srztUuJJWVvESDRc2v17oadFv5i6/+u+ekpWbnGbgz36oHMRVX6iLaVcZVf1eemCjvsEKhvgMjeeHaY+Tys7x97HK4QMK9dFakMztyyi++4FwYs4UhISS/P2G+tQ/lMCXcb8F1m/VLmcWln3Erh7+H7msdexJBsxBJAWgLY5X6wZvk09KX4bjlB0rgx7xR1YDw0YWc3utCVW2sTqxWiVx1bkZF26f5oj/+aIscInNxn9q4AyoddtHeZr6c9zmfHQdwrchP8rqyDvQ1POQbcT/jXc9miDAo2WSYR+dCxW+v4oRZvyTIRWybYZ6uSinnGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQyYbddJcbaAJotwqUdcIQNKNUPPxaWAlM9co7i7KMo=;
 b=zR2+V6k5e3nvYStrXSTwmMl16ZDY02W3VXvtTbZuY3KRRUiCzEGMPbyHdrOVCSHyMnuhvIcQ17SA7/myracxlPQUcQrWInVrCSaZcpsqlWd5yJEVAZzJJYwENs6CuDoQ8OcAEkz54sXV5m7eC6X5MhS/bS2EXMxh8CeIfKEQBOs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Thu, 13 Aug
 2020 06:52:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 06:52:17 +0000
Subject: Re: [RFC PATCH v1] dma-fence-array: Deal with sub-fences that are
 signaled late
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20200812235544.2289895-1-jcrouse@codeaurora.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <439ba3f1-0b0b-7417-f306-c10935dbdb16@amd.com>
Date: Thu, 13 Aug 2020 08:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200812235544.2289895-1-jcrouse@codeaurora.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0101.eurprd06.prod.outlook.com (2603:10a6:208:fa::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 06:52:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea82b92e-6024-44f7-8403-08d83f556aa6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3936B49437503FBEC247805983430@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9djE00l/vB12ayBykUVyI09oIjuz7A1eU/jfm5locqXLWlDEkYqLKWJWuCQqvZxogbQ5VtyyE99niYa/JXhnqvFv0Lq7V8XNqONl/CseW5MLMu3iFv6qgI+4FU0KF+SEaLxoQlNi9L7Z1CC0o4ciSkWYg/SjxhACOGirVIPuIqSWubXkWCnvCjwYwTHR98UtIlJDLOU59uu/ozHpDhKLKKaL32oZNfEOkiGV484rgTuFErq5o85P6AP+2RDgXvQ1TazB3db3Nq9pq4ncoNq5SwtuUofOCzP+YT9NmrMOzMUy69Yc2To8Wbd3gg2lHVjF8IN8BAtzR+k6qPkYTDIAjo0QBGRAmZ3Ya5H2zcdC/E2lAUlrQassnGkjCf+RIkZ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(8676002)(66946007)(316002)(186003)(8936002)(86362001)(83380400001)(54906003)(66476007)(16526019)(2616005)(52116002)(66556008)(478600001)(2906002)(31686004)(4326008)(31696002)(6666004)(36756003)(5660300002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PwCKQd2l3q7SKebLip+4ghTfyz4h1A2hAmd1EvLmQP+9c9i8qyz+kDBFi6hEL3IGFHe6Wqmd8uVfBHCFC2h+PHgR+QP6mYMXT0pHDfTlTZoesOb2+0UvWv6vJpwdHoC2Mzp6DdVUcc8U008gWsXdhyr5DG4Fm+blA9mPtcg4fuVi2C2vk/AGc6sWKp0hJJeb+JQBoSWOFxVwpvQN/Ojba5lxva8yO9+E0orNsN7gyXVS3WOtu+RwFfew7OMQXBz5odmszjPCn/xvboBdjSqdXyYyvFa1UIVsfksU6wj+pSym06shmT2QMZBK7Xq1kuZTXXWconKVl9CtIetf76RcASRb3gaLo0HT397SMCh5Luw3xOb239zkcFjvKX6K6z+tstC6umUtRG6zcoI0OyAKXa1w3s+M9qppL1R5tCOVQoMizL9kt7MSfhl4UlqXed/kAq+cFAKKXtHtT7UrGA4uK5ySK0kijBubi2SPBTtldVBbYa9May82+S+AkP5k3Y2+Fa90dKc1PmuaYNsveQsqqAfiFwDjYQUwDc8UJfKBnRSk+tw5jrtwrvh0Z+HgQsCXinyBqWCQ7bCcYEL6Qq3CRxog7ZQQGrips8vyoiegudfSOGNvwFrMcPQWUUavY5diTzgpdhtlVX7qyu9UU1xHZYPDHNSiYZtGu9NddWxdzKyergzumpB0KKpxZryq1EaVbJBpj2tBeEcDj66/i/JSXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea82b92e-6024-44f7-8403-08d83f556aa6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 06:52:17.1590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGDsT0rbBApFGqB22UGCaH3BkSCvhv5jbKaDpI+U9D/E3cCOigA2l/yz1NhC6UK9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
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
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.08.20 um 01:55 schrieb Jordan Crouse:
> This is an RFC because I'm still trying to grok the correct behavior.
>
> Consider a dma_fence_array created two two fence and signal_on_any is true.
> A reference to dma_fence_array is taken for each waiting fence.

Ok, that sounds like you seem to mix a couple of things up here.

A dma_fence_array takes the reference to the fences it contains on 
creation. There is only one reference to the dma_fence_array even if it 
contains N unsignaled fences.

What we do is to grab a reference to the array in 
dma_fence_array_enable_signaling(), but this is because we are 
registering the callback here.

> When the client calls dma_fence_wait() only one of the fences is signaled.
> The client returns successfully from the wait and puts it's reference to
> the array fence but the array fence still remains because of the remaining
> un-signaled fence.

If signaling was enabled then this is correct, because otherwise we 
would crash when the other callbacks are called.

> Now consider that the unsignaled fence is signaled while the timeline is being
> destroyed much later. The timeline destroy calls dma_fence_signal_locked(). The
> following sequence occurs:
>
> 1) dma_fence_array_cb_func is called
>
> 2) array->num_pending is 0 (because it was set to 1 due to signal_on_any) so the
> callback function calls dma_fence_put() instead of triggering the irq work
>
> 3) The array fence is released which in turn puts the lingering fence which is
> then released
>
> 4) deadlock with the timeline

Why do we have a deadlock here? That doesn't seems to add up.

Christian.

>
> I think that we can fix this with the attached patch. Once the fence is
> signaled signaling it again in the irq worker shouldn't hurt anything. The only
> gotcha might be how the error is propagated - I wasn't quite sure the intent of
> clearing it only after getting to the irq worker.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>   drivers/dma-buf/dma-fence-array.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index d3fbd950be94..b8829b024255 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -46,8 +46,6 @@ static void irq_dma_fence_array_work(struct irq_work *wrk)
>   {
>   	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>   
> -	dma_fence_array_clear_pending_error(array);
> -
>   	dma_fence_signal(&array->base);
>   	dma_fence_put(&array->base);
>   }
> @@ -61,10 +59,10 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
>   
>   	dma_fence_array_set_pending_error(array, f->error);
>   
> -	if (atomic_dec_and_test(&array->num_pending))
> -		irq_work_queue(&array->work);
> -	else
> -		dma_fence_put(&array->base);
> +	if (!atomic_dec_and_test(&array->num_pending))
> +		dma_fence_array_set_pending_error(array, f->error);
> +
> +	irq_work_queue(&array->work);
>   }
>   
>   static bool dma_fence_array_enable_signaling(struct dma_fence *fence)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
