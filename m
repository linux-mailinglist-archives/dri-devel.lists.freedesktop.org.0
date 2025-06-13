Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D1AD85AE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1F110E8FF;
	Fri, 13 Jun 2025 08:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YTjeCD2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6AD10E917;
 Fri, 13 Jun 2025 08:31:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8419649744;
 Fri, 13 Jun 2025 08:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE25C4CEE3;
 Fri, 13 Jun 2025 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749803499;
 bh=PhXGaZgbkCZl0Qw7juh6JslVX5LbmhMjhkWF1wlyr2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTjeCD2NjIZnoNrJi7YyFBzbUmCQCNE2KVpwRGUERxrbmRlOiY76rMj70yOavvf6W
 a185agi8M6VubOnc+Kp90bZN0hWo8zTTVUt+OWytoyW2L8BughH4J9ZwsQEDxLWQSx
 WU0UI+f911Qr7HBgaSErFPBYFl4kAOxB3pqd0VkMBC6tErIe9i9xzREmfLB2RROJhU
 F+++B1dGUanDM/Kq7xlj6WeYdqwgCOyk8+5SKueWOJC98HcpqQEHxpqwVtNxbgSd6b
 CGXMFiMltRTvywuKVybYn+IBTOZP9c2rOJw1f3sNzIWwgoCWx9TKVBnPhyt31+oxIZ
 z2UXNc1QpUkIw==
Date: Fri, 13 Jun 2025 10:31:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEvh5zYXqR6t2OqR@pollux>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
 <aEtnS6kvh1mssFTb@cassiopeiae>
 <0783c4ab-e26e-4c90-93f5-342e761cee29@damsy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0783c4ab-e26e-4c90-93f5-342e761cee29@damsy.net>
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

On Fri, Jun 13, 2025 at 09:51:27AM +0200, Pierre-Eric Pelloux-Prayer wrote:
> If the theoretical overlap with client drm id is a concern, adding code to
> drm_file_alloc() to not use the last 0xff ids would be easy.

Not the theoretical overlap is not of any concern for me. What I dislike is
drivers silently relying on DRM API internals.

> btw maybe other drivers also use kernel jobs with the same semantics, in
> which case we might want to move the special IDs definition to a shared
> place.

Exactly, if kernel IDs are a thing we agree makes sense, we should provide a
common API to properly obtain a kernel ID, regardless of whether it's an atomic
or IDA.
