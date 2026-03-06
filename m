Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNvvH4bGqmnVWwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:20:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB82206F5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A33110E21D;
	Fri,  6 Mar 2026 12:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GAP2vNuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A6210E21D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:20:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0DAA60018;
 Fri,  6 Mar 2026 12:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F6DC4CEF7;
 Fri,  6 Mar 2026 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772799617;
 bh=eQ1zNeqiAjFDxjrPGD92P1W0AAqfR5sLEOVZ3IlTQ/U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GAP2vNuRnWQrrUKmXvGx/Q3s/kVH5aUX/amIVtquc+a/GfCKdDqwBNGZFqX2yEMlF
 DZ3gMoGAFW9FUYj9xNam0sBjZmfErZqOmEVbRYSR5UuoNVUEzc4v/ceB7ZYrxw9Bgs
 vprXV8JWHoQvAgRPdwbmifR35yAbtLIP+hf4dUarrrYWPzGn0P1zP7f6jVdAAsa9li
 Bec7kyhIYHhu0UXSPuG5t+jDHytCgbnVOECDqy4+pFmGRet0MFKwTrYCZFkjdAwDwl
 ebCwNx77r77MJF365ibQIOyqrGLAqDTKeAmfyFY7RiyGahGX9HEFlUVkV0SyaeW9A1
 VSOH7yzZLOENg==
From: Lee Jones <lee@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, lee@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
In-Reply-To: <20260223101920.284697-2-manikandan.m@microchip.com>
References: <20260223101920.284697-2-manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v3 1/4] mfd: atmel-hlcdc: fetch LVDS PLL clock
 for LVDS display
Message-Id: <177279961448.979425.2188993103584319.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 12:20:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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
X-Rspamd-Queue-Id: 0EDB82206F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:lee@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:manikandan.m@microchip.com,m:dharma.b@microchip.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,microchip.com,bootlin.com,tuxon.dev,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 15:49:17 +0530, Manikandan Muralidharan wrote:
> The XLCDC IP supports parallel RGB, MIPI DSI and LVDS Display.
> The LCD Generic clock (sys_clk) is used for Parallel RGB and MIPI
> displays, while the LVDS PLL clock (lvds_pll_clk) is used for LVDS
> displays.Since both the clocks cannot co-exist together in the DT
> for a given display, this patch tries sys_clk first (RGB/MIPI),
> fallback to lvds_pll_clk (LVDS).
> 
> [...]

Applied, thanks!

[1/4] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
      commit: bd7b76604b3b218d0b5a32bcfaaed9eb4cc0ddb2

--
Lee Jones [李琼斯]

