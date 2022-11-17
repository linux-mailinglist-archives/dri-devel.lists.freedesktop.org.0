Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B041362E2E6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BCF10E21B;
	Thu, 17 Nov 2022 17:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4704710E650
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 17:21:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221117172102euoutp01eb4a84a37d0e777ab8ca6b9b82dba439~obvWEEpr80838108381euoutp01j
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221117172102euoutp01eb4a84a37d0e777ab8ca6b9b82dba439~obvWEEpr80838108381euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668705662;
 bh=OBdjvppofbrHpcjkB2q+hZRYF4eQluWAk63w8IeXgwk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=W/8mv8BRhW8qdxW77ar3Q4D3Dy7JKVcM4qSuIZTlIuSadtLUJI5pZUiCnId3wiK7T
 sjrUZAdP/niKALv8PZhb85VqQ1nh/CGnXpetNULmJiteywOiViRHs2CbIzWPWlGqmg
 jeSNw+iyLv1YR/mzc1GF4NjGlgPMkXkR7Rzn1Le4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221117172102eucas1p15b629fde0b21d796394d38d0b9d8deef~obvV01Y2W0749307493eucas1p1C;
 Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BF.D2.09549.E7D66736; Thu, 17
 Nov 2022 17:21:02 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221117172102eucas1p26838f21d9155f10aa8bae7ebaf540cb0~obvVgyD4e1896018960eucas1p2F;
 Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221117172102eusmtrp21425acd6791c50bd6e08d56f067e5049~obvVfVmD10726407264eusmtrp2k;
 Thu, 17 Nov 2022 17:21:02 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-61-63766d7ef4d3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C4.7D.09026.D7D66736; Thu, 17
 Nov 2022 17:21:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221117172101eusmtip2bddec874931c2796f240d1b5e61e66e3~obvU0xgx62650126501eusmtip2c;
 Thu, 17 Nov 2022 17:21:01 +0000 (GMT)
Message-ID: <81399603-6253-b671-85c7-373f196b73ed@samsung.com>
Date: Thu, 17 Nov 2022 18:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [v2,5/6] drm/fb-helper: Schedule deferred-I/O worker after
 writing to framebuffer
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1424be58-3f19-7ed4-e3c9-5517c05032f2@suse.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87p1uWXJBmuOC1ucuL6IyWLhw7vM
 Fv+3TWS2uPL1PZvFwmnLGS0WzOa2mHh7A7vFwo9bWSzaOpexWmx5M5HVgctj77cFLB47Z91l
 99i0qpPNY97JQI/73ceZPDYvqfd4v+8qm8fm09UBHFFcNimpOZllqUX6dglcGfNOPmUpOCxQ
 0bP7AlsD41neLkYODgkBE4lHNzW7GLk4hARWMEo0bF7ACOF8YZTYsGIjO4TzmVHi7sozzF2M
 nGAdz7bsZgGxhQSWM0rs/lwFUfSRUeLR6xmMIAleATuJh6cPsYGsYBFQlfi5UwMiLChxcuYT
 sF5RgRSJhVtuMIHYwgIJEt8mfgJrZRYQl7j1ZD5YXERgHqPE4h8JIPOZBVYzSqzc8I4NJMEm
 YCjR9bYLzOYUsJZY9WIGK0SzvETz1tnMIA0SAt2cEjNvdjJCXO0isWDueXYIW1ji1fEtULaM
 xP+dINtAGtoZJRb8vg/lTACGxvNbUN3WEnfO/QJ7h1lAU2L9Ln2IsKPEgl3d7JCA5JO48VYQ
 4gg+iUnbpjNDhHklOtqEIKrVJGYdXwe39uCFS8wTGJVmIYXLLCT/z0LyziyEvQsYWVYxiqeW
 FuempxYb56WW6xUn5haX5qXrJefnbmIEJq7T/45/3cG44tVHvUOMTByMhxglOJiVRHhzL5Ym
 C/GmJFZWpRblxxeV5qQWH2KU5mBREudlm6GVLCSQnliSmp2aWpBaBJNl4uCUamDiyNh+pv/5
 3+x69ZLA21/Wz/9tO6Wi+f7+nmMph5hueMXV9E9jaFfds/+LGBc3Z90GeT7t1U4WPNv2nhad
 /GhR0t/OVdPc2LxsmE4ekEhTvrOyU6Z1l0Kw+vaS23PXS4oe4d1x+Md7hlCHhbvY/TJl9UP3
 v+xQO7gwIc4jbJ6H+beiJWUslxNNKoLuy2+8VFPH/vKRUsNejprrrotDw+T0Q341M/x+nz33
 78QZzFPKqvszXabMcj6poV/imb1V8MGfE0vnlG7ruR+87cQTXv8m3viq4JNX3jZ3T96c5t9u
 d7Xz1ex3y88XlPzyuVU/N23J7h11jC4rbDpMuJ98XdF30vjz2ckRtvZTfmsvnzdPiaU4I9FQ
 i7moOBEA+7oyJMsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7q1uWXJBjv/WlmcuL6IyWLhw7vM
 Fv+3TWS2uPL1PZvFwmnLGS0WzOa2mHh7A7vFwo9bWSzaOpexWmx5M5HVgctj77cFLB47Z91l
 99i0qpPNY97JQI/73ceZPDYvqfd4v+8qm8fm09UBHFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
 ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GfNOPmUpOCxQ0bP7AlsD41neLkZODgkBE4ln
 W3azdDFycQgJLGWUeP73GTNEQkbi5LQGVghbWOLPtS42iKL3jBKrb/0CS/AK2Ek8PH0IKMHB
 wSKgKvFzpwZEWFDi5MwnLCBhUYEUiXVHokDCwgIJEt8mfmIEsZkFxCVuPZnPBDJSRGAeo8SV
 4xcYQRxmgdWMEn/+9zJCLPvEKNF68DVYC5uAoUTXW5ArODk4BawlVr2YwQoxykyia2sX1Fh5
 ieats5knMArNQnLILCQbZyFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAaN12
 7OeWHYwrX33UO8TIxMF4iFGCg1lJhDf3YmmyEG9KYmVValF+fFFpTmrxIUZTYGBMZJYSTc4H
 pou8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQYmz63ps61DXpqq
 FH5pUJkx3dopXnZZY03wUe2f5+2tY+fXZu7q3TFfK/JXfOr5VWXVMWvZWJl74nX4rcL8nlQW
 MHz9w3/4B+OT+ClFkVPXdn9/xXddj9frqo2oVWdrwfrPhpzT7Dwv888/8CO++YTMTHbDl7KN
 LlUs1x9Kdepq1Z+6LnvWV8Uzr2qZ9LTs0PzYJ48Yttzw9NvyiuF8n7zZ1qdirB6FK57ZvbO7
 eWHuNFfv8seBNiGsYlUaU+bejVpZdPyPeFV7ZLDr9DMpXzpjBCvSn1cdvHbl/r4H+Xy3TY/d
 T1uzr0pGd4Jlx7f43dpSrKxXpvmcma71d632gjmdsw5r3zvKeV5zt/SSo3ZKLMUZiYZazEXF
 iQCl4/vaXwMAAA==
