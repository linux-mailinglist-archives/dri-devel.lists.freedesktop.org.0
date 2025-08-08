Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD3B1E4F2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE7E10E8E5;
	Fri,  8 Aug 2025 08:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="VV8C5qKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0EB10E1CE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1754643270; x=1755248070; i=deller@gmx.de;
 bh=J9RkCIDppWCVW/Nd6vdKfVwIHHpq6sCuNgT4ZaYvr4c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VV8C5qKyQwKfXTSsXqk64vyvpL+DIGgfBtz5WTL3/7nlda3g9pqpzNjl9nzy4TpH
 mPzl0t0x6Deg0WO/Zaex126QZt7yBzjGYpD771FmGNDGmkZkvbE3odfgDcIBk4KmC
 lwdvFX2EJbmwskp/cfdinlOrcv77FTx3wIEAPJx2ywaajyBAWBGlAFK5UbfmcEzXv
 g2ZrIhwUD9X/T9WJNjyunSlUHgSzEKvSoVyqd13vvVPUqWu0VUwZS9zATolCrXHAb
 fOIi8CZN33fCEzJaJO7Aj6NHfbdekzoYCW4e+zypB4JEyGdCFxJN9QSpuqcq/PQZ5
 CFAPxKazS4hb4ebExQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.84]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1uCKtd2pJv-00houM; Fri, 08
 Aug 2025 10:54:30 +0200
Message-ID: <26ddf0b3-1053-4c71-9d4b-c12e0ac74b32@gmx.de>
Date: Fri, 8 Aug 2025 10:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Use vmalloc_array to simplify code
To: Qianfeng Rong <rongqianfeng@vivo.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Andryuk <jason.andryuk@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250804072413.143154-1-rongqianfeng@vivo.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250804072413.143154-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P2S2oSAcVvbA93YzdnHwDkuVMvVBiYhyAICOOF+YhmjZBpVMGA+
 wft6Nvc4gJ4PpEVjqUaNom3/3DzeBuBCKZ1U2x0AgbHMftMhZFSHlZ5ToFjzDeFUepes5ss
 WhjijXiEyNBUujvFiCcfDGs3R01Kuo5EjASGU3tdGqXJ1fUTOvxhHovF2FMD3BK7T5Qn/WC
 iSXrV5AEpud38pIZul/EQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GhFf9KB5Gqk=;2v49nAvhoxM0DY+rF6sP5wGkQa6
 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
 jKh3+G9d3TbcGvqbGAWw==
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

On 8/4/25 09:24, Qianfeng Rong wrote:
> Use vmalloc_array() instead of vmalloc() to simplify the function
> xenfb_probe().
>=20
> Compile-tested only.
>=20
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>   drivers/video/fbdev/xen-fbfront.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.
Thanks!
Helge
