Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFFA82D550
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD47710E214;
	Mon, 15 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C55010E214
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:50:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e80046246so305435e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705308646; x=1705913446; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TYJFKCqRjvcAOZScXqGwljNrNcwX1RWIF5kTzj+ztc=;
 b=zZ2N46SSBtP4Xq79iXkK63H61fAqs3oNt4WhKTztAtPWrCzZEfO/KRhNeuEoMRBJbV
 qZXcDq0hR/Ypj7UTMy9AsVxmg9bmZkVAjbSz5BOv6gEZznDPq8n2WEfxS/cfi70dg87J
 ZZexwhYhBvbf6lVdKQDUwopDLme5S7TIHOJf6F1oQlkF3dRT4vj1LqGJybZGbQZxQBky
 XwtilqwH/XOcP48fIvjy4tItFW4EDWIGMOdM070p6Q9wDGjfBBM8XCtgedKK965Ur4RX
 UpAnyo+Zkgr2Ln+KG5LwePnv0A/dhJMcFS8i9NmP0OnI4+rgFrZS661oITYFwMp82ZqL
 CkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705308646; x=1705913446;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TYJFKCqRjvcAOZScXqGwljNrNcwX1RWIF5kTzj+ztc=;
 b=OSqySn60AYfV+WMR9+w6e56on/IbrI8TR0x524XGbcz2WvHYTM7/xy1dDOZMeGA/+P
 3MwX7un/+PgfzVDYd7XAwE2YJxsnNfGckjYTqJ4NSb1SM9zlfE65Kag5ZPQw6OJlI4YK
 cvgNnIRHpbvb07SV69AhnFe7Ycz2COvClxTiSd6CRr7mNSXOS3T4TODkXBcMW9zCo93Y
 KyfVVPpHIdhzXX4UhpEF9+dJzhRac4MVuLdqnrD62JsRedJNpBrMQ2cRrs7TkYSQMenJ
 RxN3kl/YyZPyI5SXAKBuJqG8CDgWvOULenB40W0B/gxmZQB+Wf8GNr5APZ/Y8HtlGzTA
 x/5A==
X-Gm-Message-State: AOJu0YwygtkFBYs3ozgMGJFeLYSLtAgDvSWtisZRFePU/iF5y85co/yO
 bFmZbwN2v0BtTRciFXLzQa18Ltvs5Bdweag66bPuH69uFAE=
X-Google-Smtp-Source: AGHT+IE+yek29mqri2fMFu5ocqEYCMOXGL6XkoH7oGse6lZ1GjJ+72Vk1tyBF0FQJfUvGEfnIiMn8w==
X-Received: by 2002:a05:600c:2484:b0:40e:4cae:a3f1 with SMTP id
 4-20020a05600c248400b0040e4caea3f1mr2569303wms.77.1705308645938; 
 Mon, 15 Jan 2024 00:50:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a5d438a000000b00336344c3c3fsm11224128wrq.90.2024.01.15.00.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 00:50:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jianhua Lu <lujianhua000@gmail.com>
In-Reply-To: <20240112140047.18123-1-lujianhua000@gmail.com>
References: <20240112140047.18123-1-lujianhua000@gmail.com>
Subject: Re: [PATCH] drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels
Message-Id: <170530864497.3765652.8786048172008911730.b4-ty@linaro.org>
Date: Mon, 15 Jan 2024 09:50:44 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 12 Jan 2024 22:00:47 +0800, Jianhua Lu wrote:
> After commit e6c0de5f4450 ("drm/msm/dpu: try multirect based on mdp clock limits")
> merged, 120Hz is working on xiaomi,elish panels, so feature it.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=de8ac5696ebc3a2d89c88b70aa3996ee112e76ef

-- 
Neil

