Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317993C5D7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 17:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E202010E83B;
	Thu, 25 Jul 2024 15:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zo43Ca2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A23010E83B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 15:00:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3687ea0521cso703833f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721919608; x=1722524408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9Z4931Osuxi1qIHEscDRPOvBVDoh/CRmYBymvn/ZBA=;
 b=zo43Ca2uki3RLINIJfkVWmFPj8NJX89+GT/fWWbONpR3Q87H5cpAmXvOFMSuZISthJ
 PigvWwBnxwmScL8Sf15wKH9vMUqE3Dc6iPU2fXGpZU/8Wovf2KWo5WXRClExeb5aAO6v
 4L0GemC7RMLgpNRGLglY7QiGnQC0AI5u5eNqYSHF3RPSt18Hw4diilpfouxneHypjnId
 BJx/yn1ztFFKUqVX8hM3C/qvYlLFP2hpd7ilJ/oTmZ7RZoOc6fMML58BbPc258HGFjen
 7UMY/BmHTNQE7sJ6hU6oj9oa10XVTovra5UPCueX/GdEcqrSb14quGQYFOoQ57yvh87R
 PyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721919608; x=1722524408;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9Z4931Osuxi1qIHEscDRPOvBVDoh/CRmYBymvn/ZBA=;
 b=ibIUK4B1dFwUeDDBifhXt0VPou3sJtPH32kw7yF66u8qH5MLGvc3dCeEDo784kNmHP
 rVPQa7PJD1SIMUAjoGZz5i7pFLFcXbavlDG8INOfgJxOcnoLtstT8K+y82qokKRQMO2p
 viIP9WkPUDqjmRBlY4r1dZEmops5Ndpg6hFimwIyg41tJoqo6RiJE2WDV0IjAYb92Ji7
 HrBV/12D6t4YJX5tERB5qIsDZhevFRzbaPKMzXH1W66HoI3XPbQ9JGIXqUWT9EAmTVWU
 o51tys4mFr1sC38C6DBVHDZaLG4UsB170ngGkT3uuKRUJjgQgC/QS8v39KxezX3o742J
 bptw==
X-Gm-Message-State: AOJu0YxU30smvbIglHC5BVC0cnsVan0k/y4F5z8Wako6KQE7C3E8jvGQ
 /tHLgGKzD8E/nE5L8zK7dwrUqG4bXidc5q2CJH+38trj9vA9ac2hZwy1ecHD/77M5JpLdDALk6X
 m
X-Google-Smtp-Source: AGHT+IHRCPqWVQXC2M7YIeZJcXzY2G3V2diN5IaoIFfqBHPCQ6aIbCtS+NN5DGnwuwi/xs+tmtNdgQ==
X-Received: by 2002:a05:6000:b87:b0:368:7943:8b1f with SMTP id
 ffacd0b85a97d-36b3643c8cemr1971438f8f.43.1721919608012; 
 Thu, 25 Jul 2024 08:00:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36858148sm2507984f8f.72.2024.07.25.08.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 08:00:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, mwalle@kernel.org, dianders@chromium.org, 
 linus.walleij@linaro.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: (subset) [PATCH v1 0/4] Break some CMDS into helper functions
Message-Id: <172191960720.1560006.12723976790415124452.b4-ty@linaro.org>
Date: Thu, 25 Jul 2024 17:00:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
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

On Wed, 10 Jul 2024 16:47:11 +0800, Cong Yang wrote:
> This series main purpose is to break some common CMDS into helper
> functions (select page and reload CMDS), refer to the discussion
> between Linus and Doug [1]. It is expected that there will be no
> impact on the functionality, but I don’t have an actual board to
> verify it.
> 
> [1] https://lore.kernel.org/dri-devel/CAD=FV=VssfZBxwh6i4e_mHhT8vZ_CnXCrUhoeTUeo5xN-FmASg@mail.gmail.com/
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: boe-tv101wum-nl6: Break some CMDS into helper functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/93183c9959d456530ae502865586522acf21adf7
[2/4] drm/panel: nt35521: Break some CMDS into helper functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c8d2d5da3e29f73fec6e04a424e789422f697db
[3/4] drm/panel: nt36672e: Break some CMDS into helper functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d969b31afa439f71f810076a5612596dae38fd86

-- 
Neil

