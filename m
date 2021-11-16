Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E7452918
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 05:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD16E59D;
	Tue, 16 Nov 2021 04:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEA46E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 04:23:16 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4HtXwy68ZSz4x3nV
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 04:23:14 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="bU+OSzLZ"
Date: Tue, 16 Nov 2021 04:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1637036590;
 bh=dFuRS24USsnPyxKWUXID56/bEMdjGPdy1IoWfUMAKEQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=bU+OSzLZMUnNDCa76+Gbv2q0IRfCU8CusPtGaHZNQ8r4ZsVrwvhfGgSN7/TDNgflu
 /O6OS+8zYH3Dew+txaHxHI5o1Vxc9dH/5WkIBUxszfg6reorlO/bHmgRjrqCiPdBBm
 m9XZ6BUrUFqv8/Xrq9BEPfM7PYFMhLpByyAZllu8=
To: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
Message-ID: <20211116042211.59872-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Yassine Oudjana <y.oudjana@protonmail.com>, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-10-19 at 13:27 +0200, Christian K=C3=B6nig wrote:
> Trivial fix since we now need to grab a reference to the fence we have
> added. Previously the dma_resv function where doing that for us.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_ad=
d_implicit_dependencies v2")
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 5bc5f775abe1..94fe51b3caa2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct dr=
m_sched_job *job,
>  =09=09ret =3D drm_sched_job_add_dependency(job, fence);
>  =09=09if (ret)
>  =09=09=09return ret;
> +
> +=09=09/* Make sure to grab an additional ref on the added fence */
> +=09=09dma_fence_get(fence);
>  =09}
>  =09return 0;
>  }

Fixes this error on Qualcomm MSM8996:

[   16.493786] Unable to handle kernel paging request at virtual address 00=
00100000000000
[   16.493823] Mem abort info:
[   16.493832]   ESR =3D 0x96000004
[   16.493843]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   16.493855]   SET =3D 0, FnV =3D 0
[   16.493864]   EA =3D 0, S1PTW =3D 0
[   16.493874]   FSC =3D 0x04: level 0 translation fault
[   16.493884] Data abort info:
[   16.493893]   ISV =3D 0, ISS =3D 0x00000004
[   16.493902]   CM =3D 0, WnR =3D 0
[   16.493912] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000011e406000
[   16.493924] [0000100000000000] pgd=3D0000000000000000, p4d=3D00000000000=
00000
[   16.493949] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   16.493961] Modules linked in: q6asm_dai q6routing q6afe_dai q6asm q6adm=
 snd_q6dsp_common
snd_soc_wcd9335 venus_enc venus_dec panel_lgphilips_sw43101 videobuf2_dma_c=
ontig q6afe
regmap_slimbus videobuf2_memops q6core apr ath10k_pci ath10k_core ath mac80=
211 libarc4 venus_core
cfg80211 v4l2_mem2mem videobuf2_v4l2 videobuf2_common videodev mc msm hci_u=
art nxp_nci_i2c nxp_nci
slim_qcom_ngd_ctrl btqca pdr_interface gpu_sched slimbus drm_kms_helper nci=
 syscopyarea sysfillrect
bluetooth sysimgblt fb_sys_fops nfc qcom_spmi_haptics rfkill qcom_q6v5_pas =
qcom_q6v5_mss
qcom_pil_info qcom_common qcom_q6v5 qcom_sysmon qmi_helpers snd_soc_apq8096=
 mdt_loader
snd_soc_qcom_common snd_soc_core snd_compress snd_pcm snd_timer snd soundco=
re lzo_rle socinfo
rpmsg_char pwm_ir_tx rmtfs_mem zram atmel_mxt_ts drm drm_panel_orientation_=
quirks ip_tables
[   16.494320] CPU: 1 PID: 521 Comm: phoc:sq0 Not tainted 5.16.0-rc1+ #68
[   16.494335] Hardware name: Xiaomi Mi Note 2 (DT)
[   16.494346] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   16.494362] pc : drm_sched_job_add_dependency+0xe0/0x214 [gpu_sched]
[   16.494396] lr : drm_sched_job_add_dependency+0x70/0x214 [gpu_sched]
[   16.494417] sp : ffff800013e2baf0
[   16.494427] x29: ffff800013e2baf0 x28: 0000000000000002 x27: 00000000000=
0001b
[   16.494452] x26: ffff000099ad0200 x25: 000000000000001a x24: 00000000000=
00010
[   16.494476] x23: ffff000098e99800 x22: 0000000000000000 x21: 00000000000=
00000
[   16.494500] x20: ffff000098e99870 x19: ffff000081e50940 x18: 00000000000=
00000
[   16.494524] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff83a=
4576c
[   16.494548] x14: 0000000000000000 x13: 0000000000000000 x12: 00000000000=
00040
[   16.494571] x11: ffff00009f19fb50 x10: ffff00009f19fb52 x9 : 00000000000=
00001
[   16.494595] x8 : 0000000000000228 x7 : ffffffffffffffff x6 : 00000000000=
00001
[   16.494619] x5 : ffff800013e2bab8 x4 : ffff800013e2bab8 x3 : 00001000000=
00000
[   16.494643] x2 : 0000100000000000 x1 : fffffc0002f04640 x0 : ffff000081e=
50940
[   16.494668] Call trace:
[   16.494679]  drm_sched_job_add_dependency+0xe0/0x214 [gpu_sched]
[   16.494702]  drm_sched_job_add_implicit_dependencies+0x60/0x9c [gpu_sche=
d]
[   16.494724]  msm_ioctl_gem_submit+0xe98/0x179c [msm]
[   16.494871]  drm_ioctl_kernel+0xc4/0x16c [drm]
[   16.495046]  drm_ioctl+0x214/0x44c [drm]
[   16.495162]  __arm64_sys_ioctl+0xa8/0xf0
[   16.495183]  invoke_syscall+0x48/0x114
[   16.495201]  el0_svc_common.constprop.0+0x44/0xfc
[   16.495215]  do_el0_svc+0x28/0x90
[   16.495229]  el0_svc+0x28/0x80
[   16.495243]  el0t_64_sync_handler+0xa4/0x130
[   16.495255]  el0t_64_sync+0x1a0/0x1a4
[   16.495275] Code: d50323bf d65f03c0 f9400662 f9401403 (39400042)=20
[   16.495291] ---[ end trace cbfcea8f309d97a1 ]---

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>


