Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFD9F62EB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901810E24F;
	Wed, 18 Dec 2024 10:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="gskIaHS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C305D10E0C6;
 Wed, 18 Dec 2024 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1734517736; x=1735122536; i=friedrich.vock@gmx.de;
 bh=T/KJYEmAbhFiYFse+9DCMOak5ee1q1gfy6EqZYSZ2pA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gskIaHS/z5SjdcBfjNt80wOoCFQBUb5+ZpG1kiFNmCBj8+GscwT6eI6El4CIqxuE
 A9fd81BXiWo4dMlIOUr4Yv+WOS8plIu78gADyx4tCErSX5PT512uKpixsQQE9U1mr
 loozpChePw0xSd414OkgFkrr71/woGPuFynrfDvlyj3VaYPnMZ3Ww7CMXtsyPzMD8
 qA9LM4+qgG7DzMmEZrGh/J3Tuk4jGrMChnQ8jyxoZ5T20taFR2IWebe2BIvuhxx9U
 2eq0DDqt1A2mqoCSjSEu59PCL0Nek9kBdFBrHh1ADx4arsflxySSBk2tCmAo/kXlf
 SannSIKgrcmV+qolpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3W0-1t95ZG2wYw-00YJ7v; Wed, 18
 Dec 2024 11:28:56 +0100
Message-ID: <170a89dc-00a7-41c5-9b25-790519adf381@gmx.de>
Date: Wed, 18 Dec 2024 11:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
To: Maarten Lankhorst <dev@lankhorst.se>, Tejun Heo <tj@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
 <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
 <20241213-gentle-glittering-salamander-22addf@houat>
 <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
 <20241217-meek-bullfinch-of-luck-2c3468@houat>
 <a69a3500-be17-4899-bdb9-c6a63bf8dc81@lankhorst.se>
 <Z2GwpOQDVshpv-ml@slm.duckdns.org>
 <c0a539e7-0f1b-496a-9848-73a7ada66bfb@lankhorst.se>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <c0a539e7-0f1b-496a-9848-73a7ada66bfb@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rF51Jw1fMmPKsjCtvVAX5UejHuIfUM1d2kPWtEwDA7+Td/kNgxs
 LrimTnrfRX+jNP/Dc4RruS0Fp20LATyvRO8msLjytlq22mU7Na2rpL5+hz2cj+LsnCdTqx0
 Ufn9TCgoGumHU9xnJjPVP3JH50NQkBPJEvRr0M9Ybblt/fb4+YoRjKQO43QLpNJZBO8oVEj
 4pPYRnHWoZHj9WnLt0Crw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AQhxlURqPUw=;Fm2MQyFgnGyjbVYgqofW9E7qdZa
 okzMmgGY/h7MNpA6FhSoTVXQsnH8PTW94CXiosTiscQHQU8HnGS71P8C1S97GWXDna6DSOWXB
 LQMKC1Ppu9wkJqRKoJGJ2n3UZMI8J4Y/6OlkPau/ZqwHA1uLTAgnXGi07+hk250SwhhwYlGO0
 eg814zwedTxrHMt7oWHkFg9m3FV0Wv1CKuIjSoMjDfcKO5f9Ep21V2ygAE9ldX92Ux6+z+XZP
 M41T8WyDxGsp98dgCO+uXOQ06pqCGVc+HHV04flzv/VaKsheR9z5tT4Mjb+tWgKAFzGwtGtE7
 WWRM+bKUlXZnmG+tHdMrq1gJgcs3fM5suKo4alGDNXfJokBRExf/V9dXPMzu9hkSb8tiVowH8
 Tlogay2ozvigC298FEwYMAShbsZxw+O3FiqlPzDWx6tktGziHzeTz4uUvZ7A15Freog0/vME0
 C0YGGhsr89EQjYLAsVdv4OciMmud9xjoXKhEzHIUssL/zLflawnuUUSrFIaW1U4ftqfM2Zb0k
 HKPPzC9A4FdF5tKiLsPNDjraiKLWVEvAU1doX5mMIREO4rFJaqyhp+hMPoaCkTuLeJjSxGrfH
 bl3bcEQNnaQ8r/31WAe2AO6CPY7aTuR7CqtaxsJLtxtcH+CaA+3DdO5EbGsy0KMUkw86yw85n
 h5Us7pRw2cZCkNlqutOy4iypnhlIjVvpe094TI+kIV88Gz3OEnesRAOAXvuT6rjD9CmDOD0HN
 j0v8zkp1Rfow7fe683yooPfb9Lv7ykRIT22Qd+eVvkHhN3Xdt2BKTMj7YQFs8aSslcrCDz+2+
 d8bTEN+NS6IIRfdjl+FIA101nzYYoMf2cM/H5uPev8lzgprGSmckEgBW/NmzKBheBIqVAVPfl
 BwUtGhnU5BiLcLkw9Bpxn9xxRSOJ7u1wMwExd8psrZp45Ir/ChQm1lIWquEQa6X0QJcOoqosY
 M8O4Q/ZvimOlqFFww1m6pXoLrPeflWqrYGqTAnjKztn9ppLuVZ2XgXnJyYli9lmsztd+jlbBS
 /R2Z5Z8mWgRq82L4zkaUyvSTpDm2EHk+rUJ/P2S65WeWZ3pG06G3seSmOc/7zeX0oWDKlIT7g
 xldqyUOQ2owtUESCQllo9ocYXHgNpQ
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

On 17.12.24 18:37, Maarten Lankhorst wrote:
>
>
> Den 2024-12-17 kl. 18:11, skrev Tejun Heo:
>> On Tue, Dec 17, 2024 at 03:28:50PM +0100, Maarten Lankhorst wrote:
>>> Now that all patches look good, what is needed to merge the series?
>>> Without
>>> patch 6/7 as it is a hack for testing.
>>
>> There were some questions raised about device naming. One thing we
>> want to
>> get right from the beginning is the basic interface.
>>
>> Thanks.
>>
> I believe it was solved. The conclusion appears to be that we go with
> how we defined it in this series. drm/$pciid/$regionname.

Yeah, I'd agree. Using PCI IDs works, and the objection about cardN
syntax being unstable when driver load order changes is a good point.

Friedrich

> With the only
> regions defined now being VRAM. Main memory will be a followup, but
> requires some discussions on hwo to be prevent double accounting, and
> what to do with the limited amount of mappable memory.
>
> Cheers,
> ~Maarten

