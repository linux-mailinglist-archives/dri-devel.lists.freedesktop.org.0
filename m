Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1B8D26A9
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7871127C6;
	Tue, 28 May 2024 21:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mW+StCvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5491127C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 21:01:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1f4a6a54416so1888285ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716930093; x=1717534893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfMy6c3Znd6tavzTLRzjdvXWxxk0QstMx+psfmFRnqU=;
 b=mW+StCvd45mZTpnCWpA/uPlwXLbUZv6Nx0egSYm5vfBhioU3ipyADmpHCFRH9hGAC0
 /mAWiScMklnIBcfeK5qZbbONAw9kNbi6uv332hbmksNsGU8JXJubEEFoJsR1qOiWoEk4
 Pt3buizkJi/cAzlLTernxuUveb49g2TqyR8s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716930093; x=1717534893;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfMy6c3Znd6tavzTLRzjdvXWxxk0QstMx+psfmFRnqU=;
 b=sk9ejOtTrBC1CLXzQC39e4PIxrAXA82CNYb0CdyOiTIPOspDeBWTMuImKHmiYd1Fpa
 +xMEg7WHsB4C+pS67HciILmU27bwkxkpnpSDVw/xMB7S0dXqXmOdO8KYsUK+AgjQh7S6
 QBS1Lml2NDaDHfYEdiAs4Igylvc3ReUdmDrEPHmtCVgd1rBpmONzjQ4gjGmMEr11u235
 CpSPC2dWidhqimIxo29CY27yC0DTu50gMhkU3peIBrb4L0jccxmctZba5uPoCcsUeEYM
 LB5hSoF74e12aBAZGMdFrzH02sjWIkrr089fyQdgvTWl45w7+25BjrXfraJNBWihI2Te
 hg8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0es0CYJ8MXxycEyyoAFv8UVwlYpGVm7vVrOqGpNC7ssQXLDYf5s46Y3ktlZWDvSwS72M+2oVDgQQqWgm5VxNQgQ/+TxdxuKrJdomzNwMi
X-Gm-Message-State: AOJu0Yzeg23rLBLbf4M4AgNf5LPmDzGaTGb6TCx7W0S4Uip/k2XLJmYB
 D4LhfT/Wapd21ydMXziK94PtJLuVVFqmY8k001CUf6uGSO5fhiDWJWooe/RdWg==
X-Google-Smtp-Source: AGHT+IHnKMx/amFBiavBsFKrgADkUZUSzat6ZPtDirfE8fDJucf2GWJKt1cP+KaATFveOkt12/R3ow==
X-Received: by 2002:a17:902:daca:b0:1f4:adcb:37c9 with SMTP id
 d9443c01a7336-1f4eac8863emr3286335ad.25.1716930093006; 
 Tue, 28 May 2024 14:01:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:8d59:feec:9939:40d7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f481d5a77bsm53167725ad.298.2024.05.28.14.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 14:01:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20240527095511.719825-3-treapking@chromium.org>
References: <20240527095511.719825-1-treapking@chromium.org>
 <20240527095511.719825-3-treapking@chromium.org>
Subject: Re: (subset) [PATCH 2/2] drm/panel-edp: Add more panels with
 conservative timings
Message-Id: <171693009035.3691502.2472086074502512286.b4-ty@chromium.org>
Date: Tue, 28 May 2024 14:01:30 -0700
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


On Mon, 27 May 2024 17:54:50 +0800, Pin-yen Lin wrote:
> Same as commit 7c8690d8fc80 ("drm/panel-edp: Add some panels with
> conservative timings"), the 3 panels added in this patch are used by
> Mediatek MT8173 Chromebooks and they used to work with the downstream
> v4.19 kernel without any specified delay.
> 
> These panel IDs were found from in-field reports, but their datahseets
> are not available. For BOE 0x0623 and SHP 0x153a, their product names
> are retrieved from the EDIDs. The EDID of AUO 0x1999 does not contain
> such information, so list as "Unknown" in this patch.
> 
> [...]

Applied, thanks!

[2/2] drm/panel-edp: Add more panels with conservative timings
      commit: 336dca397dcefc5d7436be1fee3c814ed6512996

Best regards,
-- 
Douglas Anderson <dianders@chromium.org>

