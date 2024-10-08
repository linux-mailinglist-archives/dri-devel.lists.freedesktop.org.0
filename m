Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29169995403
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 18:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D71010E58D;
	Tue,  8 Oct 2024 16:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="iPxqU0El";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5802910E58D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1728403534; x=1729008334; i=wahrenst@gmx.net;
 bh=kX7US7us5uuUTDZz9M5rKxQT5FzqazaFT0KpfgJmEg8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=iPxqU0ElRO2bCClQXrUxUheAvPIrsrbYEH91N+tDj+4xBfWBG/ef6o+1O5lUvKF2
 BzduTZO8U6APrEYkq9SI55B5Sb8i8EXVWln0FSz9n5rcUvbGtsvsuMIAwsbThYb1C
 CAeOk94kwufreoH6Jv7FHx065aKZvopvWl36DPSDiij4qUTYMc3uCWkxWveZHfJk3
 da1wjx3jevffvvLjfYdL1EjNhziW0PaQ0MP+ahEoKp3Dzx38SThbLlmk6RvLz0Vk2
 jsNqW3VuDWnHq4qFtLAHo83Jp+5GpDEfs6syc+XElrWUBnv4/zEO6LADnrKPqLLaP
 a5mh4CsctK80S++giw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1Obh-1u0NC23rkB-010q4c; Tue, 08
 Oct 2024 18:05:34 +0200
Message-ID: <a04c4048-b8cb-4a8a-9fb7-00a5ed7bcd9d@gmx.net>
Date: Tue, 8 Oct 2024 18:05:32 +0200
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ce07a658-8e5c-4c9a-b0a5-77f1be54d524@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GPJp5MrMzg3cgZT+arAuZely8dn8O/Mm7N1kGzl8jP033Q06Tjn
 wAL4qPOL0CaSbX5YEfjDdg15zLjxG17gSZYCaVEqKarqNwXcOb52ugSgnIJARrX0W0AxL2d
 mAC8MJunEjjWPJ/zsa4BFLC8fEeGpunowEW+f4QKJzW2nt51FITec6H3+0Nb5k/s5UVGV1J
 r4HobuN2EmLkr+9AQGVSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+7Dipk57MVQ=;+qSutRhrWUM7Urui1M/oDa53xnM
 8aV1IlnRNcZ1vAkS8FrdPrMLMX3ue1PehHTcwkIvecNexEJV7bEZfXXAix6qX4cHEin9IVYu+
 6IJ8mpUgri0HdDCNnfO0ZkyfYC2f/wiFrPpX/i39USetTjV0A0qCqF2znO3/618KBioUj/UZJ
 GyGjPgDMMfPxYsPGx1WkHoQAm69r65HM1y1qOYfIksCsmpnp/crIk3839+V5zuTD/AQ51kfjF
 FSHcqlAwwvaE9sIrrTmNfH94qAnpnog9DQIEhgdQykoD1U5beho67xKo78dV0+4QquhsVNA+j
 V9vmdKVe1k91y3TCTTe2JO+EulG0rfkcMTbNbJXzF54sBWZOKNiLNVs0VtQ7klJB9a8tiD19g
 zBt5xZLUJDkmCMl5KdoFEg2y5JuUmPkStM0PQ5C1sxwfaqed3rPVwOLYZxtwV0mvu/dXpbNUz
 BZvlOzoOQwMiRD+HEI2vU2Lif9h0ooIQJLqwOSY3PCu+IGr5AvwZ18MUDZ3+1MHpF6vj9bcbS
 p47X6mzyH3dYE3xAy0kmGjN/hlxGnWx9VSGLrHYekEeDMv8F+lIwpCm/rx5F68GUhaF6zXjp7
 bJVyCESouVW3Q3RMh7Z0N1Ha1Tfry2v5w095UsrD3BfOiT73aaOA9gG87vQ3+ZwY+b5FVuf8F
 S+Fv3SFimxvv+omx4QlUP7fyxtorIwe9ldLLZPFC/L+Db4YE3a2r5XFO+k/7HJwsQa+WBexDc
 BuE9L9qUHqo9i98gZb3fquOWH5QFbKyoeovt08LV9mDQIHnVe+f8xKnSzStTo+PyZ2GQMpjIN
 624zBOgonHqlO6wZkTlj5xTg==
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

Am 08.10.24 um 15:49 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 10/3/24 09:41, Stefan Wahren wrote:
>> Add suspend/resume support for the VC4 V3D component in order
>> to handle suspend to idle properly.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>> =C2=A0 drivers/gpu/drm/vc4/vc4_v3d.c | 7 +++----
>> =C2=A0 1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c
>> b/drivers/gpu/drm/vc4/vc4_v3d.c
>> index 2423826c89eb..8057b06c1f16 100644
>> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
>> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
>> @@ -368,7 +368,6 @@ void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&vc4->bin_bo_lock);
>> =C2=A0 }
>>
>> -#ifdef CONFIG_PM
>> =C2=A0 static int vc4_v3d_runtime_suspend(struct device *dev)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vc4_v3d *v3d =3D dev_get_drvdata(=
dev);
>> @@ -397,7 +396,6 @@ static int vc4_v3d_runtime_resume(struct device
>> *dev)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> -#endif
>>
>> =C2=A0 int vc4_v3d_debugfs_init(struct drm_minor *minor)
>> =C2=A0 {
>> @@ -507,7 +505,8 @@ static void vc4_v3d_unbind(struct device *dev,
>> struct device *master,
>> =C2=A0 }
>>
>> =C2=A0 static const struct dev_pm_ops vc4_v3d_pm_ops =3D {
>> -=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(vc4_v3d_runtime_suspend,
>> vc4_v3d_runtime_resume, NULL)
>> +=C2=A0=C2=A0=C2=A0 RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_run=
time_resume,
>> NULL)
>> +=C2=A0=C2=A0=C2=A0 SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> pm_runtime_force_resume)
>
> I have a question: How can we guarantee that no jobs are running when
> the system is forced to suspend?
Not sure what do you mean with job. userspace task or v3d job within the
driver?

Do you have something specific in mind.

Why is there a difference between runtime pm and system pm?

I must confess that i didn't test a system sleep while running a v3d
application.

Best regards
Stefan
>
> Best Regards,
> - Ma=C3=ADra
>
>> =C2=A0 };
>>
>> =C2=A0 static const struct component_ops vc4_v3d_ops =3D {
>> @@ -538,6 +537,6 @@ struct platform_driver vc4_v3d_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "vc4_v=
3d",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .of_match_table =
=3D vc4_v3d_dt_match,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D &vc4_v3d_pm_ops,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D pm_ptr(&vc4_v3d_pm_=
ops),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> =C2=A0 };
>> --
>> 2.34.1
>>

