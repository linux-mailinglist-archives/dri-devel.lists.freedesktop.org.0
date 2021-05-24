Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075C38E5EB
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 13:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2D289DA2;
	Mon, 24 May 2021 11:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25489DA2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 11:55:50 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210524115548epoutp0328362cd1cadbc8f42f6a426021b301d6~B-qpAXKn62858828588epoutp03W
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 11:55:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210524115548epoutp0328362cd1cadbc8f42f6a426021b301d6~B-qpAXKn62858828588epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621857348;
 bh=eyMyJ9+Nz9Enz49PlevKT+7vY1Bv5dpa23zK/2RGnpw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YjyxJzjfkBNFU2yAg5UuGW1kMOFxsWzof31WbvmKNkxN+ibbihuCN21d3Zi/H9HIr
 Efb72cSoL7DirZYtpyIXeB9cFeZmtI3+gHK0P/3syIOl2HR6WaEAP6N6yEQgtkpye7
 KC+ddEoL12FpqDrY02rGEgiLbLuMwvkFp16LhuEA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210524115547epcas1p12ab77e5375b865f1db9cd9811f71c122~B-qoysw3K3081130811epcas1p1k;
 Mon, 24 May 2021 11:55:47 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4FpbJL1KWqz4x9Px; Mon, 24 May
 2021 11:55:46 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 5E.6E.09824.1449BA06; Mon, 24 May 2021 20:55:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210524115544epcas1p16153988f702e108618d8479a96a357a8~B-qlxscr22628326283epcas1p11;
 Mon, 24 May 2021 11:55:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210524115544epsmtrp2f0a19355c07a9384d7221f0f777c2dfd~B-qlxBLf_0455104551epsmtrp2R;
 Mon, 24 May 2021 11:55:44 +0000 (GMT)
X-AuditID: b6c32a37-04bff70000002660-c0-60ab9441a475
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 40.AC.08637.0449BA06; Mon, 24 May 2021 20:55:44 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210524115544epsmtip28c0d66f9b6e2f56e0bbd5cd7470ba674~B-qliMsi62520425204epsmtip2C;
 Mon, 24 May 2021 11:55:44 +0000 (GMT)
Subject: Re: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to
 replace open coding
