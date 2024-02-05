Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F658498A3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 12:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201931124D2;
	Mon,  5 Feb 2024 11:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GMz8rcBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0AA1124CF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 11:19:13 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-511413e52d4so2238294e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707131952; x=1707736752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7yB1JwfdtlK8Nr5qoTQPOBteK5POkJ98NXnn48et6s=;
 b=GMz8rcBkHaN2ymEXppNlOwbsBaUXgchqdjlKX8Zfmnv9sj29juHU5ZdEJs5x7D26vW
 iinZlb8Qde+R+v4ILRUmpSmJwdw40+Ra6HvOHd4UO24xvjniPdJtE08Ud4nlyMySPjq6
 MmQCTO8BDWkXcb7LhbRh1hSNlaymm1QJEW6NiieGGfTmNJC4iKF4pjEYbZFVDUU7+gio
 w2EMKiCNalTIQCBO1MOg2u0T6nxpItwR+nJQgQsyjSm60Fg2dJAkqDIUWVltjDYiSho7
 gfOOLg/S38kwSk86LBL+t65kxXnrzdTPEWOvAyp7P0qyH7YNppWHq1GHP2S0sH1c8A7h
 g+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707131952; x=1707736752;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7yB1JwfdtlK8Nr5qoTQPOBteK5POkJ98NXnn48et6s=;
 b=fScO2FVv6sn1l20rvEXXoXRFGfAzlPPEY1QhdPahJv205jN2GuJ/TEuTZN6B44T1ya
 Iiq3lJAgOIRkJKfycFfTtqXwRSgdihiRzazcLJCsWvaE9f5cFSVA9lDWHGTM7fNRGxHb
 BVVxg8NRRcQ1whxfBGv4SwBabUiWFgVDfoBZqSyJpISaougYRR0ihR5OPME/HbEPRvQB
 uHU+7OlErQj9Yh6j0qdpjhZDbAZ0IofUT8vq7Rb7Vgc7gYqNvDwJMivlpAtEwFlpQkbk
 9XHWUIFTRP5pS05vKiocSqZcNDaoECDpRJPZpbQwRnjUzLJsv+PHNvx4GPybnft2Ou0g
 Gg+w==
X-Gm-Message-State: AOJu0YyjVmjYJhuB07byhQ+YWhDbaLa8KLP3cAHJSSGVjxqsvFU9Ti2k
 aplWJ62d3iltV3Us4Tue0H06ZNBkOsuWamoHFTeKQAV331k4F2/1g6XjJ6xMKf/X5ePxmV2mwWh
 KaGPQ1CPQ
X-Google-Smtp-Source: AGHT+IGmpBP0glxG1tsmzenDxuUuyUPzw/SIACwk0mD30y+FIBS0Wk3T//ZjdFnFjHVnZpfsweRWZQ==
X-Received: by 2002:a05:6512:943:b0:511:21a0:474b with SMTP id
 u3-20020a056512094300b0051121a0474bmr7803752lft.12.1707131951827; 
 Mon, 05 Feb 2024 03:19:11 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWxVTGH8pChxHZ4vl2f+aPHH7RzJxdurH7WMsCH1opa4J7u2nIfGV33GmJOtgXSR7v1kugim2uChWBvly4fJffli2KzGUikkoymRHTuwMexSWMSOWjZ9MPSTAuUzlM8cfAnF8YFxN54DP1iUB167cLxxEKjcl/AVDjqZYDtMg+JBYBVRj5sTPc4grxdWeXVoL7zNv080ZMa66Mh/EehTvEbIwXN4Vso6eqwMyjbTNSZhTzC5YVWIItnOiCtSuQ5uzWRTiEFf2SAAcnvi6eprj3khwI4m4VFVGPDL7h1Y8fDCE1GYCQJFfrhkutZmT3njw/0qSLWKsZBUw==
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a05600c481800b0040efb503d58sm8177158wmo.28.2024.02.05.03.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 03:19:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240202-visionox-r66451-prev-first-v1-1-c267dc889284@quicinc.com>
References: <20240202-visionox-r66451-prev-first-v1-1-c267dc889284@quicinc.com>
Subject: Re: [PATCH] drm/panel: visionox-r66451: Set prepare_prev_first
 flag
Message-Id: <170713195081.1366121.15304766185356655476.b4-ty@linaro.org>
Date: Mon, 05 Feb 2024 12:19:10 +0100
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

On Fri, 02 Feb 2024 13:50:21 -0800, Jessica Zhang wrote:
> The DSI host needs to be enabled for the panel to be initialized in
> prepare(). Ensure this happens by setting prepare_prev_first.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: visionox-r66451: Set prepare_prev_first flag
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb3bc3eac316b7c388733e625cc2343131b69dee

-- 
Neil

