Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539A57E73C8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 22:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65F510E924;
	Thu,  9 Nov 2023 21:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F010E921
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 21:40:34 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-67131800219so8692196d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 13:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699566033; x=1700170833; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dqZ8eGZ8Pp8FeE7q6r74GQLeHAO1e/AKYL8uZYPenT8=;
 b=aVMwdTio5CH5Ah46rZMKA3KW9HEit7HCtM8DBACHx8Q9JtpjBPwoKEcNAfpegLe2Ly
 soOW7KdfTbdGjaiA4GmdcD5My25A3AggOiqNrJLZ8OPKvHnihQpKSSJaGEnM3LKntymD
 oWR+trmnj9M6iFVEQP+G0YRXLG0ylesNZp6Lh3yMP1nGuZEo+u0QX2p2PfvwUZjHV+R7
 0AFWgn1rowfLr0HVaX7M1M9ejswVKXJor53WUJs3SSA162cCPuqCaqGR6DQmKfCrXjFB
 LYxvm1qjaskPxLSgzsIGhPK/BWKd1rhkwdd3CmhJA6gB8Ll6XasQzDASAIVntZeXU/Yf
 Ac4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699566033; x=1700170833;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dqZ8eGZ8Pp8FeE7q6r74GQLeHAO1e/AKYL8uZYPenT8=;
 b=ckiomAGFMkexPIK0t91DwG7T2K60Rfheb5Enz7wh53VfjbYMksIKKHX9dX2aZ9l3Dm
 KYZygMmMUQRsC8cGua/VS4eumUaPSxnxcekl0TzVjzPWNRvbQ0zeE8+ImYEeh7Pxy38Q
 jzLSpjq5AReHPX5haLf59kzoWICkSjHirzkgKymVn3tLO2Rt5T7s9ZVMlejQovZlGwBh
 KIZjFzKODVoigmVvkg2BlrBxQNhR82RO6VD651pxf8RR5X3CZpUgIsxSXMebYiDlD6KW
 smv/E4B5gN3fMFAm7vuVo/bnqI9Pr57tNUHLA26ZbRkgqz+3Mjo9gg8jJyvx9Muh24BW
 seWQ==
X-Gm-Message-State: AOJu0Yz4gZu0P8prd2NU3lgx4fzh9SQhhTTASgagHd25G63tYSDioTd7
 DT4q31KBV+TFuVf2OfrhzI8=
X-Google-Smtp-Source: AGHT+IH3YltxlweWDrZvXZm8ZC5Jic0g3A91lLs5H9oZ86bc9SWw0LcBSTx5Cag+vFjgRJk08vHEOQ==
X-Received: by 2002:a05:6214:490:b0:66d:182a:c083 with SMTP id
 pt16-20020a056214049000b0066d182ac083mr7899275qvb.9.1699566033249; 
 Thu, 09 Nov 2023 13:40:33 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a0cfa0a000000b0065d05c8bb5dsm2392508qvn.64.2023.11.09.13.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 13:40:32 -0800 (PST)
Message-ID: <01603866-26bd-4020-8999-948718b75ad2@gmail.com>
Date: Thu, 9 Nov 2023 16:40:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.2
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
 <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
 <c2c4a1e3-9a8c-4922-aecc-8894d13a8054@redhat.com>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <c2c4a1e3-9a8c-4922-aecc-8894d13a8054@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7B0Iy6KD7AleabuDKfTGjEH1"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7B0Iy6KD7AleabuDKfTGjEH1
Content-Type: multipart/mixed; boundary="------------0qlI3FtQGuUpqb5S8L603S6K";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <01603866-26bd-4020-8999-948718b75ad2@gmail.com>
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
 <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
 <c2c4a1e3-9a8c-4922-aecc-8894d13a8054@redhat.com>
In-Reply-To: <c2c4a1e3-9a8c-4922-aecc-8894d13a8054@redhat.com>

--------------0qlI3FtQGuUpqb5S8L603S6K
Content-Type: multipart/mixed; boundary="------------DpMs4nwdBTrqFWkcSPu520Ma"

--------------DpMs4nwdBTrqFWkcSPu520Ma
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-09 14:55, Danilo Krummrich wrote:
> On 11/9/23 01:09, Danilo Krummrich wrote:
>> On 11/8/23 06:46, Luben Tuikov wrote:
>>> Hi,
>>>
>>> Could you please use my gmail address, the one one I'm responding fro=
m--I don't want
>>> to miss any DRM scheduler patches. BTW, the luben.tuikov@amd.com emai=
l should bounce
>>> as undeliverable.
>>>
>>> On 2023-11-07 21:26, Danilo Krummrich wrote:
>>>> Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variab=
le
>>>> number of run-queues") introduces drm_err() in drm_sched_job_init(),=
 in
