Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3B9A67DD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EAD10E4BC;
	Mon, 21 Oct 2024 12:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ft04Dkyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9910E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:55 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so41196891fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513074; x=1730117874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9yzL3cq6refE/8jHrgfUykQ00f5QT9/9b/0xTf+sbg=;
 b=ft04Dkyz7OsCWy/rwwMiMdPMTUHhexmOW4DDhe3q3Mg1zwizxbJ5j1cfhDLxU4HiBi
 29PsCgqU2K0tfuibgfWZw+N8DirJqB4eUNbVCp1vNEangBJGtKjAln1PTpEM90Lwqaez
 WQFCISxDrID5T7fgijUMD0n1Fqhp5Mk/s7xOgSE1RW7s3yBRaM9r+4sNHrtKbOTXDd1U
 qcuqobYSqjy586hcYSEKh24w7V0W+H404+2heh7aHDCRjFy/3Do3toGxMtWn6XoZ1ZRE
 B9tTiHIQYA5f9BS2WgpnuXKmjO5zLCpv+dGWzIKtfITnyjYz8lnxnW5AFTTw6NBARVbC
 Aq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513074; x=1730117874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9yzL3cq6refE/8jHrgfUykQ00f5QT9/9b/0xTf+sbg=;
 b=bWcBog9VKn6o9UQOJnzGgmSrfzggrRGB0TNMuO7zwgjNb5OUwFeMZHlrhcPfu8j8sh
 4OMI3GiE4uat1UqCVRHPFQmCALn5aT/KE0TM9qk27RbrRYF+OI2nFV72OyTHmq3HL1uJ
 IsoROtl3O6nKxGl70fRudsYZWPeanHPX7DE0oBaX4pMUXmsZ7GhaLhAQfi3Lsi5lFv6m
 4peb4FH70dWDi2grDMFGfBiZh/vRs+9Scm9r/ED68QPZ3kc8NoWW0Qxto4BZyUH/bEHR
 sRJkE6+N6QikP4PvjaRr2EFM3CJhB/2FmSZUkhaflobIgxmKDCf7IaC+tM+kLxNtmONz
 bsmA==
X-Gm-Message-State: AOJu0Ywy5xrVZx3q4+fk1Fhl8c4wckEyzzHfW+4Fp/lw+9r0Hv/QcWpc
 Jy8hlqKpKHULqeb4t97Dd3Sv6Sl8zfMvcvWnjhrTQ7dj5fJIevD7nFiFq0pMK1A=
X-Google-Smtp-Source: AGHT+IEsjekVnrcVqImxMZbmo0i6wP10FDI9NRJIYrGYKmreelLfg+89QH4satNGiJJ0wxtZuHKbxw==
X-Received: by 2002:a05:6512:2393:b0:539:f65b:401 with SMTP id
 2adb3069b0e04-53a154a2413mr4923387e87.57.1729513073979; 
 Mon, 21 Oct 2024 05:17:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: (subset) [PATCH 00/28] drm: Remove DRM aperture helpers
Date: Mon, 21 Oct 2024 15:17:43 +0300
Message-Id: <172950935856.2053501.4410265648664199730.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
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


On Mon, 30 Sep 2024 15:02:58 +0200, Thomas Zimmermann wrote:
> DRM's aperture helpers are merely wrappers around the respective
> helpers in drivers/video/. The DRM interface existed first, but was
> later generalized for use with fbdev and a few other graphics-related
> places in the kernel. It is time to remove the DRM wrappers and call
> the video helpers directly.
> 
> No functional changes intended. This series should replace one interface
> with another. Individual patches could go into the various trees and the
> DRM wrappers can be removed when all driver changes have been merged.
> 
> [...]

Applied, thanks!

[11/28] drm/msm: Use video aperture helpers
        https://gitlab.freedesktop.org/lumag/msm/-/commit/42170670ee76

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
