Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEBF7A6B29
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 21:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE2910E221;
	Tue, 19 Sep 2023 19:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3EA10E221
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695150305; x=1695755105; i=deller@gmx.de;
 bh=dwOFLat/09ZJ5a2N0ZwfI8NSGgbcVOgBd49x7DssaFU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PuwyhZ9ByNuO/j9G9ZPqNyO/+lGpbFEbggAXgl07hgc982nDFSf0BEJiHZ50yTJdnHL+yNo/u+S
 VPd3ZI0+2PAIL5tMlq1Eg7PttpKualTq6kcIwDxKy+ixkYzzrwvXD5l5Cw7Y4emwzSJv72/WC1ePB
 LqbmGy7fCeBjl4FssPnRce26NbmTthMpWyHzK74OiTfVR28VwUcvZX1pWvlinExF2R0z8NR6Mcyh6
 pNGxFt9zHSc36IZ1fM0f246kR5YwkG6odo9zs+w1ojbVyyny2/oIr+msVqHtPN4S/usDYlYbs68Jj
 Zm4e5g4dSJHFeqSi0bZfh+TwIEEpWYXubSXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.254]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1ro4QR2ES6-015pDP; Tue, 19
 Sep 2023 21:05:05 +0200
Message-ID: <6f192cac-45d6-ccf9-7a3b-22a39ed77681@gmx.de>
Date: Tue, 19 Sep 2023 21:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] video: fbdev: core: cfbcopyarea: fix sloppy typing
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230918205209.11709-1-s.shtylyov@omp.ru>
 <20230918205209.11709-2-s.shtylyov@omp.ru>
 <d436d191-9580-c3ca-1583-02c9cff58494@gmx.de>
 <03096350-c12a-b442-b695-3233a46d1008@omp.ru>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <03096350-c12a-b442-b695-3233a46d1008@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VWdmznwkFNxkUIlNzL6BBFXovi8RBYTT4IP1/01ZhF7f8lR5WiS
 TjIWMiEgOP0il+QgGe21rmxE0RERw6oyPl19Udp+mH0QIcO/yRWxry7vEkTFz4+R+U7ebsu
 iPpXOmEA3t092rnwqNCjSJ9SnMHYyW4N5nJTacBW06cUfiqjnQF4Eh8c7aANbE1Nt7Wp/pp
 jR1IaGRkW4ZyaEGA5iBmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LGmTAwygX2E=;5We/VlHTzu19f1QaU+jfG0oaH8p
 BxyyPVYZ9o3KcDOo6MkrZb4u0eXjTHqdXvGRRCBzWPSrQ8G72fEDJJsbZZpTCuK9tq/IShpXe
 jUogQZJWYo7tNrH80+4yHm1UOQFmmHTznznuaDTpb+mXbOMlePzxj9DfldT5H2LFKq7a6mgwR
 Q2+fQbH+8ujtCqgcyS4b7wZ7SCH6zCPpMhHyeYvhzbEokwv3huQh3NNBQtiipKHuVpAVMGK4I
 nn3swnoh1CwvMHBmOskfjYJqWbYIlX9WNgytMTAbEVz64EiJb4EcIg+S82KW5B1MMQ1/9Aj+L
 VMEKccQX4kzoaLw0csT7ywzy8nkrZ9nHcRj2LhkQiLtI6VVVupgDQ91O0l7kOYFSRdVcMNFhe
 9w3ugbubSCVvFpzpzo5BuJOBaR95WgDMAJlGmgIGGYcZfyhifqP6SlQK+hakRaegzUsKxqogH
 ypYMFt+AL2+XkQ4+NRUrRK76iN45JO8q7L+EsKXcMmcE6lkdIwVL30htEPAdyji/CRmGJa0yA
 9Yl+nzXz0LhM8FeVh9EZAy1iuNba820vVNBYfqIwCc73sZwAJmY/rg5J45jdI/koHlqX+lF8q
 Ze3hBHrH5ICXnNV3N9O5QMnM6oJ9CXeB5DQi4oPcTQnCEmhhzXxOzeWw42BeAqYatP56sZqlR
 Obwe9WSPygJxUYZQ5qqpNQsxTeq08KDvAVDXKEeqBdsHeQEivK+i4rQrDBTZAgyoXIkRy99aO
 s7s1G6KteM9ki5RESK77BEwsFwwnbqc3gn6KpW1IhY/2hcUaN5ZQ6XZubAS1td3hSVTyv45KK
 VQY0gQvWSyF2VJ/rEmdNowD7AiRIryqJLvoJnIYO8U7EHNJIz6VV/UqzG5hrDUwirkNsS386d
 voB1MiFRf/t4E/eghHhjJPqGvN0rqxpjS2kJfsq4MyUU8E1eG+FP09fI9naMIAyuCV3XTzoXk
 ELt0hg==
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
Cc: stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/23 20:55, Sergey Shtylyov wrote:
> On 9/19/23 10:05 AM, Helge Deller wrote:
>>> In cfb_copyarea(), when initializing *unsigned long const* bits_per_li=
ne
>>> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- wh=
ich
>>> might overflow __u32; multiplying by 8UL instead should fix that...
>>> Also, that bits_per_line constant is used to advance *unsigned* src_id=
x
>>> and dst_idx variables -- which might be overflowed as well; declaring
>>> them as *unsigned long* should fix that too...
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with the Svace s=
tatic
>>> analysis tool.
>>>
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>  =C2=A0 drivers/video/fbdev/core/cfbcopyarea.c | 5 +++--
>>>  =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fb=
dev/core/cfbcopyarea.c
>>> index 6d4bfeecee35..b67ba69ea2fb 100644
>>> --- a/drivers/video/fbdev/core/cfbcopyarea.c
>>> +++ b/drivers/video/fbdev/core/cfbcopyarea.c
>>> @@ -382,10 +382,11 @@ void cfb_copyarea(struct fb_info *p, const struc=
t fb_copyarea *area)
>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 dx =3D area->dx, dy =3D area->dy, =
sx =3D area->sx, sy =3D area->sy;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 height =3D area->height, width =3D=
 area->width;
>>> -=C2=A0=C2=A0=C2=A0 unsigned long const bits_per_line =3D p->fix.line_=
length*8u;
>>> +=C2=A0=C2=A0=C2=A0 unsigned long const bits_per_line =3D p->fix.line_=
length * 8UL;
>>
>> you wrote:
>>> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- wh=
ich
>>> might overflow __u32; multiplying by 8UL instead should fix that...
>>
>> This would only be true on 64-bit CPUs, where unsigned long is 64 bits,
>
>     Right, Svace was run with the arm64 and x86_64 configs -- and I forg=
ot
> to make the emphasis on the 64-bit specifics here...
>
>> while on 32-bit CPUs, it's still 32 bits (same as _u32).
>
>     Yes, indeed. That *unsigned long const* doesn't seem justified
> at all then...
>
>> Instead we could make bits_per_line __u32 (or unsigned int) too.
>
>     Yes. Will you accept such a patch? :-)

Sure.

Helge
