Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49458C21C91
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5E110E96F;
	Thu, 30 Oct 2025 18:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="QP+ykLgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519010E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761849191; x=1762453991; i=deller@gmx.de;
 bh=FDNbtyaVYy2CnbrelKQevFlAxKrUswda5JHWE21wBN4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QP+ykLgYWvV+8TrEri46TMgj/CM7koQj4cc4prafQIuKJhPQXKOxtfoBWMVRrGWw
 yPixkn8DzqpOF6gtfb/OZ9bMYb/Ov32sctPjOwUN/ZXVF0ge0NJEcEynlLIGKC9XT
 O6LVeVExa44BY84Zo54Y+6eEBTCAy/L+vs+CfEV9Vhye2Q8q3fOGsrALESTbbbKbn
 ovMcIntj2lbXge+Retlv72FtfB1A3lBxRalxaEtVi+EA+NPCsvyZV16yixlFhB7br
 jS1Ab7Qt6lgNkOhgMFcLnZL6WEmx+9ch2GQdmkJ7cMep2WkdaX2MHRFghSmGk2QQs
 q0lpXYO1M0W8y0jiUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.209]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1vHY8B3RJV-008f3z; Thu, 30
 Oct 2025 19:33:10 +0100
Message-ID: <69ecff9c-43e0-401d-8e43-f07165ef1322@gmx.de>
Date: Thu, 30 Oct 2025 19:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/vesafb: Use dev_* fn's instead printk.
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251028185021.2758401-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251028185021.2758401-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KQBUIT772EIXFUCxgvLzCdol9UL+YbbQZT+ZKC4kPdPFKQTYDq0
 2GZuha0hFg3vpXewD7TAD475nST87IUpvvgDdhaNH+MWpsu08j6dhLGmut8yZxvMXxGDFnu
 Qmml6jbpfkBfzJScuSALnaC45k987h6NfLUo7+CCwgHRqm4k564eLxqWENOyUsNN8uhmG7e
 xNJ16KkckiYiodjbql8Fg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vniWZ8+n+T4=;DxaZldCd16ZBincNZL+M2ygeJEr
 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
 0C36Q==
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

On 10/28/25 19:50, Javier Garcia wrote:
> - Family dev_* fn's will show device name, giving extra info to logs.
> - Delete the prefix `vesafb:` from msg strings, not needed now.
>=20
> [    0.981825] vesa-framebuffer vesa-framebuffer.0: scrolling: redraw
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>   drivers/video/fbdev/vesafb.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Thanks for your patch!
But please run "./scripts/checkpatch.pl" on it before sending...:


ERROR: space required after that ',' (ctx:VxV)
#33: FILE: drivers/video/fbdev/vesafb.c:336:
+       dev_info(&dev->dev,"mode is %dx%dx%d, linelength=3D%d, pages=3D%d\=
n",
                           ^

WARNING: line length of 105 exceeds 100 columns
#48: FILE: drivers/video/fbdev/vesafb.c:355:
+               dev_info(&dev->dev, "pmi: set display start =3D %p, set pa=
lette =3D %p\n",pmi_start,pmi_pal);

ERROR: space required after that ',' (ctx:VxV)
#48: FILE: drivers/video/fbdev/vesafb.c:355:
+               dev_info(&dev->dev, "pmi: set display start =3D %p, set pa=
lette =3D %p\n",pmi_start,pmi_pal);
                                                                          =
            ^

ERROR: space required after that ',' (ctx:VxV)
#48: FILE: drivers/video/fbdev/vesafb.c:355:
+               dev_info(&dev->dev, "pmi: set display start =3D %p, set pa=
lette =3D %p\n",pmi_start,pmi_pal);
                                                                          =
                      ^

total: 3 errors, 1 warnings, 88 lines checked
