Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B965AC18E80
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250910E728;
	Wed, 29 Oct 2025 08:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="FMgA8QrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6397F10E727
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:15:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-475e01db75aso30036625e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761725715; x=1762330515;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+1M862bXRRMW8Iy1QXEl85OmAgnvLzrs17Tviq69IF4=;
 b=FMgA8QrTunu0zGo1Fdj4PAhUYG/nVRh8lUW0vT0Sj2qVrdUkxhrv018QE+OAHsQ3it
 73LUdW9kWxG1wQ7umDZf+I4YHmTtCZxp4GKhhPbkqpQsu4XfY3SBaoh5Qq01A98Dru59
 J6CnLPi5rX+WCXUFf2vJ3U/C4F41FjQH1SBP7caatTbyw1/llHlnrUTp+Exa7TJsoqlT
 lhxKVA+A3PGAo4hlBrWnYDeY8uoUu1y1VLPSiMMsqAXkhWjZO2cymGdhMuj4Ncp9lKSy
 2rgP75ghffBXaRhypEgaVpDd6I9q9MOsxlYNYvNB4F+mauEPW2Mlr+jprOl48h7pk2/J
 z+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725715; x=1762330515;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+1M862bXRRMW8Iy1QXEl85OmAgnvLzrs17Tviq69IF4=;
 b=icnRkvOm7a2yuSvAXw57IaGPGiGW9KSHgr66RGXQvLpw/R/tUW+AkB0sQNJtcOfnee
 VW9ahRtvsGlt2otvtoMVKoLcpbhvi47WJR/SBxSh7PDRPFxRg+xIzsfXCMmA6fFLG2Tv
 kMNwQUl7zdTK4iMBG1psGsUPUHxSahVMvWfDF1ysoxIPNBGZHtcGAn97p7MCBsIDhybQ
 xtjaOEkPTZ5EBaeG8G/ic0kCZe8kbndxH3VaSxP9c2Ujw/SDDeBzWO7XpdnFFDjfVb2D
 NKeMCNExR9Bx7Vuh49Lg9JnGc2OHauGlioXvdOJZU2g53Xf/PEOCjJPtyGNd3VuJBF7n
 khKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjHsQbmE2H+gDlrcvmVL9Xnofjg5zzITA6ieJPjiZhpkgVJ6VpBhmVXPnWIG88CtPYq/KNj7Xd+Cc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWvn3eS/INA/rmDT+YpB6LFQ3WFErDe3HYLtEfl97pzyg4kvlA
 g3YO6poFfAcelRg+qsAooUqPprtC4T7wQG555DHoW+3LfgLQ2k8TPQiO
X-Gm-Gg: ASbGncsTAE0/GfDnYDhAmTx/7AKXGTPNlGWJ/uRII5jqFJdGxGFlVzBn+m9bQ5X5rMy
 isF3QLMNtByQW19pZubof8VqgR2gJg/IYI3gXS/bNYgmMy2NblFSOlCcfGmZHO+0fM/pQb2IoLQ
 aBocojXl0P++CzJcnkifMFQM63ZgfpYobjXk2Kb/dySVAQkaYASyaFe/5grvUMdZju8eRqUlIKt
 Ox3ZjGGjReWI/PjvxHywFjPkV9JDPbZQNqW3E0ZaKbkpeT8RmR7saB0t6wKEYz7KawwQh4uvc5L
 P+LdcgdopFpjgtEn+fJqKbYolFNXAUKvu6nzBS2WPzLlLdC61UdcA1cX+B6z3YVFUdXRGN55d68
 Lit/80l5wzUEQpyCKVQMeciXM1IRhphdPs+2fQcuDv2lNqI5mKaps19z/4jC3iLKnHvgnBeHoPu
 zptSe3PbHlUj4+XKSNel3DTXNi8P3IpffnmQlKEdlI3ekD8baG3seMO8IPJdE=
X-Google-Smtp-Source: AGHT+IGkUXJD+kvaS6mK1U/QzGKQ0pxRgGgSknEVWnG4pxzAlb+i1DfZBU6CdN5gmtOlBwb1q4PJJw==
X-Received: by 2002:a05:600c:3b15:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-4771e3a88ccmr15799595e9.22.1761725714804; 
 Wed, 29 Oct 2025 01:15:14 -0700 (PDT)
Received: from [192.168.1.128] (ip-078-043-029-094.um18.pools.vodafone-ip.de.
 [78.43.29.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3937b3sm32995295e9.5.2025.10.29.01.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:15:14 -0700 (PDT)
Message-ID: <5465f445fe9e230f1f37cbb22a97ff2b7c9c3d2e.camel@googlemail.com>
Subject: Re: [PATCH] drm/panel: kingdisplay-kd097d04: Disable EoTp
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Sebastian Fleer <dev@dwurp.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang	
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Wed, 29 Oct 2025 09:15:09 +0100
In-Reply-To: <33e255dc-64f9-4e4f-82eb-6f5e9c1d63d4@dwurp.de>
References: <20251028214045.1944956-1-dev@dwurp.de>
 <aeee5f47ef2842fde66bc66fc598ee4f007fc1c2.camel@googlemail.com>
 <33e255dc-64f9-4e4f-82eb-6f5e9c1d63d4@dwurp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
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

> =C2=A0>> Fixes: d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable =
EoTp=20
> by default")

Nitpick: Your Mailclient messed up quoting.

> =C2=A0>
> =C2=A0> Just to clarify: This is not a fix for that commit, it is a fix f=
or the
> =C2=A0> panel driver itself.
> =C2=A0>
> =C2=A0> EoTp is the default in Linux, a panel driver cannot enable it, on=
ly
> =C2=A0> disable it.
> =C2=A0>
> =C2=A0> Commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable E=
oTp by
> =C2=A0> default") fixed a bug in the synopsys dw-mipi-dsi because EoTp wa=
s not
> =C2=A0> enabled there by default.
> =C2=A0>
> =C2=A0> Enabling EoTp in dw-mipi-dsi revealed an underlying issue in pane=
l-
> =C2=A0> kingdisplay-kd097d04.
> =C2=A0>
> =C2=A0> That same issue appears if one would connect this panel to a diff=
erent
> =C2=A0> mipi-dsi core (because there EoTp is also enabled by default).
> =C2=A0>
> thanks for your clarification. You're right, this change is merely a=20
> workaround for the kingdisplay panel.

It's not a workaround, it's the actual fix.

> However, I'm in favor of keeping the "Fixes:" line since using bisect,=
=20
> commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
> default") is found as the first commit that shows distorted output for=
=20
> that panel.

Documentation states:

 || A Fixes: tag indicates that the patch fixes a bug in a previous
 || commit

You are quoting the wrong commit in your Fixes: tag.
