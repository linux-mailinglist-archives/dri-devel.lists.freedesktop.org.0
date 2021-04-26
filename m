Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7136B261
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 13:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62689FD7;
	Mon, 26 Apr 2021 11:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409289FC3;
 Mon, 26 Apr 2021 11:33:48 +0000 (UTC)
IronPort-SDR: frFJWPg3oNr07nP0909qIJ9aVqv8SpeDa3X0oryEyyaSRdfzHI45LefvfDaXzvb845bsUWe80E
 CoF49rLXepUw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196378668"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196378668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 04:33:46 -0700
IronPort-SDR: yihyOgeDCK01Q+WFBYzKIzpXnFACw2a8HX0PVwUNo5Yt+8F1ciYRI5Tru1X8I/R3KVFxifiok2
 yNsm/xgTasLw==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429361896"
Received: from unknown (HELO localhost) ([10.252.50.197])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 04:33:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2] drm/i915: Invoke BXT _DSM to enable MUX on HP
 Workstation laptops
In-Reply-To: <CAAd53p5=LqxKZGTARpvVCC2hcZP4aQPqjD6WszTDuQfv2owhfA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210423044700.247359-1-kai.heng.feng@canonical.com>
 <87fszh78tf.fsf@intel.com>
 <CAAd53p5=LqxKZGTARpvVCC2hcZP4aQPqjD6WszTDuQfv2owhfA@mail.gmail.com>
