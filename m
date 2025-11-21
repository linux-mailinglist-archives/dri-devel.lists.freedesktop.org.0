Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1F6C7A564
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263A110E0B0;
	Fri, 21 Nov 2025 14:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bUEc4aZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A426910E0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:57:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42b3720e58eso1690325f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763737072; x=1764341872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtUE9VgWDT0up5b20u2z4HmowMp+K68a0eApx09UJwo=;
 b=bUEc4aZ1XIAN6GoWlPn0zW8sVdX5l5gl/eO3yJH0ptYa5ZmM6VhuKW+6Rjsi8jFXuF
 H4xQQfiITpTGvS5hdb4B8FrCGsICAzszjUkgGFiqT0SYBZTNr3LqL/Wva2pqfgyJtzGf
 qpfd4S/BebSl3MLVTmLAwjbR+bZ1FAKiza36Thsmm3TnEVwHaBuMJ47/di9Yz7yroPSD
 LigrWjxzEbgbdBVK9EK526qN2IzD95gfTrCoZ1CxKEgx6Mn4pz1zd/qqrbST+BJO00u2
 j3B76hxNsvo7IV7WjOuIlBg7WJjnhOOJT+U1tJw5O395yXOZlXWdxpzsjq9dhHW4ky1e
 QgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763737072; x=1764341872;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AtUE9VgWDT0up5b20u2z4HmowMp+K68a0eApx09UJwo=;
 b=RKbf5im3hi50evU6KDgZk1I9UWt/MINjnZmEXDJxRYkVumJosPSaeNGkN1WnUXGoJj
 FGg+C3nf5cKmr+9dUDiJLESsJfCvhen0e/i6ISDtJTktdehrhel0dsHTvthzfN4cmTOm
 d32O2TbYkZ0HqseA/bpeknfQn3CyN3pb7XNo5ZfLe2EDnlTLF5esq9Km/Vz4AMdbROY+
 lBWQ9Fm3bIsx4hMkH5DvkGd//irqRtOkDR0Y5+LEZtddMd3j8cAgkL7hcR62fue7/WXp
 KWlFZGRhRz7Cgdj1Q568flb033Yg7CxI80BYBYItfB5L/2sZLdX5o8SKdVcXLYMnQGn+
 iL+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYwtgOQ80QYbises+cpOn4YRTLSRySRCyOFFFTrVKpBcZ9mWRQyQbqLFa5E7mS1r7qN/YsPN2GQVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmnIFbHccCY2wbEMpSeVjHmKIzeRjzOAwmRRVdv0kXTtrQFtN3
 oBsnhO3tO+DupzUCUf9AZclLdIIL+h5UnA4/zrkdLGeDCl+5E1FjyvjChbsIczvEBAU=
X-Gm-Gg: ASbGncuvWxP3fecRo54oeu/KEyOXTlZRVrO7jxGDoLnjNPHngFY2r/ap9bCNqCxp49L
 xxRvtOEO/VvBDx5IlMEPODtsoJhdmKqlPFSdUTffPN5l1JYUMa2CTXAAYOTOZbvb3P+EB4O1hgt
 kViM53unw/U1ol9vuuc2bggU0VeKP7qe7AYByw1r4WoF+TTzRDrXwTR4mW8AUzZ49NxeGYPU5Qa
 slzNToXXOzy3LtVKffgVmd/kCi+rg4gmEAlKFn9WBTvYh4ETo0VpF7L8CS3goWy4E4UeFtv3fSx
 bZRKyjds6RYc6qemMxWcS7HDECqW4i0Z8nNsuw0dwU1v5yXBPj/95cKz6ysGJWhKVUC4qmVqrfG
 BIN02erpJ20miCiFcRnCDTiTfsjp2Be3t9VHm+Hg4ES89yeTeu8Kk6RK1COYwgRCneP+5tnRjmZ
 piro5GwiCjNyZP6dKNp7zleTujvumrobg=
X-Google-Smtp-Source: AGHT+IGGsc+G9i/U16taUPkam+Wa9Fw+qY9LD/Z4a3vJZqhgcrN9boVVP9pk9VKrZ9axd0FyosPCIA==
X-Received: by 2002:a5d:64e6:0:b0:42b:3ccc:91ec with SMTP id
 ffacd0b85a97d-42cc1ce482fmr2961149f8f.22.1763737071868; 
 Fri, 21 Nov 2025 06:57:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7ec454csm10875217f8f.0.2025.11.21.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 06:57:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Phong LE <ple@baylibre.com>, Dmitry <dmitry.baryshkov@oss.qualcomm.com>, 
 Nishanth Menon <nm@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Robert Nelson <robertcnelson@gmail.com>, 
 Jason Kridner <jkridner@beagleboard.org>, Andrew Davis <afd@ti.com>, 
 Tomi V <tomi.valkeinen@ideasonboard.com>, Devarsh <devarsht@ti.com>
In-Reply-To: <20251029150636.3118628-1-nm@ti.com>
References: <20251029150636.3118628-1-nm@ti.com>
Subject: Re: [PATCH V6 0/5] drm/bridge: it66121: Add initial it66122
 support
Message-Id: <176373707090.380945.5826140184462252866.b4-ty@linaro.org>
Date: Fri, 21 Nov 2025 15:57:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Wed, 29 Oct 2025 10:06:31 -0500, Nishanth Menon wrote:
> Add initial support for IT66122, which seems to be compatible to it66121
> but probably has additional functionality.
> 
> BeagleY-AI uses this it66122 as the old part is no longer in production
> as far as I understand.
> 
> Now, BeaglePlay uses it66121 at the moment, but at some point, it might
> end up flipping over to the new part. Additionally, it also looks like
> Revision D of BeagleBone Black switched over to it66122 as well.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: display: bridge: it66121: Add compatible string for IT66122
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e902d2c38a2797aa78c1e08fc1419490bb8c63dd
[2/5] drm/bridge: it66121: Drop ftrace like dev_dbg() prints
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1ba36afa667bf14820a9862e18b5d55ee47a67e4
[3/5] drm/bridge: it66121: Sort the compatibles
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a1df28b5f4d30467b8dabe861f1da324e00313fd
[4/5] drm/bridge: it66121: Use vid/pid to detect the type of chip
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a8811c0bb79c60bf2464e939c8e040b5d6f532ef
[5/5] drm/bridge: it66121: Add minimal it66122 support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/715cbb21c6fe2fe5760ea05e873f12473aa5884e

-- 
Neil

