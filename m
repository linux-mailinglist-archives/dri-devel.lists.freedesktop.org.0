Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5351D4E70
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796916EC95;
	Fri, 15 May 2020 13:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2AE6EC94;
 Fri, 15 May 2020 13:06:17 +0000 (UTC)
IronPort-SDR: hV3bMEaKG3e8zdT0fn9L3bVJ6yG24Ex77A6fILOI4FwQ9gf1WimTuKi0Wy1qRM7P+gVhySCoGh
 4L0ZnaaWjrtQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 06:06:16 -0700
IronPort-SDR: cJW89boO3UmMbV9Q4iHG416GrkUpiUDF+wwZxsExzQpHcTD61rtOSJyonEIjDpTqLohpM/xRSr
 vBgqH+VJec7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="307420596"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 May 2020 06:06:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 May 2020 16:06:12 +0300
Date: Fri, 15 May 2020 16:06:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v12 00/14] In order to readout DP SDPs, refactors the
 handling of DP SDPs
Message-ID: <20200515130612.GI6112@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
 <87eerm4vd0.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87eerm4vd0.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 02:19:23PM +0300, Jani Nikula wrote:
> On Thu, 14 May 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> > In order to readout DP SDPs (Secondary Data Packet: DP HDR Metadata
> > Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs codes.
> > It adds new compute routines for DP HDR Metadata Infoframe SDP
> > and DP VSC SDP. =

> > And new writing routines of DP SDPs (Secondary Data Packet) that uses
> > computed configs.
> > New reading routines of DP SDPs are added for readout.
> > It adds a logging function for DP VSC SDP.
> > When receiving video it is very useful to be able to log DP VSC SDP.
> > This greatly simplifies debugging.
> > In order to use a common VSC SDP Colorimetry calculating code on PSR,
> > it uses a new psr vsc sdp compute routine.
> =

> Pushed the series to drm-intel-next-queued with Daniel's irc ack for
> merging the two non-i915 patches that route too.

fi-hsw-4770 now oopses at boot:

<1>[    3.736903] BUG: kernel NULL pointer dereference, address: 0000000000=
000000
<1>[    3.736916] #PF: supervisor read access in kernel mode
<1>[    3.736916] #PF: error_code(0x0000) - not-present page
<6>[    3.736917] PGD 0 P4D 0 =

<4>[    3.736919] Oops: 0000 [#1] PREEMPT SMP PTI
<4>[    3.736921] CPU: 0 PID: 363 Comm: systemd-udevd Not tainted 5.7.0-rc5=
-CI-CI_DRM_8485+ #1
<4>[    3.736922] Hardware name: LENOVO 10AGS00601/SHARKBAY, BIOS FBKT34AUS=
 04/24/2013
<4>[    3.736986] RIP: 0010:intel_psr_enabled+0x8/0x70 [i915]
<4>[    3.736988] Code: 18 48 c7 c6 40 09 79 a0 e8 e3 e2 04 e1 0f b6 44 24 =
03 e9 f4 fd ff ff 90 66 2e 0f 1f 84 00 00 00 00 00 41 54 55 53 48 83 ec 08 =
<48> 8b 9f d8 fe ff ff f6 83 5e 0d 00 00 20 74 09 80 bb 6c b6 00 00
<4>[    3.737036] RSP: 0018:ffffc9000047f8a0 EFLAGS: 00010286
<4>[    3.737042] RAX: 0000000000000002 RBX: ffff8883ffd04000 RCX: 00000000=
00000001
<4>[    3.737048] RDX: 0000000000000007 RSI: ffff8883ffd04000 RDI: 00000000=
00000128
<4>[    3.737055] RBP: ffff888406afe200 R08: 000000000000000f R09: 00000000=
00000001
<4>[    3.737061] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000=
00000000
<4>[    3.737068] R13: ffff8883f75d0000 R14: ffff888406afe200 R15: ffff8883=
f75d0870
<4>[    3.737075] FS:  00007f71618f9680(0000) GS:ffff88840ec00000(0000) knl=
GS:0000000000000000
<4>[    3.737082] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    3.737088] CR2: 0000000000000000 CR3: 0000000402510002 CR4: 00000000=
001606f0
<4>[    3.737094] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000=
00000000
<4>[    3.737101] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000=
00000400
<4>[    3.737107] Call Trace:
<4>[    3.737175]  intel_read_dp_sdp+0x1a4/0x380 [i915]
<4>[    3.737246]  hsw_crt_get_config+0x12/0x40 [i915]
<4>[    3.737317]  intel_modeset_setup_hw_state+0x3b3/0x16a0 [i915]
...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
