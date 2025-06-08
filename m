Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F10AD126A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 15:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDC610E1A0;
	Sun,  8 Jun 2025 13:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="e9i/76q/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2700310E1B6
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749388663; x=1749993463; i=deller@gmx.de;
 bh=62pR7ZjXswN9oSVWvZB3gA99ZofQlDnhD67435sehVo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=e9i/76q/kofG7QrR0HG3b+WVN6i+ZPr0a7NcXJVWE8Gge1c7vrfEWZK8jtuiHm0D
 u9ceRsk6TmPgPBIg7pPzMOm+a0igZHm9bnK84UvvIC4WS7/BcFlDJDKac27Uryps7
 o31Aty3R3Cfgdsb5zxCyeNeeLnVVFDB9CPbmWYROd7spmJQ9oPaql7r+ek1ChFdYx
 9/UCPAgvGL37soNhgqwydwFiOxAP8mAHwugYJ2kZNaxdbTTKXk3BNrV3kSa+PUz+E
 N85cFKuNuHp/usmlY3tRCq6G6Q6hcyyVd/+7e35zyIbNNNEYptMn464oEnGyMyb9O
 iVGRzLiZe5U0Do05WA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1uU2JT0bdP-001i93; Sun, 08
 Jun 2025 15:12:16 +0200
Message-ID: <ffaead6b-e9d9-46cf-ad08-aa6a46dbe74a@gmx.de>
Date: Sun, 8 Jun 2025 15:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: pm3fb: Fix potential divide by zero
To: Alex Guo <alexguo1023@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250607194959.2457473-1-alexguo1023@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250607194959.2457473-1-alexguo1023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KiChRPU2fCErll9U/cYDgg49Hk+59W4LumbQcwmVnJqW/NEnr46
 4LBI+I/RvH2AJPHmlLmWk5wDcI8aQjwtdSYxlZugAxTvvTsHrTNYaoMkJ1ptiH6MMBjyULE
 pdQ8wBrV8xVwUmGa2bOyfJhF/KSD++suyoGpO0in0zDd4zCDHJOKIbnKSHHUyF0wmOYcdpT
 YB1MOfU3TAZ4pMXDRr6OQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jcW29+F8gYM=;na0x3UrBlxcbcTURs2I1EtUuzfl
 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
 CJaugzXvr+YsPTMqKrdt3ykDo
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

On 6/7/25 21:49, Alex Guo wrote:
> variable var->pixclock can be set by user. In case it equals to
>   zero, divide by zero would occur in pm3fb_check_var. Similar
> crashes have happened in other fbdev drivers. There is no check
> and modification on var->pixclock along the call chain to
> pm3fb_check_var. So we fix this by checking whether 'pixclock'
> is zero.
>=20
> Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> Error out if 'pixclock' equals zero")
>=20
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
>   drivers/video/fbdev/pm3fb.c | 3 +++
>   1 file changed, 3 insertions(+)

applied.

Thanks!
Helge
