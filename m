Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E66B3BF02
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4756010EBFD;
	Fri, 29 Aug 2025 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="l/GLpg9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF4710EBFD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:16:27 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7f722cb35fdso212801685a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756480586; x=1757085386;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lOUf78kJC5CeFRX+36nx9b9SoyYDtPWwiSrTZqImx4M=;
 b=l/GLpg9JS9R6Q2O+sxGYo//G4Ur3Zlf7+Zq1KFfV2hU4Se8oRGPyLzti3sohqgJeZd
 bumu/LJhnOXykvSYRFxlXNQBAfHB/H7nS5HyTfK5gu6ODshAqdOui8nhGmFyoqT3fhgL
 TD6k0WgBWHFRs7smjOkJMmitmMs9FPHV91PWk2bmcZqJyrEAd5KxYSp7fAx5XXvfPuIH
 EgQzei53qvSsLKZxEjnfs7kj39ms4PuI7RC2Ygqog4ZNgGSAMxcUYxg+/xU/jSc7rQSn
 kyplmkksNuB6bB913Q06DIwjrIh+Ti3uRvAiI6kLojVaTNC+o7QGdMXiySTkWJkwMQ+B
 hkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756480586; x=1757085386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOUf78kJC5CeFRX+36nx9b9SoyYDtPWwiSrTZqImx4M=;
 b=JFL/R1LIu1B9yvezQ15eyvAu0hAyITiPv0f9Cx9hlYhETpEcU/skfnNqzaIh33pK8E
 SZwfZBTGC/QByjjBTLAuQOgi4bR0hpI4SRlQUfkmnviwauHOXv/Jq56qFz7GomGrZ/sN
 Kwc2kdQLttf9YBW98ZYnZxelCfTUJpxmguUtHB/vAztWOwYX6DO2wmKgPHrhfxsHdEPP
 F5vBGaq2lImrtIFFjASv9Tw1e8NoQkdQFrAJvcrqCS9l0UKKNfBoXqujOAATaFkhx7Ri
 kr9u6qdErbaoJ7akwcLdxWGgRDXpPCPNyCqGsxD5S64Sg6F0P6vqTo5gU5kWg05TyIak
 v/ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnKCGQcEA+iWwXAyS3ITa/l9DXJX1Sau/8Y/FhDiKh3PRsipm4WLabMVb+XX3M7BnraESTrKOZsfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywih1MF1eIzb95dBYvW+VAzLCn2+3WBiBzEKr/w3ndSd6kfA3Md
 /dyTTXZh34XyuNYNc5tqWklMQVZH3yjyMtakCH5mtClG2nqHEqTJP993+5y2I6bqIVPdbHu3Gew
 3rJwE9zKa4ZU61fPjguC8ZuspQuFw5NeF1zn2lTU/pA==
X-Gm-Gg: ASbGnct1WxZ0bhDZAldBqzykwum8Ybs/J5b27jgI//PoaNsMrNDAUq41f5x6sYAx8GA
 K9Ppv1BSuwavu41gaI/sBNE+6YUC7FP/70R8XeU97QZ714yiGqs+0PgXtMGAeL+vV0Aag91SgnW
 CdiaHCrJOtHc8P8OMx2mMr4ShFHucXDGleYPYsjRILqYdehHcPNZkuZJTBxCMEncD+46g4+Hf/x
 WrK2A==
X-Google-Smtp-Source: AGHT+IGnzlI20hD81QuCUxmiLx/CLn49uqNE3sl8frDh4fjPDY8YZMBAvQbF0rOj2AAQybUTZBlLQymUJBEgeOnVx3g=
X-Received: by 2002:a05:620a:4053:b0:7f4:5aba:d966 with SMTP id
 af79cd13be357-7f45abadb98mr1590732385a.60.1756480586040; Fri, 29 Aug 2025
 08:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
 <20250825-rk3588-hdmi-cec-v3-1-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-1-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:16:14 +0200
X-Gm-Features: Ac12FXzpMvL7DIJopMIso2mzGRacTGimE8ocHlW5RhJ-2PuaDc4LbG8M9GuvEHk
Message-ID: <CAPj87rN7gHj2jyAa20hJXHscauupUcEzYxfgH8-9ykuVcETOpQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/bridge: dw-hdmi-qp: Add CEC support
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
 Derek Foreman <derek.foreman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Cristian,

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:

> +static int dw_hdmi_qp_cec_init(struct drm_bridge *bridge,
> +                              struct drm_connector *connector)
> +{
> +       struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
> +       struct dw_hdmi_qp_cec *cec = hdmi->cec;
> +       int ret;
> +
> +       if (cec->irq < 0) {
> +               dev_err(hdmi->dev, "Invalid cec irq: %d\n", cec->irq);
> +               return -EINVAL;
> +       }

There is a bisect break here until patch 4/6 as nothing provides the
CEC IRQ, so the whole connector init will fail.

You should either plumb the IRQ through first, or just make it
optional to retain compatibility.

Cheers,
Daniel
