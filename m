Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C189A149FA0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E910A6EA2C;
	Mon, 27 Jan 2020 08:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7916E487
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1580109683;
 bh=Pc06qExR8Kb6H/LUYyhBxdPZ2jme5MOfyUnPNO9DSJo=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=swBUXaspFCZ5Q7nABy8cDgYkGagdfKiFzZEPCOTxeXtZtEOCyrdB5G12CpnG56/Ue
 7tbMcr4XhfSBlXTnUGM+mfMNc3eRqiqau+9z1huaJqXsX8kl+V3WXAkXXoiFPOqbsY
 Gm2dEoEw0Iz8xcxrz1t5tgvqSBoYugGWWqq4RWAQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.115.58]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MDPEX-1ioai60OOD-00GtDt; Mon, 27
 Jan 2020 08:21:23 +0100
Subject: Re: [PATCH V2] drm/v3d: remove duplicated kfree in v3d_submit_cl_ioctl
To: Yu Kuai <yukuai3@huawei.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Eric Anholt <eric@anholt.net>, Navid Emamdoost <navid.emamdoost@gmail.com>,
 dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <56e99398-15be-aeb0-32b3-aa8a20d71e97@web.de>
Date: Mon, 27 Jan 2020 08:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:U86YuvZ5etNwnJ4QvCtj2kY6LQZOf3fqnnG/9PWEF8nYoS668ms
 EzeOlcJsIxmlh8S7s+JJNzgPNchqsqUSrLBgySjuTm9hY+lxh51G+b6bA/J1IYCDaRrbsCC
 FLwh8Js5h/8SFFVlYXK0vXWmfOeKWdu//Rt/huLZIKziw+pDja7JHwOAXT0EwXwd/FXF5V1
 mZto11QBiHQOdHQ7Is/5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+PEUXOPj8gw=:tUZkP/qHsH20kKfxCeoJVu
 Q9t0u2mns5CjkvfxHJjLyGebldt4IutpIOMNfDKgWT6AxpcoqbMlvtlybcOsA39pQuIFoGI2C
 4osbmpKvC/u+orntwKNZxL3xWql8SkwzBFnSTLyGgPhyonKxoAQcFEsZk3ytidStcdWv3UpY6
 kxoY1Fhe95Z7khDf/etGVc7ScdAhXggf63k1Dx4P+9JwIRcEBRfQ4Ybrh6Ka958IjCpyFhnSZ
 1qke8bdq9nG9ltNYcW3i0qKprSrQxrTJc3Rfz79u6zxCuu/NBIVS5FskwTB3XSiUBCPpu9nAc
 7vrTiywWt9LD/0Gjdms8e/KqYeb4LIl7SKqbaeMe3ItLn3rc0UCdKHfp2OpDIS26aNDjgvYPB
 3OfGEqHFryTA+8iNFOJaQD6tNGan1k57DPUh+EcQhbr+6rYIKWTJEfSaEYBc6SMpQj7AE6SWE
 ql+2MjyG9q9Jm0Fcf4LR1N2Hk9r63BHBmHs//8yOA2iZhK1TezpGE18dpzJ/xQVydiys+r/FZ
 RLg6p9u9uZ99Ha+tMysSFxt8MSO0duqMhdtADcPMxRtMN+GKA9Kth1Zol4LPU2gPDt3Uarhp+
 zarQHMaOqWNI9/DyepiItEIpEEke2ZnQ48W7ruzZlnmMLfuor7Oviw0hR1TEkBnmSuaD3P6je
 MG1bv/uy21F/3Irkg+X3REwDqHCux9SzHw7TzZV6EDMnlki0aK37sXQLlRqARHh4sqp2hDiwA
 KC66vQsleN/nilH2yqro1VtZS2TPXFIgI51srwzAeyRF48BJb4InzPSxWIAgc0P2eopdQ3I+F
 T8DifGF9NLly87NCdr9dYk7+GrlXiGAoAuzZ6hXGh5wwn+no11HobmLpcUs2h9dBwsSrfzuZv
 42C2QWyBaopophsiL884MvLjCtOc4Kw2GA7VTXHALunFe5nBXLLP+PYFXYYIdV0EEsgcS/IJs
 3UqVfb6/abEPu5Ro6XUeSRMOeP8Yj20r1YGyt5mGlGMeSMVMHoupzYTZDe6d1lwWDMSHQhxB0
 BqyZh/VC85qu0E/2X20COQxe9rEtUuMWs1RaxLezkxY96EzPpMFsCHsmI65Vd3uOaI0JDrDlz
 4PYtdFT5Y7h5HHiz00foY8ABPoNwO9ilQ/5zh/HKoRU+I31N29BP5JtcVonGVOpKhWcZbOYjL
 bA8qdC0N6CP8UZ7y5u5XVMh43+ngSWF5poQd5NiTz7SIU6BAEFgc2ZzQ7MulAj7bXgH0R8jLI
 kApo1vKd5NhA1KQfp
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, zhengbin <zhengbin13@huawei.com>,
 linux-kernel@vger.kernel.org, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> kfree() was called for the same variable twice within an if branch.

I wonder still how this software situation happened.


Now I imagine that it could be more logical to delete the second of
this function call if you would like to look at the history of previous
two patches once more.


How do you think about to add another jump target for a bit of common
exception handling?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
