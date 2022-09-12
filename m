Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC15B54AA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 08:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D198410E192;
	Mon, 12 Sep 2022 06:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B046810E192
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 06:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJUWJyaL5+XNO+pE8zm2LEdWXCRsr9zMoLrkfdhqq+bv6TXaUnjtLTmeRcLO/VvmZ7/ZQqRGBQosQ7y4gDwAvUiiETydHwD/Y0szrP70mW/mQXbookF2YQzCQaFfpLUegMcjPPDcWOsiJMZ6FKjJXRlJGWg7EYBl7EIm96KKZ4x5A1PNYTo77lEie5Wm933GGP2IUffUtv4jrxVIz1+NekEVvUb17kdt0ipDzBRJYgMNoZFUyBsOQh2AIiwrFpOaphU6gNI1JT0NTGMlJMMMY3ZjacG11Ju2gbt/yP7x7eqgSCYMbiDuzM12IhdXl/uqfwm7/Wb4Aje+MTXQ/8P36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0AJbi8v7jPAJ+qzJjUpE0VrZ/EyCndcHEld+PfnUgY=;
 b=DPFpsEBcuiikHzYvLftwqhL7Hek+92iGyxn++415m8rYWQH/nR4p/OBEJ8UEO1ZzqZdz+A/6WUJ+5pmXW6cX6rIiZ9ZVgyFkKhqhKU6tM8RvjE7P+R9MddnB+stlAuMtAC1zIZlXl+F+L/YLepDUnMl3cNlPPTjTUzxlQBSTwOMR//gQBgWoMChom4HxgIVcaRF4NQFnt3ncYb0ndFfwT+aGiVEBqnXKenGBjgIp8XCeDwBknSpf4c1AgrHHGzXGISqCkBLzhrS5uDS+YcZwa13jkNA5suDbBW9OS2JlzmzdbIUoh3jlt857DIl0Qbay4QaQYpcF9UtD6lC4gRygVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0AJbi8v7jPAJ+qzJjUpE0VrZ/EyCndcHEld+PfnUgY=;
 b=CsMnu6wBOaCqa5z/YDDBnc4VHu/NKWGKHolgqovXZJTqcNBD1XJ/Xj0ISTIWI7KpO6XU1lMCSQ9DMfGTLiTdDmP0yHQ+4wRpsIvBGIrEAxj9LfuUXoTOPI/rpdEvI0f187P3lGrvLOf9NfCz6cXvqOEkLY9ddSrRuxi+lsv4Dx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5405.namprd12.prod.outlook.com (2603:10b6:a03:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 06:44:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:44:34 +0000
Message-ID: <0658c1ee-ba64-711d-241b-8fc6f510a50e@amd.com>
Date: Mon, 12 Sep 2022 08:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/6] dma-buf: Remove the signaled bit status check
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-2-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220909170845.4946-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ba2985-6291-4f28-fa1b-08da948a4066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymQtl50FBGF2Hv3yffPrXWCV49lpWH9gldjkVdMBaS2nazhmcOqon1nRChcyQjR2+aweg23SSUXbHC/bzSjm8irOjqU/Yqs0d2Lxx+irJEn1nLEeJvH2B8FU5R5/qqEoYCQiWQAvBfkSKFw+OV584o+aYCgRGeltJWGYd9KA3JGHNpexBnJcZ4lXHmpPkfeFOZQKYoijOVAu6uLZKIMa5lk8vksIVCDq5JIde11vIzwegRMiypUNxNlNSr91uIC/NeAlfBM4CrJHzvAlfDmZt+yn8LDpuEOozt223nqR55H6CgygtSQIHvdDvFNx+dXfpUd7DS7ztnXf1t8wqto12OE43I+fYRh13D4nM4iWq934I2HwlFxdeYBPPKfMp1/1BfY9/vFI2eP3F4HEuvYxjhpdbXx5evzD62s8VI3xLgePh7x0rwuAvQnrI2a/CTI3eyLA17Hw/Xq6iRArNhs9VBEbCc0UiMY2zw1rfrg5dYS4RTfHiDYWfLKUNFGNTfxtk0a5vTuTIkDkRdThIroBI2rt5F+zk02d0dWkOVMO20L/FIMC2zcE5+FeS2WzluvpARlDX/DuU3tpBt7XILqBsEDoaLGu6tlEk0MzZMMUR0PVSxZkTCMxgy1moHjg13b9wWSdziSglbCjjRw2UqSRG+DLxZFcm5sECV4S5xkyaPIV22f54MhSqke6PoqFAcdSSgyj1ECv8LdsIvxtXg4zDKn0neL4dMdcBY5hLYQyAavymh9YqAD1hcS20ky1ptm35TaZRY47yGPRTEYe+7qko7Fmi7qomcoSneKyGpi6EhCKBh9KGpUsaeLdEmyzyb6h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(186003)(2616005)(8936002)(5660300002)(83380400001)(66574015)(6512007)(86362001)(2906002)(6506007)(31686004)(36756003)(31696002)(6486002)(6666004)(478600001)(921005)(38100700002)(41300700001)(8676002)(316002)(66946007)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE13R2l1WFRKUk5QaTdhaTBrc0JWb2ZLSGk1eDV5UnZFRDNWQitBaXMrbmJj?=
 =?utf-8?B?b1d5d2pDSlV0WHFuRTlGUnVTTVc2NGdCRHdBZWVNWUZ3dmo4V3BVbE5FZkEz?=
 =?utf-8?B?cG5BYUVqOUpLUnRsVGgrdHhoZHA0TG5rd3dWajM2eHNBV0NQa21Vc0ZIWFpP?=
 =?utf-8?B?WFJEbE9WenhFdVJhcGdwakxLNVVsbUhpcUZ1Q3MwaXFtYlVDdnBTSzVWZDRa?=
 =?utf-8?B?TmcrdmdYVFNmbkw4ZFlSblVESjZ1QWR2M0pxYTRMeVowQXR3ckJXTkw5dmVH?=
 =?utf-8?B?M1NtR0lHcWRhVmlkRlBnd0EweVlwWS9UNFpzUWJLK1J6c1A4bWhLTm1QVHlQ?=
 =?utf-8?B?WTFjTHBSeWdvcTZ4dW1YeTVnRUJXaGdrZjFLZGZKWUgvQjY3OUJGMFZtMHFY?=
 =?utf-8?B?Vi9DRC9ibDhTSG1XeThSemYzV05OaFM1YWFhSExndDIwZ04yVTVnaXh3L1J3?=
 =?utf-8?B?KzU2QmJUU3FqaHNSTnFmWnhTYS8xbjlDZDFNVlhTL0MrZ2w4andWeDlDQXln?=
 =?utf-8?B?bmVQMnh3MFZyc1lKdzg4L1A0TXNKMlhvQm9yU3dqOEpNdXVabjdEaFF1VFFy?=
 =?utf-8?B?SEtNbTRwZ1Y5a2lWdWlnSmpnT2JiOEVsYnMrYmlhNnVsL09MNFhZM09qNmJL?=
 =?utf-8?B?WWdYT3B3MGthS0pKRUlpSmRCNDUyZmZaWlBXTmxvWllpWXBkMDVLV29jTDZt?=
 =?utf-8?B?ME5tY2dqcHVzT2lrc1NmSy9tcVJCQ3BzOXNUcklWUnVEZ0tnNDgrbm40VmNP?=
 =?utf-8?B?SlZ2Mmh6OVZkYVpkTEdqSFE4VmkralZ3WVBEcUpPR2RBOUhJSHlRWEZlSTZo?=
 =?utf-8?B?V2h3RkJHcm5zaWIxMWhPbGFWMUNRMzI3ckxKRW1BSzV1Vjk0OTJBUG83dTRI?=
 =?utf-8?B?V2JOWVo3d0pOOEw4NDFlNzVYa2l0QmIwdWpwYnNmZDVialpYTlAvanNXRXZq?=
 =?utf-8?B?bEhaRFV5WFZvRFlwNE9aS2kvMlpzZmFDSWpEOGdET29Tb2ZvN2tnbzZiR3Bs?=
 =?utf-8?B?a25Rb3VVaUtFcE5CNitZdGl6TlhWUzhxRVcwRkhGYVFnMjdzL2lIQkdkZkVO?=
 =?utf-8?B?aFVyb0lVMG5jL052VDM3eXZvZEc4NXJSRU52R2N4Y1JSVkttRWgrc1VQTlU2?=
 =?utf-8?B?NUkzU3ZGRUdZRjh5ejJyK1VaK2ZkZ2plblpYS290QUlsUmN2ZEwwNmdQYnY4?=
 =?utf-8?B?RnI2d1YycHUvQ0ozeEdCbXJmck5MTEIyQ1hUc1ozQWNGMDRoTm5qOExVMm8v?=
 =?utf-8?B?b2RvUWdSdUpDcktCWkpUK1c0cWhwNkVJK0dLMzZJREJlVGtLUDl1UVlRdHdr?=
 =?utf-8?B?OXV6UU9IckgvRHQ0NUZZQ2J6dSs3VDZDV2hqd3M0WkhrUHhHdEFlMERmSlQx?=
 =?utf-8?B?d3JGaVlKVEFUcE9IamRMamh0RVlxODhma3NmWk41Vm5ORzl4WFNwQW5Tb01n?=
 =?utf-8?B?Zm02YVAzbUdJNkRsV0VkZjZvamFCQzI3R2dibzl0c25ZVmpOeC9QMEN0T2VD?=
 =?utf-8?B?czdpcWsrZVRhTG9pUWZnNkJjT2xWQUdQczAwUFg0eWhnVmxBaW0yZVZlb2hL?=
 =?utf-8?B?Rk5sY25tYS8rU1RYcTliSThBU25RVXloV255VEMvRlVYQTBmQmVkZlBORWtQ?=
 =?utf-8?B?QmtjaG1HZjNqT29mM3JRc0xRKzZIY0s5ak5OSzN0OVhocHFJUzdWajcyMGpx?=
 =?utf-8?B?MWdpYi9hTGVhdjQ1d3pCUzhId3h6VlpUSHdpL01ZMXFCVUlXOGJBYk9RWC9m?=
 =?utf-8?B?KzlTZUZtb1ROUllTSUYrcmVFd3FtdGxNUkZFRzQxc3NNWFlmODhYRTBacnVu?=
 =?utf-8?B?UWxTRFBoRHBWaGQycEN0MkFMQ0dmUXEwQytDVXdkZ0tGZ3lyNWNRVk5uRG5H?=
 =?utf-8?B?QjQ1TEZNOTdvOUlFMVlqdVNFcVpzMTl3NlVWNmZxbS8zZXBpUFV2T3I2YzBj?=
 =?utf-8?B?L2dMSTJvNlpiYmcrSFRGV3htZzJwRThLTGx5YTMrV2hzVDF1VEZFNkh2NG56?=
 =?utf-8?B?bTFWaGx4TEJNd29DZ2dLQ3dBdU1mRmloRUE3WjZoUTU0S3NqSTRwVW5mdkJ0?=
 =?utf-8?B?bFVNU2dOdmh4VUgwNHBXVmtnSTRuSytCU2hhQm5JQmpwbUs1bS8xZ0lGNVRl?=
 =?utf-8?B?VDkyWVkreXZDektyQWQ5NmNvVnhOTFcyZDhxeXF3ZlZQQTlVV0tqRlI4MTZV?=
 =?utf-8?Q?orr8p55zofqAb6q8t1bnxrnAX1K/G4jKSLnrxLkpTaX6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ba2985-6291-4f28-fa1b-08da948a4066
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 06:44:33.5890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzDQ7fmXc1va/OIwPd0tCFjSs8FQePDWDTpLV801PXhTHtD8OCc5PvzPA87O8UzW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5405
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

Am 09.09.22 um 19:08 schrieb Arvind Yadav:
> Remove the signaled bit status check because it is returning
> early when the fence is already signaled and
> __dma_fence_enable_signaling is checking the status of signaled
> bit again.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> Changes in v1, v2: This new patch was not part of previous series.
>
> ---
>   drivers/dma-buf/dma-fence.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 066400ed8841..64c99739ad23 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -601,9 +601,6 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>   {
>   	unsigned long flags;
>   
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return;
> -
>   	spin_lock_irqsave(fence->lock, flags);
>   	__dma_fence_enable_signaling(fence);
>   	spin_unlock_irqrestore(fence->lock, flags);

