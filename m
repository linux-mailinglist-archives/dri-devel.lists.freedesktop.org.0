Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC59CAF45F
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24B210E045;
	Tue,  9 Dec 2025 08:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="DQyR1KxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ECE10E4A4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1765268570; x=1765873370; i=deller@gmx.de;
 bh=yKX3Wx9Yx93QVJCLVrmGsLzBJdSVtTX1xYs5ni9sJhM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=DQyR1KxDObzeIu1mLxIBSwOttKP2I0lILHwPiI9MzzY+u84uHSyH5LWkoMDeXmK3
 /SneFNnE4h3hbvt6NBALpRrobzc479bJdHyJgpr4Dp4MOlktP6cxr/le2EZPv9h2o
 HDEj/YeyIg7YiKpAyJD6qR+UISu9lavZKMsNJHp2EIhxRoe3DpV8xNqPUGacN2F/E
 fo/ynZZ0wRtXWXp+GJl1a+FCz7VEknsxZOI49OMZ+9MJ4W7GiHHSv70TdHXFZ3V3x
 A8UeW+3vlAqZel/FYRoQ/BgVI6UmmZnEu/pKlIfljJmwm8haAv1BAYMz0aAP3koCd
 JHCo+9ZUA4pelyZnhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.124]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1wAiBm2GNU-00uceT; Tue, 09
 Dec 2025 09:22:50 +0100
