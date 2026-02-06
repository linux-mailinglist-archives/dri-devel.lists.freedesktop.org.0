Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPmsJXD2hWnHIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:10:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C8FEA7B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB61410E7B6;
	Fri,  6 Feb 2026 14:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="CkUovisg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2D410E7B6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:10:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770387040; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BMjN2G2e1K3gWDVCQGaE3haovIpIcRG4WDTXC+xBYm5AQWe1i0dr+bXGNXfUL93eHKpOHGDL3LXA6iGOf8EUTc1+UcI927DTEHVjK2EH9q3FSPYFXo5lWJTcIpw4ExRyJSB8nz9xK7dLOP9dQfQlve6ElDl87SwCCIWELB6lbRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770387040;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Peb4bRvkuJSgns1XA6+qJKAdVywZBsdpUaY2vtFtMTE=; 
 b=MpE/8s0ryy6kBrOXVXzuPdhFQh0xeZF8KdXoWA8tbpSyZT8AEPQ7xBIcEO0vD/+qw5qV+A0DYQY7/1XIor14jKmmffgdFyckG/kYOKVHhFQIM0drGwdJMpiKxkGuVnIWkYgyix32N6V9oy1IJtHNbY2/TtJa+t1wh7CKrwVX5eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770387039; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=Peb4bRvkuJSgns1XA6+qJKAdVywZBsdpUaY2vtFtMTE=;
 b=CkUovisgpBVCh8YQUPhbv5VBgS4fEwhK7I95wZ1LIIXAW5UEHW/tss1AqNgSnAQq
 meFi6m7CQzmrWZpVf5qrp9IMYHJfZMnbGdi+vlJ40IDUMx3Y2AemCPkiHDjsc4+8MJg
 OY66qtNZvH1E7MI9O0clQhV2fDHUO6psNvhbF1o4=
Received: by mx.zohomail.com with SMTPS id 1770387038864755.1550395699519;
 Fri, 6 Feb 2026 06:10:38 -0800 (PST)
Message-ID: <b97e849eb0de3fc497f4473df142d39f3cb7c823.camel@collabora.com>
Subject: Re: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops flag
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
Date: Fri, 06 Feb 2026 09:10:37 -0500
In-Reply-To: <55bcc926-a090-4f4c-9325-6599761d10c6@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
 <55bcc926-a090-4f4c-9325-6599761d10c6@collabora.com>
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
	NEURAL_HAM(-0.00)[-0.925];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1D6C8FEA7B
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 11:07 +0100, AngeloGioacchino Del Regno wrote:
> Il 23/12/25 20:44, N=C3=ADcolas F. R. A. Prado ha scritto:
> > Add a supports_plane_colorops flag to the driver data to allow SoCs
> > that
> > support per-plane color operations to enable support for it in the
> > driver.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> You should merge this patch [03/11] with [05/11] - so that you
> introduce the member
> in the same commit where you use it.
>=20
> This patch is a one-liner and it's not doing anything complicated at
> all :-)

Sure, will do in v2 :).

--=20
Thanks,

N=C3=ADcolas
