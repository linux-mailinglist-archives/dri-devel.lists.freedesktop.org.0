Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFbzKPEfnmm6TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:02:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF518CFFF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0B10E16B;
	Tue, 24 Feb 2026 22:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SeSUArlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085AE10E16B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1771970533; x=1772575333; i=deller@gmx.de;
 bh=wsIM0V9Llkls+u2poSDEcQrPgizoX0eT/1cbKkIgnXw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SeSUArlNgnkKjQiq2nSQQIVmp1bV3kOUrdC2y3vV97uhVUsGun6Rsa1e6ylACM2o
 CgbRdI/9mz6X0t7zIyQms6UWlDhKOp36XpWvJ4p6pVC4UJToxpJAXwCWP0ll38wrF
 yqZlANrQoFsFAhpTLeLQnOPMQP22UkpPcfOLcrqx3YqMwRIfqY4We2ndMrWBMvgfQ
 n8Z/jfInvqQ47IZ9Oi0auQ5LjmMhDFpD313i7n0dFl6zFMuVU/vz9bknsghtt9dwm
 SV4ktw8c8LIhOUVStv6LO/ALAayeqhSeRUDsopfgRu4C4T04db4H4ta6j3rLi+buR
 Dt3LNqWufKrSNivY/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnaof-1vTwv33V5B-00e4iI; Tue, 24
 Feb 2026 23:02:12 +0100
Message-ID: <84fa9c54-c596-43d6-9ea3-18c668f877e8@gmx.de>
Date: Tue, 24 Feb 2026 23:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] fbdev: defio: Protect against device/module removal
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260224082657.207284-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260224082657.207284-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XOzP63V8eXVQTLYxPgRNbe4h7Nxrb7dHDtMx+jbu18UJLtUAiUe
 RIhBmxnPUMosBn+dKobs7/Jv57V+HAo/wm9Q09YVIxVWg29zqNuLJahjwcKvfUJd0eWU02Q
 rIT8XdE5lU/8GlcXsvGkZdSGEvePioHBMZDedEy4h2x4bJVGlS2oieBNd74EQNwxFs0/8B4
 6YsfLb25P8tEoI4b49fyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mSYJjzubWrE=;+M+nPWp6wMNuO+bEpErsEpk/KBy
 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
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
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:simona@ffwll.ch,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 11CF518CFFF
X-Rspamd-Action: no action

On 2/24/26 09:25, Thomas Zimmermann wrote:
> There's a long-standing bug in defio where the framebuffer device or
> module gets removed while mmap'ed areas of the framebuffer memory
> persists in userspace. Page faults in the area then operate on defined
> state.
>=20
> Patches 1 and 2 fix these problems. Patches 3 and 4 build upon the fix
> and put defio state into the correct places.
>=20
> v2:
> - use alloc_obj() functions
>=20
> Thomas Zimmermann (4):
>    fbdev: defio: Disconnect deferred I/O from the lifetime of struct
>      fb_info
>    fbdev: defio: Keep module reference from VMAs
>    fbdev: defio: Move variable state into struct fb_deferred_io_state
>    fbdev: defio: Move pageref array to struct fb_deferred_io_state
>=20
>   drivers/video/fbdev/core/fb_defio.c | 266 ++++++++++++++++++++--------
>   include/linux/fb.h                  |   9 +-
>   2 files changed, 195 insertions(+), 80 deletions(-)

Series added to fbdev git tree for further testing.

Thanks!
Helge
