Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8E8D4E33
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 16:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0210E3C0;
	Thu, 30 May 2024 14:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nu2lm4ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950510E3C0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 14:41:18 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6f12ed79fdfso587290a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717080077; x=1717684877;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hX/wC7qXXog0qac360LVKqW+SM9R51AMBt2HpIW0OBk=;
 b=Nu2lm4ln4RBsoPAQTOq3W0QPzgbah/gARuHdVY4wdt+XHfggZM9TpluNfC2DM1lVTg
 C2RxE2jMxYjKX/q+ojuZSLGNXvixynjEUtVYDWlZ4TpHSHR855hcOzpnle+PkTe8n/J3
 voVE4EY5Sqsc99mWSjmAstqUC7eyoEtENgQTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717080077; x=1717684877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hX/wC7qXXog0qac360LVKqW+SM9R51AMBt2HpIW0OBk=;
 b=I3xqj+06vqAwpfBxJhrg9VW1G/m3PTZZcflJ+slcoY4FQq9I6lCeX2utt0ij7IFb5L
 eEOuVZhAfvVTouinW5ye0+nE4geJVciaVwNXc+O/cJPPGnoyxZY9uDsQSx4alMO2GltG
 AlbNkLdJorCtIvPLwrrJCxUKPceMxDd3KpCvhlzsWsTsn/D17G1MzNB9YXncMrqs+iVa
 u1+A0r541wJ3F0LlOlTNqm8ei7ii4Dw9BDGkUNcE8H79NwwK5z/SS+UDLJgpwBs+abEX
 KXWZol190GNRsJUhVBns/yBl33+FQv5jc3e03fSpLjQjMip36VGh3VfwscJlQk/Hjbge
 20/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp7mZNlcJ5+baB1VYp30oLDGKBf7L7Ck2VBzAMFlFLPrWDeDjH9sXbAWtxSFFkaJXWRbgwWNnyyYpVYT7bRPbqGcq5PRKVYIyTWAtxKD+e
X-Gm-Message-State: AOJu0YxAZHa+8zwm3U8VcP+4Ceait7ci3D0gI7SXyMMwywZnnYL2Opr3
 5dbkGSh0cw9xCegs0S91rfTF47Lb96JRgZZoFoUkBY8+G5LzQdvAVUsozg0eVYK0Tw6xydPNfev
 zwQ==
X-Google-Smtp-Source: AGHT+IF8C4KPuVwqKmM356dg7L0No6ENvcFNBw1xOFZX4QtUg2yDrG/PnfQKnjvyOvWgcbMyNxoSIg==
X-Received: by 2002:a05:6830:18ec:b0:6f1:2215:e1e3 with SMTP id
 46e09a7af769-6f90ae9c5e8mr2619387a34.6.1717080076584; 
 Thu, 30 May 2024 07:41:16 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb16b97b5sm65782051cf.18.2024.05.30.07.41.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 07:41:16 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-43f87dd6866so389261cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpMkQHTChcjwWjeBFn8uuzb68chkRBHM/OoeRe0bbqV5EVP4Y9KTJQ7n7AHtWxRs+DwYwGEgltv0FUN/3B8FE7LYoVsceHr1F73hia3zmi
X-Received: by 2002:a05:622a:260c:b0:43f:f0e9:5f25 with SMTP id
 d75a77b69052e-43ff0e96040mr383391cf.25.1717079665507; Thu, 30 May 2024
 07:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
 <20240529-edp-panel-drop-v2-2-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-2-fcfc457fc8dd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 07:34:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjkuRQ_bPYiNi2Jab2vDpegUBA2PesFfix5NgvF-pF+A@mail.gmail.com>
Message-ID: <CAD=FV=XjkuRQ_bPYiNi2Jab2vDpegUBA2PesFfix5NgvF-pF+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel-simple: drop several
 eDP panels
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

On Tue, May 28, 2024 at 4:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The panel-simple.yaml includes legacy bindings for several eDP panels
> which were never used in DT files present in Linux tree and most likely
> have never been used with the upstream kernel. Drop compatibles for
> these panels in favour of using a generic "edp-panel" device on the AUX
> bus.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml        | 10 ----=
------
>  1 file changed, 10 deletions(-)

All of these are fine as per my research [1].

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXz1VsF8jG0q-Ldk+p=3DNY-ChJkTk0iW8f=
q2bO=3DoRFvXRA@mail.gmail.com
