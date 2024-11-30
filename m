Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4629DF153
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 15:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1810E118;
	Sat, 30 Nov 2024 14:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="hFrjncKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6343D10E118
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1732978314; x=1733583114; i=markus.elfring@web.de;
 bh=Nifl2V/3CKBYI7gdEGbl16DM5HQdoonN7ehB/oWYjFE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hFrjncKGxl39JwIhtUEdjN6PQbDtSizgvwv5aPZJIWlxEjR/vt/6bCuC6MS+sSj7
 Swaxf1tvPRemkjXwF0grtS36lRljCyq4IXo5xxLofnVJm/P/nezGZLt+jc8Sm5JhE
 z5rbr8TyBLWjPTq2Rkd+8I+kvwxtS0EKYeftENnrDm/cIJufN70uq5jncVHbdO3SQ
 DIrze7dOt1bfCkr1EGYJ/le/niB2NkaSuimjoax+5JoLx6el0R21G9QLPllrsLRdb
 vvOUBw9J5NufUBmeGHATAt6q9rq+miMkp5aYxWsh6MORQy0XKcjmrXNv+J+JUR35M
 Y7yzGSacA7hoqwsK0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mtguh-1tXHa10qGV-00vIwN; Sat, 30
 Nov 2024 15:51:54 +0100
Message-ID: <e1de6040-dba3-40d3-9088-5555735224fc@web.de>
Date: Sat, 30 Nov 2024 15:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EM3nnya8VmuxiXCRf6b3qWdwOEYygi/Zk+41d7Ggy4PvOymXs5a
 CaewBGoJsAoFkKvKQddvLTYeiWJ8LGttTZq6oPeqsZ0FXUUO1cGF0aCS9wetWB/BN41LdK2
 ozSLEpDCU9r4voOnDJGgSpejOJDAJlrmv0UCYggqSpgaUSE8RzmpzxIKviPNFmN5xagltec
 YeaE5o0UzgvjdrPG16yFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XFO4vol6THE=;0hECVTUByNrT91fFcv+fZRG+LOZ
 d60Mg4yG+8OD0qUBvP9m829GywGPd6V4Fy+vFobpgMk2mhShI71t/aoo7DFiSzqV8twxLzjNg
 GkraHIFksWBDBpWX6g6NpzJAwvAAEQ8usqr5JxsWeHkH4D8zRZ4+R7b4XFhZO7NVlcWNiupcc
 85hMeAhrAUiIRsX6QDW2BNQg7r0voP2gc3/VozgIPVoxsKoItf3oGYwg2tUaGppRR1fV0vSjE
 sTxWBZwTNfMZPqEtNR2/CD57F0MPWLOavpX2cp00SUMCe2B3e/mFr/Er9dX7FlmmNsURtewGd
 coaA0qwO6gRquqEjAh8hsEORIEnfk9xEOXlYgfk+VfQ4uVE0kMK7oy8JkbriQ9m+ExOpTrXx0
 R+yfy23PWsQ8Ebgvj2spRhF8niDaTxwc3chJjWNlGhRutywSXlSBzWBW6c8JKsLm/6n3ydBS+
 01hxLw4E3th/qKuwvU9Np9pvi8fHL5hzGR3BL5jfOmTuZVFWtQqxTjP5YFcgIykx3/IAfc77f
 OjyARAcjHvJ1m9/P8BVK5L2LPrmRnTAemej0z9h7s1ZJlvx/wNdqJKSbeAfrDEWznRRoi3jIo
 uFztlsWgdrz7+CkYIFbRJJyTYLpwh62awnvTcyew/aHKt1+7ikD3DkdCbqfaKJEqweoN4oD+W
 nd7JDf0WdjrImDh1H6AxGjJ4kzmV6c/uVCWgNPyx15/Ypm68jaZEOe5grcUEIdXwo38l4gweE
 fpXO/yoNz4Hs1AVkRF5R/QEYHfEm3vR7Haq09YNH36oyr8NKeqEzJelZCijpaNV6RZAZdpVV7
 qWaAbjpomAbqEmEsaLMI7QWva//xo70erh2AdnSpwUsWz9OgsbIYVSopelo14dL5sw6HLT2cz
 EVVfFu9q3Ht0JMDF/GffuepAOkeWpfmSZDDOQTp/CkM8A1lTaVJulV5Yc/04engfhw6N4DQos
 OwGpfMN2kBY4nSzoCguDVzCw+RN/7Mo8UT1A2p0o81TCF5/WxsBuNd8oioE0QGS1NHlsPB+UA
 Zkr85uYzFooXauaMkcDqUnryXNy2WnkVQctfQpDyE5SenZJVrHuOLqCRbV90Lhr2VoA38J5Nk
 3mrCNk6ZY=
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

> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe

                                      return?


=E2=80=A6
> Stop pretending that it will always suceess, quit if it fail.

                                      succeed?            failed?


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12#n145

Regards,
Markus
