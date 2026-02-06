Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PUTBM5BhmmbLQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:32:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA34102C6B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBCE10E0BE;
	Fri,  6 Feb 2026 19:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="bqCh6XMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E09F10E8F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 19:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770406343; x=1771011143; i=deller@gmx.de;
 bh=fBDKPpnZLdm6N0zONv/JyaELOxYx65IKGM7PLGKChvQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=bqCh6XMRkAl6hHFJUPhe5Dnjxb4JOD1DkQm5dGIHNmeUmuwuvc70pVjZSYSMgfzc
 erm92tMFSk2HsYY1O2t8sS/yiYDNaQN3giAdWslxcPlprrX4DixYnT8LGCAZVvMiV
 Mfs8zg8WyE5d7pOsqxUYU3GglpPmZ6488PToXeyE9aFFIRj445PR5sewbQiYqnFUR
 emr591TZcaVDbG5oajO3QEsJ9CnfyJFigoIH3YEVPYvISuoVEaWgcik2a7lp1i4CV
 m5BvvTW8Ud85P0ALp6bIPoU1HS07KzBVu4mbP9y1YjHug9RxMWMbDrBKBrTCddn0y
 +4AHyNX1ID1Vh37SXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.105]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdeX-1w0sAl325F-001zME; Fri, 06
 Feb 2026 20:32:22 +0100
Message-ID: <3439df9e-5f29-4628-9e5f-dddbce0831f9@gmx.de>
Date: Fri, 6 Feb 2026 20:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe()
To: Felix Gu <ustc.gu@gmail.com>, Zhang Shurong <zhang_shurong@foxmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260203-au1200fb-v1-1-7889c4061337@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260203-au1200fb-v1-1-7889c4061337@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IqUjaAqEh+f/P7Ae5cr2RT+wi7//bjmEB0agaxn0XDpdyd2o6OD
 q01ETLgNFLv1WqhrzmgT2ETPC+uZuJVSXR0mLeClXRaq0x1wxYKKv1iFpspv8orSk+ZtS81
 tdjhfN3on0NyyFIOuup9MS/lj5RybnmSlVggwTs1aHu2EbYYhmZm7v36Q0QkZrdXBxiO/kq
 Pu94MKeOTL6sfUp7UuXIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tFC+HcwqXIQ=;pacW/HtR1BSr3CHBpDQ2ZqiIvQC
 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
 vTOwa+TSsG9zNWiGd1jzbO5nRVBJZH3RZKqUQj
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
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:zhang_shurong@foxmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[gmail.com,foxmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.973];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 4FA34102C6B
X-Rspamd-Action: no action

On 2/3/26 13:14, Felix Gu wrote:
> In au1200fb_drv_probe(), when platform_get_irq fails(), it directly
> returns from the function with an error code, which causes a memory
> leak.
>=20
> Replace it with a goto label to ensure proper cleanup.
>=20
> Fixes: 4e88761f5f8c ("fbdev: au1200fb: Fix missing IRQ check in au1200fb=
_drv_probe")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>   drivers/video/fbdev/au1200fb.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

applied.

Thanks!
Helge
