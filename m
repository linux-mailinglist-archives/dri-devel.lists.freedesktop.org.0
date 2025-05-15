Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65DAB81C3
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946CC10E7CF;
	Thu, 15 May 2025 09:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gY5ja/xX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665ED10E7CE;
 Thu, 15 May 2025 09:00:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A7EAF614BC;
 Thu, 15 May 2025 09:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA548C4CEE7;
 Thu, 15 May 2025 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747299621;
 bh=P1m0+sTWHkC72E4lMEa+YpX9d051+utwMYEb3wj5BLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gY5ja/xXRSOUSOsykU5WDfq0Rwv9FETxU+qGxCPJvIOqIi5P3xwjTiKZ6MmJ2+3tn
 8yylaUdYb7S6589CGpUP+1NtDHutEY5Bpu6wsGKA1fhwP6BfjP/TMvKQjmN3YfxtgV
 eQ0Th4ZaXd78cMidIspyBZxn7EuDehh8Q2Kd+7lqEOC/QalolUpIyV7lduNRU+VtDv
 vxi8kAtYC8DAUZTJHGFnRvyMMTY9w+BzWfCv6odzFPAz2jnQqyAvIm2nnUrLxw7wsB
 g8IlqX2LQg+rlsLTOnUoPEHxQ3zWL7E4OXgSzik5nc+VdpLngQMxA7Jp2m3PrKAZTM
 7PIbCsOYexHIA==
Date: Thu, 15 May 2025 11:00:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCWtINcOUWciwx8L@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514175527.42488-3-robdclark@gmail.com>
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

On Wed, May 14, 2025 at 10:53:16AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Eases migration for drivers where VAs don't hold hard references to
> their associated BO, avoiding reference loops.
> 
> In particular, msm uses soft references to optimistically keep around
> mappings until the BO is distroyed.  Which obviously won't work if the
> VA (the mapping) is holding a reference to the BO.

Ick! This is all complicated enough. Allow drivers to bypass the proper
reference counting for GEM objects in the context of VM_BO structures seems like
an insane footgun.

I don't understand why MSM would need weak references here. Why does msm need
that, but nouveau, Xe, panthor, PowerVR do not?
