Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C7621BD6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 19:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921210E4EB;
	Tue,  8 Nov 2022 18:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6C10E4EB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 18:25:43 +0000 (UTC)
Date: Tue, 08 Nov 2022 18:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1667931941; x=1668191141;
 bh=T6k7Oj7EY2w+LC1uS+UDLi5XK+UXqTD36hc3aqLUeoA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=FNPse4MA24s6RhlcgZ6BZL5k9SSoA65INajZwvKl/o2qdpQ6oYYl/fcP+90aNha9u
 t5UBRENp6HkSHsFMY0R5sVSrpXcDEob2tY8/immYwiFuC9+HJUSptIcgwaTtg4tqXS
 LTBS0YywF3zcE7Ag5ar8V+RLEr4Cnqwpi0YufuIhrDtxtMa0ZYKuhOx92nRtSiYbIL
 ghaf00GJJprroM/3LYPgfJBvEDvYavZTefaTo3ivqYbU9ql5/i2IceMvLPZiUwAzzv
 EJ9neF4QJq+84aG2uuyzCeFGft479SKd0/sv75rYaMq9mdWJxAzz7wT9whQ+lPf49d
 RlRIyRvVkGaIA==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
In-Reply-To: <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, daniel.vetter@ffwll.ch,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:

> On 29/10/2022 01:59, Jessica Zhang wrote:
>=20
> > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > drm_plane. In addition, add support for setting and getting the values
> > of these properties.
> >=20
> > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > represents the format of the color fill. Userspace can set enable solid
> > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > framebuffer to NULL.
>=20
> I suppose that COLOR_FILL should override framebuffer rather than
> requiring that FB is set to NULL. In other words, if color_filL_format
> is non-zero, it would make sense to ignore the FB. Then one can use the
> color_fill_format property to quickly switch between filled plane and
> FB-backed one.

That would be inconsistent with the rest of the KMS uAPI. For instance,
the kernel will error out if CRTC has active=3D0 but a connector is still
linked to the CRTC. IOW, the current uAPI errors out if the KMS state
is inconsistent.
