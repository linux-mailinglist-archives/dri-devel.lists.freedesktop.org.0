Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B97EFB88
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5ED10E031;
	Fri, 17 Nov 2023 22:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA4F10E031
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:40:48 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso353180066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700260846; x=1700865646;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYOkd23trY47vveFxv330t7Ge1uledMtX51VxhQZTxY=;
 b=REDqWTPr86xrmhqjH2X9GSl1VQskNtxnbqtqTS82lVGaAUaYBP0KJvpAnzHJJeMzX7
 6NhR0xSWh8vBY14HiN7gvV4/HsAnrgS2l0ihk3shKRZK7giHWHvlwnv8iIJ9NiEZenN2
 X9tZYomviAD2kkDK86QklJshaUIFl9vB5FGRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700260846; x=1700865646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYOkd23trY47vveFxv330t7Ge1uledMtX51VxhQZTxY=;
 b=I9vjfABXGyz0UNhHrJTBMlNojKrWSjB3TP7eY68Kc56lB7258JKqe5xKWTXqmHdZsJ
 U/A/oqp7LUNK8X4+069bTl8KX/WNFC3yGzi4T26hESJZf9KZDg2sVCd2OJGoISVaKccc
 ZwlyKp9UArwphtIuc2lBOss0jAJLhg4nRbk4HXinoTmErd1f+jc/v9yBfma0j2/bwUUT
 vsn1Y3oOB5+qOpF6oRd50+2PJ737DrR014sBd66camouI7sZwmBr3vH312WVnm6oQnHs
 1zJ4AbWwpk4XHnilLsgR+KDKB7xj/tVPPmHFY+/9kPHvuDw+cNcaoQawjsVHfGllS2rk
 39tw==
X-Gm-Message-State: AOJu0YzxzzDkR7KdrnpTI46N9AtY00ChZiU4YRHz9tWSb4tnFtvHSvh2
 plDDCVD60MddT2W0yIYjmYzzEKkxJuzn+gQgh0GbLmz1
X-Google-Smtp-Source: AGHT+IHsw5C0m6rJMiqLznBY5VxI1hsi3tinYyrDPo6ivVSZ7prN4NvsSByN5gHV1mCRe02dGYf7nw==
X-Received: by 2002:a17:906:1096:b0:9e6:2dcf:e11e with SMTP id
 u22-20020a170906109600b009e62dcfe11emr338862eju.5.1700260846020; 
 Fri, 17 Nov 2023 14:40:46 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 h2-20020a170906260200b009e61366a4c3sm1236835ejc.2.2023.11.17.14.40.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 14:40:45 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so1320a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:40:45 -0800 (PST)
X-Received: by 2002:a05:6402:c41:b0:544:e249:be8f with SMTP id
 cs1-20020a0564020c4100b00544e249be8fmr67977edb.1.1700260844963; Fri, 17 Nov
 2023 14:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-3-hsinyi@chromium.org>
In-Reply-To: <20231117215056.1883314-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Nov 2023 14:40:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XYs2_zUU0BcrR2tK6tt5HbE03-VUn0UgkmZksQHE2AqQ@mail.gmail.com>
Message-ID: <CAD=FV=XYs2_zUU0BcrR2tK6tt5HbE03-VUn0UgkmZksQHE2AqQ@mail.gmail.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
