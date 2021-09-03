Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF653FFECA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 13:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC046E86F;
	Fri,  3 Sep 2021 11:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464966E86C;
 Fri,  3 Sep 2021 11:15:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="280408385"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="280408385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 04:15:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="500322254"
Received: from ojcasey-mobl.ger.corp.intel.com (HELO [10.213.195.251])
 ([10.213.195.251])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 04:15:28 -0700
Subject: Re: [Intel-gfx] [PATCH v7 5/8] drm_print: add choice to use dynamic
 debug in drm-debug
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-6-jim.cromie@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b3c4b3aa-b873-a2aa-c1ad-5fed80038c6e@linux.intel.com>
Date: Fri, 3 Sep 2021 12:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831202133.2165222-6-jim.cromie@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 31/08/2021 21:21, Jim Cromie wrote:
> drm's debug system writes 10 distinct categories of messages to syslog
> using a small API[1]: drm_dbg*(10 names), DRM_DEV_DEBUG*(3 names),
> DRM_DEBUG*(8 names).  There are thousands of these callsites, each
> categorized in this systematized way.
> 
> These callsites can be enabled at runtime by their category, each
> controlled by a bit in drm.debug (/sys/modules/drm/parameter/debug).
> In the current "basic" implementation, drm_debug_enabled() tests these
> bits in __drm_debug each time an API[1] call is executed; while cheap
> individually, the costs accumulate with uptime.
> 
> This patch uses dynamic-debug with jump-label to patch enabled calls
> onto their respective NOOP slots, avoiding all runtime bit-checks of
> __drm_debug by drm_debug_enabled().
> 
> Dynamic debug has no concept of category, but we can emulate one by
> replacing enum categories with a set of prefix-strings; "drm:core:",
> "drm:kms:" "drm:driver:" etc, and prepend them (at compile time) to
> the given formats.
> 
> Then we can use:
>    `echo module drm format "^drm:core: " +p > control`
> 
> to enable the whole category with one query.

Probably stupid question - enabling stuff at boot time still works as 
described in Documentation/admin-guide/dynamic-debug-howto.rst?

Second question, which perhaps has been covered in the past so apologies 
if redundant - what is the advantage of allowing this to be 
configurable, versus perhaps always enabling it? Like what would be the 
reasons someone wouldn't just want to have CONFIG_DYNAMIC_DEBUG compiled 
in? Kernel binary size?

Regards,

Tvrtko

