Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBDAAAE004
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57B10E7B1;
	Wed,  7 May 2025 13:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uatWKlfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A886D10E192;
 Wed,  7 May 2025 13:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA6B05C5BCB;
 Wed,  7 May 2025 13:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA24C4CEE7;
 Wed,  7 May 2025 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746623112;
 bh=cOphO8kdIIdjDJfxtzOIl/hmgUWGRqUT9UT27a8b/EE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uatWKlfenxOYO4eAFxV9xnzAZqD7v38oUoRy++yzo2iZcwvmcwFUVYDPdsfw2lyZH
 8FDJJxHGP5FVcjaZrNDHBDX6+dFGcMGi3ap85yRyVZjVspJe0MvmtoBCCSs2u2yd5D
 f6N6Trmhb3Wpe1wfDYpvLIeulX+XS2XYOqi2HC8KD36hnSqtDz40QvPt9laljO8sF5
 vz4F1PbarwAVh/tH/5MeYTa6xJRwNw0ksEHeLQ4W3qv9bwX6PHeljLpkOEdv29WZXF
 RUxPX1XvuB0Yne8z8ZWe4EwKm+PvtH5KD3eQsrhFDcPlZj5g4AIQ69B85Itj1kLUYB
 ilD7NjcAbOkjw==
Date: Wed, 7 May 2025 15:05:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 Gnattu OC <gnattuoc@me.com>, Nitin Gote <nitin.r.gote@intel.com>, 
 Ranu Maurya <ranu.maurya@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Angus Chen <angus.chen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Yu Jiaoliang <yujiaoliang@vivo.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Remove const from struct i915_wa list
 allocation
Message-ID: <yafhn4afqcwki3mbcozixqa2xqcd5d7crbn6guyb5zlxt3z7h6@riboytoxpcp4>
References: <20250426061357.work.749-kees@kernel.org>
 <874iy8y0nz.fsf@intel.com> <202504301356.CB1EEC719@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504301356.CB1EEC719@keescook>
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

Hi,

On Wed, Apr 30, 2025 at 01:56:51PM -0700, Kees Cook wrote:
> On Mon, Apr 28, 2025 at 02:40:16PM +0300, Jani Nikula wrote:
> > On Fri, 25 Apr 2025, Kees Cook <kees@kernel.org> wrote:
> > > In preparation for making the kmalloc family of allocators type aware,
> > > we need to make sure that the returned type from the allocation matches
> > > the type of the variable being assigned. (Before, the allocator would
> > > always return "void *", which can be implicitly cast to any pointer type.)
> > >
> > > The assigned type is "struct i915_wa *". The returned type, while
> > > technically matching, will be const qualified. As there is no general
> > > way to remove const qualifiers, adjust the allocation type to match
> > > the assignment.
> > >
> > > Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

...

> > for merging via whichever tree you find best; please let us know if you
> > want us to pick this up via drm-intel.
> 
> I was figuring each subsystem would want these individually, so please
> take this via drm-intel. (Or I can take it if you'd rather not.)

Because I don't see this patch applied anywhere, and, given the
file changed, I am merging it in drm-intel-gt-next.

Andi
