Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C059970B5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 18:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15E10E782;
	Wed,  9 Oct 2024 16:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="KUuYk9Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD510E782
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1728490243; x=1729095043; i=wahrenst@gmx.net;
 bh=6yozUC9hgPyOB8QOER4aCf6uGdZd1ua6QJnCBTO/ggc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KUuYk9McqEbSew+q8e6oFbJCQmAensFcjDLvJAiTofRaqtqHnHj8xvmXI7BBnKhW
 GHi8yS7NrHA+wzMLtqEsJdOuD0I3VWdzNF05MfNzUyRmoJxav6BFHzfAyssJsKJA3
 fIxO6GpkMH9XsvJnagYhLTCRAhlJ8IKfKqxx/uA3zVDkSpQ96tptgQaURFgYLVvJx
 aKzOijYV48a2R2WtguG9tlPwLaWB8e7WqCnSsza/to7Jis42Qv6fF26YHjjwpc3OR
 HOcqQCt5wP1cPjKj3BmPEgqmZrWTUNiMq23Vtn7WciJ3qsxcDjx75Ekv/x3EoM94I
 RVfiGmn32q+MDXx2Og==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO6C-1tn0CA3Woq-00mNu6; Wed, 09
 Oct 2024 18:10:42 +0200
Message-ID: <6794760c-5428-44a1-9738-f0ec7ef66818@gmx.net>
Date: Wed, 9 Oct 2024 18:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] drm/vc4: v3d: add PM suspend/resume support
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com
References: <20241003124107.39153-1-wahrenst@gmx.net>
 <20241003124107.39153-3-wahrenst@gmx.net>
 <ce07a658-8e5c-4c9a-b0a5-77f1be54d524@igalia.com>
 <a04c4048-b8cb-4a8a-9fb7-00a5ed7bcd9d@gmx.net>
 <566ae236-77a0-4dd7-9b09-5a31172240b5@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <566ae236-77a0-4dd7-9b09-5a31172240b5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TXn63LKeKOriw0zbBO4BDdG09d7t8a+L0/T4uw6lsn69rrjXIRp
 Kp9P3Jei5B1KZOUxPDMoKB1qLuc/Sn6ML/2tmzIFhGaSJ3x3Mo831uRok8TXLMT2DWrywLZ
 YEOrP6PserbpWmN3hULpteiU6Z0XhyVwEp+1j4JdI/xiDAcTTXKwy7e7+Vwg6YbqWql46Ru
 ZeodgMH/ZzDLWqseLU8aw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uOPRpupT9zs=;1dGWnBoyzwPzQrfxCnJ/k/pgF0a
 V7ja4RSJHXNOlVbmms48gy7I560wjPkD5LHtE1Rzn+UvUht2yCZhc8uiF6T4mbAECUCpKV+KU
 D1OQdilwhH8T3+Wu+8DvYFUPsuYbgKeGBJDk0qRSboCKcKhKYOy+9CcLzYCyZ6/6Tk7WeEofZ
 duRnctIASlPVdaDGM5vqRSEOzV4XhM82EfwWO+LKjsHgedqYEM06/nKV2TBzMT8kANTnC62PK
 QrMnIsE5/V79amsKWKvcsJyBGc+VPWJRIqFcGKYLfESqKanZuLHNjr4T52KyaMwCX27BplmQN
 3wNqiIr3qRJp53UzwzA9mgA9i2tmWtj7sDFHyTvJWMFB8zyggip+rlw04n7SQF0MGWYo1qsV7
 McfBir1sB7MQL3YAGkpXRNdg6MFhodWbOAsJpEDxl2S2MWOX8TvYlT5ogAreknedMyY+FQoXB
 334Krbx0PQgpnhWS/Zlfz2cwMVUxdYqVTGFFjUZkuyLhzXve6Uk2ovPn6VtOS4LjxaH/3TyoA
 jcpRRiYiAiWK+n3gm6xjPzh2jGW11EvY/O7JK6vR2HNU7vRHlN3/l+I167mPRZHt0X2NKnHiM
 Xc+RKjNqbd5eRc0XqPe3NTh4Q2NS2r8O8Z57OOuQxR4sLHcTnESWxUV0Xxsi7o6dAhBwD69bJ
 lys1W35Kan5k3E/Z1n4FM3ojrcwjiRyomp0BFj+U2tTUMY3mKCcgIIHO5c5P02VnKVgEZ+ETa
 ga1Y3NwItENgCIprQIxsFky5R+xtl7AYYUEXGO0hB10+UgncT2KLOMUlMoCmrBuSswfpIe88/
 Xm9XpMWeHd/6WGpGgbviXFVg==
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

