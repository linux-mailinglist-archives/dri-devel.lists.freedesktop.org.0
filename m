Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A6B2BD91
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AAD10E562;
	Tue, 19 Aug 2025 09:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x6K3Z55H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C6310E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:38:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45a1b04f8b5so25627455e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596302; x=1756201102; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cQNHUhi6q6rKtdJPu5piFu1Pt6Qdn+yGCZCHH5qFNtA=;
 b=x6K3Z55H/hshTMtvP0SMiDuaiEtEQVSMtiBSJM5hp6ptwfgqVtFBBucK4K9XBcJT1+
 6kA0ZzN+oUhFnjSfcArRpdN7zFI1zqWrH+FawVpkkl/KaE14DuuNUJIB7BrS7U8tu39y
 gOTq+D5NHEu9xzyU/9L+ZnLtM4DlRtfYs0QCq/l6SdeOI4ARLwQ6xKWIJMafBffyHEfD
 3x1pkc5eLhXeEk6vhiGBaaixdac94R86K6EDLeb9i3h+2MNU7/nqQU8ALAweGrH0FVBQ
 Gxpm44CR3aA2oSH+SHdrApJb7wLvUvqGMUajEEepGKWegn8cw7Q8iV4jILhBv6M+ezDv
 pJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596302; x=1756201102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQNHUhi6q6rKtdJPu5piFu1Pt6Qdn+yGCZCHH5qFNtA=;
 b=clK2j/9u4zXhQFIN6Htifx6tu7qHbJWYmy6du+JfM6eF8whiT787Ie7AG6VT38ZNVQ
 6EPyHvU9FMJpzqCgnsiI92CvggTC2yB2dAKIJVXA7DjXPmhzEAzjf2W+u6k6qqM344dF
 UzE+65FmWddWwg4rrbmK6xRdhusUY8w1LGyRcX+yZ9nAv2/XC4wV2yaWPiKznnKLO0A0
 jKySlcYrm1PhRS4nviYQWVcB4P+2SLSkz/LCZ9pTYtJL9fxVSgA1XmJ+71RGO3C8VdnZ
 dp6LEoYqP4PncPB5nOIcY899pY6s68MXQFVDtk+fqYGLAhheocNw1vg1hc4iVTEFLMcM
 B9ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRVHFHlNx/QVZwsTFAJIp5IzmErFqqlq8cZrEo5Xufwu4JBRo8SZKfgPFBolvskm7oC2nmB7t6J/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1EN+xMpWDUFYH8HPYslp/9zx8arMMqPVlwwdFH9ueO0cPK7PT
 j85pf6P4XYFqHJDZtkaq6VSwDlLWdb9Ldqp8e1b30n5qeWfOgZLqgqpadyWIqtED2E4=
X-Gm-Gg: ASbGncupANxXctKBs3DE5Vdm8sZEKsmtxtu4q55ai1FSldnZMR2EwBweqbaVTakXMgE
 HzTr0lpw2LFThXvBzDr5eqkHTRoSp6G7/5IHj9a96XhKd5RmPax6urJFb5rNCfrhT1Iy8MRMpHA
 wwkoi/x28rf+B9JO7uLNfUjVpABxnNeIEny749pVvlL3OH78HHLNJjqhi166BlG77ETJa7COkbx
 4Al9sfuKcM7WecK3LEL7SGIjg3hDw9IgePckc9oKKEhxCAXXk/DXcsR0DFrGonEr/5tLP5HTknD
 3kTihv/HD03xFeGZtSzfd5NRZaC4VrS4vThy00c5arCCifDjZMqwDyaK052VswgRZYSZuiIJtqu
 s4bBA10i/kIIuB8q/UgvrE5IlJXI=
X-Google-Smtp-Source: AGHT+IGyrjULf+RdvVTDZSXTBxzshpoUU51bE+6aqkNwYFecCzQvOYD+ZNcx9bLMZ5tuTwxDYI9CKA==
X-Received: by 2002:a05:6000:1449:b0:3a6:d7ec:c701 with SMTP id
 ffacd0b85a97d-3c0ec66078fmr1105498f8f.30.1755596302031; 
 Tue, 19 Aug 2025 02:38:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c0748798aasm3056876f8f.14.2025.08.19.02.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 02:38:21 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:38:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/plane: Clean up 0 vs NULL issue
Message-ID: <ffa882934a0c0db3c7d2493a7b030051bfa8f683.1755591666.git.dan.carpenter@linaro.org>
References: <cover.1755591666.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755591666.git.dan.carpenter@linaro.org>
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

The create_in_format_blob() function returns pointers, not integers.
Change the zero to a NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 38f82391bfda..ad21fc855aea 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -210,7 +210,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 	formats_size = sizeof(__u32) * plane->format_count;
 	if (WARN_ON(!formats_size)) {
 		/* 0 formats are never expected */
-		return 0;
+		return NULL;
 	}
 
 	modifiers_size =
-- 
2.47.2

