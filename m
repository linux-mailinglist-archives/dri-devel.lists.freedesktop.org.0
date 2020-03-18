Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABD18A3EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 21:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634D86E962;
	Wed, 18 Mar 2020 20:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60CA6E962;
 Wed, 18 Mar 2020 20:44:37 +0000 (UTC)
IronPort-SDR: k4hnVejjnwu6Fb0n6vtVyg92BEWNNED+o2jCS+J1sSVfBgFkMmBJ3MiZfgSmEezNxsPW6eRCRx
 OhR5abRd2V8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 13:44:37 -0700
IronPort-SDR: WYfRcxkLj/LFlJqmjLUuVj57XDZGeQ2mDMVAr9yu5beKwwNST7wG6bgqtBxEo53EF88CnKTxlK
 1cKaO0tlB6pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="263510120"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 18 Mar 2020 13:44:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Mar 2020 22:44:33 +0200
Date: Wed, 18 Mar 2020 22:44:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm: Reject dumb buffers when driver/device doesn't
 support modesetting
Message-ID: <20200318204433.GG13686@intel.com>
References: <20200318154959.9017-1-ville.syrjala@linux.intel.com>
 <20200318203107.GM2286538@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318203107.GM2286538@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 01:31:07PM -0700, Matt Roper wrote:
> On Wed, Mar 18, 2020 at 05:49:59PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Currently a driver must not provide a .dumb_create() hook in the
> > drm_driver structure if it wants to declare dumb buffers as not
> > supported. So if the same driver wants to support both modeset
> > and non-modeset devices it would require two distinct drm_driver
> > structures in order to reject the dumb buffer operations on the
> > non-modeset devices. That's rather tedious, so let's make life
> > easier for such drivers by also checking for the DRIVER_MODESET
> > flag before we declare dumb buffers as supported. Now all the
> > driver has to do is clear the flag for any device that can't
> > do modesetting.
> =

> Will this be a problem for vgem?  I thought it exposed dumb buffers
> without modesetting support?

Well that's disappointing.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
