Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2B9642E4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03510E62D;
	Thu, 29 Aug 2024 11:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YHQnRKNg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595610E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:22:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4280c55e488so3065765e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724930546; x=1725535346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgb6iZKhbzGIQfuNXvt3MSxhnROPCHe+fvwJkwB4S6U=;
 b=YHQnRKNgNZx/3S0urZN9YMW+ORd+fVB9Dl7QMfhxgKrYfHLk3plphQB4CcHkn8vTQ9
 2sCxyvAcxh4MflGy8XNCm2p60COfwYGjIRD8fORdII5Q1dc2YyKkm7vx5MV919LQ1A0G
 kvqlX4boyC6YM7iRDemx0lZBBL1VpD9am+TAxq+yBGhma3eO96AxnqXiQKWDWZmUAzKe
 GbiZ8Eh+Va7y82RLTMTKe6E6MSqaxaz2oQ139Gbbf22nMQ4dnZNliTr+aa9aocHu6fwy
 QHP/7iz+7bAv2lxpqn9nQ2/xErtLOdfKx/5l2/ylwU69CQALbWGJZI3hvHtkuUEcX91n
 oadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724930546; x=1725535346;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgb6iZKhbzGIQfuNXvt3MSxhnROPCHe+fvwJkwB4S6U=;
 b=EzMUT/jjyqnbK0xU7CtQpbtN1+ATNJdD5UPYH4lPr89f83zShibyuybs3QXakwcGG3
 mxNqXjZchwOeq8CRcAq4Y4xudoT0JJwd2b6OlohRsWunswnlhqwB8hZkgW7FaSQLH0O1
 FEBAPPcEBg4jHHQciAoYULtDie3g+PxUjsJmdCFG0Xps5M+H2erMl+8Q90PfyNwJxgCD
 xBo7oSVAQL003VXOQXnEo8RDUup+C99eSZDHczWhD2zZAi/uj9MayLwvXAfZrSp/PmfF
 dwiGK6ZZxfUj6GfZvrnKBu99BOYhOoU4h2LQOzq6064e4GnrggeBW3CWeYuexZBznycu
 ZdgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRgUQjB1rZTpiMaJRw4ZH1Cex6oWIvnu+4lCgXbvkJa8e+FJiWSjirQoM/4j/SytnEyk8JMJh1/BI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHF5LWjmjfYMZKaOeifpk/UWsdszaCvT5jktrtuYjYmru1qJvQ
 PCBUz/fvo/unSybaJQRkgAevLlNd3E9nCPyKt/rW8mLmtFgK3vyk6nYoVBJPKZxv44NXzGMFhyW
 t
X-Google-Smtp-Source: AGHT+IE0nbH7IwCpgklDgufzyh8MSswgnymev7gytjl81YNMXkfTbZLWTfVxhkwJh4TfKrf86Wv83Q==
X-Received: by 2002:a05:600c:1d08:b0:424:a401:f012 with SMTP id
 5b1f17b1804b1-42bb74111e3mr10034135e9.3.1724930545955; 
 Thu, 29 Aug 2024 04:22:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e33d60sm14122015e9.43.2024.08.29.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 04:22:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240828182210.565861-1-tejasvipin76@gmail.com>
References: <20240828182210.565861-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH v2] drm/panel: novatek-nt35950: transition to mipi_dsi
 wrapped functions
Message-Id: <172493054517.1145269.7126299597772633159.b4-ty@linaro.org>
Date: Thu, 29 Aug 2024 13:22:25 +0200
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

On Wed, 28 Aug 2024 23:52:10 +0530, Tejas Vipin wrote:
> Changes the novatek-nt35950 panel to use multi style functions for
> improved error handling.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: novatek-nt35950: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/076403a69837c1f8454ceced3ed6f0465835f4d1

-- 
Neil

