Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJBdCoCzd2l2kQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:33:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993038C1F5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ED910E0AE;
	Mon, 26 Jan 2026 18:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="X3X0uLS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2618110E0AE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769452399; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lJL3A9t9hmeTtDajEyOkcB7e2cd5TG4b4Mm+yQFnozAhSMng9SI4XbvIKw6YGI+641gPVWM0kAyHynfK8UgMFjLwfdAhl6WHeKldIyfEmGvhK3EeBj+Grp5ji4pWWOpkRVj1UedI3riZ+YRr1TG6AxBxhhugeeNio8zISiX813M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769452399;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZKDHgurtFd7YxT86rQlbdG/VJyEjIfL7f4+CcLVwL54=; 
 b=lA3avtEDxa/f14kgneIL51tIzq2V6QsJMZrSUk/sooYTYFX/qVYBS35figX7L2ohZldRairwkC4hNi2wZTI+saZOnhX29EkBog0SOiioxsyoNhj8LzQXLvCX8lE7/kPyQH1ANwl6oaE24TihGOgo2jycbzcBE2v7v5dgrVhcPqs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769452399; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=ZKDHgurtFd7YxT86rQlbdG/VJyEjIfL7f4+CcLVwL54=;
 b=X3X0uLS2FXPBFTY8Uw+CeJHu+Xve6rL0yiIuu4mbKQgR3/xqtAJo948sp0mfeXa1
 6xz5nqTuHBaRxNjZ0o8OyWHbczBaCzLE9LX7t0qtCzUE9ZHwtc6NrMakiIVk5K0WzXX
 /kS/B1nG9NNd7IAInYGbfX9LeIwYhC2AO5wFNjTs=
Received: by mx.zohomail.com with SMTPS id 1769452397997823.5064676659088;
 Mon, 26 Jan 2026 10:33:17 -0800 (PST)
Message-ID: <1b66343c76e5b66c696c1fd8a148df299cce60dd.camel@collabora.com>
Subject: Re: [PATCH v4 1/4] uapi: Provide DIV_ROUND_CLOSEST()
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang	 <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,  Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed	 <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Mon, 26 Jan 2026 15:33:11 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-1-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-1-2ff1127ea757@collabora.com>
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
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 993038C1F5
X-Rspamd-Action: no action

On Fri, 2025-12-19 at 23:46 +0200, Cristian Ciocaltea wrote:
> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> include/linux/math.h.
>=20
> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST()
> as
> a common definition in uapi.
>=20
> Additionally, ensure it allows building ISO C applications by
> switching
> from the 'typeof' GNU extension to the ISO-friendly __typeof__.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas
