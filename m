Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC494971F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD9C10E3D9;
	Tue,  6 Aug 2024 17:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W8nl8Fe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556B10E084
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 17:52:42 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5d5eec95a74so592517eaf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722966759; x=1723571559;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5W2l2GkWTnRzvV1UUGjKmQpo2CkW6GJdcOBrie/UAMQ=;
 b=W8nl8Fe6zpVm0nLQEPb0XMrdAW0VV6G3F+ILhEgmcnffOMKFeCAjdNrmeCIwlrAM/I
 KJN46sm4bfCo9NqOar7W05fpugi//c445NBIXTOvWzt3AGDKa4y0HTI2u4FXGTaDFp5S
 1LdAHcbhTyUq6T5MQJzQPfjoUowByBb2dmyEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722966759; x=1723571559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5W2l2GkWTnRzvV1UUGjKmQpo2CkW6GJdcOBrie/UAMQ=;
 b=LEO2ou2puBYScYLqm/O8XhKvZ8WxomSWkS3z0UJk9qLPPfXVhNhfxxQeVgw0MLysnl
 bOFgYrfokc5ELSW0FevptKxkf9kWD8tJ9nbwi10+AKDGpV6YMcubzUowYB8LIQIFkxDY
 BPOVn23mB5fQNIyvw0cFHH4X7DAbayqfcuRiD6c/COrBLsqTyoGR3NGoq3WhTE9a+7Vt
 Vl4QB1c6bkKzUHcd2M/zQUicEkm5SK8HmSaxBsKwOwQ8zk7sm3vPjjyqoVEoy3yzVdXl
 tUx+HMK/GZtOREdbd7uoRS7Gj3do/nijvrvR9sOZiNK6QV7dCXroVf2C9+cU29efWmbQ
 3o7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Q5kM3ufT7ECv8jm8wQIaIBvRHUu7JbwRuvi/LmP/UG7tm0rt1S3ICdI3BQaiKPkEa8K07VTeijrQccaoo1fSyyCKiHFjDuj/L+ztCmfq
X-Gm-Message-State: AOJu0YwjxcC7WjDubNMVydfqWyJyIqTU8cvdd9FGlzzjPypHNhhkcwr8
 ZTpEc2LVrPuOaQ23yr6+NmuAgsMM+1Yl+0codCNEdiLvIOJcN55FUiSzQSa5b3+s6Qy6LLs2lPD
 h68jR
X-Google-Smtp-Source: AGHT+IFvYtKHDP9ap2if5MAiUEl7QtF7twqEtfRR9llhohC4Bd5qKpCbsuwG0fiK53cZtMGXtKx3lw==
X-Received: by 2002:a05:6359:695:b0:19f:4967:4e8f with SMTP id
 e5c5f4694b2df-1af3baf0119mr1236781655d.22.1722966758626; 
 Tue, 06 Aug 2024 10:52:38 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c79774csm48701986d6.48.2024.08.06.10.52.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 10:52:37 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-44fdc70e695so580751cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 10:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWg0AZtNOgjiaxYeGIPQlv86qTsByPJ6VxkrMngS4KDQw17GreNrIguP6tcRS/8/Ay/DVv9MBywp20CQQIhbo31LBP5nyM9qOfNgbdNcKT+
X-Received: by 2002:a05:622a:1aa6:b0:444:dc22:fb1d with SMTP id
 d75a77b69052e-451c59c3f0bmr133271cf.12.1722966756828; Tue, 06 Aug 2024
 10:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com>
 <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
In-Reply-To: <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Aug 2024 10:52:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
Message-ID: <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Jul 31, 2024 at 4:39=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jul 29, 2024 at 1:57=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to land this in drm-misc-fixes next week unless someone
> objects. "fixes" instead of "next" for the same reasons discussed
> previously [1] that the dts patch should probably be considered a fix
> and there's a chance that the dts patch could land in an earlier
> version of mainline than the bindings unless we consider the bindings
> a fix.
>
> [1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-crd-b=
acklight-v2-1-31b7f2f658a3@linaro.org

Landed in drm-misc-fixes.

[1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02
      commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df

-Doug
