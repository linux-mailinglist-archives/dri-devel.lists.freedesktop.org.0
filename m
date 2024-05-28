Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729F8D26A5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A976A1127DE;
	Tue, 28 May 2024 21:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QWYrUQAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4411127DE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 21:01:17 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-794db1ee9f1so41110085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716930072; x=1717534872;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCcnpJubZASOor34aOMFA4z8fa+dAgrJm6IkELF/PzI=;
 b=QWYrUQAPPenjSDnU0M6eZlBzG+12O+6hIbMnsTmHxjvdcUtSWOTOmGCHaQo5afvNKI
 I/+qKH3Fskikej8EkhdM+wvpWrUdRkbY0/aWaY8sEF4X3A51qBdSaGhD+FwnfKv6tJxu
 ZwlolLdgQ/XMZenJTQoJD6RWEhqQ/WKFwZbTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716930072; x=1717534872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCcnpJubZASOor34aOMFA4z8fa+dAgrJm6IkELF/PzI=;
 b=VAHNOqGHfrKOMrSgxj36OM7V2TWEbmK+RwWpUKITM45V/KLctRZE29aflqj8cnDr4S
 xCR9bjfX652weRUncMoBsi13yCRFvsKlXPTPYuzGiWa1SL8btaVxugYwe2Qiic0a9QFb
 qZYULJJcXm5DazvOMVmbmblk5FVhU1wIfOcNcTGYpzb+Oau5yxgVolLaD61ptI7HBVJR
 nh26eGGXgNJjZ7DKu6EcaUCcYNOywsvPjnX4Mk4nodJpi/Du3r7mIcNizVPb70yn0KFw
 AJZov4Ssn/5e2ZtRKA2ddCc+y2EHYqvg4u0fPlhMJBASLYhV6it6sCOLYepHiHTAerIv
 pCHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbEX4Hv6QTQPDC5QsFhY3j01srXF67/Y2rJh+2p31atc+JLxLKS06zLXiT8pWiLInJhGeXZuVxf65dFRWf5Tf8PBnqmbz/YSwXB+0J3yVu
X-Gm-Message-State: AOJu0YxUslnoMdjn7SQQnT/cn67eUzK0aqLCXk27TYt3bsSgnRPNENsL
 gKID+NxZH1ytFAKF4oR+TERpfc5Q3/gRWf8rxjX82o6OWjAmwhnbgFRq7+tHODfPZE+UtPirJ/M
 =
X-Google-Smtp-Source: AGHT+IGPZHEvknXjiGQV5Bv7SLPYV6ik9m0xK50VRdR1J37v2P/fmrvjpE9G7sXYXgjvTP3gfdb6WA==
X-Received: by 2002:a05:620a:4110:b0:794:7156:93f8 with SMTP id
 af79cd13be357-794ab099e40mr1688888685a.35.1716930071559; 
 Tue, 28 May 2024 14:01:11 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794b2fd8f71sm328478785a.103.2024.05.28.14.01.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 14:01:11 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43dfe020675so156831cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:01:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWxLaHt+zwCBJkMEc/8nrq9tfmADD67kIaV0ydH00vVyH5/jA6lsNbxdhJzKJUbBvaFiupLFNyAnNIMWsYV+dJRQlFC7XgrupGMNgBmQ60
X-Received: by 2002:a05:622a:17c6:b0:43f:bba6:3759 with SMTP id
 d75a77b69052e-43fe0f4f29emr478361cf.10.1716930067998; Tue, 28 May 2024
 14:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240527095511.719825-1-treapking@chromium.org>
 <20240527095511.719825-2-treapking@chromium.org>
In-Reply-To: <20240527095511.719825-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 May 2024 14:00:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUWhBTXeszCm94TM04sbdt3bM7McsXc_Rih86STGGk8g@mail.gmail.com>
Message-ID: <CAD=FV=WUWhBTXeszCm94TM04sbdt3bM7McsXc_Rih86STGGk8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Add support for several panels
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, May 27, 2024 at 2:56=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add support for the following models:
> AUO B140HTN02.0
> BOE NT116WHM-N21 V4.1
> BOE NT116WHM-N21
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 3 +++
>  1 file changed, 3 insertions(+)

Ideally the subject would be slightly less generic, but I guess it's fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and as usual with small updates to this table I've pushed it to
drm-misc-next without a big wait.
