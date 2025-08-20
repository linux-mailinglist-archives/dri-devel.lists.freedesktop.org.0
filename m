Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C4B2E51F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052410E7D3;
	Wed, 20 Aug 2025 18:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bpGe5fGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7002F10E7C2;
 Wed, 20 Aug 2025 18:35:15 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f52so382121b3a.1; 
 Wed, 20 Aug 2025 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755714915; x=1756319715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbccaaOrg7oxw/duvj7P0mjLZUiDBUvzDNDOakXvN4k=;
 b=bpGe5fGDLJSWvrzmZjUkRgh6/oIxPIf6P4g0U6fbifJ5XZYts9VECq7YK0qgLCJnI0
 jHCH9BHiyjmKAGHspWcLiYoMQrRzItdxvcYu+ypNBYmRTFIWlgNIJK2TNnBkjAygXLfK
 ZgrWeF79y3a6WfiMS+SWx654quHsUdswizWV13/LvAfat2orNEehlRG5pD47cAj1SmIS
 Mi7EigwIBI1ETKFmU1x+VrnWYIUPU+5DjIpoWlgQwLHYjKIhYIQlSvegms20Q0Kb+SVh
 AM0AtTWlsFdnoFZbAB0fRH5utNNGw0hP/DND+Fx/DwIxdwN+jKFC6XpmU38rfRyxdU72
 9mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755714915; x=1756319715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VbccaaOrg7oxw/duvj7P0mjLZUiDBUvzDNDOakXvN4k=;
 b=a60XnIUmQqBVB7enMEtnMjiqydgaRHeuJSF/lfsCeFjhvyB2AkSEUOz3/4gv1BwZcL
 eyihny0gkgC6FmX8Ts8curdSPaoYzs4eKt+cSIw9Hl3mGiQov3ORN3jOFTswIaTGhaSU
 G2IYoz68blzik8uwU+1kXG9JztwspY4xy0Fpsi1+nAhYhAblHdnxnW2EQ7HTSg3O/rNd
 BUXjFPdhG+ZdIvwKXIrDL/8qLu2KtNAOkyUuPd7YjxlEVqhfmIi2vopN0otP5r9bP27B
 qNZrUT701hffPCvjbUFdAber07GE7LTYrgveBrK5NHR2D6xYRgVSi9BXefpbbx+LXoOL
 WmGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEr3IdplUfhiderwaCYlkhfQ26VwI12j0BnmB/lGAoyRTBW8E/AQsh/6c2YEaqFQ1gTXnEpx6HiE1G@lists.freedesktop.org,
 AJvYcCXTjzr3wqgwBRrBQKr6Z/iZ+qTVUj/NIKwisMQX3dQ3BBgAJ5g5vdZR9fcH7++hNkIYcf2Dv2Nf/GQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS1pqgIzhLnOYvMsqkaNGarunq0v8rIRoWhaankaJBvZSOIf8Y
 Ao/kSkM5TjFB4vKXwhnTCHnEMaYHy6tJJbzKWczB5eZ++4zg9jWpfZbp
X-Gm-Gg: ASbGncvJYSxli1pKZqZC+LGDO5QE687Uu0oTdAjRy/Ob6IHJ/rD8dCDeZ7MiLK0dn1S
 WGpVkEX3WYiZqKhbEDmLQPxyYvSEKmGuj9aJJeC3I59v0UC644U+s2JKjPBRQLIER88BfXlzwXd
 mKHSF3EzuHkBiTLU9TvS5Vw7p6jFGhKqP4bYhvejJqhMY8wf6R0XkM3snSBfj4tPi9FU8njAiT9
 cGAp3Q7euoFOri8fJIx49V/Cs+y4YE6vk0r+03HksRZ2znWq3FpIRHmDIhpuaLwXpVGXAYqjre+
 upcgdbqPRROQuzQyvMwByL7zM8TzElUONbHyDXFZtP0VzmAeD/xs+aFhFHOM3pbtgvlJrd8x+Yw
 uu8IDtdsSQ9uC+uLjZ9CJoXARFdF+TRdEmA==
X-Google-Smtp-Source: AGHT+IFeFM27GRtupFDaHDrUEu5suTdscDY+yaEhRj/AfNxMn4BTjhM/K7Lr8qgDcWB09OwaZG9Aeg==
X-Received: by 2002:a05:6a00:2304:b0:76e:885a:c3e7 with SMTP id
 d2e1a72fcca58-76e8dd6c022mr4913681b3a.27.1755714914847; 
 Wed, 20 Aug 2025 11:35:14 -0700 (PDT)
Received: from server.. ([103.250.145.167]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7f4a6e60sm5738583b3a.110.2025.08.20.11.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 11:35:13 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: bagasdotme@gmail.com
Cc: dakr@kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, rampxxxx@gmail.com, robdclark@gmail.com,
 robin.clark@oss.qualcomm.com, seanpaul@chromium.org, sfr@canb.auug.org.au,
 simona.vetter@ffwll.ch
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
Date: Thu, 21 Aug 2025 00:05:07 +0530
Message-ID: <20250820183507.84200-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aKLAc27XGAadB8n5@archie.me>
References: <aKLAc27XGAadB8n5@archie.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Aug 2025 18:39:50 +0000
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

Hi all,

Those htmldocs warnings come from missing Sphinx markup in 
`drm_gpuvm_sm_map_exec_lock()`.

This is already addressed by my patch:

[PATCH] drm/gpuvm: Fix kernel-doc formatting and typo in
drm_gpuvm_sm_map_exec_lock

Link: https://lore.kernel.org/lkml/20250803092622.27532-1-reddybalavignesh9979@gmail.com/

The patch inserts the required directive and corrects the return-value typo.
I have verified this.

Could anyone please pick this up or keep it queued, so 
warnings disappear from -next.

Thanks!
Bala Vignesh
