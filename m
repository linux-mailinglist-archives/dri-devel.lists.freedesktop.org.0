Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BB3AB6AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 16:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4930A897FF;
	Thu, 17 Jun 2021 14:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B376E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 14:58:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f2so7118749wri.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZpkJ+MYgphvbo+BSBH3Zpu7neLYi4f02rnh8CEAedOQ=;
 b=ulwjGky6X26LXPC1yb3zn8bl0jSp6um6+lphjLL4AtnI3F7fKbqCto97dg/wZLIELG
 geqk0K+MYYWf5Rk9tgpAiNJRol3WZCza4miVvbqXhr7l5U3cqLcwvdHLcbUDCjU2La6H
 P1RLtnXU8fNWQ+omJ90vSDOJ+kFmgwLpCcLTKuo/gouam2wEp8JKCr+jP2qUmZ2R2ATK
 JXY7nNt6fy/sCIznCrjtvg+w1addU7qkpeO0W0ahJPgwxXTvm+UdeZWZtA0BClDd7tMx
 668UoML4dcwzxBW1yQBEBeNWa9L3RDElz3baBNgocfo8tiW9KFF4RTEAq9En5LAElA9Y
 getg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZpkJ+MYgphvbo+BSBH3Zpu7neLYi4f02rnh8CEAedOQ=;
 b=SGwuJRFc7fFyJBJehp5MdSmOcggtp7ZphbSUcQAsK1v2RcyGA7G0cgnc6odn/vz6td
 bv5Q1NxgkT0g5i+VYnSPdf52BON7C18NOTT14FiS37h5Owdm0Tguuhp2bTnP64KYRfqH
 QkSnHIyCL6GlCMWoIEWL5LH9POlJrXl8pm6XQuHMvkIZLoqN9QHsV8IgazrhRhJGEaqA
 Y9tCtP+IYO3Xeuia1GTRshnOl42Jk5NfznNESSbx+O9FY/hNZiYVX3NN/bvw8QljVOhV
 jJWxC/hylQ1vbTxzw57TLa1R5JhFy654CWppuS/GlcMEfSk1uzVHpiblE+7R62BqqSJp
 9nQg==
X-Gm-Message-State: AOAM532XeHfICM9vtQwSkEdxImc9hf9YByjsMkFle0QcNgeOOvWhev1A
 Wy7DWEq+3IRWfmyFesAjfOwc5w==
X-Google-Smtp-Source: ABdhPJyMYMaw4LO059nv3tFrQ3aLA9CMlV1w5nxei3W97dLFTJEiJJYci7iGLUD1oVqxmgJBv+OY7Q==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr6356429wrs.170.1623941901303; 
 Thu, 17 Jun 2021 07:58:21 -0700 (PDT)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x18sm5580002wrw.19.2021.06.17.07.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:58:20 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
To: Jiajun Cao <jjcao20@fudan.edu.cn>
References: <20210617070737.50171-1-jjcao20@fudan.edu.cn>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0c367cae-9bad-d53a-01db-3d2dd801965b@baylibre.com>
Date: Thu, 17 Jun 2021 16:58:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617070737.50171-1-jjcao20@fudan.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, yuanxzhang@fudan.edu.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/06/2021 09:07, Jiajun Cao wrote:
> Fix a potential NULL pointer exception when meson_drv_unbind()
> attempts to operate on the driver_data priv which may be NULL.
> Add a null pointer check on the priv struct to avoid the NULL
> pointer dereference after calling dev_get_drvdata(), just like
> the null pointer checks done on the struct priv in the function
> meson_drv_shutdown(), meson_drv_pm_suspend() and meson_drv_pm_resume().
> 
> Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 07fcd12dca16..adea6a2b28f5 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -380,6 +380,8 @@ static int meson_drv_bind(struct device *dev)
>  static void meson_drv_unbind(struct device *dev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(dev);
> +	if (!priv)
> +		return;
>  	struct drm_device *drm = priv->drm;

Please move struct drm_device before the if like :

struct meson_drm *priv = dev_get_drvdata(dev);
struct drm_device *drm;

if (!priv)
	return;
drm = priv->drm;


>  
>  	if (priv->canvas) {
> 

Thanks,
Neil
