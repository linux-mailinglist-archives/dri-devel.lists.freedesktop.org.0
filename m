Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C2A17EB3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 14:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3C910E582;
	Tue, 21 Jan 2025 13:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="hmUupzWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3B10E582
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1737465494; x=1738070294; i=deller@gmx.de;
 bh=KVXi3pFcH+/Jo9935EpgrcO7+KMk18ydSMp/44tPfN4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hmUupzWhXH+99mxKBULYP1VS7QA1icu2dSlE9g3rRH9fVSDiHYMfJI4mXyyGTpme
 ZTdz72UYqrrMKbAL1/IvZ143E/9nokl+9ujxNyNrkWkdCT50b8Osi0k/wsKwt+yHz
 t1VGnb4fK6uwmfuEjvX2VtnSBVhHbPfgghTFNglVTJhDt9zJcR5QtMOLPARLZgJRC
 0lP7jjEsz5zS5twzeYExUZqFrKDV2UJ7YPzvZjW+Ni2JmBqdcyZJ5qThsGVWeiQHW
 IPe8sMydalCpSV97MzwUPI+KIzP5oFg4alD1hT9p2eDdIEySJWkciYyWfKFaMQXfw
 Z60wo79U0fj+zXjgOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1tAnMI032q-00hmn3; Tue, 21
 Jan 2025 14:18:14 +0100
Message-ID: <1b34189e-ae44-44f1-a81a-76f0e02bab91@gmx.de>
Date: Tue, 21 Jan 2025 14:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/sh_mobile_lcdcfb: Use backlight helper
To: oushixiong1025@163.com
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250121064236.168236-1-oushixiong1025@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250121064236.168236-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w1Mzy/m1O+Dd7lTUxhManGYitC5HrOqEhQoxnzwJRD7v3AlrsMh
 d8K+JQyPG0Asd8hp5AOuiKxdF1B//KeYPzhT58K/y4vT9yBfFrndQ9iECJ2bUnTB7nwXeq8
 qwxxrAqOKKP8iGVbXnq8RrL2XeuZZ7zNY0teU7e7I8lcR3qNDcEp2Qwv6IqKOffFeqJUDiA
 /OI4N6gciJ+7edkEfZJCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gtl09Lhyddg=;R36Nn2KkukrVOS4cit+PlgJ0Xnq
 y7CB7EVsbVwxG3UGpXZ2xqEoNh7v2vjO7QrrYNZrNt7sf1Xkln1axX8DD7LnMDn0jNFm9N1wx
 ngoGd3/dvipKjMv0B6/3AQ1T6p/I3qfIJ6HOq1SBJnRcagqkG0vG3K+toQANFA0aMFnvM0ImG
 8IiwGm7C8S3YIF8OyEZDwBTQGIlosbv9DRWzwuGBrbyiSU0c38yAlponwD198CE+I73Pxmdox
 wsBIvijYNKJ2n0LvaDv91KTmg8K3HoiOqgrn/YlWu65pzcBHlyVZ6FP5TSyfW7xxIiMW56feB
 KDHzPoys/+sVKb8YUnLxaO/GPP9QTXWMmdww4SRu0ntLXkqahQVj2Xg25nKgdWv7N1vYxpwOF
 oREp8Q1afm+IttcawElREwuZq26/8q3u+NnQd+5CJC6dNMKbsEpAQWL/IjxR1jAm+JEgobGaW
 B+AIHtHbttkuzZtEqp6y8aAMwX5rco7i2xnaY+EzOONoLrKLJUpIAcEPrBA+h4gOiGHumJCzg
 vEb0kCvPorbYeBIO/rYZtgnqEx4YNT7+dqDBbA5tN2zuReYYb35uqF8qHEADCKmYVz0n4BtPc
 sWRlITFKUKakeGt+D5UblPpYw4Qwv4w5X1WOY+ppbF/nMmL+av6hLemJsFMz1bdTCRn0x8sXW
 9n/gjA6WdGzh+17jba1VOy+Hucn4xL0PkArI12VCSlj9/MBkx82IkPpZ3keMj3D5PJVLKW0iH
 zcCGLcV5zU3Jq7lx8qoO8pHdP+MWGsAduP/XsuPmtxW7h0YKBixhnPEnMgFkanYpNlnG8ZE43
 TXYp72420cHQYGMqSHJCacuCSCOFQFPfl5RDoeOAwUonFFRXMc49AA86FvAI04ZmC7D0717fv
 S0nyOts1faS/mx7417ZIUUSA/RK4ICRpQxK0r/lcVvnmKtAVPrBNfFa6ISQVhyNuGrZt8X3H8
 tR3tZxNOnPfc59ckyOF/DpvYxELbok/4dyd+gv6Z/z9hICSE85w3/IMpwWAXR+GQwVaGtuAnm
 wBxuEF9dbMlDqDoXbewAVnLsk/sA3R++uk3fYX32GDyILX7Vh3siZ6x0mpf05ucznNJdr3lfD
 bCj7qARniD9M28eNfRdoLtElByx5iVNqa6SpF1jBpX7iYE9ZqH5rk5h1LJa1eUYwysuX5mbkP
 lEngPJH6V8ivkkw8GCec0wuyO6FwzaVlGeTQxc995zWW1w8WPVbwGaUtYRvMNgKWSB7BjxIK5
 hbG+h3Ly9SqLectnVcAfqfS5nb7xJ4uNpGvAV03Ev3tJo37Lk87w9nrQOfjtQUqOW15AkizO3
 uviPedhatt64za9Ui4u5w+e2A==
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

On 1/21/25 07:42, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/video/fbdev/sh_mobile_lcdcfb.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

That patch did not apply any longer to git head.
I fixed it up manually and applied it to fbdev git tree.

Thanks!
Helge


>
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbde=
v/sh_mobile_lcdcfb.c
> index 6b37b188af31..69c9067eff88 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -2123,11 +2123,7 @@ sh_mobile_lcdc_channel_fb_init(struct sh_mobile_l=
cdc_chan *ch,
>   static int sh_mobile_lcdc_update_bl(struct backlight_device *bdev)
>   {
>   	struct sh_mobile_lcdc_chan *ch =3D bl_get_data(bdev);
> -	int brightness =3D bdev->props.brightness;
> -
> -	if (bdev->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bdev->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness =3D 0;
> +	int brightness =3D backlight_get_brightness(bdev);
>
>   	ch->bl_brightness =3D brightness;
>   	return ch->cfg->bl_info.set_brightness(brightness);

