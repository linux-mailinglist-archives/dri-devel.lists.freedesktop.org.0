Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BA5B0C64
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 20:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CE810E822;
	Wed,  7 Sep 2022 18:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F8110E81F;
 Wed,  7 Sep 2022 18:19:32 +0000 (UTC)
Received: from pps.filterd (m0050093.ppops.net [127.0.0.1])
 by m0050093.ppops.net-00190b01. (8.17.1.5/8.17.1.5) with ESMTP id
 287HVasv032356; Wed, 7 Sep 2022 19:19:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=pAAAZ4N91jNAxfB3MZbN+Hr8QUu9dLU0om6B6c+CNPg=;
 b=kID3whC70e5d0nnXBW/pBoM0ZjBRFC3o3xhYo79LDb0MDCpWmEI5oxPFBNdXHC5s7iPb
 1Z0zA4LlUr3OtlYHBCtrydA5cQZa0VGtIhiBDL7mAgUk96uJt8qJRGK77mq0qQQs+hJX
 vyIWaW8qrtG/EJUO9bYdSUBv3hePttTeniUKSFE2/eUjas5chSEwPtAxUwCPq2whx8+3
 56JJ1OguZcXUnE1kCbwm2tVpdYxD2Is1kFAdcdNT1bpVFyMVPsh3zZk7JVfJIzVfx2xY
 0TDKFMv2Qheq7UITOoQOFSVg6sqJANzcw0ekxe8McZDk8UFAkaWRv2LfL8IPvORAnX69 JA== 
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60]
 (may be forged))
 by m0050093.ppops.net-00190b01. (PPS) with ESMTPS id 3je07est5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 19:19:28 +0100
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
 by prod-mail-ppoint5.akamai.com (8.17.1.5/8.17.1.5) with ESMTP id
 287HnKQD008298; Wed, 7 Sep 2022 11:19:27 -0700
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
 by prod-mail-ppoint5.akamai.com (PPS) with ESMTP id 3jc4w9xb0s-1;
 Wed, 07 Sep 2022 11:19:27 -0700
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay11.akamai.com (Postfix) with ESMTP id E7C512ED41;
 Wed,  7 Sep 2022 18:19:26 +0000 (GMT)
Message-ID: <2d3846cb-ff9a-3484-61a8-973799727d8f@akamai.com>
Date: Wed, 7 Sep 2022 14:19:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 17/57] dyndbg: validate class FOO by checking with
 module
Content-Language: en-US
To: Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-18-jim.cromie@gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20220904214134.408619-18-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209070069
X-Proofpoint-GUID: X8jGmyYHpuMt6qCmp30gNLbLd31u9Ys_
X-Proofpoint-ORIG-GUID: X8jGmyYHpuMt6qCmp30gNLbLd31u9Ys_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209070069
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
Cc: joe@perches.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 linux@rasmusvillemoes.dk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/4/22 17:40, Jim Cromie wrote:
> Add module-to-class validation:
> 
>   #> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> 
> If a query has "class FOO", then ddebug_find_valid_class(), called
> from ddebug_change(), requires that FOO is known to module X,
> otherwize the query is skipped entirely for X.  This protects each
> module's class-space, other than the default:31.
> 
> The authors' choice of FOO is highly selective, giving isolation
> and/or coordinated sharing of FOOs.  For example, only DRM modules
> should know and respond to DRM_UT_KMS.
> 
> So this, combined with module's opt-in declaration of known classes,
> effectively privatizes the .class_id space for each module (or
> coordinated set of modules).
> 
> Notes:
> 
> For all "class FOO" queries, ddebug_find_valid_class() is called, it
> returns the map matching the query, and sets valid_class via an
> *outvar).
> 
> If no "class FOO" is supplied, valid_class = _CLASS_DFLT.  This
> insures that legacy queries do not trample on new class'd callsites,
> as they get added.


Hi Jim,

I'm wondering about the case where we have a callsite which is marked
as 'class foo', but the query string is done by say module and file, so:

# echo "module bar file foo.c +p" > /proc/dynamic_debug_control

With the proposed code, I think this ends up not enabling anything right?
Because valid class is set to _DPRINTK_CLASS_DFLT and then:
'dp->class_id != valid_class' is true?

This seems confusing to me as a user as this doesn't work like the
other queries....so maybe we should only do the
'dp->class_id != valid_class' check *if* query->class_string is set,
see below.



