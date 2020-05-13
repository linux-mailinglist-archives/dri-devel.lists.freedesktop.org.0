Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A178B1D1319
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 14:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CE76E204;
	Wed, 13 May 2020 12:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3FC6E121;
 Wed, 13 May 2020 12:49:02 +0000 (UTC)
IronPort-SDR: Ur3Aq3ECql6owvKDDK+UDHrTEokgRpH6HQ17oqiNXcRcgjBnbEvU4ozYmZVjjoAfaXHAgG8RVM
 UnBX2mGzq1Kw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 05:49:01 -0700
IronPort-SDR: 5dHtdCaNcfgRlQnMMii5wd2AlM7H1KdO6B1YU6W0akSALvxpFWEWaPePIreEAQw+FP2AyS25go
 qXb0fOWAnSKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; d="scan'208";a="251759371"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 13 May 2020 05:48:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 May 2020 15:48:58 +0300
Date: Wed, 13 May 2020 15:48:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp_mst: Fix timeout handling of MST down
 messages
Message-ID: <20200513124858.GD6112@intel.com>
References: <20200513103155.12336-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513103155.12336-1-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 01:31:55PM +0300, Imre Deak wrote:
> This fixes the following use-after-free problem in case an MST down
> message times out, while waiting for the response for it:
> =

> [  449.022841] [drm:drm_dp_mst_wait_tx_reply.isra.26] timedout msg send 0=
000000080ba7fa2 2 0
> [  449.022898] ------------[ cut here ]------------
> [  449.022903] list_add corruption. prev->next should be next (ffff88847d=
ae32c0), but was 6b6b6b6b6b6b6b6b. (prev=3Dffff88847db1c140).
> [  449.022931] WARNING: CPU: 2 PID: 22 at lib/list_debug.c:28 __list_add_=
valid+0x4d/0x70
> [  449.022935] Modules linked in: asix usbnet mii snd_hda_codec_hdmi mei_=
hdcp i915 x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul ghash=
_clmulni_intel snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep e1000=
e snd_hda_core ptp snd_pcm pps_core mei_me mei intel_lpss_pci prime_numbers
> [  449.022966] CPU: 2 PID: 22 Comm: kworker/2:0 Not tainted 5.7.0-rc3-CI-=
Patchwork_17536+ #1
> [  449.022970] Hardware name: Intel Corporation Tiger Lake Client Platfor=
m/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.2457.A16.1912270059 12/27/=
2019
> [  449.022976] Workqueue: events_long drm_dp_mst_link_probe_work
> [  449.022982] RIP: 0010:__list_add_valid+0x4d/0x70
> [  449.022987] Code: c3 48 89 d1 48 c7 c7 f0 e7 32 82 48 89 c2 e8 3a 49 b=
7 ff 0f 0b 31 c0 c3 48 89 c1 4c 89 c6 48 c7 c7 40 e8 32 82 e8 23 49 b7 ff <=
0f> 0b 31 c0 c3 48 89 f2 4c 89 c1 48 89 fe 48 c7 c7 90 e8 32 82 e8
> [  449.022991] RSP: 0018:ffffc900001abcb0 EFLAGS: 00010286
> [  449.022995] RAX: 0000000000000000 RBX: ffff88847dae2d58 RCX: 000000000=
0000001
> [  449.022999] RDX: 0000000080000001 RSI: ffff88849d914978 RDI: 00000000f=
fffffff
> [  449.023002] RBP: ffff88847dae32c0 R08: ffff88849d914978 R09: 000000000=
0000000
> [  449.023006] R10: ffffc900001abcb8 R11: 0000000000000000 R12: ffff88849=
0d98400
> [  449.023009] R13: ffff88847dae3230 R14: ffff88847db1c140 R15: ffff88849=
0d98540
> [  449.023013] FS:  0000000000000000(0000) GS:ffff88849ff00000(0000) knlG=
S:0000000000000000
> [  449.023017] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  449.023021] CR2: 00007fb96fafdc63 CR3: 0000000005610004 CR4: 000000000=
0760ee0
> [  449.023025] PKRU: 55555554
> [  449.023028] Call Trace:
> [  449.023034]  drm_dp_queue_down_tx+0x59/0x110
> [  449.023041]  ? rcu_read_lock_sched_held+0x4d/0x80
> [  449.023050]  ? kmem_cache_alloc_trace+0x2a6/0x2d0
> [  449.023060]  drm_dp_send_link_address+0x74/0x870
> [  449.023065]  ? __slab_free+0x3e1/0x5c0
> [  449.023071]  ? lockdep_hardirqs_on+0xe0/0x1c0
> [  449.023078]  ? lockdep_hardirqs_on+0xe0/0x1c0
> [  449.023097]  drm_dp_check_and_send_link_address+0x9a/0xc0
> [  449.023106]  drm_dp_mst_link_probe_work+0x9e/0x160
> [  449.023117]  process_one_work+0x268/0x600
> [  449.023124]  ? __schedule+0x307/0x8d0
> [  449.023139]  worker_thread+0x37/0x380
> [  449.023149]  ? process_one_work+0x600/0x600
> [  449.023153]  kthread+0x140/0x160
> [  449.023159]  ? kthread_park+0x80/0x80
> [  449.023169]  ret_from_fork+0x24/0x50
> =

> Fixes: d308a881a591 ("drm/dp_mst: Kill the second sideband tx slot, save =
the world")
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: <stable@vger.kernel.org> # v3.17+
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
> index 2d4132e0a98f..70455e304a26 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1197,7 +1197,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_m=
st_branch *mstb,
>  =

>  		/* remove from q */
>  		if (txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_QUEUED ||
> -		    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND)
> +		    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_START_SEND ||
> +		    txmsg->state =3D=3D DRM_DP_SIDEBAND_TX_SENT)
>  			list_del(&txmsg->next);

Looks correct. Pondering list_del_init() all over so we
wouldn't even need the state check...

Also the 'return 1' in process_single_tx_qlock() seems =

to be a zombie of some sort. Should probably be nuked to not
confused the next person to read the code.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	}
>  out:
> -- =

> 2.23.1
> =

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
