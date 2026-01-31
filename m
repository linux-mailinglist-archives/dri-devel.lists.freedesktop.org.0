Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH6ZI6OpfWlZTAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 08:05:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9179C10BD
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 08:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77B310E073;
	Sat, 31 Jan 2026 07:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="RqA/FVPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD8210E073
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769843081; x=1770447881; i=markus.elfring@web.de;
 bh=NIEAUU8SeEk2CZOb8g5UjwRfOlHRqH9z7nfaKhNkG5A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RqA/FVPWF3Rbgp0wXi3TEOq5k10RPc8QzzC75PLdLBf+0a0vm6+gSgrihcL8rxhA
 4+ScaMXTPEx7qS3Wlz732xdQ4w0lrzGt6fa6Eu1kpy3dJVfEBsAq2wn/ebdvTsqqU
 7Q8+Lkb0I5zPlXsxxdQVUyT9vGJVJ4cS4eVnstDhInO5Nn90y37XVTeSikBvw43Jj
 qJkoRWqpV0fzcPJ0E2KK7hBQlMVkNGSXg3tLBqMm6v6nMCOEiK/F1qurh3quog/Me
 7G+nJALYF/gAGp60JSnsxvl+0HsZEXW8YQ0SIQeXqMLYiVmz2RH0XndiPZjpSLdcJ
 RcuyVyuTXCk1P8Kdew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.223]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX1L-1wAw0K2IMP-00aT90; Sat, 31
 Jan 2026 08:04:41 +0100
Message-ID: <7bfb2092-27da-4368-b95c-a57c11127651@web.de>
Date: Sat, 31 Jan 2026 08:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Alex Lanzano <lanzano.alex@gmail.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260130092300.3426214-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/sharp-memory: Fix IS_ERR() vs NULL check in
 sharp_memory_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260130092300.3426214-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qCkVfmDKI++ktVYnnJ6k6RQkBTvDt044yMLU/xetwA42ZIYhHCv
 Z1wEk6XWTFjWB7d8yrBZnKBqKCS+4VnpOSErG/7UvUMkMuVI8zbRVxiSCUiBPK22Raw9RuL
 66/TtN24t73H3WU2eb3+HhiGA8L7EmDbIBt/wJoS+WL9x/9tf0B48SpZ4nesxGBb/LOsz+6
 VjCS8/1lv67jGxmuvMoLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GhUM8c+R+Gs=;5zGwy21IyewmAKTrGHFmYocqMXX
 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
 7llzbwQwz/fVmqWfqc7FM/eMlXIFsuF84wV1PG
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
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:lanzano.alex@gmail.com,m:airlied@gmail.com,m:lumag@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mehdi.djait@bootlin.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:u.kleine-koenig@baylibre.com,m:linux-kernel@vger.kernel.org,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,lists.freedesktop.org,gmail.com,kernel.org,linux.intel.com,bootlin.com,ffwll.ch,suse.de,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9179C10BD
X-Rspamd-Action: no action

=E2=80=A6
> Replace the NULL check after devm_drm_dev_alloc() with IS_ERR()

May extra error messages be omitted for selected allocation failures?



>                                                                 and add
> a missing IS_ERR() check after devm_gpiod_get_optional(). On error,
> return the error code from the probe function to ensure proper failure
> handling rather than proceeding with invalid pointers.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
