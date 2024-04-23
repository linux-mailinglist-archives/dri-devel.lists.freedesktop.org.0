Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FFB8AE5CD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 14:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100D210FC1D;
	Tue, 23 Apr 2024 12:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SU2htrQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847E210FC1D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 12:16:31 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12923E4;
 Tue, 23 Apr 2024 14:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713874538;
 bh=lOpQcn4MtBfmmDN35Auoa7Jf7iRLuuP28iIGHSawomQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SU2htrQyuMLCN6ndjBJHOvhe20o+D+Yu5VOxVWWjPZRu/d+BhKFaSQTytUEe78BSF
 RUXo7qCZp8e/jr3kXRrGB2jytueDF4lj5oOLcqs9t/aBKNBaO4U3WEiXBsKcafrynM
 ZzlAm52hJQPTFlGdi5bxY1ogpmfCo6WfJkEztSis=
Message-ID: <68d14afc-d641-4a4f-b3c8-37d280b5f571@ideasonboard.com>
Date: Tue, 23 Apr 2024 15:16:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] drm: xlnx: Store base pointers in zynqmp_disp
 directly
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
 <20240422184553.3573009-2-sean.anderson@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240422184553.3573009-2-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/04/2024 21:45, Sean Anderson wrote:
> The blend, avbuf, and audio members of zynqmp_disp are anonymous structs
> with only one member each. This is rather pointless, so move the members
> up a level.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v3:
> - New

I would have renamed the fields to, e.g., "blend_base", but it doesn't 
really matter as they are accessed only in a couple of places.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 44 +++++++++++++-----------------
>   1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 407bc07cec69..94a3ac046373 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -128,24 +128,18 @@ struct zynqmp_disp_layer {
>    * struct zynqmp_disp - Display controller
>    * @dev: Device structure
>    * @dpsub: Display subsystem
> - * @blend.base: Register I/O base address for the blender
> - * @avbuf.base: Register I/O base address for the audio/video buffer manager
> - * @audio.base: Registers I/O base address for the audio mixer
> + * @blend: Register I/O base address for the blender
> + * @avbuf: Register I/O base address for the audio/video buffer manager
> + * @audio: Registers I/O base address for the audio mixer
>    * @layers: Layers (planes)
>    */
>   struct zynqmp_disp {
>   	struct device *dev;
>   	struct zynqmp_dpsub *dpsub;
>   
> -	struct {
> -		void __iomem *base;
> -	} blend;
> -	struct {
> -		void __iomem *base;
> -	} avbuf;
> -	struct {
> -		void __iomem *base;
> -	} audio;
> +	void __iomem *blend;
> +	void __iomem *avbuf;
> +	void __iomem *audio;
>   
>   	struct zynqmp_disp_layer layers[ZYNQMP_DPSUB_NUM_LAYERS];
>   };
> @@ -356,12 +350,12 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>   
>   static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
>   {
> -	return readl(disp->avbuf.base + reg);
> +	return readl(disp->avbuf + reg);
>   }
>   
>   static void zynqmp_disp_avbuf_write(struct zynqmp_disp *disp, int reg, u32 val)
>   {
> -	writel(val, disp->avbuf.base + reg);
> +	writel(val, disp->avbuf + reg);
>   }
>   
>   static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
> @@ -587,7 +581,7 @@ static void zynqmp_disp_avbuf_disable(struct zynqmp_disp *disp)
>   
>   static void zynqmp_disp_blend_write(struct zynqmp_disp *disp, int reg, u32 val)
>   {
> -	writel(val, disp->blend.base + reg);
> +	writel(val, disp->blend + reg);
>   }
>   
>   /*
> @@ -813,7 +807,7 @@ static void zynqmp_disp_blend_layer_disable(struct zynqmp_disp *disp,
>   
>   static void zynqmp_disp_audio_write(struct zynqmp_disp *disp, int reg, u32 val)
>   {
> -	writel(val, disp->audio.base + reg);
> +	writel(val, disp->audio + reg);
>   }
>   
>   /**
> @@ -1237,21 +1231,21 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>   	disp->dev = &pdev->dev;
>   	disp->dpsub = dpsub;
>   
> -	disp->blend.base = devm_platform_ioremap_resource_byname(pdev, "blend");
> -	if (IS_ERR(disp->blend.base)) {
> -		ret = PTR_ERR(disp->blend.base);
> +	disp->blend = devm_platform_ioremap_resource_byname(pdev, "blend");
> +	if (IS_ERR(disp->blend)) {
> +		ret = PTR_ERR(disp->blend);
>   		goto error;
>   	}
>   
> -	disp->avbuf.base = devm_platform_ioremap_resource_byname(pdev, "av_buf");
> -	if (IS_ERR(disp->avbuf.base)) {
> -		ret = PTR_ERR(disp->avbuf.base);
> +	disp->avbuf = devm_platform_ioremap_resource_byname(pdev, "av_buf");
> +	if (IS_ERR(disp->avbuf)) {
> +		ret = PTR_ERR(disp->avbuf);
>   		goto error;
>   	}
>   
> -	disp->audio.base = devm_platform_ioremap_resource_byname(pdev, "aud");
> -	if (IS_ERR(disp->audio.base)) {
> -		ret = PTR_ERR(disp->audio.base);
> +	disp->audio = devm_platform_ioremap_resource_byname(pdev, "aud");
> +	if (IS_ERR(disp->audio)) {
> +		ret = PTR_ERR(disp->audio);
>   		goto error;
>   	}
>   

