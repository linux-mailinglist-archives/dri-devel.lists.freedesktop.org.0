Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E917A455C3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2DC10E0A4;
	Wed, 26 Feb 2025 06:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lnfJiIqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB4610E0A4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:40:15 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3098088c630so61140491fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552014; x=1741156814; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YnlPPa2uUCO1zeFpt71gVitBbdNg+Xjk4s2scJwEBqA=;
 b=lnfJiIqSZIoSC0UqhSKjAdSoXmgL4kkw55C5X5nZddYzUTBagIJMMITsIQUxAlHXe5
 MN6MWzc5EIIEbxKp9a+pBE3Xwp7nbEAV2Q9hcWUI5pdCLGHsHVnXoKkKtwiOoGhorU9Y
 hizdpspHVV5hA2arIq3br73LN1dwN6fhcZP6TubrtdVbf38vwaCGsez51hFk4nSni/Z6
 NwymiGCickHaBTAtKuJW4EcEEzYzUrq5V0S3OybGgyHNT+DkBWELin31fOWRmK5aE8Rs
 S7P1z26xEU3mtLSgX4GURdCbWINAG82jr7QBKvKcnuZLRgYCDnutttDncYyDLKG58mZv
 RdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552014; x=1741156814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnlPPa2uUCO1zeFpt71gVitBbdNg+Xjk4s2scJwEBqA=;
 b=J/h42KizZIN4QiFNRpPMNlEKpXMCPous7auOZSktkiPdh9uruAZ187Jjcor3akdfQY
 Cthb+cE9f1Bl78jH0Y7+7gOQWtFv2XP0QsrE6BveWrRhN4+BcFP7gLiekYazMp+wghrV
 6iKc7qeZgFvEKpQxNQRaD7vniww7YaUD34YgusspsXKsFQYK38lcBf7/GTvoNQkdHycm
 8aFl/KQaEXeBQgTxnXKxTa9tzpD0ArCwph5ta2MB2AP/RXeN7cl4ez8yesjK6mfCugp9
 qUQwUFF7LnQiX+g9suI3oXprUjE5sYSkt5DqAxtDLwWCJYl15dXc/hMLJmO0hprGEzQh
 x9wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcErP+BcNro2+i45JkIEDdt5kdbAayulnv7aoZFE/P4nX4oJJyqiey8bVAesmf30c8wXEdS2J3zss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBD2RGxdwGDCAzfxkehe/f8YrHM6tLGe6s2YjgpuwjLaPdL2lV
 cv6JplzRGjGAFfFWLpKdvcj19aatewu5e1cd3onAF3qek1N6+yWl5OyzDDdfMh4=
X-Gm-Gg: ASbGncuGKEIa2SVDl4zC1A8e6ND3c4B9PPEFT+yr8PubAIgDJUcbA+k+WF2j/dh4eHn
 a7oNKol+4rZeAVuJfPPc535kIenK0nB+iopaC+suQqVg72aYM6EO6g4IXNwn7Mk2DzxY+iaH8RH
 Q6C8KUkAPI+tptp/4fQ7F0WuXF2jUwrYR6FODytaM6pbeIMj8voGS5Hwky4D+RBQWn64p68Z0y/
 QDodgsHU9+6bhfDuOOOZDzjRB0myKhPIoNrn8GTvG6U5mzc/Ju8zpkbc5a1e0tzkmQ9HOqnNrBC
 8xStuL1JfnOsSpKBg4I49eQpm2JH9Qzw6PfOLsosE2MRhE5dLxYRjS34BCwz31SOpfmrnmVuAfV
 AuDmBOw==
X-Google-Smtp-Source: AGHT+IE6dtc85yOD3cihprIvVpH/1esWLa6UQi+5Gc9+xFNYCSpdxtNBXemRzp8sO2ffXNDZ9U28Yw==
X-Received: by 2002:a2e:7d0a:0:b0:308:e521:592 with SMTP id
 38308e7fff4ca-30a80c984afmr34851781fa.30.1740552013753; 
 Tue, 25 Feb 2025 22:40:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a81ac2f52sm4211421fa.65.2025.02.25.22.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:40:12 -0800 (PST)
Date: Wed, 26 Feb 2025 08:40:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/15] drm/tests: Create tests for drm_atomic
Message-ID: <tadc6spmedblkzuuzrtg6wj4l5me4gvfdps6dmmkt7riytop4n@sbqabl3stbqv>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-6-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-6-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:54PM +0100, Maxime Ripard wrote:
> We don't have a set of kunit tests for the functions under drm_atomic.h.
> Let's use the introduction of drm_atomic_get_connector_for_encoder() to
> create some tests for it and thus create that set.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/Makefile          |   1 +
>  drivers/gpu/drm/tests/drm_atomic_test.c | 153 ++++++++++++++++++++++++++++++++
>  2 files changed, 154 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
