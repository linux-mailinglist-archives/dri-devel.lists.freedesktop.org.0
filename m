Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D404B1A612
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84AC10E597;
	Mon,  4 Aug 2025 15:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R1D5hp88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2459910E597
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:33:05 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so2982714f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321584; x=1754926384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+WopZFLryciAlo72DuJ/q4cJCaS9uxI8zd7Jh9HW34=;
 b=R1D5hp887gMX4eLXjrakouOiQjtREXxCifVwOzs37YTqbRX2mUS1jUa1lc7Ubplw4Z
 V4EAxEgubBzGm7OCMD8vi8DBss+UJxjLRE9joebYO/DaKyctfO8KcHuxCj53nB9/MN+Y
 DpSrvj7wmbUNiCMrc99er0GD5bU24s0SAF9Urlp+Z4FIH5xqvF4HoWBhvF8Bv5uoydRX
 tdURyF4hEW1KyFIsSYEdaPfQ5SVCadh//h1N7u7tPxWz+A1wKLe9bLBle2i9wbiwiKdZ
 9hFkJtYUJbaEi2Oc020lvcvG49jvqhHOjbMswtXAShc3zP90U5vpVmey2wkUOAtYG3kN
 GNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321584; x=1754926384;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+WopZFLryciAlo72DuJ/q4cJCaS9uxI8zd7Jh9HW34=;
 b=AD12mTKjl/IBaXimHejfBC252i9iS6IsXSrbSMAURablcNbfFIHekHKetgFcdCXwPK
 QHBXSsnIMDXNGfLn8zZTKA/xa5dlOK4CBMME7XfDYkQA1T1nrFeMBgLrXsRMHAfr6gRM
 J/73kfKO50wU24bDRFj7aXw2fapGYbOj451tOEQUx6WzWMDrvOXOA915m+aR/hWtPfjm
 YqzmTswKTdAAP1L/f1cQX0Rn/EmYlgzbSerhIeHF8Cb9YipY4f+CpEPUSkSjUphmmflW
 +7RXSbdv9IIVguB8mUaVbRIZC2DTR9RdhJpS/gWHzBJwnOo8hggTfURULkys9PBiQw3/
 081w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTPzsQ0HkPW1urOahjyF3l1F2oWn87l5N/OCKRDuTOjuRr8SatoLhEuwnJN710U+D+aezoWMQuJzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1VWsw4dUvh1Q7h7yYHKEi+BbN7AZCpThaC3Wt+cT6tTrFXmPx
 HhkUuL+FpuSz2d/O26jMNIK6fDiLpKG8JV+rN1N4RehORBZOYuzJSroj+VWFsmh+7Aw=
X-Gm-Gg: ASbGnctLJZDpu+1AiZ+clJbf8OYQ86jBfsdgWJsA2n+OvAy4dkLfVae9419V3A6etLC
 NHhY2ovUp6A2dM6uU58vOcuxKhER3Fw5qOZDKwjDxQiRPCvfBnBuQm5ur0t4KLuHHjZhm18CQri
 QC6Hfjpm+unRVP9pQfwxlzNeCrTVQgScRt9LTTtXxnxchMhQhM6wxMhBePs1gU/YTdeqGEGtyjF
 ts8y0joFXZn3vnYCWt6Pvsb6IDj2buzmvoK+k8tq+xT1pxKgqE3LHFSvVezbgQgFdtZ1Hb2Cg9L
 qVmNEPVY3MgFUdX6yuQtEVFgoXQYTw3oQJ6H6Hs1mtF8DTHvXXsdy1HgaA2L514VkPJ0kfxIGe2
 bTAzzI/whJriywT94TWwlUuCU2XhQSLZW+DYdFENX2PA=
X-Google-Smtp-Source: AGHT+IEF8f1hU2BlwQYVtjlp2hUl6tPsOBX/61hQ8UhG3IJs/dhbSFdGfLAaTj/fxWh7CQaq0TRrWw==
X-Received: by 2002:a05:6000:2387:b0:3b7:942c:5447 with SMTP id
 ffacd0b85a97d-3b8d94cf8f6mr7300794f8f.55.1754321583582; 
 Mon, 04 Aug 2025 08:33:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:33:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 linus.walleij@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 Brigham Campbell <me@brighamcampbell.com>
Cc: dianders@chromium.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250731032343.1258366-1-me@brighamcampbell.com>
References: <20250731032343.1258366-1-me@brighamcampbell.com>
Subject: Re: [PATCH v4 0/3] drm/panel: novatek-nt35560: Fix bug and clean
 up
Message-Id: <175432158262.3671011.5417242916841349428.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:33:02 +0200
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

On Wed, 30 Jul 2025 21:23:40 -0600, Brigham Campbell wrote:
> Fix bug in novatek-nt35560 driver's nt35560_set_brightness() which
> causes the driver to incorrectly report that it "failed to disable
> display backlight".
> 
> Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
> handling in drivers which use mipi_dsi_dcs_read() multiple times in a
> row. Add mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() to drm_mipi_dsi.h to allow
> drivers to more conveniently construct MIPI payloads at runtime.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/panel: novatek-nt35560: Fix invalid return value
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/125459e19ec654924e472f3ff5aeea40358dbebf
[2/3] drm: Add MIPI read_multi func and two write macros
      (no commit info)
[3/3] drm/panel: novatek-nt35560: Clean up driver
      (no commit info)

-- 
Neil

