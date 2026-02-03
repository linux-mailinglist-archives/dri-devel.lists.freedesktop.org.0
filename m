Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ4wCK86gWmUEwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:00:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEDBD2CD8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98D10E48A;
	Tue,  3 Feb 2026 00:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dwrsY72R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784110E48A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:00:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B4DC1444B3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93814C4AF0B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770076842;
 bh=WrPPs8WcaSvfdv5rnIAyJY574BdkZCY/wzVTg3/Q/hg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dwrsY72RWvnbLmq45P/u9xVB7r09F5KmuvlEenvFLWEZeiO1ChAA4JcaKZrVgH9Js
 bCnmYXGxkIqFx/rTA0v6oagewV0VtZZ/hfEkpfK+VyMGtmnFXX64v1NGSachg2ogFm
 fX6l4n+o8zkkkAzORwDiBNeOpKOO07KSLyABCYY1QMk3WrCMKYpCRBTewVqLVvkwL1
 Enfb1K4xK0UpJqJgPVNeSSaRiRIfuyyHUha+0/8L85ZQtrTbMQF+XjfNEgQN48/kpU
 b9rzhjYFB9ib0Ye+bOW2OcXvx+Lzw0HHX19SX/d233ds7a8CszdQltvyQ66dh6yoHW
 pwUHB04NdpdDw==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-794baacdefcso23292167b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 16:00:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZCE26RYajEk8mVxSrMxPXkUjUmCAshpe+ziGFIlVad8RhJoFCvlxq1C0tf3FHb5VnaiN1PxHVi/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgQC8V9FfDB6xMOqsQmE64Y1ooi4YRMfbU/XtR9R3J8KZ9bOJq
 poQVEVREbMrepNhCDO9c2HJ7TkaSTqRxW1X+nRFFUct/VgN8IvdrQd4tvyuxNVDAkXHWleNhIhR
 SfATmATUUI8qAUZxb+rocTaVM423Nk58=
X-Received: by 2002:a05:690c:c3cb:b0:788:201c:a170 with SMTP id
 00721157ae682-7949e017673mr195191607b3.42.1770076841683; Mon, 02 Feb 2026
 16:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
 <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-3-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-3-e081bcdc1467@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:00:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLnbXyCK+iY8M=tMTGvsSq=Gg5mxiqyGAh6NKOyVz5tzeA@mail.gmail.com>
X-Gm-Features: AZwV_Qh6fmiQ2UigTxCTLDFtCigzUbALA2x_oLrz-IzstcPkob2SbnZ13_CAUOc
Message-ID: <CAD++jLnbXyCK+iY8M=tMTGvsSq=Gg5mxiqyGAh6NKOyVz5tzeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/mcde: dsi: mcde_dsi_bind: break when a panel
 or bridge is found
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9BEDBD2CD8
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 4:58=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> mcde_dsi_bind() has a loop over all subnodes looking for a panel, but doe=
s
> not exit when a match is found and only stores the last match. However th=
is
> will be problematic when introducing refcounting on the struct drm_device
> pointer in a following commit, because of_drm_find_and_get_bridge() would
> get a reference to multiple bridges.
>
> There seem to be no real reason for looking for multiple panels, so just
> break as soon as a match is found.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
