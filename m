Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA59985ED
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FEB10E157;
	Thu, 10 Oct 2024 12:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YH0vGuSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B510E157
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:29:30 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-431160cdbd0so5168785e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728563369; x=1729168169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8z7nt9hm4L9Wbt/Qrv08MzgIyMq4q2v0TRMhiPpwzsg=;
 b=YH0vGuSPzWS90hB0d8LcLzRlwA+LlsSzOvH0YEvZ7agLQ3WgZ5n2/T1vvi+R4DPt35
 udzGEWmUAQ6vw815hZ9cS63LQ9d3hHn0gQY5aI1rVmhSA439orTa++T51feKLaQSSN7X
 VH2l0tADz/mHKtwnp/qDZNNolb6/pJ7ORWoB7HaJGPWdOwtsEGUz9hQPU3mllXwiTGqk
 4CnakWYQEsXElPIbBNZB6wA5RCwPvgrbwsqC1s1xJdauOVE3oqEn++zmQ0NJW1yvsSFZ
 mUFRjBztPAotg/Es3zwbwarNIMfRc06Qzs1NK/smurTTS1hj04Vsg/SbkWGoey2Usfqt
 vKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728563369; x=1729168169;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8z7nt9hm4L9Wbt/Qrv08MzgIyMq4q2v0TRMhiPpwzsg=;
 b=f7N7ZAWWZ9BKyTofS53Gh0v2gLNguzj84o4NZmIbxTX88fuN0lDAzhFJZmDhNrMEUl
 vYp2xWKYcXZ6kyytc5SDd9tvAbz/G/BgN9spfHKM//YKtnnFhGdGwOHKXvBVlBZx8BL2
 sF5W+Qbl771pswlJRR/3aZ1hBNXfMJYY1ObsZEswWg0zTb6qgAop5zr+xD/GO6oK+E9P
 h1xAXfkCJbThVUSl9vIIayNu6bViRy7zEEkcOlolIymSiB5APlDGbaS6MXHeAaRSQMwk
 D/3b475MxC/ISLQLTalSOwL8PKleCZvpWibsr+s59ZXh1aadwDx4fnDYs7upaQ5AlxBI
 ijkQ==
X-Gm-Message-State: AOJu0Yz7TOoUiMSMQzGoUgKgwqf68E5ICZuXcGOeYcKX/8nyDdH8wckp
 /3++QEHBTy6c6PpyGPaaEOHQXmAtq1fCsOW3C8gL9xS2KxUVfrJ6LxPNjs+7Rkg=
X-Google-Smtp-Source: AGHT+IG/EYLHroZcvJh8nma4py7JsMUSVTGtZA/Fbfk2ouXe5EuZm5DlzdbXIS/aNPR+Tt1KWDSebA==
X-Received: by 2002:a05:600c:3ba3:b0:42f:8515:e4ad with SMTP id
 5b1f17b1804b1-43115accd0cmr25605465e9.14.1728563368489; 
 Thu, 10 Oct 2024 05:29:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d790fsm15127835e9.6.2024.10.10.05.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 05:29:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20241010-starqltechn_integration_upstream_drm_fix-v1-1-cf3cb1d1ce77@gmail.com>
References: <20241010-starqltechn_integration_upstream_drm_fix-v1-1-cf3cb1d1ce77@gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: fix kernel doc on
 mipi_dsi_compression_mode_multi
Message-Id: <172856336776.1392280.4931078237815172701.b4-ty@linaro.org>
Date: Thu, 10 Oct 2024 14:29:27 +0200
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

On Thu, 10 Oct 2024 13:31:42 +0300, Dzmitry Sankouski wrote:
> Replace dsi parameter on ctx in kernel doc of
> mipi_dsi_compression_mode_multi function.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/mipi-dsi: fix kernel doc on mipi_dsi_compression_mode_multi
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/33c255312660653cf54f8019896b5dca28e3c580

-- 
Neil

