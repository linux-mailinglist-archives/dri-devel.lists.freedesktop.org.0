Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDFCB402D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 21:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C88710E049;
	Wed, 10 Dec 2025 20:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="SkmAv2ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64E10E277
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 20:56:57 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-bda175a2013so29024a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1765400217; x=1766005017;
 darn=lists.freedesktop.org; 
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=nczMQniPGwZmFp+MrN87DUwPKOB7JsUrj5G04YRvd1c=;
 b=SkmAv2ibh6JdtOL/I4cW6ZESEFRfGfzB4rIgJymKm24x0gW4Z0TEhg4oRTTJPiR023
 Z8Yj0mhUJT+CVe9m0RhmEzNfnTSj58xS5vEJnmpLG7Q7Zw+j9k8w2U/Uv704joMg1STB
 gozJZJsYFzeK6hy4y+3VpmbzvV8e1X6UU2sh3YMjw/1RVATBhhYeP+z0ydlrGe9ITccE
 KEJPbLZBi8TZ7HY3r2xk6TSi62Rw0PuEya57uJWrwZC0DQ7D5NDclrfiyDfHnrFDu+aD
 //gEV9h5KYvcCd5ihi98rd4Cv6E1fGOJ7g6XzIOmbB8nOqwJ6ziNGUO6LLMm0PnexiNP
 yAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765400217; x=1766005017;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nczMQniPGwZmFp+MrN87DUwPKOB7JsUrj5G04YRvd1c=;
 b=i8l8je8IOWZFzVHVE7LdCdgtESHfjVTXdUXa+qhfIR74kSGoi0RBodCWOrx1Vgzo/M
 mZq2o2IhK9b5sEcIqhxmJJjt4BzDAqS6m1rHU7zQz52+kcXIv3Kmr684O7uLmL7EeqI7
 Fx35zofA4d+XWyJuzHN3Q51qU9M5x0wq+EbsFXC7VXCvypyrBZJfLMtxwo1HF1BccALK
 L9D6m2zvUBKVzS2UfHVHHz2Cug0ZIZZ7BtZotfZ9LiG2E8+yBRY4lDSyxJ6wR+SXxTv4
 OM74PvJbkbHe4z+4pLKBt3AIKHzIY9yF04jWbY4M1m5TlrsxD0zP0yGGgoamUMQJGuVR
 sRIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWplECQlgbghBPgmuRXshpDqNaph30HkfRvcUHZpImWxhDHeMwU2UT7VDNw23/ZWyG2xjsvCXUFDGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz20lGiQ44aOn6DDuK1zp/ox7998hMsV/rxkezpfxeWfbiVKCRF
 64QWJRbW5nZywcysRQV1Rfm4jLrcBsRFOIsK2tteLi6HLx6qdiT1mA/3mt97vtuK1yq7glluE8O
 3vOjrzQ==
X-Gm-Gg: ASbGnctDMw2VrQ4BQ/9hSB/8oXL6ugwuemTFMEeEhqaMbdZ7L9YRMONgc6cToDcVUox
 GMXujD4EUI6rv+cyGYB2HkBrOS8BbJGrNq+7IaZNBjMCvqmsDKnLKsiK6/CERoKvxCoFmWs4mC5
 dHxI8zO40ds5MKYEBaJvXsUqbYPNAOgYOtj4A5QXnXIwh1HDJtKDTerpvRsuhgzE1KctM4sXzpx
 NF1zQCZsL/rdTqBc/ulRKp/OB6tbPndvUPqrarG+tu5M1CXHMwR/HB0FP4DlP/ujkTPcLFXztgj
 7s/j61JNGp84iEhLM+8yOjmZ3kPDTf3PWRtX09qxme3P0B06bXhH9VuM80y5qEZU6LWecWhHWAe
 anbjeniklL9Hpnhuyo9A8X/24bmYasFlZVdzRQw2MbnjzpB0mBPmDQDUaLWLC9eViRhSkrg65k0
 /xFEcFCXT8ORXmX1a++g51wYxjo8eD7X7vtzyawmuhMtQ=
X-Google-Smtp-Source: AGHT+IFxPbHYThMKokZQyjYMK0pffRhooiRg2gryy4KX/0jcDqMN5t1g41FTsJTxv5VJ0gwETJEbVw==
X-Received: by 2002:a05:7022:60e:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-11f296edc1fmr1585718c88.7.1765400216364; 
 Wed, 10 Dec 2025 12:56:56 -0800 (PST)
