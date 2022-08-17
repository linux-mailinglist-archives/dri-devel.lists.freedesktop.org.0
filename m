Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E853C596680
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 03:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8367A10E093;
	Wed, 17 Aug 2022 01:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2503610E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:02:54 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A3F9F40AFB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660698170;
 bh=xGFP+iN6DfSG465LWXa4neySYOfhkSAdDwVqeXEIiOY=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=JXK2CPifH8Y5Xr992lM+IJCcIkUhqe57Ktl2IX7BA1JpAaNpRuLrcRZX6c5pyugiC
 lR0Mffv3pGjYw/+k33tObXWWJPW8ImjID4ki1a8tjRQLEhki1w4OJ4Iw9yIVt8eVtA
 bBc9o1L1WGYajztQrFJ6FINw1S+A+Y6N6/0Oy6fgAnHMzdJXOQ8WpzfxuRpVwFrzzO
 1xxKTSm4qBggiXs0jjBnB7E9ArxLqZHQHTEgLUloG/iNR0/YKOxhXl1V2sIKo1LnRE
 38mM0AkbJzf7/nfaXPHGMZgFvOSySRFh5rs6GTZYJXndG+lQFXl8C1PPTe/e/mEwAS
 LvaLlkjXdF1pA==
Received: by mail-ot1-f69.google.com with SMTP id
 102-20020a9d04ef000000b0061c50a3c031so4707821otm.18
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xGFP+iN6DfSG465LWXa4neySYOfhkSAdDwVqeXEIiOY=;
 b=ZmYLIREkUZgVgkOOgtlXl9iCtCZE+ROt6Dy807hATiJ5WUIpaVyQWCrkr4dJ1/qoCZ
 nNxB7KGzapHVM+msPuLcAevhRG7knvFDcF2u8Gqa4A+J9GfjLdt+V7F+6iI3wxbX8QtP
 JQWzTxbgxECf5KgoA5SGwQIBV9PmDy7jkBiZEs46G/o+mJaC9iXPUcHnbFUD+/PtVTQt
 uwcP9oVtrI1JZhflSL9ZBQ8Ni2X0SShgxf+IA/eptzjQwSrQ1DLQP/4LiweDgGOc0CcX
 AcZxLQqdu8rdLcBQ4BOhJBa7UzureJjnqJteHJ8Snr7rXV4yIDwI2z7G/Kb0nJyXJqMs
 23zw==
X-Gm-Message-State: ACgBeo0WtYW5aqBaeXk6xXmrT8vry8VeX+BF3GUjYPa7n2i6ARjQ8KjK
 jgVU9kKTrsKrB2rQWIIxNOGuUcR72vOV/mmdN+3Td38A2NhEKaJ3NiWkjrVUfPHAiZpAxqlxcU+
 pFXYVC0JGRYEawWlR8ZZPqgwiuvpuTD4U4hGGDtf+nnW5geQTYOZCOkIaBJkccw==
X-Received: by 2002:a05:6830:6111:b0:61c:ffc8:7b31 with SMTP id
 ca17-20020a056830611100b0061cffc87b31mr8612087otb.161.1660698169058; 
 Tue, 16 Aug 2022 18:02:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73z6anNFKLhpge00ukokz1TzGq6FFULc/+V5V189dILAoBmVpVY84xqlTJtPzP7HPsyjluhfUiB4Zd6VwfWJw=
X-Received: by 2002:a05:6830:6111:b0:61c:ffc8:7b31 with SMTP id
 ca17-20020a056830611100b0061cffc87b31mr8612065otb.161.1660698168681; Tue, 16
 Aug 2022 18:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
 <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
 <b8ebc447ea464371102df765882fc5010cc0c784.camel@redhat.com>
In-Reply-To: <b8ebc447ea464371102df765882fc5010cc0c784.camel@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 17 Aug 2022 09:02:36 +0800
Message-ID: <CAAd53p4GoU6_ExWB=0b3_X7STd2Fnq764QpmzgOEwn3jdCUBxQ@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 2:24 AM Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2022-08-16 at 19:29 +0800, Kai-Heng Feng wrote:
> > On Tue, Aug 16, 2022 at 4:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > >
> > > On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > > > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > > > dGFX so external monitors are routed to dGFX, and more monitors can be
> > > > supported as result.
> > > >
> > > > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > > > on intel_dsm_guid2. This method is described in Intel document 632107.
>
> Is this documentation released anywhere? We've been wondering about these
> interfaces for quite a long time, and it would be good to know if there's docs
> for this we haven't really been seeing.
>
> > >
> > > Is this the policy decision that we want to unconditionally make,
> > > though?
> >
> > I believes so, so more external monitors can be supported at the same time.
> >
> > Kai-Heng
>
> Is this for systems with dual Intel GPUs? I ask because if this affects
> Intel/Nvidia hybrid systems then this is a huge no from me. Nouveau is able to
> support these systems, but at a limited capacity. This would imply that we are
> making external displays work for users of the nvidia proprietary driver, at
> the expense making external display support for mainline kernel users
> substantially worse for people who are using the mainline kernel. Which isn't
> a choice we should be making, because nvidia's OOT driver is not a mainline
> kernel driver.

Yes it's for Intel/NVIDIA hybrid systems.

The problem is that hardware vendor design the systems to use NVIDIA
for external displays, so using external displays on Intel are never
tested by the vendors.
I don't think that's any good either.

Kai-Heng

>
> If this is just for Intel/Intel systems though that's probably fine, and it
> might also be fine for AMD systems.
>
> >
> > >
> > > BR,
> > > Jani.
> > >
> > > >
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
> > > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > index e78430001f077..3bd5930e2769b 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
> > > >                 0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> > > >
> > > >  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> > > > +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
> > > >
> > > >  static const guid_t intel_dsm_guid2 =
> > > >       GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > > > @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> > > >       struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > > >       acpi_handle dhandle;
> > > >       union acpi_object *obj;
> > > > +     int supported = 0;
> > > >
> > > >       dhandle = ACPI_HANDLE(&pdev->dev);
> > > >       if (!dhandle)
> > > > @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> > > >
> > > >       obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> > > >                               INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> > > > -     if (obj)
> > > > +     if (obj) {
> > > > +             if (obj->type == ACPI_TYPE_INTEGER)
> > > > +                     supported = obj->integer.value;
> > > > +
> > > >               ACPI_FREE(obj);
> > > > +     }
> > > > +
> > > > +     /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> > > > +     if (supported & BIT(20)) {
> > > > +             obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> > > > +                                     INTEL_DSM_REVISION_ID,
> > > > +                                     INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> > > > +                                     NULL);
> > > > +             if (obj)
> > > > +                     ACPI_FREE(obj);
> > > > +     }
> > > >  }
> > > >
> > > >  /*
> > >
> > > --
> > > Jani Nikula, Intel Open Source Graphics Center
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