Message-ID: <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
Date: Tue, 9 Dec 2025 09:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jDXE3Wm7e9WJYRsi/Qy8IySVRwziSAqGU8uMTHW4oHNwH+FhHy/
 Z6+SlhVIpG708aLOlbqeBn6oZKkS9T2tnuZFR1I7IMa6gMV0KHM6KmrdXu8evNAIz0ws9xH
 Ea5f9cQyvywb3LBohEUgtzD6rUF4kDm2rgqz7c9HUzu2gsuwFNKcqJnhNtJSqQ7cCaWLyP8
 r1II1oA9A28abGrdJ5YkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sKV6n7397TE=;aVuZchHyMP4kuwYa9OICTgnvId2
 SXBl7DC4F8DldbA4QfCBqzuY+no3KVAYWH5gMKeIPvK2GGtGTdcxVRoZJpW01B8d5wbgY/ZH+
 DxwoJVExQCTwSV/AMZZMlvBe4APhUqfR5mpbNNZ4/gej0bnZWojhRXvMk6Ws5sB4eGOs4tpCZ
 y9uUj5jny6NyjfYJjt4hy8MDU25YnA9PGIyHR5Sik7N61vkCsHCshJGhTkudQ+NSyuL3BOQP5
 ry8hB8h3MjnJcWokKIoCHnX5BYmZf0RgDr1s/zETe3nW2ucNACowjK5cv7j1qnvdf8g1IEre7
 xux4xwlfPMTnNF3lLM+WbzfNkvzquNl4voVu3FQGb/Ys9dkbJoUfYDgsSZ1JM0iE4pIh9lGN3
 7iC6vVmWR7hcJCUSOg+7dsc4IZzkCfe7IUtQi/jCSyB15IMwcM/feHI9bQxrevEDf0iZEc/kn
 6LpbFo1TspEdALBJMvGVfkwiUmtkwn53kTug42qtUUVYw5VHuJATRgY5l0v64g53J02KRmWpa
 tT1g3M208rmVAG6uxvuuOHW3PT/HL0+AOT67+7QxiwrMVMkmINdVMXD83bYoVcWx1W0w+/bv8
 37v+HvLDn4kb8i25oYQ1+uTNWQAOh1cX7u98iOBcTs0uaApmdMMNm/vU2TAeHt1QdmqbTD9iQ
 nn9pzxvRPIh5idp07PGG6XXKq0ih4ShziR8rzegGG12zI8v+05ri7+wfGfOoGDMdAci72Jspt
 EHV26uLDKuEmZ2WNtDea9GRW6GILJsdrLMzIzlm+GT9m+VEKMk4N3AcQIzomZTYsklg9P9EX/
 jssS4091OKIL1zWGvFN9uZr5A85aSfpG+kJIG3yn8+gMZkyYfVSymEgY1BgXlGQGa4cQqECg0
 esYLYSH1SvBlRWszSe5Ru3BOW0BNOtGOa7uscx7lNHdsYlUG2dPvYuG4edV8TXLjghBF6dwCE
 ZHOvREn4TKyfiVj03gRjHUWak8wmi5Tn9rl6gB9/HDaa3nfdqs9WL8YXWdp+2x4zydMunIlzA
 v8ZfRw7HRK/1SPNlMesGZr/2WIgc8bTFyXfz7aL7K4gJ2QWN319ZHfhz3paCqPhgU6DpDOXM2
 Vi1HmHkiE+vqGDxvJNj/YMeJwHRFfOndH1FVht/ZpasFZOxVNceX/f9Tp52YDZYQdru5UQ3bn
 z+s3d+3pIw1gl52qPFi6zVGMopAISVtj51Rvkw6lEnWRpckMCFyLTII84AUuHMNDIzSa/JNxX
 XLsle/h8h2xuCZ9EzgeiHm1yGHWCWObskr9pZdGQ/eRYCYGx2YGCuPN9nBdjSlfeg6WYE7FbL
 1GRrSL3k1T3x3uoY4R5lTvwrz+y0kmv1peVMohOAB1yhj7ccrQT+7YaC0H8MNXw4rJYN1ouIv
 zj9Z/1fz2zTUsBXDVpktrJ53cLBB2oVT0itfE7j+FYDO+JylFeBggbjrMVVXT2xq0ElV8Mh6J
 sW9ISjQNFY4qfNQ9SsjTgXa1CGF0owlvedsBiye2Jzc4sFm7N4mrrcxWOWWP2K1BbutOguRlV
 XBoMMquBPe3U+OV4IqKDonK5Gm5YJUQqjCAf08LvLOEoqkrm+gHSIHCdnEmpkJh+u3u0LymeT
 oPZBzE6BwxgFxKL7K92/8x2wlzIHD28+Hqw97NCqZ3lvOWZKbjmAktV+fWvnl1EL1bzd79yq4
 tMxM29P/dckfHuhrY8/Jz0SQlb7q1zI2SIFaD2kIimCG6aRnynzSianb9OB1CNbuE4R56rNVX
 Lvvepc3dasHyDridfv3BS52XFEUtrQNCRa6Zzfcd5m+MdwkXnLb7NylqzdURrPGckwNgAWPrL
 BGuMBb/36KLrP1XtquFNZ1yUTIZSae/9tPKxv3op0taCpjcYHfz3M1/wI6JaXDnaESSkK4UQ0
 4bfnxXQqxWgQ8iJ/pq59hVlPaqmiG6ny5XAMMWUyZaoEtFIeJmxAU1igy2SGLeGFnfCx0sXLD
 CM+62KyEUoR27WV1k6X75Q86/WSmnryVjMlNdEI48RceGp700eyEx6FRlRpvwy1vIXUw5LcFh
 I7qLUP1nOWvBen04FT2Gvuy5nNHuLLelVpUi5yx3HsBCtl+niBzqYbrCcEbz7OUpnSXMqZ2Dd
 VUMA88XdFa1eSknrTcVZx/7Zl0NtSktkehYMD1Bk2FU13aGQDAmhGhR4iFUwmy4+TZ6Nt5PQ1
 1lnLNeIhmdiMq+CuJORHDpurGIaSyI/j4Kf6V3qR2pDWeuZG6AXC7T+I0KHZH4XL+KSgq5hFg
 Aen3dRXXHULs2g2owAkhvam6imEiezflE43oQG2Rw9rYNmeDRQNQAkW9+vTfndUQMji5g6tv5
 RWKbdSTjAlx+/glF67IYbyPmr8KuSJF76zJ0r2m3dz2KQiItFATljnI8a75eGoOJeBEy82zyq
 WbI7Qhw5IMnn9sFSIjK7ie4wurku/tbq9Qlu30K0tuiQ7/DuW5UYSgUJ5XMiEI41LKVOlRik7
 exMVewP4pCapfpNPRcRqepCp1Gej0OjnAYNVSUA493ycldM9itspXm7ujZvHJbO2gn8q4jT9K
 YOOgLSlGddjEnvRYrqHKefb7Qbm+2K/4jn2ZULWzywZQgoBh4CjLZj2vsY4jYJoM873lIjI5e
 3EXft8iqmm7cMuacfdOgx4gmXzmRTFilf6oFyn3gu5IOEd350gwsjA8dTWOYRdfhmyYkwerb7
 YRvI3WnBlBdeRFmXePnQA9Lc5qTu56g0njDTzOI+0qd0zImwpZKUH3ht88hcfrfPm8nVnLRJH
 OPmjoPrsdprUV42fUCWvKPkpcobaLB7Xi0iGY5igtEysVD1KYDEpbvGGd98Ho5WjwoN6J0kVa
 /fKK9NCWkJDNhQoHztVknhrNyf9X8VS1zgj/AQoiSbPFHOQSFFkVHwpQBfj3NDT6ZSPllHNSQ
 trQFXRlhoic+uSKvmCVajwfStgnZcoVFbTkIFudjKX72RZsuoQGjWRZt3KS2ZkBKT922d8uLW
 kTD3Uooc1PXW9QUrmS1Am17alBlcTDGEbkN+98I2tGc4/9CcPcP5Pu1S+i0Bi+oEnB5Kjc3Jl
 v3+Sjo0I6F4EReauWgRvSCAlZGCiiZCrudv1kMpCnTpfUW1i1YuZ8YCnzSUChp804CBVwO/5A
 pttJuX68g1EyMXDBDrHB3p7u42uJYxcrHhIhyjhT8PRaWwpst9rVY2lLxAB4UdDTkwF22Q1IZ
 WED5qA319R1ZjxKLxrV1/4Kmnb+ftLQteyUGT/n8ZE+aem8AYbMR2vXo1oDqZHgN1RH1JbqKp
 IKs7hALSLS77VFJzXSUX+/YFNC2AMbUYS1VxYrIQ17LVBlBwF6QNxhHu8nDHSimX245pldBWK
 KNE1w97jiNTseh2t+x4+M4W3whQJuO5FHlxjq+G7vHRoCptUEFP9vjDcS2gy3tJc7oezMsbyh
 dz1/fmuf0xvz20bzsAvNLj3GzEYuRdk4s/nDzVw5sQdXKb5iS0AtJgmr0RJno6SmeDM6cp6tK
 LfiINmHSUyR8BtGwS8mvGaSkTvL+VeG5pPFbQv020ikIKgbjm6af8B8a2eDhOn3xoigvZwJlr
 Buvr6Qrmf7vB54N1e7CQFl4aKaZCkxCG81/KF0LqF52w+nAlE+4aNKau4wGIBgca48ULhLk15
 XEQrI/3+WRL1jyLEFzGw9DlBx/b6khZC8ywdyknYAf9JWe3S9pkcbpZjsC6zU9gh+iKskCU8Q
 QK8QtSKBtczRy75auFswx5MUa0TfEKOjM0OfDlPP2WtAOm/8GNgZxukUXlTYPI8fzFCAgcZzI
 LzD0LJT8m1GsmFasMkLrSA3PDCyiE32NoE9DhPr7XOVCTQuo2kaEckTV5NfIeHnethlwJ8Sx6
 5ZdWA91v5stvwCWiH4lXEnrv96GuKblUwJppb3ahg1jvgmzX2/u5KtyLRwt6ReLRfI+0f5ied
 tI9bi8VHB6EBZwJEN2Q8XvGXyY3M9rWcYES9RA8YNbHEhWXK2jjiDAzARqOPBu4t19SO4rl9M
 FugMyXwhsf+OsUDfucsPt7t7ftbtgHeHY0ALCtlJNZEQDYUh3lcgZqBWaxscWqVhyewY4K5H+
 TQRLeJIbEHIa4pwYsjWD5pXAO6RVHrx7xzggSJoh3uiyu14So8wR94TwZd4sZwHz20iqhWA4R
 zEa3zdBNSUw9MbzPCgEaZBO34PrQUuZ52Vxw84G4waDICyuUPFJdR+/fQlszQacZSAyCijPga
 0Z0iy1nFU5sBZmKkEl5rZolbYV9ZRkKSn9ifWhibH48tD8aFtr/I+Fa47o3ZQtuZrUlbW2en4
 upJ+6ocKPSv30Qs/TdOJigtAoHrapjKQdlOb3fQR6cZXL6xiRtHX64xuIMBprDJYSRVGPU/Bb
 a7L4pbp6ifIGFn6Vx7KfpmaxTrjjuaMm3R6fFAS4OcAWtuxXJ0vMlpLaq5o0DH3hoELY0dZwz
 XDCI5NWL/hc7jvCu1e9XT+AOtFkMw+orJJrt7t1S/npAO21xplbkvnbY8ElzL1QA2sczUT9V4
 zrC2elzjskvAfisSgv7ZgEFnUbSfn8xJP3VWk1H1iFYPobR/2+r6FQgfqzYUB8PwCbyUBufTx
 DZKSZ9XOktgUc2/oVaKolLVbONkoJXQWCcLQNt9bZrRHxjZZZpNZFVikGgZ+SHviZzz4nnebj
 5+L0Mv8R398D6yRR5mWS3Xo3ladrV4ItZFE0N9mV2KWicDrcMcDBl09yxOV4CT1aSMWvFuyL/
 KidJvUfS5+CzkudcoC+yn5rCuxDVI9zmwGg3NgkWJrVogEFQNFPCI1fRKylYjjlZSjSUxI9W9
 S1y5KRY/W9udtI2Gseh0YeeOGb3+p6Cl9INCBPUX0vppgYICHFsdBi5d1Mf2c72dORjyRgIKT
 fryIvBlDhf371rc6lJ8/bh4VAfbZH1FqIrG2jFdovc4pO0Pxp7Bsx43Lv8FPwRtd8w2VlbBAN
 9RgkuCaPkzkjdfgr4BXc5qbEtLEwyTyf5M90If43FLKtt5h2+gYkh4APpkk7vJ5nCsQAzxDnS
 FTtyRyKKHoA8T9QPn9w9LSZ7tyZm8/FzqWmpUX+2vVuAJBMocz4izF7T+ye346RtHxqO3b+uU
 R7y011VzdQsiywLz5EHCI0752N8yybFnK1RMVVw995td7UCSq0GOH9heP+4OdGraVFPEp1joT
 YJ66a/qsRHYcQDDGdlZKHeq7m9u2E5FDMK2cisBgj1LwOw1I7zjkSfVaRFDU2SyiKIuzwVzd5
 8p5OvI58=
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

