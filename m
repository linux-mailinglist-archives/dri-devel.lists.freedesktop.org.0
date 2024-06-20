Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6555B910916
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5BB10E00D;
	Thu, 20 Jun 2024 14:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="l+nYekk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1B510E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:56:26 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f9aeb96b93so7783555ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718895385; x=1719500185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9oSfSdf1z67I0KtQRjOtLB51pCoRgY/UrBbJg+NXAY=;
 b=l+nYekk7/8uiw3PqQvLkhIz7HPmxZ7FD9DGsQcZ4tBI5JcPc2wIIK7AAyKlPO1T12g
 UP6AVC2OdGQRRFTRvr+aa/aWPhlWjjXRQZxH5HaWxOf88H5KadrMJFofgUJAO5Hmdb7e
 PGEZh2Fr/J5OsLVjqJFjwYHqNTsEE02iuJFbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718895385; x=1719500185;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9oSfSdf1z67I0KtQRjOtLB51pCoRgY/UrBbJg+NXAY=;
 b=Epo0qn6isiE36YVTRBYDO5mMMTA2ojzTpGM4PhiEPZgmmepGwlmhjv5A8XWR9nPiZ6
 b7U2rnTLVx/211Odiui/Q/QZdzZnpu+SIH2cLk1A3ahG7iLlgXkWtDbJpNOJgktFn2ci
 wgdQS/4afs3ATDXd/gdzITQXbnLdXusfMHO93Pk04F25bbdq6wctEDMZJ/91Wxt85b0c
 zavatXu1uZ5lDK1X/U+BkOqhAU6j8jU3mpi/KDTe+llGRgKCCQWTkq+hYXLCuCCUglWK
 J2pYx63FSPLJu4ftvPqKFOGy88dk2JhLQTFL57KUd6Cco5oBuWjv7nrvCrcyEOWo1LB0
 5ioA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv1h2yXZuIHmaMi5URlHi5/JphJurTCqOJUUXmK1AAvOpif3f4OYzGK+9p0adGV19qxAWD7uhMboZPpXgmgsyVzw87aCe6uRBNBz30VSEi
X-Gm-Message-State: AOJu0YwbPpVl/CaXQu8/czuzAyKgK2gj0gTJG51GNIz/KCT0FcrgmaHA
 Ek/K+z/RA3/2IjSdGnJ5J/DV4IJOnVMbKlHCc1BaqJFeXmtEcj0jaJtkz0K7Yg==
X-Google-Smtp-Source: AGHT+IGvWrm3Tv2FDZs0pJA9F4+SMsaHh0/HqnibcqOGLHKEUuScOl3L9viWc0DKtKRzX/yyt8s5KA==
X-Received: by 2002:a17:902:ec8f:b0:1f7:13b1:753f with SMTP id
 d9443c01a7336-1f9aa3dd88amr65229765ad.22.1718895385480; 
 Thu, 20 Jun 2024 07:56:25 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:66d:f48d:817f:91ec])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e55e82sm138378885ad.22.2024.06.20.07.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 07:56:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240612163946.488684-1-tejasvipin76@gmail.com>
References: <20240612163946.488684-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH v3] drm/panel: truly-nt35521: transition to mipi_dsi
 wrapped functions
Message-Id: <171889538321.1493372.4537499331018724639.b4-ty@chromium.org>
Date: Thu, 20 Jun 2024 07:56:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 12 Jun 2024 22:09:42 +0530, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> sony tulip truly nt35521 panel.
> 
> 

Applied, thanks!

[1/1] drm/panel: truly-nt35521: transition to mipi_dsi wrapped functions
      commit: c62b4fc4b9b86ab35e5c4236f2053ce21ee81ebc

Best regards,
-- 
Douglas Anderson <dianders@chromium.org>

