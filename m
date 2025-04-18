Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39847A93CDE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DF910E250;
	Fri, 18 Apr 2025 18:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WxjJEyfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7210E250;
 Fri, 18 Apr 2025 18:34:42 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22c33ac23edso24077505ad.0; 
 Fri, 18 Apr 2025 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745001282; x=1745606082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEL5hwj4ZcKmQgInqqPjANGqLqKJKFxTEKIu2C+lufU=;
 b=WxjJEyfMNJT4uRpWWMf2Nglp2aTiWwUshr+Nhq+W3JhjprHonkiCk44RHB6fHgi4gh
 c6yuSk+5FcYk1gqlMPjl4GaVqm3l4101birlMxSzi7BBPVpS9CYaedw650SX70XP9u8g
 PMjSTp+SscMwQ9isAERuvGQwV4fDJFHD8TP9XRYlYtJLvbIOWBcya06y2o3vMU4e8q9g
 nhlV+1RgmEPxtbcyk7lS5F1WfkrfCMbEPEir48WC2SGthFJ/vkYlJFsCSXR+Rr0cvkPm
 q+psHY2LTGCv7jJupx2bBB74gIEGl6GzC8WRnCdd6N2TJFEiKlyhYc0SlnqTYKewSxWD
 WjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745001282; x=1745606082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEL5hwj4ZcKmQgInqqPjANGqLqKJKFxTEKIu2C+lufU=;
 b=R/HWoXzBRwWXXWv6bXEJ+7yJTN4enw2ejloYTqXjUoCjG//83AdNyWdEEPha2o9XbL
 KTXym6z8WvwH/jSqLFJHp7rCaTC6fZbknLiHSU7UzwE7w40RbkOPx7QwTNv3WIqn+yYY
 SX/qac6nzlzYO5w1ycDawOquNSzOZ+hzeoW9aaqkTPvIBpP2xLjWVCcXdbauMe3OR11Q
 XUMEMFgaudbcKRuJ+gPWqxGAXoKliAgt/UZrnffEclbXk1Vz2RfZ+8EOUtn4K5TDOIq8
 y4UbpwM/Dax0hRWW4Z0aWbsB5vCvf0nOK70oUUMuiVulnbhzifiYZryyWh81ZW2mZCSh
 59cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNEEbROW1J3PSXRJpRiXgO7rC1ezpu0LM4jItk0DBAaMc5DATCBpvvaPYn70xeF9R2ZqkKt4kQM+0=@lists.freedesktop.org,
 AJvYcCWVgz+KIjChvvhu+hJ3PIAYJKjWrmwlCFgU4wAjS1ossUq5QwbJICL3stDWl07P+En5EN4l9WtN6ECj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztkp7hB8PkCAxNkHTh6VdJ17B/jMtfD3811mFpcK1TqXm9pkeh
 +sgRrU4lY55WhWxf5iXwJScbN7XqPpaeY1OMgsoEod0WLa+X4qK8
X-Gm-Gg: ASbGncsxAaFjmqibLNHHjkYp56cqKo6twS0ouxnSaztcVlaHn6NXwX8mv0dsm413cFb
 z/f06Rb3+YFFDF8ztR4QLK0hmS+rhvXHvdC1TTfGviLkXFq2zZC1OvS5hAQCip4UQ6yIP7p8rZ7
 JkWZsiWtM8mAmsChrkCIcjQ4UXEsDhuGosJPUDNYHsPAV98p8wwB8xc6eSlxsAbGtUWrDZIEKLu
 YLUr/SEalu06wCooyhikMjCInnaLJWSkukmrUujXneSz8e/PK4T4FYpTwkrZm4i55Xqg+3pH/QU
 5tEoy7ab/f6S+uP5phWdizhICf9MRDAjsIC691o=
X-Google-Smtp-Source: AGHT+IGAg/lnXCq2oW7mJKwA03rXOp9bjmqxNymxHwT8OBsAUwilnAGzFjMlghfXVPNRrh8L2LFXNg==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id
 98e67ed59e1d1-3087bb631d7mr5824623a91.16.1745001281749; 
 Fri, 18 Apr 2025 11:34:41 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087dee325bsm1774222a91.9.2025.04.18.11.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:34:41 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: jun.nie@linaro.org
Cc: airlied@gmail.com, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_abhinavk@quicinc.com,
 quic_jesszhan@quicinc.com, robdclark@gmail.com, sean@poorly.run,
 simona@ffwll.ch
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Sat, 19 Apr 2025 02:32:36 +0800
Message-ID: <20250418183236.209236-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
>
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
>
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
>
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
>
> To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> are needed:
> https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads
>

[...]

> base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903

Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
topology, I want to test this series, these patches can't be applied to
the latest linux-next tree, and I can't find the commit id in linux-next
or msm-next. Where can I fetch the tree?

Best wishes,
Pengyu
