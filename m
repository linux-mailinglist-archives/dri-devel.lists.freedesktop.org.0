Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C65011CAFA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 11:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA246ED0D;
	Thu, 12 Dec 2019 10:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AF96ED0D;
 Thu, 12 Dec 2019 10:34:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 02:34:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; d="scan'208";a="388260888"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga005.jf.intel.com with ESMTP; 12 Dec 2019 02:34:28 -0800
Date: Thu, 12 Dec 2019 15:58:43 +0530
From: "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: cleanup intel_bw_state on
 i915 module removal
Message-ID: <20191212102842.GA32588@plaxmina-desktop.iind.intel.com>
References: <20191209143921.9240-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20191211055739.uxe46chnhkc2byul@ldmartin-desk1>
 <20191211064041.GA3339@plaxmina-desktop.iind.intel.com>
 <20191212002250.357dhphi3clst7qy@ldmartin-desk1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212002250.357dhphi3clst7qy@ldmartin-desk1>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 David Airlie <airlied@linux.ie>, Stuart Summers <stuart.summers@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 04:22:50PM -0800, Lucas De Marchi wrote:
> On Wed, Dec 11, 2019 at 12:10:41PM +0530, Bharadiya,Pankaj wrote:
> >On Tue, Dec 10, 2019 at 09:57:39PM -0800, Lucas De Marchi wrote:
> >>On Mon, Dec 09, 2019 at 08:09:02PM +0530, Pankaj Bharadiya wrote:
> >>>intel_bw_state allocated memory is not getting freed even after
> >>>module removal.
> >>>
> >>>kmemleak reported backtrace:
> >>>
> >>>   [<0000000079019739>] kmemdup+0x17/0x40
> >>>   [<00000000d58c1b9d>] intel_bw_duplicate_state+0x1b/0x40 [i915]
> >>>   [<000000007423ed0c>] drm_atomic_get_private_obj_state+0xca/0x140
> >>>   [<00000000100e3533>] intel_bw_atomic_check+0x133/0x350 [i915]
> >>>   [<00000000126d0e0c>] intel_atomic_check+0x1ab7/0x20d0 [i915]
> >>>   [<00000000d5dfc004>] drm_atomic_check_only+0x563/0x810
> >>>   [<00000000c9379611>] drm_atomic_commit+0xe/0x50
> >>>   [<00000000ec82b765>] drm_atomic_helper_disable_all+0x133/0x160
> >>>   [<000000003c44760c>] drm_atomic_helper_shutdown+0x65/0xc0
> >>>   [<00000000414e3e5c>] i915_driver_remove+0xcb/0x130 [i915]
> >>>   [<00000000f8544c2a>] i915_pci_remove+0x19/0x40 [i915]
> >>>   [<000000002dcbd148>] pci_device_remove+0x36/0xb0
> >>>   [<000000003c8c6b0a>] device_release_driver_internal+0xe0/0x1c0
> >>>   [<00000000580e9566>] unbind_store+0xc3/0x120
> >>>   [<00000000869d0df5>] kernfs_fop_write+0x104/0x190
> >>>   [<000000004dc1a355>] vfs_write+0xb9/0x1d0
> >>
> >>what I find strange in this is that the last state was allocated by the
> >>"driver remove" code path.
> >>
> >>>
> >>>Call the drm_atomic_private_obj_fini(), which inturn calls the
> >>>intel_bw_destroy_state() to make sure the intel_bw_state memory is
> >>>freed properly.
> >>>
> >>>Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> >>>---
> >>>drivers/gpu/drm/i915/display/intel_bw.c      | 5 +++++
> >>>drivers/gpu/drm/i915/display/intel_bw.h      | 1 +
> >>>drivers/gpu/drm/i915/display/intel_display.c | 2 ++
> >>>3 files changed, 8 insertions(+)
> >>>
> >>>diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> >>>index dcb66a33be9b..b228671d5a5d 100644
> >>>--- a/drivers/gpu/drm/i915/display/intel_bw.c
> >>>+++ b/drivers/gpu/drm/i915/display/intel_bw.c
> >>>@@ -486,3 +486,8 @@ int intel_bw_init(struct drm_i915_private *dev_priv)
> >>>
n
> >>>	return 0;
> >>>}
> >>>+
> >>>+void intel_bw_cleanup(struct drm_i915_private *dev_priv)
> >>>+{
> >>>+	drm_atomic_private_obj_fini(&dev_priv->bw_obj);
> >>>+}
> >>>diff --git a/drivers/gpu/drm/i915/display/intel_bw.h b/drivers/gpu/drm/i915/display/intel_bw.h
> >>>index 9db10af012f4..20b9ad241802 100644
> >>>--- a/drivers/gpu/drm/i915/display/intel_bw.h
> >>>+++ b/drivers/gpu/drm/i915/display/intel_bw.h
> >>>@@ -25,6 +25,7 @@ struct intel_bw_state {
> >>>
> >>>void intel_bw_init_hw(struct drm_i915_private *dev_priv);
> >>>int intel_bw_init(struct drm_i915_private *dev_priv);
> >>>+void intel_bw_cleanup(struct drm_i915_private *dev_priv);
> >>>int intel_bw_atomic_check(struct intel_atomic_state *state);
> >>>void intel_bw_crtc_update(struct intel_bw_state *bw_state,
> >>>			  const struct intel_crtc_state *crtc_state);
> >>>diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> >>>index 3190aa27ffdc..756eb90b1bb1 100644
> >>>--- a/drivers/gpu/drm/i915/display/intel_display.c
> >>>+++ b/drivers/gpu/drm/i915/display/intel_display.c
> >>>@@ -17912,6 +17912,8 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
> >>>
> >>>	intel_gmbus_teardown(i915);
> >>>
> >>>+	intel_bw_cleanup(i915);
> >>
> >>This doesn't seem to match the (reverse) order of
> >>intel_modeset_init()... but it's actually the gmbus_teardown() that is
> >>out of place. Did you check if it's not a wrong shutdown ordering?
> >>
> >
> >In intel_modeset_init(), intel_gmbus_setup() happens after
> >intel_bw_init().
> >I think the patch follows the reverse ordering properly.
> >Am I missing anything?
> 
> I said it seems that it's the gmbus_teardown() that is out of place.

Hummm. 

> Have you seen my comment above? Why are we duplicating the bw_state on
> the module-remove code path?

I am not exactly sure why duplicating of bw_state happens on removal.

Despite of this, I think we need to have a method to clean up
the resources allocated/initialized using drm_atotomic_private_obj_init()
from intel_bw_init() which is missing at the moment.

Moreover, I am getting below kmemleak trace on my NUC during module
load/unload sequence. 

 backtrace:
    [<00000000fe2b0db8>] intel_bw_init+0x1a/0x50 [i915]
    [<00000000ae7de386>] intel_modeset_init+0x197/0x1d60 [i915]
    [<00000000b520b2d8>] i915_driver_probe+0xae6/0x1520 [i915]
    [<00000000682b3100>] i915_pci_probe+0x3f/0x150 [i915]
    [<00000000efd970df>] local_pci_probe+0x3d/0x90
    [<00000000a05c08fe>] pci_device_probe+0xd5/0x160
    [<000000004fdf5c22>] really_probe+0x1b1/0x300
    [<0000000006397c43>] driver_probe_device+0x4b/0xe0
    [<000000008ac9d085>] device_driver_attach+0x4a/0x50
    [<000000004c50b157>] __driver_attach+0x67/0xb0
    [<000000007e27c7f9>] bus_for_each_dev+0x71/0xb0
    [<0000000042286228>] bus_add_driver+0x177/0x1f0
    [<000000006b066a1f>] driver_register+0x56/0xf0
    [<0000000023883b3a>] do_one_initcall+0x41/0x1df
    [<00000000933062b0>] do_init_module+0x56/0x1f8
    [<00000000dde25517>] load_module+0x201c/0x2700

Freeing up the resources during module unload sequence with
drm_atomic_private_obj_fini() fixes this.

Thanks,
Pankaj

> 
> Lucas De Marchi
> 
> >
> >Thanks,
> >Pankaj
> >
> >>thanks
> >>Lucas De Marchi
> >>
> >>>+
> >>>	destroy_workqueue(i915->flip_wq);
> >>>	destroy_workqueue(i915->modeset_wq);
> >>>
> >>>--
> >>>2.23.0
> >>>
> >>>_______________________________________________
> >>>Intel-gfx mailing list
> >>>Intel-gfx@lists.freedesktop.org
> >>>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
