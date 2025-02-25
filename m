Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A59CA442A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9445B10E6DF;
	Tue, 25 Feb 2025 14:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UxkQG5db";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5355410E6DF;
 Tue, 25 Feb 2025 14:27:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 551F04442F;
 Tue, 25 Feb 2025 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740493641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksF7rsjoy0iP9hn3MuB5+OiMn4k7YbnH9STHuf8uDAI=;
 b=UxkQG5dbGt+tSDyvxdAcaQ/tAsfRGtqmGzlChs+y3LOyB+9jX5jmFEjf72H1Ggym+k/DOC
 VB3I5kz6N9L6lZ4Mh3gX6BB+QcUYL30eCPPQlmM/XCzXNNTv7zYUs1vxP2lAVe0HjVAMu+
 TC/x4zncUiWxlS3OzqnZYt7X24Q8eNWpD2rvWIVLIR0AGOKXHVRSdu306xqArgB4vKd4hT
 8+BCY2Evu4EA03yeu6W6+0QVlzUv0bPTcDnzp5mBrxb4XerQG8iwEtOslZ3ZYh85v/LXrp
 2AWL+RWAavDiFqE8FmNarRvJGRjPi8fPlPTtI1/SeqXW4VqM7lZHMIuMecz/7g==
Date: Tue, 25 Feb 2025 15:27:19 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 23/63] dyndbg: fail modprobe on
 ddebug_class_range_overlap()
Message-ID: <6234628f-4085-40ad-b521-4590db2cb5f5@bootlin.com>
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
 <20250125064619.8305-24-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-24-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
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
> 1. All classes used by a module (declared DYNDBG_CLASSMAP_{DEFINE,USE}
> by module code) must share 0..62 class-id space; ie their respective
> base,+length reservations shouldn't overlap.  Overlaps would lead to
> unintended changes in ddebug enablements.
> 
> Detecting these class-id range overlaps at compile-time would be ideal
> but is not obvious how; failing at modprobe at least insures that the
> developer sees and fixes the conflict.
> 
> ddebug_class_range_overlap() implements the range check, accumulating
> the reserved-ids as it examines each class.  It probably should use
> bitmaps.
> 
> A previous commit reworked the modprobe callchain to allow failure,
> now call ddebug_class_range_overlap() to check when classid conflicts
> happen, and signal that failure.
> 
> NB: this can only happen when a module defines+uses several classmaps,
> 
> TBD: failing modprobe is kinda harsh, maybe warn and proceed ?
> 
> test_dynamic_debug*.ko:
> 
> If built with -DFORCE_CLASSID_CONFLICT_MODPROBE, the modules get 2 bad
> DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
> conflict with one of the good ones in the parent (D2_CORE..etc),
> causing the modprobe(s) to fail.  TODO: do in submod only, since fail
> of parent prevents submod from ever trying.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> ---
>   lib/dynamic_debug.c      | 30 ++++++++++++++++++++++++------
>   lib/test_dynamic_debug.c | 11 ++++++++++-
>   2 files changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 8afcd4111531..8e1e087e07c3 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -1211,6 +1211,21 @@ static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *m
>   	}
>   }
>   
> +static int ddebug_class_range_overlap(struct ddebug_class_map *cm,
> +				      u64 *reserved_ids)
> +{
> +	u64 range = (((1ULL << cm->length) - 1) << cm->base);
> +
> +	if (range & *reserved_ids) {
> +		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
> +		       cm->base + cm->length - 1, cm->class_names[0],
> +		       *reserved_ids);
> +		return -EINVAL;
> +	}
> +	*reserved_ids |= range;
> +	return 0;
> +}
> +
>   /*
>    * scan the named array: @_vec, ref'd from inside @_box, for the
>    * start,len of the sub-array of elements matching on ->mod_name;
> @@ -1242,9 +1257,11 @@ static int ddebug_module_apply_class_maps(struct ddebug_table *dt,
>   	struct ddebug_class_map *cm;
>   	int i;
>   
> -	for_subvec(i, cm, &dt->info, maps)
> +	for_subvec(i, cm, &dt->info, maps) {
> +		if (ddebug_class_range_overlap(cm, reserved_ids))
> +			return -EINVAL;
>   		ddebug_apply_params(cm, cm->mod_name);
> -
> +	}
>   	vpr_info("module:%s attached %d classmaps\n", dt->mod_name, dt->info.maps.len);
>   	return 0;
>   }
> @@ -1255,10 +1272,11 @@ static int ddebug_module_apply_class_users(struct ddebug_table *dt,
>   	struct ddebug_class_user *cli;
>   	int i;
>   
> -	/* now iterate dt */
> -	for_subvec(i, cli, &dt->info, users)
> +	for_subvec(i, cli, &dt->info, users) {
> +		if (ddebug_class_range_overlap(cli->map, reserved_ids))
> +			return -EINVAL;
>   		ddebug_apply_params(cli->map, cli->mod_name);
> -
> +	}
>   	vpr_info("module:%s attached %d classmap uses\n", dt->mod_name, dt->info.users.len);
>   	return 0;
>   }
> @@ -1311,11 +1329,11 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   			return rc;
>   		}
>   	}
> +
>   	mutex_lock(&ddebug_lock);
>   	list_add_tail(&dt->link, &ddebug_tables);
>   	mutex_unlock(&ddebug_lock);
>   
> -

Hi Jim,

Strange line issues, can you squash it with the correct patch?

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,

>   	if (dt->info.users.len) {
>   		rc = ddebug_module_apply_class_users(dt, &reserved_ids);
>   		if (rc)
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index b1555b0a2bb1..74b98adc4ed0 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -81,7 +81,7 @@ enum cat_disjoint_bits {
>   	D2_DRMRES };
>   
>   /* numeric verbosity, V2 > V1 related */
> -enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
> +enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
>   
>   /* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
>   #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
> @@ -90,6 +90,7 @@ enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
>    * classmaps on the client enums above, and then declares the PARAMS
>    * ref'g the classmaps.  Each is exported.
>    */
> +
>   DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
>   		       D2_CORE,
>   		       "D2_CORE",
> @@ -113,6 +114,14 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
>   DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
>   DYNDBG_CLASSMAP_PARAM(level_num, p);
>   
> +#ifdef FORCE_CLASSID_CONFLICT_MODPROBE
> +/*
> + * Enable with -Dflag on compile to test overlapping class-id range
> + * detection.  This should break on modprobe.
> + */
> +DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
> +#endif
> +
>   #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
>   
>   /*

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

