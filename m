Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C321DB09
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 18:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D896E124;
	Mon, 13 Jul 2020 16:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BBB6E124
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:00:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9E7538048A;
 Mon, 13 Jul 2020 18:00:11 +0200 (CEST)
Date: Mon, 13 Jul 2020 18:00:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: trix@redhat.com
Subject: Re: [PATCH] drm/bridge: sil_sii8620: initialize return of
 sii8620_readb
Message-ID: <20200713160010.GA1223330@ravnborg.org>
References: <20200712152453.27510-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200712152453.27510-1-trix@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
 a=O_S-2KurR925GvWnQ7MA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 architt@codeaurora.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom.

On Sun, Jul 12, 2020 at 08:24:53AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis flags this error
> 
> sil-sii8620.c:184:2: warning: Undefined or garbage value
>   returned to caller [core.uninitialized.UndefReturn]
>         return ret;
>         ^~~~~~~~~~
> 
> sii8620_readb calls sii8620_read_buf.
> sii8620_read_buf can return without setting its output
> pararmeter 'ret'.
> 
> So initialize ret.
> 
> Fixes: ce6e153f414a ("drm/bridge: add Silicon Image SiI8620 driver")
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thnaks, applied to drm-misc-next as the fix is not urgent.

	Sam

> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 3540e4931383..da933d477e5f 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -178,7 +178,7 @@ static void sii8620_read_buf(struct sii8620 *ctx, u16 addr, u8 *buf, int len)
>  
>  static u8 sii8620_readb(struct sii8620 *ctx, u16 addr)
>  {
> -	u8 ret;
> +	u8 ret = 0;
>  
>  	sii8620_read_buf(ctx, addr, &ret, 1);
>  	return ret;
> -- 
> 2.18.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