> 
> Also add a new column to control-file output, displaying non-default
> class-name (when found) or the "unknown _id:", if it has not been
> (correctly) declared with one of the declarator macros.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  lib/dynamic_debug.c | 76 ++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 68 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index b71efd0b491d..db96ded78c3f 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -56,6 +56,7 @@ struct ddebug_query {
>  	const char *module;
>  	const char *function;
>  	const char *format;
> +	const char *class_string;
>  	unsigned int first_lineno, last_lineno;
>  };
>  
> @@ -136,15 +137,33 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
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
> +	v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%s\n",
> +		  msg,
> +		  query->function ?: "",
> +		  query->filename ?: "",
> +		  query->module ?: "",
> +		  fmtlen, query->format ?: "",
> +		  query->first_lineno, query->last_lineno, query->class_string);
>  }
>  
> +static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> +							  const char *class_string, int *class_id)
> +{
> +	struct ddebug_class_map *map;
> +	int idx;
> +
> +	list_for_each_entry(map, &dt->maps, link) {
> +		idx = match_string(map->class_names, map->length, class_string);
> +		if (idx >= 0) {
> +			*class_id = idx + map->base;
> +			return map;
> +		}
> +	}
> +	*class_id = -ENOENT;
> +	return NULL;
> +}
> +
> +#define __outvar /* filled by callee */
>  /*
>   * Search the tables for _ddebug's which match the given `query' and
>   * apply the `flags' and `mask' to them.  Returns number of matching
> @@ -159,6 +178,8 @@ static int ddebug_change(const struct ddebug_query *query,
>  	unsigned int newflags;
>  	unsigned int nfound = 0;
>  	struct flagsbuf fbuf, nbuf;
> +	struct ddebug_class_map *map = NULL;
> +	int __outvar valid_class;
>  
>  	/* search for matching ddebugs */
>  	mutex_lock(&ddebug_lock);
> @@ -169,9 +190,22 @@ static int ddebug_change(const struct ddebug_query *query,
>  		    !match_wildcard(query->module, dt->mod_name))
>  			continue;
>  
> +		if (query->class_string) {
> +			map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
> +			if (!map)
> +				continue;

So remove the else here.

> +		} else {
> +			/* constrain query, do not touch class'd callsites */
> +			valid_class = _DPRINTK_CLASS_DFLT;
> +		}
> +
>  		for (i = 0; i < dt->num_ddebugs; i++) {
>  			struct _ddebug *dp = &dt->ddebugs[i];
>  
> +			/* match site against query-class */
> +			if (dp->class_id != valid_class)

And then make this: if (query->class_string && (dp->class_id != valid_class))

thoughts?


> +				continue;
> +>  			/* match against the source filename */
>  			if (query->filename &&
>  			    !match_wildcard(query->filename, dp->filename) &&
> @@ -420,6 +454,8 @@ static int ddebug_parse_query(char *words[], int nwords,
>  		} else if (!strcmp(keyword, "line")) {
>  			if (parse_linerange(query, arg))
>  				return -EINVAL;
> +		} else if (!strcmp(keyword, "class")) {
> +			rc = check_set(&query->class_string, arg, "class");
>  		} else {
>  			pr_err("unknown keyword \"%s\"\n", keyword);
>  			return -EINVAL;
> @@ -854,6 +890,20 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>  	return dp;
>  }
>  
> +#define class_in_range(class_id, map)					\
> +	(class_id >= map->base && class_id < map->base + map->length)
> +
> +static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
> +{
> +	struct ddebug_class_map *map;
> +
> +	list_for_each_entry(map, &iter->table->maps, link)
> +		if (class_in_range(dp->class_id, map))
> +			return map->class_names[dp->class_id - map->base];
> +
> +	return NULL;
> +}
> +
>  /*
>   * Seq_ops show method.  Called several times within a read()
>   * call from userspace, with ddebug_lock held.  Formats the
> @@ -865,6 +915,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>  	struct ddebug_iter *iter = m->private;
>  	struct _ddebug *dp = p;
>  	struct flagsbuf flags;
> +	char const *class;
>  
>  	if (p == SEQ_START_TOKEN) {
>  		seq_puts(m,
> @@ -877,7 +928,16 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>  		   iter->table->mod_name, dp->function,
>  		   ddebug_describe_flags(dp->flags, &flags));
>  	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
> -	seq_puts(m, "\"\n");
> +	seq_puts(m, "\"");
> +
> +	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
> +		class = ddebug_class_name(iter, dp);
> +		if (class)
> +			seq_printf(m, " class:%s", class);
> +		else
> +			seq_printf(m, " class unknown, _id:%d", dp->class_id);
> +	}
> +	seq_puts(m, "\n");
>  
>  	return 0;
>  }
