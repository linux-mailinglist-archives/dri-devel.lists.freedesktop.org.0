Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE976661764
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 18:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247F910E05E;
	Sun,  8 Jan 2023 17:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C90710E05E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673198777; bh=7v/7zj2Ysz+/w95b1kVq+oD2bzqjczc2L3mL7k87WRA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=mSEqKLllgfaugEUfwK1DpPrKag9byMTMLILVvzboSZPDzN7DwyzMSecpRQMcjBYxj
 pj0rdSo5U+fSPsljmVc1C0LFpIrSqT5w6GQQEg6m4+o2U+egvvGryWEidj9Z/drf/H
 guX99U+MmRRs1DE6MyCFachtRZamU6Can45Erl7Smo9trEl/NAdVk+l2hGvseDGxWv
 /M95xPilavrfcFC9obqbWatVy3RU29HQJA0QvQp6dbs8gwmdoRcNfNxZwWPiwgEfYu
 ca8AHIT5Aev1OAO29txxakpsD1NwmxZ6ZTlt+dRXHASiC7ZTMP/+PeeBVO1v5rH3Y7
 tDSPYx2XGQBjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.135.194]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1ogbfA2j3d-00amNL; Sun, 08
 Jan 2023 18:26:17 +0100
Message-ID: <811a392a-d634-5557-dd58-57f1580e28f2@gmx.de>
Date: Sun, 8 Jan 2023 18:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight handling
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Stephen Kitt <steve@sk2.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
 <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
 <Y7nb2q6SDota/rTU@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <Y7nb2q6SDota/rTU@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T9uileinKOrfmfXULyUKIEJ7Q5sw2pWalYogfbz1gtzJSOq1Nnk
 V1Zd+9ekAM/oEwNZj1ns1vPVvUAvy44ZTl/BH109UTdaVmWLFROcAvtyBj2aiXsnhpoNIYK
 f6LsM16mV7xk2n5D7VSkS/fvq9QrFB+Qsr4JdY1dEhwACqZ+EY+1G3NYsfmX6ypM+wH5gFE
 /7WyOoTkU98Aw7Eoh7DaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6EvwsDxHCUk=;/ufhnGN+zI+oDWZwCc4k4w2CiV6
 QrBtAZx6984DADkmIhmphyAOMnO+EsKjlmNqXIClAaw7V8tj9JPpHNARsM246kng951NRk2oi
 /byMbKSDYi8rsJz7nXc/8KdnxSv+1burzS9rBLLQM/SSTUMuQUByG7DylwBo981H4z994LqZg
 KLx+5Rc+JTjZRTHm7FAkEiXfexyhIuoMWuFoc8+oJtEX8HPb5zhB5OYNiVjMNrPqGx2C+3K7v
 sAZWfQ7gadJK+ycK0a+DF6ZK6q1LsCz+1WRS2kTIc9PJ8/LSLnFu85kOu+o+9tCNP4DY5zQ5p
 NhGfVTn5bxnME9Sfjeg+9Tr9u6dO9obRYORwJqPjaDTe9+CZNal/yd1ZwaAro20jGQk4TVyDa
 LkGBCsyMdaLmZYKdXXuZBayAMT8PyJ9HI4w/2Y3jeySKFTrrCPt2MgKeLt5Cqy6vUEvLdAXC6
 y0Ril9BxeR4vpeFvuNrwd4GuHDQngvSxVPqvMgf9aMfVU/HTZ0ND9Ff0zHT5k+CYIfU9ozKXw
 WAJ9oQAhGTIpHa1DGlP6FNxdU0ewRRtrxDez7r0n0fX2Zesqdwb93PvYFJUz/NaUPU2MoemBZ
 PtnNHPXybe5g2TGiVP5ruaDYkd/2yG87qwT269V9l+B2aBIckWPR8RiFPdO+VgqKSSRILZAvu
 Xcsx1fp/7/gviRZ9yGN1JlA8f+Dfko5WDu+R0kGU1IgSRGJ3aNB9IlxTKhDshTXZ446gME2//
 HQlzmCrV6kWA+h8ISQpNIPgwhV/sb1/m7HSHW3yfdftuO+AaZA0FhJ/kKMk+6QHaigTShvBIA
 dfiV4QG0v6WifGj7P5cbgofBhvUlZ3ZDqiloZyOB5ccr4M3sIufP2OCBfjm0AXFsWAIChC2Cg
 bC7QBlhaNveFAmYsdFSSPtz2++nCIfoAnf+6cNmVDXN3eAGT4HtkCZDEmS/w+OGm4ZNZAzGPW
 BztdIqZ4VB6gHHWaPzjmxy5jaag=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Robin van der Gracht <robin@protonic.nl>, Lee Jones <lee@kernel.org>,
 linux-staging@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/7/23 21:53, Sam Ravnborg wrote:
> Hi Stephen.
>
> On Sat, Jan 07, 2023 at 09:36:47PM +0100, Stephen Kitt wrote:
>> On 7 January 2023 19:26:15 CET, Sam Ravnborg via B4 Submission Endpoint=
 <devnull+sam.ravnborg.org@kernel.org> wrote:
>>> From: Sam Ravnborg <sam@ravnborg.org>
>>>
>>> The atmel_lcdfb had code to save/restore power state.
>>> This is not needed so drop it.
>>>
>>> Introduce backlight_is_brightness() to make logic simpler.
>>>
>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
>>> Cc: linux-fbdev@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> ---
>>> drivers/video/fbdev/atmel_lcdfb.c | 24 +++---------------------
>>> 1 file changed, 3 insertions(+), 21 deletions(-)
> ...
>>
>> Hi Sam,
>>
>> I=E2=80=99d submitted quite a few more of these previously (and you=E2=
=80=99d reviewed them), see e.g. the thread starting at https://lkml.org/l=
kml/2022/6/7/4365, and yesterday, https://lkml.org/lkml/2023/1/6/520, http=
s://lkml.org/lkml/2023/1/6/656, https://lkml.org/lkml/2023/1/6/970, https:=
//lkml.org/lkml/2023/1/6/643, and https://lkml.org/lkml/2023/1/6/680. Ther=
e are a few more, I can find them if it=E2=80=99s any use.
>
> The patches from yesterday was what triggered me to resurrect an old
> branch of mine where I had done something similar. I had lost all
> memory of reviewing similar patches from you.
>
>
> Helge - could you pick the reviewed patches from:
> https://lore.kernel.org/all/20220607192335.1137249-1-steve@sk2.org/
> [This is the same mail as Stephen refer to above - looked up via lore].

I just pulled those 7 patches into fbdev/for-next.
If you need more, please let me know,

Thanks!
Helge


>
> Stephen - I expect Daniel/Lee to take care of the patches from yesterday=
.
> If you can look up other pending patches from you please do so, so we
> can have them applied.
> Preferably with links to lore - as this makes it easier to apply them.
>
> Review of what is unique in this set would be appreciated.
>
> 	Sam

