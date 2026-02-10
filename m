Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG/+GV/2imkePAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:11:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B20118A16
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E1010E515;
	Tue, 10 Feb 2026 09:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RxOiS5i9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A861C10E515
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:11:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 292B160123;
 Tue, 10 Feb 2026 09:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0FEC19424;
 Tue, 10 Feb 2026 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770714714;
 bh=3cc14LQq6s8l6cJQEbYbcyIgeKXO7CQ2aFt03lzrcJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RxOiS5i9W9pzZilmXJDpuE0qwvX4wCogbbI7HY2vdBDRmGMagAU1swn3cm7RNENNL
 2MHjtmNYQxEWKpgdPWPiI1QuCwdzlwx9m77haH8kQUcxWdT2l+D0TEEJ3n7t3oUtqf
 JsykcGxinFrudMfjWxh4xnK8NET/hXf/3h6dKA/5aSr9PgDz1/2pXStQxgSMqZp+Sv
 F3SSUDDFnmIp8vf2K83l6T5rTwCOh9jzYZnbD/YOibJlI7TRxixu9qZw9NPCLOv1K0
 +ucpxe96rDBHtosdsYfXZSSmdsCu2Z02vw94DaP8PUdDQhglUOcctMlPUl9EmLsWY7
 RPpeDxX/aRn/A==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 linux-mips@vger.kernel.org
Subject: Re: (subset) [PATCH v4 09/15] drm/ingenic: Switch private_obj
 initialization to atomic_create_state
Date: Tue, 10 Feb 2026 10:11:23 +0100
Message-ID: <177071465918.1461206.16066343662695065118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-drm-private-obj-reset-v4-9-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
 <20260128-drm-private-obj-reset-v4-9-90891fa3d3b0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 16B20118A16
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 13:43:53 +0100, Maxime Ripard wrote:
> The ingenic driver relies on two drm_private_objs, that are initialized
> by allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