Received: from smtpclient.apple ([172.115.17.107])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e2ff624sm1474002c88.12.2025.12.10.12.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 12:56:55 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 0/2] Fixes on CM3 helper for plane shaper LUT
Date: Wed, 10 Dec 2025 12:56:44 -0800
Message-Id: <99B1C134-C5FF-4D47-80EF-1E282DF6FD9F@gwmail.gwu.edu>
References: <314e9649-90b4-47b9-afce-7ed27bad219b@igalia.com>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Harry Wentland <harry.wentland@amd.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <314e9649-90b4-47b9-afce-7ed27bad219b@igalia.com>
To: Melissa Wen <mwen@igalia.com>
X-Mailer: iPhone Mail (23C54)
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



> On Dec 10, 2025, at 12:48=E2=80=AFPM, Melissa Wen <mwen@igalia.com> wrote:=

>=20
> =EF=BB=BF
>=20
>> On 09/12/2025 15:19, Matthew Schwartz wrote:
>>> On 12/9/25 7:18 AM, Melissa Wen wrote:
>>>=20
>>> On 09/12/2025 12:12, Harry Wentland wrote:
>>>> On 2025-12-09 09:44, Melissa Wen wrote:
>>>>> On 09/12/2025 11:31, Melissa Wen wrote:
>>>>>> On 08/12/2025 22:34, Matthew Schwartz wrote:
>>>>>>>> On Dec 8, 2025, at 3:48=E2=80=AFPM, Melissa Wen <mwen@igalia.com> w=
rote:
>>>>>>>>=20
>>>>>>>> =EF=BB=BFThere are some unexpected banding and shimmer effects when=
 using
>>>>>>>> steamOS/gamescope color pipeline for HDR on DCN32 or newer families=
.
>>>>>>>> Those problems are not present in Steam Deck (DCN301). It happens o=
n
>>>>>>>> DCN32 because plane shaper LUT uses DCN30 CM3 helper to translate c=
urves
>>>>>>>> instead of DCN10 CM helper. This series identifies the necessary ch=
anges
>>>>>>>> on CM3 helper to reduce differences on color transformation made by=

>>>>>>>> those two helpers.
>>>>>>>>=20
>>>>>>>> Patch 1 aims to solve the shimmer/colorful points that looks like a=

>>>>>>>> wrong map of black values on red/green/blue colors. Patch 2 extends=
 the
