Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD8295C83
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 12:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743736F5B4;
	Thu, 22 Oct 2020 10:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A455E6F5B4;
 Thu, 22 Oct 2020 10:14:27 +0000 (UTC)
IronPort-SDR: dFK3Qxo4/BVCYGINPbe9Te7NSiBblccXjlunuptD//ATSjfMjfJhBuOpHDziV9KTZ5NKaE6Osk
 oRwhYr4D/VWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="185181461"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="185181461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 03:14:27 -0700
IronPort-SDR: caeVgLpgaw+1iULmWLBKXvrucZJa7vfINHxPW0I+EOBg1n2CVk1VuYBq0Y2+B1MMCar3Tywvj4
 hb3qOHIoaTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="348842846"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 22 Oct 2020 03:14:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Oct 2020 13:14:23 +0300
Date: Thu, 22 Oct 2020 13:14:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Intel-gfx] drm_modes: signed integer overflow
Message-ID: <20201022101423.GI6112@intel.com>
References: <47527cdb-2eda-b5a3-d77c-3855b91a0b61@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47527cdb-2eda-b5a3-d77c-3855b91a0b61@infradead.org>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 08:13:43PM -0700, Randy Dunlap wrote:
> Hi,
> =

> With linux-next 20201021, when booting up, I am seeing this:
> =

> [    0.560896] UBSAN: signed-integer-overflow in ../drivers/gpu/drm/drm_m=
odes.c:765:20
> [    0.560903] 2376000 * 1000 cannot be represented in type 'int'

Dang. Didn't realize these new crazy >8k modes have dotclocks reaching
almost 6 GHz, which would overflow even u32. I guess we'll switch to
64bit maths. Now I wonder how many other places can hit this overflow
in practice...

> [    0.560909] CPU: 3 PID: 7 Comm: kworker/u16:0 Not tainted 5.9.0-next-2=
0201021 #2
> [    0.560914] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Vers=
ion 4.10   01/08/2013
> [    0.560924] Workqueue: events_unbound async_run_entry_fn
> =

> [    0.560930] Call Trace:
> [    0.560938]  dump_stack+0x5e/0x74
> [    0.560943]  ubsan_epilogue+0x9/0x45
> [    0.560948]  handle_overflow+0x8b/0x98
> [    0.560953]  ? set_track+0x3f/0xad
> [    0.560958]  __ubsan_handle_mul_overflow+0xe/0x10
> [    0.560964]  drm_mode_vrefresh+0x4a/0xbc
> [    0.560970] initcall i915_init+0x0/0x6a returned 0 after 116076 usecs
> [    0.560974] calling  cn_proc_init+0x0/0x36 @ 1
> [    0.560978]  cea_mode_alternate_clock+0x11/0x62
> [    0.560985]  drm_match_cea_mode+0xc7/0x1e7
> [    0.560987] initcall cn_proc_init+0x0/0x36 returned 0 after 3 usecs
> [    0.560990] calling  topology_sysfs_init+0x0/0x2d @ 1
> [    0.561000]  drm_mode_validate_ycbcr420+0xd/0x48
> [    0.561005]  drm_helper_probe_single_connector_modes+0x6db/0x7da
> [    0.561012]  drm_client_modeset_probe+0x225/0x143f
> [    0.561018]  ? bitmap_fold+0x8a/0x8a
> [    0.561023]  ? update_cfs_rq_load_avg+0x192/0x1a2
> [    0.561029]  __drm_fb_helper_initial_config_and_unlock+0x3f/0x5b7
> [    0.561035]  ? get_sd_balance_interval+0x1c/0x40
> [    0.561040]  drm_fb_helper_initial_config+0x48/0x4f
> [    0.561047]  intel_fbdev_initial_config+0x13/0x23
> [    0.561052]  async_run_entry_fn+0x89/0x15c
> [    0.561058]  process_one_work+0x15c/0x1f3
> [    0.561064]  worker_thread+0x1ac/0x25d
> [    0.561069]  ? process_scheduled_works+0x2e/0x2e
> [    0.561074]  kthread+0x10e/0x116
> [    0.561078]  ? kthread_parkme+0x1c/0x1c
> [    0.561083]  ret_from_fork+0x22/0x30
> [    0.561087] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> -- =

> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
