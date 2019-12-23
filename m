Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D3E12A24A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5189A8B;
	Tue, 24 Dec 2019 14:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398B46E402
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 17:53:32 +0000 (UTC)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1ijRta-0007aZ-B0
 for dri-devel@lists.freedesktop.org; Mon, 23 Dec 2019 17:53:30 +0000
Received: by mail-pg1-f200.google.com with SMTP id i21so10992748pgm.21
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 09:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OCo5Ypyu6pu38a6YJ1OXr5ycGEAIBEO34ruxpB+/INg=;
 b=nUMopkuT/IWPnP/jOY9/IE2QcX/45e0rAYURDLjvCIATPveaEBNbT4iN/uwIqR66lW
 LR3C7+OnMh8+Djr45WZ2wCb8mJts3eLR6mSBVFcieBKBTncHUY4YnUkiLqbEvH8+jLYs
 vHSMcsDrEYQX6R6E3xMHictoWNYEeXap/pZ2qjQhvJaDy4mDIzfykVJ1ltkhaUx3lfxz
 nwF+IaZiFNcw1Cv9RBfUOiBJndyZB6eD5IIBraZ1JpRfMzigGhyPJl/wk4+ezrf9F5wr
 SBtdvdvlqCMsky6HTk9JzgYjHu7UDsuvXE+SKONnpYYahJR0l4dmkzbj9NHP43mLZH8/
 JZuA==
X-Gm-Message-State: APjAAAUP1ZCY+xt0m59cvXOtorqwDxOsbF7XatHl7I/3wP6H7JQpEaIe
 4SE0NqU3Y84csADZdz2mKxSkBLB4OWZ2dSBXYq9GkJc6tgHauNXj7Ss/tlMR5jYbxIWOLei0D/L
 Yb0e5CcnrCahm0Qx2XeQPPwDW5B2+74KsSddhVLIzRZmpbg==
X-Received: by 2002:a17:90a:ad48:: with SMTP id w8mr305880pjv.19.1577123608855; 
 Mon, 23 Dec 2019 09:53:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvo2lxDezsV6ekd9axPKc4dlP+f7o4/vuSqg58LAdpfNg1seDqVMU+PZLKykU179GTIDOJzQ==
X-Received: by 2002:a17:90a:ad48:: with SMTP id w8mr305839pjv.19.1577123608621; 
 Mon, 23 Dec 2019 09:53:28 -0800 (PST)
Received: from 2001-b011-380f-35a3-a059-d6a4-0e9a-8360.dynamic-ip6.hinet.net
 (2001-b011-380f-35a3-a059-d6a4-0e9a-8360.dynamic-ip6.hinet.net.
 [2001:b011:380f:35a3:a059:d6a4:e9a:8360])
 by smtp.gmail.com with ESMTPSA id q63sm3585026pfb.149.2019.12.23.09.53.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Dec 2019 09:53:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v2] drm/i915: Re-init lspcon after HPD if lspcon probe
 failed
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87o8vzrljs.fsf@intel.com>
Date: Tue, 24 Dec 2019 01:53:25 +0800
Message-Id: <BD65D1A5-FB91-4A98-80BF-A8AAA84146B5@canonical.com>
References: <20191223171310.21192-1-kai.heng.feng@canonical.com>
 <87o8vzrljs.fsf@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, swati2.sharma@intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Dec 24, 2019, at 01:36, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> On Tue, 24 Dec 2019, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> On HP 800 G4 DM, if HDMI cable isn't plugged before boot, the HDMI port
>> becomes useless and never responds to cable hotplugging:
>> [    3.031904] [drm:lspcon_init [i915]] *ERROR* Failed to probe lspcon
>> [    3.031945] [drm:intel_ddi_init [i915]] *ERROR* LSPCON init failed on port D
>> 
>> Seems like the lspcon chip on the system in question only gets powered
>> after the cable is plugged.
>> 
>> So let's call lspcon_init() dynamically to properly initialize the
>> lspcon chip and make HDMI port work.
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> v2: 
>>  - Move lspcon_init() inside of intel_dp_hpd_pulse().
>> 
>> drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index fe31bbfd6c62..eb395b45527e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -6573,6 +6573,7 @@ enum irqreturn
>> intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
>> {
>> 	struct intel_dp *intel_dp = &intel_dig_port->dp;
>> +	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>> 
>> 	if (long_hpd && intel_dig_port->base.type == INTEL_OUTPUT_EDP) {
>> 		/*
>> @@ -6592,11 +6593,14 @@ intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool long_hpd)
>> 		      intel_dig_port->base.base.name,
>> 		      long_hpd ? "long" : "short");
>> 
>> -	if (long_hpd) {
>> +	if (long_hpd && intel_dig_port->base.type != INTEL_OUTPUT_DDI) {
> 
> With this change, long hpd handling for DDI on platforms that do not
> have LSPCON, or has an active LSPCON, falls through to the short hpd
> handling. That's not what you're after, is it?

You are right, no :(

I'll send a V3.

Kai-Heng

> 
> 
> BR,
> Jani.
> 
> 
>> 		intel_dp->reset_link_params = true;
>> 		return IRQ_NONE;
>> 	}
>> 
>> +	if (long_hpd && HAS_LSPCON(dev_priv) && !intel_dig_port->lspcon.active)
>> +		lspcon_init(intel_dig_port);
>> +
>> 	if (intel_dp->is_mst) {
>> 		if (intel_dp_check_mst_status(intel_dp) == -EINVAL) {
>> 			/*
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
