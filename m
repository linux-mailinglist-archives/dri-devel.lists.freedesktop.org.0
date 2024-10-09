Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EB996190
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E671710E67B;
	Wed,  9 Oct 2024 07:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kxzRnDiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6A710E67A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:56:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso3601415e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728460561; x=1729065361; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y07+yBgcOroVjHiX9PPEthxZxo0GpR0R3sF3xpne55c=;
 b=kxzRnDiLF/RK2bB2vesVQbQfRkuRSKl5oBQyNoyEcvmbGwzzFIwMLg+5wvUX4uDRdQ
 KEVqnrrP1Yjtu8wdXc6SADaKqra7ecLSju/A/h1WkMcOvjciKCR2elU5MjB19SRQuCYr
 Jz/+bQ2jbnB3Xzm+4/DN5f6juWKBduQ6y13w0WUEhB2lOsqaim3PGHrAqlnFarv45aEJ
 +r1njIldQxOSIdvlC0K0u7XWlwEROWJlnFd86sjjANMd13X6yr3ejhlaHutUs7BR9UPy
 qPyuGKe3NlvkiOxYMA1li7gnx3/gspjgnPv9V3qjX2VbNkC5hQmbnZg7TeZdM5WktjfI
 viDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728460561; x=1729065361;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y07+yBgcOroVjHiX9PPEthxZxo0GpR0R3sF3xpne55c=;
 b=cwqUk4EMt9CKcGXYgbknvTuGVmQvFXrgE75cqEMVjXYumyWJM3zkXPaHEZRuvcIegY
 Leun08PIWfNib891ElHxkoAi7yi3klEruPv14Aj3XzKTZIIBSs/1qWfLI39FHnBST9uN
 u0YsaCiAy6OxQYlAZgkHsc65yM0NBkP9eLk7ilb1VNKOgP9D4vPUAA5TcVzEUfzfrLqt
 yXoI7vAcJujSJiMTSPbkQFGJwIBNF8f54b0ho95uy0A09wGzfJE6lkUX21vIHPJH2kU6
 mjLcBPUfWysveXyuGMQyQGzP4QmP8wqbsriiIMjaK6QNs9DWKbqBmN+JSwYoL2WoK1gU
 8fig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV02Q/SMqBa3tt4ShOkcQprb8rHe2mfeSyNa82I/BdO+yUP2avE+9mX3JVW+SC3/o69BLOEcj+bC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxN3by0/9FzLiYZI0/DPuoiljxO571GyiDG0tQLN0WUlgbdvMC
 UeXmfpFccwOSLxKogToJ5M0NtsawS0NBNldwQL/kRLBtg7ZpLYnb4ZM8nAXdFaA=
X-Google-Smtp-Source: AGHT+IEUTMyWoKYDFs0XFyBJ4bnVk79FYy8jhwf/yzMlTPUezsEK/9UOX2RPBUTNm5wGJUbXCAro6w==
X-Received: by 2002:a05:600c:cc3:b0:424:895c:b84b with SMTP id
 5b1f17b1804b1-43069960b49mr10023845e9.4.1728460561547; 
 Wed, 09 Oct 2024 00:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972fd9sm9660342f8f.104.2024.10.09.00.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 00:56:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Hugo Villeneuve <hugo@hugovil.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240930170503.1324560-1-hugo@hugovil.com>
References: <20240930170503.1324560-1-hugo@hugovil.com>
Subject: Re: [PATCH] drm: panel: jd9365da-h3: Remove unused num_init_cmds
 structure member
Message-Id: <172846056007.3028267.12851544842489974284.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:56:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Mon, 30 Sep 2024 13:05:03 -0400, Hugo Villeneuve wrote:
> Now that the driver has been converted to use wrapped MIPI DCS functions,
> the num_init_cmds structure member is no longer needed, so remove it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: panel: jd9365da-h3: Remove unused num_init_cmds structure member
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66ae275365be4f118abe2254a0ced1d913af93f2

-- 
Neil

