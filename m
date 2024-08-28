Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99720962DB5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF3B10E596;
	Wed, 28 Aug 2024 16:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ho+ePN8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEA010E594
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:32:28 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7a1dcba8142so65358585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724862745; x=1725467545;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocd9Zpo6DgcIf45l8s+t0c2v2FPDJ94NLUV2A2cC1Es=;
 b=Ho+ePN8NZMSFhVwhIYN7cwmHqW9n63zs8+Kpv5dmKmKIU46M8O2wlWOrVtag9xt+c4
 33DJsbDkuWEJyw2/MOxKWJjgMERwNA8oDlshWYRgbIRi4B+6uPdQPRWjuoR3KXcK9OSp
 jHgYSMU7nFHYrwqbzGXiWZf37vLtlyD/ljTkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724862745; x=1725467545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ocd9Zpo6DgcIf45l8s+t0c2v2FPDJ94NLUV2A2cC1Es=;
 b=OfYsGba9EMFmeiCa0rtvQZiwWAlD5BAISjcrKkHUGnQ0mj+NIeq0wJVVUxPZmySAqJ
 ODlA3cbuav5CfproepVdX+sJdUt9uzvTlaOxBxlZ3BIKK+goIpqlxA9GRONoWKIK6+on
 YeeWmHUox/jdKtMU+yN7AbFFLJ/93wZum7kLilTC8bu0wjZQOzn1S1BxYHkPpZotPQx8
 uevQEQd/JWdcG6dxecq5Z0V04RdJe3IZhP6hC83JMr9Mq7g6CdF2seZz6nwaZyx6pbt2
 yLm64/sPKEFhYhFv9+7nqm/m8PQuYXIWtdhm5oWCj/GuU3xsJZ3ZNQQFgWbWbqUDNI48
 FB4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpOVC9i+syuKqUBGb4LbAiEYfo6+torfqQfJTgjUnh5wAWYnyXoM890tYMykJ2j/WhkmPrEM1c1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmQg6A6TZbgGRzNZhvdCzDMFm6Emb+0EowtFlUuEckPYOY2lwi
 Sht9zvXrhs+06ohMczE2ts1M1PEWyEnJI2Ul/0m7PBilf+kFi+OlJs9WimqjAFrQ38aGcx44H7E
 =
X-Google-Smtp-Source: AGHT+IETXFkAkZzptLtYUnNQuh4DTGU4khg5DlvZ6XEV1n5TL/hMA1U2c8uSF8w7L+sRSbzo5nUJ2A==
X-Received: by 2002:a05:620a:2496:b0:79f:1352:8318 with SMTP id
 af79cd13be357-7a803831bacmr29131285a.4.1724862745244; 
 Wed, 28 Aug 2024 09:32:25 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com.
 [209.85.219.51]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f41cdd7sm643475785a.135.2024.08.28.09.32.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 09:32:21 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6bf705959f1so8137166d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvVXWPnwWdni5TNn1GoJrfC/Ue2AYFzEvL4SIt5CZ+N5PIIEoCkN+22B0d5ooyEJOFaBYhcTYuLLY=@lists.freedesktop.org
X-Received: by 2002:a05:6214:21ce:b0:6bf:835a:87b6 with SMTP id
 6a1803df08f44-6c335d97ae7mr43324726d6.27.1724862740933; Wed, 28 Aug 2024
 09:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-0-0cae20d4c55d@linaro.org>
 <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-2-0cae20d4c55d@linaro.org>
In-Reply-To: <20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-2-0cae20d4c55d@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Aug 2024 09:32:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XY5Sh0Ax6P-LRO6n21EGL7K0tSKRaPyQWg-ZGmi_vRAw@mail.gmail.com>
Message-ID: <CAD=FV=XY5Sh0Ax6P-LRO6n21EGL7K0tSKRaPyQWg-ZGmi_vRAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: visionox-vtdr6130: switch to
 devm_regulator_bulk_get_const
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Aug 28, 2024 at 9:03=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Switch to devm_regulator_bulk_get_const() to stop setting the supplies
> list in probe(), and move the regulator_bulk_data struct in static const.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 26 +++++++++++++++----=
------
>  1 file changed, 16 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
