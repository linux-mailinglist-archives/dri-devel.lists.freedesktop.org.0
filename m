Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545283F0382
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E706E560;
	Wed, 18 Aug 2021 12:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C0E6E560
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuFapMxmOtsnS1nCkXZMWsK05D3trcrXc3EWQ/1+xR2qdv12rhIKSLi3YCOtcJfdnuMCY6WmVA85lz2q1MWcGPqVEXgPhBUhZ5KPo9hTf5S1Wgk1bsmUMpweGeo4MMFTBgfm5WWBgouVEsvSed2hR0vzhqqQ49DxL6DnRvgABuPGqO5ST00GbVyb+9HfS7+/J0hPM0BNyDFFbZjj6ICxhZPfobWb77QsaYcCa3m1S5a9N1ytoxTqPpKTRNla10u2mS5e/uhvD0YayPtljpfCNI8Y+WZpC8Ak/1tJgUkcAQ1aIpRBCaQDwLD58pfmAIPBm3EvRJNttRdRliOSZCeIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2CzQ4qnRmTpFp8Ic5brvXedKe3mJIRclOFidFdyh/c=;
 b=PamQrVBf/+auBAFD6Dz42itmA6RGLLdIU4tLzqaMi8ZTiDcZCVMxnaiPC/n/ceIffw5KPAiWGzvmUe16hO9BBXf9Ayovf5XyAJpNvp0TSyVG4GcYviwzyS6BT6F+YXMKRDVTabNN92WcJGQTIA5HCad6Pch+qL1HCruk2IxvpVIZmr0JPzX9i7CtlAksTT67UmVvWTJaztdfRe+PNrJTr1be4EOo4FqjAKZwShPkCAjMogL0q5e7YYuzwcD5vb1zbHmotFe4qgXyZXA6ikIay3di+qbHUDqL5wxyJ4xD74M6dXkK9+LCQrHnUrKJZ7UECn2fvGw6o9rCMnLZJ41wyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2CzQ4qnRmTpFp8Ic5brvXedKe3mJIRclOFidFdyh/c=;
 b=2XkEqz/YI+X8kFd2h/eHCmBIDdh8FLTOcuMGMrrN08xrV1Li+o6IlgwL39dVhkdKoqu8ux4zgI3pwr1hS7V60gsC3Ui7x0ffksEKGAkm7j9ntuG1FBi3UL1U0iixW/hlpEw5wsSB9wkgMRl7MDyk5hTnU9//uGfrVDhZew1cLGY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 12:10:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 12:10:04 +0000
