Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKgRN6s+ommq1AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:02:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5B81BF93B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEB810E1D6;
	Sat, 28 Feb 2026 01:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="cJSwERid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9711F10E1D6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 01:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772240549; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IipEJmUGwY0aCabxq07pbN6CG3MBk6/szyjGX/48F93CbWsKSbcLwC6M/vrJlodCoPRTekw45ARma0IG48D5jCLcmCb/6jNP3ZcWPOUDKJd+k0QKfrRiHMx4yncjt3OVVToZBpPhO2UCj8Re/kOHttKCox7uNRN9wmWOlBGkcv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772240549;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NKcv8U7yv7haXw4cyreomqHFxGh7Vb4URM0L0PdLoPw=; 
 b=mXixYith2rbNV/pWD6VCnJLVOZJ9JTbyDkbt4qyNv6vg2qkPxiYcxVsJWpF9fwbKjzX0rFtW1tOGtxesEZOPbAfku2yO1bEe4CPoOMiJyJn6CkKOB/bGuNCPM1KPDRq9AuXhLC/NiO3zyuK6SWJifJLgMzFoRSyRtPpGOJ/IXEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772240549; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=NKcv8U7yv7haXw4cyreomqHFxGh7Vb4URM0L0PdLoPw=;
 b=cJSwERid3wHNHkbXYZO5MgHFBU2+CtjjN2bvhktyH/TShY8BaV37GB2V5EzsL3X9
 /Oug58w7BggbBRgzvDiChDurGiOoqU9lY6/YES2ZR5gZqvULc4Vany3PW6IMfPiWs/C
 ciTuTFWcHjFMPoNZ6RpFMJ2ozZuiiE48Ejk5dWeo=
Received: by mx.zohomail.com with SMTPS id 177224054890469.89106924609871;
 Fri, 27 Feb 2026 17:02:28 -0800 (PST)
Date: Fri, 27 Feb 2026 17:02:28 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 12/12] drm/tyr: add firmware loading and MCU boot support
Message-ID: <aaI-pKS_gaVpQVIk@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-13-deborah.brouwer@collabora.com>
 <aZmWDIITgaEGkTU0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZmWDIITgaEGkTU0@google.com>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6A5B81BF93B
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 11:25:00AM +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 05:37:13PM -0800, Deborah Brouwer wrote:
> > Add firmware loading and management for the Mali CSF GPU. This introduces
> > the fw module that loads the Mali GPU firmware binary, parses it into
> > sections, and maps those sections into the MCU VM at the required
> > virtual addresses.
> > 
> > On probe, the firmware is loaded, its sections are mapped and populated,
> > the MCU VM is activated, and the MCU is booted.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> > +/// Loaded firmware with sections mapped into MCU VM.
> > +pub(crate) struct Firmware {
> > +    /// Platform device reference (needed to access the MCU JOB_IRQ registers).
> > +    pdev: ARef<platform::Device>,
> > +
> > +    /// Iomem need to access registers.
> > +    iomem: Arc<Devres<IoMem>>,
> > +
> > +    /// MCU VM.
> > +    vm: Arc<Vm>,
> > +
> > +    /// List of firmware sections.
> > +    #[expect(dead_code)]
> > +    sections: KVec<KBox<Section>>,
> 
> Why the box?

Hm I don’t actually remember why we originally needed KBox, but we don’t need the section
addresses to stay stable anymore so I’ll remove it.

> 
> > +            let section_start = parsed.data_range.start as usize;
> > +            let section_end = parsed.data_range.end as usize;
> > +            let mut data = KVec::new();
> > +            data.extend_from_slice(&fw.data()[section_start..section_end], GFP_KERNEL)?;
> 
> Could this access be out of bounds?

Yes, that could go out of bounds. I’ll add a defensive bounds check and return
EINVAL if the range is invalid.

> 
> Alice
