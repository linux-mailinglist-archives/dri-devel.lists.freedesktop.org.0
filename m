Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16917AE11
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 19:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B676EBF6;
	Thu,  5 Mar 2020 18:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFC26EBF6;
 Thu,  5 Mar 2020 18:29:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 10:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="244358107"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 05 Mar 2020 10:29:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Mar 2020 20:29:42 +0200
Date: Thu, 5 Mar 2020 20:29:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Don't show connectors as connected
 before probing available PBN
Message-ID: <20200305182942.GP13686@intel.com>
References: <20200304223614.312023-1-lyude@redhat.com>
 <20200304223614.312023-3-lyude@redhat.com>
 <20200305131119.GJ13686@intel.com>
 <73f52c392431cd21a80a118dd2fd1986e2c535df.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73f52c392431cd21a80a118dd2fd1986e2c535df.camel@redhat.com>
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 01:13:36PM -0500, Lyude Paul wrote:
> On Thu, 2020-03-05 at 15:11 +0200, Ville Syrj=E4l=E4 wrote:
> > On Wed, Mar 04, 2020 at 05:36:12PM -0500, Lyude Paul wrote:
> > > It's next to impossible for us to do connector probing on topologies
> > > without occasionally racing with userspace, since creating a connector
> > > itself causes a hotplug event which we have to send before probing the
> > > available PBN of a connector. Even if we didn't have this hotplug eve=
nt
> > > sent, there's still always a chance that userspace started probing
> > > connectors before we finished probing the topology.
> > > =

> > > This can be a problem when validating a new MST state since the
> > > connector will be shown as connected briefly, but without any availab=
le
> > > PBN - causing any atomic state which would enable said connector to f=
ail
> > > with -ENOSPC. So, let's simply workaround this by telling userspace n=
ew
> > > MST connectors are disconnected until we've finished probing their PB=
N.
> > > Since we always send a hotplug event at the end of the link address
> > > probing process, userspace will still know to reprobe the connector w=
hen
> > > we're ready.
> > > =

> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to =
MST
> > > atomic check")
> > > Cc: Mikita Lipski <mikita.lipski@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Sean Paul <seanpaul@google.com>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 207eef08d12c..7b0ff0cff954 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -4033,6 +4033,19 @@ drm_dp_mst_detect_port(struct drm_connector
> > > *connector,
> > >  			ret =3D connector_status_connected;
> > >  		break;
> > >  	}
> > > +
> > > +	/* We don't want to tell userspace the port is actually plugged into
> > > +	 * anything until we've finished probing it's available_pbn, otherw=
ise
> > =

> > "its"
> > =

> > Why is the connector even registered before we've finished the probe?
> > =

> Oops, I'm not sure how I did this by accident but the explanation I gave =
in
> the commit message was uh, completely wrong. I must have forgotten that I=
 made
> sure we didn't expose connectors before probing their PBN back when I sta=
rted
> my MST cleanup....
> =

> So: despite what I said before it's not actually when new connectors are
> created, it's when downstream hotplugs happen which means that the conenc=
tor's
> always going to be there before we probe the available_pbn.

Not sure I understand. You're saying this is going to change for already
existing connectors when something else gets plugged in, and either we
zero it out during the probe or it always was zero to begin with for
whatever reason?

> I did just notice
> though that we send a hotplug on connection status notifications even bef=
ore
> we've finished the PBN probe, so I might be able to improve on that as we=
ll.
> We still definitely want to report the connector as disconnected before we
> have the available PBN though, in case another probe was already going be=
fore
> we got the connection status notification.
> =

> I'll make sure to fixup the explanation in the commit message on the next
> respin
> =

> > > +	 * userspace will see racy atomic check failures
> > > +	 *
> > > +	 * Since we always send a hotplug at the end of probing topology
> > > +	 * state, we can just let userspace reprobe this connector later.
> > > +	 */
> > > +	if (ret =3D=3D connector_status_connected && !port->available_pbn) {
> > > +		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] not ready yet (PBN not
> > > probed)\n",
> > > +			      connector->base.id, connector->name);
> > > +		ret =3D connector_status_disconnected;
> > > +	}
> > >  out:
> > >  	drm_dp_mst_topology_put_port(port);
> > >  	return ret;
> > > -- =

> > > 2.24.1
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> -- =

> Cheers,
> 	Lyude Paul (she/her)
> 	Associate Software Engineer at Red Hat

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