Am 09.10.24 um 14:16 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 10/8/24 13:05, Stefan Wahren wrote:
>> Hi Ma=C3=ADra,
>>
>> Am 08.10.24 um 15:49 schrieb Ma=C3=ADra Canal:
>>> Hi Stefan,
>>>
>>> On 10/3/24 09:41, Stefan Wahren wrote:
>>>> Add suspend/resume support for the VC4 V3D component in order
>>>> to handle suspend to idle properly.
>>>>
>>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/vc4/vc4_v3d.c | 7 +++----
>>>> =C2=A0 1 file changed, 3 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> b/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> index 2423826c89eb..8057b06c1f16 100644
>>>> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> @@ -368,7 +368,6 @@ void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&vc4->bin_bo_lock);
>>>> =C2=A0 }
>>>>
>>>> -#ifdef CONFIG_PM
>>>> =C2=A0 static int vc4_v3d_runtime_suspend(struct device *dev)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vc4_v3d *v3d =3D dev_get_drvdat=
a(dev);
>>>> @@ -397,7 +396,6 @@ static int vc4_v3d_runtime_resume(struct device
>>>> *dev)
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 }
>>>> -#endif
>>>>
>>>> =C2=A0 int vc4_v3d_debugfs_init(struct drm_minor *minor)
>>>> =C2=A0 {
>>>> @@ -507,7 +505,8 @@ static void vc4_v3d_unbind(struct device *dev,
>>>> struct device *master,
>>>> =C2=A0 }
>>>>
>>>> =C2=A0 static const struct dev_pm_ops vc4_v3d_pm_ops =3D {
>>>> -=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(vc4_v3d_runtime_suspend,
>>>> vc4_v3d_runtime_resume, NULL)
>>>> +=C2=A0=C2=A0=C2=A0 RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_r=
untime_resume,
>>>> NULL)
>>>> +=C2=A0=C2=A0=C2=A0 SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> pm_runtime_force_resume)
>>>
>>> I have a question: How can we guarantee that no jobs are running when
>>> the system is forced to suspend?
>> Not sure what do you mean with job. userspace task or v3d job within th=
e
>> driver?
>
> I mean a V3D job. See, when we submit a CL to the GPU, we only know when
> it's done through a IRQ. I'm thinking in the case where:
>
> 1. We submitted a CL to the GPU
> 2. We suspend but the job wasn't ended yet
okay, now i understand. I was under the naive impression that everything
is handled in the ARM cores. Sorry, i don't really have a deeper
understanding of the V3D stuff.
>
> What happens to this job? Is the GPU going to be in a unstable state
> when we resume?
I don't know what happens to the GPU, but during suspend most of the
IRQs would be disabled so the ARM core(s) won't serve the interrupt handle=
r.

At least i need some guidance here, how to prevent sending new jobs to
the GPU. I assume such a logic must be already part of the driver removal.

Best regards
>
>>
>> Do you have something specific in mind.
>>
>> Why is there a difference between runtime pm and system pm?
>>
> As far as I can see, for system PM, we need at least to suspend V3D in
> a stable state, without any jobs running and with IRQs disabled.
>
> Best Regards,
> - Ma=C3=ADra
>
>> I must confess that i didn't test a system sleep while running a v3d
>> application.
>>
>> Best regards
>> Stefan
>>>
>>> Best Regards,
>>> - Ma=C3=ADra
>>>
>>>> =C2=A0 };
>>>>
>>>> =C2=A0 static const struct component_ops vc4_v3d_ops =3D {
>>>> @@ -538,6 +537,6 @@ struct platform_driver vc4_v3d_driver =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "vc4=
_v3d",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .of_match_tabl=
e =3D vc4_v3d_dt_match,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D &vc4_v3d_pm_ops,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D pm_ptr(&vc4_v3d_p=
m_ops),
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> =C2=A0 };
>>>> --
>>>> 2.34.1
>>>>
>>

