Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20616984A10
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339810E74F;
	Tue, 24 Sep 2024 16:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="s2P1Ro51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8455710E74F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727197163; x=1727801963; i=deller@gmx.de;
 bh=HkhAwijJTEsqKDQraXRrb3AtBYPqsnWPxfHpbs7SLyg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=s2P1Ro516MDVOIbryznggDNAGIBvTW8ngyC44vGtmyWKeUsHT8AM5CrCQV483gjc
 kFep84ZnMW4Fs1KcGyBvVrI5fib/x/AK97uBWDYInOeej2SE+CaIBMfz+7yYbVvyb
 voLIQgRD6IWyE3e8usgdnEvaKbnnD9rCbw5yr893qjbgUvp9/g33eKbyAohJVW65a
 gcxUemeMWFSZYVM6S/gPMC5H2uPu2l2Y2xxaio8KXnRhHUsSvaiFaW8DKSGO1GIBG
 UHyeP8d7INafQssD4CAP5oMp3YZ1tyCbpuSx59FEOPlPWEL22yDmmHtHkEEjZBUyx
 X67Tv5sB6oV+x4xFhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1rrenF318Y-014Qhc; Tue, 24
 Sep 2024 18:59:23 +0200
Message-ID: <1b1a2d3c-ed4a-4d9b-b87a-8d05f3d6592e@gmx.de>
Date: Tue, 24 Sep 2024 18:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbcon: Fix a NULL pointer dereference issue in
 fbcon_putcs
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
References: <20240916011027.303875-1-qianqiang.liu@163.com>
 <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de> <ZvLlEpIMQnJcJsla@thinkpad>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ZvLlEpIMQnJcJsla@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/4OJj5GQZKDc2YsiJJu7Qk4LEzuZA3rnyRbYnLmS8aAuwBpIZ6F
 kndz5WhgRpt98BKRw8KlEYC1Dm9DQYdzwVttyP6nX8OcIVnFaWoes7d/j64AJFLVW/QHhG2
 xnv6qEkwWeEkTQ3X+j4+E1MFAE1L17hoC95CY63dH5t3p6VbEv8QxwwCH5RnISL5PFoF9cp
 cjA3hqXhDKKgr1Qe83VSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3EUBHtEyex0=;PcGU7F3Z0lZnOAhisgg+CdyIMtf
 1LThAZw7cnAUqfMy8qZ86jgCpTWnMxq2mVyynHjfQkESelHdmd9rMn8wojIq5ypSKpyEOTHer
 TSNm2s2CrVcZNKRyvtKRioElHUBHqPqMadiNPGZBv87fIK+mj+aqgdx0vEt+mW5Ew6X2Oc76M
 CGI5hWenkJ89iyX4fluUOlvlqmz9dops0KUWiZiHCdaos5j8CBHBJDBsOXSxHTwhZ82oJagBG
 i0sspTc9SDL1UK9Q7WagemquCTFqhoOhpvdx/uh5xBvDjg2e7flWnae3CXxvYwXxYJ4V481Az
 S0BTx5Q6XUpZyg7GrUHJNPE0Cu9tdUfI12sIBAeQfo04Hx84hkBMudFCgxw2z4KlbJ8FQIcaV
 yfc7E59suzL+F3Ro6gyImzn/6DLdeTfkT4q0kONO819xXBQVDXeU/9EjI6DsoVLYVUlE7pzcs
 rZzf3pMvzS+S/Jdz3Jg1JH0EFSCiu4wOaPrphtF5CYkdbh6v8yOwHKeQ7VEsIIT73luy1VRhU
 /+vMWOGnl8FdmOqEtfbCcPqlwi8LmMJVsK94dytdju4b/xUbr6awgbOJSeoSOC4grPP1Rl3bX
 M53xhNqKAQp9ErWV7IU0YTvFjdRNY613ehvYXT5H8709AfGxr4MtCKZiz+u3YWpwNNmiSEvSk
 gd/p73qxKY0apj3pVgGq7XnZJRzBBzPccaojFYrf/gYH0j67BDfD1OfhZHWnRBXYwiHCJipAJ
 ubm9SLMTP9hVCAg8t+0dtRnT2OLJGevQ19Ls9jiwqqdcjKEYVxSfN5cc9QJXsJJ5wGbI+7v78
 HDle35I2OfXSmTllIaSQ7T4g==
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

Hi Qianqiang,

On 9/24/24 18:13, Qianqiang Liu wrote:
> syzbot has found a NULL pointer dereference bug in fbcon.
>
> This issue is caused by ops->putcs being a NULL pointer.
> We need to ensure it is initialized properly.
>
> Reported-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3d613ae53c031502687a
> Tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>   Changes since v1:
>   - Initialize ops->putcs by calling set_blitting_type()

Thanks a lot tracking this issue down!

At first sight your patch seems correct.
But could you please document in the patch description what exactly (and w=
hy)
something goes wrong and how your patch fixes it?
E.g. why was opt->putcs missed to be initialized even earlier and why does
it need initialization now?

You did a good work in producing a reduced testcase.
If it's quite small, it's a good idea to even include it in the
commit message?

Helge

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