>>>> order to indicate that the given entity has no runq, however at this=

>>>> time job->sched is not yet set, likely to be NULL initialized, and h=
ence
>>>> shouldn't be used.
>>>>
>>>> Replace the corresponding drm_err() call with pr_err() to avoid a
>>>> potential page fault.
>>>>
>>>> While at it, extend the documentation of drm_sched_job_init() to
>>>> indicate that job->sched is not a valid pointer until
>>>> drm_sched_job_arm() has been called.
>>>>
>>>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variab=
le number of run-queues")
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
>>>> =C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/dr=
m/scheduler/sched_main.c
>>>> index 27843e37d9b7..dd28389f0ddd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>> =C2=A0=C2=A0 * This function returns -ENOENT in this case (which pro=
bably should be -EIO as
>>>> =C2=A0=C2=A0 * a more meanigful return value).
>>>> =C2=A0=C2=A0 *
>>>> + * Note that job->sched is not a valid pointer until drm_sched_job_=
arm() has
>>>> + * been called.
>>>> + *
>>>
>>> Good catch!
>>>
>>> Did you actually get this to page-fault and have a kernel log?
>>
>> No, I just found it because I was about to make the same mistake.
>>
>>>
>>> I'm asking because we see it correctly set in this kernel log coming =
from AMD,
>>
>> I think that's because amdgpu just sets job->sched to *some* scheduler=
 instance after
>> job allocation [1].
>>
>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd=
/amdgpu/amdgpu_job.c#L108
>>
>>>
>>> [=C2=A0=C2=A0 11.886024] amdgpu 0000:0a:00.0: [drm] *ERROR* drm_sched=
_job_init: entity has no rq!
>>>
>>> in this email,
>>> https://lore.kernel.org/r/CADnq5_PS64jYS_Y3kGW27m-kuWP+FQFiaVcOaZiB=3D=
JLSgPnXBQ@mail.gmail.com
>>>
>>>> =C2=A0=C2=A0 * Returns 0 for success, negative error code otherwise.=

>>>> =C2=A0=C2=A0 */
>>>> =C2=A0 int drm_sched_job_init(struct drm_sched_job *job,
>>>> @@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job=
,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * or wo=
rse--a blank screen--leave a trail in the
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * logs,=
 so this can be debugged easier.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(job->sched, "%s:=
 entity has no rq!\n", __func__);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("%s: entity has n=
o rq!\n", __func__);
>>>
>>> Is it feasible to do something like the following?
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(job->sched ? job->=
sched->dev : NULL, "%s: entity has no rq!\n", __func__);
>>
>> I don't think that's a good idea. Although I'd assume that every drive=
r zero-initializes its job
>> structures, I can't see a rule enforcing that. Hence, job->sched can b=
e a random value until
>> drm_sched_job_arm() is called.
>>
>> However, I notice there are quite a view more fields of struct drm_sch=
ed_job that are never
>> initialized, hence there are either a couple more potential bugs or mi=
ssing documentation that
>> drivers *must* ensure that a job is zero-initialized.
>=20
> Any opinions on that? Otherwise I'd probably go ahead and send a fix fo=
r the other bugs too.

Send the patches.

Will those patches also add pr_fmt() for DRM?

I'm asking because you said you'll add pr_fmt() in a "separate" patch, an=
d I thought it was
okay being self-contained in your patch as per the version I sent.
--=20
Regards,
Luben

--------------DpMs4nwdBTrqFWkcSPu520Ma
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------DpMs4nwdBTrqFWkcSPu520Ma--

--------------0qlI3FtQGuUpqb5S8L603S6K--

--------------7B0Iy6KD7AleabuDKfTGjEH1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZU1RyAUDAAAAAAAKCRBMFUeUMaM0r0k0
AQCcGTC4Vtvvhndwb05I5fLaVFY8QhEF4q+QFKqYtPEnSQD/VdiCb8GF5hopoeUPvfqlpAgXWubG
7blef35iOQWiPgM=
=ovIz
-----END PGP SIGNATURE-----

--------------7B0Iy6KD7AleabuDKfTGjEH1--
