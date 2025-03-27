Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9FA73579
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576E110E116;
	Thu, 27 Mar 2025 15:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oyDOgFje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783DC10E116
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1743088752; x=1743693552; i=wahrenst@gmx.net;
 bh=fycumse8yqNHOHHACVAXGPuLaZr6jVx+l1EKF0RpT1g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oyDOgFjepTERFHfnJ/z6W+2kqreEstcRBjpNk48yMsR0UOJrDNFY+LEnCDKHAlkC
 8wSF12m7poMK3mcjfYhJk9fWsC3C9PG056xyH7Ng7Bc8hMIWZNEguPhcP7YPQ3wHi
 y0xsVP/x8QAztqrOg0q3VABKtgk6d/Awgq4c/CQQLBnIJ+5OU3X/7tbV4ibE7hg4F
 Y5VyRmX3Kk1TUAuOHXFh48uk3TUR7UWwiMvp7oWAY8tJo9DjA9wHtRC7ZWlknCUCp
 IdPQLiJAn6voCnHYzRTs4X811lTXDR7KqEySQAKVtmiIT6FUGq8/lAmZUTSlomlIg
 7ydwKcly3IwxseGPwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1u1gco0FFu-0031Xx; Thu, 27
 Mar 2025 16:19:12 +0100
Message-ID: <6186975b-4f28-4caf-89c1-f2eef2e28a65@gmx.net>
Date: Thu, 27 Mar 2025 16:19:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/v3d: Use V3D_SMS registers for power on/off
 and reset on V3D 7.x
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
 <20250317-v3d-gpu-reset-fixes-v6-5-f3ee7717ed17@igalia.com>
 <bffb4df1-1171-4a9b-9b73-af33136c620a@gmx.net>
 <f85dc2d3-a601-4caf-9ddb-c3256423f001@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <f85dc2d3-a601-4caf-9ddb-c3256423f001@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QtIeX+lgVlLAaan2V7Rzg2Dg/uvbZOnnoGBx7bK428OQDSiJ+Re
 YGyrVCfwM94yuO9hFby6gBILYzVU0jbl2p7wG/p4chrWV2Kf0Br47WK0FS/ymFPSOAyV3Hz
 HA8enH+xRHTn0n2PyIPd98uckS1PLBxLvzjtVWn6dTd4nVeJ8d8A3Oxi4zZOD/cvB5XkGHj
 2DkkNpIzEsYevb/O9I0xQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1omchPZ5PmY=;m4Ic4shIas5jqAAq48TGu8scags
 3amylJOacgKWXTkh+8YQKV3AM5K9xxZDIqECDt2nZCJozIVxnQrXZMV/NA8uAaiBtEMBgFNpH
 OK8rz0XLQae4XCGYYrEJKqTgKYSL83Ro+yGJnhuYt4CCffqXzop052FF28D0zS3gx4UNtyo81
 4kdv4+xvi1WE3TOV4F8AvsiEjYfkSHW5eMvWHEp24bC15z+eQlcY4i0/I/fJgsEGAnH9JCu3v
 zp1SUuhaObmbH7kDM+ls/3paxy+Ge2MO1yi/1KGb47x2W6RtIhqTgkOhfkqFhPt5Fk3bG3+LI
 JOnDzUpkDsblk89WTlpeZe0+OP8y5MMJwR+qYLLaFThFuCg5YHL3BNujEkbOfV3ZoxngRvEV4
 hwIxxAk9XHVlijj7syeT3MNzkkhXIYKBc0DhZOcL2Vn+D/ZamUBq8PMEoWrahkvoKmfHn9JEG
 dx3mgU/F6SFNsW3Rup3MZnGYSn5yT67idQVzprE9EDWPQEcF5WsebBxrr5/U/pEzTqMteyMj7
 0coXaFe+YcH56FoDoIKUeUgutmQdyoTvJkZIvz1rvvH8A5ncA6HwBRIihQ/eb5qIZ01169xNR
 LAvuvsu7T4SQSaPym7RpABR4yUzVOm5Ej2/f5RhmMI/z6ak/AneLVt7teRNCsWtuSr28Ycnug
 /4XUA+BE2SL67tUPJTxuJWeshC1UxQhRHNWR3nZbuH8PW7vFt4l4SQlECBBZgp/BqxUl5Fesv
 bz8+jKVMxDjk7O/54Y3pUQL6TtGvPsaOjfKBaZN5CeZeIDkJyDf/l5GdnTWDAon4rJhHnkZNe
 ONjft2W9eRNplGMS7X7O3gVCzSFzVvn5dW+HK8ce3F5CsSQ0KLTVl0Nz8bqCxEKs7j+HDIKIF
 qMAfSFShUVn70i2l40tlG07P0HIoHLbRZ3ZVWw18tgQ7vTu10s7W77jraucAbPLlB+m3vU17k
 4bc0TBLqzLjpQ8ZIin6cL+ZRlU3NiwEatkQXFHJKP/YaPF78jWUUe8gYTO801tU3+4Qxgo+A4
 wph2Z15YqeTqPDIUkPOyMyUM/VuUkHqyAfzdVt+vnjavjJZss2rr8BXR1wtFf72j31IUgBjRP
 f1W3CK+gcWiU+qNeqp6yVguv6a4MQvdh9l0QJCYkECNrkBagp7TWc/q18nFU9TQCVGkpf07DV
 HcSYD3ClrdItPgAbqcjrsbdXBmmuu78/XPn05o1w69tLeHjOJFK8hpT8hhA4Ukg6O70jefiH3
 ivaUBe1lAFLqnGoL+G4a1lOxbuGJ1/cFiHdJVfGTWu1mvdsb03kIIbk+lY+BoIetp1Q+3MQPM
 c9zcVIjSzA0qzUQG3HUiIU3nlUgAvYl6vEDBXncpKUA31D5nnDEbV87sncnZgWBDwiyM08/CW
 a2xdSVjmxHFDvaEwjHKYRMJtD4pAkFHaL/V1qV8WSi+J2ZY/H/8tA98g8U6HpTT8SxQflTK1J
 sKrgVCxkf54yCQ2yRHW9v3cW1Wv0G1GEpgrcysxwsOeHO9PtDJSebd6YmtpaXWti3EWuNpQ==
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

