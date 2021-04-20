Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E7366114
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 22:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071A989CBC;
	Tue, 20 Apr 2021 20:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1263 seconds by postgrey-1.36 at gabe;
 Tue, 20 Apr 2021 20:43:22 UTC
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778AB89CBC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 20:43:22 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id ED85240122CEA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 15:13:38 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id YwkclOHikMGeEYwkclkypP; Tue, 20 Apr 2021 15:13:38 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5azGLjlCJfx5w16SITRnmExgUYk2IoneBfuOcG6M2H0=; b=l3xwj55q9+POxuZlvfzto/hIsi
 T/70k+iNje88WbasELwE4bqgcvx1OpRR77unlDq0lI+JYjHNBXXDPmsEcg1rfnAhZDQZJMM7Cu+sL
 xSXQdp0QOFvtSnuC61JbrcgjUejJB/1I9bQDmAqxl7oVhzcVFVbthB4IZIPhxKGH03HP0unJdSN+/
 BXCuPR/DBVO6MBvcxQTkQiitXBqUu0it32KgsBNExCW8P5UHtmWe/AABlwzbqxK5O0IcVlz+too4+
 442KWoEByPWH10MwySvU7I4xgXjXjtuhHFVRlPBxQDQtR6G2KlG5v//iZXqQd3tdXB1DI0wO7GHol
 McRzry+Q==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:48984
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lYwkZ-002lXA-Ev; Tue, 20 Apr 2021 15:13:35 -0500
Subject: Re: [PATCH RESEND][next] drm/nouveau: Fix fall-through warnings for
 Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210305095657.GA142006@embeddedor>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <79ff569a-5828-ef21-538b-12d07d34a4ff@embeddedor.com>
Date: Tue, 20 Apr 2021 15:13:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305095657.GA142006@embeddedor>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYwkZ-002lXA-Ev
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:48984
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 104
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 3/5/21 03:56, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
> of warnings by explicitly adding a couple of break statements instead
> of letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c        | 1 +
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 2375711877cf..62903c3b368d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -443,6 +443,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
>  			break;
>  		case TTM_PL_TT:
>  			error |= !(domain & NOUVEAU_GEM_DOMAIN_GART);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 61e6d7412505..eb844cdcaec2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -157,6 +157,7 @@ nouveau_conn_atomic_set_property(struct drm_connector *connector,
>  			default:
>  				break;
>  			}
> +			break;
>  		case DRM_MODE_SCALE_FULLSCREEN:
>  		case DRM_MODE_SCALE_CENTER:
>  		case DRM_MODE_SCALE_ASPECT:
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
