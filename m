Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41C986709
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 21:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D94F10E28F;
	Wed, 25 Sep 2024 19:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tGHWWn/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC65010E28F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727293122; x=1727897922; i=deller@gmx.de;
 bh=nXH904ypmTw/gJKVkpTGZ7KBXsxTPIsGXQBiVA1uwKY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tGHWWn/VhNr0GCGS1As0QyPn33Rgmex0H8+I49/cXK9P9qS8BSm6RzUbfKLidl4q
 1iTQs9gFx8VOSMR843AKK4J0VsJrPBT3YF8fD9eoJktM37Jm3QiYu6pBAF+CZzSVY
 6LksLsn4uOh+lIFKOQnjvElSpyiQDOdbX56t0VQZ4xOW5H9gYhChc+6sxFb4EEDgW
 rB1jwy0QYJ5JQEARyEHKMN5hEZ58vbKi+o25IC3QKdrN9AfC43upfvmIFD41rBk27
 Qoz63OGoHDFrtBMOtmlyIIyrUVTrhBjabvPaX1gGJNeWtqz/UDx/PMEzFIulYuzac
 SbNwkHfB+YzywLxa9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1sedXk1i6k-00PZjm; Wed, 25
 Sep 2024 21:33:22 +0200
Message-ID: <acb94eab-78e1-4e79-8c3f-11eefe525324@gmx.de>
Date: Wed, 25 Sep 2024 21:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbcon: Fix a NULL pointer dereference issue in
 fbcon_putcs
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
References: <20240916011027.303875-1-qianqiang.liu@163.com>
 <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de> <ZvLlEpIMQnJcJsla@thinkpad>
 <1b1a2d3c-ed4a-4d9b-b87a-8d05f3d6592e@gmx.de> <ZvOfwLvWdNHiU4g8@thinkpad>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ZvOfwLvWdNHiU4g8@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GhjcJBvIWCuBdISj33TK8C6II0pS/jTEZG/PvjpsJqAy8uOg1zq
 N7FyvHb5NO7vqr+gDBtnpPIBYEh3Sz+pWT1LckU9/Stme2ZWW9xOwYo9xkMRHNqWSGTo/4g
 7gTmcpbc1L3m6KoDiX8NSDvPFZHNzF7ZcbTgdaSN/D1KghsOgaXMKBa+VuDGy39Mjuobw67
 hKquVbZXwrRq2wviHjYRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NVwlnSJ6qx0=;kEDgWnGhOlSdUrkLRYpZgJmF5Rr
 OeNzsrFHgBKCv16crtj31e3pAZl5Jc1FSNUYl8Jq699ahuQvfv5Or3JjejVZJBGorRQFRqhiG
 HTHWJ3kYRF5+qdWrIldfGIR3Yhh+DFPOVEE8FgiOTzQVscA6qFhDoggCBCRsPn618hYdBbMGX
 MQv5+mAskYfXmO6Cnep/Z11Axq4mwHd0GlEbJ/uP40106+fhPc83Xf7xIur+aYb1M1wQQbZoT
 /FQXoYt2t7VRO+Mb8ZYU4S3fVusJsMe7u107R7Fs+Cq5kfamcOwa19/y8uAXW1WmmTv9AdzDO
 InT8zXEG3s9thBbum7PCCIPTfZeWWfnk+C+tGXB8MYnWLdjBn3z/lTRoH+JmJ5/tXfHVtyChA
 qcDr1PboGehmFnmJuzhRHNt1L/XcAEDPG5hdnfNAmWpWV5Ifd4w0AT1YcVnBkQSiKbrJfZrnW
 kD05xk7wQs/Xk+BS4PAHGdTM2DG96eNrC+PobzaVDfdfDmd5zv/WpRi26gWRAhtJ0D5H4ldbS
 p7jyfpbwfDZOQgFUtjSLZbxqGXVEBhLqOjejgJa0CW/KPKO6l68HjwoH4fTY4fUHSwyBH97om
 0edzdGb3Yma2dwQ7+JZwhdM62nKJiCJTh25rfJY+0oe3kDrP38jlcZGA7U+grtTeXJLLHP7RO
 p53DqpFifUNgAZS8p2LMIu3lyf4vsZwFQPkep4piKbm0HpqVbTirqAJ66+HaTTMp9A7PT9dt5
 gZdeADVDh5MyOX+zWnWHGWk47MDxsHowqVvUAPAFBzRiymjJ9cfAYrBH1KIMuZHAEBriqRwO7
 37PKP7Vu52DJQuT5PNRxZHpQ==
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

On 9/25/24 07:29, Qianqiang Liu wrote:
> syzbot has found a NULL pointer dereference bug in fbcon.
> Here is the simplified C reproducer:
>
> struct param {
> 	uint8_t type;
> 	struct tiocl_selection ts;
> };
>
> int main()
> {
> 	struct fb_con2fbmap con2fb;
> 	struct param param;
>
> 	int fd =3D open("/dev/fb1", 0, 0);
>
> 	con2fb.console =3D 0x19;
> 	con2fb.framebuffer =3D 0;
> 	ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);
>
> 	param.type =3D 2;
> 	param.ts.xs =3D 0; param.ts.ys =3D 0;
> 	param.ts.xe =3D 0; param.ts.ye =3D 0;
> 	param.ts.sel_mode =3D 0;
>
> 	int fd1 =3D open("/dev/tty1", O_RDWR, 0);
> 	ioctl(fd1, TIOCLINUX, &param);
>
> 	con2fb.console =3D 1;
> 	con2fb.framebuffer =3D 0;
> 	ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);
>
> 	return 0;
> }
>
> After calling ioctl(fd1, TIOCLINUX, &param), the subsequent ioctl(fd, FB=
IOPUT_CON2FBMAP, &con2fb)
> causes the kernel to follow a different execution path:
>
>   set_con2fb_map
>    -> con2fb_init_display
>     -> fbcon_set_disp
>      -> redraw_screen
>       -> hide_cursor
>        -> clear_selection
>         -> highlight
>          -> invert_screen
>           -> do_update_region
>            -> fbcon_putcs
>             -> ops->putcs
>
> Since ops->putcs is a NULL pointer, this leads to a kernel panic.
> To prevent this, we need to call set_blitting_type() within set_con2fb_m=
ap()
> to properly initialize ops->putcs.
>
> Reported-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3d613ae53c031502687a
> Tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>   Changes since v2:
>   - Document the commit message in more detail

Queued up in for-next branch of fbdev git tree.

Thanks!
Helge


> ---
>   Changes since v1:
>   - Initialize ops->putcs by calling set_blitting_type()
> ---
>   drivers/video/fbdev/core/fbcon.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 2e093535884b..d9abae2516d8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -861,6 +861,8 @@ static int set_con2fb_map(int unit, int newidx, int =
user)
>   			return err;
>
>   		fbcon_add_cursor_work(info);
> +	} else if (vc) {
> +		set_blitting_type(vc, info);
>   	}
>
>   	con2fb_map[unit] =3D newidx;

