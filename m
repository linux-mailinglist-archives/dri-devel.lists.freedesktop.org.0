Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4FBB874F
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 02:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15F10E198;
	Sat,  4 Oct 2025 00:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="nzvFd4cN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE0410E198
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 00:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759538614; x=1760143414; i=deller@gmx.de;
 bh=byjIFrRLje8mJludxAFm0fVn0za79S5DALn/zN251Vs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nzvFd4cNSGYugATD06FgCN4LRMRr3f4VnNf5OnlQ5PxiUWyFOGNFFI5R+i31+fV3
 7hPk47ng0+aeAtC8NIe9SBuhhxmxQpR4KalWyxaVsvl/IJ7c5hX7yEmOvZzZD3BBn
 to3TgsN3T+C6DI7GOv4ufttSUe7/LeN/NdDvNlfDnR7/xl/1Q1R4/XAHsjaXPOSxI
 14ZnwIXlXkyh4XBguSuDCe4MK5X5Of3pW2C8Ar+mmI+2TFLSbw8zvAohYzDv6dZSq
 cImd5zG9QTKtYBoxIf84AEVIxK1068mD6+qXXkHFz3oorUCPwKmLZMg0g8PZ3V7r3
 thYQV6fr6Yonq96RkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1uDoMr0MAx-013VJt; Sat, 04
 Oct 2025 02:43:34 +0200
Message-ID: <b4af6e84-6555-4629-8291-fc4c2c99390b@gmx.de>
Date: Sat, 4 Oct 2025 02:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
To: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251003073210.48501-1-albinbabuvarghese20@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251003073210.48501-1-albinbabuvarghese20@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:odlk11ndAVsepHf3kWT32kYDcRxq/z0WX0qi55cnHxjcjeJqr3m
 t81REgmfvV845GQEZeQDTcBo8KrrdjUuuJC7WROc9cC5YFXrpqLoMCm0lh2yFbrWz8Mz7L8
 5TnrhRaeqpxdseNDpcqlRNqW2qvpgEwjCt/1mdZVK5yOeg6lwoMOaAJM9fWOzQwpy7023gA
 adm4b4DSAv2X1iO9G7cKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N6AzP20pUqc=;AUXKe2Bubv39lrrpOz1qvwZmoyY
 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
 zA8qCBB4sCJFyuqRgkiqcXwj55DVoBmtKPgbps
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

On 10/3/25 09:32, Albin Babu Varghese wrote:
> Add bounds checking to prevent writes past framebuffer boundaries when
> rendering text near screen edges. Return early if the Y position is off-=
screen
> and clip image height to screen boundary. Break from the rendering loop =
if the
> X position is off-screen. When clipping image width to fit the screen, u=
pdate
> the character count to match the clipped width to prevent buffer size
> mismatches.
>=20
> Without the character count update, bit_putcs_aligned and bit_putcs_unal=
igned
> receive mismatched parameters where the buffer is allocated for the clip=
ped
> width but cnt reflects the original larger count, causing out-of-bounds =
writes.
>=20
> Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D48b0652a95834717f190
> Suggested-by: Helge Deller <deller@gmx.de>
> Tested-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
> Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
> ---
> Changes in v2:
> - Partially render when height exceeding screen boundaries instead of sk=
ipping
> - Update character count when width is clipped to prevent buffer mismatc=
h
>=20
> Link to v1:
> https://lore.kernel.org/all/20250927075010.119671-1-albinbabuvarghese20@=
gmail.com/
> ---
>   drivers/video/fbdev/core/bitblit.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

applied.

Thanks!
Helge
