Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043A43B108
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3896B6E3F0;
	Tue, 26 Oct 2021 11:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09006E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEiYQ2COP0ltYpVhZI2cUJEgp7uYRVbGdiuw1E6l62tlg29QAXrNFiT/ytMnILSdincE3/L6mpTOCMSjKNSdH6pA5sSDAkw7Nvi+i+WOZa5qCKk5PUZKtN05VcOi25hsgGcM+/8Hyz+JSUr7QOJa3OTiS8EEXGRSioCJKQ1pB5PVd82Yz8rOjEtjmL6sO3UoUeC4UFau4hQmUGKszw+t4qyF8sYXu97QYJQoBJxgeq2jbwUDQzjV6IVhOGVHeXZQNAuEJklvDyA2JEZpLMZFz4RyqEOakFiJMkqFKLUG4Dmv9SlIP+evKTs+KzmzEyMVgi/AydZa/0p51PuVcStZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH8FxJbKNh1Zn4BwOQsGJObTEtfvnvBkY+82WJiGyhw=;
 b=oMNFruGXmS9ffgTG9WdV5JjDFLDcGkRTGUGPP2oCbv1QDfSMnLXsWlTkrYF0PKjGm/Il+SB4Vl+Z9Z8EdIYRZvP0Z5rzBK3smR2pTt5B2zSVQd66b6Ui8D7Er4TCL93sCC15vCEO80R4pzpQk8ZowcdugOMf2LPblj8XTTtMVtQRrjgaR1JSdt3O3d9xbknTsZahe29I5uH27WKN17aM6aJpq4WuFHrV4ZbTJbAHcwlF/0O4iW1kh4J59P5S98vWL5oTyYBnwa3ytwAGBtgxYM3Ku/dKIIEifD7v80BqZEJMuwRieFpW/qrSDAwkCzYguusbXN1VCqlZdM0SNu2uBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH8FxJbKNh1Zn4BwOQsGJObTEtfvnvBkY+82WJiGyhw=;
 b=1Q75ZSsxXCuyh0qLVG7pJQV629/Xa6O+cwX6vwQXMpkZsmdUu3lU1jCTYaMim5t4ap29GEX4ryqTX35k2VxPrqv7/wLrbvzS3RBTdsCNDFkwMpB1sgRsVF928BHUxUUQdi/ZxgmVmQNj5RUIWN3nn7pY598QD9rg8HVC7rNrBXY=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1839.namprd12.prod.outlook.com
 (2603:10b6:300:10b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 11:19:03 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Tue, 26 Oct
 2021 11:19:02 +0000
Subject: Re: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To: guangming.cao@mediatek.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, rdunlap@infradead.org, wsd_upstream@mediatek.com
References: <20211012084109.176542-1-guangming.cao@mediatek.com>
 <20211014102551.54983-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0e062f12-7e79-5a05-1e7b-10dda8e353b7@amd.com>
Date: Tue, 26 Oct 2021 13:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211014102551.54983-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0354.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::9) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4969:85a5:71fe:e4fa]
 (2a02:908:1252:fb60:4969:85a5:71fe:e4fa) by
 AS9PR06CA0354.eurprd06.prod.outlook.com (2603:10a6:20b:466::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13 via Frontend Transport; Tue, 26 Oct 2021 11:18:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01341e0b-2847-4214-fe21-08d998726a39
X-MS-TrafficTypeDiagnostic: MWHPR12MB1839:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1839EE2ED72E7FC554A5248D83849@MWHPR12MB1839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5Co4O7qV9ksZEnyrpfX7sSc9HrveIKaRc3vJc3c46DCyd9EAjR8ObgRodKG0CCwMD/60l2bgPGNZGKtMVXl8gMaxtUVhnr9Np5p1i6ruwviC2lNJzVLJCvxZwNz/adITr3YMpDqR6R9bSW01Q56wgeW1gd+esT4AGaPuiRr1u6OXl5xNhS/pPCLvrlL6z9PjZq6ulmUa3vmmbzgYs+xeVrvwtE6vcMVr7aSmB9ODlZ/cDaS+go+mis4asTslaAOaYHx62MfSgzLlOMZumCDMzv+9Y8QrJgHXM951mpMwyR5uZoadyyaMBnqR4BBbEMrcju8aObSjv6v6tFjsT7ZywNb7tA1gCLQc9GSKCkhpDzRnBsmB5wwGo79OZ4Q6+jKOMXkPGLlYvGfWM68k8hVMMv4gjyj6bPwssdlL+KcrgpBLHH14akIjWxs3xlzKKza/7xOU8zeqvgu9m7F2Rq/7OgsReWiSfv8sxEw6rOTMR7Irl9CQO3gipU4HwuZKYTyCLf+eJpce2FDdgjY09ZnOwdbYqfBvPlhXTnl5iliWXdOSTqrGUXLDsP9A7Fnyuqz6EUBzW6/foOkIw3yXErq7W5vrvsRPKLUDhhpACP8KAgpAmnxO+kgoNql6EQSwzAOWvdWcZuJC/aRnOzm+2iBYeleR8/R2T4uYgoR6/lhf3oXu585F74JEMon1di4XHKMdMEEMlExCBjtzfvNtEA86xwjHlj3Nge3UjyR65jTEDGY0CjVW7tEYQMYxhOdnVF4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66574015)(4326008)(2616005)(86362001)(31696002)(7416002)(83380400001)(38100700002)(316002)(6486002)(31686004)(66946007)(5660300002)(36756003)(2906002)(6666004)(508600001)(8936002)(66556008)(66476007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkc5cXdzS3Izek5iOGxaTGZzU0JwSEZ2M0lXTHQ1eGJkK2VaenhYNnFubkNF?=
 =?utf-8?B?MEFTZWN1amMzVjkxVy8vRnlKSUVlNGh3WXo1SE9GdGhFdmMzOGZRNzR2bk1I?=
 =?utf-8?B?K1pDdis2RUZFSXlld3pvL01NREJ4OU5JRjhrZExXNGZ6ZWxHQVN1b3JwUFpy?=
 =?utf-8?B?aEhBcG5Tc20zaHQ5OGJ5QzBHU01qVHRKdlpwRlpucUNnaEU5ZSsycGJYTWVT?=
 =?utf-8?B?ZUFGZm9YSkw5MnFYaGxTMmJIeGdYVTM0RWRnbi9QNUxId1UyQkwyTkRmUzNL?=
 =?utf-8?B?TjdLVDNBcktrcDBpUGNaejhTaG5VMVBHL255MUVFT3RiRHFPdFFQS1RxbEJL?=
 =?utf-8?B?V21Lb01tQjJEaTRaRmw1dFVBSXlxZ2JLVldBYUZSQ0F3Q0psUWlwVkw5dWxu?=
 =?utf-8?B?OHEzOU56WnZIVG5mMXpEUTRYR1BkWmRrd1dkcHBoM2NmdmdCS0ZTRUVwZEtt?=
 =?utf-8?B?ZkVwRnJad2dmWEcvbld0MldybVpBNTYzUEJOYlhxNGZlcFVkZUxMdnRBZFEr?=
 =?utf-8?B?aG1jSDFFZGQyV0NvcE5qbDVkMk9JbWpoaWprVnZlZTF1WHBuSjFyb1FYalNp?=
 =?utf-8?B?bWxaS2dwRjNSdlkrWlJnZ0laY2tlb3ZWelBtQlVmLzZwL3loTFMyYzZRcmRC?=
 =?utf-8?B?OUVMcTN5b2dtRHl2Q0p5UG9zNmZhK3NoTk91WmZlYXBzaExWY3AxcHJoMnNZ?=
 =?utf-8?B?bmRPNEJpVHgwcWlPRUY3WndVanFZM3RjaEFpOEZ3Sm8vUVJwNmF1bHRWV0NK?=
 =?utf-8?B?cWJ5K0twbjJzOXRnaktnVElKVlJhVklzdzJJY25GQUFzZVl5WWk4MDFneU9w?=
 =?utf-8?B?Vk1uL21CcEc5emN6bFl4d3BlakpKc2lueUdkM3pQRE1jeTd5Y3lPQVFEek5q?=
 =?utf-8?B?Q1lyMUk4enJrY3o4SlBBNXdKK3d6WG5Sck55ZG00cHJpMmhJTWxwalFtMzU1?=
 =?utf-8?B?SXdpQXJzVWFudFdYUGtHeVM0Y250VVNPNUNUcUVxaTZkUmw0Vyt3NnprKzUr?=
 =?utf-8?B?UDJuMk1Zc2hRdEhmVlR6OW9Ydkp6TTNkaGdNbjJRWXlQcUNSejN2UEpjMFM2?=
 =?utf-8?B?em1vT2R2TFFRRUxTQ3diQ1NNL0tpTVV1elRiMmFtb2pjK0lBZGloZW1GUVZR?=
 =?utf-8?B?YWxYTUx5OFZES1hKQllNOFdjMVVZOEFVWXZXblhIT2t5Vkk2d2FnSVlKZzN4?=
 =?utf-8?B?Y1FLWTlEM2kxdWpuZk5qdnZqSExPdWlyS2pjVzJCZWRNVkhTaXJ1UDI1Szc5?=
 =?utf-8?B?NDZwcXZZdmFiYmo2dW4rdVpaVVVJczV2SkZiYWZrWUx2RXdzRWRPTGxEaFJC?=
 =?utf-8?B?NW1hdWxRTnVEYkUySXJQT0FlMTYxdjI3UXptT0dIUmZLWlZyTnh3SkhFSml2?=
 =?utf-8?B?Y0pQTG41QTNIOTRjOExvVDY5cWpMV3ZpTy9DRFQrNjRqTHZqMEx5Q1IrVWtO?=
 =?utf-8?B?NEtReFdqMzA1RnF1OEUrOFBJSEp6RmY3eVVXdWR1WUJJUlRBWDl5UFpZcWR5?=
 =?utf-8?B?MjZhaFlmaW9IWnNRM1NBWWVEa3RXWXdJRkduNG1lc2o0SjB2cU5teEQ1bWJN?=
 =?utf-8?B?ZkVqWXEwRXRQQjMyTWtIRDk1a0J3aGVqYXRuNFY4UGJnemV1WDFncCszS2lr?=
 =?utf-8?B?bmwvdk0ra1JqTGZoQnVMTGozTGtudGVBNWNXOHMwVHRkczNReWc3cXFRSkxl?=
 =?utf-8?B?L014eVEzaXZIZStDQ1pqS2IxaGtGaGNTL09DZERqNXowREh6ZDd1em5mVDdp?=
 =?utf-8?B?eHI1NHgyUDVMTERlNUtGMHZhK1oyUjBORWwwOHpHQ090eDlQcjZYUFdXZStZ?=
 =?utf-8?B?Zi9WVTdmYnE3UlA0QlpWbXB2NTBjU3doQWk3bDlQWTlUbTV5VVVTRitqRXBq?=
 =?utf-8?B?eWl3ZXNrV2swbURPUVRROFFUZysxcjRlMHJpNHB0S2xrU2JMdStUL0JIek9G?=
 =?utf-8?B?OHN1UktXdGlHTmVnNXZicDA0WFdzc2VMSWlPS2JkSDZ2Wm1xYWR3SCtpUjNK?=
 =?utf-8?B?WEl5NXEwWlAycVA5OXpYcmVKRVljalpFTWJJczdKNW1QWEE4N1BuNTI3Nkxv?=
 =?utf-8?B?ZERVQVN1R1B6cjY3U241QytaYi9JeGdCMEY3d1BmUTgwc2NKTitubTRiYXJH?=
 =?utf-8?B?Qm1YMjBjT003ayt5ajZqSG1uT2swa092VXhpTHVxZmQ3N1lqYlR6am5LY0ZB?=
 =?utf-8?Q?CgmapkGlkaEanPFOIudZgHU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01341e0b-2847-4214-fe21-08d998726a39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 11:19:02.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMFfbPJqt46DFs4/pSsoYY4wzJl1hISpMgtbuGKX7TQM/SIUGfjbJqn4dv6/m7Xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1839
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

Am 14.10.21 um 12:25 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> In this patch(https://patchwork.freedesktop.org/patch/310349),
> it add a new IOCTL to support dma-buf user to set debug name.
>
> But it also added a limitation of this IOCTL, it needs the
> attachments of dmabuf should be empty, otherwise it will fail.
>
> For the original series, the idea was that allowing name change
> mid-use could confuse the users about the dma-buf.
> However, the rest of the series also makes sure each dma-buf have a unique
> inode(https://patchwork.freedesktop.org/patch/310387/), and any accounting
> should probably use that, without relying on the name as much.
>
> So, removing this restriction will let dma-buf userspace users to use it
> more comfortably and without any side effect.
>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

We could now cleanup the return value from dma_buf_set_name() into a 
void since that function can't fail any more as far as I can see.

But that isn't mandatory I think, patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..5fbb3a2068a3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   
>   /**
>    * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
> - * The name of the dma-buf buffer can only be set when the dma-buf is not
> - * attached to any devices. It could theoritically support changing the
> - * name of the dma-buf if the same piece of memory is used for multiple
> - * purpose between different devices.
> + * It could support changing the name of the dma-buf if the same
> + * piece of memory is used for multiple purpose between different devices.
>    *
>    * @dmabuf: [in]     dmabuf buffer that will be renamed.
>    * @buf:    [in]     A piece of userspace memory that contains the name of
> @@ -341,25 +339,16 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   {
>   	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
> -	long ret = 0;
>   
>   	if (IS_ERR(name))
>   		return PTR_ERR(name);
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
> -	if (!list_empty(&dmabuf->attachments)) {
> -		ret = -EBUSY;
> -		kfree(name);
> -		goto out_unlock;
> -	}
>   	spin_lock(&dmabuf->name_lock);
>   	kfree(dmabuf->name);
>   	dmabuf->name = name;
>   	spin_unlock(&dmabuf->name_lock);
>   
> -out_unlock:
> -	dma_resv_unlock(dmabuf->resv);
> -	return ret;
> +	return 0;
>   }
>   
>   static long dma_buf_ioctl(struct file *file,

