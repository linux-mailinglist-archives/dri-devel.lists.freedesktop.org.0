Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1943F8251
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50536E506;
	Thu, 26 Aug 2021 06:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462066E3EF;
 Wed, 25 Aug 2021 17:34:14 +0000 (UTC)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17PFvIH6003500;
 Wed, 25 Aug 2021 18:17:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=edtcoh0yspDr53hDuDsONFWPx4KE3nSl18ap2QzWALU=;
 b=AGf66ys+HNaKXQoYU6gOXDwF7R2VN0TANXfyVdAiVzsUk3tT0LtR9/ehv7jEhh7zODi2
 REMqTGX1wkg0n16IsRn1jq8wUVoef88N4EDBhYmYdtSELY9Y4hIU3gNCbj0Bek2DmTQX
 iv5GFiBOpA9oW4AzU8cGEFq0k6PcQf8/tVOAzAgOSo4LpD3T4A2WZXrL8xmIQFL7dh+t
 8q7qSTMuH1NbE5IA66QdZFjdmk3rtpbiA7ucLWfnWFLa8I6SSVGyySY9Vyx70lbFwHTr
 35o9e670nE0cIaFV92r2KNdHtHbYNWCWbIDbgMclWJC/rLNI9nsWOuNCEZWpL0j2qjhv Ww== 
Received: from prod-mail-ppoint1 (prod-mail-ppoint1.akamai.com [184.51.33.18]
 (may be forged))
 by mx0b-00190b01.pphosted.com with ESMTP id 3anhh8mpd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 18:17:35 +0100
Received: from pps.filterd (prod-mail-ppoint1.akamai.com [127.0.0.1])
 by prod-mail-ppoint1.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 17PH5amC011060; Wed, 25 Aug 2021 13:17:34 -0400
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
 by prod-mail-ppoint1.akamai.com with ESMTP id 3an83bhd4w-1;
 Wed, 25 Aug 2021 13:17:34 -0400
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 38CD6472F8;
 Wed, 25 Aug 2021 17:17:34 +0000 (GMT)
Subject: Re: [PATCH v6 02/11] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and
 callbacks
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 seanpaul@chromium.org, jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
 <20210822222009.2035788-3-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <405391f8-eb8f-0b49-0d28-eb3ecf5d554d@akamai.com>
Date: Wed, 25 Aug 2021 13:17:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822222009.2035788-3-jim.cromie@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_07:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250101
X-Proofpoint-GUID: zilUZKmRc1EdpGDnXk3lz-SQFVuvWMqn
X-Proofpoint-ORIG-GUID: zilUZKmRc1EdpGDnXk3lz-SQFVuvWMqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_07,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250102
X-Agari-Authentication-Results: mx.akamai.com;
 spf=${SPFResult} (sender IP is 184.51.33.18)
 smtp.mailfrom=jbaron@akamai.com smtp.helo=prod-mail-ppoint1
X-Mailman-Approved-At: Thu, 26 Aug 2021 06:17:16 +0000
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



