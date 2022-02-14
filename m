Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51764B508C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B268310E2D6;
	Mon, 14 Feb 2022 12:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F910E2D6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644842828; x=1676378828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=llcPkF1Wcl+sUIHhvXcZinKVWQQ0pJwysOxKsaAofOo=;
 b=fFb5Efj/dYC90UogQhkO8Aa6iS4TaxQ0tkZhn1d8fbk26iolUaaZxkO3
 d9ZmWOSip0GuIm+9TrgO8v4qXJz+66hJ29GxfUuqjv38/mrj6PCjJyNEq
 FoIQ8B17d6LkS2/7qkcqETj8sMKvqMuP4fie7Gbd9SeE57c4EehrocCFW
 sRi7oaQahYVJ22b5lZ/LkNV5vs3vLC/YLJAFDiFQgRryauJsT8fqH2Kby
 JOybCMOYrQELNvwWA/OeAv9jM8+nUcmLJAIr9WhbP4ZxPylIaub3uTlLN
 H1wMv551fHUTOcqUgN4Tjy6jOotVUbnmDCnkULYu6GyOa8Mpq7CxgVseF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274652126"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="274652126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 04:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="680470945"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 14 Feb 2022 04:47:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 14:47:03 +0200
Date: Mon, 14 Feb 2022 14:47:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgpPR/lObRWwkjNN@intel.com>
References: <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com> <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
 <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
X-Patchwork-Hint: comment
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 01:12:48PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.02.22 um 11:38 schrieb Andy Shevchenko:
> > On Mon, Feb 14, 2022 at 10:03:53AM +0100, Thomas Zimmermann wrote:
> >> Am 11.02.22 um 16:41 schrieb Andy Shevchenko:
> > 
> > ...
> > 
> >>>> IMO *always* prefer a for loop over while or do-while.
> >>>>
> >>>> The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> >>>> instantly know how many times you're going to loop, at a glance. Not so
> >>>> with with the alternatives, which should be used sparingly.
> >>>
> >>> while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.
> >>
> >> Naw, that's not true.
> > 
> > In the section 3.5 "Loops - While and For" in "The C Programming
> > Language" 2nd by K&R, the authors said:
> 
> Year of publication: 1988 . It's not the most up-to-date reference for C 
> programming.
> 
> > 
> > 	The for statement ... is equivalent to ... while..."
> > 
> > They said that for is equivalent to while, and not otherwise.
> 
> Even leaving readability aside, it's not equivalent. You can declare 
> variables as part of the for statement. (I know it's not the kernel's 
> style.) Also, 'continue' statements are not well-suited in for loops, 
> because it's non-obvious if the loop's update statement is being 
> executed. (It isn't.)

It is.

'continue' is just shorthand for 'goto end_of_loop_body'.

-- 
Ville Syrjälä
Intel
