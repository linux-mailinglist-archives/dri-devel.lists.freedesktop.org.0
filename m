Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DC8A34A2D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC7C10EB2E;
	Thu, 13 Feb 2025 16:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wGI1jMdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5C410EB2E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:39:22 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5450abbdce0so1076832e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464761; x=1740069561; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1rM4Bt4PhDhPQUeuMylShfihGVwM3FjCJfHKMCS7m/I=;
 b=wGI1jMdPfaroo3KxQpyZUAHTMP9EHKbRWvOsj4RPIE7MRNqC0aUDQQYSetyuDDULJl
 abF7zWFaGY6AoEzDAvCrFgv67EAo6dKniYHM84XJdATiXK/352DU/LjAVwyeNWZlNCuq
 YzN75ZgKR6uxWfop1PZPbfHT7C9htgioUipqU/IvKYu/tq2tkWt6tljHK6z650TSo3Pe
 OrulPBQB2JcgEUAKmgopXkTQP0kuD7h3ibBpQaQnJtGwQN8pVOf7Lg0MAdWsIN/HPq/A
 yAJvgriMgHsGYbbxsqKoskf+o7zVnTjS+hCfpJk7jr3qkmuD5639+SQXeU3Pzsp+yz9H
 yRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464761; x=1740069561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rM4Bt4PhDhPQUeuMylShfihGVwM3FjCJfHKMCS7m/I=;
 b=IQYdH27SEus++/jhrRBIx8Ol+DtN+poE+pXzCV00RxyzzoNbWG8E5lE1G82xSzsRRS
 Au/x2LwSX7cHt5jibVROEatKEz6gjTcn4yyZlWqYmFDRPxGkjyx8fngJ7fIYweYz5aDH
 FH4DmKNs+juTGL8ehazqjiaPZM4skV8qqZ6sMUAZ+UpTg6iLLBXuKoRXsQiYr8AJudDg
 LDnJsDFrviEwHiSjZRQ1PJoPfQ4Dg1zfT/JyzDS5UieV67ouSvBv6m2+G9Nwx3RDS1AH
 DSlJ78b1t9kqVCTZKvX/mD2K0Ao1BR5PUsxEpHtkcQDJ4YKGu32eD3u/9XJ2BgYppGw+
 lQ4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5sf9nD0jGEfJziJw4wCPogl1nstMIdJJmM3B52k7SCAqGZFNhgTgmIaXk1eqlCYiLEojTldHVbFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnKkuN45rkNG9/73XuA5rd2ERM67cCzTykP6ReKiURkbxnOWn3
 CsJHnologqLDPwFRDzokCa7DWrumeai3gooWns6sROLR+SPt10SZSwsVPTYhuEY=
X-Gm-Gg: ASbGnctYNSBYwAbmkLmwjGwtYOMmGE2RFuLdxehDlIYPVV2UiuTGP4WoeTkt2gMWiyK
 6RjucziKxnIpPBfm5nsvNXRSxGbCSNKwPGDzsRu/3iReHtLkiJLrmN0nw6omiA9u9vH+Fj3m6NA
 u3Wbnlsq4XVPlGUy7xOYQv0YfOMkOV/mkAq6fYhIkwKhuiDfpqO2vFETojLlhjc9sTTA9uCChj8
 c8nSPjffMk/jHTzU5FwxcWP6P3UMIPK7Be+NlfpTB0KkxTdgxu2sWeDksVraj5sKIiM1UzMJ92J
 yy21rJ0B7T1V18rY3Rh0Mx2iEDXGxScQivlk0wPERThEEAGelkheTjb7YlVwt922Lym36IQ=
X-Google-Smtp-Source: AGHT+IGf17bKGu+1DYlb0j/jvgsMwXNXFwObJA13sDP2bt38E796iTxNMVbR5XUvItDk5swObX1lsQ==
X-Received: by 2002:a05:6512:1586:b0:545:d08:86 with SMTP id
 2adb3069b0e04-5451826ea05mr2938515e87.5.1739464759138; 
 Thu, 13 Feb 2025 08:39:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f083266sm215554e87.43.2025.02.13.08.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:39:18 -0800 (PST)
Date: Thu, 13 Feb 2025 18:39:16 +0200
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_writebacks()
Message-ID: <ec63ymdlluzsudnv6q4raeihtegezg4mfcbjjufg6xce5ljmjr@5hnpo3dc5hqk>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-20-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-20-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:39PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_writebacks() updates all writeback connectors
> affected by a new commit. It takes the drm_atomic_state being committed
> as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
