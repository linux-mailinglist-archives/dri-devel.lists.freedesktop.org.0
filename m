Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA27847B9D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D9610E87C;
	Fri,  2 Feb 2024 21:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d9ZJleng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAFE10E881
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:35:54 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3394b892691so714566f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 13:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706909751; x=1707514551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1ZLpW27TrE7rpACPr2operCMjm03U8jbEe8JMN1ark=;
 b=d9ZJlengzd+yrnvReWop6mbQLfY2lYMNXB8WbvVGMSiwDwzJ5vO6eDwE9uXQcj0MCk
 fdzlGJYThFSqmCF4fHdIJzBd6lhPNnQ1313sSttLEi0rICSz85urGNjXNziiE88RasYT
 pAcwqW/Nk7xMhQ4qxXyvtSmG18bez9DUmXpp5F1wtL5aNR5Ae0bYBMrmz7F0t4PwAGM5
 AMBp+i3Zm03D9ESFr4TNkSofOjEPiAeU+DVJkNPLABFeoK5G+tY0M+qiQDlR7WunATKZ
 trZ2OHayKIC2jdO8yVfcup83qOcCxvQehDdkMJPEb/jhj8sUOxykiT6U8uBcICckpdvY
 cY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706909751; x=1707514551;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1ZLpW27TrE7rpACPr2operCMjm03U8jbEe8JMN1ark=;
 b=uPi2XUXihGosThAgcGl2ok+1g1l0NyAPV0GHrV26tdMLAHEx7JJssXKY1aYWKhjKlK
 kVyyRXq5V4fCm/xKcVRunhPPs7yDIQoY0SfYM4ljQ72GziKUsEvvEPPn7KuDoQieuV7J
 lLushi1a9xqGr45s1mTjfT3ErQXBgtIbdx3VjuaovJpblmnIO6GUVJ1jlkhmHjkhGkcf
 /CH+V5R7hUcNMBuJ6PSRTYSUDpvJpm3NZIvukr2fqRRXORgRBgWCEUq+oFcDueHXtJ0H
 CqubEebCySLngSUjFaqv89SR9ElnRISekVPP+f9rAwwzo8iZeqVLNUwfd0G2m8y/dp0c
 RhDw==
X-Gm-Message-State: AOJu0YyMrA5WFQclfU5S9noQdPzYzYNbguGk4vlHKsjwDo2jS713DHiG
 rgXNKnSY+wU2naNEIsxpqWL4V2xOt2pVeo4gZOG753u+SjIqrzz7M4f1XWU5wQI=
X-Google-Smtp-Source: AGHT+IFf1mA/6YenzqdlJr6uw7LUW9L8fxC5+4TIZ3fWpdsXNtQ8p9zpUCySF0cAYE+7umcVPdDeJw==
X-Received: by 2002:a5d:64c1:0:b0:33b:187c:fcee with SMTP id
 f1-20020a5d64c1000000b0033b187cfceemr3812356wri.29.1706909751236; 
 Fri, 02 Feb 2024 13:35:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUyamDcaqCP9ah/qd/K0aYUKo6fJHVfZJBS+KCqVnHKrWp8g+gSpzoIJml6pkX04CnKx1ikshesz6EtNJnuKJY9eNXret7FP8gRAwawoUcLuynFYuslxuTFcRZM2kUSnHuSS7gbFBRVYLLw705boCPfJKCv2D92ru2vUY+PlVgsZRAMr2AYl2NDrbovD3Dlz8g7S7+TKshBldLavbXYMc8tjPDbg94krEj9FJeTGzANGG8NRa+9QzTOLmeG7iDoKxsVS4qKld98UyJZKv07fCeG6rC+dy1Tm6LC62yRmA08+LAuqNwqbfR/hPJWHQpESLWiHLwbUxB26BM2mrCf7qI05e9GY1MYCCAh4JCkfRDrVmyTSLjbHrfNLpSzZ8+h0u1Szf70
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0033af350fb88sm2687201wrx.25.2024.02.02.13.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 13:35:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240201-topic-3623_fix-v1-1-86ee6f20876e@linaro.org>
References: <20240201-topic-3623_fix-v1-1-86ee6f20876e@linaro.org>
Subject: Re: [PATCH] drm/panel: novatek-nt36523: Set prepare_prev_first
Message-Id: <170690975036.3073109.5398600795989490527.b4-ty@linaro.org>
Date: Fri, 02 Feb 2024 22:35:50 +0100
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

On Thu, 01 Feb 2024 23:17:40 +0100, Konrad Dybcio wrote:
> The .prepare callback contains the init sequence, so the DSI host *must*
> be enabled at that point. Set the prepare_prev_first flag to ensure that.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: novatek-nt36523: Set prepare_prev_first
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d543d1b6086b18f8d8b4b26bcdf86566382a3d35

-- 
Neil