> 
> This conversion yields many new prdbg callsites:
> 
>    dyndbg: 195 debug prints in module drm_kms_helper
>    dyndbg: 298 debug prints in module drm
>    dyndbg: 1630 debug prints in module i915
>    dyndbg: ~3500 debug prints in module amdgpu
> 
> CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
> CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
> CONFIG_JUMP_LABEL is enabled; this because its required to get the
> promised optimizations.
> 
> The "basic" -> "dyndbg" switchover is layered into the macro scheme
> 
> A. A "prefix" version of DRM_UT_<CATs> map, named DRM_DBG_CAT_<CATs>
> 
> "basic":  DRM_DBG_CAT_<CATs>  <===  DRM_UT_<CATs>.  Identity map.
> "dyndbg":
>     #define DRM_DBG_CAT_KMS    "drm:kms: "
>     #define DRM_DBG_CAT_PRIME  "drm:prime: "
>     #define DRM_DBG_CAT_ATOMIC "drm:atomic: "
> 
> In v3, had older name, DRM_DBG_CLASS_<CATs> was countered, I had
> agreed, but this seems better still; CATEGORY is already DRM's
> term-of-art, and adding a near-synonym 'CLASS' only adds ambiguity.
> 
> DRM_UT_* are preserved, since theyre used elsewhere.  We can probably
> reduce their use further, but thats a separate thing.
> 
> B. drm_dev_dbg() & drm_debug() are interposed with macros
> 
> basic:	  forward to renamed fn, with args preserved
> enabled:  redirect to pr_debug, dev_dbg, with CATEGORY format catenated
> 
> This is where drm_debug_enabled() is avoided.  The prefix is prepended
> at compile-time, no category at runtime.
> 
> C. API[1] uses DRM_DBG_CAT_<CAT>s
> 
> these already use (B), now they use (A) too, to get the correct token
> type for "basic" and "dyndbg" configs.
> 
> D. use DEFINE_DYNAMIC_DEBUG_CATEGORIES()
> 
> This defines the map using DRM_CAT_<CAT>s, and creates the /sysfs
> bitmap to control those categories.
> 
> NOTES:
> 
> Because the dyndbg callback is watching __drm_debug, it is coherent
> with drm_debug_enabled() and its remaining users; the switchover
> should be transparent.
> 
> Code Review is expected to catch the lack of correspondence between
> bit=>prefix definitions (the selector) and the prefixes used in the
> API[1] layer above pr_debug()
> 
> I've coded the search-prefixes/categories with a trailing space, which
> excludes any sub-categories added later.  This convention protects any
> "drm:atomic:fail:" callsites from getting stomped on by `echo 0 > debug`.
> Other categories could differ, but we need some default.
> 
> Dyndbg requires that the prefix be in the compiled-in format string;
> run-time prefixing evades callsite selection by category.
> 
> 	pr_debug("%s: ...", __func__, ...) // not ideal
> 
> With "lineno X" in a query, its possible to enable single callsites,
> but it is tedious, and useless in a category context.
> 
> Unfortunately __func__ is not a macro, and cannot be catenated at
> preprocess/compile time.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v5:
> . use DEFINE_DYNAMIC_DEBUG_CATEGORIES in drm_print.c
> . s/DRM_DBG_CLASS_/DRM_DBG_CAT_/ - dont need another term
> . default=y in KBuild entry - per @DanVet
> . move some commit-log prose to dyndbg commit
> . add-prototyes to (param_get/set)_dyndbg
> . more wrinkles found by <lkp@intel.com>
> . relocate ratelimit chunk from elsewhere
> v6:
> . add kernel doc
> . fix cpp paste, drop '#'
> v7:
> . change __drm_debug to long, to fit with DEFINE_DYNAMIC_DEBUG_CATEGORIES
> . add -DDYNAMIC_DEBUG_MODULE to ccflags if DRM_USE_DYNAMIC_DEBUG
> ---
>   drivers/gpu/drm/Kconfig     |  13 ++++
>   drivers/gpu/drm/Makefile    |   3 +
>   drivers/gpu/drm/drm_print.c |  53 +++++++++----
>   include/drm/drm_print.h     | 144 ++++++++++++++++++++++++++++--------
>   4 files changed, 166 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7ff89690a976..97e38d86fd27 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -57,6 +57,19 @@ config DRM_DEBUG_MM
>   
>   	  If in doubt, say "N".
>   
> +config DRM_USE_DYNAMIC_DEBUG
> +	bool "use dynamic debug to implement drm.debug"
> +	default y
> +	depends on DRM
> +	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> +	depends on JUMP_LABEL
> +	help
> +	  The "basic" drm.debug facility does a lot of unlikely
> +	  bit-field tests at runtime; while cheap individually, the
> +	  cost accumulates.  DYNAMIC_DEBUG patches pr_debug()s in/out
> +	  of the running kernel, so avoids those bit-test overheads,
> +	  and is therefore recommended.
> +
>   config DRM_DEBUG_SELFTEST
>   	tristate "kselftests for DRM"
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a118692a6df7..1809329654b3 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -20,6 +20,9 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>   		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
>   		drm_managed.o drm_vblank_work.o
>   
> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> +ccflags-y += -DDYNAMIC_DEBUG_MODULE
> +#endif
>   drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>   			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
>   			    drm_vm.o
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 111b932cf2a9..df2e10754c41 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -28,6 +28,7 @@
>   #include <stdarg.h>
>   
>   #include <linux/io.h>
> +#include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/seq_file.h>
>   #include <linux/slab.h>
> @@ -40,19 +41,39 @@
>    * __drm_debug: Enable debug output.
>    * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
>    */
> -unsigned int __drm_debug;
> +unsigned long __drm_debug;
>   EXPORT_SYMBOL(__drm_debug);
>   
> -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
> -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
> -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> -module_param_named(debug, __drm_debug, int, 0600);
> +#define DRM_DEBUG_DESC \
> +"Enable debug output, where each bit enables a debug category.\n"	\
> +"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"		\
> +"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"	\
> +"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"	\
> +"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"		\
> +"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"		\
> +"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"		\
> +"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"		\
> +"\t\tBit 8 (0x100) will enable DP messages (displayport code)."
> +
> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> +#include <linux/dynamic_debug.h>
> +DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug, __drm_debug,
> +	DRM_DEBUG_DESC,
> +	_DD_cat_(DRM_DBG_CAT_CORE),
> +	_DD_cat_(DRM_DBG_CAT_DRIVER),
> +	_DD_cat_(DRM_DBG_CAT_KMS),
> +	_DD_cat_(DRM_DBG_CAT_PRIME),
> +	_DD_cat_(DRM_DBG_CAT_ATOMIC),
> +	_DD_cat_(DRM_DBG_CAT_VBL),
> +	_DD_cat_(DRM_DBG_CAT_STATE),
> +	_DD_cat_(DRM_DBG_CAT_LEASE),
> +	_DD_cat_(DRM_DBG_CAT_DP),
> +	_DD_cat_(DRM_DBG_CAT_DRMRES));
> +
> +#else
> +MODULE_PARM_DESC(debug, DRM_DEBUG_DESC);
> +module_param_named(debug, __drm_debug, ulong, 0600);
> +#endif
>   
>   void __drm_puts_coredump(struct drm_printer *p, const char *str)
>   {
> @@ -256,8 +277,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
>   }
>   EXPORT_SYMBOL(drm_dev_printk);
>   
> -void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> -		 const char *format, ...)
> +void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> +		   const char *format, ...)
>   {
>   	struct va_format vaf;
>   	va_list args;
> @@ -278,9 +299,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   
>   	va_end(args);
>   }
> -EXPORT_SYMBOL(drm_dev_dbg);
> +EXPORT_SYMBOL(__drm_dev_dbg);
>   
> -void __drm_dbg(enum drm_debug_category category, const char *format, ...)
> +void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
>   {
>   	struct va_format vaf;
>   	va_list args;
> @@ -297,7 +318,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
>   
>   	va_end(args);
>   }
> -EXPORT_SYMBOL(__drm_dbg);
> +EXPORT_SYMBOL(___drm_dbg);
>   
>   void __drm_err(const char *format, ...)
>   {
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9b66be54dd16..973443040561 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -35,7 +35,7 @@
>   #include <drm/drm.h>
>   
>   /* Do *not* use outside of drm_print.[ch]! */
> -extern unsigned int __drm_debug;
> +extern unsigned long __drm_debug;
>   
>   /**
>    * DOC: print
> @@ -252,15 +252,15 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   /**
>    * enum drm_debug_category - The DRM debug categories
>    *
> - * Each of the DRM debug logging macros use a specific category, and the logging
> - * is filtered by the drm.debug module parameter. This enum specifies the values
> - * for the interface.
> + * The drm.debug logging API[1] has 10 enumerated categories of
> + * messages, issued by 3 families of macros: 10 drm_dbg_<CATs>, 8
> + * DRM_DEBUG_<CATs>, and 3 DRM_DEV_DEBUG_<CATs>.
>    *
>    * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
>    * DRM_DEBUG() logs to DRM_UT_CORE.
>    *
> - * Enabling verbose debug messages is done through the drm.debug parameter, each
> - * category being enabled by a bit:
> + * Enabling categories of debug messages is done through the drm.debug
> + * parameter, each category being enabled by a bit:
>    *
>    *  - drm.debug=0x1 will enable CORE messages
>    *  - drm.debug=0x2 will enable DRIVER messages
> @@ -319,6 +319,86 @@ enum drm_debug_category {
>   	DRM_UT_DRMRES		= 0x200,
>   };
>   
> +/**
> + * DOC: DRM_USE_DYNAMIC_DEBUG - using dyndbg in drm.debug
> + *
> + * In the "basic" drm.debug implementation outlined above, each time a
> + * drm-debug API[1] call is executed, drm_debug_enabled(cat) tests
> + * drm.debug vs cat before printing.
> + *
> + * DYNAMIC_DEBUG (aka: dyndbg) patches pr_debug()s in^out of the
> + * running kernel, so it can avoid drm_debug_enabled() and skip lots
> + * of unlikely bit tests.
> + *
> + * dyndbg has no concept of category, but we can prepend a
> + * class-prefix string: "drm:core: ", "drm:kms: ", "drm:driver: " etc,
> + * to pr_debug's format (at compile time).
> + *
> + * Then control the category
> + *    `echo module drm format "^drm:core: " +p > control`
> + *    `dynamic_debug_exec_queries("format '^drm:core: ' +p", "drm");`
> + *
> + * To do this for "basic" | "dyndbg", adaptation adds some macro indirection:
> + *
> + * 0. use dyndbg support to define the bits => prefixes map, attach callback.
> + *
> + *    DYNDBG_BITMAP_DESC(debug, __drm_debug,
> + *			 "drm.debug - overview",
> + *			 { "drm:core:", "enable CORE debug messages" },
> + *			 { "drm:kms:", "enable KMS debug messages" }, ...);
> + *
> + * 1. DRM_DBG_CAT_<CAT>
> + *
> + * This set of symbols replaces DRM_UT_<CAT> in the drm-debug API; it
> + * is either a copy of DRM_UT_<CAT>, or the class-prefix strings.
> + *
> + * 2. drm_dev_dbg & drm_debug are called by drm.debug API
> + *
> + * These are now macros, either forwarding to renamed functions, or
> + * prepending the class string to the format, and invoking pr_debug
> + * directly.  Since the API is all macros, dyndbg remembers
> + * per-pr_debug: module,file,func,line,format and uses that to find
> + * and enable them.
> + */
> +#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> +
> +#define __drm_dbg(cls, fmt, ...)			\
> +	___drm_dbg(cls, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, cls, fmt, ...)			\
> +	__drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
> +
> +#define DRM_DBG_CAT_CORE	DRM_UT_CORE
> +#define DRM_DBG_CAT_DRIVER	DRM_UT_DRIVER
> +#define DRM_DBG_CAT_KMS		DRM_UT_KMS
> +#define DRM_DBG_CAT_PRIME	DRM_UT_PRIME
> +#define DRM_DBG_CAT_ATOMIC	DRM_UT_ATOMIC
> +#define DRM_DBG_CAT_VBL		DRM_UT_VBL
> +#define DRM_DBG_CAT_STATE	DRM_UT_STATE
> +#define DRM_DBG_CAT_LEASE	DRM_UT_LEASE
> +#define DRM_DBG_CAT_DP		DRM_UT_DP
> +#define DRM_DBG_CAT_DRMRES	DRM_UT_DRMRES
> +
> +#else /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
> +/* join prefix+format in cpp so dyndbg can see it */
> +#define __drm_dbg(cls, fmt, ...)		\
> +	pr_debug(cls fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, cls, fmt, ...)		\
> +	dev_dbg(dev, cls fmt, ##__VA_ARGS__)
> +
> +#define DRM_DBG_CAT_CORE	"drm:core: "
> +#define DRM_DBG_CAT_DRIVER	"drm:drvr: "
> +#define DRM_DBG_CAT_KMS		"drm:kms: "
> +#define DRM_DBG_CAT_PRIME	"drm:prime: "
> +#define DRM_DBG_CAT_ATOMIC	"drm:atomic: "
> +#define DRM_DBG_CAT_VBL		"drm:vbl: "
> +#define DRM_DBG_CAT_STATE	"drm:state: "
> +#define DRM_DBG_CAT_LEASE	"drm:lease: "
> +#define DRM_DBG_CAT_DP		"drm:dp: "
> +#define DRM_DBG_CAT_DRMRES	"drm:res: " /* not in MODULE_PARM_DESC */
> +
> +#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
>   static inline bool drm_debug_enabled(enum drm_debug_category category)
>   {
>   	return unlikely(__drm_debug & category);
> @@ -334,8 +414,8 @@ __printf(3, 4)
>   void drm_dev_printk(const struct device *dev, const char *level,
>   		    const char *format, ...);
>   __printf(3, 4)
> -void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> -		 const char *format, ...);
> +void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> +		   const char *format, ...);
>   
>   /**
>    * DRM_DEV_ERROR() - Error output.
> @@ -383,7 +463,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>    * @fmt: printf() like format string.
>    */
>   #define DRM_DEV_DEBUG(dev, fmt, ...)					\
> -	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
>   /**
>    * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
>    *
> @@ -391,7 +471,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>    * @fmt: printf() like format string.
>    */
>   #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
>   /**
>    * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
>    *
> @@ -399,7 +479,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>    * @fmt: printf() like format string.
>    */
>   #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
>   
>   /*
>    * struct drm_device based logging
> @@ -443,25 +523,25 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   
>   
>   #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
>   #define drm_dbg(drm, fmt, ...)						\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
>   #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
>   #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_PRIME, fmt, ##__VA_ARGS__)
>   #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_ATOMIC, fmt, ##__VA_ARGS__)
>   #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_VBL, fmt, ##__VA_ARGS__)
>   #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_STATE, fmt, ##__VA_ARGS__)
>   #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_LEASE, fmt, ##__VA_ARGS__)
>   #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DP, fmt, ##__VA_ARGS__)
>   #define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRMRES, fmt, ##__VA_ARGS__)
>   
>   
>   /*
> @@ -471,7 +551,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>    */
>   
>   __printf(2, 3)
> -void __drm_dbg(enum drm_debug_category category, const char *format, ...);
> +void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
>   __printf(1, 2)
>   void __drm_err(const char *format, ...);
>   
> @@ -500,29 +580,30 @@ void __drm_err(const char *format, ...);
>   #define DRM_ERROR_RATELIMITED(fmt, ...)					\
>   	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>   
> +
>   #define DRM_DEBUG(fmt, ...)						\
> -	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_CORE, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_DRIVER(fmt, ...)					\
> -	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_DRIVER, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_KMS(fmt, ...)						\
> -	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_KMS, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_PRIME(fmt, ...)					\
> -	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_PRIME, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_ATOMIC(fmt, ...)					\
> -	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_ATOMIC, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_VBL(fmt, ...)						\
> -	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_VBL, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_LEASE(fmt, ...)					\
> -	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_LEASE, fmt, ##__VA_ARGS__)
>   
>   #define DRM_DEBUG_DP(fmt, ...)						\
> -	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> +	__drm_dbg(DRM_DBG_CAT_DP, fmt, ## __VA_ARGS__)
>   
>   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
>   ({												\
> @@ -530,7 +611,8 @@ void __drm_err(const char *format, ...);
>   	const struct drm_device *drm_ = (drm);							\
>   												\
>   	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
> -		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> +		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,					\
> +			    DRM_DBG_CAT_ ## category, fmt, ##__VA_ARGS__);			\
>   })
>   
>   #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
> 