X-CMS-MailID: 20221117172102eucas1p26838f21d9155f10aa8bae7ebaf540cb0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33
References: <20221115115819.23088-6-tzimmermann@suse.de>
 <CGME20221117125800eucas1p29bc0adbe623ca0c42e903e771bf68b33@eucas1p2.samsung.com>
 <ee076724-cee3-cd6a-de44-191e058fddbb@samsung.com>
 <1424be58-3f19-7ed4-e3c9-5517c05032f2@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.11.2022 17:07, Thomas Zimmermann wrote:
> Am 17.11.22 um 13:57 schrieb Marek Szyprowski:
>> On 15.11.2022 12:58, Thomas Zimmermann wrote:
>>> Schedule the deferred-I/O worker instead of the damage worker after
>>> writing to the fbdev framebuffer. The deferred-I/O worker then performs
>>> the dirty-fb update. The fbdev emulation will initialize deferred I/O
>>> for all drivers that require damage updates. It is therefore a valid
>>> assumption that the deferred-I/O worker is present.
>>>
>>> It would be possible to perform the damage handling directly from 
>>> within
>>> the write operation. But doing this could increase the overhead of the
>>> write or interfere with a concurrently scheduled deferred-I/O worker.
>>> Instead, scheduling the deferred-I/O worker with its regular delay of
>>> 50 ms removes load off the write operation and allows the deferred-I/O
>>> worker to handle multiple write operations that arrived during the 
>>> delay
>>> time window.
>>>
>>> v2:
>>>     * keep drm_fb_helper_damage() (Daniel)
>>>     * use fb_deferred_io_schedule_flush() (Daniel)
>>>     * clarify comments (Daniel)
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> This patch, merged into today's linux-next as commit 7f5cc4a3e5e4
>> ("drm/fb-helper: Schedule deferred-I/O worker after writing to
>> framebuffer"), triggers a following warning on Raspberry Pi 3 & 4 as
>> well as all Amlogic Meson G12A/B based boards:
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 220 at drivers/video/fbdev/core/fb_defio.c:340
>
> Thank you so much for reporting. That line should never be executed 
> with vc4 et al.
>
> If you have the time, could you please try the attached patch and 
> report the results. Thanks a lot.

This fixes the issue observed on my Raspberry Pi 3/4 and Amlogic Meson 
based boards. Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

