Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363545A0DFB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 12:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188C0113666;
	Thu, 25 Aug 2022 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10F411306D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661423760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0n4dqY837mNTXGdz/cVnVTltMFIhOJZdTntnOSeC6R4=;
 b=ABniVhqM5rnk/9pIadzDKfj8Nll+q+UoHk9Bpja9x7cVCTjr3BGzOnCAqmHaqkN2TNXp9S
 QsyyRCV0M3xngaYg23WgkURhGlD2VImLUwLGd7xnTyAna4GpkzFLiiCfxoEUIAPglbIshV
 pOEVx7KNRFRTsWKqjmBzLRrbzFzB3F0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-ZYgDOKdBMHu5hINiZDr-rw-1; Wed, 24 Aug 2022 14:33:46 -0400
X-MC-Unique: ZYgDOKdBMHu5hINiZDr-rw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bq19-20020a05620a469300b006bb70e293ccso15252486qkb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 11:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0n4dqY837mNTXGdz/cVnVTltMFIhOJZdTntnOSeC6R4=;
 b=FPZ6AyUTuOln1st0IuCiDU4Z/XkXpnSh+UvIYyXJN9ZdBnIuJFk1ht1AyxaxCV6AS+
 5hmYdmwGVRyJ91UPhhPKGUnCYUB054AM893AznzibvwGACzJ43KWm9XIdNg/cDWzuEwy
 Ka83XErkvulVl2dl/72zayX5FFzfl00rTNi33w1SxmWjYzxpPRf5nfPSjlK1PWu5u3lM
 8MV632aJoozr0umLWH01B3qw8Tq0SY+lg9UYY9sXZ5oyyKXSb43+Ei92MCSF/n2wcVcx
 WkHezXTo3TYkxtnUsghREBcqDasc+rhDAZPgtzSZkOKDwdGjyI68ZR8sOj76vySVnuEL
 IuMA==
X-Gm-Message-State: ACgBeo0DOmwlYES0/xTu3agVxcBaOwTBuODfyL2HdQAmomzY8Xwv6w25
 T55Cuywk/K3fNgRFSn/H1pgt7jYx2pdc6XN8EVv/iIxBN9zoxlQdcQlcVJjd3KUxrjmAgynJfH3
 fwFyddlzQW/uXBmkfSw10+jReU5LgUtLH93ghvg11F0zx
X-Received: by 2002:a05:620a:29c3:b0:6bb:33ac:9130 with SMTP id
 s3-20020a05620a29c300b006bb33ac9130mr419565qkp.701.1661366025739; 
 Wed, 24 Aug 2022 11:33:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5YNAMRcfgkNYZIACaTJO3W9NnhhxFU0G/NCwVzCMPMo5UtCoVhNkGA66kcYnnRPVt3gi8apd5nzE3r9HNR9ho=
X-Received: by 2002:a05:620a:29c3:b0:6bb:33ac:9130 with SMTP id
 s3-20020a05620a29c300b006bb33ac9130mr419546qkp.701.1661366025540; Wed, 24 Aug
 2022 11:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
 <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
In-Reply-To: <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 24 Aug 2022 20:33:34 +0200
Message-ID: <CACO55tubRD3egnjLd=Qg2u+4_qmURmDY7kb0DxqW7s41_5hS9g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Wed, Aug 24, 2022 at 7:50 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Tue, Aug 16, 2022 at 4:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > > dGFX so external monitors are routed to dGFX, and more monitors can be
> > > supported as result.
> > >
> > > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > > on intel_dsm_guid2. This method is described in Intel document 632107.
> >
> > Is this the policy decision that we want to unconditionally make,
> > though?
>
> I believes so, so more external monitors can be supported at the same time.
>

if there wouldn't be any drawbacks, yes, but sadly there are and I
don't see that hurting _all_ users affected with this by making their
system consume/generate around 10-15W more power/heat just that maybe
one user can use 4 instead of 3 displays at 4K is really worth it...

> Kai-Heng
>
> >
> > BR,
> > Jani.
> >
> > >
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > index e78430001f077..3bd5930e2769b 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
> > >                 0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> > >
> > >  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> > > +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
> > >
> > >  static const guid_t intel_dsm_guid2 =
> > >       GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > > @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> > >       struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > >       acpi_handle dhandle;
> > >       union acpi_object *obj;
> > > +     int supported = 0;
> > >
> > >       dhandle = ACPI_HANDLE(&pdev->dev);
> > >       if (!dhandle)
> > > @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> > >
> > >       obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> > >                               INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> > > -     if (obj)
> > > +     if (obj) {
> > > +             if (obj->type == ACPI_TYPE_INTEGER)
> > > +                     supported = obj->integer.value;
> > > +
> > >               ACPI_FREE(obj);
> > > +     }
> > > +
> > > +     /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> > > +     if (supported & BIT(20)) {
> > > +             obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> > > +                                     INTEL_DSM_REVISION_ID,
> > > +                                     INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> > > +                                     NULL);
> > > +             if (obj)
> > > +                     ACPI_FREE(obj);
> > > +     }
> > >  }
> > >
> > >  /*
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
>

