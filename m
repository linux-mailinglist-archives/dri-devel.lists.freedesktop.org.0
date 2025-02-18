Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D3A39F82
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7D010E6CD;
	Tue, 18 Feb 2025 14:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ORdfrG6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A3610E6CD;
 Tue, 18 Feb 2025 14:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A81B4A4041B;
 Tue, 18 Feb 2025 14:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6A9C4CEE2;
 Tue, 18 Feb 2025 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739888935;
 bh=Gaj2K2oXPQ30fPM5OZvJYqUJGD/ML/xFIkDPN2w2ITw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ORdfrG6PCdoWvHYxddkuZKaOcnAUhKRiTwbNP6ExA1Qwtb/NPXFx1oVu7d0iRRCP5
 dWESj9HOWQeSkwcV1jnVj8w8oNa4wp2SE7CNO1pg171YpjR98KAzAgxW46AzG+Fa1g
 gMaKlyS4VcXKZPH+vXFPab8wxYNrpyTd4Bp900uG1rro7ezI3kkK5mWOqvxy/gRFNA
 Ha/u+ur9xCEwdPvg6XNayQ51d92GtyFzIyxiMiFK7PaTErEuR49E9JMoLeOGvI7qao
 Of2RcCOhhS3V7ru93Js3lXiIuK88TUyYbdzZiYuuLZEyHMpyU1lfRTgyeM5Vk6mthX
 9MvCGT4mJy3Dw==
Date: Tue, 18 Feb 2025 06:28:53 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Russ Weight <russ.weight@linux.dev>
Subject: Re: [PATCH] drm/nouveau: select FW caching
Message-ID: <Z7SZJXP4APNLNqh2@bombadil.infradead.org>
References: <20250207012531.621369-1-airlied@gmail.com>
 <Z68_m1iHYN_7a_hH@cassiopeiae> <Z69Awxng8zedDwws@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z69Awxng8zedDwws@cassiopeiae>
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

On Fri, Feb 14, 2025 at 02:10:27PM +0100, Danilo Krummrich wrote:
> On Fri, Feb 14, 2025 at 02:05:36PM +0100, Danilo Krummrich wrote:
> > only force FW_CACHE if DRM_NOUVEAU_GSP_DEFAULT?
> 
> Please scratch that, it was a horrible idea.

What I recommend is to look into why we disable it by default, I think
its sold old obscure reasoning but now suspect it was udev being dumb,
in line with why we also try to defensively try to ignore duplicate
udev requests for module requests causing a flood. Refer to commit
9b9879fc03275ff ("modules: catch concurrent module loads, treat them as
idempotent") for details.

  Luis
