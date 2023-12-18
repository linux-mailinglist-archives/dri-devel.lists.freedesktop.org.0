Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0DC8179A4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F5110E1EC;
	Mon, 18 Dec 2023 18:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772410E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:26:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-336417c565eso3349917f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702923999; x=1703528799;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OcDMSZdXKbh1oCxHZVjJKFW1eLcVZ1Cx3Nt4LLC2cbU=;
 b=jLHv+cj6fcY/B6Y0kkPc0NPOONfiGyLa92oc5Tmc1iU4Bq1+o2ekmgFfWVE+QV029V
 G7GOXGD/7V02Rznb3EROsPkCokv92XJwlTs/75ThHkdxE+tpZGfNaUERb+g2SnNLfcQV
 J0yBTqh5VVpwhvQsC/rU/AfHDS+lmCAwT/b7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702923999; x=1703528799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OcDMSZdXKbh1oCxHZVjJKFW1eLcVZ1Cx3Nt4LLC2cbU=;
 b=mJi7kR17eeI713ZC7IwegpjdCn/6n18VdHPCseCGbA9xSb/f7dUkbZJ/52M3A+of9O
 Pm9w3EwDqxm/0lQllT4eHb0qT2rVtBE9HQZbyUf5qTXzYC9XQ8/dFSQm5SGj2sr4x4N6
 WKv22heGVGBf5qkuQu8BMPUkCpfhXgn5EOjHF8dhF5B/kbtah8SYvmH0tg2Un/I6m+LF
 Gacge2hKbNP/wTe7nLRkDlC2wlGvck2DiEDnlHMKnUAE/v9uDhs7Dv0SsFpVgue5dUJJ
 W+dnLHPSd8TBxw/WAJt8vLRanCkr+38DkdWISUh8DUOcv0CJipQPSw6N1FJo6Dq1hapZ
 GNDw==
X-Gm-Message-State: AOJu0YyqqErRVDVwlgZtm3pL+ilIpikhmj0zMCnZ6mNxgDWqhTIUgSrD
 sspCvz6TJdIPpZRUKw/gTYVJCOXowC/vnplNb7JEcWPP
X-Google-Smtp-Source: AGHT+IGv5X84WiDS5U6nfIOuhgX8v73Z8pKaEeK8dv/NgQZVnARaMpb4UT/1WOzzOX5DGqEZOraI4Q==
X-Received: by 2002:a50:9f26:0:b0:553:513a:e31f with SMTP id
 b35-20020a509f26000000b00553513ae31fmr749574edf.88.1702917748339; 
 Mon, 18 Dec 2023 08:42:28 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 r10-20020a508d8a000000b0054cb88a353dsm10498515edh.14.2023.12.18.08.42.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:42:28 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40c32bea30dso104745e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 08:42:27 -0800 (PST)
X-Received: by 2002:a05:600c:3513:b0:40d:11cb:e5c8 with SMTP id
 h19-20020a05600c351300b0040d11cbe5c8mr283442wmq.7.1702917747254; Mon, 18 Dec
 2023 08:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20231214152817.2766280-1-treapking@chromium.org>
 <20231214152817.2766280-3-treapking@chromium.org>
In-Reply-To: <20231214152817.2766280-3-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 08:42:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VdvQHo1Lb7bNwwJNstQdo3Jghe2kBGp68Jd6KgvCnJTA@mail.gmail.com>
Message-ID: <CAD=FV=VdvQHo1Lb7bNwwJNstQdo3Jghe2kBGp68Jd6KgvCnJTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/edp-panel: Add panels delay entries
To: Pin-yen Lin <treapking@chromium.org>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 14, 2023 at 7:28=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add panels used by Mediatek MT8173 Chromebooks.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v3:
> - Collect review tag.
>
>  drivers/gpu/drm/panel/panel-edp.c | 39 +++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Pushed to drm-misc-next:

f4ccd9fea227 drm/edp-panel: Add panels delay entries
