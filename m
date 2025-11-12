Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BACC51194
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70D110E6CA;
	Wed, 12 Nov 2025 08:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXkQrVMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F60610E6CE;
 Wed, 12 Nov 2025 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762935981; x=1794471981;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Dniwzyf76YH6d4fpxPAv8r8H/O0vpQhX3SNiLdrKHGk=;
 b=OXkQrVMrrXHR+rVVPT2bKbfTy04Pix1wXnPB3sMNo4VUGyzfBYtwkl6Z
 kbcC75DQt0b2dzge2HOw9M8GnZ659oG3wBrnjS5IgHpai9asfgzk/Ut2p
 ZgDlzKWEbFEGK2vIhn0K4noW2cWueM5PitC/hQtOe4KEZ8JlUkpKz6Hql
 kcbE5prj3eycPdcPoYjooqGipQUVey18xRxrx707Sl1cXE5Y3UipFu7fE
 TXNXBCO6pJGnqB3xXmrX3uDNRIn8RntXXxB5TRAfDwLh2AHPLuF1Ufzk3
 zxTnmgTAH0XsTXKVheMssZ0Eap6qYl2kLbteYNqPHKvKY8RBBtmml+whq g==;
X-CSE-ConnectionGUID: BENzbKQtTNyGfGHcLmQ+kg==
X-CSE-MsgGUID: p58aegjVR2+10ID06HMUkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68854957"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="68854957"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:26:21 -0800
X-CSE-ConnectionGUID: 41AK376eSuOFgXgIiD/Y8Q==
X-CSE-MsgGUID: JtZBdPssSRKSBpajRXU+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="219815590"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:26:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/24] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
In-Reply-To: <aRNdpcS79vWmeuHL@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762791343.git.jani.nikula@intel.com>
 <2a20632181adc85a737b0a87dce7e753ff8d5b0d.1762791343.git.jani.nikula@intel.com>
 <bcdc1246-d589-4769-b89f-d779ac4984b2@suse.de>
 <acce5e2b3827d8dfa12e571f8a4dfef475f7f232@intel.com>
 <aRNdpcS79vWmeuHL@intel.com>
Date: Wed, 12 Nov 2025 10:26:15 +0200
Message-ID: <3388028ad51de9b229cc39a24f657e327c14cc2e@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Nov 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Nov 11, 2025 at 10:43:15AM +0200, Jani Nikula wrote:
>> On Tue, 11 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> > Am 10.11.25 um 17:17 schrieb Jani Nikula:
>> >> Use the higher level function where crtc is available.
>> >>
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> >
>> > Is there a long-term plan to replace drm_vblank_crtc() entirely?=20
>> > Otherwise this looks a bit pointless.
>>=20
>> Well, almost entirely. There are a few cases (plus the one that Ville
>> mentioned later in the series) that need to operate on dev + pipe
>> alone. The main point is that when you have a crtc and use that for the
>> source of pipe, you don't have to do range checks on the pipe. This
>> becomes gradually more evident in the series.
>
> I've actaully been thinking about doing the exact opposite.
> Ie. switch drm_vblank.c over to drm_vblank_crtc completely.
>
> That is one of those things that might help with implementing
> pipe/crtc virtualization in i915. We basically want all interrupt
> stuff (including vblanks) to be tied to our hardware pipes and
> not the uapi drm_crtc. So we'd make drm_vblank_crtc=3D=3Dpipe, and
> introduce some kind of dynamic drm_crtc<->drm_vblank_crtc mapping
> for the uapi facing parts of drm_vblank.c...

Ugh, so you're saying the series at hand is counter-productive?

BR,
Jani.


--=20
Jani Nikula, Intel
