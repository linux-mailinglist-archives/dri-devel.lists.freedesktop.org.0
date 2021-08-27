Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088DA3F9AB9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD486E977;
	Fri, 27 Aug 2021 14:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 557 seconds by postgrey-1.36 at gabe;
 Fri, 27 Aug 2021 14:15:29 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDEF6E977
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 14:15:29 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4Gx1hx4H79z8K;
 Fri, 27 Aug 2021 16:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1630073169; bh=uujpqvog34E0fJusa0g1edjyiGosMDvAWisH108ojUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OV1N2Qk4grS5VGy/iq2Ma0/rK2dL/cPOfKRSMMR0djB2kAThd2TCxmM8nR5HnEmQS
 wAHdcrod0tKlmlsYm2x1vC444kt1w6VzCjdZ8RMmTW7EvJ8HiviswqYfQqg4NKTI1H
 954l2a9Kl4VOcZPpAVGbunJ0B4qUfKs0deaJWYQquy7IngbufLfckemAy4pz2TC3VG
 0CPuVzMIsiESEnPiZ1KdiT62S89kPO8Tt16H+kcKpjyVviNGpQdz1JjHJ8b+hdBurf
 T99dvmWvayveU+1zg4a3CiUa1r42duOGk2Dp1cdhB5fa7qsSrZeI4Sq6zJyFmZ92r6
 FJ9IKjOprwmlg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date: Fri, 27 Aug 2021 16:06:02 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH libdrm 19/25] tests: tegra: Add VIC 3.0 support
Message-ID: <YSjxSmSQm1IEujKM@qmqm.qmqm.pl>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
 <20210827132305.3572077-20-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210827132305.3572077-20-thierry.reding@gmail.com>
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

On Fri, Aug 27, 2021 at 03:22:59PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Video Image Composer (VIC) 3.0 can be found on NVIDIA Tegra124 SoCs.a
[...]
> +static int vic30_clear(struct vic *v, struct vic_image *output,
> +                       unsigned int alpha, unsigned int red,
> +                       unsigned int green, unsigned int blue)
> +{
> +    struct vic30 *vic = container_of(v, struct vic30, base);
> +    ConfigStruct *c;
> +    int err;
> +
> +    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
> +    if (err < 0) {
> +        fprintf(stderr, "failed to map configuration structure: %s\n",
> +                strerror(-err));
> +        return err;
> +    }
> +
> +    memset(c, 0, sizeof(*c));
> +
> +    c->surfaceList0Struct.TargetRectLeft = 0;
> +    c->surfaceList0Struct.TargetRectTop = 0;
> +    c->surfaceList0Struct.TargetRectRight = output->width - 1;
> +    c->surfaceList0Struct.TargetRectBottom = output->height - 1;
> +
> +    c->blending0Struct.PixelFormat = output->format;
> +    c->blending0Struct.BackgroundAlpha = alpha;
> +    c->blending0Struct.BackgroundR = red;
> +    c->blending0Struct.BackgroundG = green;
> +    c->blending0Struct.BackgroundB = blue;
> +    c->blending0Struct.LumaWidth = output->stride - 1;
> +    c->blending0Struct.LumaHeight = output->height - 1;
> +    c->blending0Struct.ChromaWidth = 16383;
> +    c->blending0Struct.ChromaHeight = 16383;
> +    c->blending0Struct.TargetRectLeft = 0;
> +    c->blending0Struct.TargetRectTop = 0;
> +    c->blending0Struct.TargetRectRight = output->width - 1;
> +    c->blending0Struct.TargetRectBottom = output->height - 1;
> +    c->blending0Struct.SurfaceWidth = output->width - 1;
> +    c->blending0Struct.SurfaceHeight = output->height - 1;
> +    c->blending0Struct.BlkKind = output->kind;
> +    c->blending0Struct.BlkHeight = 0;
> +
> +    c->fetchControl0Struct.TargetRectLeft = 0;
> +    c->fetchControl0Struct.TargetRectTop = 0;
> +    c->fetchControl0Struct.TargetRectRight = output->width - 1;
> +    c->fetchControl0Struct.TargetRectBottom = output->height - 1;
> +
> +    drm_tegra_bo_unmap(vic->config.bo);
> +
> +    return 0;
> +}
[...]

It does look exactly like:

return vic30_fill(v, output, 0, 0, output->width - 1,
	output->height - 1, alpha, red, green, blue);

Best Regards
Micha³ Miros³aw
