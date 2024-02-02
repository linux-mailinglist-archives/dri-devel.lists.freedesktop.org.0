Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD7847B9C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0B910E882;
	Fri,  2 Feb 2024 21:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oclGO0e2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B498F10E876
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:35:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40fc654a56dso9260825e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 13:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706909752; x=1707514552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nO1fetZcYPYS16F+FnCHvn9Oo5qFEOK62Q4RUHfo3ms=;
 b=oclGO0e2EEbM+lv5W7ER0aSVBcWIcf75TpiOoEsci2EsZFHOhreNwZm4+ow0rY7nB5
 Z7Ems+xPeIuERxmvRULifIlu5TjaONaZ9c0bbO1OWR7ynYWBTmTtWpFkujlorbH7rSaS
 Yzb64CIPXeLbkVXtUHt49dptD+B8FNeG+61AkH5fPRY05GF1Hyv9y1UVQZWD6dGkzVaf
 kibwIUl2BCsr+0watUBxdTBjRmnQSD0NYncs0gjEdodBEgr8udjBJ8uzERz97KJi3S8g
 +ZLBgB8jnhpoKpsyjna2lDRCVz1SEN1JxP8LYqDXkgUFA7i0WE6wvAIiy/M27/kc84DZ
 UJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706909752; x=1707514552;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nO1fetZcYPYS16F+FnCHvn9Oo5qFEOK62Q4RUHfo3ms=;
 b=n7NdN55rN43Kgy2UHuy0Z/WCk+4ueMPMnr3gig24FLj4eCkSLytezE6MjvBea4recZ
 2u7+eDhzjTCfir3cPqJbHOK8auMFDv+aKOPU7PVf0U99cRVnCdqf92M7neKJrRTvsI7V
 UNoUDF30aodsvtHxogtODvsIZnrWXwfY04h5ilfQxgsnAWfp67oO4BzWK7MwrjTiBzCx
 ddpEHLxhYWMHCH2gt0XEi311/R5nI0K0/IdyKmmizc3IrwVI8WDsLusapCdY/4pFaU9B
 bogn2f5sNrZBkOYDRA+dDZNv8NHfeaR7RihNv/2JvKacVFkKEhgEI5ijB4ANjJZ8NqWD
 deOQ==
X-Gm-Message-State: AOJu0YwqAj8tFsLpJF1w592cXLXMWsqZR8RNtnS2sGDMyZXxpFq/b4j0
 fDX3nFO2TG/e8m3y88Z2KMsA1aQStY1vf42HZGjHDw8iQP0tXIK/9ZtmkZehWg8=
X-Google-Smtp-Source: AGHT+IE8WgnK+R36YliQYflwys554C0Uq81Kv4S0tDt/z9xl5R/3b54s/0x3BUa44bWaFs9otZ6GXA==
X-Received: by 2002:adf:fd08:0:b0:336:71a9:4ba8 with SMTP id
 e8-20020adffd08000000b0033671a94ba8mr2526848wrr.2.1706909752122; 
 Fri, 02 Feb 2024 13:35:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWjP/nk1id5gn7p+rnSsPZoZX9Px0Djry6vhKM9vqrjVWL93ubkDT2LrR9CN4v1Xdgds+WoZWEtgztllE/PwMvJB4AdWvkAwqQEO3BtzIFKet+kDm4cUcohtpxbAO6Rg0WZAvEP2QidkjuHQDMRymJEaEYtwLSr65aXl1r+toP4vazcKhId0f2ZOpFJ5O9wOP04ETKWXp7KgEVg1nsncw1suDRR8Ztb2LVsUY/N9u9CPMsp8/dLEkPfxtBgdtkXZfZgBrNtZ+q2oVBzAl6TZZIkrTGyIHE/mZjZpWXajGgGBoSQMg7qi7QFbYG6vBszTum3lzOfo09+WhqoR7qofh+YN/x+L3BQsNjV/Ni+OiPGb26dtA==
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0033af350fb88sm2687201wrx.25.2024.02.02.13.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 13:35:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_abhinavk@quicinc.com, Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 quic_parellan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240201-visionox-vtdr-prev-first-v2-1-32db52867624@quicinc.com>
References: <20240201-visionox-vtdr-prev-first-v2-1-32db52867624@quicinc.com>
Subject: Re: [PATCH v2] drm/panel: visionox-vtdr6130: Set
 prepare_prev_first flag
Message-Id: <170690975131.3073109.14083509927248220761.b4-ty@linaro.org>
Date: Fri, 02 Feb 2024 22:35:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Thu, 01 Feb 2024 16:10:15 -0800, Jessica Zhang wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: visionox-vtdr6130: Set prepare_prev_first flag
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0581bcc48048924f021fa8fae54353402c5d3740

-- 
Neil

