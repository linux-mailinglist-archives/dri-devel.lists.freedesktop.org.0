Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDEvATrJhWnAGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:58:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D64FCE4E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317EF10E6EB;
	Fri,  6 Feb 2026 10:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Y0OkD6Tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE0610E6EB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770375476; x=1770980276; i=deller@gmx.de;
 bh=D2/89PNhXZQiNoqohv+99rAcUceHCZUAFM03iY26VQA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y0OkD6TnQM3FzebwUBD/LGm0FeSpIXSeGAOr/EUZpKlE09UT18s5ZWBEmE6JgOw8
 vGgjpg53GaTkda6mRm7fhOvbzSpnPn6pI5ri0W2r5b91GUwCz3cQsH44pG7dKgffp
 NR9IeZkoIrzGHjM3tCneZ9yivAKPuwz1oH2rBZ0Q3S6O51l6Ez+hS+dLheH3MwISL
 HzzHXSRosMgY6+no4Ti5B9vHK/Wl7obCwG+SMhelz4EUGMJ5JBO1etMI2ZD3WXJKB
 At5ukt9dJS8I51i+O5ntCvd+PMk1gVeItsUBuxjPvVM9bwPz+m/P/JUQoHThw0YKr
 6IC2VPle9+wj72v5TQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1vIpyl0tRm-00pAdG; Fri, 06
 Feb 2026 11:52:37 +0100
Message-ID: <827d7def-6db2-4ea6-a185-22535b8af504@gmx.de>
Date: Fri, 6 Feb 2026 11:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: of_display_timing: Fix device node reference leak
 in of_get_display_timings()
To: Felix Gu <ustc.gu@gmail.com>,
 Thierry Reding <thierry.reding@avionic-design.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Warren <swarren@nvidia.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260131-of_display_timging-v1-1-f4f8d9f87c3c@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260131-of_display_timging-v1-1-f4f8d9f87c3c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LVwQXYK2nPDkdjbd/w9isvT7saSIF0BU+E3pGhugmux8s4aTLjS
 02tnsxG4frhix1nRPfSUs7T2JEJ9ArAIuWWIZceDvYRK7CyBsjSMtn5ufKmN8lbtnK6dQzC
 C5slrHNh2TaAWDhddAS6PfvxW/Hbx1OJRlDKuBdnPI8hQr9msSRyUWUVSmgEZubhTSIbjcQ
 hnBuMIXA1a8Ctg9mhgQwQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u1crlnQns/Y=;7Cs3yOt6grVGbuccAgOV73P49mV
 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
 dAh9rcir1zn2UNTNw=
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
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:thierry.reding@avionic-design.de,m:laurent.pinchart@ideasonboard.com,m:p.zabel@pengutronix.de,m:swarren@nvidia.com,m:s.trumtrar@pengutronix.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[gmail.com,avionic-design.de,ideasonboard.com,pengutronix.de,nvidia.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 52D64FCE4E
X-Rspamd-Action: no action

On 1/31/26 13:48, Felix Gu wrote:
> Use for_each_child_of_node_scoped instead of for_each_child_of_node
> to ensure automatic of_node_put on early exit paths, preventing
> device node reference leak.
>=20
> Fixes: cc3f414cf2e4 ("video: add of helper for display timings/videomode=
")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>   drivers/video/of_display_timing.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

applied.
Thanks!
Helge
