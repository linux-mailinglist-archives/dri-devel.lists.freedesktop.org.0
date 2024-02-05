Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F184A2D4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 19:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB2110E594;
	Mon,  5 Feb 2024 18:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="N9W4pnGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADB510F066
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 18:56:12 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-60413de7474so48143387b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707159369; x=1707764169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G808gfmzZ9j432kXszfFxMM7lLJBObo6nQSQeq1OGNo=;
 b=N9W4pnGqoqanzidTQGdydFDq9yxPB/bjksqF5L13UKGH2RDpURmMFAeKfwbHAEFjIj
 YPKse+XMxIe9KokzTGDidUKo/yPZaOrwVSs/QkaQMdcHoBqR+/2xlhFIwBWaTbbjf2Uh
 Bo9HN73Z3wCP51kwA7nsS0oFro+bWdf52FH7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707159369; x=1707764169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G808gfmzZ9j432kXszfFxMM7lLJBObo6nQSQeq1OGNo=;
 b=qEuQ4ZR6Q8gW4w+tNurAQEI2AZHG0nOGM4GBMkYxPx/W1eLHjN95d5CoZal7TCkMAz
 Md8SrLPNQPCZ9DWIot4TxlG0DYJbjkgpZiCzWtn+bQzCxjNEdqvrQu8gkrUb43aQYHyq
 /fe8gDEvOWezDZPyaW+kbWCcHNhnmUj6oo6Fv4chj4Y1CHjIbvV30Bp38FA76XkODFud
 xMoFKkrvJtHr3k9A5aqVmRHCyqRZkH3tS+E5IZB3zbusi3BMycmCNR8kfTaKwC6JU0mb
 MMggKwOchjgxq5YI+aGL7FzuACSqwa5iEkaw2j7CEhq9i5BnfjS842+fgq5O78DpjVZW
 iSaw==
X-Gm-Message-State: AOJu0YwVSJU6lyfllA62UOTtMBfBz0QQs0FLiK220FZ+o7kh+UxhCwId
 FyVR7HRjKF3IEPfTr22bH7v2Lw4WCE6uYxW5/LK/DK/HZ1Zqx5IRN/5MXekOon0E1xzbeOPwcHX
 hfv3q
X-Google-Smtp-Source: AGHT+IEwYkju/Q6DFIT3rGjR48HW1n18Xw4DrsaRYeNajaXS9ioyzgH1ByptVFL+nM3JTVp8WgzHEQ==
X-Received: by 2002:a81:ae5b:0:b0:5ff:77b4:60b7 with SMTP id
 g27-20020a81ae5b000000b005ff77b460b7mr535783ywk.25.1707159368592; 
 Mon, 05 Feb 2024 10:56:08 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXdB/ojkvsOKAiUvnYWdAhfeabO2Pg+CyJfeF8TkjOg4ttNQANEhaV2+nRK7+1k/ZbbKJ8FCjSmQynBSWhT4xq9VxryVoJerSW2MKiuOk5C
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 q198-20020a8199cf000000b00602f3e50c62sm77343ywg.113.2024.02.05.10.56.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 10:56:07 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40f00adacfeso10955e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 10:56:07 -0800 (PST)
X-Received: by 2002:a05:600c:5185:b0:40f:dd8f:152c with SMTP id
 fa5-20020a05600c518500b0040fdd8f152cmr31004wmb.4.1707159366499; Mon, 05 Feb
 2024 10:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
In-Reply-To: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Feb 2024 10:55:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WyUzDXhr_g4C_5MiDioBt=9D0fkL2cQStP+EFmkydbsg@mail.gmail.com>
Message-ID: <CAD=FV=WyUzDXhr_g4C_5MiDioBt=9D0fkL2cQStP+EFmkydbsg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
 @codeaurora address
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 quic_bjorande@quicinc.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Fri, Feb 2, 2024 at 12:25=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> The servers for the @codeaurora domain are long retired and any messages
> sent there bounce.  Sandeep Panda's email address is no longer valid and
> should be repleaced.  However Sandeep has left the company and has not
> been active sice, therefore it looks like this binding is orphaned.
>
> Doug is listed as the reviewer for this file in MAINTAINERS and has
> volunteered to be listed within the file as the binding maintainer.
> Therefore replace Sandeep with Doug to make the documentation current.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Pushed to drm-misc-next:

2592a36d9569 dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
@codeaurora address

-Doug
