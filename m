Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B768D562B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934C211BDC7;
	Thu, 30 May 2024 23:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OOn5Lt4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DB011BDC7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:16:57 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6f8d688ba3cso271646a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717111014; x=1717715814;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8KNeqwgU441IhOlEftCeN31AWUkQGVDTw621Xo3rrs=;
 b=OOn5Lt4Pdat/NwwiKgAM3D+pXbtcxSS1fcqQKfGIyhQaSSexkwlVfYSbxpzFPfoT/8
 XCFGNCCRudHzYOn56feJTQGu96vY4oHrUx3IXYHCJAC/GSj6H28CM1LjdNycMOpKifLd
 ksH5m6AU0SP7F0nDlqe/dB3fY2hFVRwQdLwsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717111014; x=1717715814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8KNeqwgU441IhOlEftCeN31AWUkQGVDTw621Xo3rrs=;
 b=F3rnwHXkaUEtO2iSlvvRu5qzpwJwgNTpkxzjpCWQT+5+fbVD0RE1E6Lfg36ORfY4tL
 OoEy1A0vQTR102EUGZOM4bx2AwJVyqAkXgfxhpNxI6G5IAim/wVijHZHstrQzegNrOQd
 KHGEo9q17/09J0q35mEtPJjKoPFzxqk1kjy9RLRCPjFJ4jKhlQoTHwMObRrdQ5WcDgdm
 jd+NnHyFLiBwa+S+bqXbThUvkEbeuaDHHEkYiA2bNpEB62y3BeCZFQigm5LgGACzzisG
 UISmitcjeNSoTYjFk1mBIIB3PAell8Th5t/PeXhkbgConJOg/v381cCenfn4JrKxsJmz
 7F0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcl/M0Rb+riPegh6kh8WEYMq2VjaBvjzV5RzM9gIjYusm+edfLPTgnV0+2CrB+jf1+sJDu3jfh9bSZL+9OGdLON27gYtslPkrhibQ1tlMk
X-Gm-Message-State: AOJu0YyM9jGNy8tZbWBiKF6rHGE2Ee1xrpfByeuAB26QkttoPec8LlJO
 1aUDJWqERhsovmqabEGldxozoE+pjkz5Mcsq4bWWSaqIo7o5LSNkBx8tb9E5IFLYdZoH09TGMQo
 N4g==
X-Google-Smtp-Source: AGHT+IHvDng10eqNC8TfN6KAgdG8kts/8+5itQZRVVb969Yh2PQpiTfpImlLS5GqRufXTaDCp1x2iw==
X-Received: by 2002:a9d:765a:0:b0:6ee:102d:bd05 with SMTP id
 46e09a7af769-6f911f48510mr307378a34.19.1717111013819; 
 Thu, 30 May 2024 16:16:53 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43ff2595290sm2532261cf.89.2024.05.30.16.16.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 16:16:53 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43f87dd6866so125461cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVN9tqJpnUm8F+Y0052NpANJr1g/HY7hRM1YgJ7tbVrzPPbRLOXwLXqr8taZ+LrPftmpqKW3Cq0yHcwsnwTxmNpgAh/2jO/5f079lgGisJI
X-Received: by 2002:a05:622a:1cc3:b0:43d:e001:69bc with SMTP id
 d75a77b69052e-43ff4f80e4cmr291431cf.17.1717111012344; Thu, 30 May 2024
 16:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 16:16:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
Message-ID: <CAD=FV=XMgAnaEaHXZJL57+66OXs0afP9vurxf_ffqkum=xqEfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Thu, May 30, 2024 at 4:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
>
> Document that adding support for eDP panels in a legacy way is strongly
> discouraged (if not forbidden at all).
>
> While we are at it, also drop legacy compatible strings and bindings for
> five panels. These compatible strings were never used by a DT file
> present in Linux kernel and most likely were never used with the
> upstream Linux kernel.
>
> The following compatibles were never used by the devices supported by
> the upstream kernel and are a subject to possible removal:
>
> - lg,lp097qx1-spa1
> - samsung,lsn122dl01-c01
> - sharp,ld-d5116z01b
>
> I'm considering dropping them later, unless there is a good reason not
> to do so.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Rephrased the warning comment, following some of Doug's suggestions.
> - Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fcfc=
457fc8dd@linaro.org
>
> Changes in v2:
> - Actually drop support for five panels acked by Doug Andersson
> - Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-045d=
62511d09@linaro.org
>
> ---
> Dmitry Baryshkov (3):
>       drm/panel-edp: add fat warning against adding new panel compatibles
>       dt-bindings: display: panel-simple: drop several eDP panels
>       drm/panel-edp: drop several legacy panels
>
>  .../bindings/display/panel/panel-simple.yaml       |  10 --
>  drivers/gpu/drm/panel/panel-edp.c                  | 192 +++------------=
------
>  2 files changed, 25 insertions(+), 177 deletions(-)

Thanks! I'm happy to apply this series or also happy if some other
drm-misc committer member wants to apply it. Probably we should wait
for a DT person to make sure that they don't have any problems with
the bindings change.


-Doug
