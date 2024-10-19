Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB79A4EE7
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161EF10E2A5;
	Sat, 19 Oct 2024 14:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vjVd995d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBA310E2A5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:57:15 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso3842174e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729349834; x=1729954634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HEVZQNtLXbr6VjdKHfnY+YaNjHdvT+6V0pligHDJFQY=;
 b=vjVd995ddfkq0RKUoYIBJRCfIuGMN3+wlTLty/r31B9ih5LhpbhU7+K9QVC2AXMsrW
 gUCRjGsQ2yWLgP7zwghLi06BtGQYJEb1IzKOE7oh0bHAlCMULYQx8e0Krdvv0NetJaul
 ywd8zZnAzzl4Dec+/SbhNtVX8K5Fu7DY5lAzqEfmcsqEvb8mtjLpAzbeF/b+0cLMKGGc
 aauCYgZCMaRab0ePzXsX+sgxyrUjaceNnAccbLkh9uggk/Ts4drkkDluM3ffgTtHXxPY
 noN6O5+jLo8RwAPwflVT8SVAeoG0sNhBa4gteiaZWlvsZeIzJTdYFllDUYvbCwtMPT21
 J7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729349834; x=1729954634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HEVZQNtLXbr6VjdKHfnY+YaNjHdvT+6V0pligHDJFQY=;
 b=T9XNlRpITgDuVgz+57LqkrbuMwuiTnxfHYr3RSCq2/LU8v+q5OQMam2hJfwHNfkXOd
 mYJxEdcH/5cfTJyUCvL4euYleKzJ6k6OxlZODLuEFIZbf9UAB6LExZnuhyQ3c5lsAdnP
 j0xGZ+8az1wGqqOCpP/0EScL/QxMjWcJxjy+FJ6OTIowud3xWD1buv1jPiczSUdIWbnK
 rwfdTTQVbHZoh+4Fu2FcG4qUkWu1yV3vz2seRXa+Ns+jYS05jJNDS+O0Y+knE9nsjLcc
 Ybkvv/zl5CWku0CniZdsQCAomWLcyJU+M/QxTmJUbsNa/uk7CItsGbRkDzRI+/xDbwm1
 h4Xw==
X-Gm-Message-State: AOJu0YzuIo63Df1wHDlLDBFmctxV+QcZKzCtYMkcmHMutQa3MASwlT42
 8zBszGgNwdYOdtWqBlLe+CuU79r7BuHleE6R2+NmPc0s/d4ZfBNm8hFfD4jF3WU=
X-Google-Smtp-Source: AGHT+IHRntnvw1lPh2mpFcX91NURazRLZTgtFyN/6fNXWiqSED9YBtLtatc9HIRvW0djazjQFp0f/A==
X-Received: by 2002:a05:6512:6cb:b0:539:f13c:e5ce with SMTP id
 2adb3069b0e04-53a154c34bamr2847424e87.46.1729349833762; 
 Sat, 19 Oct 2024 07:57:13 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15214f1dsm551788e87.288.2024.10.19.07.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:57:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Sat, 19 Oct 2024 17:57:06 +0300
Message-ID: <172934981948.2755496.15748235878067004017.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Thu, 26 Sep 2024 07:55:50 +0200, Alexander Stein wrote:
> fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
> to remove an invalid error message and add it to deferral description.
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm: fsl-dcu: Use dev_err_probe
      commit: 5b7abfb20ba15c0d6c52672874b99d9564ca876b
[2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
      commit: ffcde9e44d3e18fde3d18bfff8d9318935413bfd

Best regards,
-- 
With best wishes
Dmitry

