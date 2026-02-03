Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCU6Dcw6gWktFAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:01:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA350D2CEF
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ECC10E494;
	Tue,  3 Feb 2026 00:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gXu30xq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FB410E494
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F3A660010
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B35C2BC87
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770076872;
 bh=AEyq+1AGX37SMEthk/OyZ90jnJjCF9WKf64WOKd4zlg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gXu30xq4a9wlx207IAkYKZ8sjlZRRelxZBbiwg6tSS2SG1qCVOJazG2o1tMwZv6Ir
 RijFwcr0qEjqdI60LbBYejfAArT6PRphViqNBk/mXLWgKMdHGJWWT0gwjCRansd2vp
 PGKfzqRQ9EvMrCVmFkSIRj3I8Oy70WAG3FxMiuEW1APAfmqbbddkM/w56obZ66DPjj
 ldFcgIW7tQZ+UBi6pi0gvt8J6Pi9/9Xaz/O6A+5xXKzrkU2jAbVHvSse0eRN1mtuod
 e7Vf1m9Uu7JdwdnWb+5VQ+2GSI8zfuhyyOXE+skoQhsqBolgCjMY55oEL5VvCS1OFx
 N7KYEk7IXZaEw==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-79088484065so46665357b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 16:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV/xvjJIqCTdN1zz9seAALHh/RTqNRpQ2M5OjWJZf8u5zuP6WfljKsuoFT2u8KiDRbtAEIXHJeMCy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlYTtBsQDqT/kQbM0Zfi9rP05/gsKpmHfYFUIJ5nK87t8KuG7U
 epzN2ZS90Bms2gMdjR/OqP42imQU0YoyE0SJZ/6shakUqBb0n5o9KrFwn9RFL79kWPraXFFRve5
 qIUGR8Z7UPhFlyAdSG6OSe3ymDlQB9qk=
X-Received: by 2002:a05:690c:22c1:b0:794:795d:4724 with SMTP id
 00721157ae682-7949df03372mr224092257b3.18.1770076871489; Mon, 02 Feb 2026
 16:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
 <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-4-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-4-e081bcdc1467@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:01:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8w=YueeSdNOEXMU1JAkN=uxv+_jiYAwsHvOexXCzrEw@mail.gmail.com>
X-Gm-Features: AZwV_Qhk0sQ1xC7for89cmEyxVxKxu8RCmnX4B77DqsIpZbHHQR6m7kDjGP8QyU
Message-ID: <CAD++jLk8w=YueeSdNOEXMU1JAkN=uxv+_jiYAwsHvOexXCzrEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/mcde: dsi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:anitha.chrisanthus@intel.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CA350D2CEF
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 4:59=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> We need to handle the two cases: when a panel is found and when it isn't,
> even though the latter is not supported. So:
>
>  * in case a panel is not found and bridge is, get a reference to the
>    found bridge
>  * in case a panel is found, get a reference to the panel_bridge when it
>    is added, so the following code always get exactly one reference that
>    it needs to put
>
> Finally, use the next_bridge pointer in struct drm_bridge in order to
> simplify putting the reference.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
