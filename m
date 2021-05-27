Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485BD392D55
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27856EE94;
	Thu, 27 May 2021 11:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDE36EE94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:57:23 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id x18so383595pfi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uPq95YaXgD7epSPKYKh+PoQmAS0WvOeGkyNJSqR4vfE=;
 b=KgyYbI+wURqp7RUOyfon0odf2iQgm31SpgiwoczSVanp4tgu73c7WJDOHskU9CcdUS
 DMzfIHAC4neEl6GQuBGiji5Kz2wkecqyju4VIMsuUV2cFisE+bon4p6mOcd/QUR4dbfo
 tgOEOfuKA7y6psw3rnw10H/N2r9yuhMjTgAlMfjOLymUrmEvJModSw7VIZiyqIpkWqIy
 6wNHGCcKS9u4wmWSOWW04NBlfEy0XgmkhL2ahTbgNpe7CNii78Y/jeSfM2UNVi+jp17/
 PHrFceUB+4dkuGKImZsySzJD6PsSxAWrCvSNf0fUbnb1QJi7ZlyVAxMbna3lhshwv03M
 3C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uPq95YaXgD7epSPKYKh+PoQmAS0WvOeGkyNJSqR4vfE=;
 b=GGmEz9CEjht8ALIXevXJsJffovGI0yUyIErBfcnNredtsvmdEafuVppMv5IxtX5Tgu
 +dz5+s37ce7bOHUMnD1zV5lgw/GArc4PEErqebriNC9bARN967LLbWaeVdqjeCIlrEil
 UoPciFE2M1iog3ErwDAw6sGhjwNKm/+8D0t7XsBqLdaA4UstxCLLd9K6BbLKwnxxNrfy
 XlQAgksdsVmzswupzH30yGBvOFwoNNO3vLQrqCF6yBzITtOtqQ7T+69Ul4Zai0hYXgFv
 EDgWtsYRQ00Xcsy8dYQqyM+KTC3D6LgvOAggG8LJATO/YzXq0LGP0v9GlL5GECFN8Gc8
 DeEQ==
X-Gm-Message-State: AOAM530EHxNRNm3X4gV73H/56nHIMMw3Gfip5nZkG20j0rVxOnvNyRpO
 EEtPncJ9+EniXwQygSTPDJEATO+SLcPMR8UOsDMykQ==
X-Google-Smtp-Source: ABdhPJzMyNEnE3+7dcs6H5EaOjZJ4P4h6vI0oiPf+gjXaxXWtAdjL3uOSdMDSKMqmFqXomxCf1n/LMSuTcP4XmZdSwI=
X-Received: by 2002:a62:a517:0:b029:2dc:9daf:5e91 with SMTP id
 v23-20020a62a5170000b02902dc9daf5e91mr3387708pfm.39.1622116643004; Thu, 27
 May 2021 04:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <1621840862-106024-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1621840862-106024-1-git-send-email-zou_wei@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 27 May 2021 13:57:12 +0200
Message-ID: <CAG3jFys93VO6WhqkntpNuFGCdKNedz3HLpJEJJa=jVPb+SU+uw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: cdns: Fix PM reference leak in
 cdns_dsi_transfer()
To: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed & pushed to drm-misc-next.

On Mon, 24 May 2021 at 09:02, Zou Wei <zou_wei@huawei.com> wrote:
>
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/bridge/cdns-dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 76373e3..b31281f 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -1028,7 +1028,7 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
>         struct mipi_dsi_packet packet;
>         int ret, i, tx_len, rx_len;
>
> -       ret = pm_runtime_get_sync(host->dev);
> +       ret = pm_runtime_resume_and_get(host->dev);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.6.2
>
