Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410735B385E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 14:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A12510E056;
	Fri,  9 Sep 2022 12:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3922510E056
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 12:58:36 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7C7DD;
 Fri,  9 Sep 2022 14:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662728314;
 bh=cznWQP9nmiJW7Ym77TUitdS+I9WAVenLKpJqFpv0744=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=waZaiS+wtlHIk8j97cC1+m0pe7cc47SlojfGsq/RtmCmDqZHes0XcUm4hXwx5lVHM
 HzT0KFbM22JE2MujdeiDTJymdITiKpGOBxMTAoSr/GHAiP+d/VetvVtceiIJ1AnKxF
 F6N4Q/klabuJTjjAd0YHPZXfvjRMZA/PMZhnGf0o=
Message-ID: <00a95ebc-7bc0-23dc-ffb3-724f6b57c65c@ideasonboard.com>
Date: Fri, 9 Sep 2022 15:58:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/omap: dss: Fix refcount leak bugs
Content-Language: en-US
To: Liang He <windhl@126.com>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20220722144348.1306569-1-windhl@126.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220722144348.1306569-1-windhl@126.com>
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

On 22/07/2022 17:43, Liang He wrote:
> In dss_init_ports() and __dss_uninit_ports(), we should call
> of_node_put() for the reference returned by of_graph_get_port_by_id()
> in fail path or when it is not used anymore.
> 
> Fixes: 09bffa6e5192 ("drm: omap: use common OF graph helpers")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dss.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 0399f3390a0a..c4febb861910 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1176,6 +1176,7 @@ static void __dss_uninit_ports(struct dss_device *dss, unsigned int num_ports)
>   		default:
>   			break;
>   		}
> +		of_node_put(port);
>   	}
>   }
>   
> @@ -1208,11 +1209,13 @@ static int dss_init_ports(struct dss_device *dss)
>   		default:
>   			break;
>   		}
> +		of_node_put(port);
>   	}
>   
>   	return 0;
>   
>   error:
> +	of_node_put(port);
>   	__dss_uninit_ports(dss, i);
>   	return r;
>   }

Thanks, applying to drm-misc.

  Tomi
