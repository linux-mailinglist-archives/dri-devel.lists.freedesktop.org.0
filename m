Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFzrJyUvmmnPZQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 23:18:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281916E171
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 23:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4EF10E09B;
	Sat, 21 Feb 2026 22:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="b+rmIAzO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DD910E09B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=5G8JRjlxGCNVPL20NU83Vmnd/Rd61iQlcigmotfGCwc=; b=b+rmIAzOZjJYW0fhqCHdeknoHm
 NR8sefHy6NWRf8AJ9dNhp3Wl6Pv1sXllbPAhxNZqV45idrcA717eyxxf4hwbdykzR9NP/192Y6CzG
 SKaMSW6MTNMTzAiV/KxR2R/hvvS2BfAbYoL43BgJgDgG+Aa2mTxX4Kb2sHKOvyzrdBUzSThiMF5/o
 587tOcqNS4ejmT6jnMeGmlZiRoSH9LDN6KpFvjrEnIxpzbeY8YMbevX+KX31L/c+6u0/BhgmmTWsv
 r2kVajQAe6r00V//xE6hndmZ8mHc0iYNQPNyFSlKvqxleMvTVHn9ZgLPih7vMU3CgcRekJS6Rqr6+
 fU8p518g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Hsieh Hung-En <hungen3108@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/rockchip: vop2: Use drm_err_ratelimited() for wait
 timeouts
Date: Sat, 21 Feb 2026 23:17:57 +0100
Message-ID: <177171224753.1745786.18151725646832759281.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260209161621.6136-1-hungen3108@gmail.com>
References: <20260209161621.6136-1-hungen3108@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:hungen3108@gmail.com,m:heiko@sntech.de,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[rock-chips.com,gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[sntech.de,lists.freedesktop.org,lists.infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sntech.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sntech.de:mid,sntech.de:dkim,sntech.de:email]
X-Rspamd-Queue-Id: 1281916E171
X-Rspamd-Action: no action


On Tue, 10 Feb 2026 00:16:21 +0800, Hsieh Hung-En wrote:
> Replace deprecated DRM_DEV_ERROR() with drm_err_ratelimited() in the VOP2
> register wait timeout paths to align with current DRM logging helpers and
> avoid flooding the kernel log when timeouts repeat.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Use drm_err_ratelimited() for wait timeouts
      commit: f33a0a7f902d0715c1c09d7a128b1c94c09fcfc1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
