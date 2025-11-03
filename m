Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B20C2DA6B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AED10E46F;
	Mon,  3 Nov 2025 18:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rong.moe header.i=i@rong.moe header.b="RuIUaip0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0785F10E46F;
 Mon,  3 Nov 2025 18:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762194071; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VddSQLqbswyJo4B/inOXjFVXf41QdgWVdnm3KTuTq4/Fc1VOTr5XZ9DXOjMzVF7Jkw4xyovwzcya9hylBSOar4hvriLDy3tJvu5/9Oeuzl3DBvO1wB2XEmoN7Heow9rEDmYk5TwskCD2z+oFGqtW565HrimOHrnhDgBXGeJgzBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762194071;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Gyw06T/5m9Cp2WllVa8zW2c87rrQdcGV+9Fj1/2v7UM=; 
 b=Qo3AV0asi7gaN9ihTI42cHHjVbyLbADc5xpx14n/FcNEiRZGVbaDf5+9DO+P4E3MvevbLo7tb61++DtE+y1D6y5YfEuAEbUQNh636X/R/07FmGPQ9fvmO/Hv+3Nq7rdPlQrUG466z2ZzJSJD6idfGrqnQgFibWvXp2U03gFpf7U=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=rong.moe;
 spf=pass  smtp.mailfrom=i@rong.moe;
 dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762194071; 
 s=zmail; d=rong.moe; i=i@rong.moe;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
 bh=Gyw06T/5m9Cp2WllVa8zW2c87rrQdcGV+9Fj1/2v7UM=;
 b=RuIUaip0XeMyHjvjsjdiJOvSBMpY8sbMlOXFFT1ty5tx/FODwZ2xL6jJ0IHUCWWS
 f/dgLdWTP7ycUS1UnAEtGfR2bXToxiWUFCE7/sShEZp0yEN6/p29u5+3hiVDz2W/4wB
 cAtJQSLradY1YBj/dMkS2zz76KLGXePLewoqiflM=
Received: by mx.zohomail.com with SMTPS id 1762194068066262.1453735507406;
 Mon, 3 Nov 2025 10:21:08 -0800 (PST)
Message-ID: <7ef252405946f6ab3feff38cc4bd9ddcc49bad56.camel@rong.moe>
Subject: Re: [PATCH] drm/amd/display: Fix NULL deref in debugfs
 odm_combine_segments
From: Rong Zhang <i@rong.moe>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: Roman Li <roman.li@amd.com>, "ChiaHsuan (Tom) Chung"	
 <chiahsuan.chung@amd.com>, Ray Wu <ray.wu@amd.com>, Mario Limonciello	
 <mario.limonciello@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, Hamza
 Mahfooz	 <hamzamahfooz@linux.microsoft.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, 	amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20251013164742.24660-1-i@rong.moe>
References: <20251013164742.24660-1-i@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Nov 2025 02:15:59 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-5 
X-ZohoMailClient: External
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

Hi all,

