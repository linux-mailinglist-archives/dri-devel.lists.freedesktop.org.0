Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC4A44247
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777C010E1BB;
	Tue, 25 Feb 2025 14:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KCXZaeAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE7C10E1BB;
 Tue, 25 Feb 2025 14:17:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FD9C44280;
 Tue, 25 Feb 2025 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740493063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngybRTkc4Ma7pkH5YlW7U8BggN94fh6wjcbQZdI+hvg=;
 b=KCXZaeAmRCKEY3wCI5qXmG3E8oXXOA7mBd4a8am1/VBIYqTIW47xfzDAwF2R661XZcqXBs
 5o9ZP9g9TH+U6SPFZN13pcP1ze98Re+EK+2my1wYejaKE6lR1NlGaSP69jVu/kKREzRgoB
 9my1O71pITSNMPsHCXptMGRHeBbX146zXF39dsHPcO8Sqwm2uFRX6pIEzgq2e1OXgYEUTq
 9kNmVT8uhkAUdNOvCiqmN5xpC/UdSAMOaCxdGE73LDEC+/wtyymbewb339U58AspSO808r
 3uZIA1ceneXIXQebaxzRCLBzRCTcnVrZhlzvc3nPs9CuvtZQ1Y6tBwpqBQZ10w==
Date: Tue, 25 Feb 2025 15:17:40 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 17/63] dyndbg: check DYNDBG_CLASSMAP_DEFINE args at
 compile-time
Message-ID: <29ca1dc2-3a21-405f-a9b6-06bea7bd75ae@bootlin.com>
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
 <20250125064619.8305-18-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-18-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
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
> Add __DYNDBG_CLASSMAP_CHECK to implement these arg-checks at compile:
> 	0 <= _base < 63
> 	class_names is not empty
> 	class_names[0] is a string
> 	(class_names.length + _base) < 63
> 
> These compile-time checks will prevent several misuses; 4 such
> examples are added to test_dynamic_debug_submod.ko, and will fail
> compilation if -DDD_MACRO_ARGCHECK is added to cflags.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> - split static-asserts to __DYNDBG_CLASSMAP_CHECK
> - move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
>    silences kernel-doc warnings
> ---
>   include/linux/dynamic_debug.h |  9 +++++++++
>   lib/test_dynamic_debug.c      | 11 +++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index dc610a12b91c..2b0c943af330 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -99,6 +99,14 @@ struct ddebug_class_map {
>   	enum ddebug_class_map_type map_type;
>   };
>   
> +#define __DYNDBG_CLASSMAP_CHECK(_clnames, _base)			\
> +	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
> +		      "_base must be in 0..62");			\
> +	static_assert(ARRAY_SIZE(_clnames) > 0,				\
> +		      "classnames array size must be > 0");		\
> +	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
> +		      "_base + classnames.length exceeds range")
> +
>   /**
>    * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
>    * @_var:   name of the classmap, exported for other modules coordinated use.
> @@ -112,6 +120,7 @@ struct ddebug_class_map {
>    */
>   #define DYNDBG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
>   	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
> +	__DYNDBG_CLASSMAP_CHECK(_var##_classnames, (_base));		\
>   	extern struct ddebug_class_map _var;				\
>   	struct ddebug_class_map __aligned(8) __used			\
>   		__section("__dyndbg_classes") _var = {			\
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 1838f62738c4..b1555b0a2bb1 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -123,8 +123,19 @@ DYNDBG_CLASSMAP_PARAM(level_num, p);
>   DYNDBG_CLASSMAP_USE(map_disjoint_bits);
>   DYNDBG_CLASSMAP_USE(map_level_num);
>   
> +#if defined(DD_MACRO_ARGCHECK)
> +/*
> + * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
> + * These will break compilation.
> + */
> +DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
> +DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
> +DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
> +DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);

Hi Jim,

This test is nice, but can we move it in the *_submod.c directly? They 
don't need anything from this file.

Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet

>   #endif
>   
> +#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
> +
>   /* stand-in for all pr_debug etc */
>   #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
>   

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

