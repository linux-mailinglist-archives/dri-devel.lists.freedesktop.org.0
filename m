Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE5F648FB5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 17:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5ED10E0EE;
	Sat, 10 Dec 2022 16:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E9510E0EE
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670689133; bh=DNwT0pDG15fhf7JgzCPELQYBdUjwCfMZCEIEtmQvfWw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=JEgq4u+/ChQhNRCvFSoghycE3Fz0QlneiZmL6pS7tpBNzuNM+Q7wfdoRqYSLRrdgZ
 gdVp1bf37ntGUBjeUu74UReNZVN6hTEPWSfz1ZBqTFd0jjB4cmgdKvWvfydWeWmwaa
 0fRyVmGNLNnH9M7smO98JMTCzUJmH65i5cWm6zteeo/IVEnd2nJSrwYDkYmipX4V0b
 +Wcca5El2083vf9SmLPePoG66a+buuzVuJH5uDM2llF3vJR2tNO9Rebm06QHUdlfjx
 L1sj4Pv1RzM4zhznvOjvEOMum6AlHnpEhs38kvg1yLfrt/3rDLdTubJTIaKF3wvzWJ
 z92n2MlQUXc0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.157.120]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1oR7BG0j3b-00eggV; Sat, 10
 Dec 2022 17:18:53 +0100
Message-ID: <8a045252-f169-6d61-9c52-860f8a9d0b00@gmx.de>
Date: Sat, 10 Dec 2022 17:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] fbdev: fbcon: release buffer when fbcon_do_set_font()
 failed
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel@ffwll.ch>, Shigeru Yoshida <syoshida@redhat.com>
References: <000000000000e2efc305ef0d341f@google.com>
 <d37c0147-3605-a876-9b85-16bcbc05eaa6@I-love.SAKURA.ne.jp>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <d37c0147-3605-a876-9b85-16bcbc05eaa6@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cnReBNXf5h54kJPIlIM8GBaEiCqVaNHvFp6qNKQdfaMRNrI753i
 wBAjZ/XbMArCtfnJZxdcZbdAz5A1h0c0qy7PuncWVXSlpHZ4aRDRAbla0+ot7Aqiu8V9gOQ
 Cb8LyU5BatapjK8B3/sPxLxAGg6O1bVkd451HqaxtXVATnATmBaCtcjOYIygCJCW0QeGiBC
 1sgs8VKWWTneyL0PBg5QQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:awP5owRdsu0=;vbkz7Bb22iE4yZpNRKZMEoZKEsC
 WTs6by9LVoq/7I9XWrHnjAMxen3GcGSAcXnFg/S244fzUdWFQuNGBU59qlKd1n21lME3sgP5V
 zUzrWdYVuGai+mAPoapk+kjwaPrXFIBUYS+LoyVZmqaTiz3ZzKNmH9LWZ0dXmRXmOpnLO4lNy
 pRhrm4YtreVrvX4gPuV0cekSB3y/dTkmHE1R+U16ro0GP2xTGlFfwiFr6Jz5jh76d0Q0qh3lT
 otCTU2Fc0vqONJaVF8XauPIJyIsab/Xd9yaY+PKydF8CguWU6X/aM4B3NRyia0amx8gqWRPsv
 MCgMr0sv1/FCSGyXcqOmD7jwwRhp8NuIBDt6yvIhaZYLemgX9NSV0IHUvZPgXS+iV+Z8iw+OR
 7hNJy5S6G48lqqwTGQO5fL5Lv43EGPNcgF3PSJU0/JaaZ8kFLokKQUMxcKmtpd4R5s6U6rLOQ
 uA+aP8fEjoAz0Db0Jn07wzoIEa/5IrwCYtiroonj6Jyf1I1Xc8Z6R2eqhnWDdVgBOOdCuCCnD
 EBvbGlwIszlOT4+7eNbWXQ83rHprBUvuLajLpeiVpprCHVPJmnnr7bXYYSU62fUNJf3KnhXjm
 TLaZS6ItY5cBYq7Fwaza8gcMLS1xNa6mazxhYhvSFXuk1vypnbCizlPOxgBHie9hV+jqmd1wY
 5ODI0/TLLFlT74LtlRtu8bB5yDXNd2gCjOFBZt4xD9TCWruqEVtjBiBuodHGUvrTykV/xsuWY
 4Siu8ZoVUZqXt1nGR9mFmLNFmh7p4o6uAm4qz5+3zdsKZ++s4q+v/eM0PkgwGdsLTPfMYJZbs
 ddKos0o/QzWRjtXwWJM+dyFk18GcahqhENC7EeyHtzf9alfoPbEGsvELlxpYtheEaBSBXSmLW
 69IJIFHCUb41oM58G+hK416UjGntYptRj6+3XHtMungewun5OQh6Zw8e9vmxRuoXmfCVQhiqG
 zxTNAK65X6SnVuDDioBYYqYbKGg=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/22 23:10, Tetsuo Handa wrote:
> syzbot is reporting memory leak at fbcon_do_set_font() [1], for
> commit a5a923038d70 ("fbdev: fbcon: Properly revert changes when
> vc_resize() failed") missed that the buffer might be newly allocated
> by fbcon_set_font().
>
> Link: https://syzkaller.appspot.com/bug?extid=3D25bdb7b1703639abd498 [1]
> Reported-by: syzbot <syzbot+25bdb7b1703639abd498@syzkaller.appspotmail.c=
om>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Tested-by: syzbot <syzbot+25bdb7b1703639abd498@syzkaller.appspotmail.com=
>
> Fixes: a5a923038d70 ("fbdev: fbcon: Properly revert changes when vc_resi=
ze() failed")

applied.
Thanks!

Helge

> ---
>   drivers/video/fbdev/core/fbcon.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 098b62f7b701..8363f3b2b452 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2450,7 +2450,8 @@ static int fbcon_do_set_font(struct vc_data *vc, i=
nt w, int h, int charcount,
>
>   	if (userfont) {
>   		p->userfont =3D old_userfont;
> -		REFCOUNT(data)--;
> +		if (--REFCOUNT(data) =3D=3D 0)
> +			kfree(data - FONT_EXTRA_WORDS * sizeof(int));
>   	}
>
>   	vc->vc_font.width =3D old_width;

