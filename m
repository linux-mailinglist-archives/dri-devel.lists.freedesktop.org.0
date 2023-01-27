Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0B67EEDC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 20:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1388A10E1A2;
	Fri, 27 Jan 2023 19:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEE410E17B;
 Fri, 27 Jan 2023 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674849337; x=1706385337;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wXkvwY5ySMKDJGIeATza/0Y4sB4npvqiKIKWaz3NBQk=;
 b=nCHyAwOL2SCkVsd7sXvS430oQbISvzxEjLbV8+vthiEC+FlEZHYJL9G/
 VHHckFRGIQtOjssYKd9lIGiOKuqMUIDr0E3xflOUNvDll+nSakPQEo32B
 6ZzeyGA4cFgh3wJRntuk10941jaUP4IFHgVl9r2f62G1ErQjFBWq8GjgV
 DyJnSi4E6nU/l1vyZCMqhnRY1Hs2tZFRkK4A/j9ngZR/cyRIIU9cATFJ6
 DJwYaVmc9WkNX2kx+Eh/Qq1MZYHpwrQeakQ5j4mi53YQcuvX/VRYgYFS8
 owOe91OwILjSd7xUEvCR74BfVVuzd/WG/MPXslrRwRdmIv6fShDTgVeFv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="325847626"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="325847626"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 11:55:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="695645528"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="695645528"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 11:55:35 -0800
Date: Fri, 27 Jan 2023 21:55:32 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 5/9] drm/display/dp_mst: Fix the payload VCPI check in
 drm_dp_mst_dump_topology()
Message-ID: <Y9QsNP5LRf23BHbD@ideak-desk.fi.intel.com>
References: <20230125114852.748337-1-imre.deak@intel.com>
 <20230125114852.748337-6-imre.deak@intel.com>
 <Y9QpL1Y110IZcrSK@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9QpL1Y110IZcrSK@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 09:42:39PM +0200, Ville Syrjälä wrote:
> On Wed, Jan 25, 2023 at 01:48:48PM +0200, Imre Deak wrote:
> > Fix an off-by-one error in the VCPI check in drm_dp_mst_dump_topology().
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 81cc0c3b1e000..619f616d69e20 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4770,7 +4770,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
> >  		list_for_each_entry(payload, &state->payloads, next) {
> >  			char name[14];
> >  
> > -			if (payload->vcpi != i || payload->delete)
> > +			if (payload->vcpi != i + 1 || payload->delete)
> 
> Why does this code even do that funny nested double loop?

The payload list is not ordered by VCPIs I think, but the printout wants
to list them in VCPI order.

> 
> >  				continue;
> >  
> >  			fetch_monitor_name(mgr, payload->port, name, sizeof(name));
> > -- 
> > 2.37.1
> 
> -- 
> Ville Syrjälä
> Intel
