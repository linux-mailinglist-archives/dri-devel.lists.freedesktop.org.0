Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBV4L8JNoGnvhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:42:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025AF1A6D17
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D5210E027;
	Thu, 26 Feb 2026 13:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ITf0aIxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3E610E931
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:42:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b9356452351so11647666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772113340; x=1772718140; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8Yew8OpH5AIziFpFPDFNxtnqOMKVJfhBoAbJ3Hh32Xo=;
 b=ITf0aIxnsoOZcSKhKss1fpqvM+D1kA4P+TO/K3atLjK1t0/uru0JSUcpXJZvF6hqYZ
 7qMqGS4aZYIJjFE8lkBIUtS0mr/k9lzuHaNV0Uh2D4Ddl5DBtXWPfs2FRSuJblU0Xrfj
 p+wNQ94nbcxzMtM/HBT1rnDVA16tUiYKCmFPugMvKwmvsCAzoDJdJsWvUP+bwib+sXAS
 7hPEg/KDNKh7e4DFbRvQph8eXOQqTO85Qm3U2BLiA/IujiU5CICf7/YeeblXWGpN2oOv
 GLoILj8Yh9ExcSY9QwsNqJ4hrHAk2ox6g2O1WeshSS653smSdShG72oVRCBCkzp3d43E
 l7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772113340; x=1772718140;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8Yew8OpH5AIziFpFPDFNxtnqOMKVJfhBoAbJ3Hh32Xo=;
 b=QJDl6NQnjnlAMIcuwxGbAO/CdV8+7GBoLPMY2uc4IVzEF+KJttvBiDiyV8Fo0k988D
 SX3ngvcueKKEJDqrgq2vFK1znxhIPKVY5tFEiqdDLGK2EL0khQZcqtsyfKFmjC7u7Ruz
 tDWNbr84DXhR23zCRM04cwB5CaKzcSlwJ3M8236vLWn5gWRzMeV/DcLqyjkhrPIzagbH
 xlT79CLTAgJFUkUrWrDuzR1t5g8PFRkZQruqr3Wr2E4Kbex0xhBxDnUicgg9p8L78qyA
 Bpo+8bpCF5Q5YFWbr3Rfgqe34DthgA2GpwncGazm1G/meDKhuNZAafGgfqb64tAHWq52
 SffA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUacP6veFO0YiaydddYni1wLZOtoQ6fg5ZoPUa1ZXVA7xwgpi+oJUbQFBJDMf+HRSl1Gq5WRKRYSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwV9AIxjEBjA5FBgyP3cGEfUNalcQ/47etcenvwMBBt4OJkjed
 tVUnbbS8PanQZ1fyHMBP+YIeCl8wbh4bZTy7mV+6ugnW+ab0UZ0ykfaO
X-Gm-Gg: ATEYQzwv6XRkuOAVDxIbJUo5FpwL15S0K8v0EUOz9B/xr61y7QgMBJnxyTpzQwfzTLY
 3fEM7tmMa33AR2C2lSYNl3Cxh0qzD3CUmwpKHR26TXcl4v3VHiK//fA/E9uU8EEn5ZV3T3Cc/fW
 nnBI2hClbpYZvjzoQzCJ0/PhlO7MbhsfV4OnFotN2gsARkyOmAWjIv0eTYM5uI6jmxyeZzFPk9A
 b8K4GoB5wVZPyBnXz/zrK2Xvtm19NrAahPSgU1Z9NBFp+Dxn1ayl7LnQSIUbB7w5BlHgaf8YPtA
 jvOqXY+1wcqPF4mWEkEfCQBQk4WNUwmlzX7ao1DjD1cdmn96cfT/ZtH8wqKjWRwcbjxbJOCauA/
 M1AI1xsbX0r+yzLDsjURKYBnTBMh3dyoKT0TzYoLQDsEGKxiW20Pft0+3upqJB7z5xehRXHUCop
 Y/zUBlJndrnAGj2M2YHHpzDwWmYuBtna3VByIBzzddFlSGliwixKaNN9c7ImEY5KsySzNqii7vQ
 sQ7Sg4XGSM=
X-Received: by 2002:a17:907:9494:b0:b73:99f7:8130 with SMTP id
 a640c23a62f3a-b9081b6dc66mr674893266b.6.1772113339377; 
 Thu, 26 Feb 2026 05:42:19 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935aeee867sm57475266b.66.2026.02.26.05.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 05:42:18 -0800 (PST)
Message-ID: <ab713383e6651c50902f3f77aae02ab3c276a78b.camel@gmail.com>
Subject: Re: [PATCH v4 07/27] drm/amd/display: Use bigger VRR range if found
 in AMD vsdb
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com, 
 harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, 	michel.daenzer@mailbox.org, daniel@fooishbar.org
