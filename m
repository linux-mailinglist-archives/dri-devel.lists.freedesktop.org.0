Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9537B09483
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 20:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14E510E15A;
	Thu, 17 Jul 2025 18:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="fkcFm8Wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CF210E324
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 18:58:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-235ef29524fso2483075ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1752778691; x=1753383491;
 darn=lists.freedesktop.org; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/95eWhgnZq73CVY95SawmPT0Ye5BWZvTqAWh9A2v0e0=;
 b=fkcFm8WtBsIN8jPJIQSSVi7hhcuYgTlSVtDmwnh/W1BZCm2my8PlckTVutWqS3NJoD
 TECZkLVqK1REDL4rgt7kER50VWiy5p1Kq6/uKT1S2aJBfaFw3VXEkdQUG3NM3by5uNd7
 EsMvXq/kseO9e+MkC9w4ntFfr3RG+cn+DIHC/G55Nx7S4tTz00QX20iQPG8o81JE2+Vj
 OF3ZlRO2p6cJ0/wTCz1yDAJ3ae7EDosK36hxA34IgRnkD9QNROHm1H6C7lP7k9+S3t4R
 ZH0qQ/XXtKOhEG8UYTQSE44EXFJLppjFhyOO/bCmUjsKANYGDkf0X1ENpFanuqiGAztQ
 Pf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752778691; x=1753383491;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/95eWhgnZq73CVY95SawmPT0Ye5BWZvTqAWh9A2v0e0=;
 b=vBXmQdWQk7Lb0jqn9AfcBnct1oJWtR3JuqJT+YeBlOCSEewxYlvD3ARptg0vh1+Sh9
 YgLYlvp4TWUHfsbmWVShGRGXEwwz1Hd6RVXfvJ+d3GEmVUVyp0lpUZrXrykEI5b7RFw6
 QqDQLLwav71P1IgBfh4zMX7yWAdFdObQ8kaGdfuowvgTt0rLok8uBRJ3IH/BTZnQgpiZ
 Ga3WH1HAs3iiwHHCOKfJUjyxi/I7wmVF6IS7TsC0gRbBkZmUD4xOTmm5BHYFT4DJ+N6b
 tE6FFdqWNUv1DLLqvkpvPTNX7ADejBjzWROaKoX/iJWWvfB2i2P69pG3rXd2Nn0oZ7Rx
 VRng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQLvL6ybYG6MmjSEA/120qjpg3xxulAqHHr4rLLuOLnYkiVIBUpss64EOFhIayx12F+nkP+nVNROA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCdQyZhDgrbJW34sBWk7Bo9V3v63hvI2bnYHvaX9cozTUZ4cEO
 aIw+vs2e+UTuE0nRswV9RDX7nUyiMy0rINHH/fZV6NT9uGEhoqtiVuIz9ihdtXBqPw==
X-Gm-Gg: ASbGncuJzYs7G9cooWnJnnObPsMBQ8Gn0dsEu5aUUWofkotLA2d+4ERnjb42icPehhk
 2lW8ijVMcHy7bVzaG7GdZK+DA6Jjkg99/aua2B1F0ILbJVnVe6tFNF73VLlAN2ZWAGyr4WGFmNR
 ssDn1BZNBJrDdiqHi1jba3p+YFx2C6C8vZ932X4sEwOXv+OCTZE8IDzMUJYmkTu4zTa1DQbE1Wo
 7vdJoGpQnAqsvHWRbi7/E8wcCgxzZglhKbgeg3yAcLuigMWkFan/FJN/SLVZXfa/GPiERnQvwzy
 t2wcdNmUfSRBPgFJ6b+h5T1Z78psu/dr8aS+WlXJzq+j+VdC0+tuZIfNN2e8J7sBGk8J2v52Vuj
 HaI4NEilkN8oYji2O+Q5hl0E3MunPh0ZdSRnmfjQBIdaidMCpcypvAVxzxK6XcTiTlEsdMPrNra
 wu0wh1I8O9JBydgoePxlg=
X-Google-Smtp-Source: AGHT+IFLdRA1sxjzXoxUc1gsHKXy/s9KMDBgLGdngfq09ek7OQiXBoAjESU6pkyhcttWNYYbCFDL1g==
X-Received: by 2002:a17:903:166e:b0:234:a66d:ccd7 with SMTP id
 d9443c01a7336-23e24f2e6d8mr46904125ad.7.1752778691323; 
 Thu, 17 Jul 2025 11:58:11 -0700 (PDT)
