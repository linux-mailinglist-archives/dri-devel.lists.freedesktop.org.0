Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F93F049F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465908996F;
	Wed, 18 Aug 2021 13:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85F76E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua5Yz6tdW+1hAlC3PAgpfTaT3l1qri8/a/2ItXC3RQVnr2tCPGusiHpvIcppkyncAwwFijuWyNJEU/CDfO46e+DORCY4cxjC1Pkro5nE3eopPai16hADRmXmGzXFsXOq1vqvojkk9mxW9iWYHvfGxmX2saH78dBxe00k5xmvEaJhX+e9XpGa3Bsy/NlEV9lKmBtQGvF7SusS2BFTVPjGTDxDwEyJrKM1NtUyZFlCosVKHUnluCuKOrW7cC68zdgXA4x4vjCQPe4oT/QhDHVIkD0HUCaz79yD5vcyLoT0D34iANHdwTJjx/BoAlHa/6A2vwlCrSTRQqnx6iUa37hkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj9l0Upb5Ynv380yrMUceXNmP7CHMRPze/u7ChYANn8=;
 b=BGIlCuEMIZT9bsAMT0OH/d6vTi96xmn85V6BiBEDmOumoACyUdGRqgmqez6NAGELmaC9fw6Y86kRV0ksKWGrLJvjgVTKL9L8TCIKAWIWrW5NFpRGklHnFW+F8DhkqmFzi1mOgvWefjCij0cGBhCZweHFnIh1eH8XlblR2y10+qHzfDI7TAk4hYSaMKtAPurqvBWH/dpp9dBeBdA+szaJgHq+BGoBgaDo3shEh6mv0Zv24t+4sGPE55hB50eu+of6SnjPZ5S0ah7tAkhP3o1qfxAOCEGaLzCx/CDkkZHqP66muKk3pPc7diwDlvPj4acDHasGn9ItYxi7Tlt36UbV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj9l0Upb5Ynv380yrMUceXNmP7CHMRPze/u7ChYANn8=;
 b=pxT9GkUp15ETMP6gEF7dSR+huavIJ8Qep2TcjSBHDVWaxGrukaO5zvHGyInjhp64lY3Sf/Z56UITvKMcCuWsPlecFL3QPb0YQdweNSyez58ovew+xpZWznElu7mqjx+z8lwVd4jrE28F1AMir5Ed9Ed6Fv6e/OR93I6u3L7Q/bI=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 18 Aug
 2021 13:26:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 13:26:05 +0000
