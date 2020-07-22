Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263CF229FC0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 21:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C2789E06;
	Wed, 22 Jul 2020 19:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2118189E06
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 19:02:05 +0000 (UTC)
Received: from x2f7fa19.dyn.telefonica.de ([2.247.250.25] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <heiko@sntech.de>)
 id 1jyK06-0005NH-5R; Wed, 22 Jul 2020 21:01:58 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
Date: Wed, 22 Jul 2020 21:01:56 +0200
Message-ID: <3361390.LkKjKlf5PX@phil>
In-Reply-To: <20200707112526.18438-1-hjc@rock-chips.com>
References: <20200707112526.18438-1-hjc@rock-chips.com>
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
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 7. Juli 2020, 13:25:26 CEST schrieb Sandy Huang:
> don't mask possible_crtcs if remote-point is disabled.
> 
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

changes in v2:
- drop additional of_node_put, as ep will be put with the next
  iteration of for_each_endpoint_of_node()


As this touches a pretty central function is there something
to keep in mind in regards to other DRM drivers?
[question for the broader audience ;-) ]

Heiko

> ---
>  drivers/gpu/drm/drm_of.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index fdb05fbf72a0..565f05f5f11b 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -66,6 +66,9 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
>  	uint32_t possible_crtcs = 0;
>  
>  	for_each_endpoint_of_node(port, ep) {
> +		if (!of_device_is_available(ep))
> +			continue;
> +
>  		remote_port = of_graph_get_remote_port(ep);
>  		if (!remote_port) {
>  			of_node_put(ep);
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
