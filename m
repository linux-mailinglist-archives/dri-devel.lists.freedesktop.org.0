Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C573021267E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 16:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1C6E995;
	Thu,  2 Jul 2020 14:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11816E95B;
 Thu,  2 Jul 2020 14:40:39 +0000 (UTC)
IronPort-SDR: JWekPHrGdLyjd7B2bJxl43vOjXHAkrJE8G6xtC2oyuE/Ay8Iybb8+fXscwwLHCkeB95Pps+Vkw
 z173Qwk5imsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="208432261"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="208432261"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 07:40:39 -0700
IronPort-SDR: ZWja79iOS7iSOmqb324SbKn1fvLhe1vc+9vhokZD3wPlbaTLeARB/lyte2Tw18DB5cjL1fpo4Y
 a3cEqGFAMQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="295912679"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 02 Jul 2020 07:40:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Jul 2020 17:40:35 +0300
Date: Thu, 2 Jul 2020 17:40:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/edid: Allow looking for ext blocks
 starting from a specified index
Message-ID: <20200702144035.GD6112@intel.com>
References: <20200527130310.27099-1-ville.syrjala@linux.intel.com>
 <8f1e0c7ad218ddf20167ae90d623fb7eec9422c9.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f1e0c7ad218ddf20167ae90d623fb7eec9422c9.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 11:42:36PM +0000, Souza, Jose wrote:
> On Wed, 2020-05-27 at 16:03 +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Apparently EDIDs with multiple DispID ext blocks is a thing, so prepare
> > for iterating through multiple ext blocks of the same type by
> > passing the starting ext block index to drm_find_edid_extension(). Well
> > also have drm_find_edid_extension() update the index to point to the
> > next ext block on success. Thus we should be able to call
> > drm_find_edid_extension() in loop.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 30 +++++++++++++++++++++---------
> >  1 file changed, 21 insertions(+), 9 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index d8372d63851b..f2531d51dfa2 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3188,7 +3188,8 @@ add_detailed_modes(struct drm_connector *connecto=
r, struct edid *edid,
> >  /*
> >   * Search EDID for CEA extension block.
> >   */
> > -static u8 *drm_find_edid_extension(const struct edid *edid, int ext_id)
> > +static u8 *drm_find_edid_extension(const struct edid *edid,
> > +				   int ext_id, int *ext_index)
> >  {
> >  	u8 *edid_ext =3D NULL;
> >  	int i;
> > @@ -3198,23 +3199,26 @@ static u8 *drm_find_edid_extension(const struct=
 edid *edid, int ext_id)
> >  		return NULL;
> >  =

> >  	/* Find CEA extension */
> > -	for (i =3D 0; i < edid->extensions; i++) {
> > +	for (i =3D *ext_index; i < edid->extensions; i++) {
> >  		edid_ext =3D (u8 *)edid + EDID_LENGTH * (i + 1);
> >  		if (edid_ext[0] =3D=3D ext_id)
> >  			break;
> >  	}
> >  =

> > -	if (i =3D=3D edid->extensions)
> > +	if (i >=3D edid->extensions)
> >  		return NULL;
> >  =

> > +	*ext_index =3D i + 1;
> > +
> >  	return edid_ext;
> >  }
> >  =

> =

> I would add something like drm_find_edid_n_extension() with the implement=
ation above and then implement drm_find_edid_extension() calling
> drm_find_edid_n_extension() but it is just one caller that is not using e=
xt_index so LGTM.
> =

> >  =

> >  static u8 *drm_find_displayid_extension(const struct edid *edid,
> > -					int *length, int *idx)
> > +					int *length, int *idx,
> > +					int *ext_index)
> >  {
> > -	u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT);
> > +	u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ext_in=
dex);
> >  	struct displayid_hdr *base;
> >  	int ret;
> >  =

> > @@ -3241,14 +3245,18 @@ static u8 *drm_find_cea_extension(const struct =
edid *edid)
> >  	struct displayid_block *block;
> >  	u8 *cea;
> >  	u8 *displayid;
> > +	int ext_index;
> >  =

> >  	/* Look for a top level CEA extension block */
> > -	cea =3D drm_find_edid_extension(edid, CEA_EXT);
> > +	ext_index =3D 0;
> =

> In 2 places ext_index is initialized in the variable declaration and in 2=
 other places is not, all of it could be done in the declaration

No, in this case we need to reset it back to 0 when the start looking
for the DispID ext block (as opposed to the CEA ext block). So I figured
it's cleaner if both initialize it to 0 the same way. All the other
places need just the one initialization.

Eventually I think I'd like some kind of for_each_ext_block() to make
this stuff less crap...

> or if you
> really want to leave the context close to the users, initialize it in the=
 "for (;;)" in the next patch.
> =

> With the change above:
> =

> Reviewed-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> =

> > +	cea =3D drm_find_edid_extension(edid, CEA_EXT, &ext_index);
> >  	if (cea)
> >  		return cea;
> >  =

> >  	/* CEA blocks can also be found embedded in a DisplayID block */
> > -	displayid =3D drm_find_displayid_extension(edid, &length, &idx);
> > +	ext_index =3D 0;
> > +	displayid =3D drm_find_displayid_extension(edid, &length, &idx,
> > +						 &ext_index);
> >  	if (!displayid)
> >  		return NULL;
> >  =

> > @@ -5195,8 +5203,10 @@ static int add_displayid_detailed_modes(struct d=
rm_connector *connector,
> >  	int length, idx;
> >  	struct displayid_block *block;
> >  	int num_modes =3D 0;
> > +	int ext_index =3D 0;
> >  =

> > -	displayid =3D drm_find_displayid_extension(edid, &length, &idx);
> > +	displayid =3D drm_find_displayid_extension(edid, &length, &idx,
> > +						 &ext_index);
> >  	if (!displayid)
> >  		return 0;
> >  =

> > @@ -5870,11 +5880,13 @@ void drm_update_tile_info(struct drm_connector =
*connector,
> >  			  const struct edid *edid)
> >  {
> >  	const void *displayid =3D NULL;
> > +	int ext_index =3D 0;
> >  	int length, idx;
> >  	int ret;
> >  =

> >  	connector->has_tile =3D false;
> > -	displayid =3D drm_find_displayid_extension(edid, &length, &idx);
> > +	displayid =3D drm_find_displayid_extension(edid, &length, &idx,
> > +						 &ext_index);
> >  	if (!displayid) {
> >  		/* drop reference to any tile group we had */
> >  		goto out_drop_ref;

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
