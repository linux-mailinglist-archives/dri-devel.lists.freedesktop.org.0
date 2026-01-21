Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JdBHdbFcGkNZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 13:25:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22BF56B92
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 13:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8ED10E219;
	Wed, 21 Jan 2026 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NusVomfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8610E219
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 12:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768998348; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=j6gxz+AMc+Ef4n+nYe88V0M8PERKQ2TT22cSnDINv80xL23plNJQTcezohm9fQtYGqsullpmvLB4xvaZ+CEtV7xHaB0biYcEb7GFRVueUdG6GRHB0DmF2D1fEgYKyDzVFYglPgx4d4FTT8rVWdcmOMyRVcdakfaB1eUWeU9c9Xw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768998348;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ziZ6Zkr6BIi8sGyBnmGeK7WaLH9fF37csTWwS4Uc6oU=; 
 b=AlO9CQ8MV23jxo3AaWlrHpJ/HI2HVCPKhTeZvwYNkkIWOlSpIQ75Yuam7G47NRAky4bwdWJn7VjQw0sOUiU5DmpX1WG4qoYrZCzMqCmfIq1qobsbM76OahfjgynjLQdzwsE58xRRnzGj0tvL+JULLL6D0NC6Tu4J+ksV6gOqdv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768998348; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ziZ6Zkr6BIi8sGyBnmGeK7WaLH9fF37csTWwS4Uc6oU=;
 b=NusVomfW8mpSfxI+/avCNKVF+boHclRL6UvpGb/mb4N+lLt/UChfFBf7pPSgsoI0
 jaaxJ2nWCSxaisyuSW6eb3hRRdGScq7UTp4/9rMQwBi0AZQ491ndlq5m24QT9NzpnNU
 XLqa+Py1LSBgxQqYfjlu2wPiV2+AU2QU2SxufQCc=
Received: by mx.zohomail.com with SMTPS id 1768998346574839.9172334040906;
 Wed, 21 Jan 2026 04:25:46 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 4/4] gpu: tyr: remove redundant `.as_ref()` for `dev_*`
 print
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260120181152.3640314-4-gary@kernel.org>
Date: Wed, 21 Jan 2026 09:25:29 -0300
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <26F297F3-A93C-4998-9522-CFAD15C9A701@collabora.com>
References: <20260120181152.3640314-1-gary@kernel.org>
 <20260120181152.3640314-4-gary@kernel.org>
To: Gary Guo <gary@garyguo.net>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:gary@garyguo.net,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,protonmail.com,google.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: C22BF56B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On 20 Jan 2026, at 15:11, Gary Guo <gary@kernel.org> wrote:
>=20
> From: Gary Guo <gary@garyguo.net>
>=20
> This is now handled by the macro itself.
>=20
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> drivers/gpu/drm/tyr/driver.rs | 2 +-
> drivers/gpu/drm/tyr/gpu.rs    | 6 +++---
> 2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index 2a45d0288825..fe991d8cbb4a 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -140,7 +140,7 @@ fn probe(
>=20
>         // We need this to be dev_info!() because dev_dbg!() does not =
work at
>         // all in Rust for now, and we need to see whether probe =
succeeded.
> -        dev_info!(pdev.as_ref(), "Tyr initialized correctly.\n");
> +        dev_info!(pdev, "Tyr initialized correctly.\n");
>         Ok(driver)
>     }
> }
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index bfbf2a1d80e6..04a0a5d5ef3a 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -98,7 +98,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
>         };
>=20
>         dev_info!(
> -            pdev.as_ref(),
> +            pdev,
>             "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status =
0x{:x}",
>             model_name,
>             self.gpu_id >> 16,
> @@ -108,7 +108,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) =
{
>         );
>=20
>         dev_info!(
> -            pdev.as_ref(),
> +            pdev,
>             "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} =
AS:{:#x}",
>             self.l2_features,
>             self.tiler_features,
> @@ -118,7 +118,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) =
{
>         );
>=20
>         dev_info!(
> -            pdev.as_ref(),
> +            pdev,
>             "shader_present=3D0x{:016x} l2_present=3D0x{:016x} =
tiler_present=3D0x{:016x}",
>             self.shader_present,
>             self.l2_present,
> --=20
> 2.51.2
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

