Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F076E0386
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 03:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59CE10E010;
	Thu, 13 Apr 2023 01:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51F910E010
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:13:06 +0000 (UTC)
Received: from panix1.panix.com (panix1.panix.com [166.84.1.1])
 by mailbackend.panix.com (Postfix) with ESMTP id 4PxhQn3rp8z2v3l;
 Wed, 12 Apr 2023 21:13:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1681348385; bh=3PDeKttSJ7pA4nWTc74l+a2Ub5ZqA+OBy7VNvMYiIY8=;
 h=Date:To:Cc:Subject:References:In-Reply-To:From;
 b=Op77uQix3100OFjDvoMlpPYbSteO8ND9VvXA1Pg7DNdYTxisW9eMVQyg2wqrzTbcL
 i8ZzO6YTDMouMD0Dx3+Bn/ShG3ASZaDgZOpVLsuMkkcSK+KkRxbinLyC0/RSWV3O3u
 iYaTL5FVZa/jUXsQuv4SqwAbPhUjyZUbc6Deqp4o=
Received: by panix1.panix.com (Postfix, from userid 19171)
 id 4PxhQn3zK1zcbc; Wed, 12 Apr 2023 21:13:05 -0400 (EDT)
Date: Thu, 13 Apr 2023 01:13:05 +0000
To: pa@panix.com, javierm@redhat.com
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
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
In-Reply-To: <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
User-Agent: nail 11.25 7/29/05
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <4PxhQn3zK1zcbc@panix1.panix.com>
From: pa@panix.com (Pierre Asselin)
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After careful reading of the comments in f35cd3fa7729, would this
be an appropriate fix ?  Does it still address all the issues raised
by Thomas ?

(not tested)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 82c64cb9f531..9f5299d54732 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -56,10 +56,11 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	 * don't specify alpha channels.
 	 */
 	if (si->lfb_depth > 8) {
-		bits_per_pixel = max(max3(si->red_size + si->red_pos,
+		bits_per_pixel = max3(max3(si->red_size + si->red_pos,
 					  si->green_size + si->green_pos,
 					  si->blue_size + si->blue_pos),
-				     si->rsvd_size + si->rsvd_pos);
+				     si->rsvd_size + si->rsvd_pos,
+				     si->lfb_depth);
 	} else {
 		bits_per_pixel = si->lfb_depth;
 	}

