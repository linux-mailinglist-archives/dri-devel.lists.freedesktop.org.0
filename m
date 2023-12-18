Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE78179BC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806E410E2C5;
	Mon, 18 Dec 2023 18:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9C510E279
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:29:53 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2c9f413d6b2so37206041fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702924192; x=1703528992;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1aUBcpvKGT+MVST7gLJpsdhDGoD1QfbphX+istIq1xA=;
 b=V9igRyLl1f8wFotVB5l/xtagXqUOWYEAttFxrM/Q9agQB++8zeqRpFGnlWRdiGlrxw
 O2Frwwp7RAz1gU4HoOvXSaY4MB8gwLfw8BrQXhbCNJtQHQi3m+5057buc+hVVSeuYoTg
 dPdHiY4TrssIqDgrud8pxjoLFpyckXgKn+eaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924192; x=1703528992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1aUBcpvKGT+MVST7gLJpsdhDGoD1QfbphX+istIq1xA=;
 b=JYdqHrPYCkJG2O4A9fwQtMZRHL244Rv3xlR9G51hVoyWZUHXrr4eQXnekGz29cqXLU
 XOSDMRsIGEllcSNLpOxzP0Ql2JbjAXXDpRFUEd2MmdchpMeHto0bvOVGEluVSADeHIwB
 Bo7SnTaVT0l8qQfqp1iquAIOpKb+TGOEl4uTl1NrzXEHuPPNNa0aI60yPfS6v5/I12i7
 KwumlSW1OkFKhO+J3h4FhZA2hTOMQA3E7erNMel5CpBnPThWIlsrShW638j4OWP56Fr5
 3cQyHBcT+CtU/8YdWaJsFTxd4EUP6lc7ZCa+B/7K1heTzbv2nRw5Ef3fY4968UC54aF5
 iIWg==
X-Gm-Message-State: AOJu0YyywFplK2hQP1ZVj0/DJgie1k9t5hyw0YP85g+5LhP1sjYFknNF
 aNdOF97hHWgHCED9S9igLqjOMj9641T7gtYsfLqe1EZ/
X-Google-Smtp-Source: AGHT+IHrG5Y+hfI5RJ7QKve6Xgm48HiTdA1rbiTN94glHGThpgewychP/9tecPNrCw2ASTn2Cnth3A==
X-Received: by 2002:a17:907:75ee:b0:a23:3383:8d23 with SMTP id
 jz14-20020a17090775ee00b00a2333838d23mr1082044ejc.22.1702917741257; 
 Mon, 18 Dec 2023 08:42:21 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 ub27-20020a170907c81b00b00a1df4387f16sm14470742ejc.95.2023.12.18.08.42.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:42:21 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-552eaf800abso20513a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 08:42:20 -0800 (PST)
X-Received: by 2002:a05:6402:22fc:b0:553:7ff4:5885 with SMTP id
 dn28-20020a05640222fc00b005537ff45885mr32312edb.2.1702917740102; Mon, 18 Dec
 2023 08:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20231214152817.2766280-1-treapking@chromium.org>
 <20231214152817.2766280-2-treapking@chromium.org>
In-Reply-To: <20231214152817.2766280-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 08:42:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WshKAWRe44ke-C6XnmBBFoPn1sJovGfVAFrQ55LuB8tw@mail.gmail.com>
Message-ID: <CAD=FV=WshKAWRe44ke-C6XnmBBFoPn1sJovGfVAFrQ55LuB8tw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/panel-edp: Add powered_on_to_enable delay
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
> Add the support of powered_on_to_enable delay as the minimum time that
> needs to have passed between the panel powered on and enable may begin.
>
> This delay is seen in BOE panels as the minimum delay of T3+T4+T5+T6+T8
> in the eDP timing diagrams.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v3:
> - Collect review tag.
>
>  drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Pushed to drm-misc-next:

4464af92f276 drm/panel-edp: Add powered_on_to_enable delay
