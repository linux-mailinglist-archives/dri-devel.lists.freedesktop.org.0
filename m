Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1CBB7648
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BDE10E394;
	Fri,  3 Oct 2025 15:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="nvnMhNfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DC110E394
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1759506652; x=1760111452; i=markus.elfring@web.de;
 bh=IC+cPBrAXR51b3WY9/VmEG5wgSDTu5/PWCsWWe50Jrs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nvnMhNfn1XWkwe0G8Aap4OdhO1hCKX2tHPLLn7RXWGpl3WKPyWzmi4MUdwcgHgzS
 CRjki0wZ7Z9ru/Gw1RMQKpvxLicWe9jB+7UsLz9hdkoEq62lvW1ZN5nexQ6mQAFlN
 8zB9RArO4843TzVgVFO7OIP5BIsejo+cXHdrZ6GChstDOhRF4mXxfXXJzHT8pHu6U
 EC+DC7EuSonCfeAdhp+mcdkBf2JcTV5scziT9y/EwLVjuVx3JM/tWhrlNXtTfNvcA
 qyp8ZZvmgTrjZmHSbLvy0mpT0aKeXe5vb1EE3W+vju56ytUPGrHEi7hMaMJUzO3m0
 SxOhZVADr8aGTaEhZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MfKxV-1uNwZz10uJ-00kXFq; Fri, 03
 Oct 2025 17:50:52 +0200
