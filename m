Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H4qDiBThmnQLwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:46:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34B103373
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B53710E8FE;
	Fri,  6 Feb 2026 20:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bNv5w/YY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0D110E903
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 20:46:19 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-65832edee96so328563a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 12:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770410778; x=1771015578; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=x7vh3XFihkkC65Prx180SJ9Wn1uFrfJPS1GI8hrWqyQ=;
 b=bNv5w/YY+WI7xXWKj6AZCoUmKIdkbW9BDflwLyPlyclE0eGoVz3KMkp+8F89OnqGhw
 L6yfOTWR8/dKkN9v6OacYxQ7sVVpEdNWv1wLoYwGsXucz5X83AURDB2d8hY03pPm6Ma6
 1XDpFL7kX3kKifgjBSkt2tedcOtgIJ/xqgVf/PcKhCYJlmVk/0wrh7AN5g7a7Cw8ql86
 0CvZxBobKNqbV+MGj8QV3zNquRvRm6DWKlNOThLhGdHmygjOGvjOfJjVVBppp3ke5NK2
 yryGdoWpInaqA15HDw/9st5BDzLf4R2/Q6mnbJyTsJvWKAVC/8Wtt2B/lyc5QOgVupQl
 kpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770410778; x=1771015578;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x7vh3XFihkkC65Prx180SJ9Wn1uFrfJPS1GI8hrWqyQ=;
 b=CiHcn55wdPurax7GYbXNO+HStf57fx7i+657iZUSNjhgpIii5o+XBQfJmyiMJWGE6u
 VFK3Q/nprkIdU8IFyxtDJoeb8GpzXBJdyERCBvXmSDtemTtEurv4Odhoxtq48J2ig3R1
 drbBrxKFSq6DaFAshFbzvn6KdqBUnjxNBysbJOCw/4HlPTJ/poLuhLzbeg+RiuIvBaeW
 bx1EdWWs9ww0tAv+EwVFtiKDvlx9aSx1LI8hBY/9DO0q8Amrurz07xODjobUOHwWrugT
 27e1mNGUzUTglrBQbJmYOY92aOILG9uHM79ui33C0KofLEhqQRldjoXNzrHknKSb7NPk
 05Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4ZQRBvFyPbxmESsmSBVOh89Ulw4a5qVXhZpsqHIm4w9rRIzXBrtNsEZY7C89g0WufR6bmRlgbLYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxic73RrqmKtviaoap9NQLKYJCbpf5rECwxMH2wELK8IZecVarD
 yrVQCxYFxW0HkixwnWNaclXGb8bp2dcK7FDPg/aF1HCfHWYEAgpEewpV
X-Gm-Gg: AZuq6aIaHCX7Z+fG9o5JmttiOFjm504UWJzxKEz/FR+tQVwHY6lW0qb9SSuArKAWpHx
 KCd5UMsO0J16pDHw9gk1Yy84tLDaVj8ZUgSIuH4NjbsKf08RH/7V4Kc3pCe8uIEthna1jlcfk+i
 b9JjwpTufLSYfSYYMMC7Lr6Ityly2mr4XxeWb6RsatypWkIJTw82egfJpzH+rbH37h9Nz0Vh9fI
 qnomwjucj+DPzW3gBI3/dhZyVfl0N3whj9qz1KrzeieUbYebjCIxsZFwjh6wT2dJvoORAGcXy4a
 ajs7fzKKNOFwQBiyTuPfxFPWvY1tw9us7LpiV4NQGF/APNdxERqzEaH/FPM6nfgUY+3zIDXwdqR
 Ldn+4T4Ll0375ubJ6HFG4EqhcA6F3wzOgbqzb89FjOj6D1IQ7EQ1tEkmfWNNE5QwsvIeFEfg7uG
 kMnx8WhjVeOsOYY8ybEVspYeFgCr3qjQSn7rge0fygE9N0dzhfGtiCE7hTidZJCwMn/cdrLEk=
