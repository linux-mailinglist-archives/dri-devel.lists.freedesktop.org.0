Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5601140E08
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 16:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9406F5FD;
	Fri, 17 Jan 2020 15:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B306F5FD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 15:40:35 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n21so26428207ioo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=igSJXh6py7SRWNn7EWVptLN5s9FzdvrUHJbeGsk7QrE=;
 b=OpRZYm5DXnlKu+a33JR23t5Oy5xQ/cmGiN/dCzsOZZU5SWRFPiYBZ4NcBBivl0hOLL
 phnvtbaZhVlom5BlAwZ78k2gplrCJ/6N/UVwKO7Mop4M+nRoHMY2tiWorEu6QkA8fZyl
 4m6mDVBqJHKdZwqghot95vU+r7CtqWW62hV9hDRVKCFKxO/FWVHn0MdTSKrvK/vgpx3P
 V3mH8tj0TilQCRfcP8W2iD1Xq6nbeL8KOOsHtXt88AVK8FqXYn3X3WrzzRIQWQq8X4pU
 glGzVGwIrqECmhV/nTuSz3nJkLifFZibFt0U7nroR6aq9DW3/KQRWbLd3FMt0xpiMlPA
 J/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=igSJXh6py7SRWNn7EWVptLN5s9FzdvrUHJbeGsk7QrE=;
 b=BXVAoO2RU6+eJAdQbuGPPgsYVbI5HIq28XHdpFXehXwmviP3vF7oygn3egjWhJG8zH
 vVs4nmy3RN81KGVx9zCrfwYsz0iJUNXFxrzM7FAZKxhY/v6D6S8XVqSt94ilT4d8ADa+
 a8TUQXi2Y0Q9InOQeDEsmvpA8SAkOrB4P75w52VROd7HZJzHTtsNgYsLYRkITB41C/Pe
 umobyhQd/XAkkhjlYZIat8lkdsZHzhzBWbLb2k3ejgqhXkrdpwx7M4QRWP1f5CxBFMZP
 +TCAuHZJSIkE6oQTvhbHcgX/rL+snGrnkfEYbpuyaG1YyoVvMUT+/iIosU50rutqpuCu
 PeAw==
X-Gm-Message-State: APjAAAVneIV3/O7YeMr3Z3T56ucJ3ylI0Ifi1PWXs8v16N0pBhJcfzXw
 t5pRzz5FlZA5BM/bwH/+jAtAPp8kQZq5g6KCNRDEew==
X-Google-Smtp-Source: APXvYqyhuIhiP1BjbLDFIe27Pr5jwpw3GfIvH/MCwln6rNXlaO24EvCOMTTC+1ULtmaiqy2MCa3T1I8H1If++v+//sg=
X-Received: by 2002:a6b:6f17:: with SMTP id k23mr31011327ioc.75.1579275634915; 
 Fri, 17 Jan 2020 07:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-13-mikita.lipski@amd.com>
 <CAMavQKLvtGg_XiLhDwuiVSR7829PK1mWCx8aLx8EVxf2WOakqg@mail.gmail.com>
 <cb14a9b2-0252-982a-6f83-139d710c0181@amd.com>
In-Reply-To: <cb14a9b2-0252-982a-6f83-139d710c0181@amd.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 17 Jan 2020 10:39:59 -0500
Message-ID: <CAMavQKKF8bVas-CgC2MPG0yMt8GO4qwELjsq1zzpTD2QzyHkyA@mail.gmail.com>
Subject: Re: [PATCH v9 12/18] drm/dp_mst: Add branch bandwidth validation to
 MST atomic check
To: Mikita Lipski <mlipski@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 10:26 AM Mikita Lipski <mlipski@amd.com> wrote:
>
>
>
> On 1/17/20 10:09 AM, Sean Paul wrote:
> > On Fri, Dec 13, 2019 at 3:09 PM <mikita.lipski@amd.com> wrote:
> >>
> >> From: Mikita Lipski <mikita.lipski@amd.com>
> >>
> >
> > Hi Mikita,
> > Unfortunately this patch causes a crash on my i915 device when I
> > unplug my MST hub. The panic is below.
>
> Hi Sean,
>
> I thought this issue was fixed by Wayne Lin in
> https://patchwork.freedesktop.org/patch/346736/?series=71388&rev=1
> but now I checked it seems it never got pushed. I will resend Wayne's
> patch once again.
>

No need to resend, I can push Wayne's patch.

Thanks for the pointer,

Sean

