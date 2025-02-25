Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285BA441D4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54B610E6B2;
	Tue, 25 Feb 2025 14:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GH0/jDdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9990 seconds by postgrey-1.36 at gabe;
 Tue, 25 Feb 2025 14:08:39 UTC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362FD10E6B3;
 Tue, 25 Feb 2025 14:08:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68AB3442CE;
 Tue, 25 Feb 2025 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740492517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Czqb92Brl1EGX23HDpCKV1eCwuLVj6SrAdd+HBGJTxI=;
 b=GH0/jDdPwO3/z7mmPPbHLfgzMTO7qwKlmAqypasxHd3uoCPqFmgHYADSRHcTKBXMQ8OAk/
 RIdiB7u5FRXznON51dDomr0eVRO553NjsH+1nfvNLyN57TTLF1QRlxvvwv7f6qMOjiQJ9f
 SM4ICWZVTvwmjS9/Wi6M8PB5oOhpxJ/kZm+Vmbdgwzpbv7rFpqg63tyVRTLy+e/AlcVtal
 JMw7fmQg99V+YuW4+wSVZhSuHEQKfWjj6HpxHL4NwblzoOm8pbNTOMCPqIcAVPdJh/6BCZ
 hrPbDPJQEUAHOFgZLXitgM5JXATh6wVrJd5UZCU/Ee4+2xBVxWALtXQ7fzFnHg==
Date: Tue, 25 Feb 2025 15:08:35 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 05/63] dyndbg: replace classmap list with a vector
Message-ID: <22989ed1-90a4-4acd-9ca0-00f65677ad4f@bootlin.com>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-6-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-6-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
 dhorhhgpdhrtghpthhtohepuhhkrghsiigssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigqdhtrhihsghotheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 25/01/2025 à 07:45, Jim Cromie a écrit :
> Classmaps are stored in an elf section/array, but are individually
> list-linked onto dyndbg's per-module ddebug_table for operation.
> 
> This is unnecessary; even when ddebug_attach_classmap() is handling
> the builtin section (with classmaps for multiple builtin modules), its
> contents are ordered, so a module's possibly multiple classmaps will
> be consecutive in the section, and could be treated as a vector/block,
> since both start-address and subrange length are in the ddebug_info arg.
> 
> IOW, this treats classmaps similarly to _ddebugs, which are already
> kept as vector-refs (address+len).
> 
> So this changes:
> 
> struct ddebug_class_map drops list-head link.
> 
> struct ddebug_table drops the list-head maps, and gets: classes &
> num_classes for the start-address and num_classes, placed to improve
> struct packing.
> 
> The loading: in ddebug_attach_module_classes(), replace the
> for-the-modname list-add loop, with a forloop that finds the module's
> subrange (start,length) of matching classmaps within the possibly
> builtin classmaps vector, and saves those to the ddebug_table.
> 
> The reading/using: change list-foreach loops in ddebug_class_name() &
> ddebug_find_valid_class() to walk the array from start to length.
> 
> Also:
> Move #define __outvar up, above an added use in a fn-prototype.
> Simplify ddebug_attach_module_classes args, ref has both address & len.
> 
> no functional changes
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>   include/linux/dynamic_debug.h |  1 -
>   lib/dynamic_debug.c           | 61 ++++++++++++++++++-----------------
>   2 files changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index b9afc7731b7c..2b0057058ecf 100644
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
> index 55df35df093b..41cbaa96f83d 100644
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
> @@ -147,13 +148,15 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   		  query->first_lineno, query->last_lineno, query->class_string);
>   }
>   
> +#define __outvar /* filled by callee */

Hi Jim,

What is the goal of this __outvar define? I can't find any other #define 
of it in the kernel.

>   static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> -							  const char *class_string, int *class_id)
> +							const char *class_string,
> +							__outvar int *class_id)

The order between __outvar and int is not important? Here you have 
__outvar before int, but later [1] the __outvar is after int.

[1]:https://elixir.bootlin.com/linux/v6.14-rc3/source/lib/dynamic_debug.c#L183

Thanks,
Louis Chauvet

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
> @@ -164,7 +167,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
>   	return NULL;
>   }
>   
> -#define __outvar /* filled by callee */
>   /*
>    * Search the tables for _ddebug's which match the given `query' and
>    * apply the `flags' and `mask' to them.  Returns number of matching
> @@ -1114,9 +1116,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
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
> @@ -1200,30 +1203,31 @@ static const struct proc_ops proc_fops = {
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
> @@ -1256,10 +1260,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
> @@ -1372,8 +1375,8 @@ static void ddebug_remove_all_tables(void)
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

