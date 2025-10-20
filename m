Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73FBEFC4D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 09:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EDD10E30D;
	Mon, 20 Oct 2025 07:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B85010E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:59:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B94581063;
 Mon, 20 Oct 2025 00:59:37 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33C493F63F;
 Mon, 20 Oct 2025 00:59:43 -0700 (PDT)
Message-ID: <77faf362-05bc-45b8-bddd-eed66ae70a63@arm.com>
Date: Mon, 20 Oct 2025 08:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: attach the driver's multiple power domains
To: Rain Yang <jiyu.yang@oss.nxp.com>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, xianzhong.li@nxp.com,
 Rain Yang <jiyu.yang@nxp.com>, Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
References: <20251013093438.125243-1-jiyu.yang@oss.nxp.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251013093438.125243-1-jiyu.yang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 13/10/2025 10:34, Rain Yang wrote:
> From: Rain Yang <jiyu.yang@nxp.com>
> 
> Some platforms, such as i.MX95, utilize multiple power domains that need
> to be attached explicitly. This patch ensures that the driver properly
> attaches all available power domains using devm_pm_domain_attach_list().
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index f0b2da5b2b96..fbbc84e9efbe 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -167,6 +167,7 @@ static void panthor_device_free_page(struct drm_device *ddev, void *data)
>  int panthor_device_init(struct panthor_device *ptdev)
>  {
>  	u32 *dummy_page_virt;
> +	struct dev_pm_domain_list  *pd_list = NULL;
>  	struct resource *res;
>  	struct page *p;
>  	int ret;
> @@ -218,6 +219,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &pd_list);
> +	if (ret < 0) {
> +		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
> +		return ret;

This fails on the rock-5b. I believe because the PM code automatically 
attaches a single power domain (as on the rock-5b) so this then returns 
-EEXIST:

[   11.433501] panthor fb000000.gpu: [drm] *ERROR* attach power domains failed, ret=-17

I notice that the tegra driver checks dev->pm_domain and only calls 
devm_pm_domain_attach_list if that is NULL.

Thanks,
Steve

> +	}
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;

