Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F891878E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6310E95E;
	Wed, 26 Jun 2024 16:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jONxm83R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ACA10E95E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:38:20 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-364ff42999eso5447978f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719419899; x=1720024699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pK8ZwgbL6LYDc0eMMmr6fIedoCitRdP77aKOY/LsSyg=;
 b=jONxm83RIsUs9BF2O3IelYCHPGWyeZsKzKUbR1vzz1N3HzzZ6+PrbxvXST9SMpWIvI
 Zwd1gezvN/FrNUsna9ZsjVZH3alr5Ud6+LlypvG451BIwpWacvmvKpw1DnE/St2w3sa3
 9jj17UhRr0sN2WCBa1WPvYFuI2zh2mrgtbRTHLYIlx7CUTTj3HY9TauHD+04EpNjU0ol
 BzGcHwN6wteBx0kAVS0G3yWAPXx7YWIALwLRkV6bkblMl9BQzWPse6UmrZ6PJwSV4Zhd
 k4Bc+0D6nhvyBbnsIxqYo/yIuvmTMZ+Ovz8e+2dl1uRm7VYPSFaw28A5tzlN9TO/dETu
 DyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719419899; x=1720024699;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pK8ZwgbL6LYDc0eMMmr6fIedoCitRdP77aKOY/LsSyg=;
 b=oTQsRMOuXsEQ7fyBTkyTt3uTTAcpg3jMo/x9tQLFpT8ueUJ/qd03dTE9MLUYCCGSEo
 0QBO7Z9upvufOjy0YyF+PxnKyRmuv2CPd4WP3QH/iOs8RfcOmHOgjuPMIU0ItwGxmqf5
 JfIlISePlEFxEZRnWvOyDq1RFg6DF7KNnCCJuyXi50IPHKqruvN5g8tcyifxNGYLCr5q
 2PL74iy/ecp2tTjSD8Z1rvfGCq1YdeSJk28cDM4p538ZegL5o1tG52rUSexbdDefE3G9
 7m0AVlCqgMhKaeNGkKhIEg7ZxqAihOjoXtM5GoBOeCKcOCUoXkxwtKY8ae5d0zkmzRAx
 76ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY5Q6GKjaYDcKy7FAbyd51qX0Ck+t/fiRv2f+gm+38Q5LquVIlSqPJcro3Sts0LNTaNSPuJGR5EQpRVERpIBv9d2MUfDIS5zN8baSJwmDh
X-Gm-Message-State: AOJu0YwpII8UyEILZu/qUd47mIO0uGitWQFT4V7bCRgl+6mXHdYHFs97
 m0wN+jFvQWoHuD5xYV7U9f8F3EB3iruRsXFjus76VHJ+qd3fRmKwOw5j6C3A3Ok=
X-Google-Smtp-Source: AGHT+IEh9dwmVlXYdT/VAhLvEh3BWrTtA0dvQ8UydEp5cZMMa0QzrXse2isw4cn968FkP+UNppKeng==
X-Received: by 2002:a5d:64a3:0:b0:362:4f55:6c43 with SMTP id
 ffacd0b85a97d-366e937f048mr12488829f8f.0.1719419898567; 
 Wed, 26 Jun 2024 09:38:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f66bbsm16387206f8f.78.2024.06.26.09.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:38:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: agx@sigxcpu.org, kernel@puri.sm, megi@xff.cz, quic_jesszhan@quicinc.com, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240626045244.48858-1-tejasvipin76@gmail.com>
References: <20240626045244.48858-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH] drm/panel: sitronix-st7703: transition to mipi_dsi
 wrapped functions
Message-Id: <171941989755.3024865.10038573806045518625.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 18:38:17 +0200
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

Hi,

On Wed, 26 Jun 2024 10:22:41 +0530, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for
> sitronix-st7703 based panels.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: sitronix-st7703: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/68145ceb9b6dc5c11ecb470ccdab8e146ebf294b

-- 
Neil

