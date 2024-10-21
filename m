Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A379A6951
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4410E4E2;
	Mon, 21 Oct 2024 12:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SlcNYPwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632F10E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:59:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37ed7eb07a4so1517192f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515546; x=1730120346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=snkHEJasim77LVJkaTI1NaouVUr0haIlOruAFQp37Sc=;
 b=SlcNYPwcJhViMtbAivq8QrjAy0w65xSkdjlhz+Bryn3aLMbt2QytMmzYXJnXiCpc81
 SFpddQo0klo8NKj0KTdIcZvR4uGJODQfc8zztsMZhPn9i0EtxeTyj/oQ5mPEkarf9303
 J49RyJFxtYN37lrTUoM78FWoF+xy0KUgKluc5S3Ubxt/5rVbGmF1fTVxTRGPSEFN5LwD
 2zfvyTT7GHNEYEl9suKasaFF5ZEV9HGqdHINy0e+FxxM170vIxcOG9tcPkG2FRz3hCXu
 N9kqNqG09SdI0zG/LiYie4n3vv9sYXkGwqBUc2pecrWtZPUgAeQHZAGJeckGsDbeHPKJ
 88mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515546; x=1730120346;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snkHEJasim77LVJkaTI1NaouVUr0haIlOruAFQp37Sc=;
 b=bSfyrLD6/kU1M1O8dDyMobFkkJalRbiZG3vPlLlF13t9oLXt/3cTZa9dH5yLOKMq85
 Mrx+obIOK6kCKvKNbYC8VawEd8psjpKjExA48PWeTpA5NA5n2ZTc00Fuek8HL+Tiwyev
 i6IiLxdwh4+rRTw3jDeRDr8ooDD/KUjBaEEQ3+x6O3tDXCcCr+Bxm3GKu1FBbo20p221
 5nRIbzbJ5cPAAOhwvlvU8+MbZDiKydknuMl5l2FMpg/M4TL03XPz9gHHOxZ4DDQzQu/k
 8mT8l0jMOuolJ0wiVDNgIi803J9QaoIlCNME7ThncGsVaZDEHZFmH9taGHY17xr5v8kP
 2fvA==
X-Gm-Message-State: AOJu0YwjeC1OOACdwc0QggcjQ4TJUVuOT6EeSY6W4pXzDFeK24NYEwU2
 ZNV/IVZ9buUHlaD/qZYeyRapgL158dMpT1CEDpTGZKEpJxlcHRB8iE5QQ9W+510=
X-Google-Smtp-Source: AGHT+IFcSRL1L5YHF/PkaNiNkO4kEWCwjKaC1ui26pVWmEyhTmr7noeg3F7eX1DbwNQQs0VgkqCXRQ==
X-Received: by 2002:a5d:4044:0:b0:37d:4e03:ff8e with SMTP id
 ffacd0b85a97d-37ea21a1f42mr8442388f8f.28.1729515545757; 
 Mon, 21 Oct 2024 05:59:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:59:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
Cc: ple@baylibre.com, andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
In-Reply-To: <20241010092643.1048116-1-victor.liu@nxp.com>
References: <20241010092643.1048116-1-victor.liu@nxp.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: Drop
 hdmi_avi_infoframe_init() function call
Message-Id: <172951554492.1240386.12723814267685320903.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:04 +0200
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

On Thu, 10 Oct 2024 17:26:43 +0800, Liu Ying wrote:
> drm_hdmi_avi_infoframe_from_display_mode() called from
> it66121_bridge_mode_set() already calls hdmi_avi_infoframe_init() to
> initialize an HDMI AVI infoframe.  So, drop the redundant
> hdmi_avi_infoframe_init() function call from it66121_bridge_mode_set().
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: ite-it66121: Drop hdmi_avi_infoframe_init() function call
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c7671949791fb1142d0ae37343759d608a21bf28

-- 
Neil

