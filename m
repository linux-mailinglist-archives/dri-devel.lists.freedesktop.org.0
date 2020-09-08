Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E272610D6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CAD6E7E5;
	Tue,  8 Sep 2020 11:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542DA6E7E5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113738euoutp0139608f3e465a563f5866face0b264410~yy-IKZbrX0806108061euoutp01O
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200908113738euoutp0139608f3e465a563f5866face0b264410~yy-IKZbrX0806108061euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565058;
 bh=u9UQaTNidvGz8xQGItwzPmBXxLlY6mtig4v20LZiBcA=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=pxxpHzQ8C0Np3EljBRn599F6UekUpq0odohU1EiiF9oWYqJh2F+n8nBF/vnm14LbQ
 hUZuZYzVI6/0xrfrDxViE0Wfki+2e/+4/hgmcdroM+kp+fz7BBOijWrEXbPuHIdmbc
 DxLkzhc48rmVpYYkuR2tRn9RELla9rQM+q2Yf39I=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113737eucas1p13c031767f380c909bd65a2d5f8fc5365~yy-IB21KJ0523205232eucas1p12;
 Tue,  8 Sep 2020 11:37:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1B.5E.06456.10D675F5; Tue,  8
 Sep 2020 12:37:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113737eucas1p191e5a7978d1850ad527b5a2cc4a13e2d~yy-Hk8FjS1315613156eucas1p1E;
 Tue,  8 Sep 2020 11:37:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113737eusmtrp2994e6741e398941d03b4ae8a58ba6c95~yy-HkX-tO3046530465eusmtrp2l;
 Tue,  8 Sep 2020 11:37:37 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-0a-5f576d01e018
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B1.C4.06017.10D675F5; Tue,  8
 Sep 2020 12:37:37 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113737eusmtip1ea17ac50b289d3922cdc34eb5e8e3509~yy-HOYl930442004420eusmtip1X;
 Tue,  8 Sep 2020 11:37:37 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: radeon: Fix memleak in radeonfb_pci_register