Subject: Re: [PATCH] dma-buf: return -EINVAL if dmabuf object is NULL
To: =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: Rob Clark <rob@ti.com>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20210818115810.274084-1-nuno.sa@analog.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
Date: Wed, 18 Aug 2021 14:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210818115810.274084-1-nuno.sa@analog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.55.180] (165.204.72.6) by
 AM8P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 12:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c18616-ac9e-4dc6-f542-08d962411c16
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB489868F3BDF4BB570D41C81E83FF9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3jrUMDO5vZ8nf5QRHimqG0FuEHdE6vughU2nEobI92ZffKpI6RNtL61yIQdQKN/tCXy0uWBnTD3OabSC5Og+ji58pHRX8f/tcD5IxI88q9ffzIvwO2rcABub7QKRK8Bb3rX8FnRURvPDuDsDiByHdMZfLm6KM7AWvnusZzMKHn5gWFZBd58TgNH/0f1M+5H/gU30kEzAr277WtjF5mleB4WRUz2r72siGdlkE/0Ma/zBvIclrD2KzQDyZ5Y0xzidgJf75O91U3TDxl/9IeCfvU/nPPQwetc3+sQH2jHgAIq7OJZZLSVr+cb69aRGY4RHLm0+YjxRbw/aj8xAelwcZnFsOIUyZT74wpI2FB0bszTSp9SxkgppcbWBK0wil9B52h0BiCDvHf2KuaSKPQT9o20oTcC1NnTVuW/ezKBEiiVCHRp/Pds0zfgSAW56jq/h/+T5GxIy2c6vCdrnCkflb5i3zi0INUcziK75SJPUfFNZIhwc928uJFXwLjgscqaduwvSgMZEQeWujsgFEtX78WdpgJ3VgDYKCrwdX4u94z2lt4fdONrX/JKBxkPuxRCwR038N+a4U1lrL75HB7n77MyU61SVxRfKHjMrKpDt2qBGalGrG2TgM6bqqV89jsIYAzteVWOCuOmZs8rVVskFovPa2BsEYYaf2lGMo96qJIZZJjMtXqoENp+WAXuZj53/RuNPz+7+bwY3hmDpWeVynV5bFi0y72kXrOFCJy4GY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8676002)(6486002)(26005)(38100700002)(8936002)(2616005)(54906003)(316002)(956004)(16576012)(508600001)(186003)(66946007)(66476007)(31696002)(2906002)(31686004)(83380400001)(36756003)(86362001)(5660300002)(6666004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1kxc2tsUklTYlB4NkNzTWNIcFNaWTdGQ0tkSGhPUlpqTVRwMElpT0Zod001?=
 =?utf-8?B?ZVZLQk1ZYUgrZzhJbUQxV1YvY0tHelUvWVdDZXVFMHNFT285MjhUZDFCNzd0?=
 =?utf-8?B?VlpKVmdGbGNGMEpPNk5aR2ZJVGlySGtuckRDQnlIWWsrTlR0bXpUMUNRVXBU?=
 =?utf-8?B?a0FBeFpqaVlPODlabDQvdFlYb1ZGVUdKTEhCNFdaQ1FyeE83cmxJcWpuWkNp?=
 =?utf-8?B?UDJFcy9pU1diVlBRV1Uzd01LNnNkYkJZKzVtaDFJTmNIaGp4SjNBWXFiZXhm?=
 =?utf-8?B?N01hR1lvWm9JWkMremt1N2x1VkFTaHlwdVZtRzR0R2JOZTNUYUpUdk10ZGtn?=
 =?utf-8?B?c0dzUHpxbVJJZlYwd0F4TXRlaDlBWTNqQllGVzBmQklPOUc3Q0lYM3dKVmNw?=
 =?utf-8?B?cmN1K0RORjNrZVBRNnhMYkhyZmxmR3JYYVBBalpwWFBRQTlWQkVVWkFSdDdL?=
 =?utf-8?B?VVdtaEM3K1pvRHB4STk5RWxZWmRDN2J2cXczNHkvZlg4anYyQlJEYWc4S2ZT?=
 =?utf-8?B?M2Y5WmR1UG8ycUJSWi8rblJYQ0FNeTdMODgwWmRMdVhOclRxOG4zVFJuSEM2?=
 =?utf-8?B?alc5K3BMVis4VUxVZHc0amRDRmVYZGxoWmNzME12Y2lvd1dUcnduTGt6bE5u?=
 =?utf-8?B?UGN2Zmw1RlNxellId0ZsU082VGNPemlkM1NPN2xXby84SEozanlhTFRsSkZL?=
 =?utf-8?B?MVdEUDBDS0xJdzVUaEUxMGlnVllpaytsL2xiYUhXZ3lwRHBnTUU3L3JaOHgr?=
 =?utf-8?B?UWlVOU5RYnF6NGZIQTlDYjF4WmRaUW1WbFZSL05ETVBWdytFZ2FoTThRYzZs?=
 =?utf-8?B?YXI5WUpJbHVnd1crRW5YNGhteGFmQW54eWVHY2ZxN215Qk81OXBpZUxIdXBi?=
 =?utf-8?B?akdOTjM1SGMyWTFXTm5GYnFpdVRxTzh2eXNoQ24zem8vaEJ0c2xacUg4ZkVB?=
 =?utf-8?B?QzU2UGhxc1RSbitlbDMvMWRpdUREa2pNSHJaM01XZjlhWUs5SmJ1TXV2aDUv?=
 =?utf-8?B?VTUvVnBNS21CUFJEK3BpanVhWWR0VVZuV2thT3oxNFI5aTRDMC9uZmZuVjVa?=
 =?utf-8?B?NEluMTQyNFF0THVMYkFjUUNKL0hZQWYzSzIrYnlqOHBWcS80R2xtdTExWk1Z?=
 =?utf-8?B?dEhnak9xZm9iYmJJbDE0SjI4UmRXVWtCTkhlS1ZnVHMrSWo5SURxVUhQMFFy?=
 =?utf-8?B?d0FUam00MSt3UEFheHQyTjg2SjN6TW1PNlpKT0RWWFo0TTdKdGViYS8yZ1I5?=
 =?utf-8?B?cGdURU1YWkdvN01xSEp0R2Q2WTdxT0JlcHdxVGxNcWd4cVpvYkVoYkpKNTRP?=
 =?utf-8?B?OXc3aThIM0tPajBIL3dOS2Vqa2tWdi9aWHdkRmFadFlRL3BETkdoWXNhaWtu?=
 =?utf-8?B?a25lZkxoMWp6TmxRWDdXTEZZdGFjdzEzTk5sdm1Rc3gxRFE4NW1yUkxLMmFN?=
 =?utf-8?B?Q1JUK1pncXZwbGRpckJaNjNTTkFtQXo5SjRXSkwvMFFtMDcxeGdZU09WTWpW?=
 =?utf-8?B?VDhCV1ROWnk0T0pIRUVPS2xxYmpIdGs2M3dXRURURUIwRnBjRlRPMnp6aVlO?=
 =?utf-8?B?K3N6WTdrWnpwOVk0TFBHa1lpL1FOcWwwVjVRZ1hubERDSWtmaTZlby9qQVJL?=
 =?utf-8?B?K1B3TjJnWU9uRm9Gd0pyQlhHMnJwQ0tjb2tQOHQvSVFyblp5Y2h0ckxhNjV1?=
 =?utf-8?B?aSs3NVE3ZUdlZFVWVGJnd0IyZ1hBaytBM2Y0RU1JR0J2Z1kvU0VTZ05teFBE?=
 =?utf-8?Q?9pLkIgFhB2iEAHaXC6288RHd27g55QxejZ1jbjC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c18616-ac9e-4dc6-f542-08d962411c16
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 12:10:04.0034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaQhZJ1l1C/uOdBT/dFwMv9ulV6urJyfwCeCkz6qL+qu8HhfZLrqVUWgPVM9GV53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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

To be honest I think the if(WARN_ON(!dmabuf)) return -EINVAL handling 
here is misleading in the first place.

Returning -EINVAL on a hard coding error is not good practice and should 
probably be removed from the DMA-buf subsystem in general.

Christian.

Am 18.08.21 um 13:58 schrieb Nuno Sá:
> On top of warning about a NULL object, we also want to return with a
> proper error code (as done in 'dma_buf_begin_cpu_access()'). Otherwise,
> we will get a NULL pointer dereference.
>
> Fixes: fc13020e086b ("dma-buf: add support for kernel cpu access")
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>   drivers/dma-buf/dma-buf.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 63d32261b63f..8ec7876dd523 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1231,7 +1231,8 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>   {
>   	int ret = 0;
>   
> -	WARN_ON(!dmabuf);
> +	if (WARN_ON(!dmabuf))
> +		return -EINVAL;
>   
>   	might_lock(&dmabuf->resv->lock.base);
>   

