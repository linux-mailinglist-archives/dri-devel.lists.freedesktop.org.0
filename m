Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9A9C8FF8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 17:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9510E2CB;
	Thu, 14 Nov 2024 16:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cqNDI8Yb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542A110E2CB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 16:40:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so7501345e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731602440; x=1732207240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xkyq+ZrMmoh6gWEOgE4rkAB8kE0YpmSqvfOUn0QWPI4=;
 b=cqNDI8YbprvJEn+vCvRHSNmOugN5MsMwL9yoMpJGhdaRGCGrDJpQ3OJRz7j+T/bgX9
 lsfzIW7lVDmdOGxyf/hNDEodS4dUSjAkvRVjC2kTbZGzPZOYwKy6UjOUcoLJxq4m99/w
 xq/sjuV6Qf8mpcn05F8/1wXshbNlCfdE/KmUhM0PZAUv23AnBGtWDovi9AFvXIiCyHNL
 gv54FCcH22rPGugKhvTnOQ32iJHqrd3AudaUEOM1nkTrXZjuaDf0mKLI4chZZUCxO2pS
 iTNuLIymGbaq+1u7Sx2+AZi44+HOkRayZUT0T3ZpvpgAOtJZLZoKb4mEaZh4FFLGKB4c
 SE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731602440; x=1732207240;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xkyq+ZrMmoh6gWEOgE4rkAB8kE0YpmSqvfOUn0QWPI4=;
 b=ZzLED2n6/JckO1+uEXD5YDms8yxnqTVVFgN0pFpWG0rq+jnCJNldH//YBesKO9ey6y
 bqWt59ywIZYIJvD4mtNj+TcRB5T9ru+mAb6suwPzjZ3SnR9v7mR1DqsU67cdB2JGQwpy
 iC0wBriqhqcdwAlTsrEdCB9Qpui8lNcDLoMA8cUZPS7aCzf8IlPf3CMJck+3eDWkDnlq
 bnBJrBNlPH3VF0qv+F1FdfyztC+r16yjknkQYWx+qrwDjoDuW4Wa9YsODoq/7iqssowV
 LedEKg038mGvOaFHw3z4c3HoOy4G7CSGR4qC/eREY0qi1ZULPqd09q4gg6EMzknvk2vq
 ZGfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGqfBrffVtei42m2HAPDQxAOT8OIuU0YzOqPY9br4HZiP+w4URlAm514UkiRKwtDPsXid33xhU6eQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOP309onvBZUqGdtzrYiNm1+QGhiFLtQB69amhkJ80cbQwkZiI
 kmRmzohMDnqNziwMpUmsW4TxgtUM4V82kfXaQvtgepzxr7x8zejndw1r/4nm2Rk=
X-Google-Smtp-Source: AGHT+IGEdyWzIWUpG/b6aJ02gw51X0tvXl/fUgfJ3mohgzneD77kZ6krmaQpn0iidFQUsA8ZPFrKTw==
X-Received: by 2002:a05:6000:1f86:b0:37d:4ab2:9cdc with SMTP id
 ffacd0b85a97d-381f186cb45mr20459744f8f.13.1731602440547; 
 Thu, 14 Nov 2024 08:40:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae2f59dsm1935085f8f.86.2024.11.14.08.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 08:40:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20240926141246.48282-1-francesco@dolcini.it>
References: <20240926141246.48282-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] drm/bridge: tc358768: Fix DSI command tx
Message-Id: <173160243967.3308246.14721966174558554057.b4-ty@linaro.org>
Date: Thu, 14 Nov 2024 17:40:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 26 Sep 2024 16:12:46 +0200, Francesco Dolcini wrote:
> Wait for the command transmission to be completed in the DSI transfer
> function polling for the dc_start bit to go back to idle state after the
> transmission is started.
> 
> This is documented in the datasheet and failures to do so lead to
> commands corruption.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: tc358768: Fix DSI command tx
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/32c4514455b2b8fde506f8c0962f15c7e4c26f1d

-- 
Neil

