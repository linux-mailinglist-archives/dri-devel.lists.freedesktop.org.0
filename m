Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31502B40448
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C0010E714;
	Tue,  2 Sep 2025 13:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O+YlGHhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74710E714;
 Tue,  2 Sep 2025 13:41:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7922543CD7;
 Tue,  2 Sep 2025 13:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B077C4CEF7;
 Tue,  2 Sep 2025 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756820480;
 bh=CIaTo0E1ULIoJ6xDm4jWtClTGcvSLSjtzXFy6h3bR5E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O+YlGHhBEQjQJljvFKXyGPGLI2pM4wuej4KxPRExUz91y+G6L09AZQEB2ev1cvezu
 4ZXho6qcsGacDL8ANA1Iid71xGYk1+cOYl+eoE7GYQXhuTzZxRH1WcTwvL1yGMP/h3
 3ffijoPI9ZS2TSPVf1YNzxEo6FJQiUgIPQYx81/cazcRUk8/Hr2K4pG9lNjsmoF/kv
 8HSGntq9JrMYCYBduucr3aR2/x1Tb2W50tPCAr2PDb6sav9ViguNOaahIiY4HX40UV
 ggVUIRBjas2A845CYODuGxZvJchx9urQsjqWVUSUM8zGy0fUHBGl/SgeZ1t2dsapw6
 9/vjIuksWqa9g==
Message-ID: <1cbcceed-6e95-4f20-8666-1c8f40154e3b@kernel.org>
Date: Tue, 2 Sep 2025 15:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: define NVIDIA DRM format modifiers for GB20x
To: James Jones <jajones@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-2-jajones@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250811220017.1337-2-jajones@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/12/25 12:00 AM, James Jones wrote:
> The layout of bits within the individual tiles
> (referred to as sectors in the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> changed for 8 and 16-bit surfaces starting in
> Blackwell 2 GPUs (With the exception of GB10).
> To denote the difference, extend the sector field
> in the parametric format modifier definition used
> to generate modifier values for NVIDIA hardware.
> 
> Without this change, it would be impossible to
> differentiate the two layouts based on modifiers,
> and as a result software could attempt to share
> surfaces directly between pre-GB20x and GB20x
> cards, resulting in corruption when the surface
> was accessed on one of the GPUs after being
> populated with content by the other.
> 
> Of note: This change causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
> evaluate its "s" parameter twice, with the side
> effects that entails. I surveyed all usage of the
> modifier in the kernel and Mesa code, and that
> does not appear to be problematic in any current
> usage, but I thought it was worth calling out.
> 
> Signed-off-by: James Jones <jajones@nvidia.com>

Having a second look on this, isn't this (and patch 3) a fix as well?
