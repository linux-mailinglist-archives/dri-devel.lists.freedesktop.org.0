Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29817A441F4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ED910E6C4;
	Tue, 25 Feb 2025 14:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EsmCl6f0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3358210E6B6;
 Tue, 25 Feb 2025 14:10:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B422442ED;
 Tue, 25 Feb 2025 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740492647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSziKazrLQBPC9Hdv4UIzzMr4t3jz3ERJ3wqC34N1TE=;
 b=EsmCl6f0l6xPYu5owmf2u8KWxNkunWYVtQx1OrwBl8xy6o7hdJowsrZVo5l5LEEjZIHoLE
 w26CoBbEJixvm98R2xjryCUDWAAbN3seBMmJxKIQ+BtYOS/8NAkguXIbtSTzc5F4oOhxYo
 Uo+KzayX66uCFTblz/5iFzFzMxZBa1Gb1tLH0/KkrhOdgubZJ1emd/7fUnWItNpDiZtSCx
 Acer8d5Zs5NAwrCorwrcpmGWrZxUMm0l8gPac6m2t7DFN2LcQq/F9H3DhEMbJi+rihNpgy
 VEG1K8AYmx/AKLXSQy66ugTlgdImKBVXtSvxRiGhLVajSZAUR+wlX4JOEk1X1A==
Date: Tue, 25 Feb 2025 15:10:44 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 10/63] dyndbg: silence debugs with no-change updates
Message-ID: <6277e777-18b5-46c0-9f13-ab6b1c61faf9@bootlin.com>
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
 <20250125064619.8305-11-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-11-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
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
> In ddebug_apply_class_bitmap(), check for actual changes to the bits
> before announcing them, to declutter logs.
> 
> no functional change.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/dynamic_debug.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 1b2fb6502e61..c27965180a49 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -595,7 +595,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
>   	return nfound;
>   }
>   
> -/* apply a new bitmap to the sys-knob's current bit-state */
> +/* apply a new class-param setting */
>   static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   				     unsigned long *new_bits, unsigned long *old_bits,
>   				     const char *query_modname)
> @@ -606,8 +606,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   	int matches = 0;
>   	int bi, ct;
>   
> -	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
> -		  query_modname ?: "");
> +	if (*new_bits != *old_bits)
> +		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
> +			  *old_bits, query_modname ?: "'*'");
>   
>   	for (bi = 0; bi < map->length; bi++) {
>   		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
> @@ -622,8 +623,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
>   			  ct, map->class_names[bi], *new_bits);
>   	}
> -	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
> -		  query_modname ?: "");
> +	if (*new_bits != *old_bits)
> +		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
> +			  *old_bits, query_modname ?: "'*'");
>   
>   	return matches;
>   }

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