To: Daniel Vetter <daniel@ffwll.ch>, Tian Tao <tiantao6@hisilicon.com>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <6570cce1-c36c-a91c-1590-542e4d2712af@samsung.com>
Date: Mon, 24 May 2021 21:05:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKfSVdw16TPLlEKX@phenom.ffwll.local>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmnq7jlNUJBgseyFv0njvJZPF/20Rm
 iytf37NZbHz7g8lixvl9TBarX+9jd2DzmNXQy+ax99sCFo/Hczeye2z/9oDV4373cSaPz5vk
 Atiism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgM5Q
 UihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BRYFugVJ+YWl+al6yXn51oZGhgYmQIV
 JmRnTHz5nqmgnbtiy/eVTA2Mvzm6GDk5JARMJI6tuMPaxcjFISSwg1Hi096DTBDOJ0aJV1++
 QmW+MUrs+/KZBaZlUt8vZojEXkaJnVPnMYEkhATeM0rca+ADsYUFYiTeXJnNDGKLCLhJbFpw
 iQ3EZhaolXh7sYsdxGYTUJWYuOI+WJxXwE6i99UqsHoWoPjf0xvBakQFIiTefJ7AAlEjKHFy
 5hMwm1PASOJs+xoWiJniEreezGeCsOUlmrfOBjtOQqCTQ+LFpiWMXYwcQI6LxMsv0hAPCEu8
 Or6FHcKWkvj8bi8bRH0zo8TEGaeZIJwORom7j69DvWwssX/pZCaQQcwCmhLrd+lDhBUldv6e
 ywixmE/i3dceVohdvBIdbUIQJUoSxy7eYISwJSQuLJnIBmF7SNyZsoh9AqPiLCSvzULyziwk
 78xCWLyAkWUVo1hqQXFuemqxYYExcmxvYgQnUS3zHYzT3n7QO8TIxMF4iFGCg1lJhPdv38oE
 Id6UxMqq1KL8+KLSnNTiQ4ymwMCeyCwlmpwPTON5JfGGpkbGxsYWJoZmpoaGSuK86c7VCUIC
 6YklqdmpqQWpRTB9TBycUg1MFs7G2+/v+/LlX2jxnsbCb6GmO4uzNA/vn/J4RuCTDyo9OpIn
 oww9ORSyJjIZuTddf1iecXjBm9j8U2+5n5j5bz1eeGJm6qzJ6zLijp3uWdKTeeNbwTper0uB
 EsuP16j+9ZnQVfK98zOb1k+WsoKWvXcl/H6lNs+/25d362ZZ1DQtH4H/upJrXm//m9lil37K
 LS3va9vWB45sPY+cYn7PXpsdl3xt/vavBiFenObJte73HSWvz6rit0v1s7lS8C9+47ctib/y
 PHo/dSUqb5z4RNtf9qi6hNbmnjlcp3wX+bw8fdqx+GHCx3PTXHQ+ynEZvL37SWbTxC6Bg9X+
 8u4rfv6LXnCD90qiyuQ1R9INlViKMxINtZiLihMBBGzyoCsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvK7DlNUJBg+fSlr0njvJZPF/20Rm
 iytf37NZbHz7g8lixvl9TBarX+9jd2DzmNXQy+ax99sCFo/Hczeye2z/9oDV4373cSaPz5vk
 AtiiuGxSUnMyy1KL9O0SuDImvnzPVNDOXbHl+0qmBsbfHF2MnBwSAiYSk/p+MXcxcnEICexm
 lFj45gRjFyMHUEJCYstWDghTWOLw4WKIkreMErOu3GAH6RUWiJGYvHEeE4gtIuAmsWnBJTYQ
 m1mgVqJ7/iQmiIZDjBItd94wgyTYBFQlJq64D1bEK2An0ftqFVicBSj+9/RGdpBlogIREvem
 MUGUCEqcnPmEBcTmFDCSONu+hgVivrrEn3mXmCFscYlbT+YzQdjyEs1bZzNPYBSahaR9FpKW
 WUhaZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzhmtDR3MG5f9UHvECMT
 ByPQXxzMSiK8f/tWJgjxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5IID2xJDU7NbUgtQgm
 y8TBKdXApP4y03HpmldTD4t1M+/g7pdn/rv91uG/pidlzgRYBJc+Kz7xSvbPtXcGFrrHGk4H
 cnzRLF7263/63CTJTZP+pe17G/Q3SVYz/OeunZGz+g2lVysfZTsi9mJaXdwce4NDaUfP823Z
 1+2+Lu6WfWqST/Vz9hkTJAt0Z5d9PPHAvUftVPG7fI2CM1MrC1W9DqzxdTcunMY1k8Ns1prs
 b62r1/27P0+ocssfcx/7DanWBjw8hSZfntueNXyqtVBqieHbJs5V2zbfvln45ZhKUdFaueqL
 vHxx0z9EuHilFL1Yc0tvSsySI0F/k42ezHE9u9b6e63ARe1HewQ+ck8o4RX8tbk/SFhlxW+3
 aOXAX+I+zEosxRmJhlrMRcWJAC0ylLYIAwAA
X-CMS-MailID: 20210524115544epcas1p16153988f702e108618d8479a96a357a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210521153142epcas1p3d80ee0b402cdbf767007e8bf05b33e2d
References: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
 <CGME20210521153142epcas1p3d80ee0b402cdbf767007e8bf05b33e2d@epcas1p3.samsung.com>
 <YKfSVdw16TPLlEKX@phenom.ffwll.local>
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski@canonical.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



21. 5. 22. 오전 12:31에 Daniel Vetter 이(가) 쓴 글:
> On Fri, May 21, 2021 at 05:06:06PM +0800, Tian Tao wrote:
>> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
>> pm_runtime_put_noidle.
> 
> It would be good to explain why: Apparently get_sync increments the
> refcount even if it fails, which ususally leads to leaks.

Tian Tao, could you update the description?

Thanks,
Inki Dae

> 
> With that or similar added to the commit message:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>
>> v2: drop unnecessary change about if condition.
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>> index 3821ea7..32672bf 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>>  	if (mic->enabled)
>>  		goto unlock;
>>  
>> -	ret = pm_runtime_get_sync(mic->dev);
>> -	if (ret < 0) {
>> -		pm_runtime_put_noidle(mic->dev);
>> +	ret = pm_runtime_resume_and_get(mic->dev);
>> +	if (ret < 0)
>>  		goto unlock;
>> -	}
>>  
>>  	mic_set_path(mic, 1);
>>  
>> -- 
>> 2.7.4
>>
> 
