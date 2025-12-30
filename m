Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B52CE90CF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9E010E46F;
	Tue, 30 Dec 2025 08:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Qk+kve1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E2710E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767083905; x=1767688705; i=deller@gmx.de;
 bh=+MEqqs1rrATIJIDZVtVkkjyL42TuGleZntwC6pjADcM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Qk+kve1ZSzn/1C2ZzgDfBxNbx1jSd69K34eZmBJ9qfzDl60GWXggK5LZC42C60+a
 a/F2SzTt5nI7aDH+1iPkovc4j35d+tqlmoKpEmGBPkYIL8IEo1Z6YnvW+rgUx8HrI
 Q6IAvRkfHlJoxxuGIEiuuGZrUv7lel0nwPV8NfUU7ULh98tLi2Hexe5RHvbVkvbl/
 7P/DAnRz4b6BiiOlKhirCts497SaLzEfA1FZqf+Q6kZp9sXin37Qchmn6KCPwXFR0
 Mwd7qaN1HKTxDVbM/NxFX3qv2pSfXBjS/ajdc7kZwwjQgumxNNqXvZqrhAEvu32cn
 CWAAVKrtXGSvNPPAVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.253]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1wHqQF0m7m-00pYat; Tue, 30
 Dec 2025 09:38:25 +0100
Message-ID: <cf7dcdf8-6b81-4e80-b358-f20b2f0f576c@gmx.de>
Date: Tue, 30 Dec 2025 09:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: smscufx: properly copy ioctl memory to kernelspace
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Tianchu Chen <flynnnchen@tencent.com>,
 stable <stable@kernel.org>, Steve Glendinning <steve.glendinning@shawell.net>
