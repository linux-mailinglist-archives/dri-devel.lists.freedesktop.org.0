Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88812895C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68B06E082;
	Sat, 21 Dec 2019 14:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Sat, 21 Dec 2019 14:04:41 UTC
Received: from smtprelay.hostedemail.com (smtprelay0137.hostedemail.com
 [216.40.44.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACEF6E082
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 14:04:41 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 1640A1801C4ED
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 13:57:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id EC9741801BE94;
 Sat, 21 Dec 2019 13:56:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:4321:5007:10004:10400:10848:11026:11232:11473:11658:11914:12048:12296:12297:12438:12679:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21451:21627:30054:30075:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: cable34_59e6e64a1c804
X-Filterd-Recvd-Size: 1921
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Dec 2019 13:56:57 +0000 (UTC)
Message-ID: <d1995ca9ff5b2f91d255eba97b9461d8a800a807.camel@perches.com>
Subject: Re: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
From: Joe Perches <joe@perches.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, Jani
 Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 21 Dec 2019 05:56:17 -0800
In-Reply-To: <20191221095553.13332-7-sam@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-7-sam@ravnborg.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2019-12-21 at 10:55 +0100, Sam Ravnborg wrote:
> There are a lot of cases where we have a device * but no drm_device *.
> Add drm_dev_* variants of the logging functions to cover these cases.
[]
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
[]
> @@ -468,6 +511,60 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  #define drm_dbg_dp(drm, fmt, ...)					\
>  	__drm_cat_printk((drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>  
> +/* struct device based logging. */
> +#define __drm_dev_printk(dev, level, type, fmt, ...)			\
> +	dev_##level##type(dev, "[drm] " fmt, ##__VA_ARGS__)
> +
> +#define __drm_dev_cat_printk(dev, cat, type, fmt, ...)			\
> +({									\
> +	if (drm_debug_enabled(cat))					\
> +		dev_dbg##type((dev), "[drm] " fmt, ##__VA_ARGS__);	\

trivia:  The parentheses around dev aren't necessary.

> +})
> +
> +#define drm_dev_info(dev, fmt, ...)					\
> +	__drm_dev_printk((dev), info,, fmt, ##__VA_ARGS__)

etc...


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