Am 27.03.25 um 14:52 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 27/03/25 07:57, Stefan Wahren wrote:
>> Hi Ma=C3=ADra,
>>
>> Am 18.03.25 um 02:01 schrieb Ma=C3=ADra Canal:
>>> In addition to the standard reset controller, V3D 7.x requires
>>> configuring
>>> the V3D_SMS registers for proper power on/off and reset. Add the new
>>> registers to `v3d_regs.h` and ensure they are properly configured
>>> during
>>> device probing, removal, and reset.
>>>
>>> This change fixes GPU reset issues on the Raspberry Pi 5 (BCM2712).
>>> Without exposing these registers, a GPU reset causes the GPU to hang,
>>> stopping any further job execution and freezing the desktop GUI. The
>>> same
>>> issue occurs when unloading and loading the v3d driver.
>>>
>>> Link: https://github.com/raspberrypi/linux/issues/6660
>>> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>>> ---
>>> =C2=A0 drivers/gpu/drm/v3d/v3d_drv.c=C2=A0 | 40
>>> ++++++++++++++++++++++++++++++++ ++++++++
>>> =C2=A0 drivers/gpu/drm/v3d/v3d_drv.h=C2=A0 | 11 +++++++++++
>>> =C2=A0 drivers/gpu/drm/v3d/v3d_gem.c=C2=A0 | 17 +++++++++++++++++
>>> =C2=A0 drivers/gpu/drm/v3d/v3d_regs.h | 26 ++++++++++++++++++++++++++
>>> =C2=A0 4 files changed, 94 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/
>>> v3d_drv.c
>>> index
>>> c63f0ed1bd8a3d5511085e76ed2fbd6ee7df6f80..122848cdccc4a02039d9ea2e77aa=
2f377886b5d6
>>> 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>>> @@ -263,6 +263,36 @@ static const struct of_device_id v3d_of_match[]
>>> =3D {
>>> =C2=A0 };
>>> =C2=A0 MODULE_DEVICE_TABLE(of, v3d_of_match);
>>>
>>> +static void
>>> +v3d_idle_sms(struct v3d_dev *v3d)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (v3d->ver < V3D_GEN_71)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_=
OFF);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_T=
EE_CS),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V3D_SMS_STATE) =3D=3D V3D_SM=
S_IDLE), 100)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_ERROR("Failed to power=
 up SMS\n");
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 v3d_reset_sms(v3d);
>>> +}
>>> +
>>> +static void
>>> +v3d_power_off_sms(struct v3d_dev *v3d)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (v3d->ver < V3D_GEN_71)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_T=
EE_CS),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V3D_SMS_STATE) =3D=3D V3D_SM=
S_POWER_OFF_STATE),
>>> 100)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_ERROR("Failed to power=
 off SMS\n");
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +}
>>> +
>>> =C2=A0 static int
>>> =C2=A0 map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *=
name)
>>> =C2=A0 {
>>> @@ -300,6 +330,12 @@ static int v3d_platform_drm_probe(struct
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>
>>> +=C2=A0=C2=A0=C2=A0 if (v3d->ver >=3D V3D_GEN_71) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D map_regs(v3d, &v3d=
->sms_regs, "sms");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>> Is it correct, that BCM2712 now requires the SMS register and otherwise
>> the driver doesn't probe?
>
> Hum, yeah, it is correct, but I can send a patch to ensure backwards
> compatibility. But keep in mind that you won't be able to reset the GPU
> or unload/load (power on/off).
>
>>
>> Just a note for the future: the devicetree is considered as an ABI [1],
>> so new kernels should still work with old DTB (no regression). For
>> Raspberry Pi OS, the kernel and DTB are always updated, but this doesn'=
t
>> apply for Linux Mainline. AFAIK V3D doesn't work with Linux Mainline on
>> Raspberry Pi 5 yet, so this is just a theoretical problem.
>
> Yeah, I had that in mind, but due to the reason pointed in the end of
> your comment, it was okay to do so and ensure that reset and power on/
> off will work when RPi 5 reach upstream support.
Fine :-)
>
> But, I'm open to send a patch removing the requirement.
I think, this is not necessary. There is no need to introduce such
"complexity".
>
> Best Regards,
> - Ma=C3=ADra
>
>>
>> Best regards
>>
>> [1] - https://docs.kernel.org/devicetree/bindings/ABI.html
>

