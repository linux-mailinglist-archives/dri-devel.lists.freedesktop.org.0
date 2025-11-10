Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4CBC47EF9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818010E429;
	Mon, 10 Nov 2025 16:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FuFYtWuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F0310E429
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:28:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-297d4ac44fbso20192795ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762792082; x=1763396882; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bdh2/fuv59j6lPYvKx2wt0F4julUgDFPU3TDfHRXW0c=;
 b=FuFYtWuwpOZ5xAUEDsvoWB170eU6k+bD0n9ZXfu16PwZNacwImcbMTw8UCGvhEdBLj
 zeMtCFCUYuf6nEvismHDjEJAMH2zslJmFcn5O0W1N5k+7HOvXqvvTwqXlaavO80wMGEI
 3gpstgHHE2QHl8FD4pkeexbYebqhENyrU31zqM1OY53XgIrzNKufOt+NKsINUi0xDIDf
 gVf7CsADSGyuOGQF3i83kzPcRRW9OkUocvKifGrlZEa2Y9odvQ+WUphgYbPQCXi5bXxL
 26Nz5tvJ6I+YgAyv1u3BWa7G6u0fhnQEsXBfaAUOEzk+3m5cJT3Qauf8sgRS8Nqrh4Av
 558Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792082; x=1763396882;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bdh2/fuv59j6lPYvKx2wt0F4julUgDFPU3TDfHRXW0c=;
 b=C/+s5c3O3vBZvByWtjd6+V7u6aXEhJ0WbHyVzLBnfjTSihYRk8DbFTHmbvMxT4Thas
 E+FBb6ueXfsT2hidD5udhYYFgEWhBfF/7nY8GSQhqqCRyPU8os3yeCrafVtfnNSrWgty
 toG7ypiMhh/wsLFHW//h5LM66nGHzuxLo10UTMg676duDR+donBm4qAmTtaZJu7UuxNc
 PhbxwmUSsK/jqahBKQ+Qt2LiuiHq5L3smJo0kI9jQz5xuhV90d8UF41INNqW4/NNV/1X
 wcXqk6B9gnaMqGtnl90fhFeA7mi1/bfBNKvwn3uuKqMDDq7KJ8kjAS/8/AySm9pw2xRT
 js2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL5qRakEBlEP3RYBRhtWwyqoM/JkYegWfUWWWXdSwibtHgPiGyK9KhnrXl5Atgs1bgn4mpo3ZJvK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6QWk5vDrl4NN5oJdszS4Hu/Owmz+apMyhCgpLkipii9k4g7Yr
 CgsGlCPa0Lzw6Jqvf9jUMtKWaGxghgOJaVGONW4eKEXmh+l0QuTFE2H+gyvFr4MjMwk=
X-Gm-Gg: ASbGnctAiOaJmeETPzxFPt0qp4k0LJgCZJG2DBL4Zy5rhxeWRxn3JY/w1MsigUp9xyh
 bS8FC1kqDO7t6GLC7u4N5jsQ1h/+WxvgR/OvggbGI8bQEpUK07YcsI/n6VifKq/+NcZFkaoxsm8
 Pe1ISAeLpZzpDF1cVmNqBbzbiykmgeWD7wUAvF7CTvOp9KVyzPXXqmGIizFbGwgAoOhD3faALmN
 Mkj4XqnfTbF91wg3UTq8pm9uMjK91e6huLO4qqyPEJHKrliN4MZRazzIlS4BFddr0zy4zX4AsuI
 fHVmMQpP+S+NcL8QGWDrPNZf1N0Ox4XxLz7kd01oo94dj5PtLwZ3l0cax8wZ4pmVKtVCiKi1fgf
 b4vZ0yVBFuD9FcfYUYKAXLHxWsDXAdVLCB0P9oqhSEi3/n5Q4FVMQ3YcrnYcOyvHr1EW15Fi4bO
 OnWyozqFN6Ept26Sik5gQ5du2GXHhbgqF9Z789Nj+pFXq7
X-Google-Smtp-Source: AGHT+IEEdWC+UxJFbOnFiE6h4StiPlXpNa8D2CyYAuq/ZX+Q7gi7EUdCd8OvPyYrowcVZcB6UHmGnQ==
X-Received: by 2002:a17:903:a90:b0:294:fc13:7e8c with SMTP id
 d9443c01a7336-297e1dcecc0mr144078575ad.13.1762792081714; 
 Mon, 10 Nov 2025 08:28:01 -0800 (PST)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651045bf0sm152026805ad.48.2025.11.10.08.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:28:00 -0800 (PST)
Date: Mon, 10 Nov 2025 13:27:52 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Parth Pancholi <parth.pancholi@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/7] drm/bridge: tc358768: Long command support
Message-ID: <bskxfzp63qzkeydne6qianvjbfso2lssjloaw4rkogub4zuvb6@xjxpbba5pbox>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
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

Hi Tomi,

On Tue, Oct 21, 2025 at 04:22:56PM +0300, Tomi Valkeinen wrote:
> This series makes some small improvements to the tc358768 driver, and
> then adds support for long commands, commands that have more than 8
> bytes of payload.
> 
> This has been tested on Toradex Verdin AM62 board, with a ST7703 based
> DSI panel which requires initial configuration using commands that have
> 8+ bytes.
> 

Tested-by: João Paulo Gonçalves <joao.goncalves@toradex.com> # Toradex Verdin AM62

Best Regards,
João Paulo Gonçalves
