Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOdsLqGkb2n0DgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69C46C0F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636ED10E5E5;
	Tue, 20 Jan 2026 12:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="NK/JAsH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AB710E5E5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768913885; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PsnqqzEcbPifRlGdx2Mtiwp9QIgJxsvDHp/ZUgjFSzdf16ql8xhGcvuT7NKQKC+G5q+lGFJ0OOYQk74z4on554+oPqkYzVhN7gZBycbjOH4uZ7plFo3FRPd46d7BTY5TtvU1hYd+vt/p5P5PBTmxQLrHTkZoW7WGdmZSjzrn3RY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768913885;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3YJ9HNhhdVjpjd8lpyfVaHQErXsbBsLle1p3eCQvHXI=; 
 b=RDAs0x08RWqlRZF1mmpSh6vZdyCn8FH975Uj7+lx2elZQ/4md4lekQigs7NvigAXn2DmnjZEwGXp8tW8cUW43XHvuF4a2OrIaN3XOS4Ib5lCeLCPAS5I9gP190qXnoZljsfwhtb1122y6TEGXbrwPswel1AyPOMbnQoYsgGtpSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768913885; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=3YJ9HNhhdVjpjd8lpyfVaHQErXsbBsLle1p3eCQvHXI=;
 b=NK/JAsH+4qv3kpUeu7xptAvVuI5rJxqbU4m6klJPYdjIOGp+dnkyjzN/CyfJuz4e
 9qI0BrUH9vpa0kbt2888+9Hauk0o7DsTe72m7VGk72jhNYR0UxtCjdpl6uhgHh/Xm01
 518BOyMsxCdTsWZcGoTNNOTQjdgKdlftHFJp5yRY=
Received: by mx.zohomail.com with SMTPS id 1768913883065871.0979621537674;
 Tue, 20 Jan 2026 04:58:03 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
Date: Tue, 20 Jan 2026 13:57:56 +0100
Message-ID: <13000903.O9o76ZdvQC@workhorse>
In-Reply-To: <c11ef222-c661-4937-8f35-25f450ab71bc@suse.de>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-1-7fb45bbfbebd@collabora.com>
 <c11ef222-c661-4937-8f35-25f450ab71bc@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:daniels@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[rock-chips.com,sntech.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 6F69C46C0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, 20 January 2026 13:49:12 Central European Standard Time Thomas Zimmermann wrote:
> Hi
> 
> Am 06.12.25 um 21:45 schrieb Nicolas Frattaroli:
> > From: Daniel Stone <daniels@collabora.com>
> >
> > We should never be able to create a framebuffer with an unsupported
> > format, so throw a warning if this ever happens, instead of attempting
> > to stagger on.
> >
> > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index 498df0ce4680..20b49209ddcd 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
> >   		return 0;
> >   
> >   	format = vop2_convert_format(fb->format->format);
> > -	if (format < 0)
> > +	/* We shouldn't be able to create a fb for an unsupported format */
> > +	if (WARN_ON(format < 0))
> 
> Please use drm_WARN_ON() here.

Hi Thomas,


A later revision of this series has already been applied. Feel free
to send such a patch however.


Kind regards,
Nicolas Frattaroli

> 
> Best regards
> Thomas
> 
> >   		return format;
> >   
> >   	/* Co-ordinates have now been clipped */
> >
> 
> 


