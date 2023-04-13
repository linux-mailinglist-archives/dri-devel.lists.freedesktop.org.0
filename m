Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1136E03BE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 03:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C236010E058;
	Thu, 13 Apr 2023 01:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB77310E058
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:34:34 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4PxhvY3fGJz2vls;
 Wed, 12 Apr 2023 21:34:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681349673; bh=ttP36cvM3SeBuIZNI6FDWxhhzpIFeQ19ryLaTKM7zPw=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=LrVUQ9SDKQ29apum0gcw9biln6brtDc8tUdwOzymNTTvvMrIeFC5FKQnc1ZNG4FKY
 rhjiF0kLrZnz3HhN5Z6gv3iCjT3V4A3kwoVcN1PSQIahxAM5MkjKoF0pX0DB6KCstE
 yKL/oIEX9IQ+N5JJxqT9dF67OyuTQzviZ6n9h8TA=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Wed, 12 Apr 2023 21:34:33 -0400
Message-ID: <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
In-Reply-To: <4PxhQn3zK1zcbc@panix1.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
Date: Wed, 12 Apr 2023 21:34:33 -0400
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
From: "Pierre Asselin" <pa@panix.com>
To: "Pierre Asselin" <pa@panix.com>
User-Agent: SquirrelMail/1.4.23-p1
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
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
Cc: jfalempe@redhat.com, pa@panix.com, daniel.vetter@ffwll.ch,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hdegoede@redhat.com, tzimmermann@suse.de,
 ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> (not tested)

Tested.  It fixes the regression on my laptop.

> diff --git a/drivers/firmware/sysfb_simplefb.c
> b/drivers/firmware/sysfb_simplefb.c
> index 82c64cb9f531..9f5299d54732 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -56,10 +56,11 @@ __init bool sysfb_parse_mode(const struct screen_info
> *si,
>  	 * don't specify alpha channels.
>  	 */
>  	if (si->lfb_depth > 8) {
> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
> +		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
>  					  si->green_size + si->green_pos,
>  					  si->blue_size + si->blue_pos),
> -				     si->rsvd_size + si->rsvd_pos);
> +				     si->rsvd_size + si->rsvd_pos,
> +				     si->lfb_depth);
>  	} else {
>  		bits_per_pixel = si->lfb_depth;
>  	}


