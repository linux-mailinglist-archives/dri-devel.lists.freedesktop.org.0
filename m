Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB9AA96poWm1vQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:27:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC01B8E9C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBA110E190;
	Fri, 27 Feb 2026 14:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ajUsfK8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91C510E190
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772202443; x=1772807243; i=deller@gmx.de;
 bh=ppYpUW9x245p6pLgUAkdStSDektLMN1P3lO882Cym6Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ajUsfK8RgwzLS2TvZygI9bEbwBvsv73CzOo5naAeXzMDWbIXDLnujZb+WomKFzMt
 dFakRCnP/kdY85Al/mhNxvy6NU/bvvNlIBgwQyuAlIt2iNcQ5Q0lUSRDHjMFI6QDf
 /WZsmW7eN1q51sXv8pU4z08EZ2CY/mmZpkz9JgCXkdXl3HGzDSKMVm6LL/ZHC1SK9
 7/dKE4oCtaEAXJKsus7uz+OdQp9JbkSPR7KGLSEBGXXqQpjLgAIvnzniwN8TRpYsw
 aYL+F73QZSbb/hcruolskKIgzzv37WBLT9dpIUsooDzOEhxABr9Uj1/IZa2g5Hc48
 1Nl3Td04zpW74WKWRw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1vzH8B2bhU-00FQNT; Fri, 27
 Feb 2026 15:27:23 +0100
Message-ID: <252a732a-67b8-44ed-a198-08f95c2d3be4@gmx.de>
Date: Fri, 27 Feb 2026 15:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/tdfxfb: Make the VGA register initialisation a bit
 more obvious
To: Daniel Palmer <daniel@thingy.jp>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227122500.3885069-1-daniel@thingy.jp>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260227122500.3885069-1-daniel@thingy.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LusU8ZqXNS0flt7sEvqywI8bIORI1IqscgBo1lAQAhmb5h7qTev
 zzd10EwuA9OsI6cdxToHv9EWi/3xrDCG/OhsdGKJZj9HYAiWTnKEwyMhBk1Rt1DvNocxDWL
 TPnNp8pjY/vn9H0xAhiTslOzKAwzvCInLtMJ/6CYN0R2mpO6LoMD3whD//jU6Xo/JhfXtGA
 teAYOm/+5vuLco0expOZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZeJtpWMh/3U=;jUOHiOuCb/3ILhuR3vwguMqxOrg
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
	FORGED_RECIPIENTS(0.00)[m:daniel@thingy.jp,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 75CC01B8E9C
X-Rspamd-Action: no action

On 2/27/26 13:25, Daniel Palmer wrote:
> For a while I was trying to get this working on m68k, for some reason
> the card doesn't display anything if it's own video BIOS didn't run..
>=20
> Anyhow, I spent a long time looking up what each of these offsets
> were to work out what the code is configuring and eventually
> replaced them with the human readable defines in video/vga.h.
>=20
> Functionally there is no change but maybe it makes it a bit easier to
> look at for the next person that finds themselves in here.
>=20
> Tested on a real voodoo 3 on x86_64.
>=20
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>   drivers/video/fbdev/tdfxfb.c | 109 ++++++++++++++++++-----------------
>   1 file changed, 55 insertions(+), 54 deletions(-)

applied to fbdev git tree.

Thanks for the cleanup!
Helge
