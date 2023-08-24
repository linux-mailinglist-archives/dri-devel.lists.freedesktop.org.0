Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE2786E9E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84B110E03B;
	Thu, 24 Aug 2023 12:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D2A10E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 12:01:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D3D61C16;
 Thu, 24 Aug 2023 12:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974C3C433C8;
 Thu, 24 Aug 2023 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692878489;
 bh=QTIGKK7F8/lFS50Cqf8mM1HlzLueDyrtaK91NGV0D/U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AuBnRV8UQt+PgmaIShUYDc82r5dMhR03l70cLXuhps8PYDeubSw2tFlvF8b2ehJVr
 /kXYH7PsJzDcxmHUCKf92bNUj5G+8JzlJZRjlXyIJKQutxX8EWF6D0FpBPC47bUR5R
 miUu82WHjmo4yKazuPL82ViiettYz1RiB04EgoHMtAZpAJfS4ZQTfeuabA5WtJRc7/
 s7ls6WUJHtcXQpGKKFZkOJSky2Sr4ZncOvdHCYbeLlHNjoqLvfR3I84Jz9Ktn2gBOO
 dM6P23XW7H1xQYJCn1cs2xBQ5QR/KlA/NI5t3G8Bz5zlg6/Dmx5YuDZoqdJa/phJ9A
 9FI4OHUQmhIUg==
Date: Thu, 24 Aug 2023 13:01:24 +0100
From: Lee Jones <lee@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 15/20] drm/tegra/hub: Increase buffer size to ensure all
 possible values can be stored
Message-ID: <20230824120124.GR1380343@google.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-16-lee@kernel.org> <ZOciEaJlHhp4xnFv@orome>
 <87r0ns4weq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0ns4weq.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Jani Nikula wrote:

> On Thu, 24 Aug 2023, Thierry Reding <thierry.reding@gmail.com> wrote:
> > On Thu, Aug 24, 2023 at 08:37:00AM +0100, Lee Jones wrote:
> >> When converting from int to string, we must allow for up to 10-chars (2147483647).
> >> 
> >> Fixes the following W=1 kernel build warning(s):
> >> 
> >>  drivers/gpu/drm/tegra/hub.c: In function ‘tegra_display_hub_probe’:
> >>  drivers/gpu/drm/tegra/hub.c:1106:47: warning: ‘%u’ directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
> >>  drivers/gpu/drm/tegra/hub.c:1106:42: note: directive argument in the range [0, 4294967294]
> >>  drivers/gpu/drm/tegra/hub.c:1106:17: note: ‘snprintf’ output between 6 and 15 bytes into a destination of size 8
> >
> > I wish there was (perhaps there is?) a better way to annotate that i
> > will always be within a given range. In practice this is always going to
> > be smaller than 10 and even in future hardware I wouldn't expect this to
> > ever exceed anything like 32 or 64, so 8 characters is already generous.
> 
> I assume you could do
> 
> 	snprintf(id, sizeof(id), "wgrp%u", (unsigned char)i);
> 
> but it's perhaps less obvious than just increasing the size of the
> buffer.

I had the very same thought process.

-- 
Lee Jones [李琼斯]
