Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A9831E6D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 18:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC0210E7F0;
	Thu, 18 Jan 2024 17:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E688B10E7F0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 17:31:21 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a298accc440so1527823466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705599018; x=1706203818;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwNcp/1wsK+xewFwI+40R4Zgg1iQ0Qp0zna44R/fhyE=;
 b=GDB5v+gvweIUqqamhxf/RAwjuQ+k5XgSSNSDUrqooja8b7M6cySf+4l9pfN0mB4mZ3
 Gbvl/JHbf8Ey0cCH0lhMm8srMHQerpBqpwO4PwpCOAwLzcZ2zPzibW5vZL+05ng8U5kv
 AthJAwL/5pV37EIfxAf9eRTGYekHW/Eld5I/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705599018; x=1706203818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwNcp/1wsK+xewFwI+40R4Zgg1iQ0Qp0zna44R/fhyE=;
 b=jPBGrtMOIrVhTADDTilODFef4NL1Jn15dN/wCUTTmTXruvL0B8MdgOZNVa6xCbet2U
 xgUY8pufRln7rURteNW/WS2tJDjtIGJRiVNlz5Bw2pRCi9v/JTxp7IzqSMY/7ZnLbcIw
 2FM7KjbHSQ2FJOboM2ii6a0UeQ0SJyBsDuv9Uf5bdwvULJ2U5GdbsuscRCXM9Z/jlUtJ
 LjxaX7ybkgnhCJlz+eyte1s8Mk87knhJik1LLUinh1KOgN+1ncPIJJr8b8Q3UhjvLzgM
 HYH0p1PYxI7m6cgAtiYqZhrAOPPQWa8DkKl7cE6G2zEVAkFwv3I9VL1nn36qEIukGszr
 SZpQ==
X-Gm-Message-State: AOJu0Ywx6lWMlVVIFiDVQNzdNEopP7HLGleMb1+eVv9LvuwTHKPJM2yv
 T5FiqfmiyW1spQdy7G12j6A7FFfC9JJTfJRarf4s9feoRk3cyZ7SIPGsOFzwNlx+AykvGOQMnJr
 l/Lhv
X-Google-Smtp-Source: AGHT+IFjoSxDK0b6LtQAylXCgjnGgm3ewC/a+eKaAbwoq1cBQSOfe2dcQ3QWApAsiI4GrR/DTpqZYA==
X-Received: by 2002:a17:907:8744:b0:a2f:24ca:3b93 with SMTP id
 qo4-20020a170907874400b00a2f24ca3b93mr983387ejc.117.1705599018032; 
 Thu, 18 Jan 2024 09:30:18 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 g11-20020a170906538b00b00a26aa8f3372sm9242056ejo.27.2024.01.18.09.30.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 09:30:16 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40e43e55b87so46945e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:30:16 -0800 (PST)
X-Received: by 2002:a05:600c:1c10:b0:40d:839b:7844 with SMTP id
 j16-20020a05600c1c1000b0040d839b7844mr119323wms.6.1705599016285; Thu, 18 Jan
 2024 09:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20240118015916.2296741-1-hsinyi@chromium.org>
In-Reply-To: <20240118015916.2296741-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jan 2024 09:30:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WYm0=uyQMf8yZpqaCWN2dympTt_bUVPOe+nafBLdS_DQ@mail.gmail.com>
Message-ID: <CAD=FV=WYm0=uyQMf8yZpqaCWN2dympTt_bUVPOe+nafBLdS_DQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Ensure bridge is suspended in
 disable()
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 17, 2024 at 5:59=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Similar to commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge
> is suspended in .post_disable()"). Add a mutex to ensure that aux transfe=
r
> won't race with atomic_disable by holding the PM reference and prevent
> the bridge from suspend.
>
> Also we need to use pm_runtime_put_sync_suspend() to suspend the bridge
> instead of idle with pm_runtime_put_sync().
>
> Fixes: 3203e497eb76 ("drm/bridge: anx7625: Synchronously run runtime susp=
end.")
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through a=
ux channel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 7 ++++++-
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)

This looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I guess this started showing up more because of commit 49ddab089611
("drm/panel-edp: use put_sync in unprepare"), right? Since that's a
recent commit then that means there's probably a little more urgency
in getting this landed. That being said, it feels like it would be
most legit to allow this to hang out on the list for a few days before
landing. I'll aim for early next week unless someone else has any
comments.

I guess we should see if we need to do something similar for
ti-sn65dsi86 too since I could imagine it having similar problems.
