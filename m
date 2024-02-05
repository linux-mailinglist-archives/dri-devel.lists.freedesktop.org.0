Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEC8498A4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 12:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028621124CF;
	Mon,  5 Feb 2024 11:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DsoDCcuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87B1124D4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 11:19:15 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5112a04c7acso6845952e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707131953; x=1707736753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWrtUvWSlugsoEEt7fKRu1nsL3urHay24xs1A+5SB/A=;
 b=DsoDCcuTcvrIi0ZIAXyc0rqrqWxHXTK44TroIXh72uugMTs9eTBViNHcB/vbar0nZp
 3129cyroAu20wYfZXrM/sZkI9iMYaSk7O8yJCaqrQU8iPElM9aRpc9xN9gQ+oBV+7yM/
 DsfGEAcD6BWuyGqd0rEAs9mAL5bhX8a1eFFlT8gwyIpMkLRYyokQ4H9ey8WPzFPIFKnb
 KFaRU+4y232oxULQ6XoJCz1jFLR+oXBvtY2Ax0UbppmcXRldMruANWbP5Sz9naGt2yj2
 YVpXDlCjjJF0Aemn7WgP8AY8n4HctqSqgssKskXcMsZJclDiEOZ0QlcWW21SaXjaIS78
 91Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707131953; x=1707736753;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWrtUvWSlugsoEEt7fKRu1nsL3urHay24xs1A+5SB/A=;
 b=h2KIUqkCm1DPatsrAp6ATemggtILnBdrbeo654zn3R+IPOfvLHKQ4XS2ugJIbJhcME
 /BjvH/eBUo0bGvRyE6XTyVjWwBQpve/5bWFcru1EsFv1p7VhFeN6jItdMgV+vjCpEhkO
 0fRk3oPVqxgmvLSay3z8EyaxZUhPcf74dVWj8M4ww0kjhIqo9uWsQ0ypuLlomGoNOHLn
 xxDDGXHLi8Sng+Z24z7MrHW2ZvRPEz26rgPGssGK4eqxovs44HNmXSJA8c4aN3MFYpqE
 5f96SQQAySD+iTr+LM1mSmOGDGtv27akNY1EPdp00rDDQqJS7UuGibStfxwEqmpAr6qf
 lEMg==
X-Gm-Message-State: AOJu0Yw4g0wPsvJIhcU76TEGzMnUPNrOTP1Xff2KV7oHYIUBtlKKhqJY
 XxPl4kqYolrEgOv8eDvYiZGQ2pcZWx+SbsIhVpupxOBcW8f1SlpGN5LD0AFO/Lg=
X-Google-Smtp-Source: AGHT+IFzoCBC7kOvJb/mA4P4aZ5p0ddHh0/TlGGBDTtCoNFLdQMCzEB3AU9o7+iQtSFc1Nkg3MXakg==
X-Received: by 2002:a05:6512:2805:b0:511:5482:398b with SMTP id
 cf5-20020a056512280500b005115482398bmr789853lfb.15.1707131953432; 
 Mon, 05 Feb 2024 03:19:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWsZc7N4uU5lXjNhfpD0pOUfSS4rEtAlUgSBgg3zJgJnXyc8Gjfy+nJ+crVArYn75GqDI5nHUvIY1kDIoAP49aXAmES5XcadzZdz3C0QmDxhPkZKzu5dPo2NHqLywTYZ5ByppsaLtzjwHih7DQhZjXpsSS3NBSjzPeCwdWpolBhJIjw1WpLzsKU2vQdKghpJaeX3R+Y7FU97enUyk77WJo2sYn0+ifW1SyMwkB7KqoGfSpG2XQFhvMF/OcewMqAJfScwqgKz1jPgdETPa7KGbQonbMPJIBV/wMKBb4PXMHPrIrG9hggpTGlTcQka6mlY+C7Eo9vwJrq6RsL8+ayycQehf3wFAky7HK2WffBCwFre4l+EeSmuIqxtBBdFLEjC0g3TL4uiqKyhtuFhy4f11HxdVWwJHDA6/gBD//Mi0IEiQx40Jn1k/gaXlyRoKx4m2qv2aahzmalRklM3/QOr7BiQkqUpRxTUcsIRjgKkTBI7+NJNzQF57I7dKJw+4DhTXiHELVYqKT4zyiNDISLFG0lkfvpMHlV54KaMDKBopoC9qm9aERXSNLLCSwkCsMcO+Qs4lKXQm0hX317NEu3tYSvVehCAnj6/tpCULNrI7VUDyg0ZcIsBgj+3mnyfPP69H1gDawlqDdTg08sThNf0aNRt4DzTIov7vjk6ShTKEn/ydZ9fj7YkmpHu6elDzKwpjxwbNt28FMg9afC3aAk9eY/W4b28HjiNF9Nzwsn01ZG0LZ3hjwXSpT/dnpiRrWX+ZiItVhRzLTZI4eaq1yalb0/2V9jaRNmA3E8cSHUFmnTDxbfavHOkdihcs+0WDCpNZtAyaWIYB7zmEvV4tyBIycTJFLnTaPDfZ5fBzA/+HSNzYz4hL2W/zq/U5EgUw26kYJ2Z9P7GD0XLMS3zgqM2tcyvnQj8Qs1WJV+wvJtCSiXko8l0IwOvQgHqnfnQd4l5AtzPb
 16n8XaO8tc3cD/j+CCJffu+x0SUhUsX4c6g0H9WhXS2VWY+5Xy65fhL312R9Sz7xkXC6XxlHRO8t6JI615jb97Z0G0RynsPeyb7sWpqcpu4pID3YHaZmZjAo9t2SLwXbUMBfSqeaSOe1Ux8Jw/ZNeKwMCQ24IKIZOypVZ3b/h81HEUc1XjPO47bhAgCw==
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a05600c481800b0040efb503d58sm8177158wmo.28.2024.02.05.03.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 03:19:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, 
 frieder.schrempf@kontron.de, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
Subject: Re: (subset) [PATCH V8 00/12] soc: imx8mp: Add support for HDMI
Message-Id: <170713195198.1366121.9704774035651608603.b4-ty@linaro.org>
Date: Mon, 05 Feb 2024 12:19:11 +0100
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

On Sat, 03 Feb 2024 10:52:40 -0600, Adam Ford wrote:
> The i.MX8M Plus has an HDMI controller, but it depends on two
> other systems, the Parallel Video Interface (PVI) and the
> HDMI PHY from Samsung. The LCDIF controller generates the display
> and routes it to the PVI which converts passes the parallel video
> to the HDMI bridge.  The HDMI system has a corresponding power
> domain controller whose driver was partially written, but the
> device tree for it was never applied, so some changes to the
> power domain should be harmless because they've not really been
> used yet.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[07/12] dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f490d0cb9360466f6df0def3eccc47fabba9775b
[08/12] drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=059c53e877ca6e723e10490c27c1487a63e66efe

-- 
Neil

