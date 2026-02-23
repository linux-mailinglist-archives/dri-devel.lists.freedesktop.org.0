Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Bq8RHKuenGnPJgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 19:38:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBD17B9C1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 19:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFEE10E28A;
	Mon, 23 Feb 2026 18:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Wbv4VUks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1151510E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 18:38:29 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id 83A3ABC24C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:38:26 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 06D85BBF0D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:38:26 +0200 (EET)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 5DCE31FDB24
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:38:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1771871905;
 bh=bTzo6hhx7QnoIqWlyw95PWeqwe87R26mWDKyCMR4vbc=;
 h=Received:From:Subject:To;
 b=Wbv4VUks5pqCkpB0zfVaT+D6Sdp99nci76VB7we0PyBcLuIxCjOHqIaJHz9v3uJcl
 OMQZX9IvZbgKCdAe3cCwsw3efwkSRDIZpgNC5v5G6Evm5xo8OF9yUdZ863MiMNa+j2
 vA4TQiZ2x944xtQWfOzdVxcZWMUoZLe2tkcOAqEbQG0Ugji68HMfR45x0HsIRadiYr
 SwwcwJA91pfgVTBOIsSGdlg5nlWCLuVMz4VSAgPqrYL/5rt1XXVnVjeleJaG3cJZ0n
 pCsHjTP7XrVY5SXqGdLl823yPHyR57ZPnItu7u9ieNMI3mWDT7OGwUjPGdnfjDXEGw
 xQ/LhkVo9OZtQ==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.214.172) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-pl1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a962230847so46048015ad.3
 for <dri-devel@lists.freedesktop.org>;
 Mon, 23 Feb 2026 10:38:25 -0800 (PST)
X-Gm-Message-State: AOJu0YwPvnkyfzj02xkdVIkPJAvc+APxf1xg5To3FFS8vLVUhNfDdGBd
 teEbK25Htfqn+Dzvtdifzci9nL4+jlVs2vP4uE9F2j7UKk7PqVhfjICHTAegV9M7oMYEsOQM7Su
 KQre52dkFff4wA/8UT6f5+VEIbV0/6yI=
X-Received: by 2002:a17:903:1212:b0:2aa:d11d:5c36 with SMTP id
 d9443c01a7336-2ad744ebbc9mr93517215ad.30.1771871904152; Mon, 23 Feb 2026
 10:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20260216204547.293291-1-lkml@antheas.dev>
In-Reply-To: <20260216204547.293291-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 23 Feb 2026 19:38:13 +0100
X-Gmail-Original-Message-ID: <CAGwozwHB29LsS-DKRjRJjnVEuWi-Spro2kcSoZ-+Av73cD=nkg@mail.gmail.com>
X-Gm-Features: AaiRm53CUmULsNTUDkPxJdIHbyapvlQvBLkL8a80PlJEsfw70PZdOWJqtStn-pY
Message-ID: <CAGwozwHB29LsS-DKRjRJjnVEuWi-Spro2kcSoZ-+Av73cD=nkg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] drm: panel-orientation-quirks: Add various
 handheld quirks
To: dri-devel@lists.freedesktop.org, Hans de Goede <hansg@kernel.org>,
 dmitry.baryshkov@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, philm@manjaro.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <177187190558.898938.13455497025129229649@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[antheas.dev:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,manjaro.org];
	DMARC_NA(0.00)[antheas.dev];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[antheas.dev:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[lkml@antheas.dev,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antheas.dev:email,antheas.dev:dkim,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3CBD17B9C1
X-Rspamd-Action: no action

Hm,
drm_panel_orientation_quirks might need to have its maintainers entry updated

@Hans/Dmitry: you handled the last merge in this file last march. Can
you advise?

Thanks,
Antheas


On Mon, 16 Feb 2026 at 21:45, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> Same as V1 with an additional four quirks. Also fixed indents on A1 Pro.
> Contains various handhelds. If we can merge this great.
>
> <snip>
> 2.52.0
>
>

