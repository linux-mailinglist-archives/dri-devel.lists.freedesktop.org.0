Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E68BB950
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 04:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABE11133D5;
	Sat,  4 May 2024 02:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="M+tir02l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9910ED93
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 02:46:51 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-61bed738438so2460987b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714790811; x=1715395611;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMU1LUSWt9qatmPigqgCzlLSqpg1BotOcEtutbA+Mbs=;
 b=M+tir02l4cn8wFbXC5U4uUw4gTuzPi4sKK/iT0nQx0vdDvcLlaAZq7a9+lLxtWaO1u
 ylp/09HM+qFeOPY1vY4bDL0S42SJ6WpOR65UAOG+q/e5C3/+QFJ+OumgL0nCR92/SHbb
 Qt5CVKvxukniI+3wmBPlRmxKZnA2IRdL1EpwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714790811; x=1715395611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hMU1LUSWt9qatmPigqgCzlLSqpg1BotOcEtutbA+Mbs=;
 b=P11pQwFda+ofO38AhyFaWmgLLS9gyWvBHlt60qSMG/NduaFNNQTwTtwBiLRLO2T+eX
 nVfKAHu1YCwGwcwNQzIz+v5jXblrAeaafDPkrZhvEL1TqTjCVKQXgcXmFBxu9zOXrnGL
 IiNq7H96y8Ti/U+TT1kZxbHtrKPuDMApJevP8ubBedU3K7tN4MC8Q+ORbv+MmQF0Jdc1
 bNgXW8kGZ2l2CJVStn9BicLtZLdA2fEhXd4M2O4lXg7cIuwuyb9XfcY9EuIaTVXDkFvr
 BjMQ8xMOs8gOYQ6LmmzcqUL/KfkJmkEMikAPMoUHDMBTKZsKhYlg6nHPf4ydJ9ro9Y5g
 OUOA==
X-Gm-Message-State: AOJu0Yz458kNldNvpteQ+gVIxwz/0wLN69BNvMcUTpg2KAsfBTrXU/Cn
 5eWfycEpYgH8eMQMhlqbq9bmw5/kNjc2/mJDyMOVH9Vv0ja6PffFtRiQemTgIWsaGhOyktk0TYy
 dKW7H4+2agi3y9g0SF4OpWwHc4dF+hxEZh6wM
X-Google-Smtp-Source: AGHT+IEZX26Ojo0OHtX8gU+uHCayNH5Ia8ptwueUNU6/eNH6PEAiN8swn7hotcF0B7zpG5pmA34NSR6NTuFUIe75Yds=
X-Received: by 2002:a05:690c:4b02:b0:61a:d39a:1aa6 with SMTP id
 ip2-20020a05690c4b0200b0061ad39a1aa6mr4662509ywb.51.1714790810710; Fri, 03
 May 2024 19:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240503222916.26552-1-ian.forbes@broadcom.com>
In-Reply-To: <20240503222916.26552-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 3 May 2024 22:46:40 -0400
Message-ID: <CABQX2QM=U+6HnO6k=3-=aV_katM20jOeDTWRAjiPSV_N_3Ktzw@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Re-introduce drm_crtc_helper_funcs::prepare
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, May 3, 2024 at 6:29=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> This function was removed in the referenced fixes commit and caused a
> regression. This is because the presence of this function, even though it
> is a noop, changes the behaviour of disable_outputs in
> drm_atomic_helper.c:1211.
>
> Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 2041c4d48daa..37223f95cbec 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -409,6 +409,10 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_c=
rtc *crtc)
>                           crtc->x, crtc->y);
>  }
>
> +static void vmw_stdu_crtc_helper_prepare(struct drm_crtc *crtc)
> +{
> +}
> +
>  static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
>                                          struct drm_atomic_state *state)
>  {
> @@ -1463,6 +1467,7 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helpe=
r_funcs =3D {
>  };
>
>  static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs =3D=
 {
> +       .prepare =3D vmw_stdu_crtc_helper_prepare,
>         .mode_set_nofb =3D vmw_stdu_crtc_mode_set_nofb,
>         .atomic_check =3D vmw_du_crtc_atomic_check,
>         .atomic_begin =3D vmw_du_crtc_atomic_begin,
> --
> 2.34.1
>

Thanks, but that doesn't look correct. We do want to make sure the
drm_crtc_vblank_off is actually called when outputs are disabled.
Since this is my regression it's perfectly fine if you want to hand it
off to me and work on something else. In general you always want to
understand what the patch that you're sending is doing before sending
it. In this case it's pretty trivial, the commit you mention says that
it fixes kms_pipe_crc_basic and if you run it with your patch (e.g.
sudo ./kms_pipe_crc_basic --run-subtest disable-crc-after-crtc) you
should notice:
May 03 22:25:05 fedora.local kernel: ------------[ cut here ]------------
May 03 22:25:05 fedora.local kernel: driver forgot to call drm_crtc_vblank_=
off()
May 03 22:25:05 fedora.local kernel: WARNING: CPU: 2 PID: 2204 at
drivers/gpu/drm/drm_atomic_helper.c:1232 disable_outputs+0x345/0x350
May 03 22:25:05 fedora.local kernel: Modules linked in: snd_seq_dummy
snd_hrtimer nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables
snd_seq_midi snd_seq_midi_event qrtr vsock_loopback
vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock
sunrpc binfmt_misc snd_ens1371 snd_ac97_codec ac97_bus snd_seq
intel_rapl_msr snd_pcm intel_rapl_common vmw_balloon
intel_uncore_frequency_common isst_if_mbox_msr isst_if_common gameport
snd_rawmidi snd_seq_device rapl snd_timer snd vmw_vmci pcspkr
soundcore i2c_piix4 pktcdvd joydev loop nfnetlink zram vmwgfx
crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni
polyval_generic nvme ghash_clmulni_intel nvme_core sha512_ssse3
sha256_ssse3 sha1_ssse3 drm_ttm_helper ttm nvme_auth vmxnet3 serio_raw
ata_generic pata_acpi fuse i2c_dev
May 03 22:25:05 fedora.local kernel: CPU: 2 PID: 2204 Comm:
kms_pipe_crc_ba Not tainted 6.9.0-rc2-vmwgfx #5
May 03 22:25:05 fedora.local kernel: Hardware name: VMware, Inc.
VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00
11/12/2020
May 03 22:25:05 fedora.local kernel: RIP: 0010:disable_outputs+0x345/0x350
... but in most cases it's not going to be so trivial. Whether you
decide to work on this one yourself or hand it off to me - we don't
want to trade bug for bug here, but fix both of those things.

z