References: <2025122802-radiance-vacancy-11da@gregkh>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <2025122802-radiance-vacancy-11da@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Czac2Pff+AM7HEdabZ9kGtNkix704q5EMZIbPsHvM4mRnQ0A8NR
 /Jf3t3ieJ+IFGOv5hEQSDm2KUOhc5FeJ4f8dC4jWtOldG8MkDUd+OJjcfBhKlg9fi4Dunx2
 /qT0x3wYHYaXmbYoMaMC5ea0zlsq0H4kkznTdfZ3w/227RGhmP3Lb+cr4KjzSzllkqBNcc5
 sA+VsNrghsD7oly8+LAGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sqRPtqZaPJY=;JRmYY3Rpw2kGNxIUSmS/Uhy9d2q
 vbn6teNXPgaCAbtfEThHZh5RL5oCA3WBUDkFUgCImWBR8mg8yjOK5SJhN54VWXAg1m/ngF6EX
 YZPLrGdHhxYFZ152nF3InBn3vZS8LlXA3sHPEMJ03+Y2S7U/bPZQTVI9VM2mvnZXOw/pva2SL
 KmQHz1KsQ+gjAILmKNz5L+eRC7dU6ljf8+xEh2IaBNe6OPNQ8EEqdYcmGMH9x9/1f2nC3+eVs
 peedGu42J0CA8DBRIF44Z4jHy4kHC0g8p6l+5mtJiDWO/UopXh9kX3DE6/1BiAyE6Mlu4EWTF
 KKPttBfmGbcl+9GdEgT3dHUNpR9BNe+UcSbLzPKUbjmCbUqZ/8Lp/x+5iInt5r1xdwrYRKAQL
 ZvuGgPA4vquib39YaVPC0R2Extk5UN8kSS1/mRtLQRTz0s319v8/dUcpbzzub7aRjC1Gua6lX
 YdIRyh47ArXlaS9VBMaIZd7vw+AcPQOs7pCwz7X+yEWcGwPTG/avdgBAbUtKMge2YtV0bA11a
 EGUz9QMwhZBbzG5GXdz6O+zKUKW7kg0lLGFHOS7e5L+/ePxZpjAkbbZDF+IsQxGhYWXduzsbm
 e73mKvrbm0HEUDQvJ/XrS8fJs+jTyITM1iy40gONFml8q5Mew8T8VnzQ6epHhlXXfrSitDbad
 ZRvH/uhk1G8S6OC8HXo4YTMqAAWcFBYkD62b/eHkO7IQonj328Im2DEM8oVEuymnUk8+5iBcZ
 pOuFGULx67p6cYNtrXYWuhJM9FREmS688Sez65v8CeTbNBnix4VeOlgSgyYKTUH29qPO3bCEt
 PW+ofh0c8zPNHYpLC12EV44LabgGjNRQHYdTrt7mgN0JYuqdfRc1j1Rxp/8VKVg5hXtgA01BH
 nuhRq4JyMPX5fhn2ehhAlDpRKX8cKfNFtheGCJ6pk/3d2s7Sa6iPcC/aZ2faBpLGYhIE7H3g2
 PZveog7hVkW87h1GyxV9tw/9mtkTHMnuBo9dnvHcaj06Ka7fxHGqqpn0Yx3fC/NBENE5FiRkP
 t/MCD0J0+spISLQ7ZGY/f92UIxxbaVVKhS48+KhbjUdep2KbSRr/fXjHSkFeOlEUUq0u0Cfnp
 XR/mJLVDb7SdLkgk27uvOw4oOLdyXlXB+KiJNvVT6rpcFSxaMCGNZQ5DVqI0dIfJCRSXzc5eW
 ukKQ2iRkilYdFdKxtePtdlHFLU9H6TBVTGIHorBPryckLw9iobmnfHXNltIBtSeaW9ASMrd47
 q0wmgcsB0tn1GH4zwGavfhF3rgZtcWmLcZb8DyVwF3F4Hr9upFFbX7wgLc4pWkS80XwWoy5kj
 PHnKDRXM9/YeW5ft9MYf/z5PvF0oFNvrQWaN1C1LYhPC8PrV10N+HtDC3m82SJYpJcDxePPlD
 hR+AbaoqSgdQqMu+gVzKXMXWXjHtZWTra4w3O0z0Ic6hf6XT+WP79cD721jHks8oNi3xszTKM
 iQ1bvt1xAfybttu08rAVJ/Xi7bhXvzqkOOYwELIIIfySWsQmHEUT1cseGUhEzqxuQ8Gfoelii
 AYNHRJNMp9JMqf25QrQ4eFhog8NLtWPzjmFYv9SampsZyN0PE7sl9aHkWRlTiu/wfoH2wS7XQ
 D4FnkH3463umnD56HoC2jGEooflA1n4LgBRNabC0nNHk6lMGj1owHlb0DnLvZFIOzryzUuC8L
 uSjj+K1qnEoTb6m8kDnKxSzvrQOWm7ZxgzHiVr6nwD+pnc0TsvDAuGZ/Wg09gIB52XHh+S/Qf
 6x8dQOzUQaCfCv/eassxiZlyTA9r3626lXwiF5nK4SPy3yp8+p7dP6SIe6r4G9zJ91dVC2ejL
 5ZiLRsw+ljVA47hQ5kPCZwIPemfTmA+SN6GEk7eN8nwDUrtBHCwVju4MMjhoTjDX8RR9u4Edh
 +4Eu9jFJL45I50X5WaOq/81wrG5uLiB5tj4w+f811tjtODtDpguSQ6Jw/UwljEQXknlM6zjPF
 w6PsWQ9j8fnDvQPsrWQNSKD8gWUAwyQrHYsAr2m5pO93lmmfpRXTyLoVjKsYU2NktmpkeIaiX
 87in7b5Gtq+MtoIOQQ5y+y2yNOjpDJq0gMIUocVlgPEKS7L9Vltil6vo1LEEBTCQW7K3H6sdg
 Rkw23EcjNEtCZUZl+wYMBbPG94zV4nMWhU6Egeh2a6tdoQ3QTegPL5q0qrBaYka33rWYEGUb9
 KpaWghBNh16Fbd1pnVyRluyzHDbUhzP2qhmYkTMnoyirGhLY3Gs/YIM0NUNiik3h4E0T7T2Og
 OnV9nXwon3aktAm/QPUStfM+b6boPt7pX93Oo47frBKRNjQly/TiZRV8JPLUtloQxEfFbe1cX
 lpi186T4P+WJ1VjFENrTEUpltmq0sT8WKS0ZCsJ6cvWrIvoXPu4iSj5GQ+6SakdRj8TcGV/HV
 B0/lWHf+Z6ULVj+CENiXW24uZxZVpr2vo3PTBD2C8ai+nXeWgmvGZNGbMAFOp7bBAYvPJ9mqI
 foLFPxcZSsBn7ImYl+Grk/pzpdlXbcjzZSNbOap6YGaZconUI6JQ43Qfyo7XmVnntNYdujpy9
 GY7VjquhNG4jr1WR9QJV1nc4755GerUibfipei0Ss4BfqxaNdxpqxh/xV6OWYtYz6hg3mTmdl
 dHI5fz3eFkDTVrveRUpRYJ/jqbyVyXgXh+BexSH5be5mWV3yV1qPv0LwLm5Ou7aVtq5feN+//
 7dsa0u4fc/1hmjFmPpiYCZsN+xoi85JSXTtn2Lrp2iZ5kyQpO7v2UPDweWlx7OQxgOcYFbbrS
 liX2SErU2lUI/OPYyCbPHLP/4iIftkyr7KKs6LjDANLgOhzEmnMf4VnWaI4xm5uUvfj0DgDjJ
 RP31AJxz+lGveJmieMliZNkozFwOzuFTEK8vqHhHbDcY6b2Y1/DocDwTlOkB/GywC5XFZEtWF
 ClxtSoV1iW6zKdT4Wg6TndijjRJnLQSPjvhN74yXpQnyEFEwhjZxVsJiB/4njqvCaGiXQ4vjQ
 oNZhP2gkXSXpUNdGsvrHd7JCCtm6dvnHTBSP8OvRNzrsNwQZZkDXKMeGGiz/zuwaxxUGVajd+
 i8GLEK7eZfsv7H0hR3j0Y/tjp3+nqUilsgEShU7pgigGwTjEclXlVoozDx2sUVaL/5iFDoP3v
 tq0FgcWKkWH8Yn6ffJncQcRcF7wN/wKSxLpfN0ZQfhjTEEschUnoRxnZmzPNeQ4IF84euT9V7
 V3IUMRXVzg3rsJoqMxwXYBsPavfxXFeAdACf6wuUG7gZ9x1AijevtU2bK/U3I9p2WiweAroFS
 ONR7/lQNAnFdTOtanTnMbHGo0jdjXgLZV4IibyiaT+aLt6JnIiLdAjmaNP0LXRH+IYrsApNGT
 bbwfht/+JLz1zWabZRqGgy8IhhE3vneYF6CRY+tx3WeO9OMeRc3yEahgg6sF641ZNBMxbEW/A
 sQsR+AX+aFBGo23CFvSTY+5HGbPN2BPNI9/ZW5XB1Mz9L3PEbc3U77t5agWHtBz3vJeKcSzAC
 s+fk2iA3y3hn04uE3w4bpNfgeU0YjnHQIxA84eb46YoM3IZMRVA55ExUEmk16ZPbeg4TXAut1
 zLMkg6Es0Ef8MtaKDFdWgiW9lUnqN+xcDvlG/A61a0VYh2uCBWFl832czky7KsgdkQeKO3/VX
 Hvx3717NhMHRuo6OJ+xeUA1N4Qnw7z9FuX1Ar7+dfB4NYJIwv2wS9ZDNyK84b2e2RHRnN0Au4
 +NeVUO8dPZWuM3LKGaVfKkIqIaierBgvwPQkGciapOXxBGbNFYBxDN3mLTSWWBcq4odRjXV6A
 P7vBZQgOK8lVBik4LjuvEACAz8hkIFMZ9rwpCi4hJO8UtPHp7wTj9PMbdO8Wc8l3G78TrcE3T
 v8XPwNX2v6A20tTcvxuAg4NW1wa01QMJNZ9lR9BdboV10FRwj2w4SewNSDjqoUyWBWbkEjzvI
 UoNrWskFSPmSEee0ZGFjcYcQ6l6WeS15TxOWIk+KABud7qeWGDEdUn6FWESUDCwdc7sPRGgnU
 sBuFdzAPAbPqqDmUBXeGa8ATfOHn8WxMgDT7TLtW/5r1iDfryqxnEgO3P6Lo5NpDwecL5owkK
 RaItt9Yfy5tKtYJEckjh4VheFRf/zO8Dud1waKZDIu40meac7XmSQBUbmugbxVWBefpTkHC9f
 z2tz5PUoXaWv624Do4y6oAEqfytl9HUSJxET8PuyKcMQsexYlWBm2aOht4DyKpcPT6CLgIVbN
 qalmvEUsjv0Ra1+Fl0pq1B1Z2cyPWUjOuElgSEpCwfrdtCZQppnMeEcyIQL+b90vlcVvkQ1xY
 GhAQvJoqPkLsEer0JJVvwGpN9Le1iF5QnRmeIRDRpsDmDK2oCDZrb34FgUJskn5Fgp9IIA9Hm
 g/4OEs4XRPuayhkS/NAFQ7iuJ5qX3W4/RgSy193gHZTg0CpGAVFzd2E5CJ80BAkLnvfMG/yd6
 TLZuVojI6Aeww7JhGkeCErBVLQVL4f1OwFjU7fRBHp8Ti8+6P0n/AMR3LOw2i6I1iJxyob01e
 cHxEDPHgdRj+pAfod1N5rK0Fv5ao2Fr+vVHCnGHizhdyk8u2p4kWBykMSGtdMtH4/IXQCeXIv
 vQVjhloHLY7N8Olg5Z+Nnxxz6P3JFZAqIcTH2hnAFTcOlT/O1Pzyqw6TquujuNL6kdSzscD5N
 p2sYqFU48g68hv65PtuRXnN1sb7uy3vfNiLzqkIL06hECnCHzOmbnz/FqMMyObEhOzu+t6/3W
 kGY88Tz3TP090bD5tTHP6ogR/VEYALZY2r1KTejO1lKJ0bRNnUSNmZcxRt9LwWziY63Rv3UVN
 hNevSgafgQ1WfgNBdhkxdYU5sH0IjlZ0GtUCMIz6HojGcIO4DAT36YVFJHFRmB0VxEciFJekt
 axB1NhjIct+qiaXfaFHVNdHDG2vjntdqoSFzg0/pnGeZRv0Kq3GhEqokZnj8Gt+8aMak+2ppd
 2wb0bBlE2Ede9gVcVRn1K6g52InAPTuend9M06nGZeZEAGpFA48Zh3KNPJZ39fY3wWzlJbHi3
 sx5PgJtiUd9ZVHsXlhFrmGxfdpaEesM8VE4yrpAEDiu19cWacYWkBhUBrvgpOTeKDHx+VbpfA
 TpR67c7QkUqQ98OLdYxoKEUHrc+Vbaflhw/CxfXv8p2d8NBeyfEzyuQayIcDxII6nEkjx0yK3
 tWVV/s1WYvWmjJj/k=
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

On 12/28/25 14:17, Greg Kroah-Hartman wrote:
> The UFX_IOCTL_REPORT_DAMAGE ioctl does not properly copy data from
> userspace to kernelspace, and instead directly references the memory,
> which can cause problems if invalid data is passed from userspace.  Fix
> this all up by correctly copying the memory before accessing it within
> the kernel.
>=20
> Reported-by: Tianchu Chen <flynnnchen@tencent.com>
> Cc: stable <stable@kernel.org>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/video/fbdev/smscufx.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

applied to fbdev git tree.

Thanks!
Helge
