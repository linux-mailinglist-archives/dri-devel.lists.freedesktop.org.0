Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B3A441EE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FF110E6BE;
	Tue, 25 Feb 2025 14:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AmgnSvZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F9710E6BE;
 Tue, 25 Feb 2025 14:10:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54766443FB;
 Tue, 25 Feb 2025 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740492623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+u91TCy3YpIYUozJ3FfoU29SyUikcZoROu1sej+nhY=;
 b=AmgnSvZr3C3lboVzc6++WNJhOflt4OtmrqDAmY3HrWLbBSf69z/f7WKHqSSfkNNZ4hwDZP
 MFzw7rnn9vhsDsfdmZzY2zgS39dwLcIGiMI//bO13Ya7oaZ1HdwAUmi39OHcL7IFMhhaDC
 X3eu1fgez87Q8W/LP1wNN/vjKYnCMHOyJkc5kME+K1LcCgtF0+8/hj429Gm4GKciaB3zTt
 853PR3+hRyX2EIFVkXPQLD8xuWjYFAFX5sCpgVJYBKl92yBpjE+xAAAt5rG/F8YqftUbIC
 vem4zxu3GGBaweSkcY4wOkeNNesI+b6ir06kMNLl/7cqOtKOStlAbpGc3TePDA==
Date: Tue, 25 Feb 2025 15:10:21 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 09/63] dyndbg: reduce verbose/debug clutter
Message-ID: <bd0d606b-d589-453b-b2e7-2567c5ef4605@bootlin.com>
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
 <20250125064619.8305-10-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-10-jim.cromie@gmail.com>
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
> currently, for verbose=3, these are logged (blank lines for clarity):
> 
>   dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
>   dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
> 
>   dyndbg: op='+'
>   dyndbg: flags=0x1
>   dyndbg: *flagsp=0x1 *maskp=0xffffffff
> 
>   dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
>   dyndbg: no matches for query
>   dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
>   dyndbg: processed 1 queries, with 0 matches, 0 errs
> 
> That is excessive, so this patch:
>   - shrinks 3 lines of 2nd stanza to single line
>   - drops 1st 2 lines of 3rd stanza
>     3rd line is like 1st, with result, not procedure.
>     2nd line is just status, retold in 4th, with more info.
> 
> New output:
> 
>   dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
>   dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
>   dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
>   dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
>   dyndbg: processed 1 queries, with 0 matches, 0 errs
> 
> no functional change.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/dynamic_debug.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 9adcb9fa7110..1b2fb6502e61 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -266,9 +266,6 @@ static int ddebug_change(const struct ddebug_query *query,
>   	}
>   	mutex_unlock(&ddebug_lock);
>   
> -	if (!nfound && verbose)
> -		pr_info("no matches for query\n");
> -
>   	return nfound;
>   }
>   
> @@ -501,7 +498,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
>   		pr_err("bad flag-op %c, at start of %s\n", *str, str);
>   		return -EINVAL;
>   	}
> -	v3pr_info("op='%c'\n", op);
>   
>   	for (; *str ; ++str) {
>   		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
> @@ -515,7 +511,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
>   			return -EINVAL;
>   		}
>   	}
> -	v3pr_info("flags=0x%x\n", modifiers->flags);
>   
>   	/* calculate final flags, mask based upon op */
>   	switch (op) {
> @@ -531,7 +526,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
>   		modifiers->flags = 0;
>   		break;
>   	}
> -	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
> +	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
>   
>   	return 0;
>   }
> @@ -541,7 +536,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
>   	struct flag_settings modifiers = {};
>   	struct ddebug_query query = {};
>   #define MAXWORDS 9
> -	int nwords, nfound;
> +	int nwords;
>   	char *words[MAXWORDS];
>   
>   	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
> @@ -559,10 +554,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
>   		return -EINVAL;
>   	}
>   	/* actually go and implement the change */
> -	nfound = ddebug_change(&query, &modifiers);
> -	vpr_info_dq(&query, nfound ? "applied" : "no-match");
> -
> -	return nfound;
> +	return ddebug_change(&query, &modifiers);
>   }
>   
>   /* handle multiple queries in query string, continue on error, return

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

