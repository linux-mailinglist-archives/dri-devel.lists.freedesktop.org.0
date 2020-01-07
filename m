Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A718A132EC7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 19:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663FC6E127;
	Tue,  7 Jan 2020 18:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93ED6E127;
 Tue,  7 Jan 2020 18:57:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 10:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="233314132"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 07 Jan 2020 10:57:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 Jan 2020 20:57:15 +0200
Date: Tue, 7 Jan 2020 20:57:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Message-ID: <20200107185715.GK1208@intel.com>
References: <20191230070516.4760-1-Wayne.Lin@amd.com>
 <87mubaoyi1.fsf@intel.com>
 <DM6PR12MB41375620C8A3030E0C9154CCFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR12MB41375620C8A3030E0C9154CCFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 03:30:47AM +0000, Lin, Wayne wrote:
> [AMD Official Use Only - Internal Distribution Only]
> =

> > ________________________________________
> > From: Jani Nikula <jani.nikula@linux.intel.com>
> > Sent: Monday, December 30, 2019 19:15
> > To: Lin, Wayne; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesk=
top.org
> > Cc: Zuo, Jerry; Kazlauskas, Nicholas; Lin, Wayne
> > Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_=
READ
> >
> > On Mon, 30 Dec 2019, Wayne Lin <Wayne.Lin@amd.com> wrote:
> > > [Why]
> > > According to DP spec, it should shift left 4 digits for NO_STOP_BIT
> > > in REMOTE_I2C_READ message. Not 5 digits.
> > >
> > > [How]
> > > Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case=
 in
> > > drm_dp_encode_sideband_req().
> >
> > Which commit introduced the issue? Fixes: tag. Does it need a stable
> > backport? Does this fix a user visible bug?
> >
> > BR,
> > Jani.
> >
> Thanks for your time and reminder.
> =

> It seems like the issue has been there since very beginning.(commit: ad7f=
8a1).
> It doesn't introduce user visible bug under my test cases, but this affec=
ts the I2C signal
> between I2C master and I2C slave. Not pretty sure if there is any eeprom =
will reset
> the written offset once received I2C stop. If so, that might cause wrongl=
y reading EDID.
> I will Cc to stable. Thanks.

The segment address should be reset on STOP. So large EDIDs should
fail. IIRC we had a bug report of some sort about this which I tried
to fix by confgiuring .no_stop_bit correctly, but apparently I failed
to double check that the bit get stuffed onto the wire correctly.

Ah yes, https://bugs.freedesktop.org/show_bug.cgi?id=3D108081
So you may have just fixed that one, although we seem to have closed
it already.

> > > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/=
drm_dp_mst_topology.c
> > > index 1d1bfa49ca2b..0557e225ff67 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct drm_dp_si=
deband_msg_req_body *req,
> > >                       memcpy(&buf[idx], req->u.i2c_read.transactions[=
i].bytes, req->u.i2c_read.transactions[i].num_bytes);
> > >                       idx +=3D req->u.i2c_read.transactions[i].num_by=
tes;
> > >
> > > -                     buf[idx] =3D (req->u.i2c_read.transactions[i].n=
o_stop_bit & 0x1) << 5;
> > > +                     buf[idx] =3D (req->u.i2c_read.transactions[i].n=
o_stop_bit & 0x1) << 4;
> > >                       buf[idx] |=3D (req->u.i2c_read.transactions[i].=
i2c_transaction_delay & 0xf);
> > >                       idx++;
> > >               }
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
> --
> Wayne Lin
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
