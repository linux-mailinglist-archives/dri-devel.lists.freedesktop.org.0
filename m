Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAD5B3BCD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6803010ECB0;
	Fri,  9 Sep 2022 15:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8BB10E02E;
 Fri,  9 Sep 2022 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662737201; x=1694273201;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gdtSMfteonZGMPcBE4gOUGjRkXMhDssw1knzWUo5j6g=;
 b=Pw+SgIlkw0ohmtwvf11MVM9c7qmdlPhk77nt0qxmKjrT6NDQnw9Bdqaf
 +VpdRrJRguD8GqVfmSK+diB1HJ4cpKTrtAw+Ub9/8afFFPVwlLJdxuYVG
 bXmyKXC0ewvEl/hYDo7p8hDXt9BFrKHNB8Mw3LGrrn1n+8ZjIIVgUGXrL
 XBTfN7mNDc6trqtsJ3RcW/FiNzXpJF+pEwUFpMjqYpt3yBBPfZrXrG8bx
 fFIn92z592W+4n9vVQ/MeeB+MWCLKY4hcO4KlWQ7zYKXFaTmPEYMhOemd
 Glxs0HKouN3UKL+cXcDFI8TX12NI25+0uTSgfigfclvWeLi/8DJFFtryk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="277887177"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="277887177"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:26:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="645569056"
Received: from abaruah-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.45.217])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 08:26:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?utf-8?Q?Aur=C3=A9lien?=
 <aurelien.intel@ap2c.com>, Hans de Goede <hdegoede@redhat.com>, Lyude
 <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] Developing a new backlight driver for specific OLED
 screen
In-Reply-To: <YxsMcH37rRkt0cfj@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
 <YxsMcH37rRkt0cfj@intel.com>
Date: Fri, 09 Sep 2022 18:26:36 +0300
Message-ID: <878rms7emr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Sep 2022, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, Sep 09, 2022 at 11:35:28AM +0200, Aur=C3=A9lien wrote:
>>    Hi,
>>    I hope this mailing-mist is the right place for this question.
>
> + dri-devel mailing list that looks more appropriated.
> + Hans and Lyude who were recently working to standardize some of the
> backlight stuff.
>
>>    I would like to develop a new driver in order to manage backlight for=
 a
>>    specific OLED display (Samsung one). For that propose I need to use t=
he
>>    dpcd aux read and write functions.
>>    Since this driver is independent film the i915 driver I would like to
>>    develop an ind=C3=A9mependant driver.
>>    So my question is: how can I use the i915 API (dpcd aux communication=
s)
>>    outside from the driver and register the backlight sys entries like t=
he
>>    i915 does (in order to have all the softwares which plays with the
>>    backlight working without modifying them) ?
>
> I don't believe you want to use the i915 API, but move the common functio=
ns
> to the drm subsystem itself and then reuse as a drm device.

Aur=C3=A9lien, are you aware of drivers/gpu/drm/display/drm_dp_helper.c and
all the functions around struct dp_aux_backlight and struct
drm_edp_backlight_info?

Also see drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c.

Does the display use some proprietary, non-VESA DPCD registers? There's
already some of that in i915 for Intel proprietary interfaces.


BR,
Jani.



>
>>    Many thanks for your answers
>>    --
>>    Aur=C3=A9lien

--=20
Jani Nikula, Intel Open Source Graphics Center
