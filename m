Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Dl5FL/2eGnYuAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:32:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89F987A7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8259510E0D8;
	Tue, 27 Jan 2026 17:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="qdEzst3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF2810E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 17:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769535156; x=1770139956; i=deller@gmx.de;
 bh=cDa+YjTEwTlkpFQTbDojhTZGYqixXgWan0tbg4m2Yfg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qdEzst3rBEU3ESjbZGM4BrZSk/BSp0j6QtjIRSLJnlvVtcUyPhF7SclhL3oyrplD
 e+vMNeW1QgI/oeLr/x0jI0gPbbBaer2raeiR/gEU/wrMFuwUqLsv649MzR9BgEDO3
 /dd1KQQc3UYlE45OTDjyQ2spCE0BhztztEp12UymvO1W4uIWXMeNtOBQDRB6OsYUE
 r0q6U/JA5qUzGTuFuYpP9gndrRRbtgTQCrMXqEvsjMTetwuUXvWvNikNCtzZ7UN9U
 j5kVVw2pq+DBcc9fsNAGX4gp50PKYUP0i/MrWxRCQX6EvMYehQum37daT1rCNAY+/
 pFpfZyGlXvq8DAjuFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.214]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1va2Ty44c5-009USV; Tue, 27
 Jan 2026 18:32:36 +0100
Message-ID: <dc2ce712-0f9c-4b85-9b50-910eeb5a302e@gmx.de>
Date: Tue, 27 Jan 2026 18:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: of_display_timing: fix refcount leak in
 of_get_display_timings()
To: Weigang He <geoffreyhe2@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260116095751.177055-1-geoffreyhe2@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260116095751.177055-1-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:19Diw4imBS4UaZspXltn4Tb8j2BMt4joNl1MdSkGJQwNsHQs1nV
 TSr9yzKyPgz+juzJqtH18Hk8rr5dnXHwf5pFFJ/D3q1gQuVbT1EA2MqZSDyp2Uy3mJGT1de
 pxKeo0ETqDsLUBn6YWKKps2C0rOMgsAaVKhyrq9l+RD+0Ad+h/tNFAZD7pAo5UaL4Y5iqZh
 4Dso+KjfsDnRocC2S2UaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BmuVk4zc3i8=;Hh4r4hMTDj3+q7po/gav5QQv38B
 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
 ECuKPr8r3EJuK6W1ntqZ7XW/9ormB
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
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:geoffreyhe2@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: AD89F987A7
X-Rspamd-Action: no action

On 1/16/26 10:57, Weigang He wrote:
> of_parse_phandle() returns a device_node with refcount incremented,
> which is stored in 'entry' and then copied to 'native_mode'. When the
> error paths at lines 184 or 192 jump to 'entryfail', native_mode's
> refcount is not decremented, causing a refcount leak.
>=20
> Fix this by changing the goto target from 'entryfail' to 'timingfail',
> which properly calls of_node_put(native_mode) before cleanup.
>=20
> Fixes: cc3f414cf2e4 ("video: add of helper for display timings/videomode=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
> ---
>   drivers/video/of_display_timing.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

applied.

Thanks!
Helge
