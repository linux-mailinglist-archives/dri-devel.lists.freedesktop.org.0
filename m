Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIPGGIqfqGmZwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:09:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB501207D3F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E48010EAB0;
	Wed,  4 Mar 2026 21:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dc3/VCpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C110EAB0;
 Wed,  4 Mar 2026 21:09:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FDF540868;
 Wed,  4 Mar 2026 21:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B284CC4CEF7;
 Wed,  4 Mar 2026 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772658565;
 bh=UrgLcwHU8FgZjtEFEnz7U7KqnQOrgNyuhrBqFpTsLUc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=dc3/VCpO1Uw8lxiyJljSZKPgiwfZprS8L14LpBbkv6LP5+4yTkh95vx8ubJiSCIMK
 tnecHG3yL7n2kGzQqglMJdpVnD29d2diK/aC2PzmmKefvyeslxsTdY5LEDi3v2og8t
 T+yf+qxoJ9M5VQOwBVp46G9BflnqQeP8ROqzdZ1hNAuv8Z7WaGZA3hQQsQzaK44uZQ
 jlxCJyQ/vijB3QWMXOfjAc6ve3QLjo05Jx29eGDwGm93Fd+8Ci5rORFZKJyZenDvh3
 UR4z9/ex4rITF9NDYAdf3XPhWA9CPkgcSHQGQL6oF9uPUzxl7029U8Q8JgeRpaoUwB
 PqUpEvbeZKg/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 22:09:23 +0100
Message-Id: <DGUB0LOC63Y6.3H5BNP6GOOGEB@kernel.org>
Subject: Re: [PATCH] nouveau/dpcd: return EBUSY for aux xfer if the device
 is asleep
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224031750.791621-1-airlied@gmail.com>
 <DGU60EGDUNV7.2MJ0CY8K01TCF@kernel.org>
 <CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzcwB-udBP2W-MzmvwsC-YiCW6pCkdc4jon2pyQYGtLfQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: CB501207D3F
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

On Wed Mar 4, 2026 at 10:02 PM CET, Dave Airlie wrote:
> On Thu, 5 Mar 2026 at 03:14, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Tue Feb 24, 2026 at 4:17 AM CET, Dave Airlie wrote:
>> > From: Dave Airlie <airlied@redhat.com>
>> >
>> > If we have runtime suspended, and userspace wants to use /dev/drm_dp_*
>> > then just tell it the device is busy instead of crashing in the GSP
>> > code.
>> >
>> > WARNING: CPU: 2 PID: 565741 at drivers/gpu/drm/nouveau/nvkm/subdev/gsp=
/rm/r535/rpc.c:164 r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
>> > Modules linked in: overlay uinput rfcomm snd_seq_dummy snd_hrtimer nf_=
conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tab=
les qrtr bnep s>
>> > snd_soc_acpi intel_rapl_msr libarc4 kvm crc8 soundwire_bus irqbypass s=
nd_soc_sdca rapl iwlwifi snd_soc_avs uvcvideo intel_cstate think_lmi uvc fi=
rmware_attributes_class intel_uncore intel_wmi_thunderbolt wmi_bmof snd_hda=
_codec_conexant snd_hda_codec_nvhdmi videobuf2_vmalloc snd_soc_hda_codec cf=
g80211 videobu>
>> > processor_thermal_mbox sparse_keymap intel_soc_dts_iosf intel_pch_ther=
mal platform_profile rfkill snd soundcore int3403_thermal int340x_thermal_z=
one int3400_thermal acpi_thermal_rel acpi_pad joydev loop nfnetlink zram lz=
4hc_compress lz4_compress xfs wacom hid_microsoft ff_memless nouveau ucsi_a=
cpi typec_ucsi>
>>
>> I'd remove the modules linked in, it seems not relevant.
>>
>> > CPU: 2 UID: 0 PID: 565741 Comm: fwupd Not tainted 6.18.10-200.fc43.x86=
_64 #1 PREEMPT(lazy)
>> > Hardware name: LENOVO 20QTS0PQ00/20QTS0PQ00, BIOS N2OET65W (1.52 ) 08/=
05/2024
>> > RIP: 0010:r535_gsp_msgq_wait+0x9a/0xb0 [nouveau]
>> >
>> > This is a simple fix to get backported. We should probably engineer a =
proper power domain solution to wake up devices and keep them away while fw=
 updates are happening.
>>
>> s/away/awake/ and line length.
>>
>> > Cc: stable@vger.kernel.org
>>
>> Do we want this backported before GSP introduction?
>>
>> I.e. if it's only about the WARN_ON() and otherwise doesn't cause proble=
ms it
>> should probably be
>>
>> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-=
RM")
>>
>> otherwise
>>
>> Fixes: 8894f4919bc4 ("drm/nouveau: register a drm_dp_aux channel for eac=
h dp connector")
>
> Go back to this for safety, probably won't blow up but it could still
> cause wierd register timeouts.
>
>>
>> > Signed-off-by: Dave Airlie <airlied@redhat.com<
>>
>> No need to resend, I can fix up the above (and the minor typo in the SoB=
) on
>> apply.

Applied to drm-misc-fixes, thanks!
