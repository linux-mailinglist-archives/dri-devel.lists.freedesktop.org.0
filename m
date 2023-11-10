Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2B7E75D8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC53D10E23C;
	Fri, 10 Nov 2023 00:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C8E10E23C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:18:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so2423862a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699575508; x=1700180308;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+QzYnLmP4o/hoHhC9dU8TbOe24+y8dJpH5rWAXxVBA=;
 b=G7L0O706FpdbJBMnS4XY4Yd8eI5HnDSq6IViIbPtAWNAwUOlIToY0kdWnRcoFCUQEw
 b0jT4FTIBDlCE+wQ8ZWom5RnXHg69cjqU5oiQqy1Xh2Hb+3MaO9FdwpDM9NjxB+acBsp
 zi6+Thp7AMX2deVh83rv4s2yvEcOp0F6/3HXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699575508; x=1700180308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+QzYnLmP4o/hoHhC9dU8TbOe24+y8dJpH5rWAXxVBA=;
 b=Jzh7Im5mvGTe0YrLNLcg35U8bf8s219oCkH/hcNOhxVQBbkwNG5iqnRbAZuskL0DG1
 esLWnpsQaiaci0tUAYVVRqluDhUuXaY9/wrlHO+FLIimJU5CCAf71cWPscoyGEtTr04R
 awvNNahFbiFiWmFrBLqpXtE5bTGFyurBhrLVFyBb/6LCN2tgKppPhv3Vt44k6JmLWbx4
 cDh8NL33nV/QpL1bZOOCOVuRxl+h2qbRTRY6wab0HGYXVh/yqjYlRD2stYJ5oVByGHgL
 rgi7mhxZ6gy3o2iSaMd0AgqVzmqYZHVuUIJ+zbkGQvNRpJjX1/iy2ueAI9p4RN2mzgdz
 6LAg==
X-Gm-Message-State: AOJu0YzC4ETmLtI//DY1xm4Zj/CStBIkAFQpuifPNlyto2gVrdBnXrHM
 cjMHeK90KrakiaCVwTZpPEbooBFmE4aZZgMXjdsbFg==
X-Google-Smtp-Source: AGHT+IF0B/qixRK6odFBJFK1BSuijFKTvgkJ85X7tgq2gwBvaVapmLboDRf96nbGo4falBSF94mAhg==
X-Received: by 2002:a50:a401:0:b0:541:2476:d23e with SMTP id
 u1-20020a50a401000000b005412476d23emr5922119edb.28.1699575508081; 
 Thu, 09 Nov 2023 16:18:28 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 s20-20020a508d14000000b0054556014150sm447726eds.77.2023.11.09.16.18.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:18:27 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40a426872c6so65965e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:18:27 -0800 (PST)
X-Received: by 2002:a05:600c:34cd:b0:408:2b:5956 with SMTP id
 d13-20020a05600c34cd00b00408002b5956mr277928wmq.6.1699575507115; Thu, 09 Nov
 2023 16:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-3-hsinyi@chromium.org>
In-Reply-To: <20231107204611.3082200-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Nov 2023 16:18:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0GCcNj+9spKsjk0H2O_u5HP-u-E+QcP0UDTvcHrWy3A@mail.gmail.com>
Message-ID: <CAD=FV=U0GCcNj+9spKsjk0H2O_u5HP-u-E+QcP0UDTvcHrWy3A@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02
 name
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 7, 2023 at 12:46=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Rename AUO 0x235c B116XTN02 to B116XTN02.3 according to decoding edid.
>
> Fixes: 3db2420422a5 ("drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,=
836X2, NV116WHM-N49 V8.0")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v5->v6: split to 2 patches.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Even though this is a fix, it's not super urgent and since it'll cause
conflicts with other changes, so pushed to drm-misc-next rather than
drm-misc-fixes.

962845c090c4 drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