Date: Mon, 26 Apr 2021 14:33:37 +0300
Message-ID: <87r1ix5lgu.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Apr 2021, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> On Fri, Apr 23, 2021 at 3:35 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Fri, 23 Apr 2021, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> > On HP Fury G7 Workstations, graphics output is re-routed from Intel GFX
>> > to discrete GFX after S3. This is not desirable, because userspace will
>> > treat connected display as a new one, losing display settings.
>> >
>> > The expected behavior is to let discrete GFX drives all external
>> > displays.
>> >
>> > The platform in question uses ACPI method \_SB.PCI0.HGME to enable MUX.
>> > The method is inside the BXT _DSM, so add the _DSM and call it
>> > accordingly.
>> >
>> > I also tested some MUX-less and iGPU only laptops with the BXT _DSM, no
>> > regression was found.
>>
>> I don't know whether this change is the right thing to do. I don't know
>> if it isn't either. Need to look into it.
>>
>> However, I have some general comments, inline.
>>
>> >
>> > v2:
>> >  - Forward declare struct pci_dev.
>> >
>> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3113
>> > References: https://lore.kernel.org/intel-gfx/1460040732-31417-4-git-send-email-animesh.manna@intel.com/
>> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_acpi.c | 17 +++++++++++++++++
>> >  drivers/gpu/drm/i915/display/intel_acpi.h |  3 +++
>> >  drivers/gpu/drm/i915/i915_drv.c           |  5 +++++
>> >  3 files changed, 25 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
>> > index 833d0c1be4f1..c7b57c22dce3 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
>> > @@ -14,11 +14,16 @@
>> >
>> >  #define INTEL_DSM_REVISION_ID 1 /* For Calpella anyway... */
>> >  #define INTEL_DSM_FN_PLATFORM_MUX_INFO 1 /* No args */
>> > +#define INTEL_DSM_FN_PLATFORM_BXT_MUX_INFO 0 /* No args */
>> >
>> >  static const guid_t intel_dsm_guid =
>> >       GUID_INIT(0x7ed873d3, 0xc2d0, 0x4e4f,
>> >                 0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
>> >
>> > +static const guid_t intel_bxt_dsm_guid =
>> > +     GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
>> > +               0x9d, 0x15, 0xc7, 0x1f, 0xba, 0xda, 0xe4, 0x14);
>> > +
>> >  static char *intel_dsm_port_name(u8 id)
>> >  {
>> >       switch (id) {
>> > @@ -176,6 +181,18 @@ void intel_unregister_dsm_handler(void)
>> >  {
>> >  }
>> >
>> > +void intel_bxt_dsm_detect(struct pci_dev *pdev)
>>
>> Please leave out bxt from the naming and make the argument struct
>> drm_i915_private *i915. Mmh, then it conflicts with existing
>> intel_dsm_detect(), maybe we need a more descriptive name altogether?
>
> If there's no oppose, I'll change it to intel_hp_dsm_detect() in v2.
> So far, I've only seen that DSM in HP platform.

I'd rather have generic calls with generic naming from appropriate
places in the driver, and then hide the ugly platform or device specific
details within the calls. I certainly don't want any references to a
specific OEM in function names in functions called from the highest
levels of driver probe/resume/etc.

BR,
Jani.

>
>>
>> > +{
>> > +     acpi_handle dhandle;
>> > +
>> > +     dhandle = ACPI_HANDLE(&pdev->dev);
>> > +     if (!dhandle)
>> > +             return;
>> > +
>> > +     acpi_evaluate_dsm(dhandle, &intel_bxt_dsm_guid, INTEL_DSM_REVISION_ID,
>> > +                       INTEL_DSM_FN_PLATFORM_BXT_MUX_INFO, NULL);
>> > +}
>> > +
>> >  /*
>> >   * ACPI Specification, Revision 5.0, Appendix B.3.2 _DOD (Enumerate All Devices
>> >   * Attached to the Display Adapter).
>> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
>> > index e8b068661d22..d2d560d63bb3 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_acpi.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
>> > @@ -6,15 +6,18 @@
>> >  #ifndef __INTEL_ACPI_H__
>> >  #define __INTEL_ACPI_H__
>> >
>> > +struct pci_dev;
>> >  struct drm_i915_private;
>> >
>> >  #ifdef CONFIG_ACPI
>> >  void intel_register_dsm_handler(void);
>> >  void intel_unregister_dsm_handler(void);
>> > +void intel_bxt_dsm_detect(struct pci_dev *pdev);
>> >  void intel_acpi_device_id_update(struct drm_i915_private *i915);
>> >  #else
>> >  static inline void intel_register_dsm_handler(void) { return; }
>> >  static inline void intel_unregister_dsm_handler(void) { return; }
>> > +static inline void intel_bxt_dsm_detect(struct pci_dev *pdev) { return; }
>> >  static inline
>> >  void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>> >  #endif /* CONFIG_ACPI */
>> > diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
>> > index 785dcf20c77b..57b12068aab4 100644
>> > --- a/drivers/gpu/drm/i915/i915_drv.c
>> > +++ b/drivers/gpu/drm/i915/i915_drv.c
>> > @@ -853,6 +853,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> >       if (ret)
>> >               goto out_cleanup_gem;
>> >
>> > +     intel_bxt_dsm_detect(pdev);
>> > +
>>
>> The call sites in i915_driver_probe() and i915_drm_resume() seem rather
>> arbitrary.
>
> Yes, because what it really does is flipping a bit in one GPIO, the
> EC/hardware will change the MUX based on the GPIO bit.
> So it doesn't have any ordering needs to be enforced.
>
>>
>> Long term, I'd like most or all of the display stuff like this placed in
>> appropriate intel_modeset_*() functions in display/intel_display.c. I'm
>> not keen on having new and very specific calls in the higher levels.
>>
>> At probe, feels like the routing should happen earlier, before output
>> setup? In intel_modeset_init_nogem()?
>
> OK, I'll put that in intel_modeset_init_hw() to cover both probe and
> resume routines.
>
> Kai-Heng
>
>
>>
>> >       i915_driver_register(i915);
>> >
>> >       enable_rpm_wakeref_asserts(&i915->runtime_pm);
>> > @@ -1215,6 +1217,7 @@ int i915_suspend_switcheroo(struct drm_i915_private *i915, pm_message_t state)
>> >  static int i915_drm_resume(struct drm_device *dev)
>> >  {
>> >       struct drm_i915_private *dev_priv = to_i915(dev);
>> > +     struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>> >       int ret;
>> >
>> >       disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>> > @@ -1271,6 +1274,8 @@ static int i915_drm_resume(struct drm_device *dev)
>> >
>> >       intel_gvt_resume(dev_priv);
>> >
>> > +     intel_bxt_dsm_detect(pdev);
>> > +
>>
>> In intel_display_resume() perhaps?
>>
>> (Yay for confusing naming wrt display and modeset, it's a
>> work-in-progress.)
>>
>> BR,
>> Jani.
>>
>>
>> >       enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>> >
>> >       return 0;
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
