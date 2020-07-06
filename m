Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED352154EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 11:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1550D89E0C;
	Mon,  6 Jul 2020 09:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E8789E0C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 09:47:46 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jsNio-0007ip-Tk; Mon, 06 Jul 2020 11:47:34 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH] drm/of: Consider the state in which the ep is disabled
Date: Mon, 06 Jul 2020 11:47:34 +0200
Message-ID: <5521346.QZMSPK5NSd@diego>
In-Reply-To: <20200706075944.11558-1-hjc@rock-chips.com>
References: <20200706075944.11558-1-hjc@rock-chips.com>
MIME-Version: 1.0
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
Cc: huangtao@rock-chips.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, kever.yang@rock-chips.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.yan@rock-chips.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandy,

Am Montag, 6. Juli 2020, 09:59:44 CEST schrieb Sandy Huang:
> don't mask possible_crtcs if remote-point is disabled.
> 
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>
> ---
>  drivers/gpu/drm/drm_of.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index fdb05fbf72a0..f5f250435add 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -66,6 +66,11 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
>  	uint32_t possible_crtcs = 0;
>  
>  	for_each_endpoint_of_node(port, ep) {
> +		if (!of_device_is_available(ep)) {
> +			of_node_put(ep);

You'd only need the of_node_put here, if you were exiting the loop.

With the "continue" below, the next iteration of for_each_endpoint_of_node
will do the put on "ep"


Heiko

> +			continue;
> +		}
> +
>  		remote_port = of_graph_get_remote_port(ep);
>  		if (!remote_port) {
>  			of_node_put(ep);
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
