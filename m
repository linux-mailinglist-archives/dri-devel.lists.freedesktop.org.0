Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8FC9CBA2
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 20:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5570410E68E;
	Tue,  2 Dec 2025 19:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="irJU6IPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4608310E68E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764702565; x=1765307365; i=deller@gmx.de;
 bh=A1e7guE1xlN/gI6ot+gw4o0j13PhWp4YDpGVxkdgmIY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=irJU6IPSSXa3qoTw98puCGQUQ6GztIawzszEXairnaribemieaKPMTFtJVN/V4B0
 ySKGRiJ+e6ZY7J3b38Od2EquSF/XY5VzbUz4wVp9hkklgkjjzn8YAUlIx24RfXwlp
 /TUyIr553ATFaAuAozpsOuia+IENrLoW2bfnzOfjMcgzd/AWnIWndjwqqNN3QIb/s
 GuIT9p9wn0FlPmqn9CWoycZriS0VWOvdO0PQkg6jT0uT7W/I+Hy7KfRCCe4YI/5bV
 lJ42golLQnirGoyLKywPlQY3Qxl9OtBDrzvYz6Wbs1LNqzn43vOwcPQY6uPqJw7Zm
 Yxq9RJ/o06wVUYky4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1vXyNM24pB-00JurL; Tue, 02
 Dec 2025 20:09:25 +0100
