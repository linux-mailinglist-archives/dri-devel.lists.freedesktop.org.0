Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PNSDBKmjWnu5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:06:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B095F12C3D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1BB10E717;
	Thu, 12 Feb 2026 10:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="ociVI7so";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [178.154.239.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B993810E717
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:06:06 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id D48C7C00A5;
 Thu, 12 Feb 2026 13:06:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id d5RU869G5W20-aR99l8st; 
 Thu, 12 Feb 2026 13:06:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1770890764;
 bh=Q1Uxz3qdI5DYZbxwCOrlky4H0PgOY4+4wHp6bfHqcIw=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=ociVI7so0a3pU/ge/sfVnrryfnx+jx6+RqUb7BMsBdaa+jfRE9V5nRJnXJpcoo8Wu
 +YIzem3Kl7YA1kftoza01RXgvGPz+UBUKpGjcRM93IMuDxCEIZaYkG9NLM6vLmOfyX
 wx2o3+UYAZ5rfr6V1G/pgAss8Dfplez3bD8xiDqk=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] drm/tyr: make SRAM supply optional like panthor
Date: Thu, 12 Feb 2026 13:05:37 +0300
Message-ID: <20260212100538.170445-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,m:work@onurozkan.dev,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,onurozkan.dev:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onurozkan.dev:mid,onurozkan.dev:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B095F12C3D2
X-Rspamd-Action: no action

Changes in v2:
- Add rust_helper_regulator_get_optional() to fix CONFIG_REGULATOR=n
  builds where `regulator_get_optional()` may be only a static inline.
- Update Regulator invariants documentation to mention both regulator_get()
  and regulator_get_optional().

Onur Özkan (1):
  drm/tyr: make SRAM supply optional like panthor

 drivers/gpu/drm/tyr/driver.rs |  5 ++--
 rust/helpers/regulator.c      |  5 ++++
 rust/kernel/regulator.rs      | 45 +++++++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 4 deletions(-)

-- 
2.51.2
