Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHiMGAYOe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:36:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4DCACC86
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE0010E7F8;
	Thu, 29 Jan 2026 07:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="kOyMo8k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AF810E7F8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769672186; x=1770276986; i=markus.elfring@web.de;
 bh=Qq0z9q6Y+KQxDVHEcH1ZFQ9K0x+kjnxlPiluywqssgE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kOyMo8k8T1Ksg/V8qR2k0VwXFV2GO13oKMGOorLmK6WDdy2NM0i7OR9Xj/WkhETT
 PmU+WNZwppFADGPFbFTiW5+iDzxl8CI0SVlgdnFN1urFkeN6R48pkCz/AM4Gj19uW
 COQiaQFcEd8OxWyOVIVlcWBBIvIK9W5FB1vmhY+M2i9P1x7MkOstswMhf5pm6AKJ8
 YKWOTVKNN6qs0bufSrx+MTHUp7CAf3EYnOKJhXdTsGH0ormW7EbqUijfge0QGKg4G
 qbgrhT/XiFQ6E2sb8yayX7bihqgWRcOT1JBQsFRRerydGoSXtPPa8adaAjl9N6xn5
 jXepmHjr1I+q0YIglw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.239]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MadzU-1wHwR62Kx0-00l5tg; Thu, 29
 Jan 2026 08:36:26 +0100
Message-ID: <d19fc825-514c-4ab4-b853-6a12a7517479@web.de>
Date: Thu, 29 Jan 2026 08:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: au1100fb: Check return value of clk_enable() in
 .resume()
To: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <zytpnyodschvn4mmpllxp62yg3o77hjl7l5nyckoxyuvucjyaj@xsxbybnyzd44>
 <20260129040714.2772522-1-nichen@iscas.ac.cn>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260129040714.2772522-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KwpxARyH4lajqCnAhtubBhmdGLq0cOhC8ZdCRMBwfSt7gTZIL6G
 rCyUz3BjCicKwjPr990zDihFPXnE5gyulndu9Ybxlc+L94xSRTSX9/fusic5wk3xcg5QPdy
 +wHmq93iu25ruargVhhnltDWGE1RdPr6Xe1V2MGY7IRqx/6tHeNX1HQtXb3TTphlNdxPaDI
 8INoQ2JTxk+tyEK7j6z1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KGSu42DuMbg=;wPODFH0mkx+dutXdVW7nZYvyMgt
 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
 Lh/axCj961fbz20lUGEZ
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
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:deller@gmx.de,m:u.kleine-koenig@baylibre.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmx.de,baylibre.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9B4DCACC86
X-Rspamd-Action: no action

> Check the return value of clk_enable() in au1100fb_drv_resume() and
> return the error on failure.

Were any source code analysis tools involved here?


> This ensures the system is aware of the resume failure and can track

Ensure?


> its state accurately.

Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=
=80=9CCc=E2=80=9D) accordingly?

Regards,
Markus
