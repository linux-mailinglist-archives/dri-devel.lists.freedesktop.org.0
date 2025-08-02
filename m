Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA1B18FD1
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 21:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913E10E491;
	Sat,  2 Aug 2025 19:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="sOAwOphm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7378510E491
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1754163041; x=1754767841; i=deller@gmx.de;
 bh=LpAYzYON2PDKKCTd6QrH9BE59pkwR+wzo2iAI145OQw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=sOAwOphml0S+TQuVMXM3iR7dhppUPWFqiBdeLjmFF4gEPuZ6WfNDV9T1dv00EXe5
 7ZtQHvX2Yn72EqogaGeUbBwiUPw6xn9PrpCPT765dPDg74wMmYupdLbgbZGXHM5M6
 Nksm8yuPbhg8+x0TEehi7mvKWMdtzHSdaiQCzTf3iuPDnVvH2ehQbNA85bBOrCv/n
 USSbLZtJQHwFGDQBVepp9hHpQnKCLZoibkZ9lLDhM4KQE+Y2yS7G++8m2fGFu7fQm
 FP6WDs2G21iVmq8eqmhizZYsnx7Ylq0CtjLWF6Vbs3KBF/eoZ8VTL1tFTPATV4IV0
 8favZbOdfIRimWDebA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1uXrp12TAM-0173nu; Sat, 02
 Aug 2025 21:30:41 +0200
Message-ID: <69c344cd-acf4-4363-b4a5-d07226fff609@gmx.de>
Date: Sat, 2 Aug 2025 21:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Fix vmalloc out-of-bounds write in fast_imageblit
To: Sravan Kumar Gundu <sravankumarlpu@gmail.com>, daniel@ffwll.ch
Cc: skhan@linuxfoundation.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+c4b7aa0513823e2ea880@syzkaller.appspotmail.com
References: <20250731203618.25973-1-sravankumarlpu@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250731203618.25973-1-sravankumarlpu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jE95l3AZ6/Gc6eSallHAx6igQU+pwhA8zX/TVwdxVgWL5eQnB6M
 S5QIW2eIGEXiZfdo7V9KBbUl36GckBEu/qji8queEB7FDYlitaNmWPzOqZyyOZ4lGgWVMUS
 pFUxn84L8CFVTpd+cHvmDKtL8VtV6n4Nl2HysU/o5KHuf20EqiHakvOpJcc/G+XKc2H8uct
 0zy2lYm1HW2FNsqX4ZwYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YxrcuRVDOZE=;LFJtORxVS15QU5qDhRMbiye/GsZ
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

On 7/31/25 22:36, Sravan Kumar Gundu wrote:
> This issue triggers when a userspace program does an ioctl
> FBIOPUT_CON2FBMAP by passing console number and frame buffer number.
> Ideally this maps console to frame buffer and updates the screen if
> console is visible.
>=20
> As part of mapping it has to do resize of console according to frame
> buffer info. if this resize fails and returns from vc_do_resize() and
> continues further. At this point console and new frame buffer are mapped
> and sets display vars. Despite failure still it continue to proceed
> updating the screen at later stages where vc_data is related to previous
> frame buffer and frame buffer info and display vars are mapped to new
> frame buffer and eventully leading to out-of-bounds write in
> fast_imageblit(). This bheviour is excepted only when fg_console is
> equal to requested console which is a visible console and updates screen
> with invalid struct references in fbcon_putcs().
>=20
> Reported-and-tested-by: syzbot+c4b7aa0513823e2ea880@syzkaller.appspotmai=
l.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc4b7aa0513823e2ea880
> Signed-off-by: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

applied to fbdev git tree.

Thanks!
Helge
