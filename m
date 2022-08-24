Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01555A0CF7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 11:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D581D11B5A8;
	Thu, 25 Aug 2022 09:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D5611B5A9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661420803;
 bh=mT+JncqykK1/MQG4BV6pGNhG34tuIpbu4gUj8Qq5OJg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fJ+9xDRgsI6K9DocPnpryvq39QdjNfgaAzvAzEqoOv2SYNFjpY75RWUH3wzWBgb7s
 jHUU1s9sk1F+mzUSZpMFmYh/h3A0JVajFXnefZu48fyu2ocCoWVwbysXCGAUY68taZ
 5vjstq+Q8rbZN27o1DY7D1EHsXMqT7jeWkV7rc1o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.173.19]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1oqcLl1B5B-00RtjX; Wed, 24
 Aug 2022 22:04:40 +0200
Message-ID: <6efc0d2a-c2af-947c-d928-104e3add1650@gmx.de>
Date: Wed, 24 Aug 2022 22:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] fbcon: Properly revert changes when vc_resize() failed
Content-Language: en-US
To: Shigeru Yoshida <syoshida@redhat.com>
References: <20220818181336.3504010-1-syoshida@redhat.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220818181336.3504010-1-syoshida@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bPYtDBYr/fK766CKWILWMU7xF4/wZ+tyXxZ1o8D2m8Jo85BJ+as
 DNW6Cz5IoGsD2PzMXfhkHHJBmrmJi0/gZdkacY5RzJBUap2qs1wCwreOlmx6Y/XNoOsTg+o
 9MRQE0QR54b3UTUFtfdSXRChRLYQyp/1RIqWJFyFBQZldaNXhs6p4GYoBrUTmwMgMfMbl33
 N6FltjFkdpDIxKBB4r6BA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nDC740IYQjA=:Ko2xiDCfA2Idc0gRVnl1dn
 HYJ7gO8iLgnHuP9wC/Y/GqZwwhjAgb4PJ/QDGmFB0S6XrqB2mJiMStzvudGTnS1u37V1FqQZZ
 uAMfsASu/+9sAz+rfCasEm9RhOzEnLAKn8fhw6Y+rFW/mRevfuKfslR3vNOHfM7Hz7Ftr4BjM
 jWaaxVxxBEbKVCCDGeFoX50kUkA29Glu+xPYwwaJxmSDY6VqC8gdl6AkQVyWgVNnDI3oBAS6a
 kLL+CYfkCLK0JRnX5zZtEuw+YhCrMZEREEMoBoUEuekF6zGZt+JT6UAeFbLEqP0+CQhBH05iS
 /+yktQYcnzbjnpeThKnOLvBH6XxBmYAFtJHOatMYEpRESTiaRMqD2EWh46Ph+IK95IfzAHc7Q
 xZSdte6UJHFgX2o76Xi/Iy+nb9j+PzAqgAVR1Bb+LGDFUUht2xShts4bf8jxjTbDNZscb5uC5
 E73QtEQRfRariHpgjusIbFCV+x1UT1eZdq3vuFKwwvxa69P31l3yk1cOadopmloqsvBgyQarn
 b5z5J0Hwv9W6NMvU+uLFF4OOFZ+ElQg54rhacvSgmA0/Y9GOWPvypS0ejB9bQjaKIyMVqLy7L
 FhwQWH39WbCH9CXoS5N4lYpbZZ0LDEL5Uyl+PyDWbiGA2RX1ImBOl73ywN1LRrJ2wpvv0aE0s
 0a8sW280BGRfuUrMhIXa8d/6mY8ltADRRCpwEiYdGZiYMFUU9ehOZl+gKw0Z3P3WTpMlUMT9E
 8+miFt1d3rMIDsBJCyUl0Qkbna+tIHutXz3Fq6FIK+3Rmsg+xWQwPTdMSJblfoh6jfLDDodwl
 b05aq7IKeDcQBiEecEcJqc/7SqtlufMNOTCwAIaIBHE7yrhTDYhxanknUGYCfd8JUrpmZlQh5
 BcN2l3SIz9rFrEHADyp+OjJ3cyzv/sDM0Jq925Zmda/ZCGji1QRxh3rIx4KnedCFUwGNCCleU
 N+meLqdvJNP0S9pXTlJMJQmqSMHfe3POXpF7b4FOwmlbUVEhjj7h+xy+iYJnrEsXKsW1DeC5f
 OCKv0dWwMH10wOcB4Pkru7qjFMD/Rx7s1zvEy4oKSwrsO1gJD+hzIP6o04yP+tbDiBhErCjDP
 52gM4PCMxFfon11eW0WhVp4hDPDk6GRbNdvZ9fCl9RPBekZw45CoCc9fg==
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
Cc: linux-fbdev@vger.kernel.org,
 syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shigeru,

