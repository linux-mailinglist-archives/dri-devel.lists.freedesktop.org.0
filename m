Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A76597565
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 19:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A195E50;
	Wed, 17 Aug 2022 17:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42AA0BBE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660758969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6ujo7+tHLDKQ50eag3ScQLxtrPDDWzfQledOoCebFc=;
 b=OsmDm9J7GuPqzTOB7GMTWeLfn4qZlZZ2OpNR4G7OERev43IIk2HhT8xqh6ix6yS2TZWT+F
 EdJ07xyF6p8ocL0gc2bcqY743ZN40zFzK0D6KskxwDgjhGefGUoPFYH6MTL6ouAHg4gGI2
 MVTo/DAi12e51cKcK+a9wkTIRSj+H58=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-Y1Y-UaYkNGeb4kQJHrDoHQ-1; Wed, 17 Aug 2022 13:56:06 -0400
X-MC-Unique: Y1Y-UaYkNGeb4kQJHrDoHQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so12188785qkb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 10:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=u6ujo7+tHLDKQ50eag3ScQLxtrPDDWzfQledOoCebFc=;
 b=tZLZ8Lmhb3GUHmOvcDNuBv9dLMoE5TNxo++onNOgH6x3zrRmC8Bv745bTPMtY3G0Ay
 eWJbwPnI0GEYgP9yZcEBn4VI9TBZSgtjG1bClOF7GY44Ax/MKpz9B4FcxH9wuvYManmN
 epU4OtvX6E/1FUEiEommQBRTsZMhAY8/DOOG8GSmoPZa+tDuNwo6GeEb6CLJq9hfXyQN
 B42Zvz3H+TWL+uUcwHh1csgNU2i7ipFvwZAQAjWZnAbdvVcGOMMo7Esrltby6jnzbNd7
 5lQua97QfKVoEtu5z/qUk1wPSZvDPscER/8UT82aKszAFDfEqOoan8Y3ukfa8sRHcSKH
 q1Vw==
X-Gm-Message-State: ACgBeo3PXehYBX3Epb857E01J85u/p+eBMOnocOXkzBAIt34+PnA2PTy
 fmbQlxdGQE8d7GWTOQiIDAmI0zAtmLx1yqFm9XVAygIMtlZoWVmJ1UNFtGLNjeCa1eJWWBu3VhB
 aXNq0qJgow8YwB1XotPYNbCEPkwG5
X-Received: by 2002:a05:620a:269a:b0:6b5:b76c:11c9 with SMTP id
 c26-20020a05620a269a00b006b5b76c11c9mr19154896qkp.100.1660758966200; 
 Wed, 17 Aug 2022 10:56:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WDYz+MTlIuAdoJuBIJyS4ztL+6UVgG9kZwAFd70kTJFn9IH7U9Me8NmcInCl8uccQk42Qyg==
X-Received: by 2002:a05:620a:269a:b0:6b5:b76c:11c9 with SMTP id
 c26-20020a05620a269a00b006b5b76c11c9mr19154869qkp.100.1660758965899; 
 Wed, 17 Aug 2022 10:56:05 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 20-20020a370914000000b006b8d1914504sm13417807qkj.22.2022.08.17.10.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 10:56:05 -0700 (PDT)
Message-ID: <35d4da2537d53ade88528dda5668f5b5d2b21e49.camel@redhat.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
From: Lyude Paul <lyude@redhat.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, Mark Pearson
 <markpearson@lenovo.com>
Date: Wed, 17 Aug 2022 13:56:03 -0400
In-Reply-To: <CAAd53p4GoU6_ExWB=0b3_X7STd2Fnq764QpmzgOEwn3jdCUBxQ@mail.gmail.com>
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
 <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
 <b8ebc447ea464371102df765882fc5010cc0c784.camel@redhat.com>
 <CAAd53p4GoU6_ExWB=0b3_X7STd2Fnq764QpmzgOEwn3jdCUBxQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Mark Pearson from Lenovo to this, Mark for reference the original patch
is here:

https://patchwork.freedesktop.org/patch/497807/?series=107312&rev=1

Comments from me down below

