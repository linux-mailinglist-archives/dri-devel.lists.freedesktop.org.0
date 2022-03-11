Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABD4D6916
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 20:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AA410EA51;
	Fri, 11 Mar 2022 19:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1348 seconds by postgrey-1.36 at gabe;
 Fri, 11 Mar 2022 19:28:45 UTC
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1163510E9F5;
 Fri, 11 Mar 2022 19:28:44 +0000 (UTC)
Received: from pps.filterd (m0122330.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22BI3x7Y030850;
 Fri, 11 Mar 2022 19:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=OJQ8HuWNyY9w5ITLYWLgmONE01T/XxV5i2fYIqkwNpY=;
 b=PfkWUtu4G9JfcqQV+va4ATRnB3lbRKodUKce6CKIj9pKn9/4EjNkXv3dOQ5OZg7I+205
 vThdDzE2OHRiL+tT9lMGA8I+uXetQiQK7ozgUXcbittr6KmXDj+VZfCLdBtXmR1mrGpq
 ZYYIIpfGHg5/V/ROnCz2zbEVvFaIKZc6e9w0HAF050xwCnvS6jQu6o/mRRljLA4lYw4d
 hcLavZt4jCx5u+oV33BCWt1gfIJl/KMGRN2ttyVRvDVcoJNXP9saj+hQt3vUChaEI8rS
 QXjszCEkRI5f9fXwtNxOhHXxI/2yx+TzrLCWkwZebKXBC2m4kIzV5y66DmTGhbXdKeOg Sw== 
Received: from prod-mail-ppoint6 (prod-mail-ppoint6.akamai.com [184.51.33.61]
 (may be forged))
 by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3enqeraw37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 19:06:14 +0000
Received: from pps.filterd (prod-mail-ppoint6.akamai.com [127.0.0.1])
 by prod-mail-ppoint6.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 22BIoDjf004940; Fri, 11 Mar 2022 14:06:13 -0500
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
 by prod-mail-ppoint6.akamai.com with ESMTP id 3em432ts8h-1;
 Fri, 11 Mar 2022 14:06:13 -0500
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 5C59F4C517;
 Fri, 11 Mar 2022 19:06:13 +0000 (GMT)
Message-ID: <823e51e6-2af4-7854-9428-697a2af12488@akamai.com>
Date: Fri, 11 Mar 2022 14:06:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] dyndbg: add class_id field and query support
Content-Language: en-US
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20220311044756.425777-1-jim.cromie@gmail.com>
 <20220311044756.425777-3-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20220311044756.425777-3-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-03-11_07:2022-03-11,
 2022-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110093
X-Proofpoint-ORIG-GUID: no90pff7GmTTWd0Amq2mlXyHU9ab-oOV
X-Proofpoint-GUID: no90pff7GmTTWd0Amq2mlXyHU9ab-oOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_08,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110095
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/22 23:47, Jim Cromie wrote:
> DRM defines/uses 10 enum drm_debug_category's to create exclusive
> classes of debug messages.  To support this directly in dynamic-debug,
> add the following:
> 
> - struct _ddebug.class_id:4 - 4 bits is enough
> - define _DPRINTK_SITE_UNCLASSED 15 - see below
> 
> and the query support:
> - struct _ddebug_query.class_id
> - ddebug_parse_query	- looks for "class" keyword, then calls..
> - parse_class		- accepts uint: 0-15, sets query.class_id and marker
> - vpr_info_dq		- displays new field
> - ddebug_proc_show	- append column with "cls:%d" if !UNCLASSED
> 
> With the patch, one can enable current/unclassed callsites by:
> 
>   #> echo drm class 15 +p > /proc/dynamic_debug/control
> 

To me, this is hard to read, what the heck is '15'? I have to go look it
up in the control file and it's not descriptive. I think that using
classes/categories makes sense but I'm wondering if it can be a bit more
user friendly? Perhaps, we can pass an array of strings that is indexed
by the class id to each pr_debug() site that wants to use class. So
something like:

enum levels {
	LOW,
	MEDIUM,
	HIGH
};

static const char * const level_to_strings[] = {
        [LOW] = "low",
        [MEDIUM] = "medium",
        [HIGH] = "high",
};

