Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A29ECE07
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 15:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0A510E192;
	Wed, 11 Dec 2024 14:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MtQDeTxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9452010E192
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1733926041; x=1734530841; i=wahrenst@gmx.net;
 bh=stG4ELtcQd5gH2bjK19nXV0ylPXp1bf37+1nDi729hw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MtQDeTxbTanpMfNbI8IcHnNzU8Tu6CBOfogQRTAnN1uvyX1ZkIRp7GBlYhPjAPLX
 dHNzXF6KZ3m4/AsP8IEaQ41lVDFu1rDhQitHsKdRG1rj/n/9hsmudNm8n/u/J+Pn0
 P3XRDvLVRkLwM6TAbujaqMseptJDPn/OAe/xPqhoRoTCaHMPMfNf8cpNZKlzZQeDi
 9bt57NEfZNXCYeAaHWAIci69FETlM6QJHU931lnYn73lx8MkU5V4QAUIZKcf+T6ZN
 No+z680vuSCW5vzTeooIWNn/Ee14/ePYQLfiOc6s5YjnZQ+U+TcJZe1rPnCYPoSaS
 Ea089vK/8IeoqFtpkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUnp-1tW0Se0pGj-00yjt6; Wed, 11
 Dec 2024 15:07:21 +0100
Message-ID: <aec79911-2ca0-466f-a620-c4426f215a6f@gmx.net>
Date: Wed, 11 Dec 2024 15:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: plane: Remove WARN on state being set in
 plane_reset
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel-list@raspberrypi.com,
 dri-devel@lists.freedesktop.org
References: <20241202120343.33726-1-wahrenst@gmx.net>
 <d2a0fed1-22c0-4035-9b9d-feb78c9e3ac5@igalia.com>
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
In-Reply-To: <d2a0fed1-22c0-4035-9b9d-feb78c9e3ac5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rtJX0xuRSYJUMTq3N98AQkxdvZTDEvbbBywL0F3FSFWtb7TO8Bt
 rJAlCJarzAR7VDECh1IsZQdpOz+k8cn+ZdrifkLo7CaBe7bv3ht1wWzh75WPulGBZ9MY+re
 puBytpyrI4HpFK8AywAU29GgoLeQnkLuLbla8ts/l+Qkw9ZRYSR6sKtuxJLhQUDCxDbXSI0
 RcSED3HgvVio5GLTGAWVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SSaHt/ci0fo=;7/OLkWJYbdpMuTVuLpzT4vBjxOT
 xA4tgRbf9OuUq+LnIjgH1RA9v+RK1y41qn+NYS0UrdoX3zYXFTxFOJdCkAmgIwUGqo34ROmDS
 ycbd8hHdnoTCUsTuY93ZflxZYmFxRTg2NYci/+TcCmGsi3EVgGir0HO4W39pbPEfdYoemFZt7
 4D8fjB7ZWfN+BMK5GP1v3EfsLHmqoqRPEqYxrcwg2EqcsWGsuvcLc2xg4bjHbEqpjrE+IYgOt
 9kPoRRQed5iB4VTqyERopZV8WA7M7MgtyKpR1lVkJCOpJuUbArehsQzqFickSYS8secPyJwpp
 woEREMYckLlYvIkhvHyf+N2K23il/Q2xej72xAOy8h4Xjs6+qcqYIajTNbqG5Gi32zn9wZPOY
 6QruGH1YT158MkJzEtDaT7pw+wKm30bey68iOE31amC3lgZEZpDMJk9Sbky5EuZZ3f/qYO/4h
 C1mlWkrfdMODF4h6EhPAsEimm4++EEM6G3l+FWgXkjMT6DXeyjhf7Kx+wzii95IHgZbX+Qy1V
 /2/iYkEjsxACdGpd4JfV4qsvA2UiFT1Eqhk8qBUT3xqd/tzC2R037GEAnKx9H7mDEziDH1Rcc
 ForU2VaY4VMmGARAlr49VRd5lPMWSg+xNBREIkiEdNb3O8V+qtxXK9ci317T8nTP6IvQQnnZL
 aCUto/4UFSYB82/DwQYys7OX8EhP61vvfbPUjEHAIxp23OfcFByAoXmTY8+bwq0t96+y3eHW6
 F+pEzhsneFSVL1xB2+LXINoz+5FMjibNxzeYEZutBQLUkOjTPJTHgf/wkIQMoHIHZGy2wb56r
 3wpsEs3whogClKlw4EAJ0NCJ4IykhIW5gOphMIp5TeMrzXT6UKLzyHosYd4dQqWq/ngJdsLvM
 3NEFjtViIpOVCcAnr+YKcDngDI5r5iGuvLclIdy8qCHEhpsVXuu1H1dLlT4qHWg2pgUgvLaOR
 LBuK9t9OOnePsOzkEKDFynvnHNj9yWX4BxEJZHIZSuVppfLyxGMqxQq7kXC1XNV3pRLeUDq4T
 hWJdflW8iDnjBba0bCAJ+FLNxqnq0x36Gx5rcmUFqgGaQ/fflfEEblu+ScgNblu+FERCewkpc
 dyie2rmfo4kPvg3koItqFROZbiOy/S
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

Hi Ma=C3=ADra,

Am 11.12.24 um 14:19 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 02/12/24 09:03, Stefan Wahren wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> It is permitted on situations such as system resume for plane->state
>> to be non-NULL, and that should be handled by freeing it. Do so.
>>
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>
> Was this patch applied?
No, but Maxime send his RB.
> Let me know if you would like it to be applied
> to drm-misc-next.
Yes, please.

Best regards
>
> Best Regards,
> - Ma=C3=ADra
>
>> ---
>> =C2=A0 drivers/gpu/drm/vc4/vc4_plane.c | 5 ++++-
>> =C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c
>> b/drivers/gpu/drm/vc4/vc4_plane.c
>> index ba6e86d62a77..1aaa4938824b 100644
>> --- a/drivers/gpu/drm/vc4/vc4_plane.c
>> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
>> @@ -330,7 +330,10 @@ static void vc4_plane_reset(struct drm_plane
>> *plane)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vc4_plane_state *vc4_state;
>>
>> -=C2=A0=C2=A0=C2=A0 WARN_ON(plane->state);
>> +=C2=A0=C2=A0=C2=A0 if (plane->state)
>> + __drm_atomic_helper_plane_destroy_state(plane->state);
>> +
>> +=C2=A0=C2=A0=C2=A0 kfree(plane->state);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vc4_state =3D kzalloc(sizeof(*vc4_state)=
, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vc4_state)
>> --
>> 2.34.1
>>
>

