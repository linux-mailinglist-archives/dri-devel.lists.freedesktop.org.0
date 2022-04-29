Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3785144F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943110F982;
	Fri, 29 Apr 2022 08:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1233E10F982
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:59:30 +0000 (UTC)
Date: Fri, 29 Apr 2022 08:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1651222767;
 bh=/tzNgbqr4NQeGmrHqK6m373jXVDxFwzelu32lprh/Sw=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=TcFFnUXSPplijFCikdU96FHr0gK3QSB1U3y17a+oBzPyObMS/3nAvCPc0Jjx0SlAG
 6GbadK446NaF2UuOjaqnP7VVy74S4dXUyWawnOqHN250XdQOReXNqVMHwiKePojpy5
 Ir/OKJIHvabJcDybBwNSFE2OvAFAGxrdY7ioOD9pj7A4fBCNtUlfc6N26+7VRRzosO
 ZSSycLou9TJjnZKB7V0Nk/xckkmGS17/YVlXsXRjoQDAmGmcY4/y6JSfEOmWe4zdBk
 SppmkBQjanB4dI1O806Cpj8AP5HzMk66v+zUlfUuR4TbWVPaG/atRmFqzeidZhHo47
 7L5OHHvxTnNOQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <vdb4oRbKTPYjAGPcmjKfhcDQbMb1VuiJwF99I3UwkwUAsyEvvq5x7yKdP0mx5tEeNc2idU_qBSlbMM4dlv7apLeDvG3PIAkvRMjwVNKZGCk=@emersion.fr>
In-Reply-To: <0f8e771c-bf0d-f20b-50da-dc84f760ff82@redhat.com>
References: <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <CADnq5_MAx47Ju7_cOt-8rn3V0zRyH5MZNG_4GY+nUiVw6-+h-A@mail.gmail.com>
 <875yncezdt.fsf@intel.com> <YmlNQgaxU7fYnTh6@phenom.ffwll.local>
 <87fslytxk5.fsf@intel.com> <YmlSm/TC1a/0V00S@phenom.ffwll.local>
 <0f8e771c-bf0d-f20b-50da-dc84f760ff82@redhat.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, April 29th, 2022 at 10:55, Hans de Goede <hdegoede@redhat.com> w=
rote:

> I believe that we can fix the new interface, the plan is for there
> to be some helper code to proxy the new connector properties to what
> is still a good old backlight-device internally in the kernel,.
>
> This proxy-ing code could take a minimum value below which it should
> not go when things are set through the properties and then if e.g.
> the /sys/class/backlight interface offers range of 0-65535 and the
> kms driver asks the proxying helper for a minimum of 500, show this
> as 0-65035 on the property, simply adding 500 before sending the
> value to the backlight-device on writes (and subtracting 500 on reads,
> clamping to 0 as lowest value reported on reads).
>
> This way apps using the new API can never go below 500 (in this
> example) and for old API users nothing changes.
>
> Given that Jani seems to be in favor of enforcing some minimal value
> inside the i915 code going forward and also what Alex said that the
> amdgpu code already enforces its own minimum if the video BIOS tables
> don't provide one, it seems that there is consensus that we want 0
> to mean minimum brightness at which the screen is still somewhat
> readable and that we want to enforce this at the kernel level.
>
> Which also means the weird hint property which I came up with won't
> be necessary as we now have a clean definition of what brightness
> 0 is supposed to mean (in the new API) and any cases where this is not
> the case are kernel bugs and should be fixed in the kernel.

Looks like a good approach to me from user-space PoV!
