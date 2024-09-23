Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223E97F1D7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 23:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE03E10E49A;
	Mon, 23 Sep 2024 21:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="o6qltcox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FD010E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727125497; x=1727730297; i=deller@gmx.de;
 bh=Zg7zejr5d0xWbMlqGLzyB5/eVme1Xvx5JMlwSQnhLvs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=o6qltcoxYZqGmkz+8KQM9cUk6oyd8ozLrjNSbbPKS9wOg9k9IT0caopl2SRJ3Aoi
 Bl1SPyPMqz+AcBGSLdwoAyswkN2lU5w2NVSvBiI/p3y++3opzRjlsr0yDkhfye731
 h+Tknd3pam5RLLkO7p5C64Ijn3vQCYm8P+7/HQTEIlziLBcnW0C5lXyN/jJxhx+Nm
 fE3LmF+n1dVs/dcjg/84ZNhMPwKYdIgitBmgIfjGP0Fx6hcQ0gSPXKMQss6OEgRQc
 nXrlzgqhmNawAP+pSr+DgK4lowS+7m2YLEq3HNVNB26gLvUn+2RgIj5bsAGtP1yzm
 xEKseh/k83YBCWDbLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1sKKEe0RL3-00lWBO; Mon, 23
 Sep 2024 23:04:57 +0200
Message-ID: <3e3fac51-ee46-462e-9418-095845b18ccb@gmx.de>
Date: Mon, 23 Sep 2024 23:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240923155749.30846-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zue2T6YBJGPRaN0yayvgBlKVOswZGaLJz7Bfnu/It2iHUSrwrwT
 xo/aNRrGnCgZCM+rwy4oAkRnZCnL9R/3DSgWudAKmY5xmIJfwa6/vCovSBXAlTCgOLSVCRZ
 GqcMBp4kjMWK7KzBJ2M03yFx7X0x1spTbiaqp5NAjb9VGOkO0n/dUncKo/WsN/cB0Vp7gBc
 xrl0JDoacDw2Eg4Yv/QeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mWupgij6poc=;+49d26/70b6kFAFGvlkcC+w8bVS
 ihfyjdlU+5DhQLaKHfOfe0DWg8dVHIciTX2uCn6WghHHU3H+ZRfRSrPe1quMEkvJEVgvtP2XZ
 Ys2WLActPL8NPLjibJkZ8aSA3i9GwrEWvEgZH4xLjIzZg+zsYQGfL56rn48U7xUP033v9DuCP
 i4XmLbLJpPHhDdia1shs/b7NhfSyQzhNBp4i0LwTsQXTQ6RLuk1XLL0+b6UbZKzFy8aORkDzm
 Wd8e21xAcCG0qiI2wlf64Ts5p22wcHp9DgCR5acCRXyoYROsIgYKVzJgSuF3lv/qABZi1E0ZL
 kkIfDb0RpgRvUomSjyzffx1U88u47OWjHyOJ23A9B4U0tW+QzLmJxVV4s2kKUnnnFjjRkR4mK
 kCs8mRCRApsuFX1kOyUSZ99AmMIP0dpffBoO58vGG4SLe8t2NpCKQagPqo1XOXtl+EMsaOBMb
 xWmVxfQEBC91YlirJI9NfXVgfTd6JabidQkKoUB4nhhrd+QfCjlZg5WzWaBM0xDLDrpbaXgzH
 uzZPhbcs7DE78Qejusg3OhCUHEy8CHA54M+VYm8TxmJMQ1Vwg1vPHebfa2GeTFDLwePkUtQey
 3hkom9qaUZhF+OvJEMgMbx9owkQmyxNzJxx4dSV+7IrBfnyMV7fZqPUrKukmZC5IGRfiM9yvU
 XL2gCyzfbWurPDNH/6CyWF2Bmu+a+jsnJGOzIOjej5rdT/L5/KC4htxRxQrJeQyTk9fudV8Et
 x4oCmPYsFAiGOb1Z320mwFzcV0693vgmIBemsMMJYgpTrdv4Uc7qqCLLba+iE/R1nHx2Ykt3T
 cU+fah1+uoTVzmqblTC53YMw==
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

On 9/23/24 17:57, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently setting cursor_blink attribute to 0 before any fb
> devices are around does absolutely nothing. When fb devices appear
> and fbcon becomes active the cursor starts blinking. Fix the problem
> by recoding the desired state of the attribute even if no fb devices
> are present at the time.
>
> Also adjust the show() method such that it shows the current
> state of the attribute even when no fb devices are in use.
>
> Note that store_cursor_blink() is still a bit dodgy:
> - seems to be missing some of the other checks that we do
>    elsewhere when deciding whether the cursor should be
>    blinking or not
> - when set to 0 when the cursor is currently invisible due
>    to blinking, the cursor will remains invisible. We should
>    either explicitly make it visible here, or wait until the
>    full blink cycle has finished.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 34 +++++++-------------------------
>   1 file changed, 7 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 2e093535884b..8936fa79b9e0 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -3217,26 +3217,7 @@ static ssize_t show_rotate(struct device *device,
>   static ssize_t show_cursor_blink(struct device *device,
>   				 struct device_attribute *attr, char *buf)
>   {
> -	struct fb_info *info;
> -	struct fbcon_ops *ops;
> -	int idx, blink =3D -1;
> -
> -	console_lock();
> -	idx =3D con2fb_map[fg_console];
> -
> -	if (idx =3D=3D -1 || fbcon_registered_fb[idx] =3D=3D NULL)
> -		goto err;
> -
> -	info =3D fbcon_registered_fb[idx];
> -	ops =3D info->fbcon_par;
> -
> -	if (!ops)
> -		goto err;
> -
> -	blink =3D delayed_work_pending(&ops->cursor_work);
> -err:
> -	console_unlock();
> -	return sysfs_emit(buf, "%d\n", blink);
> +	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);

I might be wrong and mix up things, but I think the previous code allowed
to show/set the blink value *per* registered framebuffer console,
while now you generally enable/disable blinking for all
framebuffer drivers at once?
Just thinking of a multiseat setup with different fb drivers
attached to different monitors with own mouse/keyboards...?!?


>   }
>
>   static ssize_t store_cursor_blink(struct device *device,
> @@ -3247,9 +3228,13 @@ static ssize_t store_cursor_blink(struct device *=
device,
>   	int blink, idx;
>   	char **last =3D NULL;
>
> +	blink =3D simple_strtoul(buf, last, 0);
> +
>   	console_lock();
>   	idx =3D con2fb_map[fg_console];
>
> +	fbcon_cursor_noblink =3D !blink;
> +
>   	if (idx =3D=3D -1 || fbcon_registered_fb[idx] =3D=3D NULL)
>   		goto err;
>
> @@ -3258,15 +3243,10 @@ static ssize_t store_cursor_blink(struct device =
*device,
>   	if (!info->fbcon_par)
>   		goto err;
>
> -	blink =3D simple_strtoul(buf, last, 0);
> -
> -	if (blink) {
> -		fbcon_cursor_noblink =3D 0;
> +	if (blink)
>   		fbcon_add_cursor_work(info);
> -	} else {
> -		fbcon_cursor_noblink =3D 1;
> +	else
>   		fbcon_del_cursor_work(info);
> -	}
>
>   err:
>   	console_unlock();

