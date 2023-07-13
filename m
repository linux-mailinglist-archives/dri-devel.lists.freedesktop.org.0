Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C499A752ACC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFE810E777;
	Thu, 13 Jul 2023 19:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D210E777;
 Thu, 13 Jul 2023 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=SlWSwhHe+t/+5CD+8qzJLYQdlCsQhw+Uh2KGkPXB6kM=; b=vg3XLPJFrNw3vBwRCjiW5YxOq2
 J7z60gNJOjveg32CLIuJ85nynYH5q14lwRsCJUluPBYOWCNDwUUPmAzN1bbzgN4io1hrdAbNn+bet
 LvHAEgJAI3o+TolSH/sGJ6361Hl5rgpW0e7WaGYCAX2Jmm6BKgnZf+Xvchn5LU/nzwqptkUtfZPrg
 RIUS2TMNeUwzQXngfHeIGUDygAngNJiGYqLfhn/ym9A0WNBTTT/Qqyl22ZXC/vOOrpOxsQ0i3H5Ne
 RShtljbjCUdcWFxd8DVqFRYbU1479QbYMDVCzwsl/nd+vfJEiyINMToaackbPhBPrWaqhPUhfEKOJ
 iAesR+Yw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qK1l4-004DOL-2N; Thu, 13 Jul 2023 19:13:46 +0000
Message-ID: <76995421-a529-ac25-c306-2e4ac2844602@infradead.org>
Date: Thu, 13 Jul 2023 12:13:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 21/21] dyndbg-doc: add classmap info to howto
Content-Language: en-US
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230713163626.31338-1-jim.cromie@gmail.com>
 <20230713163626.31338-22-jim.cromie@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230713163626.31338-22-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/13/23 09:36, Jim Cromie wrote:
> Add some basic info on classmap usage and api
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  .../admin-guide/dynamic-debug-howto.rst       | 64 ++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index 8dc668cc1216..878750ce8c1d 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst

> @@ -374,3 +373,66 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>  For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
>  its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>  in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug classmaps
> +=======================
> +
> +Dyndbg generally selects *prdbg* callsites using structural info:
> +module, file, function, line.  Using classmaps, user modules can
> +organize/select pr_debug()s as they like.
> +
> +- classes coordinates/spans multiple modules
> +- complements the mod,file,func attrs
> +- keeps pr_debug's 0-off-cost JUMP_LABEL goodness
> +- isolates from other class'd and un-class'd pr_debugs() 
> +  (one doesnt mix 2 clients bank accounts)

          doesn't

> +
> +  # IOW this doesn't change DRM.debug settings
> +  #> echo -p > /proc/dynamic_debug/control
> +
> +  # change the classes by naming them explicitly (no wildcard here)
> +  #> echo class DRM_UT_CORE +p > /proc/dynamic_debug/control
> +
> +To support DRM.debug (/sys/module/drm/parameters/debug), dyndbg
> +provides DYNDBG_CLASSMAP_PARAM*.  It maps the categories/classes:
> +DRM_UT_CORE.. to bits 0..N, allowing to set all classes at once.
> +
> +Dynamic Debug Classmap API
> +==========================
> +
> +DYNDBG_CLASSMAP_DEFINE - modules create CLASSMAPs, naming the classes
> +and type, and mapping the class-names to consecutive _class_ids.  By
> +doing so, they tell dyndbg that they are using those class_ids, and
> +authorize dyndbg to manipulate the callsites by their class-names.
> +
> +Its expected that client modules will follow the DRM.debug model:
> +1. define their debug-classes using an enum type, where the enum
> +symbol and its integer value define both the classnames and class-ids.
> +2. use or macro-wrap __pr_debug_cls(ENUM_VAL, "hello world\n")
> +   
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, ala DRM.debug

                                                          a la
or just                                                   like

> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative (Verbose3 > Verbose2)
> +
> +Both these classmap-types use the class-names/ENUM_VALs to validate
> +commands into >control.
> +
> +DYNDBG_CLASSMAP_PARAM - refs a DEFINEd classmap, exposing the set of

Is this:                   refers to a
?

> +defined classes to manipulation as a group.  This interface enforces
> +the relatedness of classes of DD_CLASS_TYPE_LEVEL_NUM typed classmaps;
> +all classes are independent in the >control parser itself.
> +
> +DYNDBG_CLASSMAP_USE - drm drivers use the CLASSMAP that drm DEFINEs.
> +This shares the classmap defn, and authorizes coordinated changes

                            definition,

> +amongst the CLASSMAP DEFINEr and multiple USErs.
> +
> +Modules or module-groups (drm & drivers) can define multiple
> +classmaps, as long as they share the limited 0..62 per-module-group
> +_class_id range, without overlap.
> +
> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones (__pr_debug_cls(id,fmt..)).  This won't be reflected in
> +the PARAM readback value, but the pr_debug callsites can be toggled
> +into agreement with the param.
> +

thanks.
-- 
~Randy
