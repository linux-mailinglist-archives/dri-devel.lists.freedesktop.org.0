Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F41AA547B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 21:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEB610E0A1;
	Wed, 30 Apr 2025 19:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lBx6xqXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB1910E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 19:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9D4CDA4B7C4;
 Wed, 30 Apr 2025 19:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1458EC4CEE7;
 Wed, 30 Apr 2025 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746040006;
 bh=54IGMiZoSITdqFuruS1CfT7kOBbA4cCLxrOaIZ38igM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBx6xqXfwDFmrjbUs2hgy2zDbXK/vNdfjGIhlftSbWHOroXMr0YsmGSPUq4eq6YD8
 x5newvh0h4h85IG+RYltJLxbn5aRj9gONt/DE4L/+fHLyMWheN/sWg+9HPqVmla6Gp
 kDBktrQ0ZytBmKKOWAzQEOQvnXduiLQswyTxOyOAixXqEXBIc1NiAR46Q1ZMPcGZzg
 yl/wMbQvxBTC4y+vql6tMc9EbKiIO6Bn5U9YhGajsz9LYHLSCOyqNgfn4s0FyD76hs
 vnQUkmvLZnC8pbVmmovexV2Q+0ct24Sd1wt3PcNAq7EVEyGlM1S4F6Rc9Gf3jJGo8c
 zw4hU+IXA/XmQ==
Date: Wed, 30 Apr 2025 12:06:43 -0700
From: Kees Cook <kees@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Adjust vkms_state->active_planes allocation type
Message-ID: <202504301205.B3AD2E7@keescook>
References: <20250426061431.work.304-kees@kernel.org>
 <823d4d24-da80-4834-95ca-d5698edfe18f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <823d4d24-da80-4834-95ca-d5698edfe18f@bootlin.com>
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

On Mon, Apr 28, 2025 at 10:18:34AM +0200, Louis Chauvet wrote:
> 
> 
> Le 26/04/2025 à 08:14, Kees Cook a écrit :
> > In preparation for making the kmalloc family of allocators type aware,
> > we need to make sure that the returned type from the allocation matches
> > the type of the variable being assigned. (Before, the allocator would
> > always return "void *", which can be implicitly cast to any pointer type.)
> > 
> > The assigned type is "struct vkms_plane_state **", but the returned type
> > will be "struct drm_plane **". These are the same size (pointer size), but
> > the types don't match. Adjust the allocation type to match the assignment.
> 
> I think this is an issue, can you add the proper Fixup tag in this commit?

I think trailers updating tools like b4 will pick this up:

Fixes: 8b1865873651 ("drm/vkms: totally reworked crc data tracking")

Would you rather I send a v2 with the Fixes added?

> 
> With this:
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks!

-Kees

-- 
Kees Cook
