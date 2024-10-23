Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C99AC09C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642910E77A;
	Wed, 23 Oct 2024 07:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J0xIlN4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D2310E778
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:47:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso40379945e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 00:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729669654; x=1730274454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQWqOpYZeng+MXOLp1GWIruzuK+nBAFMns++2n6ESZE=;
 b=J0xIlN4EM8Hg3YpY6mzL4WX3gqutJ/7VM7c7VWSD5iCeSY0qFlDD/SvDzk55knjBUZ
 eparLkItIz2jnWmmh8v6GeVuovqThaa0dTk1iJZwB2oGkYO5Z67FlNj2J+FEBPWbxPZB
 LLoitolraTA5mgQy5NvyB9JRd3N72UFGI99MUdIq5/98lXCfBS6rrnfRxW32GQ/57DDi
 GWfjALJiw1UvL1qHzRSNvbxOSn7I6jRFiPZ2QullvXWGDDW15sCJghHmVkMvt+TYkrmE
 U/SnMRaEZEU9hBpUfAITdEuuiNeXPa6jDFXyO5t0gSzK1WtHQBcjj6tqlaWA2KE3wYE2
 qPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729669654; x=1730274454;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQWqOpYZeng+MXOLp1GWIruzuK+nBAFMns++2n6ESZE=;
 b=llDNSqAGHZf+q9dOWdUSLpuzOENk3yNxdc1wX5vXUec/tmiJ8oS/DRYnsG3u2/jzPl
 PQqGUtk9S74the0+y12MTOswVOOVUUfUbkpVyZB4ZnjNCdymKVtbhal+oy582HQcuHri
 Cf+9JbDumrKQWFdMXGhfDktK+I6nDyHvKidsXrlHRomKw7stsMSPhzSW0xO2VF6NxIr0
 eQ7rAj+eTRZPaK7YT1BQewdB1nMUdIe/cDhIl2sMiS4OQe2snByPsNx2sySfpOKpCIDU
 8SzCtLwj5sb47F4iwM8Z0VmqNIBvsFY4nG8nT9/NRBbYuW/cpP2sGB4g/8+uIK2ow87l
 RqxQ==
X-Gm-Message-State: AOJu0YzCVn0uToUc6m6sEQMsE5520RgbRszy62zDGSUnhwhbe/VK7C12
 hDx9ojsFG8r1u+k8KAmbqmBuk//xyv5zFmDUa9BV8tPyZI05STbC8XEjRmaVS90=
X-Google-Smtp-Source: AGHT+IE7RVJxodr7X7GjUERSD075yzeX0Y1QzksGM4UPShCGHK/b6rXF19hQOYmqYhFnjt7jAjhz3w==
X-Received: by 2002:a5d:4e83:0:b0:37d:481e:fca with SMTP id
 ffacd0b85a97d-37efcf18bfdmr1090320f8f.27.1729669654049; 
 Wed, 23 Oct 2024 00:47:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bb66sm8244622f8f.95.2024.10.23.00.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 00:47:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20241021-starqltechn_upstream_integration_panel_fix-v1-1-81776e89052a@gmail.com>
References: <20241021-starqltechn_upstream_integration_panel_fix-v1-1-81776e89052a@gmail.com>
Subject: Re: [PATCH] drm/panel: s6e3ha8: add static modifier to supply list
Message-Id: <172966965335.2449641.10563615972532677611.b4-ty@linaro.org>
Date: Wed, 23 Oct 2024 09:47:33 +0200
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

On Mon, 21 Oct 2024 16:52:36 +0300, Dzmitry Sankouski wrote:
> Add 'static' modifier to panel supply list.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: s6e3ha8: add static modifier to supply list
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/91e21479c81dd4e9e22a78d7446f92f6b96a7284

-- 
Neil

