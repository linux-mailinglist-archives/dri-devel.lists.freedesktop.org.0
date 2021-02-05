Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EE310BBF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAD26F415;
	Fri,  5 Feb 2021 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F606F415
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 13:24:25 +0000 (UTC)
IronPort-SDR: sAcqR6bT+wboe8rU3GhwuvK7rch54gAqi/53wbeS+/f+D5llCrgn1H/n7fxvFcEYlIPn+EsxLi
 a62PQQ8b9+yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="266259982"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="266259982"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 05:24:24 -0800
IronPort-SDR: aS+rBOk+j+5+bJwejQHF/loJJtOuS4YLhMerS8SYm8LqmL6nEu9donoeOafigRuSS/x9xfrC4v
 hWdqWkg2JXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="434448918"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 05 Feb 2021 05:24:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 15:24:20 +0200
Date: Fri, 5 Feb 2021 15:24:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam McNally <sammc@chromium.org>
Subject: Re: [PATCH v3 2/4] drm_dp_mst_topology: use correct AUX channel
Message-ID: <YB1HBDEB5/fefQzi@intel.com>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200923121320.v3.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
 <YBh9HvbIRF4zd+AK@intel.com>
 <2a7c2edc-b83c-dccf-487d-1415b4bc23ff@xs4all.nl>
 <CAJqEsoCOJmS5aVb5du09tXUi7UUKVBQDPe5KTdcBiDr8A7kSYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJqEsoCOJmS5aVb5du09tXUi7UUKVBQDPe5KTdcBiDr8A7kSYA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 04:17:51PM +1100, Sam McNally wrote:
> On Thu, 4 Feb 2021 at 21:19, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 01/02/2021 23:13, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Sep 23, 2020 at 12:13:53PM +1000, Sam McNally wrote:
> > >> From: Hans Verkuil <hans.verkuil@cisco.com>
> > >>
> > >> For adapters behind an MST hub use the correct AUX channel.
> > >>
> > >> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > >> [sammc@chromium.org: rebased, removing redundant changes]
> > >> Signed-off-by: Sam McNally <sammc@chromium.org>
> > >> ---
> > >>
> > >> (no changes since v1)
> > >>
> > >>  drivers/gpu/drm/drm_dp_mst_topology.c | 36 ++++++++++++++++++++++++=
+++
> > >>  1 file changed, 36 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm=
/drm_dp_mst_topology.c
> > >> index 15b6cc39a754..0d753201adbd 100644
> > >> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > >> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > >> @@ -2255,6 +2255,9 @@ drm_dp_mst_topology_unlink_port(struct drm_dp_=
mst_topology_mgr *mgr,
> > >>      drm_dp_mst_topology_put_port(port);
> > >>  }
> > >>
> > >> +static ssize_t
> > >> +drm_dp_mst_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_m=
sg *msg);
> > >> +
> > >>  static struct drm_dp_mst_port *
> > >>  drm_dp_mst_add_port(struct drm_device *dev,
> > >>                  struct drm_dp_mst_topology_mgr *mgr,
> > >> @@ -2271,9 +2274,13 @@ drm_dp_mst_add_port(struct drm_device *dev,
> > >>      port->port_num =3D port_number;
> > >>      port->mgr =3D mgr;
> > >>      port->aux.name =3D "DPMST";
> > >> +    mutex_init(&port->aux.hw_mutex);
> > >> +    mutex_init(&port->aux.cec.lock);
> > >>      port->aux.dev =3D dev->dev;
> > >>      port->aux.is_remote =3D true;
> > >>
> > >> +    port->aux.transfer =3D drm_dp_mst_aux_transfer;
> > >> +
> > >
> > > This was supposed to be handled via higher levels checking for
> > > is_remote=3D=3Dtrue.
> >
> > Ah, I suspect this patch can be dropped entirely: it predates commit 2f=
221a5efed4
> > ("drm/dp_mst: Add MST support to DP DPCD R/W functions").
> >
> > It looks like that commit basically solved what this older patch attemp=
ts to do
> > as well.
> >
> > Sam, can you test if it works without this patch?
> =

> It almost just works; drm_dp_cec uses whether aux.transfer is non-null
> to filter out non-DP connectors. Using aux.is_remote as another signal
> indicating a DP connector seems plausible. We can drop this patch.

Why would anyone even call this stuff on a non-DP connector?
And where did they even get the struct drm_dp_aux to do so?

> Thanks all!
> >
> > Regards,
> >
> >         Hans
> >
> > >
> > >>      /* initialize the MST downstream port's AUX crc work queue */
> > >>      drm_dp_remote_aux_init(&port->aux);
> > >>
> > >> @@ -3503,6 +3510,35 @@ static int drm_dp_send_up_ack_reply(struct dr=
m_dp_mst_topology_mgr *mgr,
> > >>      return 0;
> > >>  }
> > >>
> > >> +static ssize_t
> > >> +drm_dp_mst_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_m=
sg *msg)
> > >> +{
> > >> +    struct drm_dp_mst_port *port =3D
> > >> +            container_of(aux, struct drm_dp_mst_port, aux);
> > >> +    int ret;
> > >> +
> > >> +    switch (msg->request & ~DP_AUX_I2C_MOT) {
> > >> +    case DP_AUX_NATIVE_WRITE:
> > >> +    case DP_AUX_I2C_WRITE:
> > >> +    case DP_AUX_I2C_WRITE_STATUS_UPDATE:
> > >> +            ret =3D drm_dp_send_dpcd_write(port->mgr, port, msg->ad=
dress,
> > >> +                                         msg->size, msg->buffer);
> > >
> > > That doesn't make sense to me. I2c writes and DPCD writes
> > > are definitely not the same thing.
> > >
> > > aux->transfer is a very low level thing. I don't think it's the
> > > correct level of abstraction for sideband.
> > >
> > >> +            break;
> > >> +
> > >> +    case DP_AUX_NATIVE_READ:
> > >> +    case DP_AUX_I2C_READ:
> > >> +            ret =3D drm_dp_send_dpcd_read(port->mgr, port, msg->add=
ress,
> > >> +                                        msg->size, msg->buffer);
> > >> +            break;
> > >> +
> > >> +    default:
> > >> +            ret =3D -EINVAL;
> > >> +            break;
> > >> +    }
> > >> +
> > >> +    return ret;
> > >> +}
> > >> +
> > >>  static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_coun=
t)
> > >>  {
> > >>      if (dp_link_bw =3D=3D 0 || dp_link_count =3D=3D 0)
> > >> --
> > >> 2.28.0.681.g6f77f65b4e-goog
> > >>
> > >> _______________________________________________
> > >> dri-devel mailing list
> > >> dri-devel@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> >

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
