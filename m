Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9387B9AD540
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 21:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DA310E1AE;
	Wed, 23 Oct 2024 19:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gA2paiJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4543810E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729713361;
 bh=2eGHmJWpTtKq2UCn19+DLfNCWbbeEMvh4tEJO3QfZAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gA2paiJC92mudSnR8YyTFNbcubgzip/VTq5MZfltH90ocje1KVVd4HME7Gttk1UXh
 N5s16qKAPZ9RHODI6CIaLeAb6E4p39arDDQDiT0bJdmxj+Jyej9lVp7pkikAli5BlQ
 OTUoCivLOmkKHc5MhJ7t0Zid4KeFP3QAvJ7CESHate0iHwdW/QCDkg20+V2B+897Tp
 VtqsTwBcer2k+qyrGl5UH4zAm3Z95QAMII86lxVWfuKtF8lbZzqJevUS4YB/HKspuC
 jwBFnSVjFdf5aD/yUO8DiYrsWyM84v8HEhSZoB3KFBTI8a0NR0zntmITfRMh5UEmBE
 9x/5laTCVAmlA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 26AFC17E3703;
 Wed, 23 Oct 2024 21:55:58 +0200 (CEST)
Date: Wed, 23 Oct 2024 15:55:56 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] drm: display: Set fwnode for aux bus devices
Message-ID: <7a8dede1-ef29-4553-9412-de8e2f45b860@notapiano>
References: <20241023191339.1491282-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023191339.1491282-1-saravanak@google.com>
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

On Wed, Oct 23, 2024 at 12:13:36PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
> 
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 1-0008
> 
> Reported-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
> Tested-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/

Hi Saravana,

the issue faced by Jon needs the exact same change but in a different place,
drivers/phy/tegra/xusb.c, which I posted at:
https://lore.kernel.org/all/f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano/

So we need two separate patches, one for each issue. Feel free to add that to
this series. (I could send it myself, but I think it makes more sense to keep
them together)

Thanks,
Nícolas