Subject: Re: [PATCH] drm/prime: fix a potential double put (release) bug
To: Wentao_Liang <Wentao_Liang_g@163.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20210818130231.3484-1-Wentao_Liang_g@163.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14aa6dfe-faba-8632-01a4-8119f199005c@amd.com>
Date: Wed, 18 Aug 2021 15:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210818130231.3484-1-Wentao_Liang_g@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::52) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.55.180] (165.204.72.6) by
 AM4PR0101CA0084.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 13:26:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf913f5-823e-4487-bff0-08d9624bbb4d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4334:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43346435B4EA3F28A0F3DAFF83FF9@MN2PR12MB4334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3KlR73et6hdgvNgqJ8wWn0xnzfM5Ql+lDko1Rhf36EDHfyb2KLM6FTiKhO7P8SYM+ccL9A5YKeUFn15+lHhenaynDaJUKyI3DHqNv1jouSfHNmRdGlwOjRXJEWKJg/kKKMHcF3bzZfpP/X5ioH1p+75B6g3zfjnXlWllvD9Y+Ir018+oBZbFVx61ZJqucrQ+EY+oRFEvvfziRczGht+Ia+6VuWdHPhyC0C9e3qb3+6leA7JiZInzsN793XlUmNptqWH/lXRFFMIEhA6Wn40ITbwiWTULdHBBuTDPNGpyjKNoI9MZ0dj40rNOBJCMr5qujO3PpVUUotxK4vFCkBMPCQZgppVCV/hAphYreqPS4+71NAZfEu03VFWbyEMYK0/3S/nEi9zvRlfM6LqnMoJ6DQttzw4feW+eMRvrBeWymAT/NAVXVNNYNLHb+/9aHfmWqJuShFvgj87SBICoKlEVI7M8uixKmHlInaDdvleWTkR87o3S+5ZGwabM4ESVRLryX/rIryT3F0YNuXde3WsWyrJ+6SfRG6nZgVjCHIwSQxvGcjVmKqCU9iiIYIrHUg+nOX6dX6t8Wq7o0CRIwodzWzBkeA9kXnCq7u17XOFR+TKHmsFhita8LxGE2jiDT6WZ5E7mE/PSFIzLsPJVJkhEILt9VapiQ9qL3VRUQ1S/kthvEoK6i+IVYGD12TO7zOU66bdJ4QLTCIiNNesf4MV8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(66476007)(7416002)(36756003)(83380400001)(6666004)(6486002)(31696002)(2616005)(66556008)(38100700002)(186003)(4326008)(86362001)(26005)(5660300002)(956004)(478600001)(31686004)(66946007)(16576012)(316002)(8936002)(2906002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXl6ZER2YUI0cVM4WkNGd2NrcklZMHQ3T0ZaTnl6d1QwbUJyd3JleE1lYzJa?=
 =?utf-8?B?ZVZkaDdlNHVGRUh6SEZrMWhjK2RTOXFKc0plRHFWK2NJWVNGcTRYb3ZFNm4x?=
 =?utf-8?B?aytlOTJUOXB4Ry8valVaSDNjdmN3RUw4RUhDc2lPYlpGNzJwc1dDTjBOVHp0?=
 =?utf-8?B?N1RJdG5XSlkwK0cvTDlRNTFNYnNnZjhqRkpsWk12VU1DbGRkb2cway9laEhn?=
 =?utf-8?B?M0lWS1NRTmZvdStHbVhqS2gxODhoeUFkT3g5MlBVQk1QS3NZTlRQRUtWeWVz?=
 =?utf-8?B?U3pPTlFuRVNRc3lrNVM2R2NsOXI1VE5OMWkyTEF4aTBWaTJzeldic1Q4VzNI?=
 =?utf-8?B?MHRuOVFvTkNVQmpmSTNvc1dBdEhXemczdVFoMGpqWGdzaEZqcy9YcFFFd0lj?=
 =?utf-8?B?MXNFbTV6azhyekJTcDVaaENMRnRnYkFOb0dxMGVQUUlpck1nY1RMRnErQ3lV?=
 =?utf-8?B?ZHdtV2I0dCtIdVdEelZmYjQxQ2ZCemplN1Y3NHdiMkFvWVFNNDBpTG1NdElt?=
 =?utf-8?B?Q2NhV1FkRDM2T1dkNUJzTEJPb0xUekc4RmNHSVlnNWNRbjZGY1U1VHh4L2w5?=
 =?utf-8?B?ZmJiMGdGYklGcGhENzdmQUk5VFJFSlVkZVdOUGVvejdHV1M3aVNKZUFxdzMz?=
 =?utf-8?B?em5uNDJxT29TYTNPc0R4OTJ4QzZOVHVGSHA1QWZiY0FtZVpldWNrSVBhYjJ5?=
 =?utf-8?B?cVZjUHVjZnNVZFlIUU0rbFQ5NE0yUFErZVFXVWljbXZxSU1jSmMrRncxMElY?=
 =?utf-8?B?MXRCWmtuMXUvbmxPVS9WVjRKN3VUdDZNYkpkYWd1dmdvSUlLMmJnWk1uSTM1?=
 =?utf-8?B?TWdwRVdEYVhDeXhQMFExRVpZK3BsUjRCZmhlL0pva2pkUVJBNlBMZHV4YXdI?=
 =?utf-8?B?MGJKUXh2ZXBKYkxaaHA2NUVMcGtJemhoVnR3TVBoRHhJeGtiV2ZmbHFJeUQ4?=
 =?utf-8?B?TUtnc3plbHVqbk1UeURXZEpiRGdKbldYVE1XbWlORkZiN3FtcXJmbEtISGw2?=
 =?utf-8?B?blE0OC82b2RsdUpRZTJrK3R5anEvVk1IRG9BUXhYY1dGbDdIZEVHZkhaaERp?=
 =?utf-8?B?VzhCWUJoL29Fc0JXa1JsN2I4Ry9OaVVrNlltNHZtcElBb09Zd09ZbmtnNFQy?=
 =?utf-8?B?ZzVOREdzL1ZHdWdyUGFORlNGMi9KZEI3UWxZb0cwSW9Wd3hLRmF0SnozVUxx?=
 =?utf-8?B?aHVuWmQxSUZyQ3B0aXNwSHo3akhDREpmSHB3WmRyUUZxY0gxL2xsY1p0Kys2?=
 =?utf-8?B?d0hxdHRBVzVodHRmRVBEYjE5aXRHZmVDd3FSVmZQSmYvTzh1UHZBNFpPZ3hn?=
 =?utf-8?B?L21tSTlHbklVS3Y3ZVhsZ3FSY2NJY3BiRzU0N1VXOFZiaVNSYlFYR05vbW9o?=
 =?utf-8?B?RTZMT1YrbVB6M2FlT3lmR0h2U2FyV1BjRWlNc1VJeGV5bGdRSEZHeTdJVGVh?=
 =?utf-8?B?R1piZ2VZUTRhS1FTU1lJNGR5M1F2TWd4TmFMcUl5b0Vwd3RVYkdnZHZoejJk?=
 =?utf-8?B?b2M1V2ozcjlEcUdMNWo4Ylc1N3RzWGhUU3dXK3ZJWHIxZFRVallEM2ZRQmFB?=
 =?utf-8?B?SjJXbmtQOWxuMDh6S3J0ZlpLSHVEc1pkWDhGaXZjMHk2eWpOTWZHRVpTVjBo?=
 =?utf-8?B?N0FwcmcxRDJEQldJMHNLWTlMcEI5TldhWldCTXl5NFI3M3l3UW81aUphcDA5?=
 =?utf-8?B?Q3YzWDd1YnRsNVcrTFZkaVYyV1BNVjBlSzYzMUZXL0xsUkgyTnNzMEZDUERv?=
 =?utf-8?Q?moZywUUsmFhUmX1ocMD4w8ldhxgV8n9bYliUWGM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf913f5-823e-4487-bff0-08d9624bbb4d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 13:26:05.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7nEg4eOeM6/imh5lBT8PIWLY+/jAWBU93cc3BVhTh8dmBFEBufAGXApbVE27fLG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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

Am 18.08.21 um 15:02 schrieb Wentao_Liang:
> In line 317 (#1), drm_gem_prime_import() is called, it will call
> drm_gem_prime_import_dev(). At the end of the function
> drm_gem_prime_import_dev() (line 956, #2), "dma_buf_put(dma_buf);" puts
> dma_buf->file and may cause it to be released. However, after
> drm_gem_prime_import() returning, the dma_buf may be put again by the
> same put function in lines 342, 351 and 358 (#3, #4, #5). Putting the
> dma_buf improperly more than once can lead to an incorrect dma_buf-
>> file put.
> We believe that the put of the dma_buf in the function
> drm_gem_prime_import() is unnecessary (#2). We can fix the above bug by
> removing the redundant "dma_buf_put(dma_buf);" in line 956.

Guys I'm getting tired of NAKing those incorrect reference count analysis.

The dma_buf_put() in the error handling of drm_gem_prime_import_dev() 
function is balanced with the get_dma_buf() in the same function 
directly above.

This is for the creating a GEM object for a DMA-buf imported from other 
device use case and certainly correct.

The various dma_buf_put() in drm_gem_prime_fd_to_handle() is balanced 
with the dma_buf_get(prime_fd) at the beginning of the function.

This is for extracting the DMA-buf from the file descriptor and keeping 
a reference to it while we are busy importing it (e.g. to prevent a race 
when somebody changes the fd at the same time).

As far as I can see this is correct as well.

Regards,
Christian.

>
>   314     if (dev->driver->gem_prime_import)
>   315         obj = dev->driver->gem_prime_import(dev, dma_buf);
>   316     else
>   317         obj = drm_gem_prime_import(dev, dma_buf);
>   				//#1 call to drm_gem_prime_import
> 				//   ->drm_gem_prime_import_dev
> 				//   ->dma_buf_put
>   ...
>
>   336     ret = drm_prime_add_buf_handle(&file_priv->prime,
>   337             dma_buf, *handle);
>
>   ...
>
>   342     dma_buf_put(dma_buf);  //#3 put again
>   343
>   344     return 0;
>   345
>   346 fail:
>
>   351     dma_buf_put(dma_buf); //#4 put again
>   352     return ret;
>
>   356 out_put:
>   357     mutex_unlock(&file_priv->prime.lock);
>   358     dma_buf_put(dma_buf);  //#5 put again
>   359     return ret;
>   360 }
>
>   905 struct drm_gem_object *drm_gem_prime_import_dev
>   							(struct drm_device *dev,
>   906                         struct dma_buf *dma_buf,
>   907                         struct device *attach_dev)
>   908 {
>
>   ...
>
>   952 fail_unmap:
>   953     dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
>   954 fail_detach:
>   955     dma_buf_detach(dma_buf, attach);
>   956     dma_buf_put(dma_buf);  //#2 the first put of dma_buf
> 								//	 (unnecessary)
>   957
>   958     return ERR_PTR(ret);
>   959 }
>
> Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
> ---
>   drivers/gpu/drm/drm_prime.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 2a54f86856af..cef03ad0d5cd 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -953,7 +953,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>   	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
>   fail_detach:
>   	dma_buf_detach(dma_buf, attach);
> -	dma_buf_put(dma_buf);
>   
>   	return ERR_PTR(ret);
>   }

