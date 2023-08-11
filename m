Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CE778823
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3642610E66F;
	Fri, 11 Aug 2023 07:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4604310E629
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 03:03:31 +0000 (UTC)
Received: from kwepemi500019.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMT6j0v5ZzCrZ2;
 Fri, 11 Aug 2023 10:59:57 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemi500019.china.huawei.com (7.221.188.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 11:03:25 +0800
Message-ID: <623effcb-cff4-37d8-2981-0c83f6a46c08@huawei.com>
Date: Fri, 11 Aug 2023 11:03:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [PATCH] drm: xlnx: Use devm_platform_ioremap_resource_byname()
 helper function
To: <laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>
References: <20230811021121.60027-1-zhangzekun11@huawei.com>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <20230811021121.60027-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.82]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500019.china.huawei.com (7.221.188.117)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:26:19 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am sorry for make noise, this patch has been sent  before:

https://lore.kernel.org/linux-arm-kernel/20230801214729.GF8578@pendragon.ideasonboard.com/T/

Please ignore this patch.

在 2023/8/11 10:11, Zhang Zekun 写道:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.
>
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 3b87eebddc97..2b731f3eea54 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1228,7 +1228,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>   {
>   	struct platform_device *pdev = to_platform_device(dpsub->dev);
>   	struct zynqmp_disp *disp;
> -	struct resource *res;
>   	int ret;
>   
>   	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
> @@ -1238,22 +1237,19 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>   	disp->dev = &pdev->dev;
>   	disp->dpsub = dpsub;
>   
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "blend");
> -	disp->blend.base = devm_ioremap_resource(disp->dev, res);
> +	disp->blend.base = devm_platform_ioremap_resource_byname(pdev, "blend");
>   	if (IS_ERR(disp->blend.base)) {
>   		ret = PTR_ERR(disp->blend.base);
>   		goto error;
>   	}
>   
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "av_buf");
> -	disp->avbuf.base = devm_ioremap_resource(disp->dev, res);
> +	disp->avbuf.base = devm_platform_ioremap_resource_byname(pdev, "av_buf");
>   	if (IS_ERR(disp->avbuf.base)) {
>   		ret = PTR_ERR(disp->avbuf.base);
>   		goto error;
>   	}
>   
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aud");
> -	disp->audio.base = devm_ioremap_resource(disp->dev, res);
> +	disp->audio.base = devm_platform_ioremap_resource_byname(pdev, "aud");
>   	if (IS_ERR(disp->audio.base)) {
>   		ret = PTR_ERR(disp->audio.base);
>   		goto error;

