Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2730975994
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 19:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55CD10E812;
	Wed, 11 Sep 2024 17:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="uOWoJovH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3A10E812
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1726076308; x=1726681108; i=deller@gmx.de;
 bh=Qhy9k2xtEcQS4WXvB5kAB9HrzDAfqIQg4cyJSLNvgIw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uOWoJovHO0PwCl/t6NszViYCwzoizCkBGVaOZepPBzBGz/X74hm8CIRQuc/elyQH
 BBpkX1layM/JYbhNatsZgz42x/TnzhUtpV5qfkOlEhPPHys/VkJPmTE6Jm137DYl6
 QA+nCA6ExKb4zrCQzvgAcbIwjtwsQr5DiCWmQo9oHcf5Ut0MOsGBbTfi0+c+9yEuA
 v++3xmQ82YJecqOjvm6zkh5A6W19lZD7zhz7+vOv80v1KSoDPty01gnVRhLA3hFlw
 3ZLGFVLt8sW2oCNEJdgQWpUVVrYezess2l4U43KTdVBLQAJq6NELMhUuIwlhNGhSi
 ygDDg/qKXw97wuXTyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzFr-1sWUo12IOv-00YVXu; Wed, 11
 Sep 2024 19:38:28 +0200
Message-ID: <7baab3f7-1185-473d-83a7-07ad49a4130a@gmx.de>
Date: Wed, 11 Sep 2024 19:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: pxafb: Fix use after free vulnerability in
 pxafb_driver Driver Due to Race Condition
To: Kaixin Wang <kxwang23@m.fudan.edu.cn>
Cc: 21210240012@m.fudan.edu.cn, 21302010073@m.fudan.edu.cn,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 laurent.pinchart@ideasonboard.com
References: <20240911142952.833223-1-kxwang23@m.fudan.edu.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240911142952.833223-1-kxwang23@m.fudan.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b/076N8l5mKvA6rGlpJwUtQfa7bjpxKRI0K+1CtW0NBLZoABanL
 gzKuY/7W/xm19/aa52igjIyyzatXEWfaeMpH30KFaLJtITdsmSPD1J4E9Aoes7OM2hYN07o
 5LGbmLbwWspSgZXpbFcxXpGevZu7dvlhAd9UfiOTmNoOT5nR3VPt41fbhaDM2+mHB1eK7L/
 dsLyrOuOAMy26tthdpQ5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9VSz81223XM=;1HqNObzETcvWvPnGGo5oqwhDhPl
 KlnIV0Qt3ivvcYOfLBJ6zV4MlRuWB3PgrqF6ILjzub6FUeGS6DfnO2o1k82xlrCL3Ll4VgJ2h
 lONxSKUQllsLDp6rrXObjZ/Oap+VPKF66FbEcpWG70ir4daC6eLt50J6iUG3LJWVdxQvxgaT2
 Y0Qa3IAJZ7LtskRCPAVRANSNi4xxI0v0ALEcciw2p1RRQfP6hwmg/fgZ85JTETH13r8UkY1Mn
 465tOtU6EdcCpmZqQCZPpLd1zAlXlmSNsQ1de7Uddv0Q26kHhlJTelN4S8s2FEpynIAGlpB8s
 UJEWLBeLkqS1MV7l+8iLzmJ4ZwcxackPlKcUtAq+chRZPjXOSOa/UdwEWTRyiovfTApTSW9Nd
 zLChc7VLzODj4+mKtDT5fpUw6q/crmu5ySYMN4QxbUsDssYL0hyDXFf30MmHxSmVjRCpQ8Jlt
 p8SoNBVfS1FBHjqlW39m8V3lIxuitQmtM0zFCcCIx7jdDFdj2jDea+GwHSgMNSmdZVf8NK2jc
 l9P4QlyRZ+Cu2VD+aEiyXz+sAMzn/3UTRMMHdqb5A2UcIEZK5rX/hp4pcbQR1ZWJ0FT4LoUoD
 afK2unhM6QHZYbE5KC8LxgO45QplWYtSWtSKNhy2u6VWEhRwYcTejr1ye/WR03uzpSRgYWO5O
 CZcL6er0zF3lV6IO04of8DLyzHEv2pJRZrY59fWeerrm4accZxug/gjest+Tspn+6fIN9ABsa
 +jhbGAETjiH+/ro6Ani2LMi1Du5WTCwP0bbtD0/V4KFvVuTTxuEZF4BLL7VvFBxipQwVs87HR
 NbpPTMVyfXQWpnxw3big5PGw==
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

On 9/11/24 16:29, Kaixin Wang wrote:
> In the pxafb_probe function, it calls the pxafb_init_fbinfo function,
> after which &fbi->task is associated with pxafb_task. Moreover,
> within this pxafb_init_fbinfo function, the pxafb_blank function
> within the &pxafb_ops struct is capable of scheduling work.
>
> If we remove the module which will call pxafb_remove to make cleanup,
> it will call unregister_framebuffer function which can call
> do_unregister_framebuffer to free fbi->fb through
> put_fb_info(fb_info), while the work mentioned above will be used.
> The sequence of operations that may lead to a UAF bug is as follows:
>
> CPU0                                                CPU1
>
>                                     | pxafb_task
> pxafb_remove                       |
> unregister_framebuffer(info)       |
> do_unregister_framebuffer(fb_info) |
> put_fb_info(fb_info)               |
> // free fbi->fb                    | set_ctrlr_state(fbi, state)
>                                     | __pxafb_lcd_power(fbi, 0)
>                                     | fbi->lcd_power(on, &fbi->fb.var)
>                                     | //use fbi->fb
>
> Fix it by ensuring that the work is canceled before proceeding
> with the cleanup in pxafb_remove.
>
> Note that only root user can remove the driver at runtime.
>
> Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
> ---
>   drivers/video/fbdev/pxafb.c | 1 +
>   1 file changed, 1 insertion(+)

I've added the patch to the fbdev git tree, but changed the title to:
"fbdev: pxafb: Fix possible use after free in pxafb_task()"

Thanks!
Helge

