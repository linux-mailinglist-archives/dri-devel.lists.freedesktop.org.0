Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBq8OmBoqGl3uQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:14:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E93204F95
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 18:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4457E10EA79;
	Wed,  4 Mar 2026 17:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iw/egV+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F80510EA79;
 Wed,  4 Mar 2026 17:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D88D42B81;
 Wed,  4 Mar 2026 17:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E838C4CEF7;
 Wed,  4 Mar 2026 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772644444;
 bh=CmAwyXiLDc/33BunxhG5anWKSX/FSXmBKq48NqfFivM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Iw/egV+fA2kyik9AZwQm8RK0TJsoGXoNjsUir2SeDWgVCCXZ95fNmhWImeSgzp43u
 UTZZN1IpJuKrvtnbFLOckG7E8ONozY+UmWfBfhNHtn81oIuYaQNo1XzWyg9UtE6q8i
 QIIdjKxyG1NaVZ4I+4nCZdmbOYTPuyyoOZypqbQJm6rrzWyu2JZJ2rcKZ4tqzuAzn7
 mTGufFgutK43iO9vCRtnKt9TVCM9WXDfXteuIUKQOViIhQLouFJvl3e1f7nLcD2+oh
 TtjwxpKBbqE9v44ajO/scP5vlfE0R9fQiXj/ImZIWm2jlaB3rfSIUtCx6B9NtIbPUw
 ObEpEvWRq2MaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:14:01 +0100
Message-Id: <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
Subject: Re: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device
 is asleep
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224031750.791621-1-airlied@gmail.com>
In-Reply-To: <20260224031750.791621-1-airlied@gmail.com>
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
X-Rspamd-Queue-Id: 78E93204F95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 4:17 AM CET, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
> then just tell it the device is busy instead of crashing in the GSP
> code.
>
> WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm=
/r535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
> Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_con=
ntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_=
ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_c=
t nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables=
 qrtr bnep s>
> snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass snd_=
soc_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc firmw=
are_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda_co=
dec_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cfg80=
211 videobu>
> processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_thermal=
 platform_profile rfkill snd soundcore int3403_thermal int340x_thermal_zone=
 int3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz4hc=
_compress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_acpi=
 typec_ucsi>

I'd remove the modules linked in, it seems not relevant.

> CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86_64=
 #1 PREEMPT(lazy)
> Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/05/=
2024
> RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
>
> This is a simple fix to get backported. We should probably engineer a pro=
per power domain solution to wake up devices and keep them away while fw up=
dates are happening.

s/away/awake/ and line length.

> Cc: stable@vger.kernel.org

Do we want this backported before GSP introduction?

I.e. if it's only about the WARN_ON() and otherwise doesn't cause problems =
it
should probably be

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM"=
)

otherwise

Fixes: 8894f4919bc4 ("drm/nouveau: register a drm_dp_aux channel for each d=
p connector")

> Signed-off-by: Dave Airlie <airlied@redhat.com<

No need to resend, I can fix up the above (and the minor typo in the SoB) o=
n
apply.
