Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F8AC5AE3
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 21:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA9510E063;
	Tue, 27 May 2025 19:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JM1vA+tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE47110E063
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 19:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748374856; x=1779910856;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CcNB/LW3IX5MqotXtvEeyQzFZtAd+/ZUkjigVGBmxsk=;
 b=JM1vA+tpeGds9vFJGArwCTw7UukEKbNEb2FtQVpRQ+0l/t+Uktye/OWa
 csjjVkF4Hd2TGm+mAd1vY1oOOsV34lg/pkmWjAg26Y48QPHFF0g80HFVY
 X9cuw4pJAWOt6yPO+5l9ZizAzcGg/CqSR48VG4dc4tO3zcBihXcB/vaWp
 hgx4boUWmVJucIzQFUYWjFKHr9S50MBY5tnsVmMzRdWtqqola0wgzUpmA
 Zw7b0rWauPCGpL3E4mYQYaokX+/M06u1SEvuJMT6jQqxUX5FnWixruxOx
 X9i5ft7fsIRA8M7k50C0m5rnQWM7jfXNkrEP6ifgwcSNKtpOIeUUo5GEx w==;
X-CSE-ConnectionGUID: 0peLZb6XQUC89/nHkC5sJQ==
X-CSE-MsgGUID: ON2Y9djlQB2AMnaGPyw14Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50438821"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50438821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:40:54 -0700
X-CSE-ConnectionGUID: MMYfXGaKR9CuYkjh/uAD1A==
X-CSE-MsgGUID: BnqARss/QlekpmwP32TdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143919633"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:40:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250527-winged-prawn-of-virtuosity-d11a47@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
 <20250527-winged-prawn-of-virtuosity-d11a47@houat>
Date: Tue, 27 May 2025 22:40:49 +0300
Message-ID: <4a1c28b2ad4f701b9b2fe363ebf6acbab504e6ad@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, May 20, 2025 at 01:09:47PM +0300, Jani Nikula wrote:
>> 
>> Maxime -
>> 
>> I'm cutting a lot of context here. Not because I don't think it deserves
>> an answer, but because I seem to be failing at communication.
>> 
>> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> > You still haven't explained why it would take anything more than
>> > registering a dumb device at probe time though.
>> 
>> With that, do you mean a dumb struct device, or any struct device with a
>> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
>> 
>> Is using devm_drm_panel_alloc() like that instead of our own allocation
>> with drm_panel_init() the main point of contention for you? If yes, we
>> can do that.
>
> Yeah, I was thinking of something along the lines of:
>
> const struct drm_panel_funcs dummy_funcs = {};
>
> struct drm_panel *register_panel() {
>     struct faux_device *faux;
>     struct drm_panel *panel;
>     int ret;
>
>     faux = faux_device_create(...);
>     if IS_ERR(faux)
>        return ERR_CAST(faux);
>
>     return __devm_drm_panel_alloc(&faux->dev, sizeof(*panel), 0, &dummy_funcs, $CONNECTOR_TYPE);
> }
>
> And you have a panel, under your control, with exactly the same
> setup than anyone else.

This [1] is what I'm toying with now, but again, draft stuff. Using
__devm_drm_panel_alloc() directly like above does make it cleaner.

Long term it can be improved, but my first dab at refactoring to make
that happen is already like 15-20 patches, and it'll just have to wait
until after making stuff work at all first.

I'm not sure if the ACPI device I'm passing to devm_drm_panel_alloc() is
correct, but it'll have to be *some* ACPI device for the lookup to
work. I am blissfully ignorant about its lifetime, but as long as
drm_panel_add() and drm_panel_remove() remain as they are, I don't think
it leaks anything. Fingers crossed.


BR,
Jani.


[1] https://gitlab.freedesktop.org/jani/linux/-/commit/241f21487e5e9a8fa72e37a8eebcc36099e6a1ee

-- 
Jani Nikula, Intel
