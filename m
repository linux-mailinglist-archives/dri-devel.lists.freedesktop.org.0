Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH9tIDfzeGmGuAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:17:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E5985D9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 18:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7CE10E0DB;
	Tue, 27 Jan 2026 17:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="oN9+5PAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF89710E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769534251; x=1770139051; i=deller@gmx.de;
 bh=dUFu0bjaPKlZSxtueJt9kbaCf2cWUgl7ip+eBYu1L8E=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oN9+5PAnwbbq4Y+NHKEkO7HtNEpiWDb1x1ig0GAa6X00j4615O/786YyXQZVo9Xh
 zC3bygkiEfxwYDRWHOaQ6CNCN8W6K8uerKXiyt3wHJlX84ipo+7RRXQfk411cGp+y
 l2Jh30vRoLLtpdXoc8TYRmcMHyC0IFTjcbylGhDsHRU5SVS8xrOQbmycqt9gAO1Fp
 e+PctiLUmKCQ43HfgI15PXCaBXdXrDIGX0K3bOrh0+QRfGrjC7mnoCC/B3gvg7Q0J
 CJLf5XentAnyFgqxwuW+ja8agX5dnByMvzhzOakWL9wYXaiSMs78pCkEPqn4I+dDc
 +HlQv1Gd1ptl8MabpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.214]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf0K-1wBYin1on4-00lzVa; Tue, 27
 Jan 2026 18:17:31 +0100
Message-ID: <2f7c934d-1581-495f-9b04-cb5d138d72c4@gmx.de>
Date: Tue, 27 Jan 2026 18:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: vt8500lcdfb: fix missing dma_free_coherent()
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260112140031.63594-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20260112140031.63594-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vtAnENc4twLiTvkaYnRRdWo5lV6c9ccOIeWMuiphm41cv95+pUO
 qmwIqE4MBfiNSoJZX+7WEmGQ5dtU/l+FI/sBLFOp1RKZ7z5cfdtpgxs92kX6iwl2wWUCTV6
 8FEVo4W9o7/HcQ4ldRnfsZsZJONVvPIHDl9UMe1efp5ZhFeeJE7P4105GaVJauUTulJyvr4
 2n8Boy+qeYVqYFq9AvDxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FHA3kzx37TU=;s3ImftkJZtre52odBCEDVeJm/gY
 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
 mlWLW/TqJGU0qbGvviZ4zbXCHzcxS
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
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CA8E5985D9
X-Rspamd-Action: no action

On 1/12/26 15:00, Thomas Fourier wrote:
> fbi->fb.screen_buffer is alloced with dma_free_coherent() but is not

I've corrected this to "dma_alloc_coherent()", as pointed out by Mr. Elfri=
ng,
and applied it to the fbdev tree.

Thanks!
Helge

> freed if the error path is reached.
>=20
> Fixes: e7b995371fe1 ("video: vt8500: Add devicetree support for vt8500-f=
b and wm8505-fb")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   drivers/video/fbdev/vt8500lcdfb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
