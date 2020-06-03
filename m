Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862561ED0C0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 15:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFD0899EA;
	Wed,  3 Jun 2020 13:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8525E899EA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 13:28:00 +0000 (UTC)
Date: Wed, 03 Jun 2020 13:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591190877;
 bh=NerdE5rwH+BBzwen4R2RsgY0Djp8ckQk2/J2i0HYMAk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=PpXafqJ3Tm1GuNKeJQnI1OJjvs43SovQM1DQq8dOGNQXzbJeXDT/oLYC5BGGXBOP9
 YKlp91NzXFwYqVWrZuvcKaCPH3W4jRwTOW+rOVprd3oJXFpO8N9TpRx44Oqpqoe+4p
 K90Bnp2jmndPEAXRsZfHfeRLZSPTOLHczDO7JWRk=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document how user-space should use link-status
Message-ID: <M7Ja_vtKU8uXTBBAW_4XJJAeG4Tq-ftcqJEZ_DtlSPqx_yS_zCnYFnKtB5WQQpxz-2hylwWMlDmSKfZz9IkevX4BjXIuj17UyfRwyNSrWL8=@emersion.fr>
In-Reply-To: <20200603123204.6ef5f6b1@eldfell.localdomain>
References: <a3tPhSgOvV4Vn3if_Bqhg-QDwCIVZfHc99EeOVWLRkxOWQoF2tL3QSz-6SLEv3pIJRg2VANaS5rmZUkTkyqi3y0PO9qY84oOa7v_yNFpauY=@emersion.fr>
 <20200603123204.6ef5f6b1@eldfell.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > + *      When user-space performs an atomic commit on a connector with a "BAD"
> > + *      link-status without resetting the property to "GOOD", it gets
> > + *      implicitly reset. This might make the atomic commit fail if the modeset
> > + *      is unsuccessful.
>
> I think this was what Daniel was saying that the kernel should require
> ALLOW_MODESET to be set for the automatic reset, right?

Actually this paragraph isn't true. link-status is only reset to GOOD for
legacy modeset.

But right now this doesn't matter since no driver reads the link-status
property value as far as I can tell. Note, only i915 sets link-status
to BAD.

> I'm fine with how the doc is written now. But if ALLOW_MODESET becomes
> a requirement for the automatic reset, I suspect there is a risk to
> regress Weston, assuming the automatic reset used to be successful.

Right now a commit without ALLOW_MODESET won't reset link-status to GOOD,
but also won't re-train the link on i915. So I think it's fine to require
ALLOW_MODESET.

Should drivers read the value of the link-status property? Or should we
ignore user-space writes to the property and only require ALLOW_MODESET
to re-train the link?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
