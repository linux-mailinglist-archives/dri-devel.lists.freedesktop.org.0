Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECBACEA7F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6344D10E99F;
	Thu,  5 Jun 2025 06:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HVbQmuSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630AF10E93D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:55:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a510432236so482029f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749106540; x=1749711340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oyx0ftJ64FlzpC17BLoghE0ntQMOF4o150mtfRdZYiw=;
 b=HVbQmuSItS8PBDWrfL+KlH7Z5F9q63CstnVKwFXmRTY1p52NHMiNM3+gEW8J3BrwOF
 MrQRtWR9hsOl9iVrBpptk2DVT7WgrqljRxORL7LJXIULYd58mJNy3uo2hGXOich8874G
 K7VRpg3NNMLc391nf3ZhJ5/we5mMbO1AN2oSyYQ5noCoiHTNOHqc8OkYTmwDLb5033IP
 CQrNND6f/Mg6gBMLxaUmjksLTkuQ5iShzNvS8XlRKD+EFu9MC3+Ssk0ejxFaefK/FuwN
 KVbsmYOpQOKYvYUbsoJyWyizBeNNvdCX+pBQIskUyPi4/Ca2nasmIdPotArVPWqpE0XT
 O9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749106540; x=1749711340;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oyx0ftJ64FlzpC17BLoghE0ntQMOF4o150mtfRdZYiw=;
 b=CNdz1NaTaKWNUO3V9Ow0+4KiP33AkbvjuD2QK23FPPDkcxASRbqrcLnGv+LcJgQKtW
 YDmx/v2FtGK9INFrXXthk6soSIRfRI6UteMklwAfRuj2pNdj7LOlSHErQDmogfgp+uvc
 H2S+V5P4+SngXc+qoybN1MwGNTpjzMznizBj1dsS4a7pocUm0UoBJps05aBdpbKj8hg8
 anvWSdSEWOL7TB+yum4/O5HTamctsdFwtoY1vMeiZrbbb0fXUDocWC7pOHryxaRo7zeJ
 VfzfoFlN0T06ZasYVuMNi+z+iOHAzebZpBaBSolyRquYjrbUh2XN5ENswly+JjN5ZuSm
 9edg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU4qdQGWT2MFvDji0mnWZHGICNdWIUaVbXeY8h4J06Yu2emYZNzTi5uVBbzX2KfFwHbbXVUmaYajw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8TT6VV3dOlVm2QQmyuUk1QgUJpp2XtJLWy7VSWUQJohDA7fN7
 R1p49ZWwQoLxPTmuGXGoll1BUzWA3Fzc23PRZ1g5dxlukalVAGpXdsyd6PiTFed12+E=
X-Gm-Gg: ASbGnctbL8r17DfYTZQG7l3usiYrCRNbSIUBgh7PrUkCXdVSmpI0nTP7Op8A1NyO+1j
 va0cK3v42x1PjhJX2Da3hvmCSeosJLSEUa0WjM82/Nvcidr0PcLULLbzsg9JCUBrCIdWMEXGewo
 R4OobRlo2YDli6M1mytoT8+eFD+AnbEtg0vYDO2sgG/pbXSZF8szTzE+lutkDUOBomlu/PQjv1g
 TrRzIkPJ8MxdkTaTnTUmH2vy9y1HTvNCO1UHi024kS6/TK8X+c2LFYyMBvukeY7GBswfI0WIUV0
 qpgFYLypIFjTGP7yWU1bVaTc7h9tsMt07Aw+VBJJGaMtBcPAOFoG4SVMNiU+iWZyGhxcNjiL
X-Google-Smtp-Source: AGHT+IFrS7bC9yM6c1Umhr2I5M7bqyTsyWg+etIUGp1hD7NgyJNk9bH2qumwy99MkZcbUNMkog9zVA==
X-Received: by 2002:a05:6000:2504:b0:3a4:d64a:3df6 with SMTP id
 ffacd0b85a97d-3a51d8efcc8mr4223971f8f.3.1749106539874; 
 Wed, 04 Jun 2025 23:55:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526057278sm1910099f8f.63.2025.06.04.23.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 23:55:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
In-Reply-To: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
References: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm/panel: ili9341: Remove unused member from
 struct ili9341
Message-Id: <174910653899.1422723.14584247273343467171.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:55:38 +0200
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

On Mon, 19 May 2025 16:33:45 +0300, Andy Shevchenko wrote:
> struct device *dev from struct ili9341 is not used anywhere, remove it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ili9341: Remove unused member from struct ili9341
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0f9c561a7a63ec0a7d69c227b090ee6defa45d35

-- 
Neil

