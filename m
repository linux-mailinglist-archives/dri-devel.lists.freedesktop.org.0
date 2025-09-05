Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3CDB46518
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 23:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43E710EC4B;
	Fri,  5 Sep 2025 21:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YD8wDSHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AED710EC4B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 21:02:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 40806C6B3A4;
 Fri,  5 Sep 2025 21:02:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 694F46060B;
 Fri,  5 Sep 2025 21:02:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDE88102F1C8A; 
 Fri,  5 Sep 2025 23:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757106145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=ExdzWw67PaWGzg7Z5piHDWtNq1rfxCII2urF1nxJe0M=;
 b=YD8wDSHeok3YH2eg0Zj00Uy5f8ssu69MsUAHhHDF/rLjk+xuli6mstbSuOcNlHoswekCQj
 dS3luwHielTveZ7KfIXhUiKkZkEWhCdqSi+OwFMeeZGVlzMoEnBfEXKN1IbER2n99ELIFo
 ICG6TFlizR70Vya3dp8C9upQXm9z3Og5ehmWmaz9KEso8dl3TT0ecr6YaTA9TqjJWbKN+4
 MX2E7wEFscznNjkT7XsFO8xTxMFGZWxLGtpY2EPOQKTwE7FapVay7ZkrfZ4sdjQ6H0neTM
 6URDtdaRn6bM1EQRre7ZZ6XVyUxVav9Q9+aleT9uALlgSuKSly+5Z6XmB4+acA==
Message-ID: <f263e15e-87f1-44e0-8337-6e0b82187c16@bootlin.com>
Date: Fri, 5 Sep 2025 23:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/58] dyndbg: replace classmap list with a vector
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org,
 robdclark@gmail.com, groeck@google.com, yanivt@google.com,
 bleung@google.com, quic_saipraka@quicinc.com, will@kernel.org,
 catalin.marinas@arm.com, quic_psodagud@quicinc.com, maz@kernel.org,
 arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com
References: <20250803035816.603405-1-jim.cromie@gmail.com>
 <20250803035816.603405-12-jim.cromie@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250803035816.603405-12-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 03/08/2025 à 05:57, Jim Cromie a écrit :
