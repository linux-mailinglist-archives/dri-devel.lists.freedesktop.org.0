Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57EC2AC22E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 18:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F3389ACC;
	Mon,  9 Nov 2020 17:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C8F89ACC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 17:26:48 +0000 (UTC)
IronPort-SDR: /H8nL7ENvTAhLqMcswiWp1WN1WH9SymGgSvbkLsN6x5LHVc88W5d6JY7e3mxcREPr8pYr/xyz+
 q695BvXUhTPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="231469712"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="231469712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 09:26:48 -0800
IronPort-SDR: kKmYglTot1gQejBnxq2DiRTlTB6YRRZb0qxWCeuovkoW5h1GzrqWNrsJdhhyVoonNeEmuvBwgS
 oxO+hDJVXfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="338424050"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 09 Nov 2020 09:26:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 19:26:45 +0200
Date: Mon, 9 Nov 2020 19:26:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: Why is atomic_disable callback's plane->state->crtc sometimes
 null?
Message-ID: <20201109172645.GK6112@intel.com>
References: <trinity-0d015aed-dc82-456d-9640-de541eafed45-1604361043510@3c-app-mailcom-bs01>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-0d015aed-dc82-456d-9640-de541eafed45-1604361043510@3c-app-mailcom-bs01>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 12:50:43AM +0100, Kevin Brace wrote:
> Hi,
> =

> First, I will like to thank those who gave me hints on how to proceed wit=
h getting rid of an unwanted double allocation of visible portion of the fr=
ame buffer.
> =

> https://lists.freedesktop.org/archives/dri-devel/2020-October/283452.html
> =

> I may repost the question later to the mailing list based on the feedback=
 I received.
>     After a few more days of trying, I finally got my prototype OpenChrom=
e DRM atomic modesetting code barely working for both primary and cursor pl=
anes (cursor plane was not working previously).
> I finally figured out what was causing the freeze, and in fact, I am writ=
ing this e-mail from the very computer that has the experimental code runni=
ng.
> The code itself is still quite unstable that standby resume is not workin=
g and VT (Virtual Terminal) is broken, but X Server is working fine just wi=
th a few minor weird artifact lines on the right and bottom edges of the sc=
reen.
> Anyway, the question I have here (and I am assuming that Daniel Vetter wi=
ll give me an explanation) is that I noticed that for cursor plane's atomic=
_disable callback, plane->state->crtc is null or sometimes null.
> Why is this?

It can be NULL if the user set it to NULL. That's how you disable
a plane: crtc=3DNULL + fb=3DNULL.

Also you shouldn't really use plane->state directly anymore.
Instead you should rather use for_each_{new,old,oldnew}_plane_in_state()
and/or drm_atomic_get_{new,old}_plane_state().

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
