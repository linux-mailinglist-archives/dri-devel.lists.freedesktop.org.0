Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34FAB30F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 09:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4E10E154;
	Mon, 12 May 2025 07:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="n6WtF24H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852EA10E154
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1747036781; x=1747641581; i=deller@gmx.de;
 bh=O47j6L94fVjn/YsaLE+3s3gGRDZgvp+/gUtgpTWTT6E=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=n6WtF24H6I1zrN7nMUREu7Oh+zTaO1BiWdgGIjPNJ4IVHCFfDj1wXtFW3kqrm2lO
 KhcdpqcBMamSeD0qz9zoXFsWKOIU9TYZkj5Xu5pTlAfh+f7xfpYkSM8Ei8RQpSrK2
 aCJfwWKFGJS3vwpmeOR1KvcM9mKVDsLok0y1vVvIBuq5xw9IAP1WinQIeQ5mwvHuu
 E7Ent7c1o8nEE7g6lLLI/U9wqB7X3Oa3F3/Je6oWNNzK/gROrVMGhWFTcRIc66Gip
 XqRE7T1N21T84EMQnm6Y3RBInn9azEdrcPlmsVcAMqg4nfYbRziBf5nU1EnMshsII
 tCiNuV1K1C3VjFmBAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.181]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9UE-1v6Dcb2tSm-00v7s9; Mon, 12
 May 2025 09:53:45 +0200
Message-ID: <041138c8-a1d8-42fb-af4b-4e93a85238af@gmx.de>
Date: Mon, 12 May 2025 09:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: fbcon: Make sure modelist not set on unregistered
 console
To: Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: syzbot+a7d4444e7b6e743572f7@syzkaller.appspotmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Shixiong Ou <oushixiong@kylinos.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qianqiang Liu <qianqiang.liu@163.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 linux-kernel@vger.kernel.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com,
 linux-hardening@vger.kernel.org
References: <20250509200643.work.355-kees@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250509200643.work.355-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EZoYGogtQY3Q6cffV6x3/jC7yJ+uFi7NwsMCI+21arfl49A8EGH
 Qu5kEy+v3JNFZdEnkpxnS/KXZRt60V6hT/Q+jTwQlcBe3y299d0hr6RTieW66r7bKFqCuLH
 cNVPeP74GFVuBsDTbyXEGPX9kVvuaiXkYpGHXg7kgiIomoyphQhTN++zu+reY2QFL9o9OYS
 J+g0Bf6rv5kFMcBF4eHng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WUaxpYh3kpI=;24laeTDnk5fDV5vrByh/x1urOg1
 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
 /jRVVbE8mV6V3Z9KOKoH188IQMOYb4xScV
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

On 5/9/25 22:06, Kees Cook wrote:
> It looks like attempting to write to the "store_modes" sysfs node will
> run afoul of unregistered consoles:
>=20
> UBSAN: array-index-out-of-bounds in drivers/video/fbdev/core/fbcon.c:122=
:28
> index -1 is out of range for type 'fb_info *[32]'
> ...
>   fbcon_info_from_console+0x192/0x1a0 drivers/video/fbdev/core/fbcon.c:1=
22
>   fbcon_new_modelist+0xbf/0x2d0 drivers/video/fbdev/core/fbcon.c:3048
>   fb_new_modelist+0x328/0x440 drivers/video/fbdev/core/fbmem.c:673
>   store_modes+0x1c9/0x3e0 drivers/video/fbdev/core/fbsysfs.c:113
>   dev_attr_store+0x55/0x80 drivers/base/core.c:2439
>=20
> static struct fb_info *fbcon_registered_fb[FB_MAX];
> ...
> static signed char con2fb_map[MAX_NR_CONSOLES];
> ...
> static struct fb_info *fbcon_info_from_console(int console)
> ...
>          return fbcon_registered_fb[con2fb_map[console]];
>=20
> If con2fb_map contains a -1 things go wrong here. Instead, return NULL,
> as callers of fbcon_info_from_console() are trying to compare against
> existing "info" pointers, so error handling should kick in correctly.
>=20
> Reported-by: syzbot+a7d4444e7b6e743572f7@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/679d0a8f.050a0220.163cdc.000c.GAE@go=
ogle.com/
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>   drivers/video/fbdev/core/fbcon.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

applied to fbdev for-next git tree.

Thanks!
Helge