X-Received: by 2002:a05:6402:4405:b0:659:3d99:4bee with SMTP id
 4fb4d7f45d1cf-65984164977mr1287822a12.3.1770410777480; 
 Fri, 06 Feb 2026 12:46:17 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-659840199f9sm894800a12.23.2026.02.06.12.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 12:46:16 -0800 (PST)
Message-ID: <1272fea64aa41a4c73a26fd0a51309a9acc03a8f.camel@gmail.com>
Subject: Re: [PATCH v3 02/19] drm/amd/display: Refactor
 amdgpu_dm_update_freesync_caps()
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, alexander.deucher@amd.com, 
 sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, 	michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Date: Fri, 06 Feb 2026 21:46:14 +0100
In-Reply-To: <0d0cd4fb-0bce-4c11-bc70-2e232993ee73@amd.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-3-tomasz.pakula.oficjalny@gmail.com>
 <0d0cd4fb-0bce-4c11-bc70-2e232993ee73@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7F34B103373
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 13:22 -0500, Harry Wentland wrote:
>=20
> On 2026-02-03 13:56, Tomasz Paku=C5=82a wrote:
> > [Why]
> > This function started to get very messy and hard to follow.
> >=20
> > [How]
> > Eject some functionality to separate functions and simplify greatly.
> >=20
> > Changes in v3:
> > - Less struct traversal in helper functions
> >=20
> > Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 123 +++++++++++-------
> >  1 file changed, 73 insertions(+), 50 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 29e4a047b455..2c5877ed5f32 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -13119,8 +13119,8 @@ static void parse_edid_displayid_vrr(struct drm=
_connector *connector,
> >  	}
> >  }
> > =20
> > -static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> > -			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> > +static int parse_amd_vsdb_did(struct amdgpu_dm_connector *aconnector,
> > +			      const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_i=
nfo)
> >  {
> >  	u8 *edid_ext =3D NULL;
> >  	int i;
> > @@ -13172,13 +13172,13 @@ static int parse_amd_vsdb(struct amdgpu_dm_co=
nnector *aconnector,
> >  	return false;
> >  }
> > =20
> > -static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> > -			       const struct edid *edid,
> > -			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
> > +static int parse_amd_vsdb_cea(struct amdgpu_dm_connector *aconnector,
> > +			      const struct edid *edid,
> > +			      struct amdgpu_hdmi_vsdb_info *vsdb_info)
> >  {
> > +	struct amdgpu_hdmi_vsdb_info vsdb_local =3D {0};
> >  	u8 *edid_ext =3D NULL;
> >  	int i;
> > -	bool valid_vsdb_found =3D false;
> > =20
> >  	/*----- drm_find_cea_extension() -----*/
> >  	/* No EDID or EDID extensions */
> > @@ -13199,9 +13199,47 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_d=
m_connector *aconnector,
> >  	if (edid_ext[0] !=3D CEA_EXT)
> >  		return -ENODEV;
> > =20
> > -	valid_vsdb_found =3D parse_edid_cea(aconnector, edid_ext, EDID_LENGTH=
, vsdb_info);
> > +	if (!parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, &vsdb_local))
> > +		return -ENODEV;
> > =20
> > -	return valid_vsdb_found ? i : -ENODEV;
> > +	*vsdb_info =3D vsdb_local;
> > +	return i;
> > +}
> > +
> > +static bool is_monitor_range_invalid(const struct drm_connector *conn)
> > +{
> > +	return conn->display_info.monitor_range.min_vfreq =3D=3D 0 ||
> > +	       conn->display_info.monitor_range.max_vfreq =3D=3D 0;
> > +}
> > +
> > +/*
> > + * Returns true if (max_vfreq - min_vfreq) > 10
> > + */
> > +static bool is_freesync_capable(const struct drm_monitor_range_info *r=
ange)
> > +{
> > +	return (range->max_vfreq - range->min_vfreq) > 10;
> > +}
> > +
> > +static void monitor_range_from_vsdb(struct drm_display_info *display,
> > +				    const struct amdgpu_hdmi_vsdb_info *vsdb)
> > +{
> > +	display->monitor_range.min_vfreq =3D vsdb->min_refresh_rate_hz;
> > +	display->monitor_range.max_vfreq =3D vsdb->max_refresh_rate_hz;
> > +}
> > +
> > +/*
> > + * Returns true if connector is capable of freesync
> > + * Optionally, can fetch the range from AMD vsdb
> > + */
> > +static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
> > +{
> > +	struct amdgpu_dm_connector *aconn =3D to_amdgpu_dm_connector(conn);
> > +	struct drm_monitor_range_info *range =3D &conn->display_info.monitor_=
range;
> > +
> > +	aconn->min_vfreq =3D range->min_vfreq;
> > +	aconn->max_vfreq =3D range->max_vfreq;
> > +
> > +	return is_freesync_capable(range);
> >  }
> > =20
> >  /**
> > @@ -13218,13 +13256,14 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_=
dm_connector *aconnector,
> >  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >  				    const struct drm_edid *drm_edid)
> >  {
> > -	int i =3D 0;
> >  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
> >  			to_amdgpu_dm_connector(connector);
> >  	struct dm_connector_state *dm_con_state =3D NULL;
> >  	struct dc_sink *sink;
> >  	struct amdgpu_device *adev =3D drm_to_adev(connector->dev);
> >  	struct amdgpu_hdmi_vsdb_info vsdb_info =3D {0};
> > +	struct amdgpu_hdmi_vsdb_info vsdb_did =3D {0};
> > +	struct dpcd_caps dpcd_caps =3D {0};
> >  	const struct edid *edid;
> >  	bool freesync_capable =3D false;
> >  	enum adaptive_sync_type as_type =3D ADAPTIVE_SYNC_TYPE_NONE;
> > @@ -13256,62 +13295,46 @@ void amdgpu_dm_update_freesync_caps(struct dr=
m_connector *connector,
> >  		goto update;
> > =20
> >  	edid =3D drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> > +	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
>=20
> This change says it's a refactor, which in my book should
> never include a (subtle) functional change. But we're now
> calling this function for all sink_signal types, whereas
> before it was only called for HDMI_TYPE_A.

Got it. I'll explain it better in the next version. I think the edid
check was there only to guard against parsing it in parse_amd_vsdb(). I
must say the code there was not the clearest but I can't think of a
reason to check for edid in case of DP. If it's missing, the
display_info won't have a valid range.

The parsing functions check for edid as well so this check is actually
redundant and could be entirely removed. vsdb structs are initialized to
0 either way so nothing will break and nothing will get enabled by
mistake.

Quite honestly, looking at (before changes) parse_edid_displayid_vrr(),
parse_amd_vsdb(), parse_hdmi_amd_vsdb() there's quite a bit of code
duplication and especially the former two are almost the same.

> > +
> > +	if (amdgpu_dm_connector->dc_link)
> > +		dpcd_caps =3D amdgpu_dm_connector->dc_link->dpcd_caps;
> > =20
> >  	/* Some eDP panels only have the refresh rate range info in DisplayID=
 */