> Thanks
> Mikita
> >
> > [   38.514014] BUG: kernel NULL pointer dereference, address: 0000000000000030
> > [   38.521801] #PF: supervisor read access in kernel mode
> > [   38.527556] #PF: error_code(0x0000) - not-present page
> > [   38.533299] PGD 0 P4D 0
> > [   38.536127] Oops: 0000 [#1] PREEMPT SMP PTI
> > [   38.540798] CPU: 1 PID: 1324 Comm: DrmThread Not tainted
> > 5.5.0-rc6-02273-g9bb4096398e7 #36
> > [   38.550040] Hardware name: Google Fizz/Fizz, BIOS
> > Google_Fizz.10139.39.0 01/04/2018
> > [   38.558606] RIP: 0010:drm_dp_mst_atomic_check_bw_limit+0x11/0x102
> > [   38.565418] Code: 05 ff cb bf 19 48 f7 f6 c3 0f 1f 44 00 00 55 b8
> > 0b 80 ff 0f 48 89 e5 5d c3 55 48 89 e5 41 57 41 56 41 55 41 54 4c 8d
> > 77 30 53 <48> 8b 47 30 49 89 fd 49 89 f7 45 31 e4 48 8d 58 e8 48 8d 53
> > 18 4c
> > [   38.586422] RSP: 0018:ffffc9000139f9d8 EFLAGS: 00010282
> > [   38.592264] RAX: 0000000000000000 RBX: ffff888272aeac88 RCX: ffff888236f529e0
> > [   38.600242] RDX: ffff888272aeac88 RSI: ffff888236f529e0 RDI: 0000000000000000
> > [   38.608220] RBP: ffffc9000139fa00 R08: 0000000000000031 R09: 000000000000000e
> > [   38.616198] R10: ffff888236f529e8 R11: ffff8882621f3440 R12: 0000000000000000
> > [   38.624176] R13: ffff888236f529d0 R14: 0000000000000030 R15: ffff888236f529e0
> > [   38.632153] FS:  00007cd9229ce700(0000) GS:ffff888276c80000(0000)
> > knlGS:0000000000000000
> > [   38.641193] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   38.647616] CR2: 0000000000000030 CR3: 00000002618e8004 CR4: 00000000003606e0
> > [   38.655593] Call Trace:
> > [   38.658329]  drm_dp_mst_atomic_check+0x152/0x16d
> > [   38.663484]  intel_atomic_check+0xcfe/0x1e6f
> > [   38.668259]  ? trace_hardirqs_on+0x28/0x3d
> > [   38.672835]  ? intel_pipe_config_compare+0x1b38/0x1b38
> > [   38.678580]  drm_atomic_check_only+0x5ab/0x70f
> > [   38.683547]  ? drm_atomic_set_crtc_for_connector+0xf5/0x102
> > [   38.689778]  ? drm_atomic_helper_shutdown+0xb6/0xb6
> > [   38.695221]  drm_atomic_commit+0x18/0x53
> > [   38.699604]  drm_atomic_helper_set_config+0x5a/0x70
> > [   38.705057]  drm_mode_setcrtc+0x2ab/0x833
> > [   38.709537]  ? rcu_read_unlock+0x57/0x57
> > [   38.713920]  ? drm_mode_getcrtc+0x173/0x173
> > [   38.718594]  drm_ioctl+0x2e5/0x424
> > [   38.722392]  ? drm_mode_getcrtc+0x173/0x173
> > [   38.727069]  vfs_ioctl+0x21/0x2f
> > [   38.730675]  do_vfs_ioctl+0x5fb/0x61e
> > [   38.734766]  ksys_ioctl+0x55/0x75
> > [   38.738469]  __x64_sys_ioctl+0x1a/0x1e
> > [   38.742659]  do_syscall_64+0x5c/0x6d
> > [   38.746653]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > [   38.752298] RIP: 0033:0x7cd92552d497
> > [   38.756291] Code: 8a 66 90 48 8b 05 d1 d9 2b 00 64 c7 00 26 00 00
> > 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00
> > 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 d9 2b 00 f7 d8 64 89
> > 01 48
> > [   38.777296] RSP: 002b:00007cd9229cd698 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000010
> > [   38.785762] RAX: ffffffffffffffda RBX: 000020323373da80 RCX: 00007cd92552d497
> > [   38.793740] RDX: 00007cd9229cd6d0 RSI: 00000000c06864a2 RDI: 000000000000001c
> > [   38.801717] RBP: 00007cd9229cd6c0 R08: 0000000000000000 R09: 0000000000000000
> > [   38.809693] R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000001c
> > [   38.817670] R13: 0000000000000000 R14: 00007cd9229cd6d0 R15: 00000000c06864a2
> > [   38.825642] Modules linked in: xt_nat cdc_ether r8152 bridge stp
> > llc usbhid btusb btrtl btbcm btintel bluetooth asix usbnet
> > ecdh_generic ecc mii snd_soc_hdac_hdmi snd_soc_dmic xhci_pci xhci_hcd
> > snd_soc_skl snd_soc_sst_ipc snd_soc_sst_dsp snd_hda_ext_core
> > snd_intel_dspcfg snd_hda_core usbcore usb_common acpi_als kfifo_buf
> > industrialio xt_MASQUERADE iptable_nat nf_nat xt_mark fuse
> > ip6table_filter iwlmvm mac80211 r8169 realtek iwlwifi lzo_rle
> > lzo_compress zram cfg80211
> > [   38.871839] CR2: 0000000000000030
> > [   38.875542] ---[ end trace 6bb39ec52e30c7cb ]---
> > [   38.886142] RIP: 0010:drm_dp_mst_atomic_check_bw_limit+0x11/0x102
> > [   38.892957] Code: 05 ff cb bf 19 48 f7 f6 c3 0f 1f 44 00 00 55 b8
> > 0b 80 ff 0f 48 89 e5 5d c3 55 48 89 e5 41 57 41 56 41 55 41 54 4c 8d
> > 77 30 53 <48> 8b 47 30 49 89 fd 49 89 f7 45 31 e4 48 8d 58 e8 48 8d 53
> > 18 4c
> > [   38.913964] RSP: 0018:ffffc9000139f9d8 EFLAGS: 00010282
> > [   38.919804] RAX: 0000000000000000 RBX: ffff888272aeac88 RCX: ffff888236f529e0
> > [   38.927784] RDX: ffff888272aeac88 RSI: ffff888236f529e0 RDI: 0000000000000000
> > [   38.935765] RBP: ffffc9000139fa00 R08: 0000000000000031 R09: 000000000000000e
> > [   38.943733] R10: ffff888236f529e8 R11: ffff8882621f3440 R12: 0000000000000000
> > [   38.951712] R13: ffff888236f529d0 R14: 0000000000000030 R15: ffff888236f529e0
> > [   38.959692] FS:  00007cd9229ce700(0000) GS:ffff888276c80000(0000)
> > knlGS:0000000000000000
> > [   38.968730] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   38.975144] CR2: 0000000000000030 CR3: 00000002618e8004 CR4: 00000000003606e0
> > [   38.983121] Kernel panic - not syncing: Fatal exception
> > [   38.988967] Kernel Offset: disabled
> > [   38.998280] ---[ end Kernel panic - not syncing: Fatal exception ]---
> >
> >
> >
> >
> >
> >
> >> [why]
> >> Adding PBN attribute to drm_dp_vcpi_allocation structure to
> >> keep track of how much bandwidth each Port requires.
> >> Adding drm_dp_mst_atomic_check_bw_limit to verify that
> >> state's bandwidth needs doesn't exceed available bandwidth.
> >> The funtion is called in drm_dp_mst_atomic_check after
> >> drm_dp_mst_atomic_check_topology_state to fully verify that
> >> the proposed topology is supported.
> >>
> >> v2: Fixing some typos and indentations
> >>
> >> Reviewed-by: Lyude Paul <lyude@redhat.com>
> >> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_dp_mst_topology.c | 66 ++++++++++++++++++++++++++-
> >>   include/drm/drm_dp_mst_helper.h       |  1 +
> >>   2 files changed, 65 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> >> index 7cd505e771ff..f8b72ac79c66 100644
> >> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> >> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> >> @@ -4052,7 +4052,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> >>   {
> >>          struct drm_dp_mst_topology_state *topology_state;
> >>          struct drm_dp_vcpi_allocation *pos, *vcpi = NULL;
> >> -       int prev_slots, req_slots;
> >> +       int prev_slots, prev_bw, req_slots;
> >>
> >>          topology_state = drm_atomic_get_mst_topology_state(state, mgr);
> >>          if (IS_ERR(topology_state))
> >> @@ -4063,6 +4063,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> >>                  if (pos->port == port) {
> >>                          vcpi = pos;
> >>                          prev_slots = vcpi->vcpi;
> >> +                       prev_bw = vcpi->pbn;
> >>
> >>                          /*
> >>                           * This should never happen, unless the driver tries
> >> @@ -4078,8 +4079,10 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> >>                          break;
> >>                  }
> >>          }
> >> -       if (!vcpi)
> >> +       if (!vcpi) {
> >>                  prev_slots = 0;
> >> +               prev_bw = 0;
> >> +       }
> >>
> >>          if (pbn_div <= 0)
> >>                  pbn_div = mgr->pbn_div;
> >> @@ -4089,6 +4092,9 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> >>          DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
> >>                           port->connector->base.id, port->connector->name,
> >>                           port, prev_slots, req_slots);
> >> +       DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
> >> +                        port->connector->base.id, port->connector->name,
> >> +                        port, prev_bw, pbn);
> >>
> >>          /* Add the new allocation to the state */
> >>          if (!vcpi) {
> >> @@ -4101,6 +4107,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> >>                  list_add(&vcpi->next, &topology_state->vcpis);
> >>          }
> >>          vcpi->vcpi = req_slots;
> >> +       vcpi->pbn = pbn;
> >>
> >>          return req_slots;
> >>   }
> >> @@ -4677,6 +4684,58 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
> >>          kfree(mst_state);
> >>   }
> >>
> >> +static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
> >> +                                                struct drm_dp_mst_branch *branch)
> >> +{
> >> +       while (port->parent) {
> >> +               if (port->parent == branch)
> >> +                       return true;
> >> +
> >> +               if (port->parent->port_parent)
> >> +                       port = port->parent->port_parent;
> >> +               else
> >> +                       break;
> >> +       }
> >> +       return false;
> >> +}
> >> +
> >> +static inline
> >> +int drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
> >> +                                    struct drm_dp_mst_topology_state *mst_state)
> >> +{
> >> +       struct drm_dp_mst_port *port;
> >> +       struct drm_dp_vcpi_allocation *vcpi;
> >> +       int pbn_limit = 0, pbn_used = 0;
> >> +
> >> +       list_for_each_entry(port, &branch->ports, next) {
> >> +               if (port->mstb)
> >> +                       if (drm_dp_mst_atomic_check_bw_limit(port->mstb, mst_state))
> >> +                               return -EINVAL;
> >> +
> >> +               if (port->available_pbn > 0)
> >> +                       pbn_limit = port->available_pbn;
> >> +       }
> >> +       DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch has %d PBN available\n",
> >> +                        branch, pbn_limit);
> >> +
> >> +       list_for_each_entry(vcpi, &mst_state->vcpis, next) {
> >> +               if (!vcpi->pbn)
> >> +                       continue;
> >> +
> >> +               if (drm_dp_mst_port_downstream_of_branch(vcpi->port, branch))
> >> +                       pbn_used += vcpi->pbn;
> >> +       }
> >> +       DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch used %d PBN\n",
> >> +                        branch, pbn_used);
> >> +
> >> +       if (pbn_used > pbn_limit) {
> >> +               DRM_DEBUG_ATOMIC("[MST BRANCH:%p] No available bandwidth\n",
> >> +                                branch);
> >> +               return -EINVAL;
> >> +       }
> >> +       return 0;
> >> +}
> >> +
> >>   static inline int
> >>   drm_dp_mst_atomic_check_topology_state(struct drm_dp_mst_topology_mgr *mgr,
> >>                                         struct drm_dp_mst_topology_state *mst_state)
> >> @@ -4808,6 +4867,9 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
> >>                  ret = drm_dp_mst_atomic_check_topology_state(mgr, mst_state);
> >>                  if (ret)
> >>                          break;
> >> +               ret = drm_dp_mst_atomic_check_bw_limit(mgr->mst_primary, mst_state);
> >> +               if (ret)
> >> +                       break;
> >>          }
> >>
> >>          return ret;
> >> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> >> index 830c94b7f45d..2919d9776af3 100644
> >> --- a/include/drm/drm_dp_mst_helper.h
> >> +++ b/include/drm/drm_dp_mst_helper.h
> >> @@ -502,6 +502,7 @@ struct drm_dp_payload {
> >>   struct drm_dp_vcpi_allocation {
> >>          struct drm_dp_mst_port *port;
> >>          int vcpi;
> >> +       int pbn;
> >>          bool dsc_enabled;
> >>          struct list_head next;
> >>   };
> >> --
> >> 2.17.1
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7C2b736cb4c0f1456691ec08d79b5f4c69%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637148705931074877&amp;sdata=s4q0ni0H%2FiPgonlMMK9Od7UK5M%2FC%2F0rsQEGsr1FP0XU%3D&amp;reserved=0
>
> --
> Thanks,
> Mikita Lipski
> Software Engineer 2, AMD
> mikita.lipski@amd.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
