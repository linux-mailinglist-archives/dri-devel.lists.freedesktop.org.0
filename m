Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAgkI7CDeGmqqgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:21:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3326919E1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F223410E02E;
	Tue, 27 Jan 2026 09:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="sdYV5R37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8252510E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769505689; x=1770110489; i=markus.elfring@web.de;
 bh=c3y0lEsQSa3NxVnQjnb+gUVusQedR1yDzUFCgD6dyo0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sdYV5R37X3+YdKN7vfU2N7GcxL2l3ffXVv0cYDeSH5KHJA3KA1u2czbFvQ/xbdRc
 LGr1T4hj6qEgl8f6Ytji/e9IVjAXemihvQX9mBF0by8+08RBus1k9DFBibFHYYHjO
 j8I97gxSpnBag5mrGrXmNTwwgVRPey0eY5LeQW718dF+OpERJCr1DFjZY/fEWP3sf
 rnWuOQWKHa7yZLpC5LDNGn/DpwuZwxeUS3krgV4eGHzIJrS5aQi0ExdqsVB+no6yy
 cz0PYuCrdt4B2O1Vfer/tZ6lx4NShhkfi6HjulVwbE1x8ff5qYyxQiTM8bUITH+CY
 HMrY50tq7nqeH+46sw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.251]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkEhH-1w92f2282T-00baAK; Tue, 27
 Jan 2026 10:21:29 +0100
Message-ID: <2f36c79a-093b-4b68-836a-79949f69e0a6@web.de>
Date: Tue, 27 Jan 2026 10:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zilin Guan <zilin@seu.edu.cn>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Jianhao Xu <jianhao.xu@seu.edu.cn>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20260126123248.164621-1-zilin@seu.edu.cn>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_channel_ctor()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260126123248.164621-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DOpCXLmUWVxrJLrLMiGJcG1e+vezkn+c7eiXtsNxOVDS64IZ+Df
 ZKhMAK8jiUgV1Q82Nu9qdXZev2/ycscrwiX+/q1ikNj1ml2NrYhfA72AC007udNfoCRPxgq
 bkOT0gtJaifp437JeTHwprA8BSBcZ1+dxnS96KVuTDcwxj9cIpddI4PG+R58YqNGgF6OYxA
 fG5ykxpIQYtd5b6km5uLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fj/qCagYp9M=;2Hk1Pa0opFr5eSwfjaiaaN2WZY+
 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
 m+ej32usDufQo3VKyGJXTLndaD1PY
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zilin@seu.edu.cn,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bskeggs@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:jianhao.xu@seu.edu.cn,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,gmail.com,seu.edu.cn,linux.intel.com,ffwll.ch,suse.de];
	FREEMAIL_FROM(0.00)[web.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E3326919E1
X-Rspamd-Action: no action

=E2=80=A6
> Add nouveau_channel_del() to the error path to ensure the allocated
> channel is properly freed.
=E2=80=A6

https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/gpu/drm/nouveau/=
nouveau_chan.c#L247-L351

* Would you like to complete the exception handling by using another goto =
chain?

* How do you think about to increase the application of scope-based resour=
ce management?


See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv6.19-rc7#n34

Regards,
Markus
