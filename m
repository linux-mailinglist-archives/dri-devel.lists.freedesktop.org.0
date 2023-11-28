Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072807FC9BA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3718E10E34E;
	Tue, 28 Nov 2023 22:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E493A10E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:43:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9fcfd2a069aso840115666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701211387; x=1701816187;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMaZbAerACdlkvgT9TKXxbixHEibkUu2cUgc5bnvXQo=;
 b=M98frUbx8b3F84mPjYSF0b7xshvrVS9sVh1adJVj642FUvC2ceZOYIH+IZqHJdSBjA
 T6wCqLtNxg9Ovy/lDVCFvnzdzaCCuGstCI0wp72RUxjv5nNP2Rg2Lb/FAXf0EIGuGu4o
 EvJr+uwV24DlAI861+OKzP6DXUrRsoDjL9h2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701211387; x=1701816187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMaZbAerACdlkvgT9TKXxbixHEibkUu2cUgc5bnvXQo=;
 b=uF10Dbw3dtYPwZRXdG+6d42uoQQYWUfgqvDCPaRIz1ReKs0koQQcS7uyqMAp6m7p6G
 zX+LhbaFzFlOaFuUxJPyy+QWS1tQnqsGTdTKcUmDrrXvw4+ijOtGvgxHYeKX5QZ7aq6K
 Bbemxvzw+ImPWFolHjqMWiAlcwCrUciGEimHzNdywDdfJDboPpWF5KvrgfuzDr82tpZW
 eQsju5fDw7tvpU4wo0cU8qle+HHt3RULOsIBm6KwdaMxcKd2taXfth34TTgrZ2bjlZNe
 dR8pw07vqjXfkK2FheokZG07mOb12C5ChlFPVyK2e8BlMVWaOMpKC77/WwUUdemZ1u67
 KZ8Q==
X-Gm-Message-State: AOJu0YyrB1XyD8Hbge6mqUUVqeiJPSthUnDOAtuVOVrVvHfBfkBaCXxH
 3CTns8Zu72AC1ktPrraCIAqPZ+WXj7bBXVllLFP87omo
X-Google-Smtp-Source: AGHT+IGGI8E4YAhhID+VwbPHyIsslcomqod3982xUi/iB6Nr4bL0SjQRb/OJiyARZYqdGzlY/4uuMw==
X-Received: by 2002:a17:906:69c9:b0:a03:69e:f616 with SMTP id
 g9-20020a17090669c900b00a03069ef616mr10418192ejs.57.1701211387119; 
 Tue, 28 Nov 2023 14:43:07 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 v5-20020a170906488500b0099cc3c7ace2sm7391104ejq.140.2023.11.28.14.43.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 14:43:06 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40b35199f94so27315e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:43:06 -0800 (PST)
X-Received: by 2002:a05:600c:3b03:b0:40b:33aa:a2b9 with SMTP id
 m3-20020a05600c3b0300b0040b33aaa2b9mr799601wms.4.1701211386445; Tue, 28 Nov
 2023 14:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-3-hsinyi@chromium.org>
In-Reply-To: <20231117215056.1883314-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Nov 2023 14:42:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VwFNjfem-pEqqfqQ70uLkOFOftpJY5K5jTOdPsiTRt+Q@mail.gmail.com>
Message-ID: <CAD=FV=VwFNjfem-pEqqfqQ70uLkOFOftpJY5K5jTOdPsiTRt+Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] drm/panel-edp: Add auo_b116xa3_mode
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 17, 2023 at 1:51=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Add auo_b116xa3_mode to override the original modes parsed from edid
> of the panels 0x405c B116XAK01.0 and 0x615c B116XAN06.1 which result
> in glitches on panel.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v6->v7: split usecase to another patch.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

Pushed to drm-misc-next:

70e0d5550f5c drm/panel-edp: Add auo_b116xa3_mode
