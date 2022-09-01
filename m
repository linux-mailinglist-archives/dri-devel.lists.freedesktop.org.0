Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6835A910B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB27C10E64A;
	Thu,  1 Sep 2022 07:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FC410E5F8;
 Thu,  1 Sep 2022 07:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPG0t1a2d6ycTpZIduUFcLk+dCEvP27AJaT7Vs3uQzE8CbLjYUDeEuhn1q8xJrfN9GXPRhJrIrshSIExVfX6a076U1Nfgv4vEDDjf/kGzNhT4n74FT/TcXqhuvWUe/v1EHACy3sHtkz8CbC6CtQyJfbqK7v+mD3a7zSPYNNtilw1baQKtl4XZNIdm6b8LPo+caQ/xr9RTp+4tXUJTfrMEwNdPTYFCGsXTZiPdCRum6rT6pEad93h+gzg+r57TjYjePs5Mtgh+nW8hfqr0FTzv4ONTzamPvR8e5mc3fkToDTk1akGStHQDlxMCjcf68Imq/lMTd/9WgWhIap1wk/5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/Bdyndzcla1GmGf06qfQ4CIfG9ZrhA2pOhkF4w4RcI=;
 b=AzXNO/Ebgs7KsYboZQ81Sy9mXuqZse2alEpRnI8UFdmC36QKnTbaqkUYfMF/bc84LUJO1O8LNobeayXJdMd8B1+vZ1ulcTfN7V8vn9utAeTKDa8VIcIuGRY43YD6T6EKFu+VoG6YORXh45i/dQ5Z6kuDUJcQWVWN6HjAq1i9Hi0mUYUTA++ku9cm6teMExm4Rh0MZlcxU8taIL/OJAKU5tE5hM4jP6TJ/1rAosqC716u3cEBjvNbJPZH+9i7EACPlQ5SnlxUP0u5+sF2ShnC7d8X4MA8y//6QJ3BlB5zbOLr4W3/TGMV1nI6KgiPlzWN+R93zPx/ZPJxTAPGItBBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/Bdyndzcla1GmGf06qfQ4CIfG9ZrhA2pOhkF4w4RcI=;
 b=QHhWeo5JdnCPYgnKYkkB4WTvB4iI0sk32s+d2dQqETr8PVjd5a633escMfpuCZ1RBQkUpAH+jC95L2t4yEY26qWRpru2M+T5XcUfeha5T9pAoJv5XqBONOTUnX8aWnzb9NpkCU4hZ7eTJuuBS2dyTIoiB/OxJ08upO7PH7L3UoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 07:47:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 07:47:11 +0000
