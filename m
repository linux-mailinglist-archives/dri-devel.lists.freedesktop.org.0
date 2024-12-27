Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A39FD2F8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 11:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5241610E2D6;
	Fri, 27 Dec 2024 10:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="DOfqfe1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497E010E2D6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1735295066; x=1735899866; i=markus.elfring@web.de;
 bh=TkQyK4GNG/JjeIgzaUsMotdNNFgS3F88pdlkp94G7iA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DOfqfe1Y+vpfdWVnKjzqekKRWorJixKifUryWkJXx5KJQfolUYk15bt8iLLvoEuH
 151P30SVgJ37yLb+WyIC73wIVb6C8XId2TtUuDHJD9Xmkh0sYRD23QjPOru424HE3
 AFzMr/3ko3L7AytXcM6ToBSdeS6c2ucoZbkYJX1QjblzEIQDREf995IGkXsr69g8d
 I/ifsBvCtFZXPB6yJXC2XHz7V4KnMg3yeAIc2Hkgea1bbv4NoWB28c3+sXbi35keG
 Knys0ToSJVlTtfAY/yP3mpY142NUM+0lO2g+7/ApX8aqv6DTr6auQV25QIZ1Yr2PJ
 6Ts+8YvtSYTXjFD44A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.93.31]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBB3s-1tEWKy3B0Q-00CiAi; Fri, 27
 Dec 2024 11:24:26 +0100
Message-ID: <3ab331db-363c-46c3-8e9f-0cbf4d142493@web.de>
Date: Fri, 27 Dec 2024 11:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/mediatek: Initialize pointer before use to avoid undefiend
 behaviour
To: Karan Sanghavi <karansanghvi98@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
References: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
 <8a5bdda5-5e2a-4b73-91a5-849b6060e7df@web.de>
 <tte6ad3rxle52x3wndewyyrnszozghvpxktx2x55w26rdcea4n@rdbhzpx2wi3p>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tte6ad3rxle52x3wndewyyrnszozghvpxktx2x55w26rdcea4n@rdbhzpx2wi3p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:261YQXgSq9sf+X0DuUBswbH9bCF7TKLuW/b5gnQ2sxTMF+YlzMZ
 P4UcqtyiZoV3LySSmxpUmNBT5xKyXo0J3BT0oQFWAZCc0Sil2mCFlslgPUVwmOx5f+8EXs2
 JkUr2R8wPvL9xvXJ7DkkKtWkuhvPKVnSI/NuwGGiI9baVRQhjxz0/pvYgU+9YH2xXYdEzkW
 M6WlEmKrZ7ZRKpsvMEMCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NSVhTixYKaE=;U27C+P7a35hKymGudvjgiTZCUhF
 RPK8JsHHpOI/XYQhJJ4jF0KE+tmOmLvX7WP8jSfo50ld1iKlvyM4fIooDUGsbwHa/yrJ1fHWH
 5JbkWTQVVLvIQ7Fp73Frf8cxvBzC9OpMhvlEeHYcVFCb/DgiPOYr+R+PbEBt1/nKZ7cxfmS5f
 23S1YM2gkOiFFjqnZgnzpvCFtyp57N1amPafKrxxrxNLJJNnKGcKhLZrQuPAVKJ/lbuPO4Rme
 3FYWlMgBhvGdNARuHQGI9kmAG8NmynCDo5wXdYiIzO0Y39Eub/DRB98FF3fuMYoMwqoqnbncs
 WyEShDs815Un0+4WoGqSh2vHKAc1M5Wu0ObDVvFsaSGoGrNzNFzuS8g2gHfwdwCV/FdCqJ5G3
 f7BT9QEVDgtY5XIar4iqEWC64XZVprnXdd/wXi+rdsAFkCp8HJ/ZiEZaTr+aOgljhpzt7xxK+
 ubuulB77CmDJ98yZiTje1nenUUcvDbwvEKsYUq5nRGs9R0amZECGlVq1Fl7rV/i5sVGxGCzPQ
 LwVczdSXTxfanvvj7n8+uYubuqB93+Drh4jpO3UJWLVxZWxbtrJYVro6PACRbOC+QKpgZwKf+
 l9tdiGC/edo9S+UjQKNAdvIBUsN0pZ/OMVjkx3NTNRnUllHY5UsgJFEPimIY5ju8oQ2Csy6vN
 P3b/5zzxakA5zlau6FZ0uGrN+vZm9UBPR5uum7T+/BaItiHlxNwHA5kIyzMo3TAFMGOGp9fRU
 hxS5pG2bxb81ARJjWyaDCeH5/2Jto6naUhawpu7pFsoiAYkxQA/8BEkSDCPVAy2WTdJRBEvsI
 io3Ay/+NUEVQ5YJl3ym3K+jF9UHwKBVkbVe0nj8og/mWIE3/JqzPyLoI+nyguo9w1up/mW7DR
 T0to59aSNehQ5u0XE6/baPgisBErVOdDP5NGiUm/sQ0XLX+IfJAkbgcVYVgZ4dp7b28pSWCB0
 MFPydf/t99tUA9FN1oL1ExqL1rQTdcG39ZQPcrklTC6W3clsnT9mhBbbdEvoi6EV7b7SGUvQ8
 vn3yw9HUhhGMVVdkJ282LNhBd617aCgoMkbPPylgMVdaaSkfD2NVqU3IGc1NTZp03hPjb/FdI
 SvRlkaNlY=
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

>> =E2=80=A6
>>> ---
>>> Coverity Message:
>>> CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
>>> 3. uninit_use: Using uninitialized value next.
>>
>> May such information become a part for the final change description?
>>
> Ofcourse, it shouldn't be the part of the change description.

I suggest to reconsider this view once more.


> it is just for the reference to understand more about what the error mes=
sage
> is generated by coverity scan.
Please take another look at possibilities how other contributors indicated
that some change opportunities were pointed out by advanced source code
analysis tools.

Regards,
Markus
