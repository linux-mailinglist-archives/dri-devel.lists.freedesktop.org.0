Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC97F7D1E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 19:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDA710E21E;
	Fri, 24 Nov 2023 18:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 87855 seconds by postgrey-1.36 at gabe;
 Fri, 24 Nov 2023 18:21:28 UTC
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F78C10E21E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1700850086; x=1701109286;
 bh=tklqP5WlNBITcrrtu/7Y/rfccOvMrNe7OMku/6FP7Fg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ze0t5SXH0D78VhxmsUoc2hqfQBwhVcwlQIGmzqbfny3m6Ee49c2tjLhtAgPaqumoG
 kLg5xDIC54atgcd/HVLICUc5LOuRs4lzDhaeYwPjOffkGh+0c+JvuEO20i++yznqRb
 Yn4QK5qUvDeBVEd/HI+Wj24aNhF1GJJELcFL7NRwDio1tghapC4Xk9xAGVC0IAurKL
 KMfWNDX/knJfS87kIezrtHhDRmxXYh/c1I6sgSXnjLE0LrMA6NAgrlKuJftgRf9lDr
 789c7+fFPriGp/hNbKeHx8srEb1VUEHDv1B8o0gChIEkJtuM4Hab4SLjAduMq7Js67
 aGkQMLN84hQBA==
Date: Fri, 24 Nov 2023 18:21:02 +0000
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/irq: Improve error logging for
 unexpected DE Misc interrupts
Message-ID: <gndV3G42eCsG2OKAR133siZZ7f4U37bHozvi7ygSJVBESVZFcu2l_wJNWoziEt58RELJBnVg2N7FJoYz3ZKXDuFBUMkqmTLH_BnDML7_8Ng=@protonmail.com>
In-Reply-To: <SJ1PR11MB612918F5E101E35224C918FEB9B8A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231123175638.27650-1-sergeantsagara@protonmail.com>
 <SJ1PR11MB612918F5E101E35224C918FEB9B8A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Feedback-ID: 26003777:user:proton
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 23rd, 2023 at 11:54 PM, Borah, Chaitanya Kumar <chait=
anya.kumar.borah@intel.com> wrote:
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of =
Rahul
> > Rameshbabu
> > Sent: Thursday, November 23, 2023 11:27 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: Nikula, Jani <jani.nikula@intel.com>; dri-devel@lists.freedesktop.o=
rg;
> > Rahul Rameshbabu <sergeantsagara@protonmail.com>
> > Subject: [Intel-gfx] [PATCH] drm/i915/irq: Improve error logging for
> > unexpected DE Misc interrupts
> >=20
> > Dump the iir value in hex when the interrupt is unexpected.
> >=20
> > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9652#note_21785=
01
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_display_irq.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c
> > b/drivers/gpu/drm/i915/display/intel_display_irq.c
> > index bff4a76310c0..1a5a9e0fc01e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> > @@ -896,7 +896,7 @@ gen8_de_misc_irq_handler(struct drm_i915_private
> > *dev_priv, u32 iir)
> > }
> >=20
> > if (!found)
> > - drm_err(&dev_priv->drm, "Unexpected DE Misc
> > interrupt\n");
> > + drm_err(&dev_priv->drm, "Unexpected DE Misc interrupt:
> > %#x\n", iir);
>=20
>=20
> Nit: It could use a format specifier like "0x%08x" (like other instances =
in the file) to maintain uniform width.

Agreed. I made this change initially for debugging without actually checkin=
g the practices used in the file.
Will send a v2 with this change and your Reviewed-by tag soon. Away from my=
 development machine right now.

> Other than that. LGTM.
>=20
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

--
Thanks,

Rahul Rameshbabu
