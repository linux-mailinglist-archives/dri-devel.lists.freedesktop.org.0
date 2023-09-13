Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A2679F108
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2A10E4D4;
	Wed, 13 Sep 2023 18:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58310E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:20:47 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso18913366b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629245; x=1695234045;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wB9rIbKtdC8vvE0Z9iK8mxaspRNseaVhibM5IMYjY18=;
 b=ePJOgzDaTY3dEHYDW2aAIjHrgomYq5cqSU1ySbR2xEhX78d8h3MZJTR5+GFmE9lmTX
 EltWQIUUmmPJuzKupGeL85myXhgf9QZjvtTsFmzD6Ml5KO5C/TO0JFl5y+ezK3DRzMFQ
 iSwiBYdQKXc9ssL4cX7j3x7Rp97/2ULR3+cBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629245; x=1695234045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wB9rIbKtdC8vvE0Z9iK8mxaspRNseaVhibM5IMYjY18=;
 b=VH0M647mLRRsM0WSg4BC5ce7vNQzkINBH+5JWe+r0oLzoqxG9qBiOUTRF6GT0bVVlT
 L7gHcnwMRjhCpmD2WsORRmIsqIERJoD8nWd4JssrXPW+mXWpYeXSSgrV3I7Wc1si620H
 F7vM3f8aXpjHwdQ+Ql/oALKqjbsuPexYVApVukEAatOXjhP6L/aMjuCCNDj1ogqdwWiP
 JvaMRr/xuVBMPdyEhsOArHtTYOojyGuUF0cFKhx4si1XkxJ9eG2XTTc/DYQuYkutqwTy
 BHHT4lWK/2cwzru3Tww8X1CyJfx9ubtscCujxvMM8O9IbBxNrtGxwyKCskgiYbj275fb
 +/EA==
X-Gm-Message-State: AOJu0YyzYRB2cUVlvC7HRN1teUKyVO0vwQdbMGPIe389v1vfyOuD32pK
 ojitlwNXzInldsHA3XGKvIDsjtSfm6egxx+WNOdMq81i
X-Google-Smtp-Source: AGHT+IGWw8dUnWLflRt/IYZYoj56RJOM7ekk4u75C14Rml4po689ZkAYxHGarprt7bSrJPbkGwJtlA==
X-Received: by 2002:a17:906:5199:b0:9ad:7d5b:ba68 with SMTP id
 y25-20020a170906519900b009ad7d5bba68mr2531550ejk.32.1694629245538; 
 Wed, 13 Sep 2023 11:20:45 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 a26-20020a170906369a00b0099cc1ffd8f5sm8789086ejc.53.2023.09.13.11.20.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:20:45 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso9355e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:20:45 -0700 (PDT)
X-Received: by 2002:a7b:c3c8:0:b0:400:fffe:edf6 with SMTP id
 t8-20020a7bc3c8000000b00400fffeedf6mr157674wmj.1.1694629244702; Wed, 13 Sep
 2023 11:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.2.Iabafd062e70f6b6b554cf23eeb75f57a80f7e985@changeid>
In-Reply-To: <20230804140605.RFC.2.Iabafd062e70f6b6b554cf23eeb75f57a80f7e985@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:20:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCMsgAgdiRiL5_a7BWsj+unGZzuJrxr+OdyNfXtzsWiw@mail.gmail.com>
Message-ID: <CAD=FV=UCMsgAgdiRiL5_a7BWsj+unGZzuJrxr+OdyNfXtzsWiw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/10] drm/panel: s6e63m0: Don't store+check
 prepared/enabled
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 4, 2023 at 2:07=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> For the s6e63m0 panel driver, this actually fixes a subtle/minor error
> handling bug in s6e63m0_prepare(). In one error case s6e63m0_prepare()
> called s6e63m0_unprepare() directly if there was an error. This call
> to s6e63m0_unprepare() would have been a no-op since ctx->prepared
> wasn't set yet.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 25 -------------------
>  1 file changed, 25 deletions(-)

In response to the cover letter [1], I proposed landing patches #1-#3
directly from here while we resolve the issues talked about in
response to patch #4 [2]. I didn't hear any complaints, so I took
Linus W's review tag from the cover letter and pushed this to
drm-misc-next.

d43f0fe153dc drm/panel: s6e63m0: Don't store+check prepared/enabled

[1] https://lore.kernel.org/r/CAD=3DFV=3DUFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa=
-hX_p0dF+Q@mail.gmail.com
[2] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b2=
34f89613b5cec0f14@changeid/