Date: Thu, 26 Feb 2026 14:42:15 +0100
In-Reply-To: <7da80c4be3e20c126017646f783b80136bb0700e@intel.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
 <20260216164516.36803-8-tomasz.pakula.oficjalny@gmail.com>
 <7da80c4be3e20c126017646f783b80136bb0700e@intel.com>
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
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:bernhardberger@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.635];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 025AF1A6D17
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 14:36 +0200, Jani Nikula wrote:
> On Mon, 16 Feb 2026, Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.co=
m> wrote:
> > [Why]
> > Some monitors only expose their full VRR range in AMD vsdb for some
> > reason.
> >=20
> > [How]
> > Compare exposed ranges and use the bigger one.
> > Only adjust lower limit if it doesn't support LFC
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4177
> > Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index b3bf5e0c19a5..f36059bb0324 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -13269,6 +13269,34 @@ static bool copy_range_to_amdgpu_connector(str=
uct drm_connector *conn)
> >  	return is_freesync_capable(range);
> >  }
> > =20
> > +static void extend_range_from_vsdb(struct drm_display_info *display,
> > +				   const struct amdgpu_hdmi_vsdb_info *vsdb)
> > +{
> > +	u16 vrr_min =3D display->monitor_range.min_vfreq;
> > +	u16 vrr_max =3D display->monitor_range.max_vfreq;
> > +
> > +	/* Always extend upper limit */
> > +	if (vsdb->max_refresh_rate_hz > vrr_max)
> > +		vrr_max =3D vsdb->max_refresh_rate_hz;
> > +
> > +	/*
> > +	 * Only extend lower limit if current one disables LFC.
> > +
> > +	 * During widespread testing, we found that some manufacturers probab=
ly
> > +	 * had issues with their monitors' lower VRR boundaries and adjusted
> > +	 * them up (Gigabyte X34GS with official range 48 - 180, AMD vsdb 48 =
-
> > +	 * 180 yet Monitor Ranges 55 - 180). After setting the lower boundary
> > +	 * from AMD vsdb, such monitors start having blanking issues.
> > +	 *
> > +	 * Work around that by not touching VRR min if it still supports LFC.
> > +	 */
> > +	if (vsdb->min_refresh_rate_hz < vrr_min && (vrr_min * 2 >=3D vrr_max)=
)
> > +		vrr_min =3D vsdb->min_refresh_rate_hz;
> > +
> > +	display->monitor_range.min_vfreq =3D vrr_min;
> > +	display->monitor_range.max_vfreq =3D vrr_max;
>=20
> Random driver code should *not* modify struct drm_display_info,
> especially the fields that drm_edid.c parses. Drivers should cease to
> parse EDID and DisplayID altogether.
>=20
> I'm on the verge of NAKing, to the extent that I have control over this,
> any further improvements on driver EDID/DisplayID parsing, with the
> expectation that everything's moved to shared EDID parser in drm_edid.c
> first, and improved there.
>=20
> BR,
> Jani.

I completely agree with you, and I too am saddened by how selective AMD
can be when contributing to open source, BUT I'm just a guy who figured
out some fixes neglected by them. Not being an AMD employee, I don't
have access to their plans or what has been their idea behind modifying
drm_display_info (probably just a lack of understanding, like in my
case).

If maybe I could get OK from Alex or Harry to completely rip out
drm_display_info modifications from amdgpu_dm_update_freesync_caps, then
sure, but currently, I'm not in a position to do so. Still, it seems
like amdgpu already relies purely on it's internal structs from there on
out, so it should be pretty straightforward.

Moreover, moving all DisplayID and CTA extension parsing would be
amazing, BUT AMD vsdb specification isn't public. Here, amdgpu even uses
firmware to parse it, which is bonkers IMO, but they want to keep their
secrets (for some reason). There always will be some VRR meddling in the
drivers based on hardware features, though I do think AMD should release
their whole Freesync vsdb to the public as other drivers could parse
this info as well, because we can already see it's needed to properly
support all monitors.

Hell, even some of my fixes could be moved to general drm code to
facilitate proper VRR range detection.

Going back to the issue at hand, if I could get OK from AMD to rip out
all drm_display_info modifications from amdgpu_dm_update_freesync_caps
then it won't be a problem, but until then, I'm dealing with what I've
been given, doing as little functional, changes as possible. We already
know amdgpu code is... unoptimal, and I wouldn't want to add to that :D

Tomasz

>=20
>=20
> > +}
> > +
> >  /**
> >   * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
> >   *
> > @@ -13339,6 +13367,9 @@ void amdgpu_dm_update_freesync_caps(struct drm_=
connector *connector,
> >  		if (is_monitor_range_invalid(connector))
> >  			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> > =20
> > +		/* Try extending range if found in AMD vsdb */
> > +		extend_range_from_vsdb(&connector->display_info, &vsdb_info);
> > +
> >  		if (dpcd_caps.allow_invalid_MSA_timing_param)
> >  			freesync_capable =3D copy_range_to_amdgpu_connector(connector);
