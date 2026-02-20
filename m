Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMdMNMlpmGn4IAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:03:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE616820E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 15:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA6F10E812;
	Fri, 20 Feb 2026 14:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CjDCgnXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E4F10E80E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 14:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771596227; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=na/PVeTbSV57quP4075W+gAyXndhOrOKAfr9guq5J5bCDG+q7jqCez7TaTD4PHDZ8103M/hU41TMePZqI0oAh8uJ9vItXBhP47EPisw6+abyRsY5IB2WboazEjpTMzqun8djoPRP/r6DbgiOf5A34+todEKpcb+Ab2S95XGIc6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771596227;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Hss0ExZ9YqaGFnovrBNOogefYBXYmBiHXblAHnhPYjc=; 
 b=b6lbCOJ4dc+vNGBWuKMqGKupL1y+UnjaO48aNjre4ne5yR3j9ikSmxfo0yEikZI8mNFfiAcxaZC04lXacKw1/c1vqpHsw2nqI7tJ8Im2lUIAYKwq7S7eaX4ykR1+yDqK7/+oR7zCTjiGOl/9d7zdu+pXK0C/wOXW1HV0/bdVNUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771596227; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Hss0ExZ9YqaGFnovrBNOogefYBXYmBiHXblAHnhPYjc=;
 b=CjDCgnXPyBeqSLiGxYhsaDA38Jkym8ZpHsN4ER6zNjR9bnokF670ucMuzSRKLL10
 VkcFNbGAhXVZiIBUNewn35oR8KJhYUJ7PjrLHsctjtxIjwaZi6knzYFGdJqN6UbUAcQ
 KiclCSCv4dhVK0O0J7fNXdrGiq1WhP64ZQ2VbnLk=
Received: by mx.zohomail.com with SMTPS id 1771596225427242.69170962146313;
 Fri, 20 Feb 2026 06:03:45 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-3-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:03:29 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA5860A4-53D4-4571-BBB1-49ACB9F12243@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-3-deborah.brouwer@collabora.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 3BCE616820E
X-Rspamd-Action: no action



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> causes them to be shut down before any other fields in =
TyrDrmDeviceData
> are dropped. This prevents us from using the clocks when dropping the
> other fields in TyrDrmDeviceData.
>=20
> In order to better control when the clocks are dropped, move this =
cleanup
> logic into a Drop implementation on the Clocks struct itself.
>=20
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
> 1 file changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index ae4daa12b3e5..9bc6ed56c45e 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
>     _device: ARef<TyrDrmDevice>,
> }
>=20
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
> pub(crate) struct TyrDrmDeviceData {
>     pub(crate) pdev: ARef<platform::Device>,
>=20
> @@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
>     fn drop(self: Pin<&mut Self>) {}
> }
>=20
> -#[pinned_drop]
> -impl PinnedDrop for TyrDrmDeviceData {
> -    fn drop(self: Pin<&mut Self>) {
> -        // TODO: the type-state pattern for Clks will fix this.
> -        let clks =3D self.clks.lock();
> -        clks.core.disable_unprepare();
> -        clks.stacks.disable_unprepare();
> -        clks.coregroup.disable_unprepare();
> -    }
> -}
> -
> // We need to retain the name "panthor" to achieve drop-in =
compatibility with
> // the C driver in the userspace stack.
> const INFO: drm::DriverInfo =3D drm::DriverInfo {
> @@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
>     }
> }
>=20
> -#[pin_data]
> struct Clocks {
>     core: Clk,
>     stacks: OptionalClk,
>     coregroup: OptionalClk,
> }
>=20
> -#[pin_data]
> +impl Drop for Clocks {
> +    fn drop(&mut self) {
> +        self.core.disable_unprepare();
> +        self.stacks.disable_unprepare();
> +        self.coregroup.disable_unprepare();
> +    }
> +}
> +
> struct Regulators {
>     _mali: Regulator<regulator::Enabled>,
>     _sram: Regulator<regulator::Enabled>,
> --=20
> 2.52.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

