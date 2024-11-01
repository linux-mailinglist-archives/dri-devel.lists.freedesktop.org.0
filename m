Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702209B8C15
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 08:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C48010E21A;
	Fri,  1 Nov 2024 07:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RvrLxcN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2035010E21A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 07:33:18 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7181c0730ddso648951a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730446397; x=1731051197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0cXB2oLG+I0p8wPr8eMU8Ys0SYe6ZSBDu+SHl0SmyM=;
 b=RvrLxcN5a7iM5XI+Nepi8ENCqnTSSVAXLdN46+bCifjcDaeYES9Tx6xeJL36EWs0lB
 JFr6/Js05wwgZ1c7GBBx6aIflsZl691/kmJgGpVdb1pMJ9fS4Wd+yt6EoJQKHCo1jeMJ
 NxFE5o1eZrYdoAcoplvdac5FUHeNaF4/yn0o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730446397; x=1731051197;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0cXB2oLG+I0p8wPr8eMU8Ys0SYe6ZSBDu+SHl0SmyM=;
 b=QXs1RWAhckmfHuzwPW4qCH6zOP6KEcqlhcRqJ9jyik0Hb8YTLV0OwH8HxyWLtB4hdL
 5B6Y8373/gmjqNOYVUnxr8Tw/dILN/O2XAeel+icpa0CDti5TWpmLCKCE0uZUFzuxD8O
 IIYO/2m0VHJS69NZJ5uBx6nYVq40B0sUqcTPqkL872NA87fStaTcn+pBChWhyhpGtntK
 M/fsByNy0/7xFASWciOdW5meKgHZuZ2M73gAO97lY5K7TfNznM6wJfidiYydJ6pPopEi
 U1Wfx4rBWdq6wFszfg4O5RqYGh/7vtsBotaOTQ2i/yrR3oO3uPAk5XtlV+SgyNIkMw+I
 FWhQ==
X-Gm-Message-State: AOJu0YyNXnlTpyAEzAWONM74VExNjzzkaaUR0W0qQxZtDjDYIC8jLUea
 ChNLwKvc3FITZWarsBHlCdtSZIb7AWBrjO7u230LfD8UBVl7Wse/imTXBEkykQ==
X-Google-Smtp-Source: AGHT+IF7PmhAZPjT6v19uhaxDIcL8ZqQPNKppM7diN4JF6fjnpDhQzbGaadEPd6E9VLB8W0ZrCAg1A==
X-Received: by 2002:a05:6830:43a3:b0:713:ce15:d4d3 with SMTP id
 46e09a7af769-71867f1bcfdmr20115290a34.1.1730446397237; 
 Fri, 01 Nov 2024 00:33:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:8ad8:6f24:a74a:4668])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee45297636sm2003601a12.12.2024.11.01.00.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 00:33:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
In-Reply-To: <20241029111309.737263-1-wenst@chromium.org>
References: <20241029111309.737263-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Message-Id: <173044639489.1615222.7952709085038498555.b4-ty@chromium.org>
Date: Fri, 01 Nov 2024 15:33:14 +0800
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


On Tue, 29 Oct 2024 19:13:07 +0800, Chen-Yu Tsai wrote:
> The recent attempt to make the MediaTek DRM driver build for non-ARM
> compile tests made the driver unbuildable for arm64 platforms. Since
> this is used on both ARM and arm64 platforms, just drop the dependency
> on ARM.
> 
> 

Applied, thanks!

[1/1] drm/mediatek: Drop dependency on ARM
      commit: 89115aeecf38bfee3c5e79561b5c34a256e1a06a

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

