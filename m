Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGIFGPkclGn0/wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:47:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27E1494B4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7864D10E107;
	Tue, 17 Feb 2026 07:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VmW8SglM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7518410E107
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:47:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D8E6660133
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E301C19421
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771314420;
 bh=dxnGa/cVc8wiz3CAx5xyZwQLQ3WeJqp8d7JK62vveYc=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=VmW8SglM+nLULxuqktoFTPGxWAF+Sl6D0VixW4NVolzSyYSmZ512sppxaA7VdjBKW
 +FcjNrjTRPO3MILfzYeYORBbp8vdBRlIJecGPR7duKqOcNnE6BaXWe971Xd1Si5exs
 P7bKbd0zFfQXol6OapQFLDY6aQnyLDBd8Qqtvng09cua4lgRlihG2hX0pg1z+ZFjOz
 HCj3Ql+rTGMze+fkXp28GyN7fgOH5baBLa5IwPqXo2RRudS1P5hjMjgvDGiX8rDjq/
 VMyYy4QK0YbkzqDglil4TiTXCQMS9rZwhuDOTgyQ47dsCnhq8coopi98NZpWp/iwWL
 tUOCaUbfvJXOw==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59e6491f1a2so4105551e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 23:47:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqnkVJ91m50UZ4mOCgBlIcvK+PBhdJq514KCyqtT0hUI7jCQzoQz1ttV5LVqJ8sEJt99vdDcSyYbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzARWPAbql69file623sl5l//CBp59CxCQtimQl1cq/ysVyL9ua
 C+uLiejG0KdVOcy2fUWo1Fa2xUdlI7ykpZQyLXM8tZERta4dzQ62WqZKOD77iAMfmcC4ozb+paC
 wKbeRVWd0Ig3eK6fVMWnZgpA9OdhvG5I=
X-Received: by 2002:a05:6512:b10:b0:59e:4a2f:9911 with SMTP id
 2adb3069b0e04-59f6cfe394amr3433880e87.23.1771314418957; Mon, 16 Feb 2026
 23:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20260217063647.3160826-1-wens@kernel.org>
 <20260217063647.3160826-3-wens@kernel.org>
In-Reply-To: <20260217063647.3160826-3-wens@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Feb 2026 15:46:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v65VfqySctgx0XZOA0UN+FOwwXw9ubCXmy-VNy4ouLNspQ@mail.gmail.com>
X-Gm-Features: AaiRm53C01_zHKmVcItSQPEtYM86NeiYnzpVZ7IGrq00V0FaA2dulzpxY63wYBg
Message-ID: <CAGb2v65VfqySctgx0XZOA0UN+FOwwXw9ubCXmy-VNy4ouLNspQ@mail.gmail.com>
Subject: Re: [RFT PATCH 2/2] drm/panel: sitronix-st7789v: Convert to mipi_dbi
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Archit Anant <architanant5@gmail.com>, dri-devel@lists.freedesktop.org, 
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DE27E1494B4
X-Rspamd-Action: no action

Please ignore this version. This had a change that was half squashed in.

On Tue, Feb 17, 2026 at 2:37=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> The wire protocol of the ST7789V is basically MIPI DBI. Switch to the
> mipi_dbi helpers to reduce some code. This also ends up adding support
> for 8-bit D/C mode. The reset logic in the mipi_dbi helpers is also
> used.
>
> While at it, also clean up st7789v_check_id() to use ST7789V_IDS_SIZE
> to declare the ids array size and sizeof(ids) where the size is
> needed.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
