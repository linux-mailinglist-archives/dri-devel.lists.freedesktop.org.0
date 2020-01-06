Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561191320E5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C91F8985A;
	Tue,  7 Jan 2020 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2DB89C1B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 08:35:33 +0000 (UTC)
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1ioNrH-00033g-TN
 for dri-devel@lists.freedesktop.org; Mon, 06 Jan 2020 08:35:32 +0000
Received: by mail-pj1-f70.google.com with SMTP id z12so10528643pju.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 00:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tUJkQQozsNHPjRDCkf1oaa592cZNd4E3zEgxAi9AoEA=;
 b=EiB5b3uHQiwMGIrfhWnWTRBVO9NPwhZb4W3apzOBM0VY0yJbIml/tnPlahb93JJ580
 UH+tBBUR30ZgOZdN1jRbUUaYc9HKYECuaKxCkVnnphSDUAX5QUSbv+mGG5vANj0O7U+X
 +SaOkOu4+BH78loX6WkNQHetuUGm841JwQM85y3Beet/IveDl4ALGnnovmrPuPU9loCq
 q/0pErLyk2JPk+0Zr2Esv34JfVZsb1H+i4jslfRw4VbDOwiZhxGCYf6ijpaHx3X8PAsy
 95sWFwXhh3LOyb4I08wfAeksBO8aL1rbhruBzW+1fGPtAs2Y2/TjCWSbYC8sLfN+x0yu
 kVIA==
X-Gm-Message-State: APjAAAVNrEECuUE4NYlzZuHYnb5xQIdtc30dgCoC6NI1dcJAwd66Vwj6
 PvetQg6GNYJug/hot+JXJNwZCzznZidCE1P4BnsLCU2fFsGZoEWH5S19iUwvhADbqLci+8cIN+F
 oe0M9f1aj/CBTUOaWlJ5JY2GdUM+AKbugM18J/nYORWDxxg==
X-Received: by 2002:a17:902:9f92:: with SMTP id
 g18mr102350195plq.161.1578299730381; 
 Mon, 06 Jan 2020 00:35:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGt+8LtQorps/GjLgBerFhym3Ndc9LEPYmbKUBg/Y/U3MscdcExRIY/gIf0zpowd3ltXbD7A==
X-Received: by 2002:a17:902:9f92:: with SMTP id
 g18mr102350166plq.161.1578299730046; 
 Mon, 06 Jan 2020 00:35:30 -0800 (PST)
Received: from 2001-b011-380f-35a3-2839-ccbd-36ed-2f4a.dynamic-ip6.hinet.net
 (2001-b011-380f-35a3-2839-ccbd-36ed-2f4a.dynamic-ip6.hinet.net.
 [2001:b011:380f:35a3:2839:ccbd:36ed:2f4a])
 by smtp.gmail.com with ESMTPSA id bo19sm23083748pjb.25.2020.01.06.00.35.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jan 2020 00:35:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v3] drm/i915: Re-init lspcon after HPD if lspcon probe
 failed
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191224084251.28414-1-kai.heng.feng@canonical.com>
Date: Mon, 6 Jan 2020 16:35:26 +0800
Message-Id: <85235F00-7FBA-46E4-B7A5-45294DE1B824@canonical.com>
References: <20191224084251.28414-1-kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 swati2.sharma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

> On Dec 24, 2019, at 16:42, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> On HP 800 G4 DM, if HDMI cable isn't plugged before boot, the HDMI port
> becomes useless and never responds to cable hotplugging:
> [    3.031904] [drm:lspcon_init [i915]] *ERROR* Failed to probe lspcon
> [    3.031945] [drm:intel_ddi_init [i915]] *ERROR* LSPCON init failed on port D
> 
> Seems like the lspcon chip on the system in question only gets powered
> after the cable is plugged.
> 
> So let's call lspcon_init() dynamically to properly initialize the
> lspcon chip and make HDMI port work.

Do you have any further suggestion for this patch?

Kai-Heng

> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/203
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v3:
> - Make sure it's handled under long HPD case.
> 
> v2: 
> - Move lspcon_init() inside of intel_dp_hpd_pulse().
> 
> drivers/gpu/drm/i915/display/intel_dp.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index fe31bbfd6c62..a72c9c041c60 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6573,6 +6573,7 @@ enum irqreturn
> intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
> {
> 	struct intel_dp *intel_dp = &intel_dig_port->dp;
> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> 
> 	if (long_hpd && intel_dig_port->base.type == INTEL_OUTPUT_EDP) {
> 		/*
> @@ -6593,7 +6594,12 @@ intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
> 		      long_hpd ? "long" : "short");
> 
> 	if (long_hpd) {
> -		intel_dp->reset_link_params = true;
> +		if (intel_dig_port->base.type == INTEL_OUTPUT_DDI &&
> +		    HAS_LSPCON(dev_priv) && !intel_dig_port->lspcon.active)
> +			lspcon_init(intel_dig_port);
> +		else
> +			intel_dp->reset_link_params = true;
> +
> 		return IRQ_NONE;
> 	}
> 
> -- 
> 2.17.1
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
