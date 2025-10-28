Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07675C16EF8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9A410E666;
	Tue, 28 Oct 2025 21:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="DBJ5ClGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB76F10E666
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761686640; x=1762291440; i=deller@gmx.de;
 bh=fKxhFwTiz+q9WKmslKKzEWTxe7xJJ79QsznNBG3vqSI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DBJ5ClGd0ueQjmP/pc9CcvFssoah9givBKzOFR8ZK2KIQz/DgEGaACali2MPvVIo
 pqM3z8u+KzveisP4HjOOjTvQfyp4733ANvliiOCzE+uAz4Uc9CltmLmhxXhhPL0xB
 rgiDVCrdJZ9mfX2B1UEXMOrNbLdyiwr1EW14bg2y1WAuKbtR/9XHDX2WGWhzdfdZg
 eGuJBS8WbyuB10Yd1zoGtbbwZ62yp+R1AYVPAyzVj6POKoJ6i/e4wBfZKASjDE0YS
 G0QoxNiljev7WXoVfz3YMZippHKYZYUdejDChfzzp9ZCd3ozmOdStcDb17ZqVRGFm
 joZB3+LwoIJHmmqYGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1wDLo90hwf-018Luf; Tue, 28
 Oct 2025 22:24:00 +0100
Message-ID: <5b5ec5ea-7a81-457c-9ab1-6c56a722c5e5@gmx.de>
Date: Tue, 28 Oct 2025 22:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <cc1e8193-6588-4e75-896e-b807f451fb4c@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <cc1e8193-6588-4e75-896e-b807f451fb4c@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kc5FMt5APKw+zZ7UtQ7jL7kJ10LwmkCVMVG8AWyWrN4bnv3NhcH
 j8Vfnscntj98zW5Rti0BlNB2p6z7KBFqmyhBFSWo8iHiIGtRZE/WNPXZ2qktWvg/LYnGT8B
 hdG8ZfuQRi+LPv9JoZjDf2ssI2+bFugjeyRPz3uDZ+UYGZh9dYLbGJaUFk+46qNIzVC0v/H
 6kTnGQjqwl1do+pXDfMFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VXUFfY//uL4=;9MHe82pGjm321X/yJbjLck3CitW
 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
 XYAeg==
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

On 10/20/25 16:29, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.10.25 um 15:47 schrieb Junjie Cao:
>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>> character value masked by 0xff/0x1ff, which may exceed the actual font'=
s
>> glyph count and read past the end of the built-in font array.
>> Clamp the index to the actual glyph count before computing the address.
>>
>> This fixes a global out-of-bounds read reported by syzbot.
>>
>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3D793cf822d213be1a74f2
>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
...
>> v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-7170913=
4f1e1@suse.de/
>> v1 -> v2:
>> =C2=A0 - Fix indentation and add blank line after declarations with the=
 .pl helper
>> =C2=A0 - No functional changes
>>
>> =C2=A0 drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>> =C2=A0 1 file changed, 12 insertions(+), 4 deletions(-)

applied.

Thanks!
Helge
