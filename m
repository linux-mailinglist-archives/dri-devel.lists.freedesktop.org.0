Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF6B17611
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 20:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5A510E26C;
	Thu, 31 Jul 2025 18:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ltt21jQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE210E26C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 18:17:32 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b391ca6146eso1036397a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753985851; x=1754590651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ko+E3oR4W+9XRH6XslAZTMmOJxda8PZJ1FffJrGkJ1Y=;
 b=ltt21jQZEa74QsiBRu4nSC7PgOAs4xPuCxfsUFCkm5AUwN1Q6CO2Ma3kk9AB0VvMkn
 IOpdf5bNNw74eTLxY1jg+CZI/dQKWFRuDcmkDTv1lwq/fAAWWECRyHW4p/s0qky5CjRu
 /0ku6iEALoDyIv3YYnI5aI74Mmm46p4PHfJtgmni23GAMzM8bYBPa/ENk3lyq+oIAbjl
 XZZJnbEvvybc87dy8DRmcZgeHUeoOV9K2DRD5oeTA9+Ojte6vao8LTCL0MyaSSMT48IW
 iP/UxexoLNu6X4TCot4/xlsItcNR7CIBMu5zhysZq2V3G1Gd13Zi3QXfO6S2412FyWUf
 5Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753985851; x=1754590651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ko+E3oR4W+9XRH6XslAZTMmOJxda8PZJ1FffJrGkJ1Y=;
 b=TPiv5qgulVjw1sgKnZWTyfBcRLlGqF5P24fVMpCBDp73w2Qx5AN7eqmUarfUf4BWzl
 7H0dEO8B8Jpm6a8yC3SxHhF5WItyI5mLOk4t40pyjtS95WGlWKK2LBhc0o1rqWzgzNjL
 Dch01TohAhB4ABgi8z19U7QwhNcRgqsZflUtcNpvzFqS4cYkC8vkRrgpDA/xGq/TgPSq
 aPCAfl1ZNGWNGz/jRRp+M6xG+xwB8cVf/F2WxCkX56qCGkU6VBcNfaEVAfGwMawS3XFS
 hS8nsR93RjrvIJemlTZcBTOPiEGyLjvu/aYcqDYzKcWvXtgDe9dOdkRqyBrEa01vxgS7
 +tNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIf0uBWVulFlg0C7EsNc/ughRNYVhI1gxfVX7+Ha/PGduDppVtIB1LtNUt4GdQlrwxbSTTKp0dC1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpRy9ersoyD2SdRqcX4nHK4D8JrfhieWNpPlm2Pb0TIOOlQnlG
 JRoSAgfgSt1ucKjdoiIzPGyKREHxzvjxTZjTuStzO7KHH+IpE9ZRkAI9zhMQBYk+E7dT9W3d117
 Gwt9u
X-Gm-Gg: ASbGnct2zcI9btDU0njNned7mL13EcG9ZWZUiUEKXKG2cY74rwpxCnJ6y3XXqgIODNR
 pgFXz2Gviw7s71P0p0ttpl1OTbEbkXt1nnoxgB/QH2Dx2SwweWWXfpd+TX/UBhR4rK9NgY35EEq
 8UK2GO6j1oIIbsmhztcRLciXTtVKrVEa5/s9QKoSowFBIT+ku+zkIqtOjYp+pa5Ire9Xf62eHTq
 qIs2jhKJh2uiddio5jOjpgXbYC8+T1SiA/NrwoUSJDgDlbn39JsiAiXAkuoNfqnCisOBUBGAnN9
 1ZpzfvICvAVAlRZ8oOdK5RKXHGLRaYFpRiQm55MNtuOVl6lf8UmToi5a47+2QXrSAouiLZjXACU
 b6uo6CCB/bcoB11GpVzje2LpnMPDaZg==
X-Google-Smtp-Source: AGHT+IFptIyiPCQAr4K9I9q2LxI/H2znEXUjIk9SB8OaIyTmC1dTpj+7408uLyZUSVSamCN8Ns2kew==
X-Received: by 2002:a17:902:e890:b0:224:910:23f0 with SMTP id
 d9443c01a7336-24096b3d823mr127116295ad.49.1753985851577; 
 Thu, 31 Jul 2025 11:17:31 -0700 (PDT)
Received: from localhost ([2405:201:c00c:2854:bfcd:fa29:9fd7:ab48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f101d1sm23488235ad.62.2025.07.31.11.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 11:17:31 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: imre.deak@intel.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 broonie@kernel.org, christian.koenig@amd.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de,
 ville.syrjala@linux.intel.com,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 0/3] drm: Fix initializing format info in drm_framebuffer
Date: Thu, 31 Jul 2025 23:47:05 +0530
Message-ID: <20250731181705.159893-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728101603.243788-1-imre.deak@intel.com>
References: <20250728101603.243788-1-imre.deak@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This patchset fixes initializing the format info in drm_framebuffer by
> drm_helper_mode_fill_fb_struct() in the omap, nouveau, radeon drivers
> after patch [1] in patchset [2], the latter one missing the conversion
> of these 3 drivers. This patchset converts the 3 drivers similarly to
> the other drivers converted by [2].

> This patchset was only compile tested.

> [1] https://lore.kernel.org/all/20250701090722.13645-20-ville.syrjala@linux.intel.com
> [2] https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test job,
 - https://lkft.validation.linaro.org/scheduler/job/8377982
