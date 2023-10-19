Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A407D0436
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8117010E56C;
	Thu, 19 Oct 2023 21:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7046610E56C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 21:51:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so28078866b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697752262; x=1698357062;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XF9t5trmYV2tU8uP1V1uGs3giS+nQ6cAeAndNsOA6c=;
 b=djDBBLjZSdwoCeiG46e6Tfs6LaaklaQbUl2mze6BPfZGue+BvrrnKeqosrvelcbBAF
 D/WYN01Fsg8aXVyzy/hC8hhUM3na2TSKar7JHuGVKpOj2E9RgNh3C3EXdgfSC5I0gDDw
 CLmkw4i9T5uTMpV/bOSz2GMEM8hdplxslU6vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697752262; x=1698357062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XF9t5trmYV2tU8uP1V1uGs3giS+nQ6cAeAndNsOA6c=;
 b=LkJnFdUZPgbRCnw8Ul0IcV1jqAhGJZ4YDXvNvPOxyzLEXcW8qUnfp3WbSfQbRfuWki
 IyLz3kjUHBglJOMnC5wu2ZI7ghknJJtIrC2LdvOUmK1eVZKSXVhAo082OyhPiNi5ms1f
 9+2DcBpFi7s8lwKsh5ISwKIJeVhb99Gt9Nn89GnHNbIemxiKujQ+dGB2n/PpLBE3upDy
 BeC3iYiUD3sOy5C8/sBeJfcua9tkpywH5Ken0z99nNw+ognVjRnI6oxN1vNRy3FvY9qx
 YGFtMjXfCGFkJoMIC+m4DCjbk8zOKgK9E5dATNdkmDCpl69hPX5KiQydkJx5RHemBgZM
 fWRw==
X-Gm-Message-State: AOJu0Ywu6ivL88AH3rhPCpy+n5VnXrpNyRb0e/hnvN3bd/LSuikWXDYZ
 NzUJiku1JUN5Y8GhJWk2LtY31c/zfanCsgUgFXV9a264
X-Google-Smtp-Source: AGHT+IFmRXEElwdzqkqL0x1vKF9m/AaV5BOyFaNhBFl+G3yHPVzBZtpb2Y9s3Nbw38rFZCMZgniPKA==
X-Received: by 2002:a17:907:3687:b0:9be:aebc:d480 with SMTP id
 bi7-20020a170907368700b009beaebcd480mr2409321ejc.24.1697752262437; 
 Thu, 19 Oct 2023 14:51:02 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170906398400b00982a352f078sm234413eje.124.2023.10.19.14.51.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:51:02 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-53f647c84d4so5024a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:51:01 -0700 (PDT)
X-Received: by 2002:a50:8d59:0:b0:53e:7ad7:6d47 with SMTP id
 t25-20020a508d59000000b0053e7ad76d47mr25591edt.5.1697752261284; Thu, 19 Oct
 2023 14:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
 <20231013091844.804310-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231013091844.804310-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Oct 2023 14:50:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8fDO7q3k8DmXHPnX0XrryzY1-zcuU6N1ZmDo=O3anLw@mail.gmail.com>
Message-ID: <CAD=FV=U8fDO7q3k8DmXHPnX0XrryzY1-zcuU6N1ZmDo=O3anLw@mail.gmail.com>
Subject: Re: [v4 3/3] arm64: defconfig: Enable ILITEK_ILI9882T panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, Oct 13, 2023 at 2:19=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> DRM_PANEL_ILITEK_ILI9882T is being split out from
> DRM_PANEL_BOE_TV101WUM_NL6. Since the arm64 defconfig had the BOE
> panel driver enabled, let's also enable the Ilitek driver.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

c2635c0ec8b4 arm64: defconfig: Enable ILITEK_ILI9882T panel
