Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367055A01AA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6016AC24F0;
	Wed, 24 Aug 2022 18:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98309269A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 11:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRrVYJkLbR8bAtTNUrsbAqq6O43xG7tqt+ppIKfBsxkemZPhmKEIVj1UiukI/ibXzGIiUXZ33hCuzeDOHr3zzBHKZq1U7kxMjPWQNn/WGsa6y0DjYq9nIxBHjd2ZjldRmj9sd9nXR0OeAbxP2x5UGEHRpsMF+nc7WJ2JcqovCfu8x2X90EVXp/chGyvNKdcVmYslohTfb/l7/HlYVaprikJABMjg2jkZdHZjzkid7zeneKkVRQ+Cu+BmIcCPBeospXRRIxyXAZYH5VyO9+hRDnEBjkyNWW0eP8DfPaVyJV/jxTmyb9XHPZO0taR3d6D7NVp5lD9PIoy+XpqHZLCKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA3MSH7N9CdKDycSMmMC9QFulZM+tI027/z4qjfuyaE=;
 b=TSwdSbxW7cC1GM5qJQfTAlNHM9DISFDTAp4YmkTMKUZ00GWKWi6RNCzM6kZOsKDrMg5Bcy7Ig9TV8WFYxajnPSTkk7nP5aMHFS09pPlj52n3yDPifZ9gbCMpdVNshueaBn4/vg5rqIyKX5d65rYsPlj9OfIIWXTwdJSmdV6gynZkmmAbJsVHFYg3CSKhy3ZUf2QVexs3YxYZF84X+J4OToHI2lma7vZIWS8EtPDZzOPBsGz+WwfKqZeHbQRdsvPAfuSWoEkvZlu0KSTb46E5s3Ty5acg/MTTnmkRoP585dIa/TxCdSlqc4wxRbLGVDsGI/TZFjPjgC7yRHxolJGVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA3MSH7N9CdKDycSMmMC9QFulZM+tI027/z4qjfuyaE=;
 b=o8iqfJDC9PwXQzqYYrsgOT9rX9iY/cw7qPO3m7mFQ+ut8wki2U9w28RlhqHUuLTcWd+JumTvmP5yFPDqOga9sNJvkVO1NOBWO5Wz6V6su4VCTksVCcj3xIC7mM2z9fB13RfFiSAWm0IYNLATGAsGbqW398TBj4eSW0F8zvdsn8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 11:23:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 11:23:00 +0000
