Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFCC522F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36F10E700;
	Wed, 12 Nov 2025 12:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PWlsQ8EG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63B310E700
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:09:12 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d62J551r1z9tN2;
 Wed, 12 Nov 2025 13:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762949349; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/jfFxFkgvFtBhqkCW0fhyUg2VTjErZY3XEj/JeBLgU=;
 b=PWlsQ8EGGAtNXPJtAF2kfNYzULr3vPE4ZwB51K78dRTBXThWt02zpe1KTVzKvsrHfvoFT9
 zomBk47quzAwuVjOXlB2mDtdyW4/lhnB1Vrk/B1mSX/Q4Q2KcyuAwd/kPVsJZb3AUQNzHr
 9IQ6cNom9ymGqvPqwMxntSh9yrZCy9msq1MWt7ddlNH0YjI9vQvH98Ucy4F6crfDngfvFt
 N6leh5VOj46S6P5d8w55sOjq1TnPakuZfAdYUi2R4t9P4GeO5NvsAnXBwtCzWIKbo1KRaV
 WF6AaOphnEK7J+7twoYj1dT4+jiqQNwWT2vCUMEIYhV2CJ6y0DDKPRGjgbB+Fg==
Message-ID: <95c2ecd1b370d917cf84afbf3120134c0e2d85d3.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Don't crash kernel on wrong params
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Nov 2025 13:09:05 +0100
In-Reply-To: <1e71b41d-38ba-425a-a370-1bb92a772014@ursulin.net>
References: <20251112091851.104443-3-phasta@kernel.org>
 <1e71b41d-38ba-425a-a370-1bb92a772014@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: o3e4d5qbzj16177hbgueg8k1mh7z8hd3
X-MBO-RS-ID: 58c656e39d8f9aec97f
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-11-12 at 09:46 +0000, Tvrtko Ursulin wrote:
>=20
> On 12/11/2025 09:18, Philipp Stanner wrote:
> > drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
> > entity being NULL. If the entity is NULL, subsequent accesses will cras=
h
> > the particular CPU anyways with a NULL pointer exception backtrace.
> >=20
> > Remove the BUG_ON().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Changes in v2:
> > =C2=A0=C2=A0 - Drop BUG_ON() instead of replacing it. (Tvrtko)
>=20
> The option of removing the BUG_ON was conditional on brainstorming a bit=
=20
> whether we think the null pointer dereference is the worst that can=20
> happen or not.
>=20
> Other option was "WARN_ON_ONCE() return" in arm and push.
>=20

Maybe even WARN_ON() is OK to make it noticable.

I mostly care about getting rid of BUG_ON().


P.
