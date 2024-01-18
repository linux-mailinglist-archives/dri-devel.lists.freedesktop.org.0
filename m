Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8A5831424
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336B710E133;
	Thu, 18 Jan 2024 08:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F2210E133
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1705565222; x=1706170022; i=markus.elfring@web.de;
 bh=kCvOPst4rgL73b7SHnvOPtJ94GynuOZeJpfzDrg2Bpg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=Dr1e7zDaTqVdrRTKoPPE559xjClnxtoT/cDrr+y9j6KvmyYr2wdsB3kQgcOrFdAQ
 Iukrmct8L6V4sYULTVcN68u/X3D+daibmKTEeNazQqldIvOLyZBgNQ/u2BATunPtj
 sT6ouJ5OQfdkgVYmtrR+H60jZJRdoeTeec7s2nWOU9LtUcbO3x4avRwPjPSpwJFNL
 +NYsA76WQZlVE38ZJFhjKUvXAqNryAXXmnUNgTevR7j2x5xhjyk9XaU5ruPmiKXdY
 RDRuNyfYVdyWQI1BLu3cSltvYujCxyTpQcv0s3nibsFFZ2hjA+h1WaCqUOqZeokk+
 dUQHkqKpEF9if4AuTA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGQGH-1rL9pL1EfV-00GYra; Thu, 18
 Jan 2024 09:07:02 +0100
Message-ID: <efc748d7-1a67-476a-82a4-206a9ed252cb@web.de>
Date: Thu, 18 Jan 2024 09:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add a null pointer check in
 zap_shader_load_mdt()
To: Kunwu Chan <chentao@kylinos.cn>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20240116032732.65262-1-chentao@kylinos.cn>
 <9e390783-05c5-47fc-a0c6-b95e249fe691@web.de>
 <4d4f4ae4-e5e9-4d9e-ac25-d262e7ea23fc@kylinos.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4d4f4ae4-e5e9-4d9e-ac25-d262e7ea23fc@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZAEHwbx6jQbZDr47gR/LgiXdS/Bw50dDuaXFMDByxqzOIN1swLJ
 Mp+oX0pb+WvOI6eOHDSGZI5vLw+JbCX0bkaCENs9ZKXZyacQrMdHeVe+7tWGuHhc2Pe4FsV
 MJZHADguhSiLqcwGyZ1wXvkTqYVhdDdCkhih01UaY2Ld0R1QUmARwKVi3yGNybAewP8+yTU
 IPQxfj9JZW/BZk9Z74qcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:58aVM3G6HsM=;iYWSd86TS7q1+8sIE+JFap0tN1x
 3z2nQU9XoXlDQSUNj4hJduLTjcpL3dF2mlGQIqlRRTPgE58VE/hblpw+REa/jsewrC+8RuXe2
 a9GMrmhtgeLD0kZ6bQGO7WInEK3voEvW097OXbk0qVMyXePs88jNUlDL1a5RHm+DIBNpwp75G
 NpkEa23Dsnldf2+u/BsftjQYTBXHFochWTSq3eegVWzN4iXaQsQ3JIlPvEZGSn4BBq3B6Jfc+
 mm201fHNR2aEoEaQcRDgl37ogPGI63i1TXK9JwA51NsIpLHD24uSUJ/LIsEL+D/6FIRYgfZ7F
 /2dgRlA7v8T1p4Xm1+F7xrkZAG2BNhItEtpblDElWNhwlmyH4KnqgvvvYnQW3y21H2U8R2NqL
 9grRvKMJTXFztJyYHwg8Ukh/iEVxWLBCB0oUNAZPlyvRZt0eH/mrU+PkvHePuWTJyNUwNJS/H
 +y3aWQuY8kQSnI5SEBr8t6Vx6r5IgQD/pR8/VF81rYusvQndTqh/bsv1uqGcSTO9Z5zyXl5IA
 2zaYT3FTgfKuuDtMzLWft4WkD8Xph4XBSPsDJOHRZp/Dgmta2u13cs605fwJs48bFJYtkwecW
 FK6e1wT17Oyqp8RxkuukmBXE0hwx9KRHcSk6irDRMpH3xpJfFDah3PtDnGC7RoBmEj9WlXB7v
 jsmMJNAchhhK9HLaW+kd7/F9HGHSPjIVHjs/Iqoa7k90hJxoYENIW0DbyfSg6FvhgZWUA/iZg
 H3t9FjIoxIu5jYbGIM0z/YR6FfrCtjBeq/3P0zBPzc59H0M8+XZBJG1FFwXYIYpSihAGAy+7u
 6fO0G/BJGkXTVgFAurJjB+rPTkt3HYyei9/5d2Et/25acp6i2MHhh/K0jT+1KW5abC1/Cz5df
 9kN1C6W6SG0vycImodtffc1AraG8xHrth8ng492bmDc8GNOCEkGXsCFOCVbdh6EHViO6n55Bt
 Vpy2Tg==
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>>> kasprintf() returns a pointer to dynamically allocated memory
>>> which can be NULL upon failure. Ensure the allocation was successful
>>> by checking the pointer validity.
>> =E2=80=A6
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -144,6 +144,10 @@ static int zap_shader_load_mdt(struct msm_gpu *gp=
u, const char *fwname,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *newname;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newname =3D kas=
printf(GFP_KERNEL, "qcom/%s", fwname);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!newname) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -ENOMEM;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =E2=80=A6
>>
>> How do you think about to avoid the repetition of the pointer check
>> for the variable =E2=80=9Cmem_region=E2=80=9D?
> "mem_region"? Is this a clerical error, do you mean 'newname'?

Please take another look at implementation details:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpu/drm/msm/adreno/adreno_gpu.c?h=3Dv6.7#n124


=E2=80=A6
>> Can the usage of other labels become more appropriate?

I propose to reconsider also the influence of the label =E2=80=9Cout=E2=80=
=9D here.
https://elixir.bootlin.com/linux/v6.7/source/drivers/gpu/drm/msm/adreno/ad=
reno_gpu.c#L167

Regards,
Markus
