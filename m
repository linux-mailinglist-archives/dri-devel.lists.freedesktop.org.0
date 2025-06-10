Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D151FAD35D4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B77C10E52A;
	Tue, 10 Jun 2025 12:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q20OFEJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DA110E537
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:17:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so65585525e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557834; x=1750162634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
 b=q20OFEJs19k7ZS6fnQZrYfKD6bYDZSfvyL3kOEr5DM6T1v5SmfhOByNyGZZ+0JXOH6
 LvnPm8yhGjkuoPMsqg6vm90qOJiaNkAgzbeUq6FmOcGTDYj8gYiDrjfydqjlf3j4QbFW
 q9QAaH0ME8IZQDiSLK2o6LN6czyltsBQpt6utw9CVyUDe0RSzGxaj4/u04xaqSlm3DVq
 YOKpgs9mxdP6ekxKf3+3fgpZFS6ekm/CyPTQf7w9Cev+6eqq7oZlMfSIbmwhr1J67WTA
 h9zCMWXIKZer1pCKQJFrD1k1MCNvj3q1aF8uTSKPbukGsxJKKWYsiB70TM/6yav3rdju
 obdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557834; x=1750162634;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
 b=PNKKtvvJvOJemkUTVH1SSKf2dF9NpkS5Xsrsx5TcH9RgJfW+ZdzvQq6K0Bk9H+qvUe
 uNZZVvNn6VnTx6Yt7QKaChbqJAjKaN2GEh8f9XPQugHRiC7bAvK3QBwAnqj2w37iEBb1
 pqTs2d7sp2Q61ze0OULLTWDhDuhERA9y/UNg+en9SbBphxFpPMq/CWuGPnZ0Ky9DuG7i
 tyLuGgPyiKfIEe6MrvTafl8ZEPzhwh1OJ+CoozN37SL4OirDI3Ph4VczTN50p5wLY6P1
 AWsw7GInm1GIhKuWMlvI9qPXzdpaa0uAwZm5VbVRlL7aRgaTO3BGAfciFazWDd+HvhHq
 L9Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBtTauHmpWocuqZihhK2uRoa6R9gtqxiutMjeUwIHR4DUTu3KYH8n3DM0yCTtOsvyi0JoLKHEnI7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk2Nst4aJ4zSRH8cmyOVUyfS9AkvEVJueLQOP+mwLz6t0aQIzT
 7MqM9PYqFP22MY7A+pm5UFCqe0JJPxakTzUF0O/32wt9zRyHpEIBZDFTJ+aIvR8K92o=
X-Gm-Gg: ASbGncsWw341TCPY/WNj6tJ1BGQ78ar5SUn7d3w37ywef9FHO/4efFAgC5DV8DyZ9yy
 KrtwGMPRKNo50qBHeMchV5b9nFpgTJlfWGrGWURXh7cu76b+A+aE51ki/0xLMb+/NZRI4TuktZy
 JK13iZ41xB9wyxhj3jTil2H9WyYH3w1D4tJ1n1hLIk9T/JX761YukOBO1oJx2Yc+UCW20rfBei1
 dy/C2dbklZmxeiLFZLB75WoWg7KQXHcvkksmlClQXze0IMt6KqboBSmrNTgHxyhM+SHm0Erdma8
 MTlG4o7N+CtpztqLUlSsE8k2/ewSIa8RsUC1ZnXCV+fi3UYo2WnnLpTQ5fzGkGL5UwoOR4Kj6f1
 eQElqmJE=
X-Google-Smtp-Source: AGHT+IHQU4XWWHJiWTg8y6CtfrBTe2VJBO0sJZQtUeiV78bAOi8lkD0/5F86KXtfRgGuN6NBeD7Q2g==
X-Received: by 2002:a05:600c:54e6:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-452015feff0mr108984005e9.4.1749557833882; 
 Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in
 debug print
Message-Id: <174955783340.1721274.6476762839589523329.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
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

On Sat, 07 Jun 2025 00:10:31 +0200, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: use vclk_freq instead of pixel_freq in debug print
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/faf2f8382088e8c74bd6eeb236c8c9190e61615e

-- 
Neil

