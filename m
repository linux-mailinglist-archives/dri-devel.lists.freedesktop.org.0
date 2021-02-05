Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B905B310C55
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 15:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045806F447;
	Fri,  5 Feb 2021 14:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F75F6F447
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 14:00:30 +0000 (UTC)
IronPort-SDR: 6J+7ZT4OkrTa4vLGbpWBikXXX7n4Kx8fOR2CihkpM2yx5aX3Vasv+RcUhUWr7W6Ok20rF4zrO/
 adhoIXwMhvYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181499101"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="181499101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 06:00:28 -0800
IronPort-SDR: /oyLOQa5dLlgBICMZwszTvwddPxunCdi0z7SqqMGKMq1ORPIncjXUPHwE3Xw1waIAcJh8MSUnv
 ntKHDcjjqIKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="484198514"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 05 Feb 2021 06:00:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 16:00:24 +0200
Date: Fri, 5 Feb 2021 16:00:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 2/4] drm_dp_mst_topology: use correct AUX channel
Message-ID: <YB1PeDETlhqg1GC3@intel.com>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200923121320.v3.2.Ided0ab0808c4908238bd2eb9ebb6ffb2c9312789@changeid>
 <YBh9HvbIRF4zd+AK@intel.com>
 <2a7c2edc-b83c-dccf-487d-1415b4bc23ff@xs4all.nl>
 <CAJqEsoCOJmS5aVb5du09tXUi7UUKVBQDPe5KTdcBiDr8A7kSYA@mail.gmail.com>
 <YB1HBDEB5/fefQzi@intel.com>
 <c577f417-b6c2-6714-8c97-ec6d636bb3a7@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c577f417-b6c2-6714-8c97-ec6d636bb3a7@xs4all.nl>
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
 dri-devel@lists.freedesktop.org, Sam McNally <sammc@chromium.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 02:46:44PM +0100, Hans Verkuil wrote:
> On 05/02/2021 14:24, Ville Syrj=E4l=E4 wrote:
> > On Fri, Feb 05, 2021 at 04:17:51PM +1100, Sam McNally wrote:
> >> On Thu, 4 Feb 2021 at 21:19, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>
> >>> On 01/02/2021 23:13, Ville Syrj=E4l=E4 wrote:
> >>>> On Wed, Sep 23, 2020 at 12:13:53PM +1000, Sam McNally wrote:
> >>>>> From: Hans Verkuil <hans.verkuil@cisco.com>
> >>>>>
> >>>>> For adapters behind an MST hub use the correct AUX channel.
> >>>>>
> >>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >>>>> [sammc@chromium.org: rebased, removing redundant changes]
> >>>>> Signed-off-by: Sam McNally <sammc@chromium.org>
> >>>>> ---
> >>>>>
> >>>>> (no changes since v1)
> >>>>>
> >>>>>  drivers/gpu/drm/drm_dp_mst_topology.c | 36 +++++++++++++++++++++++=
++++
> >>>>>  1 file changed, 36 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/dr=
m/drm_dp_mst_topology.c
> >>>>> index 15b6cc39a754..0d753201adbd 100644
> >>>>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> >>>>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> >>>>> @@ -2255,6 +2255,9 @@ drm_dp_mst_topology_unlink_port(struct drm_dp=
_mst_topology_mgr *mgr,
> >>>>>      drm_dp_mst_topology_put_port(port);
> >>>>>  }
> >>>>>
> >>>>> +static ssize_t
> >>>>> +drm_dp_mst_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_=
msg *msg);
> >>>>> +
> >>>>>  static struct drm_dp_mst_port *
> >>>>>  drm_dp_mst_add_port(struct drm_device *dev,
> >>>>>                  struct drm_dp_mst_topology_mgr *mgr,
> >>>>> @@ -2271,9 +2274,13 @@ drm_dp_mst_add_port(struct drm_device *dev,
> >>>>>      port->port_num =3D port_number;
> >>>>>      port->mgr =3D mgr;
> >>>>>      port->aux.name =3D "DPMST";
> >>>>> +    mutex_init(&port->aux.hw_mutex);
> >>>>> +    mutex_init(&port->aux.cec.lock);
> >>>>>      port->aux.dev =3D dev->dev;
> >>>>>      port->aux.is_remote =3D true;
> >>>>>
> >>>>> +    port->aux.transfer =3D drm_dp_mst_aux_transfer;
> >>>>> +
> >>>>
> >>>> This was supposed to be handled via higher levels checking for
> >>>> is_remote=3D=3Dtrue.
> >>>
> >>> Ah, I suspect this patch can be dropped entirely: it predates commit =
2f221a5efed4
> >>> ("drm/dp_mst: Add MST support to DP DPCD R/W functions").
> >>>
> >>> It looks like that commit basically solved what this older patch atte=
mpts to do
> >>> as well.
> >>>
> >>> Sam, can you test if it works without this patch?
> >>
> >> It almost just works; drm_dp_cec uses whether aux.transfer is non-null
> >> to filter out non-DP connectors. Using aux.is_remote as another signal
> >> indicating a DP connector seems plausible. We can drop this patch.
> > =

> > Why would anyone even call this stuff on a non-DP connector?
> > And where did they even get the struct drm_dp_aux to do so?
> =

> This check came in with commit 5ce70c799ac2 ("drm_dp_cec: check that aux
> has a transfer function"). It seems nouveau and amdgpu specific.

I see.

> =

> A better approach would be to fix those drivers to only call these cec
> functions for DP outputs. I think I moved the test to drm_dp_cec.c primar=
ily
> for robustness (i.e. do nothing if called for a non-DP output). But that
> might not be the right approach after all.

Shrug. I guess just extending to check is_remote (or maybe there is
some other member that's always set?) is a good enough short term
solution. Someone may want to have a look at adjusting
amdgpu/nouveau to not need it, but who knows how much work that is.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
