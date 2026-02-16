Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NUEE1Qkk2kX1wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:06:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C81446D6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292810E035;
	Mon, 16 Feb 2026 14:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="daXH3AgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827B10E035
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771250766;
 bh=dKwBFmk8gTB+srL/9ek2nPthdM7fpaKb3ygyY/JkJ30=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=daXH3AgZRHGuQSpm6G91Sko6UstNpozS0YLFrmoUjw/Rpe3AnP4iEA08rdc/1QpEU
 iOQ1FSfnjmTcrAMwoT6yMpI08gkGliQxUz7z419jy5052zcJpY2PpjwfEZ2BY3fJIg
 6a7ZdmYtDnERzuG08ABsAZb+Ww46N876VTc0XbFmKhMQNJoizb31sJG3+UN1DiWkwv
 eqC5dZKERGGNmQB3JNUGEjnJKTC79f9ouYZPljp8XLGXhwmWA/sknI4pKTEFDxv2Fq
 J3evxwbcdaj3dggJTKoTvJqvcyJ/TYW3ZXMryj8XPrPutv65TBbmWKbCBmh15kBQC5
 HIU39rLKbveQA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D32117E12A9;
 Mon, 16 Feb 2026 15:06:05 +0100 (CET)
Date: Mon, 16 Feb 2026 15:06:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Adam Ford <aford173@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Onur =?UTF-8?B?w5Z6a2Fu?=
 <work@onurozkan.dev>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Message-ID: <20260216150601.6703b0f3@fedora>
In-Reply-To: <4730819.LvFx2qVVIh@workhorse>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260216104423.6b5bcc96@fedora>
 <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
 <4730819.LvFx2qVVIh@workhorse>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:aford173@gmail.com,m:angelogioacchino.delregno@collabora.com,m:work@onurozkan.dev,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,onurozkan.dev,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD3C81446D6
X-Rspamd-Action: no action

Hi Nicolas,

On Mon, 16 Feb 2026 13:43:19 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> > >>
> > >> I wonder if a more generic device tree flag would be better here.  
> > > 
> > > No, we don't want it as a separate DT flag. This is all stuff we can
> > > hide behind the compat, and every bit we add to the DT we don't
> > > strictly need turns out to be a liability in the long run in general.
> > >   
> > >> What happens if others do the same as Mediatek or Mediatek decides to
> > >> do this with more processors and this list grows?  
> > > 
> > > That's what panthor_soc_data is for: you can attach per-compat
> > > properties without polluting the DT with more stuff that can be
> > > directly inferred from the compatible.
> > >   
> > >> It seems like a
> > >> panthor binding might be useful to prevent future bloat.  
> > > 
> > > It's actually the opposite, the more we add to the DT, the trickier it
> > > gets to maintain, because we tend to get those things wrong (is the
> > > SRAM really not needed on mt8196, or is this just a workaround to hide
> > > the fact the PM is deferred to some FW?).
> > >   
> > 
> > MT8196 has three supplies: core, stack, sram.
> > 
> > For example, the Google Rauru Chromebooks use those:
> > 
> >         core-supply = <&mt6373_vbuck7>;
> >         stack-supply = <&mt6316dp_vbuck0>;
> >         sram-supply = <&mt6316kp_vbuck1>;
> > 
> > As of now (in our midstream trees), these supplies are declared in the gpufreq
> > node (the performance domain controller), and required to be on whenever GPUEB
> > interaction is needed, other than whenever the GPU itself is, well, needed to
> > be powered.
> > 
> > As of the current model, these supplies are getting powered on and off along
> > with the MFG power domain.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005
> > 
> > I'm not sure what happens if we also add those to the GPU node... for this, I'm
> > adding Nicolas to the Ccs, as he is the one who developed support for EB.  
> 
> Fairly sure they need to be on as part of any of the operations the MFG stuff
> does, but I also am not 100% sure on this because I didn't take notes at the
> time.
> 
> Either way, this patch shouldn't exist, it doesn't do anything useful, as a
> missing supply from the DT can be caught with `make dtbs_check`.

Well, the fact DTs lacking the sram-supply definition went through
is a clear sign that `make dtbs_check` is not bulletproof. Not saying
the script doesn't work, but if maintainers don't run it automatically
before merging DTs, it's going to fail again, I'm afraid. If we had
enforced that "supply is mandatory" rule at runtime, we wouldn't be in
position where we have invalid DTs/DTBs merged/deployed, and I'm saying
that as the person git blame points to for introducing this logic :-).

> It does not
> need to be booted on each device to then have the driver abort probe at runtime.

Now that we've merged those DTs we can't really fail the probe
anyway, because that would break DT-backward compat, but flagging those
DTBs as broken (with an error message) would be better than pretending
it's all good, IMHO.

Regards,

Boris
