Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D026DC81D6F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 18:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA70410E324;
	Mon, 24 Nov 2025 17:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LmsGK3H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13310E31B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 17:14:16 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-64149f78c0dso6886943a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764004453; x=1764609253;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uD2lAvj/uiSCbx5AKnwMeHlsv7tmSgsXJPMQ6eJXo3E=;
 b=LmsGK3H9sibjH6ElgcNKBfIQUVxUgI00L83G75dqv7daNzncv12iTLjrs88cxP0yrD
 4m4wedVNcsy1lio9RBf7N7QXrjznnvwFg/z89Ri/RG0m3CBd+H46DMU3fL/tVMQtnXjg
 39PFDfzkjptB0K7mR/5KWkKsiaDoD3fbJT45M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764004453; x=1764609253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uD2lAvj/uiSCbx5AKnwMeHlsv7tmSgsXJPMQ6eJXo3E=;
 b=mi/XhqwS28GxqxB+X+f4eXEN27KRFu7sng0LtYd7L+7k/1T3rDxvHA+AxQ2oHAIXhE
 vu8XT8UBsXy70Oq2OpOYTslVZam/gmXukMZ9iitPgeX0jeIceYR9iOw5DQsn6jZgtLhf
 5JBNLXmhxtZ9peOo6Wotf1AGCXwj2DLpqi4GwSBBCQRYXWR218l/ie2FlPRNFlSaZ0Z5
 IDZ6IoI7BOi2Gq8/pMhH88J+JuENwxchDbxo5E3ocuKHsWyOyRg8CvOADLe4Z9+ll7aG
 oewIdMBx0luMe3Lh8DGqfXyRsfIOsdl69t7oleZQq36O2hz8x3Shcif0iqdipfPBmkTj
 Su5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPX5z/iwnIQ7XcSDn9pckQy5xaiMa21LAw0bZ1EnhdNYnp9otCI8UaeZ1OFvmqs7iTM+g6+OIliyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRT3TEqd07g2W5a2Dry9IpciWkU8EvQ7C5M+t59fEfqixch8xZ
 dh8JORW886loaCJ9bbduTdipNQsP4z2UKPeAeKEiagTGM+aTV/uXV/zcq7UPvpA866AlH7by7Nz
 DVkLZjsmK
X-Gm-Gg: ASbGncvvU/vX+CvRXDmkvR93k1G/2Gb1limz2XidZpINLkSMjdgmVVdqTmH6Ez9boj2
 s2MB4552cNFH2+1WVK3ZT9aq0BtrVfJF36isE97VzZjlASL20Sh3cxWkS+5eEnjRctFN1tao6ll
 El2qA8Cn/E08MRHvkTgoRZTuM104m8L3rRdBORh/EQ6albcUfzblFNRmkn0bxxwW8erenPIDlzT
 l11zIKGKTHbGNsKL8W9y9jSg18Vf8+6Kb9fZt0dXcv+trLRLSe+RgP6ESBoFAuL8erfh++gCgyT
 8PPyAEmCRBCuOijyyzWNc6H6irE7obDHLRLt+8QW8+e0Hf925wHwGjBPAXDVWHLYSdUAHmcca70
 qFxNr/GXm4DZP/usozL7/GAIW+QmDAOlRMHwODA1C/4JrRW8QJQ8Fqx9l6vOHe2y3W9BbwayWe1
 G2ea4U9Ke1xrPzOzWaBfukoWoLR6ZLt9aVv9OkxjsqIYFXeGOvCw==
X-Google-Smtp-Source: AGHT+IFbwI1xuFR44Wtf8964il35FZ2CrH/LWZlpNMFvpKLQJ3hg4WYttnj0fJjnqnIqTcvxtJg/wA==
X-Received: by 2002:a05:6402:3514:b0:640:b06f:87c5 with SMTP id
 4fb4d7f45d1cf-64555b86bb0mr9400306a12.1.1764004452916; 
 Mon, 24 Nov 2025 09:14:12 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536443a9csm12527193a12.29.2025.11.24.09.14.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 09:14:10 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so36593005e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVENeHmsiAKeGNLEGECYd34sSi/xaB454ic8FeGWXkvrViTZD1wU/8NUdPjUVU2FGYFRvTsQLLYV8Q=@lists.freedesktop.org
X-Received: by 2002:a05:600c:5489:b0:45d:5c71:769a with SMTP id
 5b1f17b1804b1-477c112400amr108345855e9.26.1764004449639; Mon, 24 Nov 2025
 09:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20251121-x13s-touchscreen-loopup-v2-1-75b03838e28f@riscstar.com>
In-Reply-To: <20251121-x13s-touchscreen-loopup-v2-1-75b03838e28f@riscstar.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Nov 2025 09:13:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UxsANNWG0vgpSvvL3nygxJi-HUNFvrHips4LAyBmGbXg@mail.gmail.com>
X-Gm-Features: AWmQ_bnTqtivprXaSZcJj5jbvY4-HN_utNq9AG-OzXIrya9QOHRSpWkWmzc0udw
Message-ID: <CAD=FV=UxsANNWG0vgpSvvL3nygxJi-HUNFvrHips4LAyBmGbXg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edp-panel: Add touchscreen panel used by Lenovo
 X13s
To: Daniel Thompson <daniel@riscstar.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Fri, Nov 21, 2025 at 9:20=E2=80=AFAM Daniel Thompson <daniel@riscstar.co=
m> wrote:
>
> After (checks watch) a little over two years I finally investigated the
> boot warning on my Thinkpad X13s and it was caused by the conservative
> timings warning in panel-edp.c . The X13s was sold with a variety of
> different panel versions; I have the 300 nit multi-touch variant.
>
> I have been unable to secure panel documentation so the I copied the
> timings from NV133WUM-N63.
>
> The raw EDID is:
>
> 00 ff ff ff ff ff ff 00 09 e5 84 0a 00 00 00 00
> 1e 1f 01 04 a5 1d 12 78 03 5c 70 a6 51 4c 9c 26
> 0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
> 36 00 1e b3 10 00 00 1a 00 00 00 fd 00 28 3c 4b
> 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 33 33 57 55 4d 2d 54 30 31 0a 00 51
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> ---
> Changes in v2:
>
> - 0 1 2 3 4 5 6 7 8 9 a b c d e f ... yes, it's coming back to me now!
>   Fixed sort order (thanks Doug).
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[1/1] drm/edp-panel: Add touchscreen panel used by Lenovo X13s
      commit: 94124ea5a741b82d3789a0df9231f0315819efa2