Message-ID: <fd3ceab5-585f-c814-5df6-408f25e96354@amd.com>
Date: Thu, 1 Sep 2022 09:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 21/21] dma-buf: Remove obsoleted internal lock
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-22-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-22-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e46d7f8-95a1-43b4-ab5e-08da8bee2dac
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7068:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G04l9/jWR2wcOGf4mzqMHPpFHGj6dRta1rTvry398jlRnBYgTPPgoNz8A8LV0ejXK5MoD4hlKvziGfZzBoRm5M/bZieHhjEflISu4+0G6gwRA6pLSwNHVeI9i7xkm/83vIwgkX4JAxMZtP1JrbJ68hatX68KyIW8RquOYllAfmRLSpfX6p51SZqluLqPwlnV/7EH0GEEK+ctpGI5BdeQc+DNaUKB4TnnP/X7mTj0Gr71uME5l3BYDj+VN61qZOP7A2zlB3Vukl8CKeJC37mpFKIgaS7Byyhp3pOUTmK47BTC1slgYL6IKhdPHQ9vNW+JettpXcOLr8SxqBOoZvbHaybGsqhOmjMQEIjsMT49ReWhA50rqtjno44PAqnkNqOE0AQgBUQrgT7iQweyWQ/uN4Vst7yF4K42y799A1C1FRpPabOSSvd6OLAdO7jYjMfeA4s9ozYv+p8dljYzTqE0qa51VwcHKt60j5PaXTQW3g1cs9z/dBy0EK6KqJLJKdKKqbgrXXd5PeetxFrJkaGU17HYIbT0nSnourNArYUeNLdNcniSoX2U/WIraPjpplTssF5s+1kIWqe0XHPshBoZOiaGye24FCz7zgFFn+85tdaFt4+liBWJA6KOc6UnLka7tUJZPZ+aB5xdnqXAsVxpY1zXK2+ATj7P1WjOX5aZspcW2G1cWygdJSn93GUbQNemK3dPlVT5HkvizxfZ4Wyii+/DcM7EQxo4AIe6750du1PXToYDiDGezZv63xrcKlTf/rMSTNcEUlWRSK3ONJ66OK941P909SNWJy7MDeDj8a9LQRVfbvNJtDcm33nlKUxx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(31686004)(316002)(110136005)(38100700002)(186003)(86362001)(921005)(31696002)(36756003)(2616005)(2906002)(83380400001)(6486002)(41300700001)(8676002)(66556008)(66476007)(66946007)(4326008)(478600001)(7416002)(6666004)(8936002)(7406005)(5660300002)(6506007)(66574015)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzNjYVh3bjRSREJWbkcwTTY2UFJ6UFptZExGRldSanB4RXhncGkxTEtuUHNk?=
 =?utf-8?B?UXBzVGNoUC9xVHE5TGZYa0RwbGE0cFcrcmUwamhHd1llMkVHTkMyQktGOGhh?=
 =?utf-8?B?aHpBVkl3U0FyVGpUc0pZK2Ywa3lOaTgyckZIMUtlQXBXTjh5NkpwbkdHendZ?=
 =?utf-8?B?UVE2b0hVK2FTUVEvWEUwVVR6b0FqNERHVjlnNVAzNmNKNnlkMzB3di9iTFRi?=
 =?utf-8?B?SDE2eFhpYmIzZEdGUFBYYjh2ZVBZcnJLNFlFMDlzYk9aNkhzY2N4SmxCQU1X?=
 =?utf-8?B?cXJYSTl0ZzBFSS9nU0w0bnBPQzlPMkczVXRDZDR0dkJ6L3F1ZW5sRE02a3p0?=
 =?utf-8?B?WHJkTGF2QktuVnFKK21LV09CK050dW56d0o3c21qMWRGVnFvenhnMG1vVURr?=
 =?utf-8?B?bWwwYTBTc3VaeUUwVGNmZThCR3NQQXd6S3I0bEMrbVFMSENpSzhEZWZ4MGkr?=
 =?utf-8?B?UStYVStBbVo2elBnbEFTQllxdFFoRDNQWFNDL0lYSm9JclpzSnFncUZSSDRR?=
 =?utf-8?B?SkxNSTg4eThlTjVuQXRTZzR6cERSTDZwR1FqZTJCYnV0MWdtb0Frc3JIdlh4?=
 =?utf-8?B?WHB3cHFIb0NCK3EwMWxMRWppWmdoMU14eDNvTWxZdXNjMG9tbkVoNHIwRXFK?=
 =?utf-8?B?eW9od2hXT2hXNU5yUVhEVFpVNEFoYVI3ZC91MEdrMlUxc0hIUHg2VDhDRTMy?=
 =?utf-8?B?NjJpTmhNdDFUaXQxYVN5WnZUNkVIcFpLUjRVYlY5cmpMazd0QUZSYjhqek1j?=
 =?utf-8?B?MkxlUHBFbDFhclpVU3JIb2NtRjg4bzBYNUVJSW5pUEFKWExuTUpGb3h1SjZo?=
 =?utf-8?B?VDlwNnE3MlhuRGJqdUdxb3dsWmMvME5tQlBZbjByQlRTVkh2U2g3U0t3Q0ht?=
 =?utf-8?B?R0FFV2VwQ0RyVFlVclRaRk9FM0l6MTRuTWFYRldqYWNwYnRwLzRIdGp4QW9v?=
 =?utf-8?B?d1Y5Sms4VHdmK2J0ZmgxWUxERGZjS0ZIczAxN2l5dkE2Z2s2Q0I5dEJlYjh3?=
 =?utf-8?B?YWhVYWNpZmwrdWhWbUJUTGwrSWYvN1IwcFAwUi9jMlgrZko2cTF1WUhITXR3?=
 =?utf-8?B?SkRNbXJrUEZFZVZ1bitveVA3U2RhOWhZZTFOV2YwdmtjY0dwUVFhRTd3MGdG?=
 =?utf-8?B?bk52Uk9nTGJZdW9ZaDVHUUx3NGdkNlFWbzQrTmZsMFNyaTlXZDk1SUVlSXcr?=
 =?utf-8?B?dklUSXh6aHF5bnp4bEROdnJUWjhQd2RZdVZzQ29iOHprK003aEVUVzY5dHo0?=
 =?utf-8?B?U2gvazlUWkdxSi9wSFY2UFFnZTBRbVJnVHJPOXlBRjZ3NHNCQnc4cDk1OUZS?=
 =?utf-8?B?b2dzQnVRYmZaTlhXTldqaGE5WHpkcXhvem0wQWRzZVVod0xHbGI4V0g2b3Fh?=
 =?utf-8?B?aXpoTysrcjZVcWx6TCtvU1hZcWNMWW5uVytuM0JCVmFPTzZxVFlNWmZDTEFS?=
 =?utf-8?B?dGZ4VENoQWpJY2sraDBUTzY3QnVzYXloNm5sTGI3Qkx4N3ZuWVo5SEVCdXFV?=
 =?utf-8?B?dmV0NUtQMmp2Mk5GMTNadW9VMGNwZS9NQ2hRV1k5dFpxTHcvZDEwcXNuRVI5?=
 =?utf-8?B?bld4a2c2WFdIUnhWcmtPd09Yay9UL1ZXclhGN256ajZrV3pUbGk5YmgrTzVE?=
 =?utf-8?B?aXpUOGdDVUg3M1hoaExhOWhCK3lGV2ptaDdwbFh2VGpIL2pGSjJyS3gzaEsr?=
 =?utf-8?B?emRoSjZvRnlqS3hGVm12N3BNVnc2TnY0S0RKRURraEhrSFZ5blpYcTVaOXdJ?=
 =?utf-8?B?bDVvZ0hJR1YzeGJIWmphMkFZZEJWenUrSWRidzExTkdranFuS09DbzdYVTEr?=
 =?utf-8?B?akRVQ1oxZHplaEQyMyt5T05aYi93UXl2QThnVmNWZWR4c3hDVmxYdEF1TThu?=
 =?utf-8?B?cklyeGVlRkFxOGxWSUZpdzdFQXdkWkQ1ekRnWldwaE52WFFVdFNYNEFadkQ3?=
 =?utf-8?B?RGgvM2pONEsrT1BDMHdsOVk3V2R4WFZLeWk4eWhWSk9RYXRrbUt3RlVvcjd6?=
 =?utf-8?B?R1FrN2laaXl1VW00SGh1WWl0NEZHOS96VFNoZjZWRnpPajJrNnNBUnhsdk9V?=
 =?utf-8?B?UHQrLzg0TlhUVXZDbTFGV2Z4cHBOaUtzMWhpdXkzbVE2RllXUktsOWl1OWhH?=
 =?utf-8?Q?O/rAMylHuTAEoHWME4UOlIt3n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e46d7f8-95a1-43b4-ab5e-08da8bee2dac
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:47:11.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uf0HmlRAio7B1t1ZrPjLhQVBm0H/97h+pRNX+q/ypQEEyT+GZrbM4JEDfPR+jfau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 17:37 schrieb Dmitry Osipenko:
> The internal dma-buf lock isn't needed anymore because the updated
> locking specification claims that dma-buf reservation must be locked
> by importers, and thus, the internal data is already protected by the
> reservation lock. Remove the obsoleted internal lock.
>
> Acked-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 14 ++++----------
>   include/linux/dma-buf.h   |  9 ---------
>   2 files changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 97ce884fad76..772fdd9eeed8 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -656,7 +656,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   
>   	dmabuf->file = file;
>   
> -	mutex_init(&dmabuf->lock);
>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
>   	mutex_lock(&db_list.lock);
> @@ -1502,7 +1501,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
>   	struct iosys_map ptr;
> -	int ret = 0;
> +	int ret;
>   
>   	iosys_map_clear(map);
>   
> @@ -1514,28 +1513,25 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	if (!dmabuf->ops->vmap)
>   		return -EINVAL;
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (dmabuf->vmapping_counter) {
>   		dmabuf->vmapping_counter++;
>   		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>   		*map = dmabuf->vmap_ptr;
> -		goto out_unlock;
> +		return 0;
>   	}
>   
>   	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>   
>   	ret = dmabuf->ops->vmap(dmabuf, &ptr);
>   	if (WARN_ON_ONCE(ret))
> -		goto out_unlock;
> +		return ret;
>   
>   	dmabuf->vmap_ptr = ptr;
>   	dmabuf->vmapping_counter = 1;
>   
>   	*map = dmabuf->vmap_ptr;
>   
> -out_unlock:
> -	mutex_unlock(&dmabuf->lock);
> -	return ret;
> +	return 0;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>   
> @@ -1577,13 +1573,11 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	BUG_ON(dmabuf->vmapping_counter == 0);
>   	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
>   			dmabuf->ops->vunmap(dmabuf, map);
>   		iosys_map_clear(&dmabuf->vmap_ptr);
>   	}
> -	mutex_unlock(&dmabuf->lock);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index f11b5bbc2f37..6fa8d4e29719 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -326,15 +326,6 @@ struct dma_buf {
>   	/** @ops: dma_buf_ops associated with this buffer object. */
>   	const struct dma_buf_ops *ops;
>   
> -	/**
> -	 * @lock:
> -	 *
> -	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> -	 * dma_resv_lock() on @resv.
> -	 */
> -	struct mutex lock;
> -
>   	/**
>   	 * @vmapping_counter:
>   	 *