> > -	if ((connector->display_info.monitor_range.min_vfreq =3D=3D 0 ||
> > -	     connector->display_info.monitor_range.max_vfreq =3D=3D 0))
> > +	if (is_monitor_range_invalid(connector))
> >  		parse_edid_displayid_vrr(connector, edid);
> > =20
> > -	if (edid && (sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT ||
> > -		     sink->sink_signal =3D=3D SIGNAL_TYPE_EDP)) {
> > -		if (amdgpu_dm_connector->dc_link &&
> > -		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing=
_param) {
> > -			amdgpu_dm_connector->min_vfreq =3D connector->display_info.monitor_=
range.min_vfreq;
> > -			amdgpu_dm_connector->max_vfreq =3D connector->display_info.monitor_=
range.max_vfreq;
> > -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq=
 > 10)
> > -				freesync_capable =3D true;
> > -		}
> > +	if (sink->sink_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT ||
> > +	    sink->sink_signal =3D=3D SIGNAL_TYPE_EDP) {
> > =20
> > -		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> > +		if (dpcd_caps.allow_invalid_MSA_timing_param)
> > +			freesync_capable =3D copy_range_to_amdgpu_connector(connector);
> > =20
> > -		if (vsdb_info.replay_mode) {
> > -			amdgpu_dm_connector->vsdb_info.replay_mode =3D vsdb_info.replay_mod=
e;
> > -			amdgpu_dm_connector->vsdb_info.amd_vsdb_version =3D vsdb_info.amd_v=
sdb_version;
> > +		/* eDP */
> > +		if (edid)
>=20
> Same here, I'm not entirely sure whether moving the edid
> check down here won't have a subtle behavior change.
>=20
> I'd like to be either convinced that these things cannot
> change behavior, or I'd like to see this broken out into
> two patches, (1) a true refactor patch, without possible
> behavior changes, and (2) another patch that might affect
> behavior.

Will do. Now that I'm looking at this with a clear head, it's too much
in one go even for me :) I think this will end up as 3-4 patches to
clean up the vsdb parsing functions as well.

>=20
> Overall I'm in favor of the changes and thank you for
> cleaning this up. I'm just worried about subtle bugs.
>=20
> Harry
>=20
> > +			parse_amd_vsdb_did(amdgpu_dm_connector, edid, &vsdb_did);
> > +
> > +		if (vsdb_did.replay_mode) {
> > +			amdgpu_dm_connector->vsdb_info.replay_mode =3D vsdb_did.replay_mode=
;
> > +			amdgpu_dm_connector->vsdb_info.amd_vsdb_version =3D vsdb_did.amd_vs=
db_version;
> >  			amdgpu_dm_connector->as_type =3D ADAPTIVE_SYNC_TYPE_EDP;
> >  		}
> > =20
> > -	} else if (drm_edid && sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE=
_A) {
> > -		i =3D parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> > -		if (i >=3D 0 && vsdb_info.freesync_supported) {
> > -			amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
> > -			amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
> > -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq=
 > 10)
> > -				freesync_capable =3D true;
> > -
> > -			connector->display_info.monitor_range.min_vfreq =3D vsdb_info.min_r=
efresh_rate_hz;
> > -			connector->display_info.monitor_range.max_vfreq =3D vsdb_info.max_r=
efresh_rate_hz;
> > -		}
> > +	} else if (sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A && vsdb_i=
nfo.freesync_supported) {
> > +		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> > +		freesync_capable =3D copy_range_to_amdgpu_connector(connector);
> >  	}
> > =20
> >  	if (amdgpu_dm_connector->dc_link)
> >  		as_type =3D dm_get_adaptive_sync_support_type(amdgpu_dm_connector->d=
c_link);
> > =20
> > -	if (as_type =3D=3D FREESYNC_TYPE_PCON_IN_WHITELIST) {
> > -		i =3D parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> > -		if (i >=3D 0 && vsdb_info.freesync_supported && vsdb_info.amd_vsdb_v=
ersion > 0) {
> > +	if (as_type =3D=3D FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.frees=
ync_supported) {
> > +		amdgpu_dm_connector->pack_sdp_v1_3 =3D true;
> > +		amdgpu_dm_connector->as_type =3D as_type;
> > +		amdgpu_dm_connector->vsdb_info =3D vsdb_info;
> > =20
> > -			amdgpu_dm_connector->pack_sdp_v1_3 =3D true;
> > -			amdgpu_dm_connector->as_type =3D as_type;
> > -			amdgpu_dm_connector->vsdb_info =3D vsdb_info;
> > -
> > -			amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
> > -			amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
> > -			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq=
 > 10)
> > -				freesync_capable =3D true;
> > -
> > -			connector->display_info.monitor_range.min_vfreq =3D vsdb_info.min_r=
efresh_rate_hz;
> > -			connector->display_info.monitor_range.max_vfreq =3D vsdb_info.max_r=
efresh_rate_hz;
> > -		}
> > +		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> > +		freesync_capable =3D copy_range_to_amdgpu_connector(connector);
> >  	}
> > =20
> >  update:
>=20
