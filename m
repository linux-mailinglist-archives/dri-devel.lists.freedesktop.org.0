Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B496062F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC2310E274;
	Tue, 27 Aug 2024 09:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619410E274
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:49:04 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtN2f5gCjz6DBQl;
 Tue, 27 Aug 2024 17:45:46 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 5DA6F140B2A;
 Tue, 27 Aug 2024 17:49:01 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 10:49:00 +0100
Date: Tue, 27 Aug 2024 10:49:00 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
CC: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
Subject: Re: [PATCH -next 1/5] drm/rockchip: Use
 for_each_child_of_node_scoped()
Message-ID: <20240827104900.00004060@Huawei.com>
In-Reply-To: <5d6debd0-1a02-f631-649e-26fb69e164e2@huawei.com>
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
 <20240823092053.3170445-2-ruanjinjie@huawei.com>
 <20240823123203.00002aac@Huawei.com>
 <5d6debd0-1a02-f631-649e-26fb69e164e2@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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

On Tue, 27 Aug 2024 09:40:07 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> On 2024/8/23 19:32, Jonathan Cameron wrote:
> > On Fri, 23 Aug 2024 17:20:49 +0800
> > Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >  =20
> >> Avoids the need for manual cleanup of_node_put() in early exits
> >> from the loop.
> >>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com> =20
> >=20
> > There is more to do here, and looking at the code, I'm far from
> > sure it isn't releasing references it never had.
> >  =20
> >> ---
> >>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 8 +++-----
> >>  1 file changed, 3 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/dr=
m/rockchip/rockchip_lvds.c
> >> index 9a01aa450741..f5b3f18794dd 100644
> >> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> >> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> >> @@ -548,7 +548,7 @@ static int rockchip_lvds_bind(struct device *dev, =
struct device *master,
> >>  	struct drm_encoder *encoder;
> >>  	struct drm_connector *connector;
> >>  	struct device_node *remote =3D NULL;
> >> -	struct device_node  *port, *endpoint; =20
> >=20
> > Odd extra space before *port in original. Clean that up whilst here.
> >=20
> >  =20
> >> +	struct device_node  *port; =20
> >=20
> > Use __free(device_node) for *port as well. =20
>=20
> Yes=EF=BC=8Cthat is right.
>=20
> >=20
> > So where the current asignment is.
> > 	struct device_node *port =3D of_graph_get_port_by_id(dev->of_node, 1);
> >  =20
> >>  	int ret =3D 0, child_count =3D 0;
> >>  	const char *name;
> >>  	u32 endpoint_id =3D 0;
> >> @@ -560,15 +560,13 @@ static int rockchip_lvds_bind(struct device *dev=
, struct device *master,
> >>  			      "can't found port point, please init lvds panel port!\n");
> >>  		return -EINVAL;
> >>  	}
> >> -	for_each_child_of_node(port, endpoint) {
> >> +	for_each_child_of_node_scoped(port, endpoint) {
> >>  		child_count++;
> >>  		of_property_read_u32(endpoint, "reg", &endpoint_id);
> >>  		ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
> >>  						  &lvds->panel, &lvds->bridge);
> >> -		if (!ret) {
> >> -			of_node_put(endpoint);
> >> +		if (!ret)
> >>  			break; =20
> >=20
> > This then can simply be
> > 			return dev_err_probe(dev, ret,
> > 					     "failed to find pannel and bridge node\n"); =20
> >> -		} =20
>=20
> It seems to me there's no easy way return here, as it will try
> drm_of_find_panel_or_bridge() for each child node, only "child_count =3D
> 0" or all child node  drm_of_find_panel_or_bridge() fails it will error
> and return.
Ah. Good point. That is an odd code structure that I read wrong but it inde=
ed
carries on and ignores the error if for an earlier loop
the drm_of_find_pannel_or_bridge() failed and a later one succeeds.

If you want to make it more 'standard I'd do
if (ret)
	continue;

and have the code code path of the early break 'inline'

e.g.
	for_each_child_of_node(port, endpoint) {
		child_count++;
		of_property_read_u32(endpoint, "reg", &endpoint_id);
		ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
						  &lvds->panel, &lvds->bridge);
		if (ret)
			continue;

		of_node_put(endpoint);
		break;
	}

I'd also be tempted to pull the child_count before this with

if (of_get_child_count() =3D=3D 0) {
	DRM_DEV_ERROR(dev, "...");
	return -EINVAL;

Then can simply check ret at the end of the loop rather than needing
the else if as we can't get there with child_count non zero.
Can also drop the increment of child_count in the loop. So overall that
becomes something like

	if (of_get_child_count(endpoint) =3D=3D 0) {
		DRM_DEV_ERROR(dev, "...");
		return -EINVAL;
	}

	for_each_child_of_node_scoped(port, endpoint) {
		of_property_read_u32(endpoint, "reg", &endpoint_id);
		ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
						  &lvds->panel, &lvds->bridge);
		/* A later child node may succeed */
		if (ret)
			continue;
		break;
	}
	if (ret)
		return dev_err_probe();


>=20
> >=20
> > Various other paths become direct returns as well.
> >  =20
> >>  	} =20
> >=20
> > The later code with remote looks suspect as not obvious who got the ref=
erence that
> > is being put but assuming that is correct, it's another possible place =
for __free based
> > cleanup. =20
>=20
> Yes, the remote looks suspect.
>=20
> >=20
> >  =20
> >>  	if (!child_count) {
> >>  		DRM_DEV_ERROR(dev, "lvds port does not have any children\n"); =20
> >  =20

