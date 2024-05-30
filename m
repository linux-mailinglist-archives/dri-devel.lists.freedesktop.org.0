Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE08D4E30
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 16:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77E10E31B;
	Thu, 30 May 2024 14:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PqtiyLWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4715C10E31B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 14:40:47 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a633ec1cecdso96497666b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717080045; x=1717684845;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nexbWWHw4HmMZ2rLkky2t/GA+e/X7pKJTR1LckTnZc4=;
 b=PqtiyLWvTMhp/uFQBzW4ofvsCmrXLWkovgOV9IqyoqRf1EIIfXCLCT3zCJtfLyco2o
 xnN5dDs2W2wO4FIG9TX79+I4OlKZSkKUBYqC/9CFh8OoHFjoip/Jh9d6CpxPnHu9LAZL
 J1KXH8oB3oSQkOaHZFFip9/pS5NSi1jBHP5/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717080045; x=1717684845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nexbWWHw4HmMZ2rLkky2t/GA+e/X7pKJTR1LckTnZc4=;
 b=Yye4u8scSgnXVGoBa/Liuc5rHwhFaQAxmGOKNOzAZU6V/h5FA4ObN2ZVyZFTgJOaAH
 mEHUp0vfOxpJtjvdDPVK1h+ozu5m+OhQmfFIv9P6lnXgg0yeLWfhhFVR2jc5R1/hjfig
 RJy0kC6aDCwR95wX6Fq+iWNurzPlpctVO3OMVHa+Ctrib/DgyoAdePJeHNi4CNpwsf9l
 yujfSEZfjWbJq21SP1fWPzMK81Mn7Kp97PwIF7A/1Dul1uY5OyOMoqiXM6baSV1Qpv2h
 FAt3Rzr9l1gzzL8DLDHVxM0sffysJOcmrjKQcyOj/uw3m1S68lLx/Tzb8c2cRoLG0ulK
 eo+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvcQj4X/Iv+NNjlWrWnBeSWD89GQDIxEiAdKEavzwbYX9HrcKewoSKFpmwXICtTeijRxrw56xndfydrLSQZweSD7FrNzIH5V260sN6A3Pp
X-Gm-Message-State: AOJu0YzZUdq7LhT86siTkqlsf5dTsTHsbxhgPUnmoxxVALEzrhLNrldB
 3mdhcIe2VWCa7D50IuTiiQ+9dLG4TRzK24OBToMU+rDr8o2rKEQ6aPO2Am/WBZAmycftKz+GH65
 YVQ==
X-Google-Smtp-Source: AGHT+IFzi5oqV3xX1HWGA8VluyzpAar8gLmVcMwguJQ+SRqi0ksdNpLjDlqBmxk9T2D2yiybGwAuDw==
X-Received: by 2002:a17:906:6550:b0:a67:1e1f:a6b5 with SMTP id
 a640c23a62f3a-a671e1fb15emr33740966b.69.1717080045135; 
 Thu, 30 May 2024 07:40:45 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc50095sm826275566b.131.2024.05.30.07.40.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 07:40:45 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57a16f4b8bfso16520a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:40:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrEblUYx/SGCDOvIEv0CY0plFquVQ1jErXmm0z3V+zYKcCcLFpTnuVUSNWo04uMhYsVJoLYQU0Y1Wg3aI9r4B72WSCifjYNHY705xXiH6L
X-Received: by 2002:aa7:c14a:0:b0:57a:2276:2a86 with SMTP id
 4fb4d7f45d1cf-57a22762bcfmr100726a12.4.1717079678834; Thu, 30 May 2024
 07:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
 <20240529-edp-panel-drop-v2-3-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-3-fcfc457fc8dd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 07:34:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZCeawkF+c8yhwMuR3_LF3Z0swT1L-_r9kRccaxJqUTg@mail.gmail.com>
Message-ID: <CAD=FV=VZCeawkF+c8yhwMuR3_LF3Z0swT1L-_r9kRccaxJqUTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-edp: drop several legacy panels
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
> The panel-edp driver supports legacy compatible strings for several eDP
> panels which were never used in DT files present in Linux tree and most
> likely have never been used with the upstream kernel. Drop compatibles
> for these panels in favour of using a generic "edp-panel" device on the
> AUX bus.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 173 ++------------------------------=
------
>  1 file changed, 7 insertions(+), 166 deletions(-)

All of these are fine as per my research [1].

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXz1VsF8jG0q-Ldk+p=3DNY-ChJkTk0iW8f=
q2bO=3DoRFvXRA@mail.gmail.com
