Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C35A9A5BE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B49A10E2F9;
	Thu, 24 Apr 2025 08:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RxA3Rzcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF2D10E764
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:22:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso4310705e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745482934; x=1746087734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIynMgzNZBX//p8JMkyZp6ri1Xu2zjE3M0NHiMyj2e8=;
 b=RxA3RzcdU9guIekt6XU5qzfLeDvQRMv0J4eQOgODvokK/KOEqsCch8CxWEIBmo+2Hh
 LXqyTONcQAGVt9U/lWXWFeGdhXhd3g2o2cgeydLvzbavW9r5N4+N5f71yLezzthfBOG9
 wUST8rECV2/akolyIRKOfSDp+tIMXJzKGhjzVJyA6RXAHH+Mn3ntgMmjFjYuPRb9MM45
 ygM8xobA8vVOzFSmzoigd/lvQMXKGwVTEM2gtXu28PNX5yLSBCrwWTPL85ftfY20Rim/
 enF4tmHC2NKEJClnVIjWnduBiX75rwPlZU0DzS4E3kmhB9r1/KEtDbH2j6SCR1xMp5bP
 DIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745482934; x=1746087734;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIynMgzNZBX//p8JMkyZp6ri1Xu2zjE3M0NHiMyj2e8=;
 b=H9OqtLUhchygYMpgl3Bnj9Z+617ZG4lGNHHFWN5itPThXDyy33eRBK8sjL3Fj8sWT2
 xrUg19mAfAedLFz4M0d3e1YprYCnXrnZD6NfCcodRC1rnXvxAwJbAwLadE+VouRvOCBA
 3jXPHiB1G/czKajuszFGeB/veqgg7wRLNLT4XYd9WbFlMHkuZcBXUQG3630axDYyUiXk
 4AzEK1nLuKWR/f25DZbY78wYQL3zC7sl3ydyjbDAXZlMQjJcgFiceVzJMflpv+FxvKKN
 f9cPmDBf8s1lPZnMcm9m16lGTs8ip8U8uKdu9oeqOaVmD4Wxu95GdepjlwqSeK2GSpuH
 P+oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqYRyOT0NcrEVTPF24fOPR3MgRBuAfKV4EuU5B3lkRJrTFadZzlYxGxr5kfSLIQV11zOOIgiChYro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYNmsyU6Wi5vCyii2lTskFKGcXHGAL21fzjiECrwPKuxhXpjeC
 DeoFuyVFTArINjM26VtP8YM3DdhyNyQuQMhocFayl6XQE6QgYd8iKj10POZoax8=
X-Gm-Gg: ASbGncvEv6yTpQgTFYSh354l/9G5CCE6gN+GFdnsjdKQ/BVpe06m7FDczKFvl8dvZ6X
 uH0BzHZjaUe5DPOu+P1aqUzZ9LxxTIJvavoDOOELmYZ5z4XRJrVempPZLczSId/IoBBdLPSwlxP
 uLUTC00GGCXQOS5YUbu76ZW5U8Z1JUMaidVCa0Iid4cVqyZdey0MdCbUe2BZ9ST4fJTnZFczRS9
 bXwLjuks0GV8FGYEvT0HtqEDlm8Tcn1O3B8XIJGXNB/F69GfWx5XQ0sWQAFIlaHEQCcA7SyAFOB
 0nE6qvrHcgZQKBYg/FyEMG/a6lRnPWmfDwG9YPrTUgpIccmTfd98ob/2gbsXnQ==
X-Google-Smtp-Source: AGHT+IGNoVo6KhUwBfuui2yrKQx8otgicR7UifrdI9urzxt8lGP1itEapAxnVeqq6j8kw3geKV6JYA==
X-Received: by 2002:a05:600c:45cd:b0:43d:2313:7b4a with SMTP id
 5b1f17b1804b1-4409bd07569mr14887825e9.3.1745482934032; 
 Thu, 24 Apr 2025 01:22:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d29bfc4sm11229415e9.8.2025.04.24.01.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:22:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev
In-Reply-To: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
References: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
Subject: Re: [PATCH v2] drm/panel: himax-hx8279: Always initialize
 goa_{even,odd}_valid in hx8279_check_goa_config()
Message-Id: <174548293341.3240462.5657130460856318772.b4-ty@linaro.org>
Date: Thu, 24 Apr 2025 10:22:13 +0200
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

On Wed, 23 Apr 2025 10:41:41 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>     842 |         if (goa_odd_valid != goa_even_valid)
>         |                              ^~~~~~~~~~~~~~
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>     838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     839 |                 goa_even_valid = false;
>   drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>     818 |         bool goa_odd_valid, goa_even_valid;
>         |                                           ^
>         |                                            = 0
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: himax-hx8279: Always initialize goa_{even,odd}_valid in hx8279_check_goa_config()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0228687423587d8ef448fc1d81f96539507aa5bb

-- 
Neil

