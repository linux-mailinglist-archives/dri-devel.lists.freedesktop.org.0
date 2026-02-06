Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIl7Fx33hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:13:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5AFEAC7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A47210E7BA;
	Fri,  6 Feb 2026 14:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="f8S4RADj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD62610E7BA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770387214; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gt+coUoet8QH0TDqiquTwhBLpKT89/Akykd/Qhjkz+jl4xNs7KMymHAUTG5im9Or4TqucZ2BmEn0njypAvlSnrU0vHer9kUO4mDd+YQvjAJ7xO9uQCQea4EUtbJmT4IS2Ig54a4+ca3NVm9fI/d3E+WQezSKM8A8Ja9lrkLGPzc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770387214;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xvam5HJNIvasJ/2nIByj8E9UTXU+JTYDZ6M6R68d/EY=; 
 b=fUkZAKXTaUrhAz7q63XAWElVsPJYHqA+Hp0X7XdnlH632o2qI2OSov7SMd9nUGoF0PmMA/wqtpKjbE2HAkcHrxffcWcZnxTMpnzkxpOLwV7gSOSXYmcQQ4a3TWbPZxAXpOm04A0wG2pYjf3j0MTVCMGGFBFq3v0mEa0T0A0Y9vU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770387214; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=xvam5HJNIvasJ/2nIByj8E9UTXU+JTYDZ6M6R68d/EY=;
 b=f8S4RADjyViHt7femYhhlq9LTWkAFgUbqPBzyhXPNCt5x81+xJstzn2mZU0Dov8R
 OWuvJTtRyW7N00h9PTXZOZkhVtCBeqk0nb56eVlWAo1aCoVPRqA1NeibY5I/GS5aafV
 Kx0iTFB/RUyXh4pU5p/slXNB3oFcDjmaoP3h+Wnc=
Received: by mx.zohomail.com with SMTPS id 1770387213516827.7987217683014;
 Fri, 6 Feb 2026 06:13:33 -0800 (PST)
Message-ID: <9849130a6c4da61bd7291f40a9a3d224d32ef08a.camel@collabora.com>
Subject: Re: [PATCH 01/11] drm/mediatek: Introduce DDP plane_colorops_init()
 hook
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, kernel@collabora.com
Date: Fri, 06 Feb 2026 09:13:31 -0500
In-Reply-To: <8d043341-9099-47b2-a1fe-538502e40f99@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-1-0cb99bd0ab33@collabora.com>
 <8d043341-9099-47b2-a1fe-538502e40f99@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:angelogioacchino.delregno@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: DBD5AFEAC7
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 11:07 +0100, AngeloGioacchino Del Regno wrote:
> Il 23/12/25 20:44, N=C3=ADcolas F. R. A. Prado ha scritto:
> > Introduce a plane_colorops_init() hook to allow DDP components to
> > define
> > how to initialize the color pipeline on their planes.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> Just a nit for the commit description.
>=20
> In preparation for adding support for per-plane color pipelines,
> introduce a new
> plane_colorops_init() hook to allow [...etc]

Will do in v2!

--=20
Thanks,

N=C3=ADcolas
