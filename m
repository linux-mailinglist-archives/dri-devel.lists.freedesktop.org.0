Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HCqaHeCIlmkUhAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 04:52:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4415BEA8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 04:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B6C10E66C;
	Thu, 19 Feb 2026 03:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="La4X65W6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F404810E66C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A925543EDD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59364C4CEF7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771473115;
 bh=X46UpLW2j+eyZ6ykAjkS0HlxNYklVA+kQjtmNdaEaUs=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=La4X65W6UQ6ne9cUU6H55pRNgKhI5jBhi55Zj0Ym0G63aaG+rrIMo/D211v1/gLha
 H1GXM+6YGhdTVtrs8FjDryYB/hPmC3HSasw/WgjAlLxjduM+XY2FBOyA8nWrYEwmoT
 2ljArH4oOzoRAexxb2BYaijdTPgf0FWEhq1z9z4XXTMC0d8LT92P5/CJeEuQld9kit
 7Go88e/N5TRnEQveqS6MN+1MUl2EXFGXs/aGgjxSrQg66MBh7EhtuJBBFi9YfkEETc
 1Lca7nwdZ7ObS3+3uGPzD2SpnPG1wn5ncXtSs/byesyvzCbooNxyQQayxh0T49Mh7t
 tatYqoBVncgcA==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38710d7d8baso3741071fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 19:51:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsgSTb5FktaG1dVpgZDJ2kbnfDmY918yM7ZSaZOWoBoznOmgMY5Ef+t1OMuE+RsLXNXGW+7UA6vw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRx99zzrlYc5umLF4A+J6zAuprRdYJ3lVFN+/qb8PrmIz0YsF5
 mwzxsSld/hTaJZ9VGQeFsbuRBjPzjfgGWiMJrfFbadl/RgPjU+TXa5Vn//FKd9AF7GnNTvuT4uT
 wMIQj0L7bmqi/XAfJhgIsO/7KOjcgmeM=
X-Received: by 2002:a05:651c:e17:b0:386:4776:2a04 with SMTP id
 38308e7fff4ca-3881b8da106mr46506631fa.16.1771473113628; Wed, 18 Feb 2026
 19:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20260218183454.7881-1-jernej.skrabec@gmail.com>
In-Reply-To: <20260218183454.7881-1-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Feb 2026 11:51:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Y0G1UFRJCue+x107WDj_9Nk0cXuMp3AV4yTKW7QbFsA@mail.gmail.com>
X-Gm-Features: AaiRm531971J2FLwKv3FM0ppn6z4yZUtNAfD_zMfFtAHtrup-P3e9dbLMfVsCt8
Message-ID: <CAGb2v64Y0G1UFRJCue+x107WDj_9Nk0cXuMp3AV4yTKW7QbFsA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: mixer: Fix layer init code
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,sholland.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E0E4415BEA8
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 2:35=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Code refactoring dropped extra NULL sentinel entry at the end of the drm
> planes array.
>
> Add it back.
>
> Reported-by: Chen-Yu Tsai <wens@kernel.org>
> Closes: https://lore.kernel.org/linux-sunxi/CAGb2v65wY2pF6sR+0JgnpLa4ysvj=
ght5hAKDa1RUyo=3DzEKXreg@mail.gmail.com/
> Fixes: 5fd711adc0ba ("drm/sun4i: layer: move num of planes calc out of la=
yer code")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
