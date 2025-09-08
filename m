Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E1B48C2E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 13:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB24A10E4CC;
	Mon,  8 Sep 2025 11:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQz5U9O8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16A10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 11:30:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso3350485f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757331043; x=1757935843; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sj8wR8loCfL+BL8BD9MhAr7hzFXWSWyg2zKZVcz1Tcw=;
 b=PQz5U9O8r64v3lAo00T+zD0DG8uif0BeZOHFflX3rEZtk4wj7FzHlScu40VLjUCEEi
 s182L5zpdT68My9F7y9iKgjTyfVcIEHIQ6IPt9BYfgShNoPjzOE4gnK39UU9hRGNGeF8
 Y2TFC03F/id1SHTmiz+ZPVM+trfk0fw0dNLOKwE7+IjW6HZxFX9xs/TZSzKzFE+Zm9U/
 i2vRkwfgMgjSN0aReb5gHZsiL2MvxJ3cUjcHJ67wWgEsy2kvOi7zGRbKiHbY01eDrmA1
 cDCfVd+etk2DRmClIaUC2/SmUih6R1LO5rekyandKYTzr2Xkc0QPGHvGAEsS3FVj15FN
 vRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757331043; x=1757935843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sj8wR8loCfL+BL8BD9MhAr7hzFXWSWyg2zKZVcz1Tcw=;
 b=q+RqumLWykHvGotFIMZeQd1UMIkmFdfIh/IR92ld9CBqd57vWMuDEXzDaNOONXG46J
 XOFfT8EFEVYQc3oVaPgAVl7bR8cy12HwvlVbK8Kq4U5MwVtNuxmFnPo2BGikiDC3dn10
 ccdzQHBFK/APGcf1mKdsvYbR/4FQXLFi+qT6aQyLYgLi2s0oaJR2tY3YiQw+hWxg3WQu
 7uTlnDuQHjsfkgZoIGWrRpb+kpOGw+ZR3nAm9Cjjk6TSjITscMdCyABud743IeVeVuHm
 KwvQ4eg6iP684D8fnW7nfmSo7P89Xry4+Y4ZPfHA0A3oO046UIWdzJNEd1cHZrMZ5Qfn
 3ErQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpaVy3nO9lY5bB25bI/lj9oYfBXVxKeWLprn2ByDnRfrvZVss6ltJkVlVLn+jWhQjZRbJBNmqgyQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYl9OK1vnZkkNJ5y9t91ORV+02zACvBfWPiRVD/OIx3bAcIoc/
 OwhY2DlfVtcyMPlsz1/xAE9qj9R3Uh8Wts8pNUFWW77cApNXFZttkG/F
X-Gm-Gg: ASbGncuMNVcdsuEA6uw9AM95Hu6UspHEDeJJG/YKtUXUCSq6U+UieBdvHqn9vsRnmeQ
 2rIl90f/HZKpxqbiz5MlIj7lgVwtnk5Hyiegd/b8PIzAQ8xAqdJiDXZo/ChFIwS8mppQrcOAOkR
 TyzGPvULPLk3iVgXgflH4gyz9xTMjNlIkNTbNVnTJgLYrwJnMn8H4GXyRmJactFxdrD6GbMeLzb
 SS14UC/cdJoLhLvefX7Srfq0Nw5JPoeBWpFqMcfCTai6JeB9igXY6Q8p4D4oS/giJ7Q+ZIR33n5
 2iBF3UBisVPB9mACt4wSUIUILJruhVodVMkgYJ/QrNAnEfljPKdLRZ3ZotOEfu1Xx7Ncl6GPcZq
 P3en9JxmFxHSdWeAErCghmr4GPeIp7IHtz+30mZBjXHAQe4yGuRKavljhmzWFeMBnAxemvw1L5H
 Oab84PVCo0QAd8AP4r0RUnv7wZTU9mkwH4wDoO2A2khqTA1XY6ew==
X-Google-Smtp-Source: AGHT+IEZdRqdKNRzQ4aKulSAXapzR+SOfXlwIt3eDMJ2N5BvZ9uT+IJmtyIpieQvOG69VDCQJ1Rvmw==
X-Received: by 2002:a05:6000:1a8d:b0:3e4:5717:3684 with SMTP id
 ffacd0b85a97d-3e6462581a2mr6930466f8f.40.1757331042368; 
 Mon, 08 Sep 2025 04:30:42 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45de45dce11sm61430105e9.10.2025.09.08.04.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 04:30:41 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Leander Kieweg <kieweg.leander@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tiny/bochs: Convert dev_err() to drm_err()
Date: Mon,  8 Sep 2025 13:29:15 +0200
Message-ID: <20250908112926.41182-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818113530.187440-1-kieweg.leander@gmail.com>
References: 
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

Gentle ping on this patch.

Is this change still of interest? I'm happy to make any changes or
rebase if needed.

Thanks,
Leander Kieweg