Message-ID: <3fd9bee7-f256-45c9-89a1-32f661769965@gmx.de>
Date: Tue, 2 Dec 2025 20:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/tridentfb: replace printk() with dev_*() in probe
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251115125701.3228804-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251115125701.3228804-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:umfci4bNAgMLUqYaNW3sOhC7eR1z8/ZyUowzy4AhWbxKdj0R9YV
 Dcp6b0l7FKgwiQ4SwqSvbsHuYjNbbJri4n/btZN7vhAjyZ1rIuNDgtCDck0qI+R64qrrEMg
 +S9bj61BF2G9VEDGtg7ehyssiku5XRpYzgBBT49uScNRD9hGDiLItHX7GWBp7/fAT0wADIG
 KI/ogYRPS4XM5PlC2uXAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PHBr2COXjuo=;A8Qf9EB0lAG7bfqigN5yRssW4Ma
 9ry/owdRfbT5honrajBDsg1sHoP+4Ndcb/y59lvv25o6Q7rpl+P5e6W2OGVpA68BBWGtd4i7B
 AK1Y8wMY/nJhxcxQA6hiMmdWfLiFrgm9GTk12qI82OpEj/jasGEgzCmo9ElL949j74KdYBt1o
 Z46rTY5+gv+IrogWsQSCmBdzoKKyFL1yuBtyFN+nLyDIW/vT3VAUwH/cavMhV2Vxf4Hmb+jiy
 wTB8i4z5gCrD4DVB71jfRU6XTm3nkl6axDopfaXn6ReCISkRnPquX5HRkylesDY9daOn9tj8U
 1+Lw9Zpf1J1NpPomj2o9U6NJZc1zPnfTWaXexwkjQpbtBTa8byKceaMRtwmwf/yocoRubP8Iq
 fZ1V9K580SZVParHfjJ8vHVYXCTDD/PsEpK4ZwnxHIC3AuW+R4k00nbf5OrXY2P1snoXJPCoB
 nSjfGzSzcDKpe47jzOqUGyDDporEZXPOJ4OwEyXo9ynfBL4rmV+sFvHWmOLtukr34I3ehbZI+
 mmSsIpgn0jRsq9SpQ+1CeOJWG+vSLeaJUALgcVKhoMNJzjLsBxhkJrtLVl8LnP8ZlMLl5NHWf
 OkWqmpwxYW1jdHFW/jsvPrrqnUbtv/u2dkrhFrf1xPFtqi7upb8oOfDcpUasvhus5DLq1VvvR
 s3PziQYvIhw2ICJGp0wDg+TeiktbPE5qljS2UqHKFCBK6MkR/J2yBAjV5ivHIC5jvkZjS/asX
 05kj0yshl851TI8hLyiVzMzoJDJlOUAwE16BBitLaRTC+KD6HpKdVpJUAzWvcCHXM6SqRfhw2
 z3p3hz3tSPYbyAzwKvrr6Q7BPzdfKNnIq9w/12ByK1jz84gQqiHJSljaI5270sTC3jRoK5wRV
 cx1UdVHGKO0cv6N5oJTSmnwCCmlhMZu6qQwSAPATMS9WoyPU5P1BGxCFKTe47CrEpzFBxXwPS
 EcCRsybLmJYG3NzCsp7jLffxFJZ6gcHO/MOs3QJGKCd610iOlI80BPD1T7zNfltcRcisUDToR
 G52CyOl+URMLENJUrLpUGQzkR0xkZf5nGKvWRjY0oAa3JZy5GmFYUAvvrcCOzJfxhYwiV1ECV
 3lDbZ1queHjAOMGlIu1OyM/vknuju419xncbXZAfqCaeqXALxco/Z1xB7Y8QwxkoxdKJy0SRa
 mSOgvq0IiJp/bjzNrm1QSWj47hO3CfjrgL8OampLzXRX7ZlJ0v0H98ZRQmEIibbfcg4BS4gN9
 4EFXQDGWru+jkxCNrTbZ5mFMqjnQi077tbDsHUyYaxEAUGK8NLq9i3WwcpMOAb8aG0+uMYwX5
 tXddHRyofv8QYoTMICNndwsLEH6AH90I4aEG/47MafNKKwZ3OSyPiy8qgJC+tWGV2THGrv9PF
 azIrB4MFFKBcRgKjuzmp4FK6tWmy8BUPVn3EJ6hMts8qlD3CtLi319SewouPN+SM3FUWs32v0
 1yMWu80N5Mf9GJegFnN5Q4Ub18HpfRNVyc3QnfpZxEYq0c0mCkRnRe8w13VWZX24id97ZB2OR
 jJUQ1WzN67cVisrEvUR1lTh49N5/9byLUxNnorKVYlysLowcAHiqz8l1Jibf0QGl8RYA8aNCR
 Q6e7kp3Jxy/fKzF1AKgYDtkhxd0T6Ifc8dK2ig170ObJe6pqM+xZmHyzhibXfyvb+pqjLpRbY
 WoMxY1YeRUI9eORE9bx1SOyIo6IlXAf3S8/PZtWB4WQcaGDRwS9C5yBLONLVowLm92yIs4MWz
 mDUewVOVJR4RxfiHC5h4kI43sEHo75xedgQqPYDj1DiV5RmcHg0DFlqTdTdKv2djNQ2o3m/L/
 1rLpFd+VGuj2cjcMqssd1mf7P6gXidm6T8/yS84y2sR7AlmiqilflsTYaNd+Sdl1qyKWu5SIA
 8rLufDuFYEJWQBm73ehpOEatqXf2tt6sEv62GqhIOL32AHzOrmu4a4bVahPXipJX3RS7gMZ6F
 QIRFqXW0d0nXGQrzIJeHJNUG0AIVNom+74ZZJWGe51yCfiIkhk71yfVlgZQEQ5XQqCG9K1n2I
 45Qum9V8wgciqn3e2FFxLJm8Em01kTDJEBd95W1kyu8d8wNFZ8ew/DZttyhlXkBL6XsOY84sF
 pb6wiFjOJB2h1zM1vTZ7nI0IxZzp1o65OcIP36n6S/EKKuvwc1JxrmZbOOJe6/CMGLoTfFKck
 O/and6vYjMbGoLrcT2MEU+6onvZHywW19Eq1takgpdXR+VMsHrIVIcH9HjoiVUTK5dUUvvVVM
 cVBJJ1URoa6/rONhheQgRkbiN32ZN/xCQU2497Aqjx3zw5mx+m04WViO43al6mYZDvS30lPTI
 jsYpnN7MXKwFtYNetkhPbnErItI+g8sjHEx/VNrhefRkAvgzNuF3EHjPE7djzNNtl3pJkHKxm
 FJRbUyGmj18buIhF2Hlwz3OkFQQVtaSxCniUlfcnchIV8C6z8I2rxVBurLZ4QLMfFnbxPXbMW
 bWCO8TJsA1fK/7OJSbeQ1cnMtAqHdhSawIcwdGH+LD2xe4YYiyelbUIlqb1kXbPbhlNEbqRqa
 RLZd2c/JxWWpOLzqn2mkQk5foluip5XG1+wAYXNb2r0YhwTFL7FtG0p6hjs1lR7Qb4+jPDXF1
 fsUk3IpwDp1+u6tNhylccse6RbsSe74gWESFfpjJVpVMzn3R3qPYNacxBh1qBOoyQ3MRg7XaT
 nnwFGW62sxygo2YclwDIm6boGDIvACmVq27fzvsrI+XLDtpD1YE7EJ8H5pnDSPZyqHme2FCx2
 CwBEccwvSPGlGMDY09YPZt8wKiptfT/2S8xcUDLtgYv+xDvldNPJoUSefInJlBdQ1GVmQTfVD
 vR4JB9uV0bOkiPJrzOnZAqqs0aNSpsPyUWScfCmk77z+ytYdTLLe7hXIBXa3uk2cYjtBaxquT
 AYyQBzajG+nRud4PWN2aLBmZS+Vx3j25txsRK+LDalijTiVlaJrwb7E5As3bi1M0ZLAvQmk0Q
 +tMzXNden7/2g9ostrGKhk+jM4y1zN9Lk/k5T0ro/8dc2NroHJ9tcXsUhEXp8kzr2mCGkoKlS
 vUBWlO8qTU9g3IXcn7nh+/qIycnT1JrKkd0DLDuiawMRkU9QCE/szu5NVtPQ82sPAkjo02foC
 NpemZED5M9u/pG5GsQgPiugTVZybAlW5Fjpmkcz2HpX5PsP6qSROh4MYO8ghwovb8YJ0EwSGB
 VkjVpb+Wvx3MVjiWEDRaMQmIE6FgWMMCOPs/reVvVCJw0DvfANVliIYgkAMJ9gA7uCux0CCT3
 imSRIJbqM+yoEmnlPEPTWaxvaFSnKFta51/KCWZNmZZoS/pLIo3/kwOX6a7bjP7TNf6Ui7Hj/
 1BIdamdgJM8kcUU5Xxj51VL43nT72nKV+0xrguDs+fuNhSngL/kymP3sHS2ZrUSToHJUjr3hK
 3BUbJUxXL16IVhKJdyEP1RLR3Rzygka0O53PMuAz4dc8qSg0JDrOlwRtsIkVWQkM+fx+2BkDt
 mdYY/85TgkWfee1CflY62zSfQPo8DhetG77ppga5r2P0miHZSNIeFEj6sHZxqyjxF9GHIGJkp
 XN8FdtBBKsSORRvEYi3ICWx+hhqOFoXLTTMlxSx2C2Gjcc3sYH9OXOzbcFCPtHnkRanEV4aQk
 4sT8q62WzkTDOeCx+4SqYenUJPk37O05g/PtW2z5IQvCD7DpsxWMnF6D9FZj/YUj/fTfb3ziM
 rsujRfNo/CoNmmTT8BmvctWGKA7ylQiyeuXJHuOzhBZhDyTs/rGmqZEucZ1w07FAdYfgCKVl+
 LLgBvLNMeHyww4mhO605HLXJClip5hxFk6boeYNQACZrB/5nvqc+QYlUq8PFycYWBn2//nzmw
 oeLJMPidi2I+pW+o/8esOdH89YeVCWxbx3AN1uEKVliiFz6/HeNt4Nov11W0D54TPkhYL4u0e
 UunGCNtw6SN7Hi8kKgeGb0nDmgyH48OxkUHdONyKJgNM9fXWm+mT8dYQppCoLfJkJKpOYWpEy
 w58Ymcc3Sd2u1V3C5TsOU0jEx0Qr474XKIyhsOtPMs4NNvEGAEnmp5VGGG4ivL/oJTP2RuFxp
 2pcVU/qlNDCMCnRfL66SJ24S25A+Vsy1dBaV25l6AfiC3JIBO9a9EKSvnejlJ7ZoIF4pjpmBK
 Np7KAFC4eB7mPRl1TfK4LqKy8mneNxykUdHvPWLfggH3cLO5k3sBX6WP8ZD+tRdSLPINASbBj
 6sCtQg/NF9UamkSO7Mapc10hn1QnQNq8228Exo6mIqTlMG6/zhg7aKnEDZP/DNfABiDmdC+YQ
 sQHtVJjYSvNNlA+9AQRkxtWcHBaVaruNdgVyKr/XvFiHsHF+JEWOXI6GlNRpLx3vTryFi6t5M
 przWqEDdCeUG22eefV1yI0b4rj0sa4O/UHGpADrDh6lURrKhMxxG1wo9OWGOW8YQtV2y7BqTr
 VbN1vzn2DcRnr4v/M5A5yZlbDMPRf7KsKMZTegFha2r+fkeLmmAhlic5ygnpks7I3aUUTL0mz
 wVRLJZzTHlNQdMzX7m3iLJ8g+NFdLmnv8V8tMjh/iY0TCJJmnRCaftP4myoGvuzU4M7m/AoSp
 isHxmo8cnaZd5c/Q3Ba5V1gKUk21oRDls0A2SkKNiIIlesTkOwA56yXju4PqAR+wHk+yGMY/t
 E9XRy8a9BwWDU+UTT7YMYZjYAmST9pe5jdas7CQgZvPUFcW4LQmGRVulYnZx0KqOLj4OY/Pjd
 T22xssP0DggwHmdmbxpQMBa28f5w2nVllWDJI67+h3hXtuMO+dCy4voKOJrAUy0T0fGRoTa2g
 10zliTTCfSrxBRKFILDTEXAY8ulR1mDL9ddyY81TxSQsHkAoSftFgMcOBib637HJ/mJFcIK3/
 WoaV3DD6bo2pgu+JDLz6Y4goRrZfOSQlTIOFvyugi/m6yr+GzMCMtg0FoiZDIBmwRnPpWGNGP
 l30i37z9LEkD+le5Qh1Kwf7+NoEslEBll5qDGCERmdRxFmW9AaOV1EmX+mKW4n6LnhGMm7YnQ
 axElJeDRwvMF93GmOmmS5Lf3BrW5ef33pSHGsPlEc6BXu7bCYwCDBhrmsUBV3FovYPg0IGCXf
 DsVr+0zzKyNjTW5Nl/8E4Nj+HcWVDFI8beyNn1xyrHSW+ch93Jf9V5K8cFmwk27ZQ64frZ6bM
 MNVLjGUNJhzrhAOiSD3HZ1dgdoI4AXFnkMCfUt+S/pzQmjAxFF4g/ptm4LaA==
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

On 11/15/25 13:57, Javier Garcia wrote:
> - Replace in `trident_pc_probe()` printk by dev_* fn's
> - Delete the prefix `tridentfb:` from msg strings, not needed now.
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>   drivers/video/fbdev/tridentfb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

applied.

Thanks!
Helge
