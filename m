Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48395BF5340
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BD510E58F;
	Tue, 21 Oct 2025 08:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m1jmBeBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95510E591
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:17:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BEECBC0B883;
 Tue, 21 Oct 2025 08:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C2E260680;
 Tue, 21 Oct 2025 08:17:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D961102F23E8; 
 Tue, 21 Oct 2025 10:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761034625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gG6ACXbgHLqntlwpp7tQgheuNdUSppWZPDXL3qYxZVQ=;
 b=m1jmBeBQX2Of+b7bJG6KFBgUDUm4u/8FcEvF3b47qMPqungiRFa+Wu7/8lFduK6BNzuM7E
 /N9mnlGgiSOagEsfHnf1kg5qpJWUGySBJajZYXQI9sdMOZqg78OH7/niqU5qRCvAe6PM2u
 TSI+LOs/R2S9GRwMS7NwAaEuQH7ZVfSpDBUTLNrMB8XJm/cVi1XBfy0MRq7sMrPITrFkx1
 ByxDo2qSP03CS5PMfyMfLkOKGI1oi5hD39/EDpdR+usgJSbA9kRi/n17xkmtDJICtK2lni
 ot7ibrD3VEI0uiRV1xz9n+jz5RQF0r/RVhQP1YGhxiaD8fpKTih0cqa8R5+fkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 10:17:03 +0200
Message-Id: <DDNUO9BL6O0O.39RNS6M98L1IE@bootlin.com>
Subject: Re: [PATCH v2 03/16] drm/atomic: Add new atomic_create_state
 callback to drm_private_obj
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Maxime Ripard"
 <mripard@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-3-6dd60e985e9d@kernel.org>
 <c43t73qbgrimpuinjsjyxcit6cvjflusomjayzv62nvvvmtwuo@elo37btubnul>
 <tx6dccjku67hgkydr5nxgfi7gifxdij7z2e4eslacb35wz6erp@qsqkwcr5mnya>
In-Reply-To: <tx6dccjku67hgkydr5nxgfi7gifxdij7z2e4eslacb35wz6erp@qsqkwcr5mnya>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Maxime, Dmitry,

On Wed Oct 15, 2025 at 2:17 AM CEST, Dmitry Baryshkov wrote:
> On Wed, Oct 15, 2025 at 01:49:33AM +0300, Dmitry Baryshkov wrote:
>> On Tue, Oct 14, 2025 at 11:31:47AM +0200, Maxime Ripard wrote:
>> > The drm_private_obj initialization was inconsistent with the rest of t=
he
>> > KMS objects. Indeed, it required to pass a preallocated state in
>> > drm_private_obj_init(), while all the others objects would have a rese=
t
>> > callback that would be called later on to create the state.
>> >
>> > However, reset really is meant to reset the hardware and software stat=
e.
>> > That it creates an initial state is a side-effect that has been used i=
n
>> > all objects but drm_private_obj. This is made more complex since some
>> > drm_private_obj, the DisplayPort ones in particular, need to be
>> > persistent across and suspend/resume cycle, and such a cycle would cal=
l
>> > drm_mode_config_reset().
>>
>> Doesn't that mean that we need to save private objects's state in
>> drm_atomic_helper_duplicate_state() and restore it in
>> drm_atomic_helper_commit_duplicated_state()? Private objects don't have
>> .atomic_commit() callbacks, but they can be used by other objects during
>> drm_atomic_commit().
>>
>> > Thus, we need to add a new callback to allocate a pristine state for a
>> > given private object.
>> >
>> > This discussion has also came up during the atomic state readout
>> > discussion, so it might be introduced into the other objects later on.
>> >
>> > Until all drivers are converted to that new allocation pattern, we wil=
l
>> > only call it if the passed state is NULL. This will be removed
>> > eventually.
>> >
>> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> > ---
>> >  drivers/gpu/drm/drm_atomic.c | 20 ++++++++++++++++++--
>> >  include/drm/drm_atomic.h     | 13 +++++++++++++
>> >  2 files changed, 31 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic=
.c
>> > index a5c5617266ae1dfe6038baeee6dfa3828c626683..36b56c71cb4e1ddc57577d=
f724efe7d89b4fb6a9 100644
>> > --- a/drivers/gpu/drm/drm_atomic.c
>> > +++ b/drivers/gpu/drm/drm_atomic.c
>> > @@ -793,15 +793,31 @@ int drm_atomic_private_obj_init(struct drm_devic=
e *dev,
>> >  	memset(obj, 0, sizeof(*obj));
>> >
>> >  	drm_modeset_lock_init(&obj->lock);
>> >
>> >  	obj->dev =3D dev;
>> > -	obj->state =3D state;
>> >  	obj->funcs =3D funcs;
>> >  	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
>> >
>> > -	state->obj =3D obj;
>> > +	/*
>> > +	 * Not all users of drm_atomic_private_obj_init have been
>> > +	 * converted to using &drm_private_obj_funcs.reset yet. For the
>> > +	 * time being, let's only call reset if the passed state is
>> > +	 * NULL. Otherwise, we will fallback to the previous behaviour.
>>
>> This comment does no longer reflect the code.
>>
>> > +	 */
>> > +	if (!state) {
>> > +		if (obj->funcs->atomic_create_state) {
>
> Shouldn't this callback be mandatory here? Otherwise we can easily end
> up with the object without a connected state, if the driver doesn't
> implement it.

AFAICT Dmitry's point looks reasonable to me. Should you go along this path=
,
why not adding a

   WARN_ON((!state && !obj->funcs->atomic_create_state) ||
           (state && obj->funcs->atomic_create_state));

to prevent bad usage?

Just my 2c,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
