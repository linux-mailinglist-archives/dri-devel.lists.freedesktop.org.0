Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58AAC7A13
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B554F10E13E;
	Thu, 29 May 2025 08:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="YKYp32Vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6943510E13E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748506753; x=1749111553; i=deller@gmx.de;
 bh=kd8g4W7OT8GPzSuwFD7fE2aPZqVVGtzcZUw0OA3K0aM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YKYp32VhIbRmSCJukM1BvmG9QplEjkyJCzeCQ1DGdUz2pBDco+PtUOKtAX80V1Pk
 MikUX8hL8zcQMImw/K7HB9wamR/LtJChJC2sr1NmNe/2EgvXSiCt8a1fwyqp9obGd
 eQ0LcSgR/ok6dbq5oQ46xQRfoN7F+lThLtKP2oSNU3fyCF48tx16aqFQBDRPBTsvF
 9sd5OEHrVoJsR9ynTp9uWwTxR3Qms7SNzbcuxQQJkaw9s9yV8Tcebl4xNhpOVvIke
 m1ArNfofXnBIkR/EnVuanrayX8VY19pE/HAgviEcmHQeguXo5JMMzP9qPeSI8rYxZ
 EtQOXMxSg44yxIXF8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLQxN-1ud3Eg01HX-00Jrcs; Thu, 29
 May 2025 10:19:13 +0200
Message-ID: <62fff638-0898-4952-b159-d4c8a13e6d24@gmx.de>
Date: Thu, 29 May 2025 10:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fbdev: Prevent null-ptr-deref in fb_videomode_to_var
To: Murad Masimov <m.masimov@mt-integration.ru>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250428153407.3743416-1-m.masimov@mt-integration.ru>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250428153407.3743416-1-m.masimov@mt-integration.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f1ufw/36rrRCnz67iiZEICEfyJgyXugTQYxm2c0DH0CSOyS+07z
 y/Vib7x7QbTGqt61nMxKd68uqTbYZ3uYeFcjOHwvmKOj+g5AaIeOpqx+IIsKRnTtj4tECTt
 CND+hWAQyqE7KiYip71ElCHw01Urn6ZZ6MdWtY5W3L8kr6YoaHVgLrPMliGx4Hd/4zfielj
 eVqV+y7gy/TgGxiXyZSVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:m2uT7aDcGfU=;2IE7pvXMqPnfwdiAvXhfO2XbQz4
 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
 Czy7zR79NyJX8URppGT6FantI
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

On 4/28/25 17:34, Murad Masimov wrote:
> These patches fix the bug that leads to a null-ptr-deref if
> fb_videomode_to_var() fails to allocate memory. This bug is present in
> do_register_framebuffer() and fb_ser_var().
>=20
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
>=20
> Murad Masimov (2):
>    fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in
>      fb_videomode_to_var
>    fbdev: Fix fb_ser_var to prevent null-ptr-deref in fb_videomode_to_va=
r

I've added both patches to fbdev git tree (after fixing two small typos in=
 commit message).

Thanks!
Helge



 =20
>   drivers/video/fbdev/core/fbmem.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> --
> 2.39.2
>=20

