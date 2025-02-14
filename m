Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15394A3614D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0D010ED00;
	Fri, 14 Feb 2025 15:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m/+gwtSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A010ECF0;
 Fri, 14 Feb 2025 15:17:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A04D5A42C87;
 Fri, 14 Feb 2025 15:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A0BC4CEDD;
 Fri, 14 Feb 2025 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739546267;
 bh=yUWhsdLXquBFliy+se8TSDZmPvKV+fFHFYB5zXQhUe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m/+gwtSAeRBU050KjhKjZHk5dxHPPz+g2fAFi1wycA/n9bQHe7e5nZoTLMBChS2ul
 edDiW0GOUSy8Hem7JDVDqH0xZtcx8g6sWBXBUacTFozYJuV/b76Guh9Ssy8rp9DBms
 lALhoeay6XpxfJ4x+6hqbaO8TI9RRKTpsrLyrWRYy9UY/x5ME13HW3MP+ZISiNH7w9
 xB8ehqRn41x754lGlUbN8IfYm7IiQ4x1JCHH3dctugHgsYCL5c/COnzmQMnc4FS+n6
 9f9WcQFnWhFR3mYfXfK7BCOAwdEIfmBAg6WjsRY3ljz6P5o2I0gIVduS+0lrpcpoof
 7TVRwL6Oms7PA==
Date: Fri, 14 Feb 2025 16:17:42 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v1 1/2] nouveau/svm: fix missing folio unlock + put after
 make_device_exclusive_range()
Message-ID: <Z69eloo_7LM6NneO@cassiopeiae>
References: <20250124181524.3584236-1-david@redhat.com>
 <20250124181524.3584236-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124181524.3584236-2-david@redhat.com>
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

On Fri, Jan 24, 2025 at 07:15:23PM +0100, David Hildenbrand wrote:
> In case we have to retry the loop, we are missing to unlock+put the
> folio. In that case, we will keep failing make_device_exclusive_range()
> because we cannot grab the folio lock, and even return from the function
> with the folio locked and referenced, effectively never succeeding the
> make_device_exclusive_range().
> 
> While at it, convert the other unlock+put to use a folio as well.
> 
> This was found by code inspection.
> 
> Fixes: 8f187163eb89 ("nouveau/svm: implement atomic SVM access")
> Signed-off-by: David Hildenbrand <david@redhat.com>

Applied to drm-misc-fixes, thanks!
