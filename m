Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FDC7E7948
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 07:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A71210E699;
	Fri, 10 Nov 2023 06:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DED210E699
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699597756; x=1700202556; i=deller@gmx.de;
 bh=mzmInWrcKlEoZlCDgYKca6J8mggM2/gzz5fukII+uZk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=KxNT6uAYuCplq9uGDcO6AMMW0VgJj5iuKOPi9dRbXxDtAGFIwR2Q8Kxa3XPi9IMi
 A2ZQByLO/Wfq6sWVKhg+qKQnfCXav4WUcqMtv6AhBt2P96cTRR30QfVJJHbxz5hF+
 0rtrTnrzJtgBiuH86khaWLGiIOu+Nw15mjhs1ue350eZKexxei7/9n3qXKI7V74bz
 Z23tCIEdeim4PO+SmRD/G1eOORsfN9pNmuH7TIxq9lgu1eSlUVtVtwK3XK6Z5QnlX
 7A01XXUpHHm0+KAhjBIrLOtKjU2fxSmw43N/tGQAyhfLq9AabVOB0geYPuXhuWcSY
 ZZoeE0eqIl7W0jiQtg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.22]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw3N-1rjVWR3FlT-00j548; Fri, 10
 Nov 2023 07:29:16 +0100
Message-ID: <214ad016-c96f-4777-b97e-fc4db989e089@gmx.de>
Date: Fri, 10 Nov 2023 07:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fb: amifb: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f7dTg9L3+tDz9oLE2DJ9vr+Q2tvM5WNNNhz7uAJaGkfLIj91n/3
 eAC0Lym+Rk3efwrWkoI3FzuhFyUTpk94Mu+PdySP3oVRCDGr0hFXzyvHjrfzSW5yuGZEzqC
 J06Pd4K2WuX/oTCTDIr4UjrCNm0ejZ7BQ6JoffrahDjiJ3aXbaZCfCxhKcXZk3Y06g3AFa6
 BvTBPp2sgHwEhHk6qVf9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j2rRbO/JA/I=;oFG8vvNxFRw3jGjPHaGfywiC2Q/
 2aCREwOqQOWKdf2Mw+yh4rzBRcYWsVhU9iimteY5ThLCL+0KcmZiimheg55Ip1ZRFTnnQXqG5
 Ee33dW6pyJIpY9Xk0Syi+Mx22i5KtLQgZREKGUs1iNYLl8Ja3gleRt8AuI9yPov8ViN0j8TxS
 NB5IBLU1BJOFSKckEupSfaDxecXwvvDMZGEPdU2hsJ3PZu2KF8Bdp11il7IIFKRYHMJBoNoI4
 Jt9Hey3lNR2P6RgVW5HxEJS5M37Dzi0r00FZI6y556Ihnk78jZjOUqcNRf2RSUUJoZF8gDihj
 NjF+40c/S9K8SCcEzCvEJ+gPgGpEdm+kwMcwwDLRjluap0Y/R/mWHCmCrWa5/JsQI59ZjnSwy
 pc54FQ3Gh9XaFPj9lfj4ZijpJMQOjBJIpFHc7AT8i5VIi1azTbcIUuqiKCJHM410UIA9G1aSX
 LK068OtLo7Q1dN9s2ryZKxadMrzQRUMgwMcsAEeUeVazjJwxo2qfPNTdwQgulsU6F+041JBzn
 tr2nF///mZKVXH2SJdaanjOELsIi8rJoIGx0tUj0eRwiTLpuKTdhXgwWOWk3rXKMtdEAglLNH
 LzscPSl0Kby1cOy7iClVVRC9Y55JDdlhotqcV+UewtPfS8ir5rhYYcON1gMcNEaRKlho1pdkO
 JEF49I+Z6CQUAAehOfK3DeBtWesp9yXDBq4Q+VZKGst2bFw56itgPA6iYPAFEJ4vo0m27aWLv
 jXPVw5YMB5Unq/Da0Ui6OXukVYnf1J3z1k/XUaU2Xje2yuPjY3wMnJhI07WpsUUfBu6kFzs68
 G5uMoDKrckjabBcdLQ3hyxxh386qK0MLg4zWzYpq70sc6O7wFo6QF3S7gn4mxsbLjU2VDX++l
 7NL6caB0GinkNdSOFLhrCIxQvH/pGyoXzXigPS0IjULgstbmDzLbssQfPTFfN78miBCY7PMYe
 e0ddGw==
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Atul Raut <rauji.raut@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/23 23:01, Uwe Kleine-K=C3=B6nig wrote:
> in the series https://lore.kernel.org/20231107091740.3924258-1-u.kleine-=
koenig@pengutronix.de
> I suggested to replace module_platform_driver_probe() in the amifb
> driver. Geert Uytterhoeven objected because the amiga platform has very
> little RAM. This series implements the alternative: Mark the driver
> struct with __refdata to suppress the section warning. Patch #2 is just
> a rebase from the above series.

Thanks for the follow-up!
I've applied both patches.

Helge
