Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9A5E92E2
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 13:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8650410E166;
	Sun, 25 Sep 2022 11:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330A510E15C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664107067;
 bh=2acJ5q54HwjpL+Cam55Jrx3R3x2p2oTERxijPz0cUl4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=gsIYSjTFNjmflB/F04z1XhpVqsToLXVKER98TXAcUJl82DjXq1eJQdaQurCd/e2YM
 spFLwYkl9lsEEbsXWTfwmbvGdHtyEop9cfkuXN2jOlNLBG32lEPGyLHMX5vjkfA+Rr
 xJbP4Zqtfb6Gm8iOo2DbKlmsyH2lv5aSNqIcT3R4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQe5u-1orDrA3PGg-00NmJO; Sun, 25
 Sep 2022 13:57:46 +0200
Message-ID: <dcccfc86-1bfe-e37a-fa6f-28a159e35f14@gmx.de>
Date: Sun, 25 Sep 2022 13:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Content-Language: en-US
To: Hyunwoo Kim <imv4bel@gmail.com>, steve.glendinning@shawell.net
References: <20220925110329.GA380036@ubuntu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220925110329.GA380036@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Pvq6jJ4u17R1dbuy5/Xo1j11QgOouG6DpEYQLOIaV8lJZFs4KK
 n2txJ5rX2WkGwLsLOWdBHldyCiH1XO8fMoGPBN3r5riJGWjx/IH2PpE9Ydu6vNyb8kgY78a
 iXlnfrVapKoazZY5BGM1m0FINKx5+wyDSQtoTBhICL+qnxHSNbM5n9tgVPhzFSH8Ne9Tr7I
 ULMwonIqAH8XAEyXDL8WQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xLuj2YrM9CM=:HANclgzyl3Y1jSgQqVGitu
 OEBbrh9CuzoTDlp5RNfmVLVvqByJNUGLKcoJ+iC5elKyDincFbwZllWvgE/q+Ai9O1qJaJ2RM
 5oDi1Dk2LqPHaTQzhGdbew6HRuVH7YidDjBmwrUJGzs3ocqk3lfjqHj2rvGEINJm8w6HeKJ+j
 IIjm+xQUuLTAxoC3+WuP9SuYjGBg4rO59s98QcGIhEXSG0MiXr/pf+L0Gg28tmLkVA+J7hINI
 Oh5I6Wm3lPdzV/gKfk54yjEH9l40PkNaqD/lr+1TWOTGyBTWymL7AaoCwrSZxFFcsQipC5Tox
 uCOVo4gP5oLLxnNG3XFYlKcvZ2CjhXZaCrlLOJTJIjqsLLKo3r6vmSKjNRGe3fiY7XYKfSTg9
 RBYkR0eSvq384HoropoPVxyKjU78DFWLPPjumDpp9kFpzInpNJV0wR6DpO5Nu1pV7BmvxrvCD
 1LMyFUrot0k6ur+KCowA5YpicVPVI+blMGbV6t2xIAzeHHQ3yn6RZAejw9ukhPE3vls++1FPF
 zWsfx45SG/R6xkIFFoAqA1orUrBoNBeaBMgq6VhFaoepwNifnDVoLbW8muW/yxX7N4a73OOze
 MkzRP9dtMov6Ez6QpE6gTVjqLkAlN3uq9XMB9/fN/cUljyB/EqjvuVY8Rll6H49GZ/K6W4ghE
 uufhfj1VGDPh+ijoKTorx1epy73hcUD3rNphi3Hy77UmJgekZAJpkUGHl4bNX8SVhDxirDyVF
 xGiRKIurr+tozGKU+IbXxOUp4j4d4D61DYGmIpi7s4C7AxcBb8Ff7xv2QmKE9QvUbuakhDeBs
 9aJEQIrK/c2PaKUfC/LDiuR5UiVVzkKqONRbLSvjNUCO7hmfXCG3UXv76D56g6OJ+e8MmAf01
 OV/E/PCc7wN0gap+xNb3yxEH8giDwfGp1RNQ1P4d1cZ0hODHzg0FQOqXE7EbaKPAyxB0Q1wwD
 EyJyTpBGF985K01viHKG7BXZnwWYRx7q1RAKjuraM7S75n+aQpJABD1jLIeXERg7+FwAfcLpN
 nYi4Y5xArcnmuY0Cqqm4QJHSM80ZOGTPfxtZ5KhAqlOLr1ULZj+eGKALoE46Cc7n5F6qbEkrc
 n2xkKRV8RKs2JmapKhe6J65N58CiI5OSAzco5+AQnitP6XHbLR55J4bMTajtDIA07VOVeDtdQ
 lZP6cikdi4rduYgQc46kogvwND
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

On 9/25/22 13:03, Hyunwoo Kim wrote:
> A race condition may occur if the user physically removes the
> USB device while calling open() for this device node.
>
> This is a race condition between the ufx_ops_open() function and
> the ufx_usb_disconnect() function, which may eventually result in UAF.
>
> So, add a mutex to the ufx_ops_open() and ufx_usb_disconnect() functions
> to avoid race contidion of krefs.
>
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>   drivers/video/fbdev/smscufx.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx=
.c
> index d7aa5511c361..a4378a7241f7 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -1065,6 +1067,8 @@ static int ufx_ops_open(struct fb_info *info, int =
user)
>   {
>   	struct ufx_data *dev =3D info->par;
>
> +	mutex_lock(&disconnect_mutex);
> +

The next few lines show:
         if (user =3D=3D 0 && !console)
                 return -EBUSY;

in this case this function exits with the mutex held.

Please check all possible exit paths and unlock the mutex
where necessary.

Helge
