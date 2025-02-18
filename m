Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0FA3A41F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87D310E736;
	Tue, 18 Feb 2025 17:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sqB7zQoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B43210E0E3;
 Tue, 18 Feb 2025 17:24:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8390AA4101A;
 Tue, 18 Feb 2025 17:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CF3C4CEE2;
 Tue, 18 Feb 2025 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739899488;
 bh=bHsM4J5OAf6pPIdlfG1dNWd+eY8oc64mzKvu/j3YixM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqB7zQoXDT5cIFnVoS5QVfIvMFsgI6DfB/RxCesu+Q4O9URPvg1St0v3KVv7BVuLI
 oQwPTGQwGtWDpaWchA3XcueOhzcCZuyqH8tQBjb7Z8kwPCIINGXdWrhDibHPeQdBkl
 6KL/Mti2VeUVbS+/WaYoYN/LBnuqq79he88E7X5XeE/rJk7Iq9A7o28qtw1JU5Xgeh
 zHyh/QbXy3mTRmSpE9lUl7duK/n3BsqWnJkyneVjVxvk3tz24uH7a/aSstS1MYVXiR
 Z+imndakYvZvxo1/KzgpP4Xkj79OP3NFkpLDwtWowV3qZkqvWlit1UE5bJcuk97sYK
 gd0Oe7lD+O/Zw==
Date: Tue, 18 Feb 2025 18:24:43 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Russ Weight <russ.weight@linux.dev>
Subject: Re: [PATCH] drm/nouveau: select FW caching
Message-ID: <Z7TCWzTVQeEDt0j8@cassiopeiae>
References: <20250207012531.621369-1-airlied@gmail.com>
 <Z68_m1iHYN_7a_hH@cassiopeiae> <Z69Awxng8zedDwws@cassiopeiae>
 <Z7SZJXP4APNLNqh2@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7SZJXP4APNLNqh2@bombadil.infradead.org>
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

On Tue, Feb 18, 2025 at 06:28:53AM -0800, Luis Chamberlain wrote:
> 
> What I recommend is to look into why we disable it by default, I think

I think FW_CACHE is enabled by default, no?

> its sold old obscure reasoning but now suspect it was udev being dumb,
> in line with why we also try to defensively try to ignore duplicate
> udev requests for module requests causing a flood. Refer to commit
> 9b9879fc03275ff ("modules: catch concurrent module loads, treat them as
> idempotent") for details.

Thanks, that helps a lot.

Given that this commit landed in v6.5 I guess there's not really a concern to
force enable FW_CACHE for Nouveau as a fix for commit 176fdcbddfd2
("drm/nouveau/gsp/r535: add support for booting GSP-RM"), which landed in v6.7.
