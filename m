Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F848656D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 14:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D0710FCBF;
	Thu,  6 Jan 2022 13:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16910FCBF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 13:43:10 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F61A11FE;
 Thu,  6 Jan 2022 14:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641476588;
 bh=MsV4ID3pm8SwQUHMPkDeAsywg1tEqg7BBjSrRVk1xSc=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=vwpLM9Qf2S/3/+fjBGOte1S+a6HvkWHyqFT4C1oQIPBLUOQdjH0AI91/HS2YXZGt/
 GPiG8VvEyVgOazuGHIus4roqVwqrHVwMs3tiPMDa+BLJeGwlTeNSQ32AMrMPkYyEGp
 1Zjt78leG5xQqRkiH75wUzU0uCsQE8GC04K+HDyg=
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, sumit.semwal@linaro.org,
 christian.koenig@amd.com
References: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm: omapdrm: Fix implicit dma_buf fencing
Message-ID: <0ba4b947-57e0-8a80-68d6-a481d5145ab4@ideasonboard.com>
Date: Thu, 6 Jan 2022 15:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: philipp@uvos.xyz, airlied@linux.ie, merlijn@wizzup.org,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 05/01/2022 17:36, Ivaylo Dimitrov wrote:
> Currently omapdrm driver does not initialize dma_buf_export_info resv
> member, which leads to a new dma_resv being allocated and attached to
> the exported dma_buf. This leads to the issue that fences created on
> dma_buf objects imported by other drivers are ignored by omapdrm, as only
> fences in gem object resv are waited on. This leads to various issues like
> displaying incomplete frames.
> 
> Fix that by initializing dma_buf resv to the resv of the gem object being
> exported.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index f1f93cabb61e..a111e5c91925 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -88,6 +88,7 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags)
>   	exp_info.size = omap_gem_mmap_size(obj);
>   	exp_info.flags = flags;
>   	exp_info.priv = obj;
> +	exp_info.resv = obj->resv;
>   
>   	return drm_gem_dmabuf_export(obj->dev, &exp_info);
>   }

Thanks! Pushed to drm-misc-next.

  Tomi