And then you'd have a wrapper macros in your driver:

#define module_foo_pr_debug_class(level, fmt, args...)
	pr_debug_class(level, level_to_strings, fmt, args);

Such that call sites look like:

module_foo_pr_debug_class(LOW, fmt, args...);

Such that you're not always passing the strings array around. Now, this
does mean another pointer for struct _ddebug and most wouldn't have it.
Maybe we could just add another linker section for these so as to save
space.

> parse_class() accepts 0 .. _DPRINTK_SITE_UNCLASSED, which allows the
>> control interface to explicitly manipulate unclassed callsites.
> 
> After parsing keywords, ddebug_parse_query() sets .class_id=15, iff it
> wasnt explicitly set.  This allows future classed/categorized
> callsites to be untouched by legacy (class unaware) queries.
> 
> DEFINE_DYNAMIC_DEBUG_METADATA gets _CLS(cls,) suffix and arg, and
> initializes the new .class_id=cls field.  The old name gets the default.
> 
> Then, these _CLS(cls,...) modifications are repeated up through the
> stack of *dynamic_func_call* macros that use the METADATA initializer,
> so as to actually supply the category into it.
> 
> NOTES:
> 
> _DPRINTK_SITE_UNCLASSED: this symbol is used to initialize all
> existing/unclassed pr-debug callsites.  Normally, the default would be
> zero, but DRM_UT_CORE "uses" that value, in the sense that 0 is
> exposed as a bit position in drm.debug.  Using 15 allows identity
> mapping from category to class, avoiding fiddly offsets.
> 
> Default .class_id = 15 means that ``echo +p > control`` no longer
> toggles ALL the callsites, only the unclassed ones.  This was only
> useful for static-branch toggle load testing anyway.
> 

I think that # echo +p > control should continue to work as is, why
should the introduction of classes change that ?

