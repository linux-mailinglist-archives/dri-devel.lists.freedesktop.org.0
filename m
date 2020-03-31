Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345F1995DE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 13:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AE86E827;
	Tue, 31 Mar 2020 11:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD546E827
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 11:59:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200331115933euoutp021ef63165f05a9087d701d2c0a41d1488~BYbT0DpcP3129931299euoutp02w
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 11:59:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200331115933euoutp021ef63165f05a9087d701d2c0a41d1488~BYbT0DpcP3129931299euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585655973;
 bh=eJB6VhSymvTR+9K+zjngApbvFZHgs7SIjgemKtm/Yw0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=o80jVsFLfe7yEs401K/FcfyMd3rIRbhyegzGagGOEsN+CLZBRJmE3pJrEbR2X5d60
 U+RvRyv7xn7rRh7sIu+QE6TbzKRUNeC6tW5ss6TxFsgn60dS4IwChgeLvPdO3AJ7Bw
 CiZRz4TNI4hn2A1+0Ik9gs7UnbF5vpVEF7+gAMJs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200331115933eucas1p13551d65e778fff3cd1a44bd51c9ee24f~BYbTZ68dK3130131301eucas1p1h;
 Tue, 31 Mar 2020 11:59:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 0A.40.60698.5A0338E5; Tue, 31
 Mar 2020 12:59:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331115932eucas1p1b32de96119bb102806ff086d790d1402~BYbTGjp0W1145011450eucas1p1_;
 Tue, 31 Mar 2020 11:59:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331115932eusmtrp15d607e630f88888dbf8b4c872cd8b228~BYbTF7KFp1231412314eusmtrp1v;
 Tue, 31 Mar 2020 11:59:32 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-7e-5e8330a53967
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7C.2D.08375.4A0338E5; Tue, 31
 Mar 2020 12:59:32 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200331115932eusmtip2cec320f8f5fd495024afb1a5d07195f7~BYbSwg2Ej0217502175eusmtip2G;
 Tue, 31 Mar 2020 11:59:32 +0000 (GMT)
Subject: Re: [PATCH 0/3] video: Use scnprintf() for avoiding potential
 buffer overflow
To: Takashi Iwai <tiwai@suse.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <9c3c20d5-290f-2a2c-07c1-12df8d02c921@samsung.com>
Date: Tue, 31 Mar 2020 13:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hftdufbm9.wl-tiwai@suse.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87pLDZrjDP4tZLVY+PAus8WVr+/Z
 LE70fWC1eLn5DZMDi8febwtYPO53H2fy2Hy62uPzJrkAligum5TUnMyy1CJ9uwSujN0H17IV
 TOCpWLriP1sD4z3OLkZODgkBE4k/b2eydDFycQgJrGCUaHmyiRHC+cIosfrGMjYI5zOjxJJf
 d5lhWq5+7GWCSCxnlOg73cYM4bxllDjx9zA7SJWwQITEzknvWEFsEQEFiTev7jGC2MwCWRIX
 tnSBTWITsJKY2L4KLM4rYCfRdGURUD0HB4uAqsT7FZ4gYVGgMZ8eHGaFKBGUODnzCQtICaeA
 tsSRjZEQE8Ulbj2ZzwRhy0tsfzsH7BwJgcnsEju+9YKNlBBwkZi2zxrifmGJV8e3sEPYMhKn
 J/ewQNSvY5T42/ECqnk7o8Tyyf/YIKqsJe6c+8UGMohZQFNi/S59iLCjRPeDfywQ8/kkbrwV
 hLiBT2LStunMEGFeiY42IYhqNYkNyzawwazt2rmSeQKj0iwkj81C8s0sJN/MQti7gJFlFaN4
 amlxbnpqsXFearlecWJucWleul5yfu4mRmBaOf3v+NcdjPv+JB1iFOBgVOLhfXC1MU6INbGs
 uDL3EKMEB7OSCC+bf0OcEG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KL
 YLJMHJxSDYyR/GVcBW35RyqbF1n96ftiu2rNU4e5zcdyWJ5KsNltXmtUwH6xw8OUMb97E/f3
 YIWb6o9nT9rWGVJqnzD995pKh5smbq4r56SEb5ghHxqilyvzZpFDr1zT2s9rLFQDlD1EHZek
 RimtEo1x1PX4Wc4y94iR5YGPCdmf/l7LrVw+S8zRvdPcXomlOCPRUIu5qDgRAPPyIgQnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7pLDJrjDLYd0bVY+PAus8WVr+/Z
 LE70fWC1eLn5DZMDi8febwtYPO53H2fy2Hy62uPzJrkAlig9m6L80pJUhYz84hJbpWhDCyM9
 Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jN0H17IVTOCpWLriP1sD4z3OLkZODgkB
 E4mrH3uZQGwhgaWMEn9XVHQxcgDFZSSOry+DKBGW+HOti62LkQuo5DWjxNX/s5hBaoQFIiR+
 vuADqRERUJB48+oeI4jNLJAlcXzCS2aI+r+MEmtn3GUGSbAJWElMbF8FVsQrYCfRdGURK8gc
 FgFVifcrPEHCokAjD++YBVUiKHFy5hMWkBJOAW2JIxsjIcarS/yZd4kZwhaXuPVkPhOELS+x
 /e0c5gmMQrOQdM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBMbQtmM/
 N+9gvLQx+BCjAAejEg/vg6uNcUKsiWXFlbmHGCU4mJVEeNn8G+KEeFMSK6tSi/Lji0pzUosP
 MZoCvTaRWUo0OR8Y33kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODil
 Ghjbb52PVf23JzjX11Vsb8Ie2+chcxovNLTsP6OtvVsx/3UmWyyPy35vEZNVJx6fNnilsXry
 sXkGDSt2T7ssfcP83Dv1A+ybuMJk63rE58gozQx07Vr+UWG6bFOd3prjacF9a7cdLdSNcV5o
 MSl0+vtyb9PI378+PH/565SZQuRv3ucv9UvyXlxRYinOSDTUYi4qTgQAndWk7LcCAAA=
