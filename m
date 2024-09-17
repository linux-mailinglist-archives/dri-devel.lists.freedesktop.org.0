Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D58297AB71
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 08:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F63710E0AD;
	Tue, 17 Sep 2024 06:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="uIYI4NMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87BA10E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 06:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1726554638; x=1727159438; i=deller@gmx.de;
 bh=5TLILeYK7dj0Gote54iZg0/ILywdXSa/p5ih0d2o62s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uIYI4NMUP9qj2lvNZEuNd7dm2OgbOHMJj1NWx4ffhVg4RcGB6ih7vsh7Hl1pNgKO
 qw0qVE7mCqRaxLrsmsK2Ed3UKHKzAFcGKB17REXitEmAh4osoq/TFIuWEOR1YpxY1
 fOjqtRqgM6I2x1HOpzNB3Xq9lTb5s7Hp8KEGzPIqZProhNypzYKyKwHRG3K3au/BG
 jYCrj2uA93Uwi5KbvdMLbnmNQIXrvoAlPzHTkDsG4gFu2wGuEihK+UVmn6SsDwqYE
 VRitPnC51867sFIJIxQ4W2xtQ0dJRg2iDeXdZzMjXqw7ERMhFOsd162eLb1x2dSE7
 jP9LywxwzZfatugP9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNp7-1s7BoJ136r-00ZCbn; Tue, 17
 Sep 2024 08:25:18 +0200
Message-ID: <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de>
Date: Tue, 17 Sep 2024 08:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
To: Qianqiang Liu <qianqiang.liu@163.com>, aniel@ffwll.ch,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
References: <20240916011027.303875-1-qianqiang.liu@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240916011027.303875-1-qianqiang.liu@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kx4tRjraiBOPk4Cb2steVh2HSmGc/C+9UtsC/P8V8KGdgnwqao1
 JC9X4mQ5sSrDpUdxrX0hTPcnLRN4VV6EF39E7FWEYIqjlGwclRz0TVHRi3gNwZYkGvWILpd
 Jt+JTO10DPHfEyujHYgQH8yiGD07flbfh1UYl/H7HBnPYmkpmSD0tZHAWyAs7LRoJNMxv/n
 47dY7LUsuG+mIzZK2+M5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ufis6giMkyI=;zweBUDrvd4Jx7bXZHp3y5uboQCG
 ht0+FQY78lkyCWV6hpfwOIbvLm27A2GaG5pD6yvbebDjtQ4bcSo9Bu8RGtqQiBYHXknMGj4ol
 1w1Bb6/tPoQ7vvm98KYyuBe/KCL/g+woIjnzlT8R5uTNdeWGsyufXG/3TeDTtIgn8VPMWNFXs
 NXmbt1/7cQ7WX5AIqBxtIjCmLd0ECLfyNZVZbcu9CLaeEjL00gk1Z6nRuX3NzEmdqiqORWu1h
 m6AENMONXuuiASjqDTgHN+0u71+WBaEn7sSaB2vHQ+pvy32kh1Qd7L4c85UtH7UJIkIofEEin
 CeDD4KiqchJydjzgp7WtjgtckX3KQpb0jzzpltfcRqcW4kGAe2Or0rYw+uX4JOpyx0gpiaKzm
 LZuIWN5gsjYHw9iHHTMW1LBTdZppxOWhANwseWy7mav7yqqYyhdlhu5fiOFdHHh+a/J62+CBo
 tqgaHtOP+r050INhpq5WW1+GQGZxdPom3ldatExUGqHKJv1IKgm2bfsURsTwjV2h48rtXM+jo
 X26tfb+OhFR9X3Hgw+Kd+mlMSf+UyVTtGk3Lkcgk4Kg6kimvo+cCo21l5LTvDU7fFRnkOKdKM
 AzuYcusnrnkGmc9Sj7uRH4AZhagbNte36oqsGnur4ThmL5iCEjs9O5iAIg2or7egUOiuUfOVg
 dxsaHPzDfofV34IHrKT0MoPnIeLnjhZPv4lMXNR1DCllK0Y29GYEOgS4+9j35ObcCnxxMuhID
 jkJPOBG5fjuKRzoWZpxBf3p3cp3nyZLNy3eUySYr+tKk+ChD/Mi0R3zm6Od57Lly/h7RP9PoH
 NqJs/h7hQrmjEicPeprM/F2A==
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

On 9/16/24 03:10, Qianqiang Liu wrote:
> syzbot has found a NULL pointer dereference bug in fbcon [1].
>
> This issue is caused by ops->putcs being a NULL pointer.
> We need to check the pointer before using it.
>
> [1] https://syzkaller.appspot.com/bug?extid=3D3d613ae53c031502687a
>
> Cc: stable@vger.kernel.org
> Reported-and-tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmai=
l.com
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 3f7333dca508..96c1262cc981 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1284,7 +1284,7 @@ static void fbcon_putcs(struct vc_data *vc, const =
u16 *s, unsigned int count,
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>   	struct fbcon_ops *ops =3D info->fbcon_par;
>
> -	if (!fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_inactive(vc, info) && ops->putcs)

I think this patch just hides the real problem.
How could putcs have become NULL ?

Helge

>   		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
>   			   get_color(vc, info, scr_readw(s), 1),
>   			   get_color(vc, info, scr_readw(s), 0));

