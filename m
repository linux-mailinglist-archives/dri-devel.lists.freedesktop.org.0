Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC014E3053
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 19:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4D310E3D4;
	Mon, 21 Mar 2022 18:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9351210E3A0;
 Mon, 21 Mar 2022 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647889057; x=1679425057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ckrgnk3SgL+THhKR8whyX6XMslOeejmcUKdmRZ08zW8=;
 b=UCvdO/wPHh+MTnaZ3VF5w1KGevvB1mqDbO1vz7IXgFdDr8ud/UsTJtzJ
 5xlGSdlvL/iPtetk8AoDc9NcSAvVGCpnFjVP3ft7Wjx9N3l1B1nfhrf16
 LPhUAI4T/n17zhBkGVbxhzTCPZrQIMn916d7TccywnjFr+N5ChTVU7Qc0
 KkKBHnqugEj5j23XLohvxYa/m54T4EnRHQKaRIAZ5+ZnNlvFR/h5dm9/c
 Eet/Zc9i/jWU2WkVLCODXDg42qrNKCGqyX3233gWlD5wJ426bANU1v8hf
 G1aWqKz8kBhA/FhHuLHp317roEK/uBfOBFgn8q57fdG3vYefrDNCnFSFz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344056673"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="344056673"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 11:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="551824699"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga007.fm.intel.com with SMTP; 21 Mar 2022 11:57:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 21 Mar 2022 20:57:33 +0200
Date: Mon, 21 Mar 2022 20:57:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 18/22] drm/i915: Use drm_mode_init() for
 on-stack modes
Message-ID: <YjjKnUbcJRpcoxoI@intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-19-ville.syrjala@linux.intel.com>
 <877d8upbsp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d8upbsp.fsf@intel.com>
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
Cc: Julia Lawall <Julia.Lawall@inria.fr>, intel-gfx@lists.freedesktop.org,
 Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 10:00:06AM +0200, Jani Nikula wrote:
> On Fri, 18 Feb 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Initialize on-stack modes with drm_mode_init() to guarantee
> > no stack garbage in the list head, or that we aren't copying
> > over another mode's list head.
> >
> > Based on the following cocci script, with manual fixups:
> > @decl@
> > identifier M;
> > expression E;
> > @@
> > - struct drm_display_mode M = E;
> > + struct drm_display_mode M;
> >
> > @@
> > identifier decl.M;
> > expression decl.E;
> > statement S, S1;
> > @@
> > struct drm_display_mode M;
> > ... when != S
> > + drm_mode_init(&M, &E);
> > +
> > S1
> >
> > @@
> > expression decl.E;
> > @@
> > - &*E
> > + E
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I wonder if that cocci could be added to scripts/coccinelle or something
> to detect anyone adding new ones?

Maybe.

Julia & co, would you be open to having drm subsystem specific
coccinelle scripts? If so where should we put the?
scripts/coccinelle/drm perhaps?

-- 
Ville Syrjälä
Intel
