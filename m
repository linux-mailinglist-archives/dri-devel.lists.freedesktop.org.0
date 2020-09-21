Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868AD2732E6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 21:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CFC6E532;
	Mon, 21 Sep 2020 19:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F79289C89;
 Mon, 21 Sep 2020 19:33:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b79so600053wmb.4;
 Mon, 21 Sep 2020 12:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tyqvRKFdtD8PMSb4v0LigIpVlIKZ32P+rPNhgG6iABo=;
 b=dTQiKQxbEPtUs+n52KETE43PkUq3kWFrLO2K1V7yfsGbLkbhi33Nye5NJcd55y9s1A
 PLJXb0CAjqa96NUyoZWQsPEE10VwZp5yypF+Xf6vj9/UpaHGw1sl9gwqVIirXEkML9S6
 lZcCbV/WEIlkz89V3iJoIMIUfAfUagbDJ5BqRkpk5/nbLEVvvHczBJ+h+lful/czbpGo
 dHLKeKsD0Mqp3Yy8ZqDR7l3a/fEC72RgaA4Qv0ugdP2g1L97jDJ1cjk1nc6s0oi5tJIo
 hVrlfA4JLKhhBSgn+4uQWkdsXUDBndi+CJTtwQN3ING5Wl9XdZeT1N8Z7WpbyZMmatCu
 d+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tyqvRKFdtD8PMSb4v0LigIpVlIKZ32P+rPNhgG6iABo=;
 b=K3QRa3usxreo9G6oISuFxLRjoj5sOawEBG8Jg/pVcI62UEbcNVbT7Crr6qg/ILiVmG
 3vHR4oKLcP9cKfPsENCtxLxDAzlq5hCC3anjaewVMmS85CeXyuxMLUy4klZ1RpbyI1Mu
 a/xmP9CfMOBgv40cKmWQ6RrLEmB8ksLx8shBIhdX7kFhKeYV5s4qHFeT94F6eH4FoWJC
 7hcfGgA/1aEvRL9TR5F+IJqiarrnmfiDVJAUA0R+6EAYcAU4FcJC8pF9wqy92AIBlbTX
 0KIBEk30lt1oU/uX8pvRfTmFg67C3vWkc2lqzxp38q873lNy8zsP/BPjDl6atYamDlLL
 kqEw==
X-Gm-Message-State: AOAM5312sQUISNKjOGajNzsFvbqkYAa/3bZFnXUFLFZnpZd1T12NfY+O
 7ZMx2nMrQAwMikvZfKaIGLhkyzPcgwx+b8+aqnI=
X-Google-Smtp-Source: ABdhPJz9ExPKuXj4QoQ/WsmFt1o/wLN8n6bfP18yT+wpV/WCvYVUcTDZXQdaVyPM7AYXRszBry3ZzoSD0AdJ9D+X3Ao=
X-Received: by 2002:a1c:a953:: with SMTP id s80mr885650wme.70.1600716811772;
 Mon, 21 Sep 2020 12:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200921114244.20506-1-bernard@vivo.com>
In-Reply-To: <20200921114244.20506-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2020 15:33:20 -0400
Message-ID: <CADnq5_PJrpJpPjexVpN-r_9XZbKDS3NnQ=dBS5RdO1NYjw+8uA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: optimize code runtime a bit
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Martin Leung <martin.leung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Brandon Syu <Brandon.Syu@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 abdoulaye berthe <abdoulaye.berthe@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 9:14 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Static function dal_ddc_i2c_payloads_destroy is only called
> in dal_ddc_service_query_ddc_data, the parameter is &payloads
> , there is no point NULL risk, so no need to check.
> This change is to make the code run a bit fast.
>

How about just getting rid of dal_ddc_i2c_payloads_destroy() and just
call dal_vector_destruct() directly.

Alex


> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> index b984eecca58b..6dcc666738fc 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> @@ -150,9 +150,6 @@ static uint32_t dal_ddc_i2c_payloads_get_count(struct i2c_payloads *p)
>
>  static void dal_ddc_i2c_payloads_destroy(struct i2c_payloads *p)
>  {
> -       if (!p)
> -               return;
> -
>         dal_vector_destruct(&p->payloads);
>  }
>
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
