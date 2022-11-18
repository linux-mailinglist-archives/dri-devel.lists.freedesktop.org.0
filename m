Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01562FE7C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 20:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870B910E7BF;
	Fri, 18 Nov 2022 19:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E466610E7BE;
 Fri, 18 Nov 2022 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668801526; x=1700337526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xNljTkdsbNBsUxwZda2aDgKlDFDKLXcQbDTQOI6ALvw=;
 b=HNVs9joXYLUQrUxSK1FJxOliSuBpdYe7+cou7vUj/yKShM4gt3JqcBU9
 HxMZH5MK3ideLkCmV14t5tZVYyhhLe0awmpHgZ89O6IHvKJaqQPMwxB5a
 2DUwyWKDqz2dVd/yNDdgf9kuc3J6fYn716eA4MeIDrF7HJk7+rBgQuOO6
 54+tQ6gO5CSJ4S+zh83a9Gup7DthXT4ZgOHkEHR35aeEFxADChD5izpQV
 ocxQVtwanM1C0GRn83E5CotVRHJW0eL5Ji/BF05bayKSqA0kZRgVF96LZ
 VHbxOw2biqUuxpMKf0nhs8Rymd/EFDuxG6aU9QWZtJv48Vx1sW6Nh+6LZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="300758855"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="300758855"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 11:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="746123817"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="746123817"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 18 Nov 2022 11:58:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Nov 2022 21:58:42 +0200
Date: Fri, 18 Nov 2022 21:58:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix workarounds on Gen2-3
Message-ID: <Y3fj8rJpqMhzsW35@intel.com>
References: <20221118115249.2683946-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118115249.2683946-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:52:49AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In 3653727560d0 ("drm/i915: Simplify internal helper function signature")
> I broke the old platforms by not noticing engine workaround init does not
> initialize the list on old platforms. Fix it by always initializing which
> already does the right thing by mostly not doing anything if there aren't
> any workarounds on the list.

Was going to give this a quick smoke test on my 865 but I can't even
reproduce the original issue on it.

Turns out the 64bit compiler is too smart:
0000000000000000 <wa_list_apply>:
       0:       8b 77 20                mov    0x20(%rdi),%esi
       3:       85 f6                   test   %esi,%esi
       5:       75 01                   jne    8 <wa_list_apply+0x8>
       7:       c3                      ret
       8:       41 57                   push   %r15
       a:       41 56                   push   %r14
       c:       41 55                   push   %r13
       e:       41 54                   push   %r12
      10:       55                      push   %rbp
      11:       53                      push   %rbx
      12:       48 83 ec 10             sub    $0x10,%rsp
      16:       48 89 fd                mov    %rdi,%rbp
      19:       4c 8b 2f                mov    (%rdi),%r13

So it has moved the wal->count check to be the very first thing,
even before even doing any stack setup.

The 32bit compiler is somewhat less smart:
00000000 <wa_list_apply>:
       0:       55                      push   %ebp
       1:       89 e5                   mov    %esp,%ebp
       3:       57                      push   %edi
       4:       56                      push   %esi
       5:       53                      push   %ebx
       6:       83 ec 10                sub    $0x10,%esp
       9:       89 45 f0                mov    %eax,-0x10(%ebp)
       c:       8b 58 10                mov    0x10(%eax),%ebx
       f:       8b 38                   mov    (%eax),%edi
      11:       85 db                   test   %ebx,%ebx
      13:       89 7d e8                mov    %edi,-0x18(%ebp)
      16:       8b 7f 0c                mov    0xc(%edi),%edi
      19:       75 0d                   jne    28 <wa_list_apply+0x28>

Not only does it do all that potentially pointless stack
setup, but then it has decided to do a bunch of stuff
with wal->gt before the jne.

That presumably explains why CI is still green despite blb/pnv.

Hmm. Now a different 32bit build also failed to hit this:
00000003 <wa_list_apply>:
       3:       55                      push   %ebp
       4:       89 e5                   mov    %esp,%ebp
       6:       57                      push   %edi
       7:       56                      push   %esi
       8:       53                      push   %ebx
       9:       83 ec 14                sub    $0x14,%esp
       c:       89 45 f0                mov    %eax,-0x10(%ebp)
       f:       8b 58 10                mov    0x10(%eax),%ebx
      12:       85 db                   test   %ebx,%ebx
      14:       75 08                   jne    1e <wa_list_apply+0x1b>

So this time it moved the wal->gt stuff to some later point.
Same compiler, different .config. Not sure which knob is
causing the difference here.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 3653727560d0 ("drm/i915: Simplify internal helper function signature")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 213160f29ec3..4d7a01b45e09 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2991,7 +2991,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  static void
>  engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  {
> -	if (I915_SELFTEST_ONLY(GRAPHICS_VER(engine->i915) < 4))
> +	if (GRAPHICS_VER(engine->i915) < 4)
>  		return;
>  
>  	engine_fake_wa_init(engine, wal);
> @@ -3016,9 +3016,6 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>  {
>  	struct i915_wa_list *wal = &engine->wa_list;
>  
> -	if (GRAPHICS_VER(engine->i915) < 4)
> -		return;
> -
>  	wa_init_start(wal, engine->gt, "engine", engine->name);
>  	engine_init_workarounds(engine, wal);
>  	wa_init_finish(wal);
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
