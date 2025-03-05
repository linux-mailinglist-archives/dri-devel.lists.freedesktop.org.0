Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF9A505FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 18:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5CB10E818;
	Wed,  5 Mar 2025 17:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="VLZt800F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E2210E816
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741194465; x=1741799265; i=deller@gmx.de;
 bh=qSFgqG5zZ8uB7/EdqFI+tBOKNwncrau+EHb9ROl1Elw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VLZt800FdvjEs4Wqu2oAd1ndh0gQt+LYR1bd9ct4ymHbjq5inIR0VsniqcXzEiFU
 4CzNxJ71unLvywDgSbhWNd/jYc60J8jbdoA10YFT4krLPsAWkzPwxS849M5eNgCCu
 o3d1AxHq1n5dypUshP5255PeVKSoMAT5izhHY/Ta2rGeboC80ughh0Yen88yWrcCs
 EFgh9Ft3Swj1dQX016nJtahLCO2NREWlek7aXz0nDFABzebkmo68N2/MXV3VkXUog
 igBg84iiQRpQ7lKDYEu7RIwiWBQ1aa9bS8zTSK9w7GQr/4j7i6spp5XD25UaLnrMZ
 /ImaYIOcsoChvOAbzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1u1U8R0Cni-008r0T; Wed, 05
 Mar 2025 18:07:45 +0100
Message-ID: <81a620bb-205f-45f7-9036-e8e44a8e7be9@gmx.de>
Date: Wed, 5 Mar 2025 18:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: video: au1100fb: Move a variable assignment behind a null pointer
 check in au1100fb_setmode()
To: Markus Elfring <Markus.Elfring@web.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Antonino Daplas <adaplas@pol.net>, Thomas Zimmermann
 <tzimmermann@suse.de>, Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
 <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
 <47c37d1a-5740-4f48-ac0f-635d8b6f51b2@stanley.mountain>
 <9d042e6a-6d93-4ae4-8373-28b9dec21867@web.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9d042e6a-6d93-4ae4-8373-28b9dec21867@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WFCzdqPmtr/uOmd6GBJqupGfFplz0KM/ko2XNaecD3XCxy8tVLM
 H5nDyRb4i4/pCvIoqvQDEIHQdzIgGt1tlvK4W2MRNAtkH00Y965x+n7rWASwu3HfGDQk4EZ
 3h8VLzErjad8IVoyLgvMW9CIB/wfMGorhp7qopi9tv4q9IqZRBFDuIKA5WJxRO/zaAwxO7o
 lv7M8NeXLDx14Qs5Kp5TA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZTjjDObThpw=;QUkTbV5tHNceAYaWzt1VoI4+tl7
 XGq6xbDKyijcXMXQdr4OxVGxAqp0z59T86Z87Ecs/LkY0f0cHtQUGkXSF/MJtQM5HeS2TUC6z
 ahJMY1fqhLwCIuLeFQl5/orQTlf+JY0dwnkaWiPhSCl7YJXpV35v65WEF1teGcRBvL2M9yLZg
 dAl1OtW2aGwcEL7FT2vR3aGUg+leKA3qOlu1ySvdDGoJvf44RK7QYep91ERHKfQeuZjdvLERC
 GbCQpTh26i8xBvJqo41+h1G7aSROIhzOhVg2vLTeNguaBLXgR+uy6suuklrfb6hJPkRJz0E9d
 +9vg63qLUS8KCk/v0aLJkPH80iokVr9tp4eFkJBBI4MZK/1p00dvAD1x6BNRBiQzXF1Ia3HiT
 s+Dk44aOSyuMop6tEAqtvt1XvqU/R9+kgngbDi39qW3ej6+BMOMykTs+etmcJy5gI9SD2gRXG
 6Bx1HRPNVdK2csjAY4obtXGr+SFsvpjzidO+9IDAjKIdi2AFFjgjw1ks7QoZl77fjhVb5/sjf
 UzpX8ziakIzDbOjb5ywv2Kj4Gj4LWL5N/ef8s/bSnZRVhM8FXdhmk5wwyarRBwUOJRF3wzqXt
 xhhfaFYCdvoMz3UKhvMyJ7pPMUNs4DfGStou4qbFTM4Eq2EcYpxNN3nZiKkuAPuXsRDTozvXo
 Wk+x87X9UnNM8Q/510HmrZ8HajJvwQzKAah/r4NkUhNniTEJenXZl9Aj7NP7UttP29x0QRVB7
 pKWwsWrb7tKqypP1P+0SznW5hujv0k2sbQziUN3xXLTswbgmFyLeH4sWHJGrfBc4LfRo1G7oT
 VxEIqjOitgmHVHL07LwKbdYqlQDMYLcGQddu9q/sEzkhvgegRvHv75RPCR6fIRsGHDfVfTbec
 Q9pD7GEBv4gS4sP4CperWATqvofFcVNdJeJFaSIiiA7aBpc32IbXqBzbvICCRkI5MsAq78ZeV
 +202OzXmjLeEu1Jb4nijmtOSKkfKmcvUDLRHAp4Bxh3AyAXOu60AwmL0Wj70bKY7LFpSVrVZH
 qYCsMP9m8JdhaRx2ecdjYR6ChUPxp2NvO6VbZ2ykIqr4LJ79w0PgejItZJGi3PNsqrwk6TQtc
 uFVnrz6BnqKyR80/A9crQjgcKEbycz8aASxsiFVXj3npPDHf7G5XIp+q2AgaEHdEhJ3z0UYTY
 W2IiA5YHpDS6ewVU9bMHOQaVp8+aWDIBE+cUogyktjDrIQTHUwSLjVi6pBrbAUIDRT15wZ5Ar
 C0RR/l8w1L7Ke3foW58ZPtOT0HFqAVcUm8cBsMuPwW808pdFCAbcHdc03qjfrlV6l/2tDMIay
 3uLmVYVQGX1mopLPhbtBAC3FGzwbKw7P2R44DcnXvQbBUdkbnqj7naobetDhHwdn4cXmIekTp
 5UsbywibX3IzkNtFcIOuBATyn87vhA04agxuRzK6v60TKjbZFC7bpHHTxF
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

On 3/5/25 13:14, Markus Elfring wrote:
>> Anyway, none of that applies here, because this is just pointer math.
> Which data processing do you expect to be generally supported at the dis=
cussed
> source code place (according to the rules of the programming language =
=E2=80=9CC=E2=80=9D)?
> https://en.cppreference.com/w/c/language/behavior

There is nothing to discuss.
Dan is correct.

We have:
struct au1100fb_device {
         struct fb_info info;
...

so:

struct fb_info *info =3D &fbdev->info;
gets translated by the compiler to a trivial pointer math:
info =3D <value of fbdev> + 0     # 0 is there offset of "info" in the str=
uct.

No crash or anything can or will happen here.

Markus, maybe you missed the "&" in front of "&fbdev->info" ?

Helge