> RFC:
> 
> The new _CLS macro flavor gets a warning from DRM/dri-devel's CI,
> but not from checkpatch (on this subject).
> 
> a8f6c71f283e dyndbg: add class_id field and query support
> -:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-effects?
> +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
> +	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
> +	if (DYNAMIC_DEBUG_BRANCH(id))				\
> +		func(&id, ##__VA_ARGS__);			\
>  } while (0)
> 
> I couldn't fix it with a ``typeof(id) _id = id`` construct.  I haven't
> seen the warning myself, on the _CLS extended macro, nor the original.
> 
> CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  .../admin-guide/dynamic-debug-howto.rst       |  7 +++
>  include/linux/dynamic_debug.h                 | 54 ++++++++++++++-----
>  lib/dynamic_debug.c                           | 48 ++++++++++++++---
>  3 files changed, 88 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index a89cfa083155..8ef8d7dcd140 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -35,6 +35,7 @@ Dynamic debug has even more useful features:
>     - line number (including ranges of line numbers)
>     - module name
>     - format string
> +   - class number:0-15
>  
>   * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
>     which can be read to display the complete list of known debug
> @@ -143,6 +144,7 @@ against.  Possible keywords are:::
>  		 'module' string |
>  		 'format' string |
>  		 'line' line-range
> +		 'class' integer:[0-15]
>  
>    line-range ::= lineno |
>  		 '-'lineno |
> @@ -217,6 +219,11 @@ line
>  	line -1605          // the 1605 lines from line 1 to line 1605
>  	line 1600-          // all lines from line 1600 to the end of the file
>  
> +class
> +    This expects a single integer in range: 0-15.
> +    15 is used/reserved for existing/unclassed callsites,
> +    and is defaulted in unless specified to >control
> +
>  The flags specification comprises a change operation followed
>  by one or more flag characters.  The change operation is one
>  of the characters::
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index dce631e678dd..d4b48f3cc6e8 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -6,6 +6,8 @@
>  #include <linux/jump_label.h>
>  #endif
>  
> +#include <linux/build_bug.h>
> +
>  /*
>   * An instance of this structure is created in a special
>   * ELF section at every dynamic debug callsite.  At runtime,
> @@ -21,6 +23,9 @@ struct _ddebug {
>  	const char *filename;
>  	const char *format;
>  	unsigned int lineno:18;
> +#define CLS_BITS 4
> +	unsigned int class_id:CLS_BITS;
> +#define _DPRINTK_SITE_UNCLASSED		((1 << CLS_BITS) - 1)
>  	/*
>  	 * The flags field controls the behaviour at the callsite.
>  	 * The bits here are changed dynamically when the user
> @@ -87,7 +92,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>  			 const struct ib_device *ibdev,
>  			 const char *fmt, ...);
>  
> -#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
> +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
>  	static struct _ddebug  __aligned(8)			\
>  	__section("__dyndbg") name = {				\
>  		.modname = KBUILD_MODNAME,			\
> @@ -96,8 +101,14 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>  		.format = (fmt),				\
>  		.lineno = __LINE__,				\
>  		.flags = _DPRINTK_FLAGS_DEFAULT,		\
> +		.class_id = cls,				\
>  		_DPRINTK_KEY_INIT				\
> -	}
> +	};							\
> +	BUILD_BUG_ON_MSG(cls > _DPRINTK_SITE_UNCLASSED,		\
> +			 "classid value overflow")
> +
> +#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
> +	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_SITE_UNCLASSED, fmt)
>  
>  #ifdef CONFIG_JUMP_LABEL
>  
> @@ -128,18 +139,26 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>  
>  #endif /* CONFIG_JUMP_LABEL */
>  
> -#define __dynamic_func_call(id, fmt, func, ...) do {	\
> -	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);		\
> -	if (DYNAMIC_DEBUG_BRANCH(id))			\
> -		func(&id, ##__VA_ARGS__);		\
> +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
> +	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
> +	if (DYNAMIC_DEBUG_BRANCH(id))				\
> +		func(&id, ##__VA_ARGS__);			\
>  } while (0)
>  
> -#define __dynamic_func_call_no_desc(id, fmt, func, ...) do {	\
> -	DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);			\
> -	if (DYNAMIC_DEBUG_BRANCH(id))				\
> -		func(__VA_ARGS__);				\
> +#define __dynamic_func_call_no_desc_cls(id, cls, fmt, func, ...) do {	\
> +	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
> +	if (DYNAMIC_DEBUG_BRANCH(id))					\
> +		func(__VA_ARGS__);					\
>  } while (0)
>  
> +#define __dynamic_func_call(id, fmt, func, ...)				\
> +	__dynamic_func_call_cls(id, _DPRINTK_SITE_UNCLASSED,		\
> +				fmt, func, ##__VA_ARGS__)
> +
> +#define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
> +	__dynamic_func_call_no_desc_cls(id, _DPRINTK_SITE_UNCLASSED,	\
> +					fmt, func, ##__VA_ARGS__)
> +
>  /*
>   * "Factory macro" for generating a call to func, guarded by a
>   * DYNAMIC_DEBUG_BRANCH. The dynamic debug descriptor will be
> @@ -148,15 +167,24 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>   * the varargs. Note that fmt is repeated in invocations of this
>   * macro.
>   */
> +#define _dynamic_func_call_cls(cls, fmt, func, ...)			\
> +	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
>  #define _dynamic_func_call(fmt, func, ...)				\
> -	__dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
> +	_dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__VA_ARGS__)
> +
>  /*
>   * A variant that does the same, except that the descriptor is not
>   * passed as the first argument to the function; it is only called
>   * with precisely the macro's varargs.
>   */
> -#define _dynamic_func_call_no_desc(fmt, func, ...)	\
> -	__dynamic_func_call_no_desc(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
> +#define _dynamic_func_call_no_desc_cls(fmt, cat, func, ...)		\
> +	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug), cat,	\
> +					fmt, func, ##__VA_ARGS__)
> +
> +#define _dynamic_func_call_no_desc(fmt, func, ...)			\
> +	__dynamic_func_call_no_desc_cls(__UNIQUE_ID(ddebug),		\
> +					_DPRINTK_SITE_UNCLASSED,	\
> +					fmt, func, ##__VA_ARGS__)
>  
>  #define dynamic_pr_debug(fmt, ...)				\
>  	_dynamic_func_call(fmt,	__dynamic_pr_debug,		\
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index a56c1286ffa4..ee2129becacc 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -55,6 +55,8 @@ struct ddebug_query {
>  	const char *function;
>  	const char *format;
>  	unsigned int first_lineno, last_lineno;
> +	unsigned int class_id;
> +	unsigned int class_marked:1;
>  };
>  
>  struct ddebug_iter {
> @@ -134,13 +136,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>  			fmtlen--;
>  	}
>  
> -	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
> -		 msg,
> -		 query->function ?: "",
> -		 query->filename ?: "",
> -		 query->module ?: "",
> -		 fmtlen, query->format ?: "",
> -		 query->first_lineno, query->last_lineno);
> +	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%u\n",
> +		  msg,
> +		  query->function ?: "",
> +		  query->filename ?: "",
> +		  query->module ?: "",
> +		  fmtlen, query->format ?: "",
> +		  query->first_lineno, query->last_lineno, query->class_id);
>  }
>  
>  /*
> @@ -170,6 +172,10 @@ static int ddebug_change(const struct ddebug_query *query,
>  		for (i = 0; i < dt->num_ddebugs; i++) {
>  			struct _ddebug *dp = &dt->ddebugs[i];
>  
> +			/* match against the class_id, either given or default */
> +			if (query->class_id != dp->class_id)
> +				continue;
> +

