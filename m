Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8833B15903E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 14:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9446EA69;
	Tue, 11 Feb 2020 13:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAD16EA69;
 Tue, 11 Feb 2020 13:47:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 05:47:39 -0800
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="226507295"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 05:47:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH v2 11/12] drm/i915/hdmi: convert to struct drm_device
 based logging macros.
In-Reply-To: <20200206080014.13759-12-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
 <20200206080014.13759-12-wambui.karugax@gmail.com>
Date: Tue, 11 Feb 2020 15:47:33 +0200
Message-ID: <87tv3xz156.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Feb 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> @@ -1364,11 +1372,15 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
>  static int intel_hdmi_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
>  				     u8 *bksv)
>  {
> +	struct drm_i915_private *i915 =
> +		intel_dig_port->base.base.dev->dev_private;

The preferred way to get from intel_digital_port to i915 throughout is

	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);

I realize there are some bad examples in the file; I've posted [1] to
fix them.

BR,
Jani.


[1] http://patchwork.freedesktop.org/patch/msgid/20200211134427.31605-1-jani.nikula@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
