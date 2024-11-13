Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676A9C7B1F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 19:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383F610E271;
	Wed, 13 Nov 2024 18:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SF91YXhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D1310E264;
 Wed, 13 Nov 2024 18:29:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32C205C4C11;
 Wed, 13 Nov 2024 18:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7AAC4CEC3;
 Wed, 13 Nov 2024 18:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731522591;
 bh=PVDbYbNqRERQaA9TjMSh0em+KssXtcnQxggmRi2efsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SF91YXhY1ySElLg5xEuFdftyqMktNaZoSUkruyuHZoowwUycaGNLPUqGWb09MNvrR
 mnZGqEYkGbbTvW5+eoUub02HkOItVXZrB7yk7vCmLpH2VbNoqxmkW0JfncyFqoKhOt
 7j22irKZUJktZwKD4+E4jbBXrOJGI6XEi0OASSdNXiK1z1B6q/fJsUcfRZBQZDS+1j
 LQGtr8NTpkv4vdBJj8pY/bUWrlWE3K0WJxcqfbzdxqmySHRuqfIp00NxXjDbtURheQ
 9ovB/IYK3C8btkjtlNL4E5pYKroQZapAQTpn9vHO6bO5ClaT8LecQlNyQYn1HyNmUf
 lkugInU8/bm6g==
Date: Wed, 13 Nov 2024 08:29:50 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Message-ID: <ZzTwHr3ah-MOPdx0@slm.duckdns.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <ZxlRLMwkabTaOrjc@slm.duckdns.org>
 <20241024-beautiful-spaniel-of-youth-f75b61@houat>
 <Zxp-nLXOJXoSy8BN@slm.duckdns.org>
 <20241028-meaty-mega-nuthatch-3d74b1@houat>
 <20241029203834.GA636494@cmpxchg.org>
 <20241106-vivacious-eagle-of-gaiety-44a419@houat>
 <ZyuzeIhTgXU5CCk0@slm.duckdns.org>
 <d6c57862-1593-44ff-a192-7af308cac94b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6c57862-1593-44ff-a192-7af308cac94b@linux.intel.com>
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

Hello,

On Wed, Nov 13, 2024 at 03:58:25PM +0100, Maarten Lankhorst wrote:
...
> Thanks for all feedback and discussion. I checked mostly on patchwork so I
> missed the discussion here. Fortunately it's only been about naming. :)
> 
> I'm thinking of adding a 'high' knob as well, that will work similarly to
> high in normal mem controller. (so not proportionally calculated like 'max',
> but (usage + allocated) < max = ok.
> 
> Recursively of course.

I'd be cautious about adding knobs. These being published API, it's easy to
paint oneself into a corner. I suggest starting with what's essential.

Thanks.

-- 
tejun