X-CMS-MailID: 20200331115932eucas1p1b32de96119bb102806ff086d790d1402
X-Msg-Generator: CA
X-RootMTR: 20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6
References: <20200311093230.24900-1-tiwai@suse.de>
 <CGME20200319154932eucas1p2ef5a13ed2630d236acb7a7bb0b5e56c6@eucas1p2.samsung.com>
 <s5hh7ykuyyg.wl-tiwai@suse.de>
 <85a0f31c-2e83-cf13-d5e8-2ea7f236f921@samsung.com>
 <s5hftdufbm9.wl-tiwai@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/27/20 9:25 AM, Takashi Iwai wrote:
> On Fri, 20 Mar 2020 14:42:51 +0100,
> Bartlomiej Zolnierkiewicz wrote:
>>
>>
>> On 3/19/20 4:49 PM, Takashi Iwai wrote:
>>> On Wed, 11 Mar 2020 10:32:27 +0100,
>>> Takashi Iwai wrote:
>>>>
>>>> Hi,
>>>>
>>>> here is a series of trivial patches just to convert suspicious
>>>> snprintf() usages with the more safer one, scnprintf().
>>>>
>>>>
>>>> Takashi
>>>>
>>>> ===
>>>>
>>>> Takashi Iwai (3):
>>>>   video: omapfb: Use scnprintf() for avoiding potential buffer overflow
>>>>   video: omap2: Use scnprintf() for avoiding potential buffer overflow
>>>>   video: uvesafb: Use scnprintf() for avoiding potential buffer overflow
>>>>
>>>>  drivers/video/fbdev/omap/omapfb_main.c          | 14 +++++++-------
>>>>  drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c |  8 ++++----
>>>>  drivers/video/fbdev/uvesafb.c                   |  2 +-
>>>>  3 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> Just a gentle ping about those patches.
>>> Let me know if any further changes needed.
>> Patches #1-3 queued for v5.7, thanks!
> 
> I still don't see those in linux-next as of today.
> Could you check it?
They are in drm-misc/drm-misc-next branch but for some reason linux-next
uses drm-misc/for-linux-next one.

Daniel, is this correct?

[ I couldn't find anything about for-linux-next branch at
  https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html ]

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
