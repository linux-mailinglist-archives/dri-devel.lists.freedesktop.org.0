Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFC503842
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 23:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04610E03A;
	Sat, 16 Apr 2022 21:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5.hostedemail.com (relay5.hostedemail.com [64.99.140.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A310E03A;
 Sat, 16 Apr 2022 21:04:28 +0000 (UTC)
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 14C2D21AC0;
 Sat, 16 Apr 2022 21:04:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 5191A2000E; 
 Sat, 16 Apr 2022 21:04:25 +0000 (UTC)
Message-ID: <715d6dbd696a9dad2690772d175d2ab497e0c316.camel@perches.com>
Subject: Re: [PATCH] drm/i915: change node clearing from memset to
 initialization
From: Joe Perches <joe@perches.com>
To: Tom Rix <trix@redhat.com>, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Date: Sat, 16 Apr 2022 14:04:24 -0700
In-Reply-To: <7973fecf-4e51-3ec8-b626-2581e3ad2f26@redhat.com>
References: <20220416172325.1039795-1-trix@redhat.com>
 <26839195c315eebcd1148d2a3de6a0df9e42dd1c.camel@perches.com>
 <7973fecf-4e51-3ec8-b626-2581e3ad2f26@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.45
X-Stat-Signature: d1ip915ek7ad4trurnsy49gyhe3qn7gk
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 5191A2000E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+iXEBsnqu9abpi2agJzgCvnjJ4MPp3y7k=
X-HE-Tag: 1650143065-583731
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-04-16 at 13:48 -0700, Tom Rix wrote:
> On 4/16/22 11:33 AM, Joe Perches wrote:
> > On Sat, 2022-04-16 at 13:23 -0400, Tom Rix wrote:
> > > In insert_mappable_node(), the parameter node is
> > > cleared late in node's use with memset.
> > > insert_mappable_node() is a singleton, called only
> > > from i915_gem_gtt_prepare() which itself is only
> > > called by i915_gem_gtt_pread() and
> > > i915_gem_gtt_pwrite_fast() where the definition of
> > > node originates.
> > > 
> > > Instead of using memset, initialize node to 0 at it's
> > > definitions.
> > trivia: /it's/its/
> > 
> > Only reason _not_ to do this is memset is guaranteed to
> > zero any padding that might go to userspace.
> > 
> > But it doesn't seem there is any padding anyway nor is
> > the struct available to userspace.
> > 
> > So this seems fine though it might increase overall code
> > size a tiny bit.
> > 
> > I do have a caveat: see below:
> > 
> > > diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> > []
> > > @@ -328,7 +327,6 @@ static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object *obj,
> > >   		goto err_ww;
> > >   	} else if (!IS_ERR(vma)) {
> > >   		node->start = i915_ggtt_offset(vma);
> > > -		node->flags = 0;
> > Why is this unneeded?
> 
> node = {} initializes all of node's elements to 0, including this one.

true, but could the call to insert_mappable_node combined with the
retry goto in i915_gem_gtt_prepare set this to non-zero?