On Tue, 2025-10-14 at 00:47 +0800, Rong Zhang wrote:
> When a connector is connected but inactive (e.g., disabled by desktop
> environments), pipe_ctx->stream_res.tg will be destroyed. Then, reading
> odm_combine_segments causes kernel NULL pointer dereference.
>=20
>  BUG: kernel NULL pointer dereference, address: 0000000000000000
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 0 P4D 0
>  Oops: Oops: 0000 [#1] SMP NOPTI
>  CPU: 16 UID: 0 PID: 26474 Comm: cat Not tainted 6.17.0+ #2 PREEMPT(lazy)=
  e6a17af9ee6db7c63e9d90dbe5b28ccab67520c6
>  Hardware name: LENOVO 21Q4/LNVNB161216, BIOS PXCN25WW 03/27/2025
>  RIP: 0010:odm_combine_segments_show+0x93/0xf0 [amdgpu]
>  Code: 41 83 b8 b0 00 00 00 01 75 6e 48 98 ba a1 ff ff ff 48 c1 e0 0c 48 =
8d 8c 07 d8 02 00 00 48 85 c9 74 2d 48 8b bc 07 f0 08 00 00 <48> 8b 07 48 8=
b 80 08 02 00>
>  RSP: 0018:ffffd1bf4b953c58 EFLAGS: 00010286
>  RAX: 0000000000005000 RBX: ffff8e35976b02d0 RCX: ffff8e3aeed052d8
>  RDX: 00000000ffffffa1 RSI: ffff8e35a3120800 RDI: 0000000000000000
>  RBP: 0000000000000000 R08: ffff8e3580eb0000 R09: ffff8e35976b02d0
>  R10: ffffd1bf4b953c78 R11: 0000000000000000 R12: ffffd1bf4b953d08
>  R13: 0000000000040000 R14: 0000000000000001 R15: 0000000000000001
>  FS:  00007f44d3f9f740(0000) GS:ffff8e3caa47f000(0000) knlGS:000000000000=
0000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000000000000000 CR3: 00000006485c2000 CR4: 0000000000f50ef0
>  PKRU: 55555554
>  Call Trace:
>   <TASK>
>   seq_read_iter+0x125/0x490
>   ? __alloc_frozen_pages_noprof+0x18f/0x350
>   seq_read+0x12c/0x170
>   full_proxy_read+0x51/0x80
>   vfs_read+0xbc/0x390
>   ? __handle_mm_fault+0xa46/0xef0
>   ? do_syscall_64+0x71/0x900
>   ksys_read+0x73/0xf0
>   do_syscall_64+0x71/0x900
>   ? count_memcg_events+0xc2/0x190
>   ? handle_mm_fault+0x1d7/0x2d0
>   ? do_user_addr_fault+0x21a/0x690
>   ? exc_page_fault+0x7e/0x1a0
>   entry_SYSCALL_64_after_hwframe+0x6c/0x74
>  RIP: 0033:0x7f44d4031687
>  Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 =
fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 8=
0 00 00 00 00>
>  RSP: 002b:00007ffdb4b5f0b0 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
>  RAX: ffffffffffffffda RBX: 00007f44d3f9f740 RCX: 00007f44d4031687
>  RDX: 0000000000040000 RSI: 00007f44d3f5e000 RDI: 0000000000000003
>  RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
>  R10: 0000000000000000 R11: 0000000000000202 R12: 00007f44d3f5e000
>  R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000040000
>   </TASK>
>  Modules linked in: tls tcp_diag inet_diag xt_mark ccm snd_hrtimer snd_se=
q_dummy snd_seq_midi snd_seq_oss snd_seq_midi_event snd_rawmidi snd_seq snd=
_seq_device x>
>   snd_hda_codec_atihdmi snd_hda_codec_realtek_lib lenovo_wmi_helpers thin=
k_lmi snd_hda_codec_generic snd_hda_codec_hdmi snd_soc_core kvm snd_compres=
s uvcvideo sn>
>   platform_profile joydev amd_pmc mousedev mac_hid sch_fq_codel uinput i2=
c_dev parport_pc ppdev lp parport nvme_fabrics loop nfnetlink ip_tables x_t=
ables dm_cryp>
>  CR2: 0000000000000000
>  ---[ end trace 0000000000000000 ]---
>  RIP: 0010:odm_combine_segments_show+0x93/0xf0 [amdgpu]
>  Code: 41 83 b8 b0 00 00 00 01 75 6e 48 98 ba a1 ff ff ff 48 c1 e0 0c 48 =
8d 8c 07 d8 02 00 00 48 85 c9 74 2d 48 8b bc 07 f0 08 00 00 <48> 8b 07 48 8=
b 80 08 02 00>
>  RSP: 0018:ffffd1bf4b953c58 EFLAGS: 00010286
>  RAX: 0000000000005000 RBX: ffff8e35976b02d0 RCX: ffff8e3aeed052d8
>  RDX: 00000000ffffffa1 RSI: ffff8e35a3120800 RDI: 0000000000000000
>  RBP: 0000000000000000 R08: ffff8e3580eb0000 R09: ffff8e35976b02d0
>  R10: ffffd1bf4b953c78 R11: 0000000000000000 R12: ffffd1bf4b953d08
>  R13: 0000000000040000 R14: 0000000000000001 R15: 0000000000000001
>  FS:  00007f44d3f9f740(0000) GS:ffff8e3caa47f000(0000) knlGS:000000000000=
0000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000000000000000 CR3: 00000006485c2000 CR4: 0000000000f50ef0
>  PKRU: 55555554
>=20
> Fix this by checking pipe_ctx->stream_res.tg before dereferencing.
>=20
> Fixes: 07926ba8a44f ("drm/amd/display: Add debugfs interface for ODM comb=
ine info")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index f263e1a4537e1..00dac862b665a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1302,7 +1302,8 @@ static int odm_combine_segments_show(struct seq_fil=
e *m, void *unused)
>  	if (connector->status !=3D connector_status_connected)
>  		return -ENODEV;
> =20
> -	if (pipe_ctx !=3D NULL && pipe_ctx->stream_res.tg->funcs->get_odm_combi=
ne_segments)
> +	if (pipe_ctx && pipe_ctx->stream_res.tg &&
> +	    pipe_ctx->stream_res.tg->funcs->get_odm_combine_segments)
>  		pipe_ctx->stream_res.tg->funcs->get_odm_combine_segments(pipe_ctx->str=
eam_res.tg, &segments);
> =20
>  	seq_printf(m, "%d\n", segments);
>=20
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

Gentle ping.

Thanks,
Rong
