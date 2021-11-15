Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2E451158
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD436E836;
	Mon, 15 Nov 2021 19:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007EC6E836
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1637002968; bh=pW8xVlgAfojkL03mMWdlO0wFB2pT/o2JieTr6t324OA=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=wWr2TkxBeBXcmippz+ZoRSktDUCwoIyFhX+5EOt+HlpynuoGEDxYkmEgtgszJsxsL
 21xgngfFlxIbWRSPntQCOqEQuScJptgzDrDZDQ5j6S/8pwgh39KEbkoItRWeku2LPI
 hCuVcG2JHj0gRE9SC1sYYUjsgfP4FqQzpw0qfzBs=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 15 Nov 2021 20:02:48 +0100 (CET)
X-EA-Auth: DaWVRom2TENOyfcQtRwdc9dMDX8mAJmiTDlE9NZQceZw5eMwvBxDzNPi4wIozFfRvy8Kjyq6pReolphEg0t0JPBGzFB2wwNn
Date: Mon, 15 Nov 2021 20:02:45 +0100
From: Claudio Suarez <cssk@net-c.es>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
Message-ID: <YZKu1Vs2GPvFvOmb@gineta.localdomain>
References: <YZARol5A5hS+5a5m@gineta.localdomain>
 <87ilwt3ei7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ilwt3ei7.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 12:22:08PM +0200, Jani Nikula wrote:
> On Sat, 13 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
> > The prefered way to log connectors is [CONNECTOR:id:name]. Change it in
> > drm core programs.
> >
> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > ---
> >  drivers/gpu/drm/drm_client_modeset.c | 51 ++++++++++++++--------------
> >  drivers/gpu/drm/drm_connector.c      | 12 ++++---
> >  drivers/gpu/drm/drm_edid.c           | 36 ++++++++++----------
> >  drivers/gpu/drm/drm_edid_load.c      | 11 +++---
> >  drivers/gpu/drm/drm_mode_config.c    |  3 +-
> >  5 files changed, 59 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index ced09c7c06f9..4f35dc375bdd 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -240,7 +240,7 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
> >  	for (i = 0; i < connector_count; i++) {
> >  		connector = connectors[i];
> >  		enabled[i] = drm_connector_enabled(connector, true);
> > -		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
> > +		DRM_DEBUG_KMS("[CONNECTOR:%d;%s] enabled? %s\n", connector->base.id, connector->name,
> >  			      connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
> 
> You have a semicolon instead of a colon there.

Sorry my typo. I am going to do a new version.

> 
> Not to block this patch, but I've wondered about bigger changes such as:
> 
> - Adding "debug_name" member or similar in drm_connector, which would be
>   an allocated string with "[CONNECTOR:id:name]" that you could use with
>   just %s while debug logging.
> 
> - Adding drm_dbg_connector() which would take drm_connector as context,
>   and do drm_dbg_kms() with the above prefix.
> 
> >  
> >  		any_enabled |= enabled[i];
> > @@ -350,8 +350,8 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
> >  			continue;
> >  
> >  		if (!modes[i] && (h_idx || v_idx)) {
> > -			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
> > -				      connector->base.id);
> > +			DRM_DEBUG_KMS("no modes for [CONNECTOR:%d:%s] tiled %d\n",
> > +				      connector->base.id, connector->name, i);
> 
> Personally I'd prefer adding [CONNECTOR:id:name] as a prefix in the
> beginning, throughout, not in the middle.

I'd prefer too. I am going to change it in the new version.

B.R.
Claudio Suarez.