On 8/18/22 20:13, Shigeru Yoshida wrote:
> fbcon_do_set_font() calls vc_resize() when font size is changed.
> However, if if vc_resize() failed, current implementation doesn't
> revert changes for font size, and this causes inconsistent state.
>
> syzbot reported unable to handle page fault due to this issue [1].
> syzbot's repro uses fault injection which cause failure for memory
> allocation, so vc_resize() failed.
>
> This patch fixes this issue by properly revert changes for font
> related date when vc_resize() failed.
>
> Link: https://syzkaller.appspot.com/bug?id=3D3443d3a1fa6d964dd7310a0cb16=
96d165a3e07c4 [1]
> Reported-by: syzbot+a168dbeaaa7778273c1b@syzkaller.appspotmail.com
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>

applied.

Thank you!
Helge

> ---
>  drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index cf9ac4da0a82..825b012debe7 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2401,15 +2401,21 @@ static int fbcon_do_set_font(struct vc_data *vc,=
 int w, int h, int charcount,
>  	struct fb_info *info =3D fbcon_info_from_console(vc->vc_num);
>  	struct fbcon_ops *ops =3D info->fbcon_par;
>  	struct fbcon_display *p =3D &fb_display[vc->vc_num];
> -	int resize;
> +	int resize, ret, old_userfont, old_width, old_height, old_charcount;
>  	char *old_data =3D NULL;
>
>  	resize =3D (w !=3D vc->vc_font.width) || (h !=3D vc->vc_font.height);
>  	if (p->userfont)
>  		old_data =3D vc->vc_font.data;
>  	vc->vc_font.data =3D (void *)(p->fontdata =3D data);
> +	old_userfont =3D p->userfont;
>  	if ((p->userfont =3D userfont))
>  		REFCOUNT(data)++;
> +
> +	old_width =3D vc->vc_font.width;
> +	old_height =3D vc->vc_font.height;
> +	old_charcount =3D vc->vc_font.charcount;
> +
>  	vc->vc_font.width =3D w;
>  	vc->vc_font.height =3D h;
>  	vc->vc_font.charcount =3D charcount;
> @@ -2425,7 +2431,9 @@ static int fbcon_do_set_font(struct vc_data *vc, i=
nt w, int h, int charcount,
>  		rows =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>  		cols /=3D w;
>  		rows /=3D h;
> -		vc_resize(vc, cols, rows);
> +		ret =3D vc_resize(vc, cols, rows);
> +		if (ret)
> +			goto err_out;
>  	} else if (con_is_visible(vc)
>  		   && vc->vc_mode =3D=3D KD_TEXT) {
>  		fbcon_clear_margins(vc, 0);
> @@ -2435,6 +2443,21 @@ static int fbcon_do_set_font(struct vc_data *vc, =
int w, int h, int charcount,
>  	if (old_data && (--REFCOUNT(old_data) =3D=3D 0))
>  		kfree(old_data - FONT_EXTRA_WORDS * sizeof(int));
>  	return 0;
> +
> +err_out:
> +	p->fontdata =3D old_data;
> +	vc->vc_font.data =3D (void *)old_data;
> +
> +	if (userfont) {
> +		p->userfont =3D old_userfont;
> +		REFCOUNT(data)--;
> +	}
> +
> +	vc->vc_font.width =3D old_width;
> +	vc->vc_font.height =3D old_height;
> +	vc->vc_font.charcount =3D old_charcount;
> +
> +	return ret;
>  }
>
>  /*

