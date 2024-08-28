Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D55962BFF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E2A10E58A;
	Wed, 28 Aug 2024 15:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zMS2tbYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF4110E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:19:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso57852575e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724858391; x=1725463191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKzhVfzM1gLnruc2o5OAiEHsW1nJqMKHAmAUvz6neTg=;
 b=zMS2tbYfVJcxpQX1m+2SfGXb+gLjCHgFcNpnmbZDGMm+4c6m55eZKHV/Ju19zpL+VP
 FquLq/Yyc8mt8MMxqG6A0BVFn57NO6Irc8I6iyxo3jmt2YzZjXNTiVTBgJ8FEb5DEpAU
 ek4MVpqniEj0GtgaobTMzNnGLLg+lJEui+Dw7AshiQ1Nc+7J+jrjIYBVXgLt9bkBqnH1
 xH60igXK21h91LiYbQNY8qeBAawMtYhnNjBrCFMBYm3bTKzrnEnqriAT/ehwX6cbd+b0
 Lawg+jvGqoAUnfntcmQHipzYKXPgvbkKzRGHTSICzZuLO5BJ8vjkhO5fxU7/wYKYkQEE
 Jxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724858391; x=1725463191;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKzhVfzM1gLnruc2o5OAiEHsW1nJqMKHAmAUvz6neTg=;
 b=d4JXj7vwyVtfD964702YpNK/AiihzOmjkQLORN88To593T0op0094sKexEPkXLNm2L
 IdrBJAoq6fedBACPwRdHe/zQMPNUD1+Q48V5/xPYJqzHKBBghOFOdhT0hFbu8RSgb8hQ
 O8kCI+97GBET0fo53w3h8pQDegkPLagcYVhCyrHz29pWc18CpnQtbCjeSlwoWUaxKqPB
 tsSMZUG276NcDo9qSxOh3Zt9U356/r6XroLP4jDjQsiq+ULIZRy25iQtoVjmfEBaAava
 EZW//ixGM7fuAt7cGk66ilSQSI5HMV7Iy+CLrmEVHKgBmyjmuz2NQu4d2547AT6NBN4x
 hBkQ==
X-Gm-Message-State: AOJu0Yy3hjwyeYTUITX/CH+esDG/3liSDls0onxVlR7jFbo2RFqJghN+
 Dvqy3fRG4DWxz/SVP+zfBZF0SM6NGTDYtOabUoJGTx0VtOgjQtM3+HtmJBI9yVM=
X-Google-Smtp-Source: AGHT+IFVfUCOhOIxDhfQgATHF/iqyCLKMA6nOmtrObiUtTUI7YU9bTeWtwuoYi7HFfanctZ74lgrnw==
X-Received: by 2002:a05:600c:4707:b0:426:62c6:4341 with SMTP id
 5b1f17b1804b1-42acd57c086mr125961655e9.20.1724858390674; 
 Wed, 28 Aug 2024 08:19:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425a77sm24631045e9.45.2024.08.28.08.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:19:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
Subject: Re: [PATCH 0/2] drm/panel: add support for the BOE TV101WUM-LL2
 DSI Display Panel
Message-Id: <172485838985.3445878.265354752188488947.b4-ty@linaro.org>
Date: Wed, 28 Aug 2024 17:19:49 +0200
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

On Tue, 09 Jul 2024 15:05:43 +0200, Neil Armstrong wrote:
> Document and add support for the 1200x1920 BOE TV101WUM-LL2 DSI
> Display Panel found in the Lenovo Smart Tab M10 tablet.
> The controller powering the panel is unknown.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document BOE TV101WUM-LL2 DSI Display Panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1da04eac69197032813940426b73fff6f0a84c64
[2/2] drm/panel: add BOE tv101wum-ll2 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aec8485f226c36eb4eea1d489772cd6f2c40144d

-- 
Neil

