Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3D5B5684
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 10:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011B810E15F;
	Mon, 12 Sep 2022 08:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDD210E139;
 Mon, 12 Sep 2022 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662972283; x=1694508283;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QskuECXvIQDZopSnldJAGVX2vYRzDDH6HfLyqq9sciA=;
 b=DwLG/LBTNfZKDFW6R2sY4p+iohfnRn9s9PiofJAsaLHd4WOb8ZA1cExs
 SvZEuydC0i5rJT6la9SJ0NLWvg9oWMpGwjbvqNlgTDOPkjl1Narr20oJg
 rdYe6rLsVndoNGbs+Dcaq6q/e90Bb1kh4S3RTHDdYYalvGudhXkdP7zgA
 Fp62+Tg2DdIg48wVCRwEWiOjVfFSsKdWK9Kj1ihcSN4pVD4fRnYVv0+RS
 irzQcY/1xKiFxuHvGz0K2OAXX4AVJ1hn50GGGDmydJp5rESpVee4oPMcQ
 tSAaKfIMjLEd8NxxL1HLWzqtXl67j1R8X9HsuxPyG+Eggsaeeb2yFGMel w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="324045278"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="324045278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:44:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="678000152"
Received: from abijaz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.140])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:44:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Aur=C3=A9lien?= <aurelien.intel@ap2c.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Hans de Goede <hdegoede@redhat.com>, Lyude
 <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] Developing a new backlight driver for specific OLED
 screen
In-Reply-To: <115b5a5ebddcd268ee5f7688400448a2@ap2c.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <878rms7emr.fsf@intel.com>
 <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
 <YxsMcH37rRkt0cfj@intel.com> <115b5a5ebddcd268ee5f7688400448a2@ap2c.com>
Date: Mon, 12 Sep 2022 11:44:37 +0300
Message-ID: <87zgf556dm.fsf@intel.com>
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

On Fri, 09 Sep 2022, "Aur=C3=A9lien" <aurelien.intel@ap2c.com> wrote:
> But since this display is independent from the GPU i didn't want to
> link both code.

If it's eDP and uses some proprietary DPCD brightness control mechanism,
I think in practice it usually is somewhat dependent on the GPU.

(OTOH I realize you don't mention eDP. If it's not eDP, DDC/CI is the
more likely way to control brightness than DPCD.)

> For sure. It's an OLED display. Thus there is no backlight. It uses
> specific registers to control the brightness of the screen.

As Lyude said, we have a bunch of "backlight" terminology for historical
reasons, but basically the DP aux, or DPCD, brightness control is mostly
agnostic to the display technology.

> Unfortunately I guess the mechanism is not shared with many OLED
> displays...

Do you have a spec for it? How does it differ from the VESA eDP DPCD
brightness control?


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
