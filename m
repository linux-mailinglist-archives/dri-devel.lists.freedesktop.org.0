Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCDC9AAED
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1810E5B1;
	Tue,  2 Dec 2025 08:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VYKPUHGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5EC10E5B1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:29:23 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64165cd689eso9136846a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764664162; x=1765268962; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=;
 b=VYKPUHGSuRnqb9PodSbJ79vLuY+AdgiPr+dZvCzHH/Omex8tyAAc8xkqdNeG4kYwMX
 HFu0JaVFe0BxNCOeRS6W+rQbrLTmHghCiUYPCg3TLEviKHNbcaMiir0E3U7cdW+6931N
 Ia+OQpBZ5PLxMj9L7M05TtyCOKTXA99SCCSs6jxP14e5s75l75LV2OkUy+t/LxlG4OWm
 XcVyJ+HTqF442UDiTIi59tzKccjpge0O42UomT20oITd9CdilzlTAYxlDdu1z6gk1Nys
 p42q+fmbKvbJ5uySenv8UUNp+Imnb3RYy/y/b3ZsA7FzEKvneBWgr5jMglp2/94KzfgQ
 cKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764664162; x=1765268962;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=;
 b=iHCeaS8CxTKeY5Zjy02crbkjb/b2RwXGfRoNbXIkGO/cyV2r9OacOflc3AWZkQ9ieq
 pTGYWGIxjfJoKLmTMdik8DJnmBxx+ONAsPgIWkHof4jSFr/n7WDchSBSYvE3NCUGG2Pj
 MeGixOv8BfGUK+yb5bm7KP98WSGyw0TUugth1RAJ0DrbMZdaiO4NO8wxGDzPxPLo+bdm
 reN4+CiVrVFFCaiWTz6IYsN8vuh+ILfH6Qp5mFjRLMha7T8i70NkbH3YfH3u7jiwJsx+
 hMvf2dmrKU4ZulucBssKC1cfK5iMXPQ1OvVUhXbmoWXcwfnPtCDyAby4w/XxsXr4WgFU
 k7iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb6Bov2TAxoJHZmR+LY6SSsstgeecmYOONytBGjPR/l5ceWm1AiTbJwXiJOVvVZ5k1pTdU+0GTTag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV6q8ZVDBB12IHdyOCjbmD4zorwFGh7K7s6P6oLC9R4GMy14R3
 1ZyOPAbYK8cH5USuZw7vuKGjibpEf0+wpo3b54hkJy4Uw8EpcOrN5fqQ
X-Gm-Gg: ASbGnctOw/eNjXGOnhvbLZBFvc7BHydKMg/LhgjIklKzNltDAnkTb/pDU0fF4q+Ib80
 O0OQk/G5dSu6NU2kC0YXzXNUYxmNJFcggBZ+nwUgwD46Bt8Y33hEj0y2c/NFF1o4JGrICi3e86I
 7Vvmz0BD7hjgM9mF1qP3b9JfVUDKm2lLqcKpbN9kMjBjHGQoA1TwAmPBv4iX1x3HHvPXQh1XHa8
 bh/ht+sTQlbnfFoPUfyJMs6ppwtM42o5x+dETDHGZnBEcdN1S8NIB+FPPKRt4T2K2dant/Q+TVp
 X8TjICn04/VSwFh8PxVT5cA+xZ8+g6xKnAOF1PQLr7wt8+ZdP9y9swE8Z0Bop61QEacl5JZ+nOM
 hvl7VJhospvBLPOvklQzgl/+a5P7XZopZONV74EdcRWC5S1TmQBNIzN1CcYFmncw2RHrc8C1IqF
 xYBKfF/7VQZ6kcLKoR04T36CXL+rlnWi3LI1fo+wGTLZonRfkKf/stI3xRzXQTFQORuK/7TZWck
 P8=
X-Google-Smtp-Source: AGHT+IHjEo3dTSPtXuaE0YTbWgrbA87SGNQIz1itunkq73Jcs/neO8kKvVs5IxH7P+kpLe+c3V08gg==
X-Received: by 2002:a05:6402:280d:b0:647:62ba:123b with SMTP id
 4fb4d7f45d1cf-647892a97a6mr1662944a12.9.1764664161284; 
 Tue, 02 Dec 2025 00:29:21 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64750a90e44sm14669936a12.14.2025.12.02.00.29.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Dec 2025 00:29:20 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
