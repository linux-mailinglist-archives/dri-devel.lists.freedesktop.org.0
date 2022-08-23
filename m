Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9059D27C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D5FB04F3;
	Tue, 23 Aug 2022 07:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8FB0523;
 Tue, 23 Aug 2022 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661240602; x=1692776602;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5KP/pCew6b0ZBdnZl0WzUmdoU+eln1vHlY2diUrAr/4=;
 b=LX1RL/63TI5s46aH6aIhV27vI7MQF4etx6amamvd3zsn2gP4k+r7Dn1z
 HWxbckoSbfgODWD0ZadmvMLsI54zkxVeWy66U5kpeySSNWkg8wELiX2Ed
 7RpYtRFEBTtfXR3R5szdUzC1Sj6IY7nUDZXt7XANbF36iVS1PYdGm3nD6
 y2hAKCD5egWJWbTs/EDz9bo6CH/bYecw6Kh4PZQxoW0WgVgSSPS5O8Cky
 3GllMEq0C0WO4PBb8I4dY0VgmKLm65bMcItxVzyln6jQ0TgV7RGxkQ+XR
 bM1g24f8N2NVOL6O8E/1OwiKk+7vhZtUG3JA8DRghC05gLwCvJqy+mJBt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319658387"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="319658387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 00:41:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="669909855"
Received: from bmarkovi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.229])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 00:41:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v6 1/4] drm/i915/hpd: postpone HPD cancel work after
 last user suspension
In-Reply-To: <YwO4COnayeI189qP@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
 <20220722125143.1604709-2-andrzej.hajda@intel.com>
 <YwO4COnayeI189qP@ideak-desk.fi.intel.com>
Date: Tue, 23 Aug 2022 10:41:22 +0300
Message-ID: <87czcrmmot.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Aug 2022, Imre Deak <imre.deak@intel.com> wrote:
> On Fri, Jul 22, 2022 at 02:51:40PM +0200, Andrzej Hajda wrote:
>> i915->hotplug.dig_port_work can be queued from intel_hpd_irq_handler
>> called by IRQ handler or by intel_hpd_trigger_irq called from dp_mst.
>> Since dp_mst is suspended after irq handler uninstall, a cleaner approach
>> is to cancel hpd work after intel_dp_mst_suspend, otherwise we risk
>> use-after-free.
>> 
>> It should fix following WARNINGS:
>> [283.405824] cpu_latency_qos_update_request called for unknown object
>> [283.405866] WARNING: CPU: 2 PID: 240 at kernel/power/qos.c:296 cpu_latency_qos_update_request+0x2d/0x100
>> [283.405912] CPU: 2 PID: 240 Comm: kworker/u64:9 Not tainted 5.18.0-rc6-Patchwork_103738v3-g1672d1c43e43+ #1
>> [283.405915] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
>> [283.405916] Workqueue: i915-dp i915_digport_work_func [i915]
>> [283.406020] RIP: 0010:cpu_latency_qos_update_request+0x2d/0x100
>> ...
>> [283.406040] Call Trace:
>> [283.406041]  <TASK>
>> [283.406044]  intel_dp_aux_xfer+0x60e/0x8e0 [i915]
>> [283.406131]  ? finish_swait+0x80/0x80
>> [283.406139]  intel_dp_aux_transfer+0xc5/0x2b0 [i915]
>> [283.406218]  drm_dp_dpcd_access+0x79/0x130 [drm_display_helper]
>> [283.406227]  drm_dp_dpcd_read+0xe2/0xf0 [drm_display_helper]
>> [283.406233]  intel_dp_hpd_pulse+0x134/0x570 [i915]
>> [283.406308]  ? __down_killable+0x70/0x140
>> [283.406313]  i915_digport_work_func+0xba/0x150 [i915]
>> 
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4586
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5558
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>>  drivers/gpu/drm/i915/i915_irq.c              | 1 -
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index a0f84cbe974fc3..f1c765ac7ab8aa 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -9021,6 +9021,9 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
>>  	 */
>>  	intel_dp_mst_suspend(i915);
>>  
>> +	/* MST is the last user of HPD work */
>> +	intel_hpd_cancel_work(i915);
>> +
>
> MST still requires AUX and short HPD interrupts and during shutdown and
> suspend the order is suspend-MST -> disable-IRQs. So I think it makes
> more sense to move intel_dp_mst_suspend() to i915_driver_remove() before
> intel_irq_uninstall().

The high level i915_driver_remove() code should only call high level
display functions, not something like intel_dp_mst_suspend() directly.

BR,
Jani.

>
>>  	/* poll work can call into fbdev, hence clean that up afterwards */
>>  	intel_fbdev_fini(i915);
>>  
>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>> index 73cebc6aa65072..db14787aef95dd 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.c
>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>> @@ -4597,7 +4597,6 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
>>  
>>  	free_irq(irq, dev_priv);
>>  
>> -	intel_hpd_cancel_work(dev_priv);
>>  	dev_priv->runtime_pm.irqs_enabled = false;
>>  }
>>  
>> -- 
>> 2.25.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
