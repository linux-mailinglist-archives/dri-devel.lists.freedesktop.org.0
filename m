Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849F9163A5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 11:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939210E05E;
	Tue, 25 Jun 2024 09:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n9FZVDdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10D10E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:49:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4248ff53f04so14523965e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719308944; x=1719913744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJpTx18M/ty64g67woNbXjQvBnNl49GFFpng+yfXaok=;
 b=n9FZVDdiuoDVrYsWmCPugL3kxkSr4CoQXRlUMM8SWS/PPSaN7zUViW+GnsJnx3o+Pj
 GxuSIxK1RxGInjo2eL+KhFFzfPndu9jpvHsKEbUyZiD7fSKOsK72SLluo+mWZWnPI8sM
 iOq/Aey4kDbfBZabTdFMDpjRbtkDmS4B52PfM6hpjNI1bhFMe3ZV7K8QKNxJAlINNV4m
 PZBZ7i28wTABIkazVV54PNPp/B1haLY/i7WC2AX2dE6CZg014NLbNKcOjjmT7JQsCLQi
 6vCVuT3lfdrkPk8zIshN1CZj7a7Us1KHmk20XfisftFY5GbtX1GC/Dhta6NIwcHfv5io
 rTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719308944; x=1719913744;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJpTx18M/ty64g67woNbXjQvBnNl49GFFpng+yfXaok=;
 b=cZUyoKTUWrNji3l74pKZHT13fK6OdfAaw7DBhD7/iZjAIyZ1kieeCQX93F3ugHFFfF
 /6BotOTSJosg3MdyXDCzsM6+VWwJslGm+HfncU2Wz491p4hhcYtk5zkiLOCRsYOA3R1c
 xPtnhVTwScQQWaXuCPezfG/YYjAJ9sFSYsbMIcJ47rgj94LM9MpUuROAxkzmKNbgFOVg
 Grj0U0c86MrWaOIpESzxzr14930kdqDMR6jp3ATlZXF7yggNH6evAJCnd1hIOTA9sDUH
 deQBbyflD+dRkD29v9F0GFqc37Yu3L4jGwwYLH0juY1a+6fMH2F3jhGjBv4VcqM5gZnU
 fJgA==
X-Gm-Message-State: AOJu0Yy6kKsPFSn8uDqZw8X9X1sBRSFEvhsFDyRLiWE3SAxZh61P1nwJ
 /I+P2bA5y5Ir6gl7f/Iz1l7csNW8pNc2fgPzqEQoq0YjnukYtxUhjg0C75e4iok=
X-Google-Smtp-Source: AGHT+IGZFy25ev3nUeuvrjQIowttwOuo93D7i0Ci98/mU5zOORqhKQlmx0xUKbo8Q47Lb7IM95F94g==
X-Received: by 2002:a05:6000:18a1:b0:366:ee9b:847 with SMTP id
 ffacd0b85a97d-366ee9b09a1mr5482044f8f.14.1719308943620; 
 Tue, 25 Jun 2024 02:49:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366388c40c3sm12452424f8f.30.2024.06.25.02.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 02:49:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, emil.l.velikov@gmail.com
In-Reply-To: <20240624015612.341983-1-victor.liu@nxp.com>
References: <20240624015612.341983-1-victor.liu@nxp.com>
Subject: Re: [PATCH RESEND] drm/panel: simple: Add missing display timing
 flags for KOE TX26D202VM0BWA
Message-Id: <171930894282.652957.8854208216460459572.b4-ty@linaro.org>
Date: Tue, 25 Jun 2024 11:49:02 +0200
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

On Mon, 24 Jun 2024 09:56:12 +0800, Liu Ying wrote:
> KOE TX26D202VM0BWA panel spec indicates the DE signal is active high in
> timing chart, so add DISPLAY_FLAGS_DE_HIGH flag in display timing flags.
> This aligns display_timing with panel_desc.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: simple: Add missing display timing flags for KOE TX26D202VM0BWA
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/37ce99b77762256ec9fda58d58fd613230151456

-- 
Neil

