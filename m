Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHY0KZCLjWnq3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:13:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7C12B235
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22D910E6ED;
	Thu, 12 Feb 2026 08:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bHYuJr+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF54710E6ED
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770883979;
 bh=MkM9n5G5FuzwWDYfSic5VW8fnNrPDgI90fLJj7mIByw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bHYuJr+wUjzI51eO+PDeIfnLBsR502/XpmkC5mJCljP5lejNFKK4ajD4imfZ70oWA
 TbX5O8eU0tls7rMqOqNKw+3Zxs+qIdOsLkG2KD20wAwfp5BM4uHPoVbtYDQneBx5tc
 ZMNg2QcOfG8C0FvsgWs9E6J7tqmI5nrgPd16FWIQ9Gmsb5rpjysg1TSBKJL4jORm8F
 FjXPG/bg0it6MBTemdpTnQ3BVTUIk3Awib43oVxrqvAjUMJaj6JGePPOdnTfNJ1MfU
 i4Bf7eFYtuFN5VfZK9W46HhDvv8XY8crk5JQPFH4WIJAZ5LNdgeduA7xgQsFfNUQxt
 8yY0WHOF+cy5g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1530417E110D;
 Thu, 12 Feb 2026 09:12:59 +0100 (CET)
Date: Thu, 12 Feb 2026 09:12:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
Message-ID: <20260212091255.74b65cb0@fedora>
In-Reply-To: <20260212013713.304343-3-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-3-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 12C7C12B235
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:03 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> causes them to be shut down before any other fields in TyrDrmDeviceData
> are dropped. This prevents us from using the clocks when dropping the
> other fields in TyrDrmDeviceData.
> 
> In order to better control when the clocks are dropped, move this cleanup
> logic into a Drop implementation on the Clocks struct itself.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Maybe you should mention that Clocks is no longer considered pinned,
because it's not needed in practice.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index ae4daa12b3e5..9bc6ed56c45e 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
>      _device: ARef<TyrDrmDevice>,
>  }
>  
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  pub(crate) struct TyrDrmDeviceData {
>      pub(crate) pdev: ARef<platform::Device>,
>  
> @@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
>      fn drop(self: Pin<&mut Self>) {}
>  }
>  
> -#[pinned_drop]
> -impl PinnedDrop for TyrDrmDeviceData {
> -    fn drop(self: Pin<&mut Self>) {
> -        // TODO: the type-state pattern for Clks will fix this.
> -        let clks = self.clks.lock();
> -        clks.core.disable_unprepare();
> -        clks.stacks.disable_unprepare();
> -        clks.coregroup.disable_unprepare();
> -    }
> -}
> -
>  // We need to retain the name "panthor" to achieve drop-in compatibility with
>  // the C driver in the userspace stack.
>  const INFO: drm::DriverInfo = drm::DriverInfo {
> @@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
>      }
>  }
>  
> -#[pin_data]
>  struct Clocks {
>      core: Clk,
>      stacks: OptionalClk,
>      coregroup: OptionalClk,
>  }
>  
> -#[pin_data]
> +impl Drop for Clocks {
> +    fn drop(&mut self) {
> +        self.core.disable_unprepare();
> +        self.stacks.disable_unprepare();
> +        self.coregroup.disable_unprepare();
> +    }
> +}
> +
>  struct Regulators {
>      _mali: Regulator<regulator::Enabled>,
>      _sram: Regulator<regulator::Enabled>,

