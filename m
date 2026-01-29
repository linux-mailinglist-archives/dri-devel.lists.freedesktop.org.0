Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LFlOTYQe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:45:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46276ACE69
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2910E30B;
	Thu, 29 Jan 2026 07:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="PKRLKeW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97C010E30B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769672745; x=1770277545; i=deller@gmx.de;
 bh=R9rw0jE6HeZf150+Jg7tXuiQVu137fykyPZHRyc1u74=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=PKRLKeW+lkPrj2K9aBvO/3rZt4G+xDGFO9Nmn/olNAQ4+3qNCLiWYlMfacwGY0Ki
 U9vQgdbpugq44FofBDJAmN9iYWxG7JAAWSElmrddcW6r5sRXYw3Oas9eg5/SxfCvj
 7VowjY6H0e9OVkr06laes5x3F6CqRoj+7IRODEBqYWOuDQQD7WpOL2KUo/lIBnM0s
 NhrliIP3J1pb0WgLr0q8mcU437FHzTgSrlqS9TB4TAthi2jy42OC3CPpvDIETLTnM
 JYrODWiZaLI7kPPKgYcUdAbFIl4e41CylGMMEOuEbLCJd2EE7/gkMGa/lLu7hoTCY
 TNFGcxvbLFsSyEh9ZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1w6hJ41o3v-00qg1f; Thu, 29
 Jan 2026 08:45:45 +0100
Message-ID: <95895a7e-84c3-42b6-8b5f-91bb04cbc1a1@gmx.de>
Date: Thu, 29 Jan 2026 08:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: au1100fb: Check return value of clk_enable() in
 .resume()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chen Ni <nichen@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, elfring@users.sourceforge.net,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <zytpnyodschvn4mmpllxp62yg3o77hjl7l5nyckoxyuvucjyaj@xsxbybnyzd44>
 <20260129040714.2772522-1-nichen@iscas.ac.cn>
 <u7a7owvizacghl3kpk5zxrf6iurmvvvjnjnzqa43xgafxcmb7x@jsihky4phvko>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <u7a7owvizacghl3kpk5zxrf6iurmvvvjnjnzqa43xgafxcmb7x@jsihky4phvko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:21JGyYJVT0n/yGY53G/J4n4ZTdXasmvjKRUtt1L6YgRIPGPoGoN
 Q3a+5/xqHPNDBJIzloGEfKtmcbXDlULktPFDbIcDxtzcEKfQHrEDI9+F6fW/4I9Dgi4eUQc
 J59Mpvq/AXGOjFOHzgNDvUB/SkUovHbH+4H+e1KjVQ8uiR+RwolQ8H0qiwBw/xQBIIVHvBP
 AeAp9fMMRzR+YipeoMigg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+tQ6ysm1zoM=;PX2Oh4vIIvFx0bdOCfbJy+5u3RG
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
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:elfring@users.sourceforge.net,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[baylibre.com:server fail,gabe.freedesktop.org:server fail,gmx.de:server fail,iscas.ac.cn:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,iscas.ac.cn:email,baylibre.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 46276ACE69
X-Rspamd-Action: no action

On 1/29/26 08:13, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Jan 29, 2026 at 12:07:14PM +0800, Chen Ni wrote:
>> Check the return value of clk_enable() in au1100fb_drv_resume() and
>> return the error on failure.
>> This ensures the system is aware of the resume failure and can track
>> its state accurately.
>>
>> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
>=20
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Applied to fbdev git tree.

Uwe, thanks for feedback & double-checking!
Helge