Received: from smtpclient.apple (syn-172-115-017-107.res.spectrum.com.
 [172.115.17.107]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4333b2esm144680025ad.156.2025.07.17.11.58.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jul 2025 11:58:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3858.100.10\))
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
In-Reply-To: <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
Date: Thu, 17 Jul 2025 11:57:48 -0700
Cc: Melissa Wen <mwen@igalia.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Hung, Alex" <Alex.Hung@amd.com>,
 "Liu, Charlene" <Charlene.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
References: <20250717143738.84722-1-mwen@igalia.com>
 <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
 <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
 <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
X-Mailer: Apple Mail (2.3858.100.10)
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



> On Jul 17, 2025, at 9:58=E2=80=AFAM, Limonciello, Mario =
<Mario.Limonciello@amd.com> wrote:
>=20
> On 7/17/25 11:55 AM, Melissa Wen wrote:
>> On 17-07-2025 13:39, Limonciello, Mario wrote:
>>> On 7/17/25 9:36 AM, Melissa Wen wrote:
>>>> This reverts commit e1bd5e0bb4ca0d633ad698abd3658f8265009b81.
>>>>=20
>>>> The commit causes a regression in Steam Deck (DCN 3.01), =
reintroducing a
>>>> functional issue reported in [1] that was fixed by calling the
>>>> clear_update_flags() from commit 7671f62c10f2a.
>>>>=20
>>>> On Steam Deck, we use multiple hw plane color caps and up to two =
overlay
>>>> planes with dynamic pipe split policy. I.e. with 1 primary + 1 =
overlay,
>>>> the driver split planes into two (with 4 pipes), but with 1 primary =
+ 2
>>>> overlays, we don't have enough pipe for splitting. Glitches appear =
in
>>>> this pipe-split transition of 1-2 overlay planes, if the driver =
doesn't
>>>> clear update flags.
>>>>=20
>>>> Besides that, the issue the commit e1bd5e0bb4ca tries to address =
[2]
>>>> isn't functional.
>>>>=20
>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3441 [1]
>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4129 [2]
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>=20
>>> Can you please double check the use case that prompted
>>> e1bd5e0bb4ca0d633ad698abd3658f8265009b81 in the first place?  IE =
With
>>> this revert you proposed do you see a traceback on unplug of =
external
>>> display?
>>=20
>> Hi Mario,
>>=20
>> I don't see either traceback or REG_WAIT timeout when unplugging an
>> external HDMI-connected display.
>> I tried with the Deck Dock and USB-C to HDMI adapter. Not sure if =
there
>> is a very specific scenario that triggers this that I didn't cover.
>=20
> No; it's quite a general problem and easy to reproduce.  This makes me=20=

> wonder if there should be an exception carved out for Steam Deck =
instead.

I just tested DCN 3.1.2 (Z2 Go) and DCN 3.1.4 (Legion Go/ROG Ally) and
I was not able to reproduce the issue so a Steam Deck carveout might =
make
sense here.

Matt

>=20
>>=20
>> The only message on dmesg from this action is:
>> amdgpu 0000:04:00.0: amdgpu: pp_od_clk_voltage is not accessible if
>> power_dpm_force_performance_level is not in manual mode!
>>=20
>> Moreover, if I move to the Desktop mode (KDE), there is no message.
>>=20
>> Melissa
>>=20
>>>=20
>>>> ---
>>>>   drivers/gpu/drm/amd/display/dc/core/dc.c | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c =
b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>> index c31f7f8e409f..7c48f72e5917 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>> @@ -5443,7 +5443,8 @@ bool dc_update_planes_and_stream(struct dc =
*dc,
>>>>    else
>>>>    ret =3D update_planes_and_stream_v2(dc, srf_updates,
>>>>    surface_count, stream, stream_update);
>>>> - if (ret && dc->ctx->dce_version >=3D DCN_VERSION_3_2)
>>>> +
>>>> + if (ret)
>>>>    clear_update_flags(srf_updates, surface_count, stream);
>>>>=20
>>>>    return ret;
>>>> @@ -5474,7 +5475,7 @@ void dc_commit_updates_for_stream(struct dc =
*dc,
>>>>    ret =3D update_planes_and_stream_v1(dc, srf_updates, =
surface_count, stream,
>>>>    stream_update, state);
>>>>=20
>>>> - if (ret && dc->ctx->dce_version >=3D DCN_VERSION_3_2)
>>>> + if (ret)
>>>>    clear_update_flags(srf_updates, surface_count, stream);
>>>>   }