To: Mathieu Malaterre <malat@debian.org>, Dinghao Liu <dinghao.liu@zju.edu.cn>
Message-ID: <c2434d86-64c9-2870-f8cc-df604adb17ef@samsung.com>
Date: Tue, 8 Sep 2020 13:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+7wUswtuOPqQ131F5LdH=7dH+sWZc+jmMHXpaYmTDUehvx5eQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djP87qMueHxBm37zSw+NLUyW2z/3shi
 ceXrezaLE/POsluc6PvAanF51xw2i7Ob3rI4sHv8apvL7NHzpoXV4373cSaPqwub2D0+b5Lz
 6Nz1li2ALYrLJiU1J7MstUjfLoEro7//OXPBYq6KT1e+szYwzuXoYuTkkBAwkfgz8ydLFyMX
 h5DACkaJ87dXsEM4Xxglbj/7ywjhfGaUuD71ADtMy/OdU6BaljNKfNv9iQ0kISTwllGiZycr
 iM0mYCUxsX0VI4gtLBAocX7abSYQW0QgQGLL95tgK5gFrjJK/F38nRkkwStgJ3F08yEwm0VA
 ReLF/s9g20QFIiQ+PTjMClEjKHFy5hMWEJsTaOiK96/AapgFxCVuPZnPBGHLS2x/O4cZZIGE
 wD52iV29vUANHECOi8SmRbUQHwhLvDq+BeobGYn/O0F6QerXAR3U8QKqeTujxPLJ/9ggqqwl
 7pz7xQYyiFlAU2L9Ln2IsKPE37fdUPP5JG68FYS4gU9i0rbpzBBhXomONiGIajWJDcs2sMGs
 7dq5knkCo9IsJJ/NQvLNLCTfzELYu4CRZRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZg
 Ojr97/inHYxfLyUdYhTgYFTi4f3gFRYvxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii
 0pzU4kOM0hwsSuK8xotexgoJpCeWpGanphakFsFkmTg4pRoYN3Q+kFm2Y7fxfYUGm86gAKX4
 qe7Lf5oe2rTzzbM7VtXPWtfI5b+4/ry2J9C1YFGx150W74Kz/49Gn6tqffaFu9xPmnuWaPAq
 hln67iHCj3PeX9gdzlP3fgW/6bINR2+d19kZNy/P3Pj/n3ltT1sq2+u15935W3tkKcODh/Xa
 cx65R5dMXaH4UomlOCPRUIu5qDgRAKTW7QZDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7qMueHxBp87JCw+NLUyW2z/3shi
 ceXrezaLE/POsluc6PvAanF51xw2i7Ob3rI4sHv8apvL7NHzpoXV4373cSaPqwub2D0+b5Lz
 6Nz1li2ALUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjf
 LkEvo7//OXPBYq6KT1e+szYwzuXoYuTkkBAwkXi+cwpLFyMXh5DAUkaJWa0fGLsYOYASMhLH
 15dB1AhL/LnWxQZR85pRYs/xxWwgCTYBK4mJ7asYQWxhgUCJ89NuM4HYIgJ+EqcvfmcCaWAW
 uM4oMXHfXmaI7muMEk+WPgSr4hWwkzi6+RAziM0ioCLxYv9ndhBbVCBC4vCOWYwQNYISJ2c+
 YQGxOYE2rHj/CqyGWUBd4s+8S8wQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnA
 yLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMAK3Hfu5ZQdj17vgQ4wCHIxKPLwfvMLihVgT
 y4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cDkkFcSb2hqaG5h
 aWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgdGm29G0dq3cOpHwL9HrVs504S2p
 n/KorTRZ/tOyHF7hHXVLz2rtvp5jLW12K0/kktKp80lnGVbMONRuL3s3ah/PwxeHrqQ63k4R
 nMaS2WA2U0QlzfhmCMd7UW+rxW8fljXW8rTZ88Zr+0seY3jIV9rWGGBbX3T4gnNA8RQjiWMC
 6xTrLptGKLEUZyQaajEXFScCAHezqRfWAgAA
X-CMS-MailID: 20200908113737eucas1p191e5a7978d1850ad527b5a2cc4a13e2d
X-Msg-Generator: CA
X-RootMTR: 20200825074817eucas1p29ac412697c8579d3f66c46d9e356b4e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200825074817eucas1p29ac412697c8579d3f66c46d9e356b4e0
References: <20200825062900.11210-1-dinghao.liu@zju.edu.cn>
 <CGME20200825074817eucas1p29ac412697c8579d3f66c46d9e356b4e0@eucas1p2.samsung.com>
 <CA+7wUswtuOPqQ131F5LdH=7dH+sWZc+jmMHXpaYmTDUehvx5eQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, kjlu@umn.edu,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/25/20 9:47 AM, Mathieu Malaterre wrote:
> On Tue, Aug 25, 2020 at 9:27 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>>
>> When radeon_kick_out_firmware_fb() fails, info should be
>> freed just like the subsequent error paths.
>>
>> Fixes: 069ee21a82344 ("fbdev: Fix loading of module radeonfb on PowerMac")
>> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
>> ---
>>  drivers/video/fbdev/aty/radeon_base.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
>> index 3fe509cb9b87..13bd2bd5c043 100644
>> --- a/drivers/video/fbdev/aty/radeon_base.c
>> +++ b/drivers/video/fbdev/aty/radeon_base.c
>> @@ -2307,7 +2307,7 @@ static int radeonfb_pci_register(struct pci_dev *pdev,
>>
>>         ret = radeon_kick_out_firmware_fb(pdev);
>>         if (ret)
>> -               return ret;
>> +               goto err_release_fb;
> 
> Good catch ! Thanks
> 
> Reviewed-by: Mathieu Malaterre <malat@debian.org>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>>         /* request the mem regions */
>>         ret = pci_request_region(pdev, 0, "radeonfb framebuffer");
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
