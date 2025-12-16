Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884ECC1F3B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA26C10E7C9;
	Tue, 16 Dec 2025 10:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rz64HFcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FBB10E7C9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:23:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so2026190f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765880593; x=1766485393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpXPiR/cT9JwYvaX/P3J5/iulyPU1wfTgyjQstS2rS0=;
 b=rz64HFcfgC0y1xgKrSciRtAzPo2vdKi0IAaHCNsJNVNepO5kVTBxlROlhQGO0IcjBT
 OmJNFrEcXcmxhrUE4m4ToWbSY2HEZPlReh272WttBP4uIGqGu6+BCqxmx43tERE8zBrs
 vdBZ29ZsQZFQXknwq1p9wtCwViWsPJuKpLv44E9YwEdlafGJZ6QjgT6sHUf5ww6XL1LY
 Lfr7c//p8qpiG5/YOoXqgwzSVm9qfYO+EAOSvLNUhqYnYUPk+LaDoJNwjZ9fyMaomGRp
 s6erbZkBm7qza5gL0yml/oYyW3lercSf7TXG7NxiXGMUDtlmqVHWgT5OYEW9NQOmBtbF
 yJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765880593; x=1766485393;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EpXPiR/cT9JwYvaX/P3J5/iulyPU1wfTgyjQstS2rS0=;
 b=fSULbfT0L6vpIrQtny8u5gbGPrdf8E01Oal+EcNP9j1WJuSFKZXSACbF9CQ1b7Uz66
 N8cl9ODkVE5xpKN8h5i/EPr5CNtNB/BVsTIvHfl/WRIudCZ8z/wnVQZsO18dI3SBAELq
 Dwgnbrxr8bgbEn8i2D8HCVn6G+glcq+r/bpwLO/J+vkQ98CVJ3IrlP2Q/iTxjEAMywZ5
 60PDJ3IoRZVjXZ5RFZejcFviQcLDTQ43VZkm4REXoyS1K+PyJzYDMk4o0AGH2WpEeRxl
 JyTrAF5u1aOnwMsq4C0WXmL6x/bOAgArjYjuAJLsUjrdbKgsomo3mtRfE+Pxkr4Jp1CK
 zE7Q==
X-Gm-Message-State: AOJu0YyCwFYpBJsE1g3tUD+BmuUioMpXWpho74vQ8qSrS0tRZEDWJvKL
 vMVK1TEIZdmEp5kgmSDKXzoAqfKrrxWkLR122R3bfGYeCxqgdAUJPxLQul5jYy0MQGQ=
X-Gm-Gg: AY/fxX5XFAZ8dEB3mDKKj0jfSwrxXjy9/vhobzUvS8U1JQpxHgnMRj60H9lePXiqBBA
 dRY9qxw5Ji6UGSKnnXpaGBPHPEWBLUZLj20bbfGyQy1pcDIxxTQhHGNfCZTUVtdZikhSkEnua+v
 JvdvQwyCKiUmieXwPm3VOs4tnD+AgbcWcufc0z7xLVVpBkH1U27Eo8/AtYlpfPbRT4s8AyR16an
 /NJa4aAE1IYBiPNeN/IWB53Xck5hGP8ZOtcrUBTX9LdkyJpZkK54ZR7pLnrI+9/nqXNvCCGJ7g+
 WODO025x69nDVtGQVDQRnw6JJFEYWjvuwZj6zSQoPyRqjtUYW4J/V3n35mfmR46jtYKh9BEx8cl
 2PAVh0l95Oa/6gVZ90iz1Cc6LfpeW8zPTCIbXydOagIIdIhlIINaxYE6iUcuif/xFbraT+DqO4q
 OemajTrR9GXQg9x+PGVmBxaPHgUkXV2Co=
X-Google-Smtp-Source: AGHT+IFNtxCCzId5N6zSSfwtr6e8kqsKdHKvcRUCjL09+ZvBCJ+phjYnW39+B/ZC6bXSVKwhvaSNzg==
X-Received: by 2002:a05:6000:1acc:b0:430:f704:4f3 with SMTP id
 ffacd0b85a97d-430f704073bmr9260630f8f.62.1765880592450; 
 Tue, 16 Dec 2025 02:23:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 02:23:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jessica.zhang@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org, 
 Renjun Wang <renjunw0@foxmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
References: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
Subject: Re: [PATCH RESEND 0/2] Add HannStar HSD156JUW2 panel support
Message-Id: <176588059148.2230787.4539469304596880105.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:11 +0100
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

On Mon, 01 Dec 2025 22:19:17 +0800, Renjun Wang wrote:
> The HannStar HSD156JUW2 panel is a 15.6" FHD (1920x1080) LCD-TFT LVDS
> panel. Add a binding and a panel entry under panel-simple.c.
> 
> Renjun Wang (2):
>   dt-bindings: display: simple: Add HannStar HSD156JUW2
>   drm/panel: simple: Add HannStar HSD156JUW2
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add HannStar HSD156JUW2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b23cd64bda037ad83e18960c8802f3276b7b368e
[2/2] drm/panel: simple: Add HannStar HSD156JUW2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/af586cc6df0bd56d4a3d05d5e6db0b193233fc51

-- 
Neil

