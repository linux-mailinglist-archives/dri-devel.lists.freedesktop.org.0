Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7584B866A1B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 07:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663F310E62A;
	Mon, 26 Feb 2024 06:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CsA8g8FJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C7C10E623;
 Mon, 26 Feb 2024 06:33:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1316760F0C;
 Mon, 26 Feb 2024 06:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19DEC433B1;
 Mon, 26 Feb 2024 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708929213;
 bh=0PRiyAQ+62sbJy+0qQ7BQF16ArN4W4vGLDTXw3kZPzU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CsA8g8FJiS9pkYyEduJdESrsWf4bU9aUVWWlsqwbVIFNdeVe0gjZJZte5cncr36ud
 yVgn9+nGImzMKTauytlPZOL2SYDKHHGI1/wgZoqqZBgMNPoSzW1w7XBfsGf+mi5bl8
 ulSZTIJFd6aqiWB4bKu6uWMqUo9Zb4hy2KHynemnHXm357R148hi25fwdkFEWPQy0R
 IJk89RDAdxnMk16qYULL9qs6l3rmvrBsiHZKOfnAaR6sWdFNVs2F2nmDN8Fb1NvjYj
 riOXOfRk4NzdjokbrSXRBOuW2Rba3VeGnV1OfMAFshQ1VKz0Oxbc6yRuJ8dsFFyiSU
 x8Q3SCH6RLH5w==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d23d301452so38845611fa.1; 
 Sun, 25 Feb 2024 22:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYOVTwKsygPuCUMqSpwK0G0DOD6t7zYpUMHRXZCZQg7NkeB8up321vcYm/rpIoYPAyAm6OvCjJddXOHBWS+1iIOve0COE8X8eFe+PH/TpjO1CWZwb8/dtPydLuSVVGPXkrdzZvkNg31MFABK1/s4ad
X-Gm-Message-State: AOJu0Ywn8iBB8tgMDFfjMsHs8KscqSXBU9yn8PkxLeXQy1a8l/81DGdb
 IYNVpguDrFBGygusRrvpHYLH1adq7c+a5sWH/d0Upeai4yW/F1iIaxdLAtinZtZBeaIr4rb6Vam
 QiOMDNHSJUZSt9wMay4D2Usr6278=
X-Google-Smtp-Source: AGHT+IHH497zRgqK39ucxBVT/PHQKHXsqK3Ktehcf6rDW3mGiZ8oyUIdR85+8eKH1h04dQVzsKJcPbGAwT1mRZAPo+U=
X-Received: by 2002:a2e:a692:0:b0:2d2:43f4:45b5 with SMTP id
 q18-20020a2ea692000000b002d243f445b5mr2730110lje.52.1708929212255; Sun, 25
 Feb 2024 22:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 26 Feb 2024 15:32:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
Message-ID: <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The driver might decide to put the _shipped files to the subdir.



Please stop this sentence.

This sounds like we are not learning.

https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8ok+7=
-CQUN=3DfQ@mail.gmail.com/




> In such
> case the cmd_copy might fail because the destination directory is not
> present. Call mkdir -p to make sure that the destination directory is
> present.


There is no justification for this.

If you need a single generated directory
(drivers/gpu/drm/msm/registers/, divers/gpu/drm/msm/generated/ or whatever)
that should be super simple.

Why does scripts/Makefile.lib need the modification?









>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cd5b181060f1..94373eeac420 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -297,7 +297,7 @@ endef
>  # the copy would be read-only as well, leading to an error when executin=
g the
>  # rule next time. Use 'cat' instead in order to generate a writable file=
.
>  quiet_cmd_copy =3D COPY    $@
> -      cmd_copy =3D cat $< > $@
> +      cmd_copy =3D mkdir -p $(shell dirname $@) && cat $< > $@
>
>  $(obj)/%: $(src)/%_shipped
>         $(call cmd,copy)
>
> --
> 2.39.2
>


--
Best Regards

Masahiro Yamada
