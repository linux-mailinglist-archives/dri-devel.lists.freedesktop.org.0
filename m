Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51CAD91CB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559810EA27;
	Fri, 13 Jun 2025 15:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mLe2kEHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA34710EA24;
 Fri, 13 Jun 2025 15:46:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1721E61F1A;
 Fri, 13 Jun 2025 15:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12BEC4CEE3;
 Fri, 13 Jun 2025 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749829581;
 bh=uaH1xVBzEX1wQl3zNVsgm5Cm5l4gfuLRI34UpYO4V2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mLe2kEHta0ii7bN0EtXu/yxvL3lssnj0wCLqINfz+M5a+U/ScCeFt7OtssuK0w/yx
 9180bypmfxz4z87JUjaS/p98g4O1/1h+qqHM66N279c1uLjGebqhG2trjBTGRgUwps
 RKaPU5f+veawU4HDFbzPOISkmtS4SpcK9/jSWBerfVbxrQoqStB9sekiUHqp0K8y3A
 isSrVKIz0IBmlPqyRriCVSDvYvC2GVtLv+Dp76rZInMkRRX0B8bIqGG4M6zE5kxffA
 cJQl+Z3tv+ZLJ9AqjOtz9gL/CPLsO+dOlMZmVQYKNjAh8JyDK1dugv067D+Ft11Dl6
 /eayx/p8dDDtA==
Message-ID: <dfd2f320-4f33-4638-ad5c-891e00eaf45a@kernel.org>
Date: Fri, 13 Jun 2025 17:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: fix a use-after-free in
 r535_gsp_rpc_push()
To: Zhi Wang <zhiw@nvidia.com>
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, aniketa@nvidia.com, arpitj@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
References: <20250527163712.3444-1-zhiw@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250527163712.3444-1-zhiw@nvidia.com>
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



On 5/27/25 6:37 PM, Zhi Wang wrote:
> The RPC container is released after being passed to r535_gsp_rpc_send().
> 
> When sending the initial fragment of a large RPC and passing the
> caller's RPC container, the container will be freed prematurely. Subsequent
> attempts to send remaining fragments will therefore result in a
> use-after-free.
> 
> Allocate a temporary RPC container for holding the initial fragment of a
> large RPC when sending. Free the caller's container when all fragments
> are successfully sent.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Applied to drm-misc-fixes, thanks!
