Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D07E75DB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86FB10E38C;
	Fri, 10 Nov 2023 00:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6926A10E38C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:18:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so2424210a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699575528; x=1700180328;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQ3q2rvys4Kv3C4TyRLLSN9g60w8HP9NiDPhmYCzW38=;
 b=Ivkz+zsCeA5pk900fm4BJi43Vfuxd6APfOu/NlMgehXvFdpQxX5QAzONw2Z69ZoId1
 XHIHkp213vI7mL7qKIkKnTzV87nBC9WuueF41mZgnJYB2vTm6xfT/6/4iUVW7bTEoQeY
 seHGRwWRruTH5AXMAfvwtFFb7FTxWm7NF1ou8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699575528; x=1700180328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQ3q2rvys4Kv3C4TyRLLSN9g60w8HP9NiDPhmYCzW38=;
 b=lmpuka+tXnwAsRIrZzj1iuIKM8eCyq+HseN4OqRWW1/K4OoRJwKpS1xqlKkkqX+V2+
 AspvN2JcLrHrkGv9rue8cad9zlV45RTwEmQ9dx+90cDMQnX4vTcLuGGDDXMoGsqWQL2r
 QIVbUVHUr/fTptWV0q6TLfI3xOxFFvxkMm7+pAg2pYQ/DU3Ccr3yf3v5lPYID/SrIvNT
 MJrgiBq/407Vl9JiuEGwyREpHCFOK7jMPB0GsoqfTvj8r3Zv96O0FgAYhOUbxxSRERem
 7PmAhAdrN/3eILgnxMZ3NebqpZuQKCrkdVCJ0kNduyau+U6keeFd+g6KfmtsInqweKXW
 4i7Q==
X-Gm-Message-State: AOJu0YwL/EppMp4anQfVtn/mclJeM0RE/iV1prpJRF470OjJNAsyT/RC
 Ly5oIwkdpfXUfbG7j7aeT0LwKAxZVH1GJ2asoCsj+A==
X-Google-Smtp-Source: AGHT+IEu5+Rl1ruuFIK6MoyhoCIHOOgfJPPgN7yInMA3cbN1G+9PuqM6hPElrQPH6iCMMC7oHgQtsQ==
X-Received: by 2002:a05:6402:34c4:b0:545:4bf4:c48f with SMTP id
 w4-20020a05640234c400b005454bf4c48fmr3443041edc.5.1699575527371; 
 Thu, 09 Nov 2023 16:18:47 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 u18-20020a50c2d2000000b0052ffc2e82f1sm454134edf.4.2023.11.09.16.18.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:18:47 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40a426872c6so66045e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:18:46 -0800 (PST)
X-Received: by 2002:a05:600c:34cd:b0:408:2b:5956 with SMTP id
 d13-20020a05600c34cd00b00408002b5956mr277978wmq.6.1699575526502; Thu, 09 Nov
 2023 16:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-4-hsinyi@chromium.org>
In-Reply-To: <20231107204611.3082200-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Nov 2023 16:18:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZ-d3J1S8gyc=g1_Bd1OffmH0JxavGK6GBykhQO3pp=w@mail.gmail.com>
Message-ID: <CAD=FV=WZ-d3J1S8gyc=g1_Bd1OffmH0JxavGK6GBykhQO3pp=w@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] drm/panel-edp: drm/panel-edp: Add several generic
 edp panels
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

On Tue, Nov 7, 2023 at 12:46=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Add a few generic edp panels used by mt8186 chromebooks.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> no change.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 51 +++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Pushed to drm-misc-next:

4d53cf814795 drm/panel-edp: drm/panel-edp: Add several generic edp panels