On 8/22/21 6:20 PM, Jim Cromie wrote:
> DEFINE_DYNAMIC_DEBUG_CATEGORIES(name, var, bitmap_desc, @bit_descs)
> allows users to define a drm.debug style (bitmap) sysfs interface, and
> to specify the desired mapping from bits[0-N] to the format-prefix'd
> pr_debug()s to be controlled.
> 
> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> 	"i915/gvt bitmap desc",
> 	/**
> 	 * search-prefixes, passed to dd-exec_queries
> 	 * defines bits 0-N in order.
> 	 * leading ^ is tacitly inserted (by callback currently)
> 	 * trailing space used here excludes subcats.
> 	 * helper macro needs more work
> 	 * macro to autogen ++$i, 0x%x$i ?
> 	 */
> 	_DD_cat_("gvt:cmd: "),
> 	_DD_cat_("gvt:core: "),
> 	_DD_cat_("gvt:dpy: "),
> 	_DD_cat_("gvt:el: "),
> 	_DD_cat_("gvt:irq: "),
> 	_DD_cat_("gvt:mm: "),
> 	_DD_cat_("gvt:mmio: "),
> 	_DD_cat_("gvt:render: "),
> 	_DD_cat_("gvt:sched: "));
> 
> dynamic_debug.c: add 3 new elements:
> 
>  - int param_set_dyndbg()
>  - int param_get_dyndbg()
>  - struct kernel_param_ops param_ops_dyndbg
> 
> Following the model of kernel/params.c STANDARD_PARAM_DEFS, All 3 are
> non-static and exported.
> 
> dynamic_debug.h:
> 
> Add DEFINE_DYNAMIC_DEBUG_CATEGORIES() described above, and a do-nothing stub.
> 
> Note that it also calls MODULE_PARM_DESC for the user, but expects the
> user to catenate all the bit-descriptions together (as is done in
> drm.debug), and in the following uses in amdgpu, i915.
> 
> This in the hope that someone can offer an auto-incrementing
> label-generating macro, producing "\tbit-4 0x10\t" etc, and can show
> how to apply it to __VA_ARGS__.
> 
> Also extern the struct kernel_param param_ops_dyndbg symbol, as is
> done in moduleparams.h for all the STANDARD params.
> 
> USAGE NOTES:
> 
> Using dyndbg to query on "format ^$prefix" requires that the prefix be
> present in the compiled-in format string; where run-time prefixing is
> used, that format would be "%s...", which is not usefully selectable.
> 
> Adding structural query terms (func,file,lineno) could help (module is
> already done), but DEFINE_DYNAMIC_DEBUG_CATEGORIES can't do that now,
> adding it needs a better reason imo.
> 
> Dyndbg is completely agnostic wrt the categorization scheme used, to
> play well with any prefix convention already in use.  Ad-hoc
> categories and sub-categories are implicitly allowed, author
> discipline and review is expected.
> 
> Here are some examples:
> 
> "1","2","3"		2 doesn't imply 1.
>    			otherwize, sorta like printk levels
> "1:","2:","3:"		are better, avoiding [1-9]\d+ ambiguity
> "hi:","mid:","low:"	are reasonable, and imply independence
> "todo:","rfc:","fixme:" might be handy
> "A:".."Z:"		uhm, yeah
> 
> Hierarchical classes/categories are natural:
> 
> "drm:<CAT>:"		is used in later commit
> "drm:<CAT>:<SUB>:"	is a natural extension.
> "drm:atomic:fail:"	has been proposed, sounds directly useful
> 
> Some properties of a hierarchical category deserve explication:
> 
> Trailing spaces matter !
> 
> With 1..3-space ("drm: ", "drm:atomic: ", "drm:atomic:fail: "), the
> ":" doesn't terminate the search-space, the trailing space does.  So a
> "drm:" search spec will match all DRM categories & subcategories, and
> will not be useful in an interface where all categories are already
> controlled together.  That said, "drm:atomic:" & "drm:atomic: " are
> different, and both are useful in cases.
> 
> Ad-Hoc sub-categories:
> 
> These have a caveat wrt wrapper macros adding prefixes like
> "drm:atomic: "; the trailing space in the prefix means that
> drm_dbg_atomic("fail: ...") pastes as "drm:atomic: fail: ", which
> obviously isn't ideal wrt clear and simple bitmaps.
> 
> A possible solution is to have a FOO_() version of every FOO() macro
> which (anti-mnemonically) elides the trailing space, which is normally
> inserted by a modified FOO().  Doing this would enforce a policy
> decision that "debug categories will be space terminated", with an
> pressure-relief valve.
> 
> Summarizing:
> 
>  - "drm:kms: " & "drm:kms:" are different
>  - "drm:kms"		also different - includes drm:kms2:
>  - "drm:kms:\t"		also different
>  - "drm:kms:*"		doesn't work, no wildcard on format atm.
> 
> Order matters in DEFINE_DYNAMIC_DEBUG_CATEGORIES(... @bit_descs)
> 
> @bit_descs (array) position determines the bit mapping to the prefix,
> so to keep a stable map, new categories or 3rd level categories must
> be added to the end.
> 
> Since bits are/will-stay applied 0-N, the later bits can countermand
> the earlier ones, but its tricky - consider;
> 
>     DD_CATs(... "drm:atomic:", "drm:atomic:fail:" ) // misleading
> 
> The 1st search-term is misleading, because it includes (modifies)
> subcategories, but then 2nd overrides it.  So don't do that.
> 
> For "drm:atomic:fail:" in particular, its best not to add it into an
> existing bitmap, because the current setting would be lost at every
> (unrelated) write, and a separate bitmap is much more stable.
> 
> There is still plenty of bikeshedding to do.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v5:
> . rename to DEFINE_DYNAMIC_DEBUG_CATEGORIES from DEFINE_DYNDBG_BITMAP
> . in set_dyndbg, replace hardcoded "i915" w kp->mod->name
> . static inline the stubs
> . const *str in structs, const array. - Emil
> . dyndbg: add do-nothing DEFINE_DYNAMIC_DEBUG_CATEGORIES if !DD_CORE
> . call MOD_PARM_DESC(name, "$desc") for users
> . simplify callback, remove bit-change detection
> . config errs reported by <lkp@intel.com>
> 
> v6:
> . return rc, bitmap->, snprintf, ws - Andy Shevchenko
> . s/chgct/matches/ - old varname is misleading
> . move code off file bottom to a "better" place
> . change ##fsname to ##var for safer varname construct
> . workaround for !CONFIG_MODULES
> . move forward decl down to where its needed
> ---
>  include/linux/dynamic_debug.h | 52 +++++++++++++++++++++++-
>  lib/dynamic_debug.c           | 76 ++++++++++++++++++++++++++++++++---
>  2 files changed, 121 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index dce631e678dd..51b7254daee0 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -51,8 +51,6 @@ struct _ddebug {
>  #endif
>  } __attribute__((aligned(8)));
>  
> -
> -
>  #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
>  
>  /* exported for module authors to exercise >control */
> @@ -181,6 +179,10 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>  				   KERN_DEBUG, prefix_str, prefix_type,	\
>  				   rowsize, groupsize, buf, len, ascii)
>  
> +struct kernel_param;
> +int param_set_dyndbg(const char *instr, const struct kernel_param *kp);
> +int param_get_dyndbg(char *buffer, const struct kernel_param *kp);
> +
>  #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
>  
>  #include <linux/string.h>
> @@ -227,6 +229,52 @@ static inline int dynamic_debug_exec_queries(const char *query, const char *modn
>  	return 0;
>  }
>  
> +static inline int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> +	{ return 0; }
> +static inline int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
> +	{ return 0; }
> +
>  #endif /* !CONFIG_DYNAMIC_DEBUG_CORE */
>  
> +struct dyndbg_bitdesc {
> +	/* bitpos is inferred from index in containing array */
> +	const char *prefix;
> +	const char *help;
> +};
> +
> +#if defined(CONFIG_DYNAMIC_DEBUG) || \
> +	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
> +/**
> + * DEFINE_DYNAMIC_DEBUG_CATEGORIES() - define debug categories, bitmap, sysfs-knob
> + * @fsname: parameter basename under /sys
> + * @var:    C-identifier holding state
> + * @_desc:  string summarizing the controls provided
> + * @...:    list of struct dyndbg_bitdesc initializations
> + *
> + * Defines /sys/modules/$modname/parameters/@fsname, and @bit_descs,
> + * which maps bits 0-N to categories of pr_debugs to be controlled.
> + * This is effectively write only, because controlled callsites can be
> + * further modified via >control.
> + *
> + * Also calls MODULE_PARM_DESC(fsname, _desc), with the intent to
> + * generate the bit_legend and apply it to the given bit_descs
> + */
> +#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, _desc, ...)	\
> +	MODULE_PARM_DESC(fsname, _desc);				\
> +	static const struct dyndbg_bitdesc dyndbg_cats_##var[] =	\
> +		{ __VA_ARGS__, { NULL, NULL } };			\
> +	module_param_cb_data(fsname, &param_ops_dyndbg, &var, 0644,	\
> +			     &dyndbg_cats_##var)
> +
> +#define _DD_cat_(pfx)		{ .prefix = pfx, .help = "help for " pfx }
> +#define _DD_cat_help_(pfx)	"\t   " pfx "\t- help for " pfx "\n"
> +
> +extern const struct kernel_param_ops param_ops_dyndbg;
> +#else
> +#define DEFINE_DYNAMIC_DEBUG_CATEGORIES(fsname, var, bitmap_desc, ...) \
> +	MODULE_PARM_DESC(fsname, "auto: " bitmap_desc)
> +#define _DD_cat_(pfx)
> +#define _DD_cat_help_(pfx)
> +#endif
> +
>  #endif
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index cb5abb42c16a..a43427c67c3f 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -511,10 +511,11 @@ static int ddebug_exec_query(char *query_string, const char *modname)
>  	return nfound;
>  }
>  
> -/* handle multiple queries in query string, continue on error, return
> -   last error or number of matching callsites.  Module name is either
> -   in param (for boot arg) or perhaps in query string.
> -*/
> +/*
> + * handle multiple queries in query string, continue on error, return
> + * last error or number of matching callsites.  Module name is either
> + * in param (for boot arg) or perhaps in query string.
> + */
>  static int ddebug_exec_queries(char *query, const char *modname)
>  {
>  	char *split;
> @@ -529,7 +530,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
>  		if (!query || !*query || *query == '#')
>  			continue;
>  
> -		vpr_info("query %d: \"%s\"\n", i, query);
> +		vpr_info("query %d: \"%s\" %s\n", i, query, (modname) ? modname : "");
>  
>  		rc = ddebug_exec_query(query, modname);
>  		if (rc < 0) {
> @@ -577,6 +578,71 @@ int dynamic_debug_exec_queries(const char *query, const char *modname)
>  }
>  EXPORT_SYMBOL_GPL(dynamic_debug_exec_queries);
>  
> +#ifdef MODULES
> +#define KP_MOD_NAME kp->mod->name
> +#else
> +#define KP_MOD_NAME NULL /* wildcard */
> +#endif
> +#define FMT_QUERY_SIZE 128 /* typically need <40 */
> +/**
> + * param_set_dyndbg() - drm.debug style bits=>categories setter
> + * @instr: string echo>d to sysfs
> + * @kp:    struct kernel_param* ->data has bitmap
> + * Exported to support DEFINE_DYNAMIC_DEBUG_CATEGORIES
> + */
> +int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> +{
> +	unsigned long inbits;
> +	int rc, i, matches = 0, totct = 0;
> +	char query[FMT_QUERY_SIZE];
> +	const struct dyndbg_bitdesc *bitmap = kp->data;
> +
> +	if (!bitmap) {
> +		pr_err("set_dyndbg: no bits=>queries map\n");
> +		return -EINVAL;
> +	}
> +	rc = kstrtoul(instr, 0, &inbits);
> +	if (rc) {
> +		pr_err("set_dyndbg: failed\n");
> +		return rc;
> +	}
> +	vpr_info("set_dyndbg: input 0x%lx\n", inbits);
> +
> +	for (i = 0; bitmap->prefix; i++, bitmap++) {
> +		snprintf(query, FMT_QUERY_SIZE, "format '^%s' %cp", bitmap->prefix,
> +			 test_bit(i, &inbits) ? '+' : '-');
> +
> +		matches = ddebug_exec_queries(query, KP_MOD_NAME);
> +
> +		v2pr_info("bit-%d: %d matches on '%s'\n", i, matches, query);
> +		totct += matches;
> +	}
> +	vpr_info("total matches: %d\n", totct);
> +	return 0;
> +}
> +EXPORT_SYMBOL(param_set_dyndbg);
> +
> +/**
> + * param_get_dyndbg() - drm.debug style bitmap to format-prefix categories
> + * @buffer: string returned to user via sysfs
> + * @kp:     struct kernel_param*
> + * Exported to provide required .get interface, not useful.
> + * pr_debugs may be altered after .set via `echo $foo >control`
> + */
> +int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
> +{
> +	return scnprintf(buffer, PAGE_SIZE, "%u\n",
> +			 *((unsigned int *)kp->arg));


If kp->arg is read here, don't we need to set too somewhere? I'm wondering
if the 'get' can use one of the generic ones like param_get_int too? Instead
of a special case here.

Thanks,

-Jason

> +}
> +EXPORT_SYMBOL(param_get_dyndbg);
> +
> +const struct kernel_param_ops param_ops_dyndbg = {
> +	.set = param_set_dyndbg,
> +	.get = param_get_dyndbg,
> +};
> +/* support DEFINE_DYNAMIC_DEBUG_CATEGORIES users */
> +EXPORT_SYMBOL(param_ops_dyndbg);
> +
>  #define PREFIX_SIZE 64
>  
>  static int remaining(int wrote)
> 
