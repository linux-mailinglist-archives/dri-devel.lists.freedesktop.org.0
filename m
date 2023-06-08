Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DD728528
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81CB10E5E5;
	Thu,  8 Jun 2023 16:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF1610E5E5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:36:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30d181952a2so841302f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686242192; x=1688834192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=586uKuWxkuY7vLLEPLBCsWENCI12nOjQXtB1kKMYKvY=;
 b=BI8eZg8a68BpLbUZNChXHgs8eb+cn9jc4i82mYdV3v0zuR9EvO6AnJfx1ewZ0yG4KZ
 SuAAFzu0/WN9wT4sheZFRLMmgnu9xYiOk6l127l/bonmxuJi6xrUfOEWkvK9Owgni6p+
 vxCqlEftgAflbb4eeUVQpTcsSGmbYknOOqWLfKgI7HgmvafgXnQ7+hC8xzVwnwznK07y
 Vk1Epk6/ziWKdiq0bf1VRXbgqH5mrBkd320eMVGElP9QVy0Ba3tT/fQ+fB8nNBMWxsk6
 TzY08q1tG391FYg8jkA6ZtBNtAfSqjZjx4iGfG2InX03lntJm90wRwL3gIlbKfXhHzEf
 SYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686242192; x=1688834192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=586uKuWxkuY7vLLEPLBCsWENCI12nOjQXtB1kKMYKvY=;
 b=AO8p9IjqFsbSabjGaXSkiBTD/xSQEtCnqoRPNrdAEgNCHCODCFXecVb6KhyQR3eOqF
 +TYXZyOsHimWFNcEtlEmAGX5xDL2mKVpB1MNtatJPL3txx22DzKPh0pEzLS//I4WfoFI
 pApeYx+69Q2HGsoobKlnh5tI9t/Z2qB40awsHIPdzM1emozWudz8e8UCFQJAhBgP2iWH
 g4L4H4qGtTZwdKVEb+SuSUqxOgSHwUm1y+5qBlEormDj2/6qT8uT2D472qw8Kf9ykk3e
 PNanVtVorFu41ooOz/UOtkYcVG7FDLlQajgCf3wfWHwVBmLPY++jfXZjn+CNenP6ocaS
 rNIw==
X-Gm-Message-State: AC+VfDw60303/iwqds2h1xHE2mwAbT8+rdN9KjqlHrNq4ac7X3OMuxad
 LIhY+l6m2uzKInHJ4RFXOQw=
X-Google-Smtp-Source: ACHHUZ6+Z4GlREG3lpPQfofxPuSmJcAa6Sk9k+FXR3sw8OEeJi+SUVrGRz7th5RklM32wZ8eg05XRQ==
X-Received: by 2002:adf:fd8d:0:b0:30e:4943:ac0d with SMTP id
 d13-20020adffd8d000000b0030e4943ac0dmr7500621wrr.59.1686242191814; 
 Thu, 08 Jun 2023 09:36:31 -0700 (PDT)
Received: from localhost
 (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b002ff2c39d072sm2017445wrx.104.2023.06.08.09.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 09:36:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonathanh@nvidia.com, arnd@arndb.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH v2 0/2] Enable GPU on Smaug
Date: Thu,  8 Jun 2023 18:36:29 +0200
Message-Id: <168624214852.1815116.3764090651874544874.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Tue, 16 May 2023 09:28:27 +0100, Diogo Ivo wrote:
> This patch series enables the use of the GM20B GPU in the
> Google Pixel C.
> 
> Patch 1 adds the needed regulator DT node for the GPU.
> 
> Patch 2 enables the GPU in the DT.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: tegra: smaug: add GPU power rail regulator
      (no commit info)
[2/2] arm64: dts: tegra: smaug: add GPU node
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
