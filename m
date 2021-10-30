Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA124407F2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 09:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200966EAA8;
	Sat, 30 Oct 2021 07:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B166EAA8;
 Sat, 30 Oct 2021 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635580322;
 bh=tRYXYZmrS5UzHZaytjPgUmYfGMtddVsiz5chbN/g1nE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZS/ODmCs482V3SpxH25vrML4x5dds+3uYEe8wvjip6cW1O8r3AvRXIgJZXxFTMwYT
 WJM8Vo/8XuHBe7Qu1rRO6qeQgpyS5TfmjZVONae5xkarCCHl50UIPPRT0HHQNKTqMa
 yRkkEimwCBtutUcU3+E47yivnvxfN95l2uOZDtWg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MEm27-1mS5tp1Wup-00GKuV; Sat, 30
 Oct 2021 09:52:02 +0200
Date: Sat, 30 Oct 2021 09:51:50 +0200
From: Len Baker <len.baker@gmx.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Len Baker <len.baker@gmx.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Prefer struct_size over open coded arithmetic
Message-ID: <20211030075150.GA3486@titan>
References: <20211003104258.18550-1-len.baker@gmx.com>
 <20211011092304.GA5790@titan> <87k0ihxj56.fsf@intel.com>
 <YWbIQmD1TGikpRm2@phenom.ffwll.local> <20211016111602.GA1996@titan>
 <877deatzz2.fsf@intel.com> <20211023115020.GC4145@titan>
 <87ee86h5hn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ee86h5hn.fsf@intel.com>
X-Provags-ID: V03:K1:nJ+E6kO3kOeE/a6RCjnW0DGdYOtTwFmROUmXqmeyhKg0w81ta51
 UWWXofq+Ois/ee5qtQOAXJfYrZMkixOzgipT0KsyAQOf64vsMWexSTylpDka0dxCArAJupy
 HSPyTUZ2L2NdgWYuuEo6P2Fq17hx2GeoNrRfvO0XBGRegmpb1Rac3A2H6RRJ7SeHW6egZ1f
 LZsO/+fVFR+K8WaBlLhUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+wnPXYv7YIc=:80wL/GovvA07EHIiq5dqX0
 Gf3hHtnGYTiBu/a0boBPCpKGGLBOkbqL6p4GqfvwsMjMDynTlkEYplRtuVRlqHXuargyItWot
 kIV7prFDNMHaNYiC0IY5xRyC1shRJSHUlKU4qQ35yamZ/A3ipdX31UqGTJSMriSeRLBwgGWAy
 ZWz6MvaHkM+hl+RRa0ZNj+qX2dxCb0nfsaQHCqYyUKzFN2wDSClr8Y17PV5FfPgCc3uQGLBeH
 R5Fjp7se7sB++gInzHkMB38hYCqDJy3CcSrjyN1vqbyl12wDEDYd8PTgHF/lYV5aunwqpD6qH
 psGyekfWSpVO8JMwvHTOG2EracReQV3WtC+hffLgWbACY/h/kL2dEDZwOtFs+LfE3yRJounjR
 FotQWpLaaWCxdcYpNYN5BUb84y9F9yguZZ/9HggzyhZo00ZGxRcG+3KxGdMp+3KuMAFFObmlJ
 e6r7zKsoV/VRuZS5FAWmUIHSnT9w2b0POgiTF+nopvjclbvWpwNoyULfGAUVf2KjCrrOqD2pI
 29HL3p/p2xPF2sCsGFRpwUtVJfVRZhZpAjFt9t0C5f3NNdmGwKbkMUeBJp/J7vmb0/+4nyY6O
 L9IvO4NRpPTIUGz6fwf1wWndwMJt4YtiiNuN6HolzUg////3BxQJIxXiYG4Cz3LnI18uYX4E9
 1CycwSqjVT2CKw/7+FS8Z7krPTUur1eXRTKS0cJkMF63E4ZM6f7ArpAfp+kxO3kAKzQPyfZy6
 O08Ku9WP/aThUMpcfqY4yBjGeM9UpFQ9Sjve2UJVjoA5xf6tjgSWbYk9soIphseOKBEzdTXJ4
 maOZ62AZBeDwLY3i1RrT1+22Av2hZMuhK/Z8jwEoCJILYjapTV36uAYL6t4liZT1NnxmKryP2
 KXh0fEDqXzciMo2Iik4R5bbHbR2b+QPPiY2JQXvA8yU0OUzrnDVs9bHJjPvtEOnucnneJBp+k
 qjXWkgsUyUSxbJQiml4QAEs/EILlTTpkANXQr9mdAeN+SShK9wgdcq9Gf43FLuw2IQ/Yg6a/U
 SwzkBbK/s2JQ8X+zKG0iOt1UIBLIpMrOJnhdCl+EhnVIlHj8WPSmJB6si6P5iO0zATrE91BS2
 1GeaKat8KIQbZQ=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 27, 2021 at 06:06:28PM +0300, Jani Nikula wrote:
> On Sat, 23 Oct 2021, Len Baker <len.baker@gmx.com> wrote:
> > Sorry, but I'm missing something here. In linux-next this is the commi=
t
> > history of include/linux/stddef.h file:
> >
> > 3080ea5553cc stddef: Introduce DECLARE_FLEX_ARRAY() helper
> > 50d7bd38c3aa stddef: Introduce struct_group() helper macro
> > e7f18c22e6be stddef: Fix kerndoc for sizeof_field() and offsetofend()
> > 4229a470175b stddef.h: Introduce sizeof_field()
> > ...
> >
> > But in drm-tip this is the commit history:
> >
> > 4229a470175b stddef.h: Introduce sizeof_field()
> > ...
> >
> > For this patch the DECLARE_FLEX_ARRAY() helper is needed. But the buil=
d
> > fails due to the last tree commits for stddef.h file are not present.
> > So, if I understand correctly, drm-tip is not up to date with linux-ne=
xt.
>
> linux-next is an ephemeral integration branch for most arch, subsystem
> and driver -next branches.
>
> drm-tip is an ephemeral integration branch for drm subsystem and driver
> -next branches.
>
> They contain different sets of branches. They are constantly
> rebuilt. They are not the end result or end goal.
>
> If a problem (or a solution, for that matter) only exists in the merge
> of some of those branches, you can't actually fix it until such a merge
> exists somewhere more permanent than an ephemeral integration branch.

Ok, understood. Thanks for the clarification.

Regards,
Len
