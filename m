Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36510AFB988
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762AE10E500;
	Mon,  7 Jul 2025 17:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQ1Wh//1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BC510E500
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:05:54 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-315b0050bb5so2405710a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751907954; x=1752512754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TpMdXzDnCfdN/GalFwfGmK2Pny6VW2Rxcn9/iXdWGFw=;
 b=KQ1Wh//1lTYr/02NrJ2ZEz16PAQBpKlru5RB48le9xrTmvuY5cyFAMwSbrT1HGKi/0
 B9Qm7kWUqAwGxKpPZAb+KCkNJwjmzElJ+NflNa7/0KUR6vFonVZX7dXPmp3rB32WZeWO
 ih0+lMvqePuDWjDf73A4dH3shDw/pfLgeq6eh/wwZrd2xrFluVlJEcIMheSdT4WFn/5Z
 tmOLxg3Tdgx2jD+DmlHmJt2nFQY+yu7ebxRMDvR/LH7QlzJOHcRTcWD4w/LOnbeDA0u/
 HjCDcT+6YuEfTRPHoy+rohcl0rAwiuBhwiSzfB2zjI6Hw3oEl2m56QTO/qsyo0H/2GiO
 niPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751907954; x=1752512754;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TpMdXzDnCfdN/GalFwfGmK2Pny6VW2Rxcn9/iXdWGFw=;
 b=SbiamFJGM4EVPbdoUZHHueyrG83mpLT+C2L3cyUFu5HSR3AGpK/CUIkL+OQetSR1Os
 UWQU7IRjfccUmGvs8QpFO9gMGHpkVyYxfT4JZ1c70VWWRNlSajMKJIPN8tsDuRwdb+cW
 WaMZ4OreDfP/cQsZ8BXuOlzmZCMqvHLyU55AZwSUBYK3pwUWQIgIcCJNdQUahFBj7Chx
 d5+ZPq8ykxX3fzpBxoarEtMeG6uVo0Boz2bjVQyW3/GW/MRdSkrBisOT2X7E6B/I9Jzu
 SPjVMSUdQtMOlxG44FvZtCzo9+NTcMeMdg8ixdwJlgihHwJeHQ5YEpnecz1lOf2uVjU0
 E8xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSEKs+tmZfKkagm50ud62KYIUyEBVRz9PDTUgNUXGhiPB/I4xXmyysdIucZBToCxt2qQAvWc3cJ78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCl4CtAH9gKTa64Oits7I9ddoAYDURRyCftQ4bLgUmlWoRfqBp
 QfBv+uyV1zuBQ14VUpGYOzE2gK09qmYzo5tPAgNQYvq48fSXkaNihCV3
X-Gm-Gg: ASbGncv2yY2jDtkbxP1AkQqi4iTGZmFGgTWrE6qpNOtkO7DTJlT2Ea0iABaHHQTp552
 zIJEHbc872dK1sO/DNTANxYScI/srUjeHuZQN4uAjz4Yr9vAxX5CTdv04IPoqiQ4Y6bSPKvSnVi
 Hp2h2PwyX4bf5mgHdbgkjweqr16ychynh1KkEenUQuyf5QUyYvbDtB/IR4YFrkJHbBoht2d2PoD
 Rj0qnU0OkEGz50ixEC+ywRVAnJ7DmGKAyLyV5myeApI/Skk7aTX28Spft5oQJB+IFPUfHxWnI5X
 MCvAesmiMMlHRfkC56G3FK4rL4IdF7tZNipSJZDtTMgk/T1KA9wDYeof8dlhzCoSnNC/W0xdv8I
 =
X-Google-Smtp-Source: AGHT+IEF5fattogvax5kob4VN55wmQfM65/bVQ74yFaRHd7Gk2rpdUBuYA2r6FYpXtk6hWnOBGZqww==
X-Received: by 2002:a17:90b:4b43:b0:312:29e:9ed5 with SMTP id
 98e67ed59e1d1-31c20e59333mr265155a91.23.1751907954241; 
 Mon, 07 Jul 2025 10:05:54 -0700 (PDT)
Received: from [10.0.0.86] ([122.172.85.55]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9f17bc5bsm11683652a91.48.2025.07.07.10.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 10:05:53 -0700 (PDT)
Message-ID: <c7296a36-0bdd-464d-a681-517c814afed7@gmail.com>
Date: Mon, 7 Jul 2025 22:35:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm: docs: Remove completed task from drm TODO list
To: Brigham Campbell <me@brighamcampbell.com>, dianders@chromium.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
References: <20250707075659.75810-1-me@brighamcampbell.com>
 <20250707075659.75810-4-me@brighamcampbell.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <20250707075659.75810-4-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 7/7/25 1:26 PM, Brigham Campbell wrote:
> Remove TODO item from drm documentation to transition away from using
> mipi_dsi_*_write_seq() macros now that the work is complete.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/gpu/todo.rst | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index be8637da3fe9..76afb8a784e3 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -497,24 +497,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
>  
>  Level: Intermediate
>  
> -Transition away from using mipi_dsi_*_write_seq()
> --------------------------------------------------
> -
> -The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
> -non-intuitive because, if there are errors, they return out of the *caller's*
> -function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
> -and mipi_dsi_dcs_write_seq_multi() macros instead.
> -
> -Once all callers are transitioned, the macros and the functions that they call,
> -mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
> -probably be removed. Alternatively, if people feel like the _multi() variants
> -are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
> -variants but change them not to return out of the caller.
> -
> -Contact: Douglas Anderson <dianders@chromium.org>
> -
> -Level: Starter
> -
>  Remove devm_drm_put_bridge()
>  ----------------------------
>  

Personally I think there's merit in keeping this TODO around until all
the other mipi_dsi functions are transitioned as well and removed
entirely. Maybe rewording it to reflect this could be better?

-- 
Tejas Vipin