Message-ID: <5dee90f1-7964-b186-b1c3-f281773ade40@amd.com>
Date: Thu, 18 Aug 2022 13:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/ast: add dmabuf/prime buffer sharing support
Content-Language: en-US
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
References: <20220818094517.214421-1-oushixiong@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220818094517.214421-1-oushixiong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32340c86-a14d-445d-1dab-08da810c0257
X-MS-TrafficTypeDiagnostic: DM4PR12MB5391:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pca6rRUV7ttGZKYkFaLc19fJT5FJE8PEf/SngsvxrSKAWnaFoZxFzPr03ymWa9ny8txS3gHm9Spd7wCzHeIori5jFz6jdieolKu6y1E/NvsXu1rnIWvWNOLDYOGV8xlwg3Y5/E3jhB6MfOJxxQHsLk7yfpOoc5SbhyZCsCDF3O1INDxl6vCC67nYOi27b/PrwRa1zSayu7RNs+K6iHBmi8jvC2b6hNQALjNtE/knGwQ7mINDxzfc11JQWtK5Xhz5/gcl3i6EKU7lBrhspb06oB6rO/N9C3vtc9p8nYSnaw97Jhxk0dYTyvFnKZ6nybnkXyK9XvQ93afPY069GvPko69gyDJE1u4YqFnbvi5XXuX79aGaM+IlmQpRR/Sf3zeAuhLXWR5cCAZDYt4HYizpPQBx2z9hVCLXQ4g/Uytakfem+QHLq+KIccOKAW/hn1ft7RxT8k/GNWfE/Q/iZAAccXcwHrK0PN7WHVNixzxvaTu9p1NiSW7+XXDQmcgEhA2DatFKYIxSNafApBtr1YMAZakduuyysMJMYRmWjJ/exAuz138Gy7uYoCCdmaK59JNaQfVyh3nNUth0eI3TFFWOUwXfVrth3QZGMWrEX4Sb6vZ4DzU2zXYix2IlfNrOcAmnf8JTl0K6gzUGDJx6H8Uz7WCVQndySQjtTyg8waOKUKsxO90auXHnE6ZET7cQZAEDujfD32IfNmhvx9AukY+8C6Jk+V1twUOJ14w14yXMil4CgW3jAkQEe34wdp9zXEbGmDgHZkqe0By4c+0bJ/vEa/2yVRrPFi0z+LCC+GPwGUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(26005)(6506007)(38100700002)(2616005)(83380400001)(6512007)(110136005)(36756003)(54906003)(31686004)(316002)(66946007)(66556008)(8676002)(4326008)(66476007)(6486002)(7416002)(5660300002)(8936002)(6666004)(41300700001)(2906002)(478600001)(186003)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0t2TGExZ3RiQkIzT3hjM1l2TUQ2dlBmRGJmSHhaOVMxZ0gwZThyNDVQaGs3?=
 =?utf-8?B?Y0VVbTAwRzFRMjBZN0NQMTBNRVB0Z2NvWmh4TVVqQzlrVkNHVWRiMmRjT3F6?=
 =?utf-8?B?cVM1M3VNRnpXMkpyVDd1WUFlNElNYlJPWmxMd1hQRWIyYWFvTjl6S2xjTzN1?=
 =?utf-8?B?SVZDTTFIM0kyRGF0VWx5VVZ1ZndZZThmYVNTaHpkMDBTSWZmNFJuN3F2WkFJ?=
 =?utf-8?B?eWQzQUdlcEUyTW1xN21uWUpoYXoxODByRXM4TEhibFgyajhYV2lVbVE5YlV0?=
 =?utf-8?B?cVJFMmxyaVg2bk0rM3diSWFIUzhQZUNzYjRRZXJjS3lxMW8rMGhPR09zQWZy?=
 =?utf-8?B?bjdZa05ITHN6d1Uvb0YwNC9PVzlNYVNKaWVHM1lZZkpPKzc5MzkyREdMbC9m?=
 =?utf-8?B?c2o5alJWZ0cxR0c0QTNmS3AxMU1JRUlFM0RNSnAvcXU0b0NKdkFidi9QSDYz?=
 =?utf-8?B?ZzdVZEUxUG5JdnZpazczVWhNS2dwVytPWERQNmdtc2hicklHSzRjcTAyMlFs?=
 =?utf-8?B?WjZoUkI2Skt3WFdTV1J3NW51SUIrampmTkREUGlmYVZ2MU1xbEVlNm1DOXkv?=
 =?utf-8?B?OUlXbzBkbHNzMzZjRDNWdUtFNUZ2M0lmeVpGN0ZCOERoSUZQS00vR1dxUncw?=
 =?utf-8?B?Skl4amlsUG1SK3FralVlUVRSSHk0c3VLVmJsNEc1RTBlUFpBaUUzMld4c2Q2?=
 =?utf-8?B?VVhZM0ZsV3Jva0piUjJFaTZGRGcwYnJkeHI0Rnh6QWh3TkgzaXdxTjJMOFhX?=
 =?utf-8?B?NmV6dXZ1TGVFMDJJTjJIWFZGdTdXQm1MMkJwaWFOR1dlRFVVVTNmaWtqb1Ns?=
 =?utf-8?B?eEkwNmdmbzhPNEpTeHprQ2o5VnNOcDR1SWFNRFlrNWZCL2M5OUQvWU01TkJw?=
 =?utf-8?B?elZPbnFMaTAxaWZUaVk2dzl4OUc4UWs5VVUyaFFFUHlaYmdWMTdPNEZMbUNw?=
 =?utf-8?B?dzRIN0MxNWVMdDJSdEQrUHVFSThuQ2l6Qysva3ppYkxJTUcxVDVqQ1BtWGdj?=
 =?utf-8?B?a0pCNGgrZy81emhwYUZ4elAwVVloSjVKTVJ5aWIvY1o2Wjd3MkRKS2VYdEJN?=
 =?utf-8?B?SzFseFp5Sld6Y2FJV2UrNVByQWk4bzZJRGFDMWtQODlSbW94bnpFSExqQjZT?=
 =?utf-8?B?RkdwVGtodEhHbFhhRlluTTluNXc1amxkOE1vaXI2SGhYUkplSC96MGhxQ3JS?=
 =?utf-8?B?L3kxeWlKUnZQU0xrRmxhTERhYUh1dFUrTGpENUt5Tlh4dlZXanBFK1hqbDIv?=
 =?utf-8?B?T0xsSy9tcllVNW92VXJrV1pVeTV4Y2NsbXlVcEI5eTRuWHFCN2wyc2kxVjlZ?=
 =?utf-8?B?SU1zdGI1UWlsTG5IQndFTDlpdFFIdk9HNGVrT0JvTEpPM1B1YmF2c0RtUEww?=
 =?utf-8?B?Zm5kSThCKzJpUWIvY2dFN254UFdBUCtNbGVPOEgyQnVadEhSb2FlUHcxcWVD?=
 =?utf-8?B?UWJFNHUyWVRZWUtSSDhjUHNlOXpEL0JRM1pjV3JJWXlHQjFwaExwRWdXMHdr?=
 =?utf-8?B?R2ppaytWUmJNSktqT1V1ZG1jZGF4dXMzTFl5bDA2SHoxV21wUWM1eVppN2t5?=
 =?utf-8?B?eWRXTklLVzl6MHdON0p4RGpyS1d0dG9POW01VzJ0THRwYkJsQTNaUEJsWUx4?=
 =?utf-8?B?MkluY3FpNzhqaEJsWTVQdGY2RmlSQm1JaXl6UnRxSVgzblJoRWtFL2Nnc3ZK?=
 =?utf-8?B?VlA2bnFHZlRSTGtKMHhKd2ZNREVBMmdsTHkzaUptU0JIazlWVmhqczZwMVNa?=
 =?utf-8?B?eFdrUmpVaGVsUkhrY1FIK3ZIUkd4QVhsTzJ2c3BNU1B1WGsxdlJ6VHRpMnBZ?=
 =?utf-8?B?cnQ5YUVvb1JSSFYxMDladlVOZHBHOUJIb2xQQnhvbStNbVM1bHZ5RzJkZ2w5?=
 =?utf-8?B?akZvV0RtZ2hXTmlSc1pDMDcvTSttRkhVeHk3TU5KbVNVM3Ywa2RUUS8vWUJu?=
 =?utf-8?B?aE5qaXZUZk5YRThrbzJUSThHNWhocjAvb29YR0pSd0Ruc0ppbnBpcXF6aHdy?=
 =?utf-8?B?MkJWYkJROTZKRGNuVDN4MUtsTmVEYWFoN054SHAvdVlGbWNxbHRVVzdpWnFo?=
 =?utf-8?B?b2MwZSsvWmVNWWs3VEJkQmdUcmZwb3dueVJ1czdzb2xzd3V5OWRBeU9sbnZy?=
 =?utf-8?Q?O4RjOyDZmBut+/s1+AhDPpo2/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32340c86-a14d-445d-1dab-08da810c0257
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 11:23:00.7231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yT/FMBmb4tZhuKbug1iweqpgRR9Q+8s6FUqK2Lxn3ETu3YJk71r7YOJpCWmHjD7K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.08.22 um 11:45 schrieb oushixiong:
> This patch adds ast specific codes for DRM prime feature, this is to
> allow for offloading of rending in one direction and outputs in other.
>
> v1->v2:
>    - Fix the comment.
>
> Signed-off-by: oushixiong <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  22 ++++++
>   drivers/gpu/drm/ast/ast_mode.c | 125 ++++++++++++++++++++++++++++++++-
>   2 files changed, 146 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 7465c4f0156a..6c1f75174368 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -28,6 +28,7 @@
>   
>   #include <linux/module.h>
>   #include <linux/pci.h>
> +#include <linux/dma-buf.h>
>   
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
> @@ -50,6 +51,23 @@ module_param_named(modeset, ast_modeset, int, 0400);
>   
>   DEFINE_DRM_GEM_FOPS(ast_fops);
>   
> +static struct drm_gem_object *ast_gem_prime_import_sg_table(struct drm_device *dev,
> +					struct dma_buf_attachment *attach,
> +					struct sg_table *sg)
> +{
> +	struct drm_gem_vram_object *gbo;
> +	struct dma_resv *resv = attach->dmabuf->resv;
> +
> +	ww_mutex_lock(&resv->lock, NULL);
> +	gbo = drm_gem_vram_create(dev, attach->dmabuf->size, 0);
> +	ww_mutex_unlock(&resv->lock);
> +
> +	if (IS_ERR(gbo))
> +		return NULL;

Well where do you use the sg_table here?

Christian.

> +
> +	return &gbo->bo.base;
> +}
> +
>   static const struct drm_driver ast_driver = {
>   	.driver_features = DRIVER_ATOMIC |
>   			   DRIVER_GEM |
> @@ -63,6 +81,10 @@ static const struct drm_driver ast_driver = {
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
>   
> +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_prime_import_sg_table = ast_gem_prime_import_sg_table,
> +
>   	DRM_GEM_VRAM_DRIVER
>   };
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 45b56b39ad47..ebe732705e34 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -48,6 +48,8 @@
>   #include "ast_drv.h"
>   #include "ast_tables.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   static inline void ast_load_palette_index(struct ast_private *ast,
>   				     u8 index, u8 red, u8 green,
>   				     u8 blue)
> @@ -1535,8 +1537,129 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
>   	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>   };
>   
> +static int ast_handle_damage(struct drm_framebuffer *fb, int x, int y,
> +					int width, int height)
> +{
> +	struct drm_gem_vram_object *dst_bo = NULL;
> +	void *dst = NULL;
> +	int ret = 0, i;
> +	unsigned long offset = 0;
> +	bool unmap = false;
> +	unsigned int bytesPerPixel;
> +	struct iosys_map map;
> +	struct iosys_map dmabuf_map;
> +
> +	bytesPerPixel = fb->format->cpp[0];
> +
> +	if (!fb->obj[0]->import_attach)
> +		return -EINVAL;
> +
> +	if (!fb->obj[0]->import_attach->dmabuf->vmap_ptr.vaddr) {
> +		ret = dma_buf_vmap(fb->obj[0]->import_attach->dmabuf, &dmabuf_map);
> +		if (ret)
> +			return 0;
> +	} else
> +		dmabuf_map.vaddr = fb->obj[0]->import_attach->dmabuf->vmap_ptr.vaddr;
> +
> +	dst_bo = drm_gem_vram_of_gem(fb->obj[0]);
> +
> +	ret = drm_gem_vram_pin(dst_bo, 0);
> +	if (ret) {
> +		DRM_ERROR("ast_bo_pin failed\n");
> +		goto error;
> +	}
> +
> +	if (!dst_bo->map.vaddr) {
> +		ret = drm_gem_vram_vmap(dst_bo, &map);
> +		if (ret) {
> +			DRM_ERROR("failed to vmap fbcon\n");
> +			drm_gem_vram_unpin(dst_bo);
> +			goto error;
> +		}
> +		unmap = true;
> +	}
> +	dst = dst_bo->map.vaddr;
> +
> +	for (i = y; i < y + height; i++) {
> +		offset = i * fb->pitches[0] + (x * bytesPerPixel);
> +		memcpy_toio(dst + offset, dmabuf_map.vaddr + offset,
> +			width * bytesPerPixel);
> +	}
> +
> +	if (unmap)
> +		drm_gem_vram_vunmap(dst_bo, &map);
> +
> +	drm_gem_vram_unpin(dst_bo);
> +error:
> +	return 0;
> +}
> +
> +
> +static int ast_user_framebuffer_dirty(struct drm_framebuffer *fb,
> +				struct drm_file *file,
> +				unsigned int flags,
> +				unsigned int color,
> +				struct drm_clip_rect *clips,
> +				unsigned int num_clips)
> +{
> +	int i, ret = 0;
> +
> +	drm_modeset_lock_all(fb->dev);
> +	if (fb->obj[0]->import_attach) {
> +		ret = dma_buf_begin_cpu_access(fb->obj[0]->import_attach->dmabuf,
> +				DMA_FROM_DEVICE);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	for (i = 0; i < num_clips; i++) {
> +		ret = ast_handle_damage(fb, clips[i].x1, clips[i].y1,
> +				clips[i].x2 - clips[i].x1, clips[i].y2 - clips[i].y1);
> +		if (ret)
> +			break;
> +	}
> +
> +	if (fb->obj[0]->import_attach) {
> +		dma_buf_end_cpu_access(fb->obj[0]->import_attach->dmabuf,
> +				DMA_FROM_DEVICE);
> +	}
> +
> +unlock:
> +	drm_modeset_unlock_all(fb->dev);
> +
> +	return ret;
> +}
> +
> +static void ast_user_framebuffer_destroy(struct drm_framebuffer *fb)
> +{
> +	struct iosys_map dmabuf_map;
> +
> +	if (fb->obj[0]->import_attach) {
> +		dmabuf_map.vaddr = fb->obj[0]->import_attach->dmabuf->vmap_ptr.vaddr;
> +		if (dmabuf_map.vaddr)
> +			dma_buf_vunmap(fb->obj[0]->import_attach->dmabuf,
> +					&dmabuf_map);
> +	}
> +
> +	drm_gem_fb_destroy(fb);
> +}
> +
> +static const struct drm_framebuffer_funcs ast_gem_fb_funcs_dirtyfb = {
> +	.destroy	= ast_user_framebuffer_destroy,
> +	.create_handle	= drm_gem_fb_create_handle,
> +	.dirty		= ast_user_framebuffer_dirty,
> +};
> +
> +static struct drm_framebuffer *
> +ast_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
> +				const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
> +					&ast_gem_fb_funcs_dirtyfb);
> +}
> +
>   static const struct drm_mode_config_funcs ast_mode_config_funcs = {
> -	.fb_create = drm_gem_fb_create,
> +	.fb_create = ast_gem_fb_create_with_dirty,
>   	.mode_valid = drm_vram_helper_mode_valid,
>   	.atomic_check = drm_atomic_helper_check,
>   	.atomic_commit = drm_atomic_helper_commit,

