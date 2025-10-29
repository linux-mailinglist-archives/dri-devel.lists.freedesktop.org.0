Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2CC1DAF5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 00:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E535D10E869;
	Wed, 29 Oct 2025 23:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DnstRmJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEA610E869
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 23:25:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b6d2f5c0e8eso89242866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761780316; x=1762385116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A3epzZnxmPN8tHOsM2+QpxO5JfuLDi/llITGwEkkd/U=;
 b=DnstRmJ5+9Pb3oqobaQSI+12MRS4Fv0JvTOaGToRVIDEc2wKEePhn7mAqcsPsndZ1W
 8zYiaToIUyH4qt9kGNJTh4Ho2wtMSDmxBefv5Lg7Brv9U0CyPVrPWYiZqRUj7iKbgkxK
 5oWcM5gv1oJt6yvbbdsAhRZLTyKVZv5wGbrAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761780316; x=1762385116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A3epzZnxmPN8tHOsM2+QpxO5JfuLDi/llITGwEkkd/U=;
 b=S+NiJyhQgtq46IXdaxkF/67M6XrPxKl2U3m1hnrMXgWJnwsSXWn5E6UldHadSkQDdP
 jDCoGt+vBJ6BmJYPOn6aMW1sfnlTtfy2OVD9KhDVIU1KyjZviqdCA2vKwjnIdqLnuFmr
 FMSgfWf3NulNK8ErICtB4SYmZeDKIP4gtKEn3h8wxhWVHI4pxfW8p4XlOLujJ4EflCb6
 4hM8cPLcADIvP0aoEOfDDX5TpMKZBBUHhWRo0egHFwl/R/gEY1bFNg7xrYyYvQ4mtOhm
 WZWFl3G6NU3USidDzvNCe0P/nCi8KCG3Fl0T+D/opM/3uBkbxpD+Mr/OaNJNDCWh8qoE
 27OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLKaS8FJ15XW95UTcyrcDSn+KPJYK1k1M01p6MAS5o20+QrJeBrFiIojfv3vxhCORFzbPNxq5wb8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX7TlCoAyOuQ31bCVyfqOjeQ+i4RRvqh4jMlCX0URSbHQHZIec
 ZKFpwAxFJMiP2nW8x2OOjAiOndEBvKLLXx4Kuh+H7NmAzPq736wjdSwr+jtAZmI8CVaxADUfIai
 bZPMQPg==
X-Gm-Gg: ASbGncuOppeGZom3dnqI9K49KjhvbFl2XKNos0RBS7Ac+14Q0L4uHn6fmnHBtiec22u
 AM2KJg4Bgisl+3eBRdTjZ6qmefh0uGK7eCAZ+4Z9uOIw0huP3GyvqJyJnnd32RVUx9FhduGqLro
 Ms3oFES1R0niolwgnTNHxEZH+5xYobJWx4bv4UnKkQOhnvjLTbDJbrq10emN+SPXY0zhT4LWyK5
 m74b0FKaAQM24eCsAec2q7LKVwRTpv4KyEdkbW8JNa+Jsuw02JZjqZT+88xHi+wh/XnahFgNGBP
 hKRVrpqKV+ACsQRWSL30UPsuxqlSHv+WWlu9vOcZK4B2HnBV6Ed8RlC0rSyK3z0M062cyGl+q+k
 7kb7q6NzfNXPHahdtna7N4LCuwuvQq33j1/VjK/YYalCs7e8q54Se3R1/V5G5ZK/2LV6OJZ92pV
 mEsswBKWwt6/khiPG87le7Iaq8KXf7cJegv5ufz04=
X-Google-Smtp-Source: AGHT+IF6iOKFsuZdPYwxo7gKA3GSmgu+rLK2c6M8NVPY8t2dnhm7tZ3YbbdQc6b6chG8RswAj/SWkA==
X-Received: by 2002:a17:907:3f21:b0:b49:a5e4:754a with SMTP id
 a640c23a62f3a-b703d5555a1mr468690966b.43.1761780315823; 
 Wed, 29 Oct 2025 16:25:15 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853077ddsm1558772766b.11.2025.10.29.16.25.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 16:25:14 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b6d6c11f39aso71374766b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:25:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsSKvrECFEBBCKa1ySKdDRmj0csW2hLAHkw3ylMWm2U58viVgdHPQtiUwkzGHiensKXZu2N/HgAks=@lists.freedesktop.org
X-Received: by 2002:a17:906:71cd:b0:b6d:505e:3d99 with SMTP id
 a640c23a62f3a-b703d2e21eamr369434466b.12.1761780314255; Wed, 29 Oct 2025
 16:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-3-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20251029081048.162374-3-ajye_huang@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 29 Oct 2025 16:25:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WbR0u_a7S1pcL-6C+sj9Kt=GOLUwJmwt8ANJbyV4JYFQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmyGhK2APErFjpEf3hMjvCxrILRsCTTYr0jINqS6mb0sq-aCKx063lDV7Y
Message-ID: <CAD=FV=WbR0u_a7S1pcL-6C+sj9Kt=GOLUwJmwt8ANJbyV4JYFQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel-edp: Modify LQ116M1JW10 panel's bpc to 6
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com
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

On Wed, Oct 29, 2025 at 1:11=E2=80=AFAM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> The link training is failed when bpc value is 8.
> It sure seems like the panel simply doesn't like 8bpp,
> Changing the bpc to 6 allows link training to succeed.
>
> The 8bpc log shows that link training failed.
> 6bpc
> ----
> rate_mhz: 1620
> valid rates: 30
> bit_rate_khz: 2399760, dp_rate_mhz: 1500, ti_sn_bridge_calc_min_dp_rate_i=
dx return: 1
>
> 8bpc
> ----
> rate_mhz: 2160
> valid rates: 30
> bit_rate_khz: 3199680, dp_rate_mhz: 2000, ti_sn_bridge_calc_min_dp_rate_i=
dx return: 2
> Link training failed, link is off.
> Disable the PLL if we failed.

Though I always appreciate details about the debugging that was done,
I suspect that most people reading this won't really understand unless
you give them the context that you are using the ti-sn65dsi86 bridge
chip and that you are printing out values related to bridge training.

I would also note that, to me, the more important test was confirming
that even when you pick the same "rate_mhz" for 6bpc and 8bpc that
6bpc works and 8bpc doesn't work.


> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Unless folks end up preferring EDID_QUIRK_FORCE_6BPC:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
