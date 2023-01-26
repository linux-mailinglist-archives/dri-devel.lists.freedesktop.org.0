Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFE67D500
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164310E98A;
	Thu, 26 Jan 2023 19:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5210E98F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:28 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id fi26so2759169edb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spxzCvWMZNGjCVdIu38RxpJRhK/Z/NWL8pHycLSebmQ=;
 b=tfFFTgv/BHAgCuMgHic7psoRBdMEThbyYFEoxehEBTOWzQ/uMNX+GUeBHQwaIB2XNP
 ERjJtqrUXoRLqxNweGBee88WGDYcEK/GjmKW4XpartmaLZv6V2ZGdwk3XRiCtQQ2Mdfr
 GL4V29zMIRCN6IUK7em12uijWKTOePoAFg/yEmSIkTePXMqKXhkYmTvEj8/hSZRMng3q
 ZKLEFd9o9OjNvGSNqlD+LQgSLxNw5awj95Lax1bQby6e7bj5R8K2RQOIJ7J5mJ1NXJdw
 NLM3g5Oc/SMso/WSJSusNmArJSBvmLNAz9AoeOzKzzbeMb8fFafvveA3shVqXGmDvCmP
 Ihtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spxzCvWMZNGjCVdIu38RxpJRhK/Z/NWL8pHycLSebmQ=;
 b=4vWnz0UC0UWVDcIPuMu54GecEoj/3HalBh3CXKQMFeCpbKikAZ8GUe7p3k2MUnuUYg
 0YIO835RaLgTgXKAcAIYhaly2Tm2wwGXEZ0BJhkRJyBZucTyfn5adh350/T4Fy8fv7Sh
 RQsMq2ildVYksfPB6hz39SgxMpRKNnQrhT66icq5Bcp1q316I8kS4k13JxmJKBg7O46F
 5n6f3oEo2VA3EfyvTmwcRKSlMS7n9mEXjbZUy9vOsotdMrEGb8VjlJsMe+q6YuylUeWp
 cyU5i1P+kbEY7cOxlh+sczPDQ867H2R0tQwNxt+OTd7HGR+xMGDyI30XXk65BpxK7NcY
 Y1wg==
X-Gm-Message-State: AFqh2krGV9zFG7zQCgLobrGGgIDMFJanrdRbXrTJ9qO2fI53X0iDdujV
 SYLJXXkU8wQQMHQxVKeC7b29UtP2La5XlAbS
X-Google-Smtp-Source: AMrXdXvONfAchFoBBXRLeOSeCkHRQ0a0OML3R0M4wvDJdl1RbQ5vEO1EuPSXU1C4R1XhzdRbckcV8g==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id
 sd42-20020a1709076e2a00b00871e9a0eba7mr114187337ejc.57.1674759677058; 
 Thu, 26 Jan 2023 11:01:17 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm: use strscpy instead of strncpy
Date: Thu, 26 Jan 2023 21:01:00 +0200
Message-Id: <167475959092.3954305.6114466663936878073.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
References: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 04:01:52 +0200, Dmitry Baryshkov wrote:
> Using strncpy can result in non-NULL-terminated destination string. Use
> strscpy instead. This fixes following warning:
> 
> drivers/gpu/drm/msm/msm_fence.c: In function ‘msm_fence_context_alloc’:
> drivers/gpu/drm/msm/msm_fence.c:25:9: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>    25 |         strncpy(fctx->name, name, sizeof(fctx->name));
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/msm: use strscpy instead of strncpy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d7fd8634f48d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