Could that instead be:

if (query->class_id != _DPRINTK_SITE_UNCLASSED && query->class_id != dp->class_id)
	continue;

That way by default we fall through and enable callsites for queries that do not have
the 'class' keyboard specified. I think I would also disallow setting
_DPRINTK_SITE_UNCLASSED explicitly since it would now mean 'class *', and what if
we expand class_id size to greater than 15 at some point?

>  			/* match against the source filename */
>  			if (query->filename &&
>  			    !match_wildcard(query->filename, dp->filename) &&
> @@ -308,6 +314,21 @@ static inline int parse_lineno(const char *str, unsigned int *val)
>  	return 0;
>  }
>  
> +static inline int parse_class(struct ddebug_query *query, const char *str)
> +{
> +	int rc;
> +	unsigned int val;
> +
> +	rc = kstrtouint(str, 10, &val);
> +	if (rc < 0 || val > _DPRINTK_SITE_UNCLASSED) {
> +		pr_err("expecting class:[0-%d], not %s\n", _DPRINTK_SITE_UNCLASSED, str);
> +		return -EINVAL;
> +	}
> +	query->class_id = val;
> +	query->class_marked = 1;
> +	return 0;
> +}
> +
>  static int parse_linerange(struct ddebug_query *query, const char *first)
>  {
>  	char *last = strchr(first, '-');
> @@ -421,6 +442,9 @@ static int ddebug_parse_query(char *words[], int nwords,
>  		} else if (!strcmp(keyword, "line")) {
>  			if (parse_linerange(query, arg))
>  				return -EINVAL;
> +		} else if (!strcmp(keyword, "class")) {
> +			if (parse_class(query, arg))
> +				return -EINVAL;
>  		} else {
>  			pr_err("unknown keyword \"%s\"\n", keyword);
>  			return -EINVAL;
> @@ -428,6 +452,10 @@ static int ddebug_parse_query(char *words[], int nwords,
>  		if (rc)
>  			return rc;
>  	}
> +	/* post-validate the query, set default */
> +	if (!query->class_marked)
> +		query->class_id = _DPRINTK_SITE_UNCLASSED;
> +
>  	vpr_info_dq(query, "parsed");
>  	return 0;
>  }
> @@ -900,7 +928,11 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>  		   iter->table->mod_name, dp->function,
>  		   ddebug_describe_flags(dp->flags, &flags));
>  	seq_escape(m, dp->format, "\t\r\n\"");
> -	seq_puts(m, "\"\n");
> +	seq_puts(m, "\"");
> +
> +	if (dp->class_id != _DPRINTK_SITE_UNCLASSED)
> +		seq_printf(m, " cls:%u", dp->class_id);
> +	seq_puts(m, "\n");
>  
>  	return 0;
>  }