On Wed, 2022-08-17 at 09:02 +0800, Kai-Heng Feng wrote:
> On Wed, Aug 17, 2022 at 2:24 AM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > On Tue, 2022-08-16 at 19:29 +0800, Kai-Heng Feng wrote:
> > > On Tue, Aug 16, 2022 at 4:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > > 
> > > > On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > > > > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > > > > dGFX so external monitors are routed to dGFX, and more monitors can be
> > > > > supported as result.
> > > > > 
> > > > > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > > > > on intel_dsm_guid2. This method is described in Intel document 632107.
> > 
> > Is this documentation released anywhere? We've been wondering about these
> > interfaces for quite a long time, and it would be good to know if there's docs
> > for this we haven't really been seeing.
> > 
> > > > 
> > > > Is this the policy decision that we want to unconditionally make,
> > > > though?
> > > 
> > > I believes so, so more external monitors can be supported at the same time.
> > > 
> > > Kai-Heng
> > 
> > Is this for systems with dual Intel GPUs? I ask because if this affects
> > Intel/Nvidia hybrid systems then this is a huge no from me. Nouveau is able to
> > support these systems, but at a limited capacity. This would imply that we are
> > making external displays work for users of the nvidia proprietary driver, at
> > the expense making external display support for mainline kernel users
> > substantially worse for people who are using the mainline kernel. Which isn't
> > a choice we should be making, because nvidia's OOT driver is not a mainline
> > kernel driver.
> 
> Yes it's for Intel/NVIDIA hybrid systems.
> 
> The problem is that hardware vendor design the systems to use NVIDIA
> for external displays, so using external displays on Intel are never
> tested by the vendors.
> I don't think that's any good either.
> 

Sigh, the constant forcing of nvidia hardware into laptops from vendors is
seriously something I wish they would knock it off with considering they're
basically the most difficult hardware vendor to work with.

Anyway, if we -need- to route displays through the external GPU then we can.
But I'd like to at least get convinced first that this is an actual necessity
we should expect for multiple vendors, or the exception to the rule. Because
if these laptops are capable of driving displays through Intel, at the moment
not doing that is a huge downgrade in terms of functionality. -Especially- if
these machines were already working in the field as-is. Probably worth noting
I don't think I have yet to actually hear of any complaints about this being
the case, and I'd like to also make sure this isn't a change being done for
one or two vendors when most vendors aren't actually doing something like
this.

Note that for a lot of systems it won't -technically- be a big difference
since the current situation in the market right now is that a lot of laptops
will have all their external displays routed through the nvidia GPU and
nowhere else. It's not great compared to just being able to use the well
supported Intel GPU for everything though. And if we're controlling display
routing through ACPI, that implies things aren't directly hooked up and
someone went through the hassle of adding a display mux - which kind of seems
like a waste of engineering effort and money if it can't actually be used for
muxing between the two GPUs. Especially considering that up until very
recently muxes had more or less been dropped from the majority of laptop
vendors (I think Dell was an exception for this fwiw).

Mark, since you're from Lenovo can you help to confirm this as well?

Also re: external displays not even working: so then how exactly does the BIOS
handle this? Is the BIOS changing the routing to the nvidia GPU then switching
it back right before the OS load? I assume something must have been done to
make it so that external displays aren't just suddenly broken there.

And re: gsp work being done soon: it's going to be a while unfortunately,
there's a lot for us to catch up on so it's hard for me to give a precise
date.

> Kai-Heng
> 
> > 
> > If this is just for Intel/Intel systems though that's probably fine, and it
> > might also be fine for AMD systems.
> > 
> > > 
> > > > 
> > > > BR,
> > > > Jani.
> > > > 
> > > > > 
> > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
> > > > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > > index e78430001f077..3bd5930e2769b 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > > @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
> > > > >                 0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> > > > > 
> > > > >  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> > > > > +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
> > > > > 
> > > > >  static const guid_t intel_dsm_guid2 =
> > > > >       GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > > > > @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> > > > >       struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > > > >       acpi_handle dhandle;
> > > > >       union acpi_object *obj;
> > > > > +     int supported = 0;
> > > > > 
> > > > >       dhandle = ACPI_HANDLE(&pdev->dev);
> > > > >       if (!dhandle)
> > > > > @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> > > > > 
> > > > >       obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> > > > >                               INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> > > > > -     if (obj)
> > > > > +     if (obj) {
> > > > > +             if (obj->type == ACPI_TYPE_INTEGER)
> > > > > +                     supported = obj->integer.value;
> > > > > +
> > > > >               ACPI_FREE(obj);
> > > > > +     }
> > > > > +
> > > > > +     /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> > > > > +     if (supported & BIT(20)) {
> > > > > +             obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> > > > > +                                     INTEL_DSM_REVISION_ID,
> > > > > +                                     INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> > > > > +                                     NULL);
> > > > > +             if (obj)
> > > > > +                     ACPI_FREE(obj);
> > > > > +     }
> > > > >  }
> > > > > 
> > > > >  /*
> > > > 
> > > > --
> > > > Jani Nikula, Intel Open Source Graphics Center
> > > 
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