> Classmaps are stored in an elf section/array, but currently are
> individually list-linked onto dyndbg's per-module ddebug_table for
> operation. This is unnecessary.
> 
> Just like dyndbg's descriptors, classes are packed in compile order;
> so even with many builtin modules employing multiple classmaps, each
> modules' maps are packed contiguously, and can be treated as a
> array-start-address & array-length.
> 
> So this drops the whole list building operation done in
> ddebug_attach_module_classes(), and removes the list-head members.
> The "select-by-modname" condition is reused to find the start,end of
> the subrange.
> 
> NOTE: This "filter-by-modname" on classmaps should really be done in
> ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
> which already splits up pr-debug descriptors into subranges by
> modname, then calls (1) on each.  (2) knows nothing of classmaps
> currently, and doesn't need to.  For now, just add comment.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> v3- drop __outvar as promising magic it doesnt have
> ---
>   include/linux/dynamic_debug.h |  1 -
>   lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
>   2 files changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index ac199293d2032..e458d4b838ac3 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -83,7 +83,6 @@ enum class_map_type {
>   };
>   
>   struct ddebug_class_map {
> -	struct list_head link;
>   	struct module *mod;
>   	const char *mod_name;	/* needed for builtins */
>   	const char **class_names;
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 08d095dd19ef4..283926530a43b 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
>   extern struct ddebug_class_map __stop___dyndbg_classes[];
>   
>   struct ddebug_table {
> -	struct list_head link, maps;
> +	struct list_head link;
>   	const char *mod_name;
> -	unsigned int num_ddebugs;
>   	struct _ddebug *ddebugs;
> +	struct ddebug_class_map *classes;
> +	unsigned int num_ddebugs, num_classes;
>   };
>   
>   struct ddebug_query {
> @@ -148,12 +149,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   }
>   
>   static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> -							  const char *class_string, int *class_id)
> +							const char *class_string,
> +							int *class_id)
>   {
>   	struct ddebug_class_map *map;
> -	int idx;
> +	int i, idx;
>   
> -	list_for_each_entry(map, &dt->maps, link) {
> +	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
>   		idx = match_string(map->class_names, map->length, class_string);
>   		if (idx >= 0) {
>   			*class_id = idx + map->base;
> @@ -164,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
>   	return NULL;
>   }
>   
> -#define __outvar /* filled by callee */
>   /*
>    * Search the tables for _ddebug's which match the given `query' and
>    * apply the `flags' and `mask' to them.  Returns number of matching
> @@ -180,7 +181,7 @@ static int ddebug_change(const struct ddebug_query *query,
>   	unsigned int nfound = 0;
>   	struct flagsbuf fbuf, nbuf;
>   	struct ddebug_class_map *map = NULL;
> -	int __outvar valid_class;
> +	int valid_class;
>   
>   	/* search for matching ddebugs */
>   	mutex_lock(&ddebug_lock);
> @@ -1122,9 +1123,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>   
>   static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
>   {
> -	struct ddebug_class_map *map;
> +	struct ddebug_class_map *map = iter->table->classes;
> +	int i, nc = iter->table->num_classes;
>   
> -	list_for_each_entry(map, &iter->table->maps, link)
> +	for (i = 0; i < nc; i++, map++)
>   		if (class_in_range(dp->class_id, map))
>   			return map->class_names[dp->class_id - map->base];
>   
> @@ -1208,30 +1210,31 @@ static const struct proc_ops proc_fops = {
>   	.proc_write = ddebug_proc_write
>   };
>   
> -static void ddebug_attach_module_classes(struct ddebug_table *dt,
> -					 struct ddebug_class_map *classes,
> -					 int num_classes)
> +static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
>   {
>   	struct ddebug_class_map *cm;
> -	int i, j, ct = 0;
> +	int i, nc = 0;
>   
> -	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
> +	/*
> +	 * Find this module's classmaps in a subrange/wholerange of
> +	 * the builtin/modular classmap vector/section.  Save the start
> +	 * and length of the subrange at its edges.
> +	 */
> +	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
>   
>   		if (!strcmp(cm->mod_name, dt->mod_name)) {
> -
> -			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
> -				  cm->mod_name, cm->base, cm->length, cm->map_type);
> -
> -			for (j = 0; j < cm->length; j++)
> -				v3pr_info(" %d: %d %s\n", j + cm->base, j,
> -					  cm->class_names[j]);
> -
> -			list_add(&cm->link, &dt->maps);
> -			ct++;
> +			if (!nc) {
> +				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
> +					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
> +				dt->classes = cm;
> +			}
> +			nc++;
>   		}
>   	}
> -	if (ct)
> -		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
> +	if (nc) {
> +		dt->num_classes = nc;
> +		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> +	}
>   }
>   
>   /*
> @@ -1263,10 +1266,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	dt->num_ddebugs = di->num_descs;
>   
>   	INIT_LIST_HEAD(&dt->link);
> -	INIT_LIST_HEAD(&dt->maps);
>   
>   	if (di->classes && di->num_classes)
> -		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
> +		ddebug_attach_module_classes(dt, di);
>   
>   	mutex_lock(&ddebug_lock);
>   	list_add_tail(&dt->link, &ddebug_tables);
> @@ -1379,8 +1381,8 @@ static void ddebug_remove_all_tables(void)
>   	mutex_lock(&ddebug_lock);
>   	while (!list_empty(&ddebug_tables)) {
>   		struct ddebug_table *dt = list_entry(ddebug_tables.next,
> -						      struct ddebug_table,
> -						      link);
> +						     struct ddebug_table,
> +						     link);
>   		ddebug_table_free(dt);
>   	}
>   	mutex_unlock(&ddebug_lock);

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

