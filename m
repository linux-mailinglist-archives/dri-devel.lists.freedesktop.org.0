Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0894894589
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 21:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083B10F43F;
	Mon,  1 Apr 2024 19:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YrbspNus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F6510F43F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 19:37:53 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-515c3eeea5dso5048053e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712000271; x=1712605071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpZBIepliUIdIDq9qpuFvhCDBoqwn1BkfdsmAhnd4j8=;
 b=YrbspNusRf/SFoQTY6ddlmOdPx1Utx/l+jRw3LkRvEOjGlMCJ9WO//ULQW4v9Q1/XW
 y4N6ngquMkQEvS/yGt2iZhLtZ8+evYbl4ERX0H4uAOJjFlNzr17XDm4KzFa8ptDe+kdU
 16LMMZ9jb1rzmyMxSO77vk+e6Hn7qL32fDiPwUvHhDq1v8F++wpxnqUZwqkXC+EYkSnh
 pg4+igqqOFpg4GMD5qyJ6RlIWCARIc4un6+H94fF8G7tLeKADhMPiLEVUeiyYHo43C3H
 RE8VCFTEbIe+TSZeC+LOBn8EAWvngmoiTuiFVN6oB9gQw2M330sulnXxOMRTm/JNkvTu
 HGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712000271; x=1712605071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpZBIepliUIdIDq9qpuFvhCDBoqwn1BkfdsmAhnd4j8=;
 b=k0Dy7Xdn8eDVsEWiFbv1Uh1kjE1E+gCxGSuMxEF5f54Mg+9kRWVWdBTmN19nlsOTez
 TCy3yWBN4/KoyG2QeHP5o4aKTpJG0nfJ337QZ8bIS0ZVqX6Ttje7vgx46WNcuKjdDSKY
 jV01MUFnpBrLqKKK3UR0VogkgTpJpySpehUDM48ut7NSAoyPWptoKSk3Q06Y+Iwq0IZb
 PjQpSs6wFXFmRgs/z/Q+gkClNshmT/ZcnNXWb2C07ECO88wws5A/5xdxDqL0xcMDsXTs
 cWDH/3moX7Ah12rl5qGwAt0SJXxZ9RgBM3QL7VQS2rVHB5JJKe1rZk2haBmjBSpP/wIc
 ew9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtXeB2opXVK4sJrme8F+w7mswZwlEmp8YQRYAFRVOIK8FZE17QtA9mwnbNmJW9/nhRmlyONErqDtVqGBvBhbVnbXwHptLuw0wLYOyyEmEi
X-Gm-Message-State: AOJu0Yx4rYHX2JhGz0njBaa8Peb3MUv3hWhwswzNc8hk+TIskjS+jxh1
 zTyDvlOcmoPQ6Jq2kF8aXKaZMTs0NELhj4V+TlN52RItYwvQVoM1AedG82u7+K4=
X-Google-Smtp-Source: AGHT+IHAHDdE8MOUf8TBYkFZMj1NtWlwp0g8RhYYEp41IYSn3JjWicOmxmund8OvWk+LyeavvMmDRg==
X-Received: by 2002:ac2:5d71:0:b0:513:c9ca:1333 with SMTP id
 h17-20020ac25d71000000b00513c9ca1333mr6333619lft.22.1712000271339; 
 Mon, 01 Apr 2024 12:37:51 -0700 (PDT)
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 q17-20020a0565123a9100b00515d1c97053sm1066373lfu.223.2024.04.01.12.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 12:37:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/display: fix typo
Date: Mon,  1 Apr 2024 22:37:49 +0300
Message-ID: <171200024668.1772895.12933458205220245271.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119102215.201474-1-oleksandr@natalenko.name>
References: <20240119102215.201474-1-oleksandr@natalenko.name>
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

On Fri, 19 Jan 2024 11:22:15 +0100, Oleksandr Natalenko wrote:
> While studying the code I've bumped into a small typo within the
> kernel-doc for two functions, apparently, due to copy-paste.
> 
> This commit fixes "sizo" word to be "size".
> 
> 

Applied to drm-misc-fixes, thanks!

[1/1] drm/display: fix typo
      commit: fddf09273807bf6e51537823aaae896e05f147f9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
