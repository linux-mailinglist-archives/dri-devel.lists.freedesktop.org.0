Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B59962F55
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 20:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1649B10E309;
	Wed, 28 Aug 2024 18:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="FuSf36dM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0147110E309
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724868513; x=1725473313; i=deller@gmx.de;
 bh=Hud0DI9YV21RAJ2KGzjy/vBH5kORqs//+22MFMlye5w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FuSf36dMwtmvwicmeUBj/MX3dL4poZiO/leZJhPk33B8aguDpaPVIvKOnMXiV3hu
 MbUyPWFslP9V7nDDQhMEFF7hBkvS0IwbDyReALZhjuL8w5lIE5dKO2yWIXNslBFqc
 9nmpuTOs54viXOPlidbWkInWreA/5jQZnUNzibX3UhTp2Fo6WPLSFodUb/UTjG77m
 rbke9rdB3Bh8e4dEPY6gbi73ISUdfX9KuMCZmybezklSYGo3Z7Z4veJysFktMFMNL
 UkHJRloinR9f4P1jUGe7FyKzYGLN22YTQ9LY7bKiCj6srB2U1X3/uG3TzBsGXA3+1
 IfvMXvUFocxvAI9bCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1seKlW3K0w-00TK58; Wed, 28
 Aug 2024 20:08:32 +0200
Message-ID: <d60d6c37-3726-477c-8d69-5b49be8c921c@gmx.de>
Date: Wed, 28 Aug 2024 20:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: Use sysfs_emit_at() to simplify code
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kpndym5g7jHBuKWmmsmXtKTqJZHimbfDpYO2hL9Z0usUf4ZgN9D
 ziEtYiOKxiHCwJT2SmgeqTfSlXw1sm4w6WvyBzXq6Yu3pWX3gAvoDuncyybDpwSDzy8jU1L
 dHjWF7mlvWR94lZLhlD6Wglo7quMGzf4nTTLf7X4Dr422NKupukR85Mv50NgK0PwYMhHKYa
 j60RNK64+Oz+Qr9mpxNRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MV9b1EM5y0E=;oa5b73fgnWG2aVd+RnZcqp17m06
 1foU/NMg4F2hKCmtvPp5c6Vegom7w0o09Bgsi/1/KKvdpkRcm5oYSHGas1iO2WquBeJIBqVtI
 eBVWk28ZDzcLK0+js+RYDDIlD7G46qbSp7aQ1bP99+UdgSNACBQ2MQm1/HTAWfu+bOmxo368X
 ro60Fl1HNgKRMv79FxnYNJ/6MOko/TqxoZE6g+rZ/isntVktakf0SZlHRvcU7PUddhvd6ukSo
 3aYwVyMMg+Rz30zrReQzOKUZfsVaNfmyo7Mq/cUHRulLiRaCb72wTUdIL+wUfG5R98nKIIG8+
 i0HbsmY9EbdbJmql5saBKqTc0B5XK8Fw5lXHdvPLgSLFUltGluOU0ZDblv4V+/ULgMyRICAvV
 T2vegnPDOOp1Px/m0XIJtjQq6ooBJSXASffmbjPSj/jzRrFN4Dd8GIsM3KZ3oq8yRIESzpUro
 3fKfTiCSOQ1OndOhorb/ONjo1Gt/ZlKvEBi/Lg4RYCQ0PHyVj7eMrz4bYb1deKVTyQTZnAXSv
 Q3GWy2ylDx2GPnEXNdOtztWUKg12f1wDW1USwMHMVKytyAmr+FSIbPraWe3O3fKYXlwyZvexr
 eYPXzDAE9tCb0vetKj19zXQxb2s806dLVpGD0lC7mBZW+0ilHShopcsYmoZhrfe7f5oByp6Mz
 b5Sktn60XUhSEdXBpadSrUrAvhMOJKd+uGRrSTHiQ0k964E7LpZb/T0NHp3TKoX9maOjqAcVR
 +fjFx4sC7v8r3kv9EP17oPGaLQoC608aflc8QJE7lqH1T/rlg1ixaM+/zQDGNotUb+p+IAy6Q
 4D51eGeoQE2he+iLISnPWXeA==
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

On 8/8/24 14:14, Christophe JAILLET wrote:
> This file already uses sysfs_emit(). So be consistent and also use
> sysfs_emit_at().
>
> Moreover, size is always < PAGE_SIZE because scnprintf() (and now
> sysfs_emit_at()) returns the number of characters written not including =
the
> trailing '\0'. So some tests can be removed.
>
> This slightly simplifies the code and makes it more readable.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>
> 2 spaces are added before color_caps[i].name and color_caps[i].name, but
> not ctrl_caps[i].name.
> I wonder if it is done on purpose or if it could be removed as well.
> ---
>   drivers/video/fbdev/omap/omapfb_main.c | 36 ++++++++++----------------
>   1 file changed, 14 insertions(+), 22 deletions(-)

applied.

Thanks!
Helge

