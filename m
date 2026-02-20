Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K02IxJumGn4IAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:22:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D61684CE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCA810E141;
	Fri, 20 Feb 2026 14:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Jc1DG2Ty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAD910E141
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 14:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771597325; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JFweC4hG5t/jJ8EmL5KWZAcYUZeJqX4sABQwqYoaY8fVQ4TiMrHWVDcDtbsQzTBd/zxa/fObT6yfV0vEG5nZgpi0CJSmIRVtmw1X0B51qi4i7vbhBjsrmJebsInl3CpJCZeht9Uexzhd9io/BFzI8T40Zq8eJJW0WVIa6WqJFao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771597325;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=am0pkUKmynPszEB7OJwHEANu0A3LrSDnvhn4JXjB9TY=; 
 b=EFMoAFIUCZAaJXy293CU/W/nKiXPkGJjxcz1q3dT9/YwLHns0RblTJ/Liy7mspil3M7Xnx7HGy8/iGs+KUNYOfGcTI2GIUO6FOZmP2hUmucq7K70yfefT0IIV/1TwMqNnzHfXaGTHiPA5GRjYGN8/NpPVUZwi+KOjZkHzocsG2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771597325; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=am0pkUKmynPszEB7OJwHEANu0A3LrSDnvhn4JXjB9TY=;
 b=Jc1DG2TyzL7IiWepkwCF42IvJZKpoxtW27EbMPfrCW9xosQu5Qmf+MbnJ5PcceGJ
 eXOJBoRim10POn/kyH38DKjFCfGcU7UGhm9O0DXiUOxrHyHxJinzSBMKBnUjpdo0x9G
 cResrJ8b22DlODVrfbuxl7UI8DiBbpJcqLUOWsWo=
Received: by mx.zohomail.com with SMTPS id 1771597324077896.7439356746656;
 Fri, 20 Feb 2026 06:22:04 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-6-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:21:48 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8D3B2A7-31A7-445D-A3C9-8CD87C97B0C5@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF5D61684CE
X-Rspamd-Action: no action



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> From: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> Add register definitions and constants for managing MMU address space,
> including:
>  - Address space translation configuration (page table format, =
attributes)
>  - Memory attributes (cacheability, shareability)
>  - Address space commands (update, lock, flush)
>  - AsRegister helper for per-AS register access
>=20
> These will be used by the MMU/VM manager to configure page tables and
> control address space operations.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/regs.rs | 101 +++++++++++++++++++++++++++++++++++-
> 1 file changed, 100 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 611870c2e6af..9cb7ab0c806a 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -8,7 +8,10 @@
> #![allow(dead_code)]
>=20
> use kernel::{
> -    bits::bit_u32,
> +    bits::{
> +        bit_u32,
> +        bit_u64, //
> +    },
>     device::{
>         Bound,
>         Device, //
> @@ -111,3 +114,99 @@ pub(crate) fn write(&self, dev: &Device<Bound>, =
iomem: &Devres<IoMem>, value: u3
> pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> =3D Register;
> pub(crate) const MMU_IRQ_MASK: Register<0x2008> =3D Register;
> pub(crate) const MMU_IRQ_STAT: Register<0x200c> =3D Register;
> +
> +pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 =3D bit_u64(0);
> +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 =3D bit_u64(2) | =
bit_u64(1);
> +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 =3D bit_u64(25);
> +pub(crate) const AS_TRANSCFG_PTW_RA: u64 =3D bit_u64(30);
> +
> +pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
> +    x << 6
> +}
> +
> +pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 =3D 0 << 4;
> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 =3D 1 << 6;
> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 =3D 2 << 6;
> +
> +pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) =
-> u32 {
> +    (3 << 2) | (u32::from(w)) | ((u32::from(r)) << 1)
> +}
> +
> +pub(crate) const AS_COMMAND_UPDATE: u32 =3D 1;
> +pub(crate) const AS_COMMAND_LOCK: u32 =3D 2;
> +pub(crate) const AS_COMMAND_FLUSH_PT: u32 =3D 4;
> +pub(crate) const AS_COMMAND_FLUSH_MEM: u32 =3D 5;
> +
> +pub(crate) const AS_STATUS_ACTIVE: u32 =3D bit_u32(0);
> +
> +pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 =3D bit_u32(15);
> +
> +/// Maximum number of hardware address space slots.
> +/// The actual number of slots available is usually much lower.
> +pub(crate) const MAX_AS_REGISTERS: usize =3D 32;
> +
> +const MMU_BASE: usize =3D 0x2400;
> +const MMU_AS_SHIFT: usize =3D 6;
> +
> +const fn mmu_as(as_nr: usize) -> usize {
> +    MMU_BASE + (as_nr << MMU_AS_SHIFT)
> +}
> +
> +pub(crate) struct AsRegister(usize);
> +
> +impl AsRegister {
> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
> +        Ok(AsRegister(mmu_as(as_nr) + offset))
> +    }
> +
> +    #[inline]
> +    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: =
&Devres<IoMem>) -> Result<u32> {
> +        let value =3D (*iomem).access(dev)?.try_read32(self.0)?;
> +        Ok(value)
> +    }
> +
> +    #[inline]
> +    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: =
&Devres<IoMem>, value: u32) -> Result {
> +        (*iomem).access(dev)?.try_write32(value, self.0)?;
> +        Ok(())
> +    }
> +}
> +
> +pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x0)
> +}
> +
> +pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x4)
> +}
> +
> +pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x8)
> +}
> +
> +pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0xc)
> +}
> +
> +pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x10)
> +}
> +
> +pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x14)
> +}
> +
> +pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x18)
> +}
> +
> +pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x28)
> +}
> +
> +pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x30)
> +}
> +pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
> +    AsRegister::new(as_nr, 0x34)
> +}
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

