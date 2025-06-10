Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966CBAD35D2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF8110E53C;
	Tue, 10 Jun 2025 12:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lv+5xXSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47C010E535
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:17:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so41873675e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557833; x=1750162633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
 b=lv+5xXSLKq8MXx19dqRo1PG0EEt3voooenT7GOibsDKZ7KdLlbpB9ZRdzLcz+ullLI
 Mw5uSgX3i8rSiawu7f4/vfb9rvPqvBfVS8N0OeQ9/l8dWHpqbX96hV//rTQDwcEib4hc
 gYbX6mScC4l5/dx2lqXqIIdL7E/wrUVdY7aYVybok+dDy/ax+1YqbM0kX8mVPbxBb/CH
 PG0jo97SWptyQBzCkEeRDExHKGbsWJtiEVrPc6FD8o17zeFHmYhdCVkK3B04I+9QJF0/
 5X77trA25GlSECvaktVZyZ8bf9i50N3eKAoHvI3gCgSb5Mk/FSM2cMrzSuHM9aK8nURg
 Vqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557833; x=1750162633;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
 b=lShfI6aYP5jDWqXEgwf7yBFvFaKBCKk8D8g312E20rV/zFBgdr0dSdZp4sdzXRzKeV
 tTo5WSK9UvAclGRTkt9dKwfLZSDiaPdbZwyVo5JTGRfB7srVt/ZDTKZXAQlNx2iqjsjB
 f4j72iWbrg4HR7nRF/ZoPAm7+p9I24F8mI81wmhMyWokEr0eJEDgFm3Z45QMfAGWe/pC
 VHd5U49ceISXuF4z7IE4rembhNPGw8e/QM8WfoO271BUIyUrjtOjWViUJAjUq4/LDDmv
 Eg+h3VNsuqOqe4rgYJjHC6g19Chw9Z+6Jet+PRVQO3Z1GnnbjGphOIbRiZ2+0Qd85oTS
 ZKRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGTMZNnAB8ah2Qtkm2wXh6hTgc5RBKnDOMzM5LDWTag9pbDL9BJXTyzXIFqd7R4epiWtYPdgIeiz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynUS+FqqhrDqmCEdckHHbJ5fJ4DsVQ3+FXjLfqsqyTTE6IiyL6
 95jx8RGrE1XJS6jRKATaDtytNXfKqhFIxMmxmsi4D1K9q4rRfbf6PsYCuDRpuBKFJAs=
X-Gm-Gg: ASbGncsduTeWUCwLwW00BYE7nlfF8p/7Ptxk958IUe4Wzp236fsMvivuZoSGkw8WH5r
 SDR5UU9g+FvPipPiTmFXUKedlnScyynZgHy+In3Vl9o+zwnPMepeeqF+Mx4vUrNyCCvXf0ye5ji
 rxHyqNa5wS5/KiUXiL0GWF3ketT2tXo0tL8dPgtcKi4WRaXzlPWuHUMWDdSTZnn51YUtptEdYAY
 Jq3A6jKf83i4aY3O4USYqE080VPTOhFNsLEYeZ6Um8GBk8aPb5D+3ZkH2hG6EzRRoySAGPThMcY
 lDQFWJS8pztLlMcqgw41wfbSFKk5eM+i/ZbetBNaoVb01DuaFEplnAvloJzNuDamEy48I3i8Bjt
 UsRBspSU=
X-Google-Smtp-Source: AGHT+IGZryHptsIAfWJgutrc/pv6q8jGoH1/bsVGr2feMOgq4/suOW7VZ43KFE9ciIcwtc866C4hEg==
X-Received: by 2002:a05:600c:5251:b0:440:69f5:f179 with SMTP id
 5b1f17b1804b1-4531ce9f6d9mr27818275e9.7.1749557833268; 
 Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:17:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the
 HDMI clocks
Message-Id: <174955783271.1721274.13898926968868576990.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:12 +0200
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

On Fri, 06 Jun 2025 22:37:29 +0200, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix debug log statement when setting the HDMI clocks
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d17e61ab63fb7747b340d6a66bf1408cd5c6562b

-- 
Neil

