Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE22182334
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 21:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A3F6E9FA;
	Wed, 11 Mar 2020 20:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Wed, 11 Mar 2020 20:17:44 UTC
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822E76E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 20:17:44 +0000 (UTC)
Date: Wed, 11 Mar 2020 20:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1583957355;
 bh=iKM1spfNpw6WWXlMo6HqAOeNnrZChmamzub5pgdXsf0=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=r6NKfDCCsXpuqRRPozeFNhrAR5y2elLGs86jUodH8gCVZ20mf/DtlMvmpeBilDAVf
 l9yTxEK0FwA/bQniMGlI9hRrVIJJp52Bf51askm+9ecKY60tTxjDUqJSAnkRPfTDsA
 V6Mo1kBdQL82OouHZ7AVc5F3lGLsdoq8cjuBzUh8=
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Harry Wentland <hwentlan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Scott Anderson <scott@anderso.nz>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>,
 Martin Peres <martin.peres@free.fr>
From: Simon Ser <contact@emersion.fr>
Subject: Variable Refresh Rate & flickering screens
Message-ID: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've been working on adding VRR support to Sway [1] (a Wayland
compositor). The compositor just sets the VRR_ENABLED property.

This works fine for some screens, but causes flcikering for other
screens as expected [2]. Fixing the flickering is something we've
talked about last XDC [3]. The flickering is caused by physical
limitations of the screen: changing the refresh rate too quickly
results in brightness issues.

The approach taken by xf86-video-amdgpu is to only enable VRR if an app
is fullscreen and not present in a special Mesa blacklist (e.g. Firefox
is in the blacklist because it doesn't render at a fixed interval).

For Wayland, I'd prefer to avoid having a blacklist. I'd like to be
able to use VRR in the general case (not just for fullscreen apps).
A way to fix the flickering would be to implement a slew rate and make
it so refresh rate variations are capped by the slew rate.

The main question is: should this be implemented in the kernel or in
user-space?

I personally think it'd make more sense to implement this in the
kernel. This would de-duplicate the slew rate logic between compositors
and would avoid unnecessarily waking up user-space.

Moreover, it seems Intel hardware supports programming a slew rate
directly. To take advantage of this feature the slew rate needs to be
implemented in the kernel.

Harry, what do you think?

Thanks,

Simon

[1]: https://github.com/swaywm/sway/pull/5063
[2]: https://github.com/swaywm/sway/issues/5076
[3]: https://xdc2019.x.org/event/5/contributions/331/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
