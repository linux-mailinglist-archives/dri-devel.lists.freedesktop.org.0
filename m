Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857AA0BDA2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CF410E714;
	Mon, 13 Jan 2025 16:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BBd7PJj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200210E714
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:34:38 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-540201cfedbso4066075e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736786014; x=1737390814;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8QhY9KqRCoGY9CscUvD6JT0rC+6NVP1S0UTX+3r5T0=;
 b=BBd7PJj5H2LY26uUaWmkCHqy/kiVaau4nw0RKHi4OmXFZdzp6fu0CNTsKCjCEpFptO
 tO/CVHymKXHg8y74SHsiZDkllaJhAk7oPcyGZVEhhyKHMynSc8krk/q16SQYvI/0gq5X
 C0V93siStEHxPttIhvCpTTZ24Xk8RA60sCH9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736786014; x=1737390814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8QhY9KqRCoGY9CscUvD6JT0rC+6NVP1S0UTX+3r5T0=;
 b=a6p0VZ9cJ2l6J2VkvLEOTGLB9SbWYoPb8Binae+UWE1Y6Rb/d2KJiwvX6kFUA5ns0j
 HtGWaz6oMxBxriZB0g0rqESkyCo9u9A72wbpLIGhcE383MMeXzpozgxnGtWR/FgiHYJt
 KyEiuMDeEV5iQ0ZteVOZyfFm0RpxWaqFfiEDVyuNW6BfPYcSm2BmOBei/js1KRY2dzWl
 kJkK819Rbhsfq87jqnwKS4mzXHc5SceHEqHp/u7l81ZrsLGuSQFcMX3lr/oIQ1b00aQs
 GKNIb4LrxVMdjASqRiKn7fPRILVpiSTD9Wazk9UAeLgc6Cm87C1pCg0Jp4YoHM5LTeI8
 tAIw==
X-Gm-Message-State: AOJu0YzLUWx/7rKpb7GUUld9Ctpmdy337ob5rUb6ByA/oVQDldVdwvDO
 rhQIkJ63z1BXfX347P/PNZhZtsuQofeTW13ZHcCjR7zuSGa8ck7vg5tFpKNp1CGouj2wPnAVzNl
 adQ==
X-Gm-Gg: ASbGnctwyiUxqCQjD6/6BfWnUm6BsJaVqMLSIraH7qA50tSKEMCbEEfy3sWDeqsoLjQ
 RG6Ruw4lHqGWjIhVqD/a32Fe/kdcRNt7aZ69/pwrL+nEpEgn0L11drgenonvj57G8Z926IGRMqU
 XG9LxOBEVy44ztrbzGeCTn4+N5+VgSPivJ8iqVkS8ijODz8bhNoE6oTophwHnNnYajLzxT6JCJj
 fbLCShv/lTuR5w8DDnBIdsPVEnH3WH9steEPaxdDoE2O+yLZE6s3sRACuBN9iv5Snz7Vjymc+H7
 LNZbRl0TRYxnsKMxDMh1SRI8
X-Google-Smtp-Source: AGHT+IGEM8kc/BOwkKVgw3pK1GoNOIxa+WrS1Jn0A/h/Pxm7azC4j1a2oRzFgmCmb2PSrUWATXxKhg==
X-Received: by 2002:a05:6512:3da9:b0:540:2549:bd36 with SMTP id
 2adb3069b0e04-542844f4aedmr7454741e87.4.1736786013613; 
 Mon, 13 Jan 2025 08:33:33 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6754sm1403782e87.113.2025.01.13.08.33.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 08:33:33 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30229d5b229so38033371fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:33:31 -0800 (PST)
X-Received: by 2002:a05:651c:505:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-305f459ae63mr75104631fa.1.1736786010353; Mon, 13 Jan 2025
 08:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20250109142853.1.Ibcc3009933fd19507cc9c713ad0c99c7a9e4fe17@changeid>
In-Reply-To: <20250109142853.1.Ibcc3009933fd19507cc9c713ad0c99c7a9e4fe17@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 08:33:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UfEsC0xT60-SZ12iCp6k16_BmkMgmiCcrAgS08bfsugA@mail.gmail.com>
X-Gm-Features: AbW1kvaul5cnbh1vSue3mO1qTg_WIGE1M6PFzL8uQYczWga9bFnEuVkaUYReih8
Message-ID: <CAD=FV=UfEsC0xT60-SZ12iCp6k16_BmkMgmiCcrAgS08bfsugA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add Starry 116KHD024006
To: dri-devel@lists.freedesktop.org
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Thu, Jan 9, 2025 at 2:29=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> We have a few reports of sc7180-trogdor-pompom devices that have a
> panel in them that IDs as STA 0x0004 and has the following raw EDID:
>
>   00 ff ff ff ff ff ff 00  4e 81 04 00 00 00 00 00
>   10 20 01 04 a5 1a 0e 78  0a dc dd 96 5b 5b 91 28
>   1f 52 54 00 00 00 01 01  01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 8e 1c  56 a0 50 00 1e 30 28 20
>   55 00 00 90 10 00 00 18  00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fe
>   00 31 31 36 4b 48 44 30  32 34 30 30 36 0a 00 e6
>
> We've been unable to locate a datasheet for this panel and our partner
> has not been responsive, but all Starry eDP datasheets that we can
> find agree on the same timing (delay_100_500_e200) so it should be
> safe to use that here instead of the super conservative timings. We'll
> still go a little extra conservative and allow `hpd_absent` of 200
> instead of 100 because that won't add any real-world delay in most
> cases.
>
> We'll associate the string from the EDID ("116KHD024006") with this
> panel. Given that the ID is the suspicious value of 0x0004 it seems
> likely that Starry doesn't always update their IDs but the string will
> still work to differentiate if we ever need to in the future.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add Starry 116KHD024006
      commit: 749b5b279e5636cdcef51e15d67b77162cca6caa