>>>>>>>> delta clamping fix made in commit 27fc10d1095f ("drm/amd/display: Fi=
x
>>>>>>>> the delta clamping for shaper LUT") to solve some banding effects.
>>>>>>>>=20
>>>>>>>> Banding is not fully solved by any helper and needs further
>>>>>>>> investigation.
>>>>>>>>=20
>>>>>>>> One easy way to check the current and expected behavior is moving t=
he
>>>>>>>> cursor (doing composition) to get the expected result from GFX. Whe=
n the
>>>>>>>> cursor disappears, those color transformations are back to be done b=
y
>>>>>>>> the display hw.
>>>>>>> Hi Melissa,
>>>>>>>=20
>>>>>>> Could you share how you=E2=80=99re testing the gamescope color pipel=
ine with HDR on DCN32, i.e display and connection type? Are any extra gamesc=
ope or kernel patches required?
>>>>>>>=20
>>>>>>> At least on my own DCN32 setup (AMD 7900XTX) + my primary monitor (a=
n LG 45gx950a-b) via DisplayPort or my DCN35 setup + integrated HDR OLED scr=
een (Legion Go 2), gamescope always composites when HDR is enabled. I applie=
d your patches on top of kernel 6.18, and my kernel is built with CONFIG_DRM=
_AMD_COLOR_STEAMDECK=3Dy (the downstream name of AMD_PRIVATE_COLOR for Steam=
OS), so that shouldn't be an issue. I tried everything from 1280x720p -> 512=
0x2160p, and it does not work on any resolution.
>>>>>> Hi Matt,
>>>>>>=20
>>>>>> You need to hack the DPP color caps to enabled SHAPER/3D and BLEND LU=
Ts as below:
>>>>>>=20
>>>>>> diff --git i/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_reso=
urce.c w/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
>>>>>> index b276fec3e479..96b4f3239fb1 100644
>>>>>> --- i/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
>>>>>> +++ w/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
>>>>>> @@ -2256,8 +2256,8 @@ static bool dcn32_resource_construct(
>>>>>>          dc->caps.color.dpp.gamma_corr =3D 1;
>>>>>>          dc->caps.color.dpp.dgam_rom_for_yuv =3D 0;
>>>>>>=20
>>>>>> -       dc->caps.color.dpp.hw_3d_lut =3D 0;
>>>>>> -       dc->caps.color.dpp.ogam_ram =3D 0;  // no OGAM in DPP since D=
CN1
>>>>>> +       dc->caps.color.dpp.hw_3d_lut =3D 1;
>>>>>> +       dc->caps.color.dpp.ogam_ram =3D 1;  // no OGAM in DPP since D=
CN1
>>>>>>          // no OGAM ROM on DCN2 and later ASICs
>>>>>>          dc->caps.color.dpp.ogam_rom_caps.srgb =3D 0;
>>>>>>          dc->caps.color.dpp.ogam_rom_caps.bt2020 =3D 0;
>>>>>>=20
>>>>>> In short, you need to change `caps.color.dpp.hw_3d_lut` and `caps.col=
or.dpp.ogam_ram` to 1 in the dcnX_resource.c file to say there is a "plane" c=
olor caps.
>>>>>> The thing is that, in DCN32+, these color caps are not part of DPP an=
ymore, they are MPC capabilities in MCM that can be moved before or after bl=
ending.
>>>>>> But the current kernel implementation checks DPP color caps to expose=
 plane color proprerties.
>>>>>> Checking MPC and where the MCM is positioned would be more complex, b=
ut not impossible. Something to improve in the future yes.
>>>>> Just found this: dpp_color_caps.hw_3d_lut || dm->dc->caps.color.mpc.pr=
eblend (https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-ne=
xt/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c#L1636)
>>>>>=20
>>>>> Should be enough for new kernel versions. So you might need only the b=
lend LUT hack.
>>>>>=20
>>>>>> You need to confirm that your `drm_info` shows all AMD plane color pr=
operties, but gamescope basically checks CTM and BLEND_TF as you can see her=
e:
>>>>>> https://github.com/ValveSoftware/gamescope/blob/master/src/Backends/D=
RMBackend.cpp#L3347
>>>>>>=20
>>>> Are you testing this with AMD_PRIVATE_COLOR, or with the newly merged c=
olor pipeline API? If it's the former, then the kernel needs to be built wit=
h an explicit -DAMD_PRIVATE_COLOR for this to work.
>>> I'm testing with cflags, but AFAIU Matthew is using a downstream kernel v=
ersion where there is an extra commit that enables AMD_PRIVATE_COLOR via con=
fig option ("CONFIG_DRM_AMD_COLOR_STEAMDECK=3Dy").
>>> Depends on this kernel version, the hack for 3D LUT and BLEND LUT are bo=
th necessary.
>> Thanks, I had such a change locally to add back AMD_PLANE_BLEND_TF but I w=
as seeing some color banding in Ori and the Will of the Wisps menu around th=
e sun in the upper left corner which gave me pause. I see you mentioned some=
thing similar in one of the threads [1] though, so we're all on the same pag=
e now.
>>=20
>> I'm not sure if you've also tried this, but gamescopectl drm_debug_disabl=
e_output_tf 1 seems to work around the color banding in that case. =46rom wh=
at I could tell, this bypasses the hardware LUTs while HDR scanout continues=
 working in gamescope. We lose blending on the MangoHud overlay by disabling=
 that though. I was thinking maybe it's due to the MCM block only doing preb=
lend unlike DPP blending, but I could definitely be on the wrong track here.=
..
> I didn't try it, but you gave an idea to bypass each transfer_func one by o=
ne to identify in which block the issue comes from.
> Just to let you know that I also see the same banding on Ori with Steam De=
ck OLED if plugged in an external monitor with HDR. Steam Deck hw doesn't ha=
ve the MCM structure.

Interesting, was not aware of banding present in that scenario with OLED Dec=
k as well so that=E2=80=99s definitely good to know.

>=20
> I'll try to narrow down this issue a bit more.
> Still, the patches in this series address shaper LUT issues that are prese=
nt in DCN32 but not in DCN301.

Yep, all clear now given the above info. I=E2=80=99ll give it some testing a=
s well. Thanks!

>=20
> Melissa
>>=20
>> [1]: https://lore.kernel.org/amd-gfx/7ad74d3d-5a63-462b-8243-f8f26441b04b=
@igalia.com/
>>=20
>>>> Harry
>>>>=20
>>>>>> Let me know if it works for you.
>>>>>>=20
>>>>>> BR,
>>>>>>=20
>>>>>> Melissa
>>>>>>=20
>>>>>>> Thanks,
>>>>>>> Matt
>>>>>>>=20
>>>>>>>> Lemme know your thoughts!
>>>>>>>>=20
>>>>>>>> Melissa
>>>>>>>>=20
>>>>>>>> Melissa Wen (2):
>>>>>>>>    drm/amd/display: fix wrong color value mapping on DCN32 shaper L=
UT
>>>>>>>>    drm/amd/display: extend delta clamping logic to CM3 LUT helper
>>>>>>>>=20
>>>>>>>> .../amd/display/dc/dcn30/dcn30_cm_common.c    | 32 +++++++++++++++-=
---
>>>>>>>> .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
>>>>>>>> .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
>>>>>>>> .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++----
>>>>>>>> .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 ++++++----
>>>>>>>> 5 files changed, 50 insertions(+), 26 deletions(-)
>>>>>>>>=20
>>>>>>>> --
>>>>>>>> 2.51.0
>>>>>>>>=20
>=20
