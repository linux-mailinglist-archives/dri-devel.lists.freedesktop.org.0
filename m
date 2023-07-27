Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EEC765731
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71F210E5B3;
	Thu, 27 Jul 2023 15:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D3210E5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:18:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-52256241c66so2231436a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690471084; x=1691075884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ij0zwrJl+jKzGXRJqhSfCNc7P1MNBHLMCT9rtsyaalg=;
 b=g+4wi9dcsNhnW2igpaSlliuWgqX01BqJ7EU4IuOBDLrh4d6W17HTLFIcEk/nGYkno1
 JEEN0UX5LCZsWyHohPUHaX7uCRF0fVGsb1zAFuw+dAqzVlPLyR1UEgWOKrMnoP2ylTAZ
 7IDADaoAVUkpH7Svd80TlhaOVlz7JTNT1fs1g3tNos/sjn6M73pwUw6+DeePnvJYjrB5
 fVr10CodopMcRCStH6nAGRByRII3c6CGL7CgAaUchE5VCy60xV96YWU8C+tVFz7WYkM+
 HI1JgQB98K5FSei69Be78CoVyH/Pkdf5ZRVKkLo+604FJR1tuxqB/x3N38tbyS9rCmQj
 drpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690471084; x=1691075884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ij0zwrJl+jKzGXRJqhSfCNc7P1MNBHLMCT9rtsyaalg=;
 b=SZyRFQPG9ICxLjssK6Kea34qN8+os4SGS8qaRO/2ejt101yee2FVfxMf2+x1/33c6w
 nz3jjwSL6t/QCAPdBEqBVijnquZCp0cyBQr/1OpTN9axAwMVjY+P3uSOpEK4as3pYUBb
 o/RIAzCcxYO7nHe2vDG9JZWEz3kC26VE7a/lNmpUy/BG0IFMScZwMZSX+kB7MA7F4i+A
 2P+/kIBGSvDYBEe5fclJ770ClJSaulx9SOQaXBMQY6Q6B+jrrTnhPSxQyEanbJGc/VBm
 /b+ce0LQXnE63+9o4IF6+IX5faY8QCWwR60pAuMlNuqe+10i2HBzWejo6VCUcV1l4Uxn
 duiw==
X-Gm-Message-State: ABy/qLZSxVZvYWANNhZEq8JSsh6RcAyLqVupqoVxdzDuZ0qkDgP9pa8A
 xoe+Jnfi4/aunFWJ9F5BRcc=
X-Google-Smtp-Source: APBJJlHH7kIanpz17+5reDEWBDHfh9P1YfG0wZ0iyBCYXnjNF9ZW59AN0MXEmDS0ww+TZBn6VtqKog==
X-Received: by 2002:a05:6402:348b:b0:51e:2e6f:70fb with SMTP id
 v11-20020a056402348b00b0051e2e6f70fbmr3607953edc.6.1690471083631; 
 Thu, 27 Jul 2023 08:18:03 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a50ee85000000b005227f4530fdsm744337edr.37.2023.07.27.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:18:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa
 CLAA070WP03XG to LVDS
Date: Thu, 27 Jul 2023 17:17:59 +0200
Message-ID: <169047096702.3031511.846316777516525998.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 20:50:08 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
> bindings file.
> 
> 

Applied, thanks!

[3/3] ARM: tegra: Provide specific compatible string for Nexus 7 panel
      commit: c9a706ab227ef59cc49923358513251ca4965563

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
