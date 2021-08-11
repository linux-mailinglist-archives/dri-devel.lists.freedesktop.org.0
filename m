Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B123E998F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 22:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55D26E1A5;
	Wed, 11 Aug 2021 20:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902DE6E1A5;
 Wed, 11 Aug 2021 20:15:39 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so4916551oti.0; 
 Wed, 11 Aug 2021 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jWE7VU12/NhLSBAI8reKko5Lx0IBplhjTzD3kMB00EQ=;
 b=P4atp6Byus8ywoOtAxCzKdkVerEWlZHWkngS5sUUeS1oErbXcKQDkvLycigkOwbATu
 +0GdVkWAm+ZElen6tpvEEhcTw+rjsYTf4Rz6D0jydxqjgjNQvB+VsEi4TVSTvm7aUr8y
 xq00/B3axowAqsBSJqwDUa8QTmy0cb0ID700mTdV4+fkURzTmPs/DSpCyr/4pLX+F7zD
 uenIqFqCuDZjbpGY2ZiyLRcUIP9hEGmgQ9c++rkP0kghcWDewUg3gGDHHrauUCMCNh0u
 ddfOqxV6HyBBRXR1SmAkQ5Dj/MBLYKMex7fUFpYcxTIRiQ/ulQI2LteBKmiu/ywpaA5Z
 iaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jWE7VU12/NhLSBAI8reKko5Lx0IBplhjTzD3kMB00EQ=;
 b=NWAIYszAwEwv9PkKSR3PVzVGRMs39sYYkuyf0N7tNf5SHarMJOxrs5ZmQwzGxadLPo
 tIu84HrQry/oHr2H3OAz2mBmAnKCrms1XoITIdUDLAlz9VXH29ZoblBWTjAraJ8N7a2Q
 DA8fzuwXDRNeiuxMR9gGYYu8zzoFbKNwVUpKIDYr20JcIzPtKIzr842PVmlrc+BQoYay
 IMMQ5awYBaHDyx2TdXG2SZ/ht2F7G95KBh82UUVFF6ORnnxKtpEXq8bcffqaRrQFSaRg
 R1dj+ug7/od7DNnHYq7E+BTAnAy6Mt8+E5mEXfbd5LyD3TvAZ1xkkQEngcIIoK+CTi8J
 Kq5w==
X-Gm-Message-State: AOAM5320RFxE82Z/8IZ/QzXX/zcpiGTPdlaoYpA5+sq/aoQ+EN/4m1lO
 gr//d3RKCj/Dj/FNva7CKCPoKc2fIb+SRmCua3I=
X-Google-Smtp-Source: ABdhPJwbYKEtMSc9HcmOT5BNGXm46YWUdTewMbKaIafAI/rx1XUQvEO94dA0H3phXzRueFDZViGWKSUq1IvCzn0HJFQ=
X-Received: by 2002:a05:6830:1e78:: with SMTP id
 m24mr555941otr.23.1628712938940; 
 Wed, 11 Aug 2021 13:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210811113458.6940-1-islituo@gmail.com>
In-Reply-To: <20210811113458.6940-1-islituo@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Aug 2021 16:15:27 -0400
Message-ID: <CADnq5_M5jS2LNhH1im_KSgraTF3Z858PXTxvke45-7ZAnANOMA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: amdgpu: amdgpu_i2c: fix possible
 uninitialized-variable access in amdgpu_i2c_router_select_ddc_port()
To: Tuo Li <islituo@gmail.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "Tuikov, Luben" <luben.tuikov@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Jia-Ju Bai <baijiaju1990@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Aug 11, 2021 at 7:35 AM Tuo Li <islituo@gmail.com> wrote:
>
> The variable val is declared without initialization, and its address is
> passed to amdgpu_i2c_get_byte(). In this function, the value of val is
> accessed in:
>   DRM_DEBUG("i2c 0x%02x 0x%02x read failed\n",
>        addr, *val);
>
> Also, when amdgpu_i2c_get_byte() returns, val may remain uninitialized,
> but it is accessed in:
>   val &= ~amdgpu_connector->router.ddc_mux_control_pin;
>
> To fix this possible uninitialized-variable access, initialize val to 0 in
> amdgpu_i2c_router_select_ddc_port().
>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> index bca4dddd5a15..82608df43396 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
> @@ -339,7 +339,7 @@ static void amdgpu_i2c_put_byte(struct amdgpu_i2c_chan *i2c_bus,
>  void
>  amdgpu_i2c_router_select_ddc_port(const struct amdgpu_connector *amdgpu_connector)
>  {
> -       u8 val;
> +       u8 val = 0;
>
>         if (!amdgpu_connector->router.ddc_valid)
>                 return;
> --
> 2.25.1
>
