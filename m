Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9118C454D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0506710E86A;
	Mon, 13 May 2024 16:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dyUr4VO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8620E10E86A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:50:02 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-4dedcd1821eso1215465e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715619000; x=1716223800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3xjzHuMpEUX44ljRlkgoiEVbWwXbypeHFgnO2FiPZg=;
 b=dyUr4VO0oHxkfEbl4BoE7OOR06k+kfgTjDeXdnFWJrGll0FJygO/+XQDvq3wa58uXC
 BHX6JCF0FJieQXnKDATXs/lU7HAfbX0lgj+p1egCNnusu6yzfBVQhPcl4yQYulKDbRec
 Ydy0pDgFNv7wkHvNMEj0R5svUR9YEnRWP2u0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715619000; x=1716223800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3xjzHuMpEUX44ljRlkgoiEVbWwXbypeHFgnO2FiPZg=;
 b=HuE02TN9F3aIx/oruYG742/VNy7c8tmpsmEo00d1CDVafGrUwlZcmFDPZKaYw779UB
 dWiBJ21AxVnNJdc2J3/q+4QNAX3B95QNuISbF3wDxUpSEGERoZ3Qi8WsWjC59u0Qu8IB
 veWPf+LfIJQcNIVOeybz/Y50zehBNT6U4Uz7+G3bobGma0wTWORJEFsU8ZaULbcUFmxM
 gXqLOWS92CBo/k5okCUYQJIqE0XUiqUwxy8xzjaCJwas1gMoM0TnJqzE4Q/WVLfNOaH+
 H8EWMCO6xR4JXLHy0vdWNBzeqdhEJm/qK4ZqQjR++xctaAXk4A6wiuhlQN/ql8IeCY9P
 Gqzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV00ZgVjiC196bnOJ+489pcXqtxfoR+2brt86l4Kqrf8gCHnUKPNXr80zRm0u4PeIOxPXBR5jieaJjHIR5UOCmYCffLsjCKszlMYci0ODEj
X-Gm-Message-State: AOJu0YwvS7xIhzbpa57SVMIiNpocxopfk/CRE5fLdywES731DePGt+mo
 URzQTFOCxHasMBebyKJEtXl2zPR/cRg9XvhN3LTZh+ft0r6Kkvs2C4bj6QxdiQRHPywteCPjERY
 =
X-Google-Smtp-Source: AGHT+IEEZhiSEhirjdZl0DeaWuKe9EsG6FflGNqAFh5dMRNw2thnDPLahwAY1AqnTEa2l8e2u+84kg==
X-Received: by 2002:a05:6122:989:b0:4df:261c:fc0c with SMTP id
 71dfb90a1353d-4df8835a842mr7200892e0c.13.1715618999517; 
 Mon, 13 May 2024 09:49:59 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fc466sm469137285a.77.2024.05.13.09.49.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 09:49:58 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso767111cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHLPCVzyEi+2AJmIaXZGUg9rCnGH9ILyNnNNPFKVUMkEsI8GKMNg2LTKrIJQ3+73k45pL16FjZPXpIRBfDinoaousRYnS+BfB4VpiPlGg8
X-Received: by 2002:a05:622a:510e:b0:437:b572:6d with SMTP id
 d75a77b69052e-43e0a2240ccmr4259321cf.21.1715618997464; Mon, 13 May 2024
 09:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240511021326.288728-1-yangcong5@huaqin.corp-partner.google.com>
 <20240511021326.288728-8-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240511021326.288728-8-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 May 2024 09:49:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0AqC1HKaVfJhw4zQjH4EPyWdQ=sNGOd=Of48A64hHKg@mail.gmail.com>
Message-ID: <CAD=FV=U0AqC1HKaVfJhw4zQjH4EPyWdQ=sNGOd=Of48A64hHKg@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/panel: himax-hx83102: Support for IVO t109nw41
 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

On Fri, May 10, 2024 at 7:14=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel, use hx83102 controller
> which fits in nicely with the existing panel-himax-hx83102 driver. Hence,
> we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> Chage since V6:
>
> - Add hx83102_enable_extended_cmds(&dsi_ctx, false) at end of inital cmds=
.
>
> V5: https://lore.kernel.org/all/20240509015207.3271370-8-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V5:
>
> - Adjust inital cmds indentation and check accum_err before calling mdela=
y in init().
> - Adjust somes inital cmds to Optimize gamma.
>
> V4: https://lore.kernel.org/all/20240507135234.1356855-8-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V4:
>
> - inital cmds use lowercasehex.
>
> V3: https://lore.kernel.org/all/20240424023010.2099949-8-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V3:
>
> - Depend Dous'series [1].
> [1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromi=
um.org
>
> V2: https://lore.kernel.org/all/20240422090310.3311429-8-yangcong5@huaqin=
.corp-partner.google.com
>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 131 ++++++++++++++++++++
>  1 file changed, 131 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