Date: Tue, 2 Dec 2025 09:29:07 +0100
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
To: Ao Xu <ao.xu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
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

Ao,
Any chance for updated s4 hdmi series for 6.18?
=20

> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu <ao.xu@amlogic.com> w dniu 21 =
lis 2025, o godz. 03:55:
>=20
> Hi Piotr=EF=BC=8C
>=20
>     I will check this issue
>=20
> =E5=9C=A8 2025/11/19 18:27, Piotr Oniszczuk =E5=86=99=E9=81=93:
>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>=20
>> [ EXTERNAL EMAIL ]
>>=20
>> Pls see inline
>>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Chuan Liu <chuan.liu@amlogic.com> =
w dniu 19 lis 2025, o godz. 03:57:
>>>=20
>>> Hi Piotr,
>>>=20
>>>=20
>>> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn =
why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>> [ EXTERNAL EMAIL ]
>>>> Ao,
>>>> Is there any chance to get this s4 drm hdmi series for current =
6.18?
>>>> (i tried backport this series to 6.18 but have some issues with =
reparent vpu_0_sel to sysclk_b_sel)
>>> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
>>> background here?
>> Well - it looks it is because bug....
>> Martin Blumenstingl had perfect eye and catch typo in patch =
https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com=
/:
>>=20
>> By replacing:
>> assigned-clock-parents =3D <&clkc_periphs CLKID_FCLK_DIV3>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VPU_0>,
>> <&clkc_periphs CLKID_FCLK_DIV4>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VAPB_0>;
>>=20
>> with:
>> assigned-clock-parents =3D <&clkc_pll CLKID_FCLK_DIV3>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VPU_0>,
>> <&clkc_pll CLKID_FCLK_DIV4>,
>> <0>, /* Do Nothing */
>> <&clkc_periphs CLKID_VAPB_0>;
>>=20
>> dmesg is like this https://termbin.com/6020
>>=20
>> So i'm getting hdmi working - but only when device boots _without_ =
connected hdmi at boot (and connected later)
>> If hdmi is connected at boot - boot hangs at:
>>=20
>>     0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX =
controller v2.01a with HDCP (meson_dw_hdmi_phy)
>> [    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare =
HDMI I2C bus driver
>> [    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops =
meson_dw_hdmi_ops)
>> [    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on =
minor 0
>>=20
>> FYI: It is after applying =
https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v=
1-0-cbc2d5edaae8@amlogic.com/ on mainline 6.18 (with some my adjustments =
on this series required by changes in 6.18).
>> For VPU clk changes see =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/f=
iles/0312-drm-meson-add-vpu-clk-setting-for-S4.patch
>> It is 6.18 adaptation of =
https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v=
1-9-cbc2d5edaae8@amlogic.com/
>>=20
>> As kernel hangs - i have limited caps to drill where root cause is.
>>=20
>> Maybe above hang is reason of my backports or missing any pre-req =
required to get s4 drm working?
>> Anyway - it will be good to test with updated to 6.18 series of Add =
DRM support for Amlogic S4 (plus info about any pre-req required to get =
s4 drm working)
>>=20
>>=20
>>> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
>>> selectable clock sources, so this reparent operation will definitely
>>> fail. This has nothing to do with the kernel version.
>>>=20
>>>>> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu via B4 Relay =
<devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. =
06:39:
>>>>>=20
>>>>> From: Ao Xu <ao.xu@amlogic.com>
>>>>>=20
>>>>> Add devicetree document for S4 HDMI controller
>>>>>=20
>>>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>>>> ---
>>>>> =
Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 =
+
>>>>> 1 file changed, 1 insertion(+)
>>>>>=20
>>>>> diff --git =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>> index =
84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40=
e08def38 100644
>>>>> --- =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>> +++ =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>> @@ -55,6 +55,7 @@ properties:
>>>>>           - const: amlogic,meson-gx-dw-hdmi
>>>>>       - enum:
>>>>>           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, =
S905D2)
>>>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>>>=20
>>>>>   reg:
>>>>>     maxItems: 1
>>>>>=20
>>>>> --
>>>>> 2.43.0
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> _______________________________________________
>>>>> linux-amlogic mailing list
>>>>> linux-amlogic@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>> _______________________________________________
>>>> linux-amlogic mailing list
>>>> linux-amlogic@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

