Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBjYAPmMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A01AD58A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA9310E9EF;
	Thu, 26 Feb 2026 18:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="E1/Tclh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2A710E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1772029628; x=1772288828;
 bh=P+bmsmdW81wCyqZof9Rdw8Xq3/m0rskQ2x12EcJr8ag=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=E1/Tclh/fr8x8G3sKZJz+Ml7YkTOMjhlbM8k6ytt6dAAWQiCQ6Y8lvpGB5X90aGS2
 zNCyTqdtGZv0Sbwv6OiBWIFYCyuv5HqD8rE97yO7muzZxSc7hQRb0gwVRxPEcdb1jb
 dgbRJsQQ+l0d5V6X8Isjr2yTxq4qkGzd/MB1bn/CnBkDtSO14TBDm+rYn0ogX2YrrL
 NRqUvLVts3sFcJxQyUSN8QTS7k6hFEHLqd2nmGPWH/+KGkZdjI4/ohp98ysgmuhsVB
 UczNrPbzWTvcbU6lyktO48BQqGq+LOc6o5NGj4HM3spyvH8JPW0j38WW0AE/Sd9sg0
 3Yjw0RxshVJZw==
Date: Wed, 25 Feb 2026 14:27:04 +0000
To: Ruben Wauters <rubenru09@aol.com>
From: "hardik.phalet" <hardik.phalet@pm.me>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [drm/gud] RFC: Convert dev_* logging to drm_*() for
 multi-instance GUD devices?
Message-ID: <Jm9Imv-4KyfCKRB0pb5-1ToDa87cWio_j4nPB4HWQbgecFbIpUcTNeGMOLAPAy0xSfrS_n6tfKKmghJ8aeJ3sxhPuHLoRePBO2_hELC6l0w=@pm.me>
In-Reply-To: <b8c179c1e557bfda50be169182d9c1f328693e81.camel@aol.com>
References: <DGLADYEJGEKE.3JJBF0RHQ4T6H@pm.me>
 <c22170a2-b9d9-4cf9-8b10-a56fcb28301b@suse.de>
 <b8c179c1e557bfda50be169182d9c1f328693e81.camel@aol.com>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 80754424c66a2d074ad5aa738c2fc31648c2fdb5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	DATE_IN_PAST(1.00)[27];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rubenru09@aol.com,m:tzimmermann@suse.de,m:seanpaul@chromium.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[aol.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardik.phalet@pm.me,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pm.me:mid,pm.me:dkim]
X-Rspamd-Queue-Id: 786A01AD58A
X-Rspamd-Action: no action

Hi Ruben, hi Thomas,

I=E2=80=99ll pick up the drm_simple_encoder_init() TODO first. Once that=
=E2=80=99s in a good shape, I can look into the logging conversion in GUD a=
s a follow-up.

I=E2=80=99ll send a patch for the encoder cleanup once I have something rea=
dy.

Thanks for the pointers!

regards,
Hardik

On Wednesday, 25 February 2026 at 17:33, Ruben Wauters <rubenru09@aol.com> =
wrote:

> Hi
>=20
> On Wed, 2026-02-25 at 09:48 +0100, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 22.02.26 um 07:45 schrieb Hardik Phalet:
> > > Hi Ruben,
> > >=20
> > > I am looking to work on a small starter task in DRM and was consideri=
ng
> > > converting logging in drivers/gpu/drm/gud from dev_info/dev_warn/dev_=
err
> > > to the drm_*() helpers where a struct drm_device is already (or readi=
ly)
> > > available.
>=20
> My apologies, I seem to have missed this message in the first place, I
> think this is mainly fine.
> > >=20
> > > Since GUD is a USB-backed DRM driver and can have multiple active
> > > instances, using drm_*() would make log messages instance-aware and
> > > consistent with DRM drivers.
> > >=20
> > > Before preparing a patch series, I wanted to check whether this kind =
of
> > > conversion is welcome for GUD, and whether there are any parts of the=
 driver
> > > you would prefer to keep using dev_*() instead of drm_*().
>=20
> In my opinion, logging that relates specifically to USB should use dev
> rather than logging that relates to drm, if it does relate to drm then
> it should be fine to convert them. I'm happy to accept a patch.
> > >=20
> > > If this is fine, I plan to keep the changes mechanical and scoped onl=
y to
> > > call sites where drm_device is already in scope, preserving logging
> > > semantics.
> >=20
> > I'm not Ruben, but generally speaking that conversion of the logging is=
=20
> > ok. But there's not much in gud to convert and the early calls in=20
> > gud_probe() should rather not be converted.
>=20
> I agree with Thomas here, gud_probe() as a function is still a bit of a
> mess, but since it relates to early init, and the early parts are
> mainly to do with USB and capabilities assessment, they should remain
> dev
> >=20
> > If you're looking for an easy task, maybe try open-coding=20
> > drm_simple_encoder_init(). There's an upcoming TODO item at [1].
>=20
> I'm happy for you to do conversions if you want, but this also seems to
> be a good task to do. If not I probably will end up looking at it
> myself eventually.
>=20
> Ruben
> >=20
> > Best regards
> > Thomas
> >=20
> > [1]=20
> > https://lore.kernel.org/dri-devel/20260224153656.261351-17-tzimmermann@=
suse.de/T/#Z2e.:..:20260224153656.261351-17-tzimmermann::40suse.de:1Documen=
tation:gpu:todo.rst
>=20
> > >=20
> > > Thanks,
> > > Hardik
> > >=20
>=20


