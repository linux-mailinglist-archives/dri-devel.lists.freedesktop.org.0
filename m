Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBDE8D26A8
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71281127C4;
	Tue, 28 May 2024 21:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VJG8uM3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09BF1127C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 21:01:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f47728fa4cso9280195ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716930090; x=1717534890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kldUlHGlYelMN62LBMJjgiLYRVJsAWF6QEo1XLUDCEo=;
 b=VJG8uM3NOeAnsbYzPsXpgE3oQS7Y2KBeZ01K7EDlMW3yv7mREyTn0YqIkkyprnh8tv
 oym0ZuFzTtVXF5j1dMWVpmpAwjt2mNnn/27w9+UwOHEzdCVYAu7r36yq40lF2pVbVE3m
 JRK2YBuZOLJoYxUNkYvj/cE8qUn9o9s4RwhL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716930090; x=1717534890;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kldUlHGlYelMN62LBMJjgiLYRVJsAWF6QEo1XLUDCEo=;
 b=iBO1FpyeruPPKI6R5noA4SgIP9yldCN4CDVvjx291k2Kze6JlPreevmIYTxlZTrYvS
 6r6DPMmDkL+hBH928TQSYlH1DKBhjHO63bZdeA/SlTxRQA/JtAPsO5sI2eTa0Sfbv1cz
 1t7amGQt0HkuIiWISuk/WhQa/4I9HGgs0lC2stFlCNAVM6ggzcHlmG8vVPdTOQ1Smeft
 ItqClU8kNLIyFeGJX9cc+4byc2ErIOzL+3b+TJlHJnmMa5F2JFgoDxT5B58n691NTEUu
 u7Mh6W+w13JnzGG1kb0wom6U0eyLOgr5ebfz6wsVUgAWdWfyt0iNdxDT9J3FJzTlL9i4
 4Ung==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbtFStCJLN7crlRE9j61zd7hLN54NXz6x2TdaosQJ0y5l7mgV4Z9Thw3uxG8YG1LQDhuGAT0Vg62+5tTw/tEanJlpRXvP5T6ljgM4+Ir/s
X-Gm-Message-State: AOJu0Ywh7goso5idqplUEITQadcAbqerbnTy/bDpKDjr9LlPnRXzF1Jl
 j8JsZzreTe1sT7z9YWuNS/SzQ16gv7e1w/AEVOpvk9OcVFUjREc99dCExGTatw==
X-Google-Smtp-Source: AGHT+IG0kNYVDsSVx+Xsf6GkcBdGPX/DHNTyq9JYFaso+nYgLEMtrbd/KFyjo1fC5f0hK7H3VKK7mQ==
X-Received: by 2002:a17:903:22cd:b0:1f3:7ba:db1f with SMTP id
 d9443c01a7336-1f448704932mr141299485ad.16.1716930090171; 
 Tue, 28 May 2024 14:01:30 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:8d59:feec:9939:40d7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f481d5a77bsm53167725ad.298.2024.05.28.14.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 14:01:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20240527095511.719825-2-treapking@chromium.org>
References: <20240527095511.719825-1-treapking@chromium.org>
 <20240527095511.719825-2-treapking@chromium.org>
Subject: Re: (subset) [PATCH 1/2] drm/panel-edp: Add support for several panels
Message-Id: <171693008901.3691502.12900282593868774684.b4-ty@chromium.org>
Date: Tue, 28 May 2024 14:01:29 -0700
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


On Mon, 27 May 2024 17:54:49 +0800, Pin-yen Lin wrote:
> Add support for the following models:
> AUO B140HTN02.0
> BOE NT116WHM-N21 V4.1
> BOE NT116WHM-N21
> 
> 

Applied, thanks!

[1/2] drm/panel-edp: Add support for several panels
      commit: e4f9fd9edbc22faceb4c9c57242440bb9e17924b

Best regards,
-- 
Douglas Anderson <dianders@chromium.org>

