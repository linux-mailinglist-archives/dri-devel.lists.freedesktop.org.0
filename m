Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A93826BAC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2E10E218;
	Mon,  8 Jan 2024 10:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 575 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jan 2024 10:39:53 UTC
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB4810E218
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:39:53 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id D7EBAA1119;
 Mon,  8 Jan 2024 10:30:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id EFB036000C; 
 Mon,  8 Jan 2024 10:30:11 +0000 (UTC)
Message-ID: <15fdb3f8cb4c0e580678920fd8b9c1a86ecfcd8d.camel@perches.com>
Subject: Re: [PATCH v7 3/9] drm/plane: Add
 drm_for_each_primary_visible_plane macro
From: Joe Perches <joe@perches.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Andy Whitcroft
 <apw@canonical.com>,  Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 08 Jan 2024 02:30:11 -0800
In-Reply-To: <bc0f66cf-877a-4a58-b4ae-daeee3088398@redhat.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-4-jfalempe@redhat.com>
 <bc0f66cf-877a-4a58-b4ae-daeee3088398@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: EFB036000C
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout02
X-Stat-Signature: 54o1c551gfa9kzoanzy9osan4as3pusi
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/oyzSdTV1H4jd3pXaQIhyCk+9Y13h1AB8=
X-HE-Tag: 1704709811-843503
X-HE-Meta: U2FsdGVkX18cG6AAMJBzOgp2TM4dFWLV05l1AvYCZKAJLd3oNkSZhxTVJZ4lck+34xkgwcmo1VHgan4OMBnDvLe9fUAilWxpSIbV5htPZiUeVQGc1T2m2iCN0EI+7dryyHcX7kRHyoebHL6HfXKb0QR8OCcxUzbWV2XL2kcA9Qht8lWlOKwf92Hp/CoVykzL+mb3iYXPKPrXvw1BO9aORJowzfBDmtAzPTinAC+XSzYsd666nJ9iKOLyXrv2EZvABkzreq9j9PrBF/6akF4O1YyCBkd90Dr12UtRXgurBt8qYyhz3z+9MZWy/nfn7R/+
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com, mripard@kernel.org,
 gpiccoli@igalia.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2024-01-08 at 11:24 +0100, Jocelyn Falempe wrote:
> Hi checkpatch maintainers,
>=20
> This patch gives me the following checkpatch error:
>=20
> ERROR: Macros with complex values should be enclosed in parentheses
> #30: FILE: include/drm/drm_plane.h:959:
> +#define drm_for_each_primary_visible_plane(plane, dev) \
> +	list_for_each_entry((plane), &(dev)->mode_config.plane_list, head) \
> +		for_each_if((plane)->type =3D=3D DRM_PLANE_TYPE_PRIMARY && \
> +			    (plane)->state && \
> +			    (plane)->state->fb && \
> +			    (plane)->state->visible)
>=20
> total: 1 errors, 0 warnings, 21 lines checked
>=20
> I think this requirement cannot work when you use list_for_each kind of=
=20
> macros.
> Do you have any suggestion ?
>=20

checkpatch is a brainless regex script.
Ignore it when it's stupid.

