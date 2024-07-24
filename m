Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C393ADAA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EB710E412;
	Wed, 24 Jul 2024 08:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XVNlfxsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338110E474
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 08:00:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-427b4c621b9so43295055e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 01:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721808002; x=1722412802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVS63w01WpSMud20iAQLpb49vEgN8TqlZNBMv50zLlo=;
 b=XVNlfxsmEXiDKJwjVnk36sre+4863OQqTB0iID2g4LL/wTWwM3PYZ3x7OdnrZDeqjx
 A1HFQ+3zzhQiy48VVndqvXSUraewlf5aULAwUl9H6jDd7tD32yXBGtmUVKYjmpzi3O1z
 49ZPHpo9DI9NJfTiXgsGDZJoK2SBTcGyt8+jalrTTGbpMpbZbD8lVOOcuew6bMuzfENi
 X6ky641Q6WIc+c6S84omTkfu8CxoPN4ywOsfwiW4Ml+6C31/XWA4hGdYOEoZwWplH+u8
 Vr1e3W7FuHDVsgHR8ebyqB2NOI32OZpYPhtP53S8dkdZlP8steJgG1GXZlQylXB1WhmO
 eBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721808002; x=1722412802;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVS63w01WpSMud20iAQLpb49vEgN8TqlZNBMv50zLlo=;
 b=wY0F7OCwIuzTULIVmrdb8ZR8cCqOgWjRX8orMXe9r7BslH0jcs576bzYkdVUCX2SQn
 jcmfEVeLkEWDpapHIDLeHuG43XV33fyFI5LYXhr/lz+iePKQ/qucs/0YfdpJ1X58e0df
 Kaz9j74NqYohw9cgwjnMYhtFpF3rs6miSSVcn64OHGyV0HVy6MoJPCKLLVHGXu0Qg6Uf
 R5g8Eln1s5r1Ukqv0Gn4Lq+dGWNmLRO/cHG+alh2tFz7NrbEW4ObtwCesPX3yegozKMl
 ISKzman/SSPCuZYkE5D1mRAfGZzX4xwkPwlodz6NtAq5gfQFNkdXZjVFd0msB8Nm3mwc
 66XQ==
X-Gm-Message-State: AOJu0YzF/3Ts+nhxLk8DpD1S4SVYJ5ABKGIXZWplhKsCQhdCrPBQDfdz
 hrXEI+ikIO9vhVz7BN2S5g+mywAD4bTP0A96sdTuq9JCwfJ2vCxckrwgUf5U/CU=
X-Google-Smtp-Source: AGHT+IGfvxFZZ2oIYZG+zvMY7HF3H5YwnYk9X5ZGtapXxEl9G+IdNM44EBKe1XDrOU7QfMBIc6isSg==
X-Received: by 2002:a05:600c:1392:b0:426:549b:dd7a with SMTP id
 5b1f17b1804b1-427f95b7114mr7693205e9.36.1721808002176; 
 Wed, 24 Jul 2024 01:00:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f1f52b8dsm33884015e9.1.2024.07.24.01.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 01:00:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dang Huynh <danct12@riseup.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
References: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
Subject: Re: [PATCH] drm: panel: boe-bf060y8m-aj0: Enable
 prepare_prev_first
Message-Id: <172180800135.4044086.14410654931478302593.b4-ty@linaro.org>
Date: Wed, 24 Jul 2024 10:00:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Mon, 22 Jul 2024 14:07:15 +0700, Dang Huynh wrote:
> Enable prepare_prev_first flag for BF060Y8M-AJ0 panel so that the
> previous controller should be prepared first before the prepare for
> the panel is called.
> 
> This makes sure that the previous controller, likely to be a DSI host
> controller should be initialized to LP-11 before the panel is powered up.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: panel: boe-bf060y8m-aj0: Enable prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/61eec998c9399d1cce91c7a2f51a4d0cfbab97bb

-- 
Neil

