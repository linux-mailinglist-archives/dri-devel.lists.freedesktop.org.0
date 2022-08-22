Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4159C9A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472CF14B595;
	Mon, 22 Aug 2022 20:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF730A1814
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661198965;
 bh=vM8dIaRuq/YyehZA7pwQXyRcVb/iqx4/5RXN88g/5yk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FHe5bxd/m91Xqz8hJnf4R/2aI49TeCdh6y1KyycViLZI5eVSfrUZzNbHSS3np9Pzp
 z5ie0nYjWxJr8rJRpG4giWYTyAbqe2uget3xw8N1hyIg0drbCEiAMPVT4NvgsMTFJ0
 Cr6gTxtplVEbcFIThwf2cPgLCQIk6uf5Lml0jhh0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.190.222]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0NU-1pAFrB00Vc-00kLGk; Mon, 22
 Aug 2022 22:09:25 +0200
Message-ID: <5fcc858a-c9f2-0a9c-ded9-5df2d794e3be@gmx.de>
Date: Mon, 22 Aug 2022 22:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] fbcon: Destroy mutex on freeing struct fb_info
Content-Language: en-US
To: Shigeru Yoshida <syoshida@redhat.com>
References: <20220821111731.247446-1-syoshida@redhat.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220821111731.247446-1-syoshida@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wzAQ+Bzi2y+wnwtxdQ3Yh8A8Ue1WmeKBSk3OxvudWmIMPj8FvMF
 1Or2PMxUF4oW3Y95M2RWK56cDZk0IE7uyI7o3VlNKI9/waB0hLyJEuflAcvJaln/BPjJe/J
 EYFrUAnhShD2IV+2ylG6f7BQIvP1zN5uLpnWPqTU7vTKzd/Da9dKSTSCCXAt5BKplTFNAvd
 axHr1aMdYjt5YesvTzqHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RdCxWpvtXEE=:9E5cH3on88rnyv/vob6GXh
 RG7v94IoM1Y4H1Cv+c8XldzzygqbKr3N6xkqxYN6ZXBjP01cdyO9PJgdvA+l0Ws2CvfgB86Bf
 leNTbh1i9wx72zMF4A4vg6qYewdxREdGrxUsHvEALvNYmiVi08LpEW57QLN4cx6kXFTt32mxx
 trK6LDJPWoUDOrTtS0gVopd1vNTpFLWv4UuTiZsDQ/6g7QloiiwBjpWwewoM+0krD2tt+emiO
 dQs5Ik6HiJAkKZ0PE0LC5TrOEDqPA6XRBGF6jkBxKDA7BFSTbPuS0vjgBX/RL9TUgbhRx7zfG
 JeoKIZi3fgSiAMFXuMdWRt/GO3KAixGOeKKprN9DkW7tMJuyGAarliY4ulTNT+tsrfv9qUvkk
 6AQEO1VykNXoCL0IsScXaA/qbfGGMFcqAy5S9BDHaj80lah3frd+MUScZp+l+LMXUILqwChs7
 5Ywfg2gTxb4+8cXbDs7qXehX/yHbY7xZieOrFGgQpx5kZoCe/Ny0YsVFb99cTN/on69r9bPV2
 Wp8zyFSJgj+PmnPid/vbgi2j0eOKDMyxoIZTIE5gOItWhT1QImBHnRGeuQ67G3jq9K9yNhvM8
 v5EA1aJl/PlWVCmohnUX2BByfGm0T7gvK4UhDSSwcway2/IJE0uW97RAlGsPerH0IlIRS/pLh
 C3vVHiI8R9TKllvssRkPIL+l5Qwwu0PlLS5KbmvV1J5TWNYSReq1CnHa/lMxJ/B1mu2CInI62
 Bf2an6VqkiqDH+qQhjdAyDy5EF90XpS7Ama+ACuU0rzmlzcNyVz9k+/DYdXDWMMf16Pk7fgx9
 bqaP6WQ/f6o+GkS5F7xfnjXv/lL8OW4hyJ4Oypz4SNxE9YRd2LzJdv1LhysLzSgd0n/3sHg+H
 SWc8z0zcqwpDfxKVuVDag0aa5pLa+Bh3R9T6ypwzeLwcdzDb7zDWtLaFJRNQb3KPBQCapZJvD
 TRRAFunscZx7qAtU+ZpqDN6EazMdAKTEi3lsqCci1aQCxEYtpP0ew3ZTkQY1wjCrzB/6AytFm
 x1NKtnTJkAl5ySQ2YQPZY3R6GXe61JMS4R869JV0hOAjQ9JKMRCg34WYiunn5JNHCMWkVlUke
 NuUJBSZQPhoQKx9Pj19ToKNoXb8Y0APLdAxoWgoNc3CeouIJ6j7dGHXmQ==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/21/22 13:17, Shigeru Yoshida wrote:
> It's needed to destroy bl_curve_mutex on freeing struct fb_info since
> the mutex is embedded in the structure and initialized when it's
> allocated.
>
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>

applied.
Thanks,
Helge

> ---
>  drivers/video/fbdev/core/fbsysfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/co=
re/fbsysfs.c
> index c2a60b187467..4d7f63892dcc 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -84,6 +84,10 @@ void framebuffer_release(struct fb_info *info)
>  	if (WARN_ON(refcount_read(&info->count)))
>  		return;
>
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +	mutex_destroy(&info->bl_curve_mutex);
> +#endif
> +
>  	kfree(info->apertures);
>  	kfree(info);
>  }

