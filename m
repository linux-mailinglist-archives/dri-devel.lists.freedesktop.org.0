Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2677D9E3D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896F710E032;
	Fri, 27 Oct 2023 16:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F4810E032
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:56:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5082a932bdeso1116427e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698425769; x=1699030569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3d18pJO7ZCq9XhoCxYiBlHoIVFAF0YcCzxxA38+x4U=;
 b=E3TFrZvv4K3xqcWTdwxxUuagoY8eK91Q7CL9gO9JovgCr7mD/EGLfAh92C0gUcWsRM
 3jUgM4lhNPp5u9KdQQFXv15518XXBStk6vrCfu4cwlbRrAlKxGhWA+c9LTaCWzc07H1L
 8LZSpVeln/pEqMQeHT1JOCE9eOybbmnoUytBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425769; x=1699030569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3d18pJO7ZCq9XhoCxYiBlHoIVFAF0YcCzxxA38+x4U=;
 b=GChDKaummma8TqF5PXwfnoahAc4T6m8NFNpIpeFLUwMIYp6+1+7P7IMyHL9fJnqjKW
 cwU3uNrh5xLutKby8LDUAvwlkFJYS6fdP/BIvCj3ncwSLC/IpdLOI3yYAWGFb9DqzinL
 UwPnA2lPKXUCAnEDMvkvipLAp/SE3EqV8NWKNJykFrkJezul6M7ncuewUkCMJZDXqq82
 UwaxQ4Sir9nMlu7Jx+q+i/nlvk5Gjpo2OZmrq649ZGjKsS0tZOSy/vXqID9DyGxlTXZv
 jGBGU/s24ScNeRLwx6GEQp+3C5I8RNqppFGtNpuBr0zdVPqdil6995xMHJokJ4gaTYFn
 3EzQ==
X-Gm-Message-State: AOJu0YxPwLWfvdAs3XFsfYu3zengPjVrZZAdEkgJJb1Srkp7RGX7bISg
 eB1TCu54a+hTD8TxRoRpoe1mJkYNHQndLOyJyTh3DtY0
X-Google-Smtp-Source: AGHT+IEbm5xZrks5tLidaJ5bq24499KroxYU2cVIbNSHo3PLhNEevEc2sFB2CMCOwwIaywurViV0pg==
X-Received: by 2002:a05:6512:2f6:b0:507:9b4a:21c0 with SMTP id
 m22-20020a05651202f600b005079b4a21c0mr2256229lfq.42.1698425769010; 
 Fri, 27 Oct 2023 09:56:09 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 c8-20020a509f88000000b0053f10da1105sm1501488edf.87.2023.10.27.09.56.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 09:56:08 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so426a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:56:08 -0700 (PDT)
X-Received: by 2002:a50:c101:0:b0:540:e46c:5c7e with SMTP id
 l1-20020a50c101000000b00540e46c5c7emr8017edf.0.1698425767993; Fri, 27 Oct
 2023 09:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231027110435.1.Ia01fe9ec1c0953e0050a232eaa782fef2c037516@changeid>
In-Reply-To: <20231027110435.1.Ia01fe9ec1c0953e0050a232eaa782fef2c037516@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Oct 2023 09:55:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VD6nooPcrcBoV1_7c869wz3vnQgD=-JabgzxbDv8Rxjw@mail.gmail.com>
Message-ID: <CAD=FV=VD6nooPcrcBoV1_7c869wz3vnQgD=-JabgzxbDv8Rxjw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel entry for AUO B116XTN02 and BOE
 NT116WHM-N21,836X2 and NV116WHM-N49 V8.0
To: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 26, 2023 at 8:05=E2=80=AFPM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Add panel identification entry for
> - AUO B116XTN02 family (product ID:0x235c)
> - BOE NT116WHM-N21,836X2 (product ID:0x09c3)
> - BOE NV116WHM-N49 V8.0 (product ID:0x0979)
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 3 +++
>  1 file changed, 3 insertions(+)

nit: the ${SUBJECT} of this patch is too long. It's OK to go a little
over suggested lengths, but this one is probably too long. Other than
that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...as per my usual policy, I don't let simple changes to this table
sit on the list. I fixed the subject myself and pushed to
drm-misc-next:

3db2420422a5 drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2,
NV116WHM-N49 V8.0
