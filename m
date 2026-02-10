Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J2rLmNgi2nDUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:44:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230D11D615
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3A10E171;
	Tue, 10 Feb 2026 16:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OZJ2NYgI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1BD10E199
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 16:44:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 374EC4E40BFD;
 Tue, 10 Feb 2026 16:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A7BF606BD;
 Tue, 10 Feb 2026 16:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B180110B92194; Tue, 10 Feb 2026 17:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770741852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dvWAiUmUqdvrwIISRVVWBc/NwX8UVWG/UganV5L1Z7Y=;
 b=OZJ2NYgIgsgLsuxpbTMLdxhUzS4xFSSPlxQrhYQ2Fapv6Q/q+XaVPzA1alA+eqKUzEbk5g
 +d53jlR9W6mhGFd2nL6CpQi23RLN7cYtLmoBUaPyyj1J2KIqgO3REGVhKoYVHTIK6yiqx6
 TT04iBPyGQo2JCT8alvj9YwTyEgl2fyb0EZwT3eQGeiJ8PHVo7S3LozZQZm4byjdhRsG7B
 S6wh3cbI2i0vBnB1bAD3ZyCBR00AGDuMUXcmUXC2crHDYUpaaghwma1ugPvvfrbb7U4Sw0
 MQ7F5gF2FJueTHkEf1x3HHaFZA0ZnqEa17Xub5HaEwpYJlqrX45/YmKz7HAO0A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Paul Kocialkowski <paulk@sys-base.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
References: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
Subject: Re: [PATCH] drm/logicvc: Fix device node reference leak in
 logicvc_drm_config_parse()
Message-Id: <177074184937.1059409.9072544102582199349.b4-ty@bootlin.com>
Date: Tue, 10 Feb 2026 17:44:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:ustc.gu@gmail.com,m:paul.kocialkowski@bootlin.com,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[sys-base.io,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 4230D11D615
X-Rspamd-Action: no action


On Fri, 30 Jan 2026 00:21:19 +0800, Felix Gu wrote:
> The logicvc_drm_config_parse() function calls of_get_child_by_name() to
> find the "layers" node but fails to release the reference, leading to a
> device node reference leak.
> 
> Fix this by using the __free(device_node) cleanup attribute to automatic
> release the reference when the variable goes out of scope.
> 
> [...]

Applied, thanks!

[1/1] drm/logicvc: Fix device node reference leak in logicvc_drm_config_parse()
      commit: fef0e649f8b42bdffe4a916dd46e1b1e9ad2f207

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

