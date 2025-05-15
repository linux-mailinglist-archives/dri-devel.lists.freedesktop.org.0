Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C921AB8A61
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D2B10E8F6;
	Thu, 15 May 2025 15:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="iG9s6DEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EC210E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1747322131; x=1747926931; i=deller@gmx.de;
 bh=0ySXWfz0EinPJ67yvOom5j282HB/l7IKodxQMg6cWJw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=iG9s6DEOLDqkpUyAhion/ZWAFZCU7UDO+p9vBcgzSIqkO1rAh8NjRwRsPuTlzED5
 SNh3pi9cq2T0mDxzNxuVRgJjzFKiuBoTxoaOggyW2qFFR54Y5cj4Np/hHVj7XRIhg
 sEQhMATg4ZAms+9uLVe5RVA7zJowXtc71Okpmqfy8MGTmOwqSftLKdIcyxX4TkjdM
 7MxNiwLVXa5FEeE8C/xPYO9Micovm8OHNtSERvbwt0b67QVQB7C+3H7hToDhtndpd
 5qVzHdbnMyu8QOtywaV/iSZvuZFZnro9DpVZl73m/m//sKf3j6e1gMJ0N311WKiGQ
 iAtYqCPY+hBHZ7EzKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1upTji3F1i-00jkkw; Thu, 15
 May 2025 17:09:52 +0200
Message-ID: <8cff1ccd-7794-46ce-a638-0ca98847fd4b@gmx.de>
Date: Thu, 15 May 2025 17:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: core: fbcvt: avoid division by 0 in
 fb_cvt_hperiod()
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Simona Vetter <simona@ffwll.ch>,
 linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <ccd81e47-8635-4e02-84a9-afd19856a2f4@omp.ru>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ccd81e47-8635-4e02-84a9-afd19856a2f4@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:36dSesibt+sktmhFwmaKNPaX0TizToR1nrw4HdnS68AjiI50wH2
 dMCBTEVtBFPBAxOlojMhiOwHtjQR+EN8RE0OVZ+fysR6m/Sqs6JLOeqEIq3q+G2ELHqP7hv
 +oqHEWlFjedILuNJPxj+zagdM4oGM6/1jY/8q+2sobG+3SLM0T2XUrn5e/gNmCEEPq8s1Vw
 tQM0jX3Voh4dvKupwbQHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jdHsfu2abQU=;84m8SIU7HoX9TLhf5d8W2kyl/20
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

On 5/14/25 22:35, Sergey Shtylyov wrote:
> In fb_find_mode_cvt(), iff mode->refresh somehow happens to be 0x8000000=
0,
> cvt.f_refresh will become 0 when multiplying it by 2 due to overflow. It=
's
> then passed to fb_cvt_hperiod(), where it's used as a divider -- divisio=
n
> by 0 will result in kernel oops. Add a sanity check for cvt.f_refresh to
> avoid such overflow...
>=20
> Found by Linux Verification Center (linuxtesting.org) with the Svace sta=
tic
> analysis tool.
>=20
> Fixes: 96fe6a2109db ("[PATCH] fbdev: Add VESA Coordinated Video Timings =
(CVT) support")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20
> ---
> The patch is against the master branch of Linus Torvalds' linux.git repo=
.
>=20
>   drivers/video/fbdev/core/fbcvt.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.
Thanks!
Helge