On 12/9/25 08:27, Thomas Zimmermann wrote:
> Hi
>=20
> Am 09.12.25 um 05:27 schrieb Chintan Patel:
>> Hi all,
>>
>> This small series makes several legacy fbdev drivers buildable with
>> CONFIG_FB_DEVICE=3Dn. Currently, multiple fbdev drivers rely on fb_info=
->dev
>> and sysfs attribute registration unconditionally, which leads to build
>> failures whenever FB_DEVICE is disabled.
>>
>> Thomas previously noted that FB_DEVICE should eventually become optiona=
l
>> and that drivers should not depend on sysfs or fb_info->dev being prese=
nt
>> unless the Kconfig explicitly selects it. This series pushes in that
>> direction by tightening the FB_DEVICE dependency boundary without chang=
ing
>> any runtime behaviour when FB_DEVICE=3Dy.
>>
>> What this series does *not* change
>>
>> - No functional behaviour changes when FB_DEVICE=3Dy.
>> - No removal of sysfs interfaces.
>> - No changes to fbops, memory allocation, or display update paths.
>>
>> Build & test coverage
>>
>> Tested with the following combinations:
>>
>> 1. **FB=3Dy, FB_DEVICE=3Dy**
>> =C2=A0=C2=A0=C2=A0 - Baseline configuration; no regressions expected.
>>
>> 2. **FB=3Dy, FB_DEVICE=3Dn**
>> =C2=A0=C2=A0=C2=A0 - Drivers build successfully.
>> =C2=A0=C2=A0=C2=A0 - No sysfs attributes are created.
>> =C2=A0=C2=A0=C2=A0 - fbdev devices operate normally (where applicable).
>>
>> 3. **FB=3Dn**
>> =C2=A0=C2=A0=C2=A0 - Drivers depend on FB, so they properly do not buil=
d, unchanged.
>>
>> Motivation
>>
>> This moves fbdev closer to supporting FB_DEVICE as truly optional, help=
s
>> reduce Kconfig entanglement, and clears several long-standing TODO item=
s
>> as suggested by Thomas Zimmermann around legacy sysfs usage inside fbde=
v
>> drivers.
>>
>> Feedback is welcome, especially on whether the guard boundaries around
>> sysfs are placed correctly or whether more logic should be pulled under
>> CONFIG_FB_DEVICE.
>=20
> I left a comment on the first patch. If things still build nicely, then
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> for the series.

This whole series adds a whole lot of ifdef'ery, which I think is the
worst approach. It makes the code less readable and leads to two code
paths, which may trigger different build errors depending on the config.

I'm sure it must be possible to do the same without adding more #ifdefs,
e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
simply returns NULL for the FB_DEVICE=3Dn case.  Then, that value can be t=
ested
like
	if (dev_of_fbinfo(fbinfo))
		{...do-the-things...}
For the FB_DEVICE=3Dn case this will then be optimized out by the compiler=
,
while you still have full compiler syntax checking.

Thoughts?

Helge
