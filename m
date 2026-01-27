Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBqXHXokeWnmvgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:47:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5499A764
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05210E0F3;
	Tue, 27 Jan 2026 20:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="rO0190xC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B6610E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769546850; x=1770151650; i=deller@gmx.de;
 bh=0zwSVBDCJgt0yAfqw5hBAEWxkJxHLlEFcL+4OR0J1Yk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rO0190xCNOMt6azoPbrjuPwiriu4H49EyDHAjzRUYTzHxkFPq0tj4P0YXndxNshp
 QHLkk0OD2kACzBf7cGZqfJFtIFUqEqp9S/p0YFibSuLXXIBhz21aJWUrWziGDRI8a
 BtFwNTfULyBSr2gmXTkdAPuQ+mfdlPRhm0wPG1NL1FV3zJEqDZZ8p+S+6SA98GKKL
 yDRwvypP1xwRJSKoM1dPXo7Jh+jogLUT3lQ1kXl1wprQedYCI+RVe75mgjN4RAEhM
 766OXoiNl9A7VTon7lwc/QZr22tqeWaZihmXmtlE4Evm7xuOhx0lJ+e9ZrqBLe8Sy
 eHHdAnfK4TPzMpJ/Gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.214]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXhA-1vPTbX3eaI-00Ojd3; Tue, 27
 Jan 2026 21:47:29 +0100
Message-ID: <bb9e6a16-f718-49c7-bf7d-32eb9a87ecc2@gmx.de>
Date: Tue, 27 Jan 2026 21:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: fix fb_pad_unaligned_buffer mask
To: Osama Abdelkader <osama.abdelkader@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Murad Masimov <m.masimov@mt-integration.ru>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Quanmin Yan <yanquanmin1@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260127193101.12343-1-osama.abdelkader@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260127193101.12343-1-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Kvw0SDMRGLtGkNmrMOpy1hOi39dp2dxekxl3Dt/UKEta46/yQ2E
 r4klE3MLP6i16JOD6fZLgH4+cuHuJaYQAiTPqC1rYFiYpwod9JkBPvLnUvfipVlzjViBFv3
 ccw7txOd10DjhdYTlKqlvetAXjUohhlgt036dyvg59gm4RIdfptyFLP88jT1B9ES+V4YcU9
 MSDTVTUqqCtcig27ETw6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XDkRH/0cjzw=;TqAgC5FrIzMHeb/HuR7h6skq1AW
 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
 YH0ZyQHH+uQ0kuHTdP4d+GHreqUzVA60DEjRGi
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
	FORGED_RECIPIENTS(0.00)[m:osama.abdelkader@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:lee@kernel.org,m:m.masimov@mt-integration.ru,m:zhangyongzhen@kylinos.cn,m:yanquanmin1@huawei.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,suse.de,kernel.org,mt-integration.ru,kylinos.cn,huawei.com,vger.kernel.org,lists.freedesktop.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DC5499A764
X-Rspamd-Action: no action

On 1/27/26 20:30, Osama Abdelkader wrote:
> mask is u8, so it should use 0xff instead of 0xfff
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>   drivers/video/fbdev/core/fbmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