Message-ID: <8f14db49-7523-433d-abf5-156200bcec0f@web.de>
Date: Fri, 3 Oct 2025 17:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandr Sapozhnikov <alsp705@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, lvc-project@linuxtesting.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <20251002083332.11-1-alsp705@gmail.com>
Subject: Re: [PATCH] gpu/drm/nouveau/nvif: fix a null dereference in
 nvif_client_ctor()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002083332.11-1-alsp705@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h+nX7oipmgkC9r3V1VNK4OLQcGh2GU6kjNYHb7s9A+xA+8nMqKA
 AC0dXjdZpnLiuI7Tz82HHVTSN1jU+c32JxOfQ7u4cJ0RWKfVuM6Eg9FFVgtvWXOYtVzL06u
 6cPexMWrZQLI7D8mPCTCo2LC0XxqQt/cnAtC6Q0w2qwv5thru5Y+NQFPj2jtqm93dgMd9lM
 nWu40WhZEaXY1Kx+NGbNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BZvKlUGZAOI=;SNl970MrTuG0nOd+/uUkwMxNeSV
 n5172Dgh2TUo336L1pWKg04741wbhvLBCDjIwyFFG97Y83w9FRMb5qZf3k3eF3Htu1RLYH1m1
 xwLwTDbkwDZMKmiwTWJF/Bz1O49te2yELhtLESyMfCpzC8/U4k9hdN3jTlza03aDCWx7G/XUb
 nHapXtU7xXOrvGIgoUajsIHl5udn0rjKBTuxw0dMLUP26Y/lk6llcfFcVs8NFV2mZuEl2TKoV
 Mfj21PINcsxIGLRYZT4AuuJsZjohTMG9GXmU/Yv1N1GcwgCTd8/pk4C+H8vJA2n4+Tl8HRpfZ
 GSdz40d2B/PQkPu8koZX5kn73sBFL/7nyunpnR3HW/MUOmbrjrYJadzEAgx1aowCdPD6stGz/
 MFDKjlXlvEtd+pIqCZCktV9k/bAhm+5fhev/JW0rmRfpajGdNV5wwyJ8fttgnLqcCrloLz/+c
 P6ZebvE9DFbwZrQhVkG0eTp/92PULrwI69Ww2krnslJQ8C4HYgzExaqQqMIeCAQGEbKtkuvUL
 2v4luI+QZ92Q7u0q0BlfcsVriz0E+RsDuk5BKk/jAjoEc62FNWEOoowyVtBLIGm2+Zz9VCdhT
 kpVFmAU93u1oGqEyiheI/7vCHcf8Ttz87AwdWCl3PBWW8Fdvy43na617mYMt6rSL1PknFEowZ
 uDdt7XLQ1nvTbuIvegmJeDntF5R3uj6Sz5B9plIjQ5yq7aQhxgn29/YoV6L8Fffsyqki1UN9K
 YVYCbDCNQA3EZnxuQfrAYjeFtTqPrnLXe6bl7mW2yobcs5l11pc2vcag5GiOeeeazNuE++y9z
 LlKQZ8z/T+8nrhD6VdSBk5QfL72aWgCyWRbtB7cBeCw17qaDoQ7Sg/1tbYe6CpmyUOCBGve0L
 Sgky/sh23fJWJ+f97J35tOxVdGpFD21wB+tc6Vkc7V/R7yVh2I6dUFPc+9qgMhTrQ6cg3lO0Z
 NwL2eMoCNlBsDKHBkuvNAka5+wA13WUTI7hOMlG3c2ExIdHdprVcXnqlOf9hN0F+jCR9dmH1X
 kvYQMb/M7rew3/0TrZu+NJ+VYpGggmKskiRUB+ax3RjzbV8Q9DtkthfqIGFpHuxF5FX3LOmPv
 RpG0KReoy66LYZT0CEk9mrzuaVmR3X45WZT2zFfvLzvFxiP7/G9Cnrhb26TO4iWMODRuLyhd2
 qth7UFhtqRLK+FAoDpDjtDPPHYOlvUMoD/zJBVLh0Hq5tHoDmI/dmVF5pUEWA+myztcytrE9l
 DazbY6z/XNzuBxjKDYlz+smZcnL8d4PyvVhV3txlxLi7jYOiINYef3XJdm4IsiZBDk+YYCuVT
 FQx73WONemfhw6uywESugzVnJBPTcXS3bdsGXfJGFgWcRFceyJ02slKK8Zm3IRxchAOp8/uhc
 rgBo0/s5tNEOrigIT84pCtzeCkUIznmg2Q5MYM9SJ8/ry9OhfhfPfH/EMIL/ypXCOWHjesFhz
 r0Sm22Nr+KGGQxxeAMJhBUkOcFtdh8uMk9FHu+GLJSrhD9rqGSK/Z4K+/4QZT76rOwN004gZp
 t98gv3FZyRbwFc/FR3W8ZS7OIBxS/IGxWy3RZslkBiBzMB4/TemSuOmuo28K/blP2cPZFUjMH
 RT5yh1SauRttIeO2duU8bWRlRf+EZ6bs7NXp4MppIz5ddBMimMEOcF/S3EyRfWIvKmdq1mA71
 4rNsqgGpabSwTEp36tmSLgreiWUvStwnOXwfKtXjp/ZIYYpqFOl8HV/2E5/UF2+uq5myP6tQJ
 LxdndqIAJMcPMxj/k9Msxsh5R5lcLPrAx5fBiWbph2K3887bqoXSpV/4ujbCKbooeIJe1xVB+
 G3FuQ1QYea22cvih2Fn7TKZ/QBF2OZxBLhfCd4BN8wnrfY0Uo0xrBjNQ6oMD3AppJXG7Dj/hi
 QAUxLQBdr3oURXDMOJTi3r2Bv8obpu6dG0C91U0fejZaejzoJmTPIv4GjIV5/ZBbZ4XKtrGG8
 j32ZcxihaRNOn3J7XFmvoc0SEYNfo/edks/TjNmbM+r5F2n3BhgdztkcTb3T/h+PpnAxePpbp
 1qUVFTOTQ/Ep0SPP+mp+3iiSoW0nr6czzXug63B6lVjDENAUrM7j+nv0WXWMu4pBrEy8SnAY6
 2h+l6AsRos3Ds1gVGMKFRzGfhXmU7iSTD7Psij9soASLh8RzPsy4Xq/y2GQe4A+7TjYesKVv+
 zeFQM1o6kfUCbXJZofPtuXJb/CGmpnFo0sPirsPznQs9pFUbL5Wv4UomU55ITZ76vufyCrr5E
 82+bjRpd3UMnTeDJljkhJN43sITId+sLnVNNSs9yLP9+Ggj9an8tuH72UnHyTcvcG+gDQSVj7
 wEXExscIiKCk+ubRdj5Mz1AO+1qpoI6cxL5S3ySqcILJ+VCXm2n49JJry6Vnd16euG92otBTQ
 EJZXz2BoyQLZneHaNieAtq2xfdxg6uyA9oHyUMu6A196G8euExYNBQDrzsGQStmTrFZIYrC8u
 DC8OdKS57tn64jYJspKGIfSnkBWM69oGCwOV8Q/jGCj3xD0w0VoBFMJJjN3w7SaFfw1iO2lOb
 Jm3d9S4GpkePQWpVknwDFGDz9roQcPT2YzOzSmatxOOhkqlCF0riBU47uPX5nOdiNjlc7MLhj
 fHVmu+VeONmJX186Wpcjf5pOkTIS3mmP90iKKf8UKMJUm15o/HBsHnpl+RGnIg1UMBI+2LA4O
 K1fAngqmmrqdvB2wT3c/KfDy+cF28KdgZ9pgBX9cwgcYfotkUjUMsMLdjWFR8xBpHRY0RPqFz
 clryibTM8wsZbSa1+G0YMkPE/KhlyEUuyvFx8iubrjuIXXwrrq57HxNWJiWxKbUblpfJ+oSxZ
 4CynI6nLzX84YL2Bs3Ov+3rt5O+EsXz8+j4BXj0HxcrvQeutQ8xA77B3J4y9SULIxVWM9nQKn
 4bGNtNyYzshLaXHSZjZ7a+FqhAVikZoVlbh57N/MBs4xUG+Cz2E8y9ffkirnDIquV5d5JVWCa
 lXfsBCxLg0yRevE0g8Ztfr1QDUXHfl5OEmc+VI3uawUgkRKOdlVxo5TNHDAo6w60nTc4ew17Z
 M+0WmTCJHM8m1YzbbYeOBha1F89K16P5mWGWYN3JU4evJd066LUzX4EKj4n/FnC9PR6Jkbj8V
 Zy4INoljaovFHfanpIsuvqTOZGT6et7upTex820alwxeLfBzJdta3BfmeQhgz7AoaNXJCr93n
 Kfau5OeynqkOBhTjVt6ChH/RohLn8ItXL0Jgxcx+N4kIXrXzKipLglfHhpqJCt9Aa+yz1PFVq
 bgXnyyrsQBnnwjp/JjOCCOxBKKVSw9ge2XiUlZauIZrrFvDvBwQhrAW78Xpond8ssxsjai7Aw
 rrS+a6yC2VwElj+EsirLsyOIJBCJhGRwB5KzfbU8AgviwDRJ3yOfNYkV0oXxqqEAX54CuTVpr
 W/cQsjON0pqqn7PGnXhxzJ4vNW6I6DGmTHOmFIExiBb7HzFssTte4EHIVPJPkI29IZJho3U9t
 1oaXGWf8aT0GBWvu6XKvogT6Z3J4FHHebTPxSY+GhWaA6uLy2iQEbe4RCgz5xaZDEsBvrbDla
 sH7qNTuxgIbVaeWDIgGfmuDxi3ShUNgHJwQP1L9MzX4eMqviWCyXpYFmt+vAHrYCxVBCGJ8Vj
 DcJ+lMC9ycvLSyjNFh3voOow6PP/DsFp6S7Yp3ZMxYiUga/BoL2MYnnISDNKwkgaD8m/kLvfK
 Rdk4hvlGAjnKc91dykkMG98pfyGFWFUrZ8BspoFDE4KoYOdLa7Yp2Art0RYbDPed0j1XfHMw9
 qaSwdq+HJ1lC9ulsTQV+GbiLtHaoCWxRaW/4UChrvCm8X6quKAzWPcmk96J1kEgqE8gof5c9q
 QGdNfJormT5ihg5kkm2vHuRbkU864cTp1PEdcgM5vIHlQBrjQP5S3NvRDgZGs1qJeONYNPYIZ
 FLeyJc1SXbDSLwA4QA4IzStUXBUOwHZdbxjPPdlU5Gx1QO8CoeNXjW37ZOjPcMX0CEJ3Ii97+
 rpXmXloolwTV4oJV5YLb5wxdXc2VNrEQVtky5qhADgnL/AG7+mHdGLtypcsv9kH1SrRifIZQy
 rDSnLLN5hEhRk2Evb+MIDU3NozrOUhFBT2MmHsQGLwmeUtXu9GGPBNHr3kILy/2QgUjBu0Jo6
 qRVAmT2keoVeesYv3sMAl0QUD1wgevZJV5L9buxilbHlrjeimLPyZ2CpuwdPj2Zr5eTWmTrEM
 EK4VT70b5Wk9rvfiPTrMeFgFtfji5hldLDZHDeRFZhpxEZMmP8Qz2K/we1J1PZi98jbeA0lcF
 XbfwbbIFsn2vF4yyMeXWujZ/ZxiTLBuZy+rbjmWX/euD+nHbkgm26aYTeF5zDZW5MIGfdHoQm
 zteIS5X4zde42msWxPITiRAkH3tHb1K7unDebMHWLC6nMwLuXMphccL8A3eO27tVgTbKd0lOS
 0Rnyb0XUXfHyUvB7AIpVeC6hiW7bfBA98VZzvwrf8feODcjTELOA76Ai4lOyY/BOT6T/JXrw6
 ijAzw4N76IygIUvew4Eyk2exTU9z1FFvn4ey8s4eYVrS4cFffHJMgoe0mj90gfhU5iUsCqVZA
 NdKi8/quBiz6c3qpEHiqkJoiCREUWorDmUbzJ4B6uX5nurIqpKI1gUa1/lHCSyaYQ3T+sm/8w
 Eym3/Mnd7eInlrmODH1hDtJStfDN217BcBBcpAAae6Xxdfz4o+HKMLp/ccvZL8jw0+ahAV8Aw
 IsmPqh0uEXrYANf3Exf7Cx6jpCkPretrwwWlKqWtPULJkZNIsFOfvoJDXrEJ88yiPNsbAu/Ge
 MWbLJl9DfLxfeQeGOXVv8d7bDRkyd1pAhuu5upUT0bcDKPL69lmK7zAM6AAvVjLx/LPricdLR
 h9Z1zK5TM/SImnFTyA02pqIr0S4CVZfKHi+5PDEcdUbM1u+BPp80aQpeEcWqVwAGnJypiyQeB
 qf2F8Fo6gO2TxHMl2A1KBiutR3jdjDiDGpYQr2Hb1DJW+EvC2GZhJEjrqfynT46LsnkHqprbi
 QupnqV2BJ3j1yzuXdYdjFfV0rOsFR7PTou0=
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

> If the name parameter can be NULL, then you should not do=20
> strncpy before checking name for NULL.

Would a corresponding imperative wording become helpful for an improved ch=
ange description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17#n94

Regards,
Markus
