Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2371A6D805D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD0810E9B4;
	Wed,  5 Apr 2023 15:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755610E9B4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:05:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m2so36534617wrh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680707099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJ/TIkMhk2bPX1HK0lvdvOcV5MO27OCyBCUDQZH39zI=;
 b=lFm0/BjykT3G1eDy8yG3/f/+9hGtVDN4Ior/kfWUUde8UGG5JzHhgamuK6EFwY2lc+
 wLuYU/tJnhfhNKZT0niU/VoR/UWzGDgkiHGBS2G9qwlqSPvyNzy2+a7hN3pGshfblGSN
 XTlX8rewe3AvIk7sUIGnGYUDNED0dzQVHuJ46eALpdbdFZtOaiRxE7LOPSok+zs+SwUT
 A/+i7Lq9wYLZwujAWUDsE8zAFgiXNFVmRFS15VROcrUQ6QXk9e7SWu62aUfFaIuwF99c
 v9LZC2fu5b53cYqqFh/NMV3pT1jSq+pN/c3GeuDYCK7aIcnC2uZ7j/VyIuqC31fvRLY9
 zaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJ/TIkMhk2bPX1HK0lvdvOcV5MO27OCyBCUDQZH39zI=;
 b=vQEY9BW8JuBfT8qhz5Tbs+LJLXzsawjTezmGLuofVxNVljPNwyaLGxNBZ8uJ/wqcda
 yyNDf0rgahQKre6CUUTuVDEXSqEETKCOFu/wBswPfwO8PrjqBgKd5QfY5TCeaGT7fmzH
 BIjLklNrp3xzq+pNIrg/6TQaXP6a/aLJP0C/aOQyPyVCGZGR682KWbpRLVKN6kAZQ0rR
 UsIlz66gC0zfwcsJi56+AOynjCXYhHjAECLNTo0jwgfZSmFU+F+4zIjr8/cRCkMq/X1G
 f6Rmt3o5KlfkZiPg0lntdJFxCFSIBDTEAnZAFmpbZ+gsvxHJ3l7QuTCEich2UQNe25b1
 3TtA==
X-Gm-Message-State: AAQBX9eu/eZyGqCqq59OTmvR6ER9Kk3j8KLPfeV12uZrGZmBCi13rXEj
 eNtwFyOnIKnj3VkrTKwK3fI=
X-Google-Smtp-Source: AKy350Zo6+JFFWEOk1JLcS1QaNH29U9mO7wq3L+rrdvlL2uVVg3IQgJKzxWpEkaxN9bsHkxZp+1N8g==
X-Received: by 2002:adf:f8ca:0:b0:2cf:ed87:37c9 with SMTP id
 f10-20020adff8ca000000b002cfed8737c9mr2045804wrq.11.1680707099119; 
 Wed, 05 Apr 2023 08:04:59 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b002e6423cb207sm14146577wrv.112.2023.04.05.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:04:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: daniel@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>,
 jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com,
 thierry.reding@gmail.com
Subject: Re: [PATCH 0/7] drm/tegra: Convert fbdev to DRM client
Date: Wed,  5 Apr 2023 17:04:58 +0200
Message-Id: <168070704247.1047612.15878020832415463467.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Thu, 30 Mar 2023 10:36:00 +0200, Thomas Zimmermann wrote:
> Convert tegra's fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in tegra is now just
> another DRM client that runs after the DRM device has been registered.
> 
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
> 
> [...]

Applied, thanks!

[1/7] drm/tegra: Include <linux/of.h>
      commit: 162b2ae95e0887ea75883bc419d55dd714b8fbf5
[2/7] drm/tegra: Include <linux/i2c.h>
      commit: 0e4ec6d97a2c6e96a5ec8d0edc00aa658238ed3f
[3/7] drm/tegra: Removed fb from struct tegra_fbdev
      commit: 5705d5b6a21e75c095df29deec8a13aa6b59f83c
[4/7] drm/tegra: Remove struct tegra_fbdev
      commit: fc5646b848222601d8be78b66b6498130437abe1
[5/7] drm/tegra: Hide fbdev support behind config option
      commit: 63ab4848d1d2eda1658ae82a3cb6eb7e03d28cec
[6/7] drm/tegra: Initialize fbdev DRM client
      commit: d9d1e306e70db905f29d05952c1499fd3c6ef6ef
[7/7] drm/tegra: Implement fbdev emulation as in-kernel client
      commit: 8e5113c627334ed32748d95ababd548171d2333d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
