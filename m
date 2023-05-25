Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7107D711757
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20D510E044;
	Thu, 25 May 2023 19:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02CE10E044
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1685042644; i=markus.elfring@web.de;
 bh=Sn9i0CKzMIwK5omSWmKW1nZGsT/UCNPDDqeDEaPN9eo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=G8O91UGoVsytO45XYiWggJ6kYz08HAB0oErKvEajW8ac1EwA8FxsH2YOchV1KAxFy
 jvi0/llhIQYKOsfIEXvaQ+3hEskK1L9CEoqOXsXMHnJh975UbJjx351NSQL1HZIJIz
 l8iGMY6+YXKQXhoJGHugVqxo0yYdPYZ8YqhkiiEqNnNM8v4Q2WxdSYxJz5PEcDwt+x
 NFwxVUB9i5G0sLfvNsIGLJN0ZWX5zg7QkFY2orGxhJ80FYQpw+HO9+cKMZz89KZNNC
 j/y7vrv1SxIWY0qDZa2j5sppDkkpGqAFthMHVywTvM5z5I/HF8dKZz+v4oVgEJDrPh
 k6Xd9TnRgxGJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MD5jv-1pt9lN0Hir-0096dF; Thu, 25
 May 2023 21:24:04 +0200
Message-ID: <d0f5e617-4319-37e9-9289-9f486d1061e0@web.de>
Date: Thu, 25 May 2023 21:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [1/4] fbdev: imsttfb: Fix error handling in init_imstt()
To: Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
 <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
 <1d7228fb-f1f8-364c-aa29-5719a9da1fc6@web.de>
 <446a2a2a-155b-1fe3-44f3-89033b80ad34@gmx.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <446a2a2a-155b-1fe3-44f3-89033b80ad34@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fH0wWYnhiEpH+9EtpG5472RkEcj8eQzAMlS7hzgXGfpOR57L+91
 Xtv5UitowKkbFuFBdi62VwfC7FrvmuDUF5rQZ9VNu1DCEYW1LZlHY6g4tcNWz6b3rxGKM5V
 ZBZhH2ukzaRCEmFAd0qRW5TZfK73HfrPdlUkKqc9bITfOqQe9hadTYT1A18M68XV/AZa37n
 WfYdIDVgdpVlOzKVGORtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q0UyGoA0bns=;ZHnkJSjR88eCL+tadRmu/H6emKG
 NQYPpsj5v4PCj42w9BCRrgL/XVHx6paT1fsUxhLJ84+JJ4g0OBhrVLguCS2sirzJvHZklZtTz
 WUa7qCj4xCoWLMrfxNZOHmoS2O/k5LkZxeVNaHzeq8EBDwtzlzScZgDT7ZIzpJHkFm/nt7NxL
 ubNivBY83sSEp/57YsnBFW2zCc+fMKf+7HrS9SFPysQGcn49mMHn75i0ZOiI5tcVlJ6nkcP0I
 0+tuse2C/3n+pu930efKu6d89MLrxnZh6UzFrdJ26W4Rk46awXaNxqEUgKOHVKCtmRzEoMaJv
 H7ThBsjr2Fc2lkBJLE/Ktk6evsF8AQOWEn4y7V48j0CjWcD2D4ujHKzVlj+i0JvpiLjJY7XnF
 D8DMJKU7ERin6OuQGS8Av/9sHBRKKYEh/kMEP7jvdMLIAQNSmSejFM1qbnbwGPNQLGbocJ0Gc
 HKULwcf00VG8SzXS04zmKGRSHRWQqVht6h41t/sogKgpsoR2ZzRt3zSrX9JUbs82wIVeeE6wV
 9Xx8KVWYI3SiLkGjT876q6WWme0akng5camWR16XmC5YobAzVsvNKsh58ESuUyy5swO3sAs82
 N+3oYr/agt/574dQDxQ0FvQYyCY0Dqc/mqfayFrbAIpsRtRZYz7M143XivvBU++1y/gZ/rvZ+
 MlRya0MzulvuvHEzFIulhZ3TmBaEYRpR4EX5qqYngv5mPfT1Z/2Wovp7ArpekUt+zWLy7Bup9
 FyWz2Gb3dcgK5MX19dXbXZnt5Nq7wCD3IuGsyBRug81ZnS7oyy9Wnt1kDEP1veT/ARyw53N+O
 rdmyqd+9HUymtaiGgnYqj/wt3u5/kTHWfv8aYjYcdGbadnlTLlY0j7I9HH+enEPy2l42nF2I+
 RDhqHUzFZPNhjEIQQsdJvaTTno0KgRDD1Ua7cCWow/vobEKYHiNLn8Mkgu+jEJZypJRXat9kQ
 Sa5t5g==
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> Can it be helpful to distinguish involved error codes better?
>
> No.

I find such a feedback surprising.

May the error code be preserved from a failed call of the function =E2=80=
=9Cfb_alloc_cmap=E2=80=9D?

Regards,
Markus
