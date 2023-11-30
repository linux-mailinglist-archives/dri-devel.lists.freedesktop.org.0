Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208007FFE33
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 23:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A3810E04E;
	Thu, 30 Nov 2023 22:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D348B10E04E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 22:00:51 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-58d06bfadf8so867320eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701381651; x=1701986451;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bHceCWW/FNIBqL0qlF7bzPuAbLJU4rZ5dawH7WmBGM=;
 b=AUmYv99/4FrU6P3BW+czHFKD/JjFx43Kz6ANsfTVs0GuxQ/fRutSAFSASPSs+oktOJ
 xAGzcQT6f4SlUQFHiNB2f45x8hXjVNUmR3xiKyBIG6dKFrMW7hcaTXbZa392g4LNvrlN
 Fjy6dk/gAP38wGfMFbY6OMP0i/xzTz2+i5wvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701381651; x=1701986451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bHceCWW/FNIBqL0qlF7bzPuAbLJU4rZ5dawH7WmBGM=;
 b=k/GaXqZHLAaCpLAS27l5d8OXuyLf9ZYqEfLl9hEZ1cZtdRGHk7ijtx1DCW6Vmq+VfE
 GhD6r9sgU/qML9dIJAHXSg+dcEzozUIm2EQvEi0R6TQotCvloOSiUbNW98MARHHANOO3
 N2N5DiVuPoWfklixPXLhy8extDlpkLgG8GuQdadiM7WnLcWk2sQyUbDhMyvmtSqDrFej
 6WgzwdJ9hC/t6Q+pQbiN7k7ANlzA7UAF7lqufiYX+z8wAUp5VCwSxDH6IOGruhp4Rlia
 iWA8fd3teLawag/rf8Buq6lsiTPMP1RZ5ISuOaj66LkHldpKITSG61ppYc8uzBjwei8M
 707w==
X-Gm-Message-State: AOJu0Yx65HX6Mywncus9Ve71SqYEoLx+9blt7rX+S4WV4eUGe13oyBmi
 XeSm28h8iqeB2ORh0EnQLoUXUw==
X-Google-Smtp-Source: AGHT+IEQFIZgsvOW9B+t/qw8hIsRW20br2f9U2lUT1U8gzzUQdVBFmGZapUJihQN+NpvBHrzAyjJ0w==
X-Received: by 2002:a05:6358:7206:b0:16b:f555:4c34 with SMTP id
 h6-20020a056358720600b0016bf5554c34mr29347624rwa.1.1701381650901; 
 Thu, 30 Nov 2023 14:00:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 1-20020a631541000000b0059ce3d1def5sm1748288pgv.45.2023.11.30.14.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 14:00:50 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/modes: replace deprecated strncpy with strscpy_pad
Date: Thu, 30 Nov 2023 14:00:40 -0800
Message-Id: <170138163824.3649248.18015700667277399745.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016-strncpy-drivers-gpu-drm-drm_modes-c-v2-1-d0b60686e1c6@google.com>
References: <20231016-strncpy-drivers-gpu-drm-drm_modes-c-v2-1-d0b60686e1c6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Xu Panda <xu.panda@zte.com.cn>, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Oct 2023 22:38:20 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We should NUL-pad as there are full struct copies happening in places:
> |       struct drm_mode_modeinfo umode;
> |
> |       ...
> |               struct drm_property_blob *blob;
> |
> |               drm_mode_convert_to_umode(&umode, mode);
> |               blob = drm_property_create_blob(crtc->dev,
> |                                               sizeof(umode), &umode);
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/modes: replace deprecated strncpy with strscpy_pad
      https://git.kernel.org/kees/c/d8d273c595db

Take care,

-- 
Kees Cook

