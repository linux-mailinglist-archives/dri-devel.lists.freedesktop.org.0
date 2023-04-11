Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A056DDE5C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8259310E573;
	Tue, 11 Apr 2023 14:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3732F10E573;
 Tue, 11 Apr 2023 14:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681224338; i=markus.elfring@web.de;
 bh=gSkA26wrxyRy+QosZCxwgxJGwRdIBWtCkPnIMmQcM3U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=brOGIuIzL8jkpWV2+9PMLpz6rUpA6nUBkmosSyTchGco51wubdEShCyMBygLUCVQZ
 SEUqgJvGs8vJBwtIn0rG5f4qJ1xjNjG0TUf8q0FM46r46ITTtByOWZqCAYGQZ013iD
 HADwCgioc1cTyLAFTH/ajeWmqzsbn4igcRRKpkMc/vfBZ0MJvSLtXGA7NRXUs5teNV
 G2O3ITOycm9NLkvi6iiuzyyVzuNBNwVJohXZ4rs3wFlHl73g3c2s726ldjOTCMrOY2
 imlIhWOGy5zfzb3e11mSzJCqFApPAYUjlEUKz131d0nU4ymNQ/8FJw0aIQRJwH7hIh
 szsQJhb6QUuYQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgANG-1qIp6y20B4-00hj3N; Tue, 11
 Apr 2023 16:45:38 +0200
Message-ID: <1c1e48c1-9812-721d-855d-4000f84f4f3a@web.de>
Date: Tue, 11 Apr 2023 16:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Move a variable assignment behind a null
 pointer check in amdgpu_ras_interrupt_dispatch()
Content-Language: en-GB
To: Felix Kuehling <felix.kuehling@amd.com>, kernel-janitors@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Liu <HaoPing.Liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
 <0d4b92ab-f7c2-4f18-f3c3-c0f82ba47fc8@web.de>
 <c265e914-4ba4-1af8-a504-21dd859f0226@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <c265e914-4ba4-1af8-a504-21dd859f0226@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c3lsOpjID8jL3Oq1OuNPlFupaKFJEUYs5sYP2WRi6EXZDxCr37j
 g6Q3cZ8ic3h+AY9l5o4UhG6ZV0/3f8KSXLYfmSkNjbySIPuvxA87u35TK88Uqj/AvRleCTr
 tqJfxF//FtccrMshElC69lFfdM3S8BuVwrOAohKlDyFQ+6p5bM3R70itICEUNfAuvWQYNpK
 dra5I2bPfnIVrxsJJ1I5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8I9ibC6Rfw4=;NJe/3h/4+YM5um0qr1wjmVsIT/7
 21b9/fOj+8T4fEvYARG9rzpat6nBQlc9q0bjBLnkTpIUEqtYTv9rHGNysKu970aVIlJW28zMb
 Qmjs4ZwvjWdt5xb381oVYjgmVxB7dnjtgBSjelPRmClzgq0gg9FTFGvVfyEDAyO9okNsHr2qm
 zWp/qJyyu4YT7fyOiTV1q+CaKM7wLZnMSLV5MEKPVfhKJz0hWxTitStjvfN4D+Gbh17BBReFZ
 c3YhCOwVbr2ZLFFJ9x3wYAvejc1Zagpi9YFd3XRXeo71cbh4h8e62UkZpE5KCuX/so/2E/ivc
 R8GpvgjM5arti+QbyFBTW0jTGz7SpA0LRHQjpBDX2KA7hMIpQolxsyYlNLlIp+KV56B23sJ/M
 JkEn61/6agnaV+vBvMY0wzgE5WJpGTNJpMXMcMH1jAiEHLYIcwLAZauWrUASbfnw+kjFswBls
 AydHoiVKWsbweDsTBVVcpv75tmy77HcH62pFSYyICJ1KNcRe5o0OKphh1Skq4nBKyPHtfOm4e
 zT0XfybGwnFMyfVUI4zfmdw0DzjYLiFQ4g4r67N8L+yvLoYIU/saCfykZkwNZliSZra1qhSYp
 2pNxafCEMCoklhLQ8CQ4UVsmdiEyKo/vsfeN6rr0drvrQAX1aT3PDnE3L43KHjhoJQ2s/OV55
 LZT6XnUTlOH/0dBUYorHhnBc2XOJH50xk68OLnDG1nntzjUkOJtGurs9er03S+dnwjfJIMqY6
 6bA7nGP5pk10nDG9U0pmVMAhJCNA6f7Cr74qQW9DrzIqGt/hSFY5CMhC6007UDXsrgvRKy4Uj
 RYFJfVX8S+FtaGP+9eu4WX4la2tTFErg9Ix9e3InRpP/fomO5UiOi0oekPTdrWTctNILKTpKn
 e/0cUJIwqREI7lKO93a6O4HlGoPQAIDUiACDYTV0SNrD1ZZBipnlgvp9l
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> @@ -1730,11 +1730,12 @@ int amdgpu_ras_interrupt_dispatch(struct amdgpu=
_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ras_dispa=
tch_if *info)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ras_manager *obj =3D amdgpu_ras_f=
ind_obj(adev, &info->head);
>> -=C2=A0=C2=A0=C2=A0 struct ras_ih_data *data =3D &obj->ih_data;
>> +=C2=A0=C2=A0=C2=A0 struct ras_ih_data *data;
> I'm curious, this only takes the address of obj->ih_data.

Even if a null pointer would accidentally be returned by a call of
the function =E2=80=9Camdgpu_ras_find_obj=E2=80=9D?
https://elixir.bootlin.com/linux/v6.3-rc6/source/drivers/gpu/drm/amd/amdgp=
u/amdgpu_ras.c#L618


> It doesn't dereference the pointer until after the !obj check below.

Does the used arrow operator indicate a pointer dereference?


> How is this undefined behaviour?

I guess that another information source can be helpful for such an issue.
https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+=
null+pointers?focusedCommentId=3D405504153#comment-405504153

Regards,
Markus
