Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDFA69B02
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 22:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B809010E040;
	Wed, 19 Mar 2025 21:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ICf9NO8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF94010E040
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 21:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1742420300; x=1743025100; i=deller@gmx.de;
 bh=bcY81RHegsA5K9Dklh7OtrTkviHnthyGD71ZJUFNBYs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ICf9NO8ptVocpB+EPmfHtHfH6rKsssPtM7oSc0nywrNLmO3UoGv+SuKTABaGuwBs
 f+0BJulfrt0coZbom2K13WLSq+LXDPSx2rJFRY41IodqaNfYnbT/AIkfXldXtbYmc
 zYslZuGuiJN7cS6gyf+M+qdEuA7OgVPqYrrdZMgzuIVFrWZbQAvMV6xk7ds+0M7QQ
 B1o1KrocJKaYDFZc2SR7C1y9fvtxTvmy2tQxf+Dnq75LlRkhVSh5ckESKSv7izHEb
 StJ2ZQ3ekGqo3ftVJIrGpVv3g+9Jlktc4rSiVjE32VyFMPqmLJsqY6J5bVCJLv7eM
 I2li27ShcyRLIqEDGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1tE1Jh0Q69-016SOm; Wed, 19
 Mar 2025 22:38:20 +0100
Message-ID: <5b53866f-32c2-4c19-a4bf-61038efde91f@gmx.de>
Date: Wed, 19 Mar 2025 22:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: fbdev: sm501fb: Add some geometry checks.
To: Danila Chernetsov <listdansp@mail.ru>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250319013011.467530-1-listdansp@mail.ru>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250319013011.467530-1-listdansp@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n7U7GnXQpP2Oa1OZbFNAR6Wwrbb4U/9ODQd848hHz964oJK3pcW
 v/MrY1o5w9e/jY0qC6r36OjuyPetxt5hmSLRj+97rBpjHmV8znTsAlDh7eZrNNunvFe5uw0
 yJ5q53Gr0QLrzkpVDCZ5O/ipEiiw4vaa/KgsNOdzU1EElLd0vOyxzw1oyqJFah9sxOJzm/u
 eUA6S1Bsi7OPd6HwZuoNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hpgw2wiPSuw=;aJ6hoHMNaJaUqa2piWrWG+OA3mC
 V9WPYWco0J4UB5Zb0cAMbu2Fv1D+Y1mtZ8X8edV0KgO/WG6xqP2XAoRpCSHE56GCVHE2HQdmO
 s4jnbX6bSl7wrNbkbHGblK+UzjxDQaKqtlUFab45lPMWaxgOvMV6vegUGw5Tc2sEMmt+KSqF2
 k/jfwuHPRbaZAFig/wKejktTdDHAR5PPsDi6+nsJsNKqceAi3upRJv4N8mmnFW1NPlDwC4tP0
 u4FqAFbojw3tBvubVjmQMsfkqxmspHGVuHnO6K3soHA871olU4ANvaQ6Mynxj9/f81sVWhhy9
 AtGobtrz9VdjL1mkqpCzlWVSlphJ7/Iv/FK7nrO/CUQ2/8hhfdejI3E4x43EpReTfh31XKJzE
 Rgz3oDAFqOBGSGE09a5VgFpTt7CdPOtgWcpW1RZ8yAZmNzG6e8bvmnU/PkJybhAUi3Jo5ZvNj
 XZN8rb1H3P7inmZNvLq/TjqM2DOFo2HdMg1vFjidegtG+wv3nS655tLfebUh4HdS+sBUOP5IZ
 TtNpaOkWSrXd5ElA8GWoRP/R4g9Y0fha/e+ZwZfpWn+2PZ0LkG2EFO1barSMp3mJqw5QM3DQq
 ptEYdLTplb6igdric5VtzQupVUtjXvEd1v64K54jNQPfHkN9EPfrhFc45TDnB/WepCd7LJcKl
 QBdmd9rD99uosEeJCH8uHtclL6/tgYsePUPAyiSL741cvBAja5Ab/tLLyN/1GRXz9RYJeS3QP
 LptghZ8nrUswSKQpNr4gL+tr4hSfMwJ7XKB4W4SO/Mqz1bFUghNM1Olk42L56NoQkgYWCN1mt
 jS/9JdOviYJbUhU7iHfuVLu6sPYt5PADTCIjTWY22a3IrQ4N0ZfzhnRgxh5Dl+jIP1vsThKY2
 XcEOjpJ6R0BX/6hxYnjW7qMQ//v8jttFIXCpgV7IIE1LI16YIetCuRdNQ9q6Jv6asXPLUQLiq
 x7ScFp/70thbwtf+LcLiujd+46aDBR9jPh7hKum3f5j5bgOH9ggbozBTXiDekFCaYZMZ4RwDq
 Iouq1q/s0WkzdOLSfuGFUIAEMqqL8wDvMe58HNgRfRqS9OiEvfHuzJgmS3MlaxqrPZh31DvxM
 9WMo855imdQRapjzkTIChDzaYDFK3lqd7Z3YLepai0izmE2fI5W11wYmy4fWbqRvAc7TR4LWk
 zKFEkBxbCRe6WwOR7AxYdD1R8kPXhASjyEiSYRG8A/4FGmVNUfwK69/2un/4dV7dYOZrVB1J6
 afPwka5HRZZbYb2+CUfEizDarmfnrDMqxiCc09rbe74iWYmsAR4zHhHR0FETTnAqEIapo2o8y
 OPTf8r+YRXFwi6avUFTECTSfIOEkSdEsGJS6oJquvjgZMuSZYsvEJC0oRhZyXdxCShbofoEdH
 wyNqbpXgQjqdylq0aQLXh2WLOOh0VgYePpLxvqWIi0/Piqx7PcFB/sMUiluHpPztkxye9AJmK
 DNMZOKpz3+JKEWsK6s6SY/1waEZw=
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

On 3/19/25 02:30, Danila Chernetsov wrote:
> Added checks for xoffset, yoffset settings.
> Incorrect settings of these parameters can lead to errors
> in sm501fb_pan_ functions.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 5fc404e47bdf ("[PATCH] fb: SM501 framebuffer driver")
> Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
> ---
>   drivers/video/fbdev/sm501fb.c | 7 +++++++
>   1 file changed, 7 insertions(+)

applied.

Thanks!
Helge
