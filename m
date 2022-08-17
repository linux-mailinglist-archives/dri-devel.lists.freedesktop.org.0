Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AE596687
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 03:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEE310E184;
	Wed, 17 Aug 2022 01:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9DA10E198
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:08:15 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 27B4D3F043
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660698494;
 bh=8RZfN86bflzNX9zOyTkt8pbX4x549F+Ksc2dYx3ZFcE=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=m2CSBja9yNY7oi4eX7uVSumvqikKlG8zHRDBckjwnytQxBdjORF0EQ8/PX/cYP0BI
 yVOco9CETz+suuY8TqTvP2+HZouD7CAFVqFCCc+A/DGq5FLU7NPOiXByIdFvucS4Ha
 nyL5euE1Owr63ibdXE7WUUkcch/lJPXyKo8ZdWhZdjE8//Qq11X7pym35mmEbKjD8n
 06D1JKU2mJf1OZyv54KlERltbh6Z8yD4E3aH0fVZyXkazA4HdLxx3eKrv1LPLMEF5v
 eGh5UdZmyruyAX2+edn12YQ4ZTSj2NvCG8aeIWlEz5EALOlfgPqI78HqfWEHtW7au4
 s3AUc3CHcoP8w==
Received: by mail-oi1-f197.google.com with SMTP id
 r2-20020a0568080aa200b00344e241c418so1141934oij.20
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8RZfN86bflzNX9zOyTkt8pbX4x549F+Ksc2dYx3ZFcE=;
 b=fm2uP8XMGmepDtAjDZ5s1x2bh0ZY7XdjK2Jymc3/qYGXkfskRdCnmcmi8GvrYL9ggn
 oLU6NQMQpJlnzAQSfBdRq84Nz5QA0eS+V4xbbrd0Sdjjf91V3L7iXQ93kM14gz3qmWt9
 LjxNyuGqFZP2o84/+TaYtoTMgSvFJLP23NY+T3/00GL+AaAJ6jV7I6ZU4Nk0ZVQuz1fL
 a6UJQJJztuLbhfJtKsHIevH6VjOJpLeu1z01t3LYwBykoSgzHFtVYf58NxKnUNWRWQqK
 +V+M7O+l9hc35Ai0+FwZo/NOvBn8yxjSJyVu1K1XHr4ALMXh6ALXcOQhxdxf6xLhFSmQ
 MC9Q==
X-Gm-Message-State: ACgBeo15En0esaDCauH7l76CtVpDSOHULdAAYfK0vYd6VufoBMqQ5jph
 aP2Wb1xfYPzilFSYvAwsCItj7L6JIMrMu8A3QOnBBYtIC7qqWhPX7Zq+i7gfxkzBUcMgOIYBIwA
 /I4/I4jjKhCl0iKe4lgm4km6SRahaRKF0apL0RbnRfeN716/azh9dl3NdquSL4Q==
X-Received: by 2002:a05:6871:28c:b0:10e:a56a:1c47 with SMTP id
 i12-20020a056871028c00b0010ea56a1c47mr593745oae.176.1660698493046; 
 Tue, 16 Aug 2022 18:08:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wTLz4YBYWGvh2ezo3jAouOVowbIe2Cw4/ISlABCuVaT92INRJqiEL1bjQ1W8/0HPXeqwsTOKf7zZkw5S/Q/c=
X-Received: by 2002:a05:6871:28c:b0:10e:a56a:1c47 with SMTP id
 i12-20020a056871028c00b0010ea56a1c47mr593729oae.176.1660698492800; Tue, 16
 Aug 2022 18:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
 <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
 <b8ebc447ea464371102df765882fc5010cc0c784.camel@redhat.com>
 <d1bf4ebe8378e32fa047ecd8912abf772695534c.camel@redhat.com>
In-Reply-To: <d1bf4ebe8378e32fa047ecd8912abf772695534c.camel@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 17 Aug 2022 09:08:00 +0800
Message-ID: <CAAd53p7b4yGGW9bXWNmAEwnsdSOB7ME_7-RREF9gsU=dZWrQww@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Aug 17, 2022 at 2:36 AM Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2022-08-16 at 14:24 -0400, Lyude Paul wrote:
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
> Doing some quick research, unless the models mentioned in the commit message
> are unreleased some of them are definitely Intel/Nvidia hybrids. So I'm going
> to say:
>
> NAK-by: Lyude Paul <lyude@redhat.com>
>
> If you'd like to resubmit this for systems with amdgpus and Intel only, that's
> perfectly fine with me if the Intel folks are ok with it. But please hold off
> on this for Nvidia systems, at least until we've got GSP reworks functional in
> nouveau. If nvidia's interested in making this work for their driver, they're
> welcome to do the work there. For reference: the main limitations you would
> hit as a result of this patch would be lagginess on the external displays as a
> result of us not being able to reclock the GPU, which means PCIe bandwidth
> will be pretty limited.

The change should be agnostic to any discrete GPU, so I don't think
it's easy to make i915 be aware of the presence of AMD or NVIDIA.
As I replied in previous mail, the external displays may not even work
on Intel GPU, so I really hope we can get this merged.

Will the 'GSP rework' finish anytime soon?

Kai-Heng

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
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
