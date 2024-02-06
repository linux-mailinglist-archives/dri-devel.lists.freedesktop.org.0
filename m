Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A784AB39
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 01:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F8710FDC9;
	Tue,  6 Feb 2024 00:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KAnzjmMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210D710FDC9;
 Tue,  6 Feb 2024 00:56:15 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-68c8790aeadso25494456d6.1; 
 Mon, 05 Feb 2024 16:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707180974; x=1707785774; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1jU23OgRu2oCVCExs5kJ+T8cyL7dna5EiFjSYcnIYzc=;
 b=KAnzjmMe8XSqWWOdmXXJV01lY/A2G7raKg4xwrxeaXrB9UChh8hKZPdIhdtzVbDLTb
 aZTYghcdEEIVfpdUybKa3bsRo6kE+LYBiXazupV1wHcbdj83WayBVALi7cVBUrttj88m
 Kl6Vz09IuD2SoHzhSmvj+08UkNY9nhhjw5jVf9dQfEUw3rJxL3mVEuAXqRb8lGyZP092
 z+nrY8FCHKHB3RRhK7Q4xeF1HA4mbfd9XgO7lyf3hqmwjyMRYAg9pfJsy1J9M93asP0i
 DwgaaG380xBxG88dThWjfcXOebkPzXLQnLYYQw/tfSfJnG7S0CS7clnH6MsFzyL+cCis
 wBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707180974; x=1707785774;
 h=in-reply-to:autocrypt:from:references:cc:to:content-language
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1jU23OgRu2oCVCExs5kJ+T8cyL7dna5EiFjSYcnIYzc=;
 b=BCIlGLXozcvHBdy67PzpQKCp6lTwWfrPYiTe0g7HxzdGg3Fb4NFDNXMbeLhabZ5oby
 i1OM8jEezO0piqeUs3d2TYLr9KyDXuTnfFqc30IUPEmZw8vvn2RUIEFY3rU9Ng4upfvv
 NTnRYVRIK0i9Z/BCDWreLgvta71HhcR14euz754PpidbQuKPsueqcl77dd9QijZ2OOhQ
 duuPb2HL+oiem7N7ug7Cs/rcqnIzPVtAu8ENhh1MqJSo9vpdK+ZLWBDknzpJlaUFfasK
 /m6XeVhOK5vZJHLobP829cLe4A/D8xTsEk/2R6DCImGagGzqueuClcYhMnspzM85smJv
 y8Mg==
X-Gm-Message-State: AOJu0YxgVc92RlOYFg5OUs78PPCMJM2tA1HkDzAurYAFX94Vq2x1JaNX
 CDMQeWsOLqY+OwcOiwU5IpQmpbVpFbSdoLCeWPSwZGMgJ3bVY14A
X-Google-Smtp-Source: AGHT+IEIn8In5xIXLzKOLNmYrz3xHhssguNV19RxAkY9tW+Zhl4EmXcFIjDFV8MfODHs5QDAsMEGGw==
X-Received: by 2002:a0c:e052:0:b0:68c:9007:939f with SMTP id
 y18-20020a0ce052000000b0068c9007939fmr1106884qvk.34.1707180973855; 
 Mon, 05 Feb 2024 16:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWEhBPHEGzbUFrTRAWYJ+K79xdFfhJHEZS8l26dTPxYxlXfvpFa3JnTzd4xwlo6o7HFoNk9JKEBnKBSNyZZB5eFAaSTZbG53nLwBOcZ5t1QGbVpFI8JlW20izjQHy+q8ogGHVoHIkF4aL7aOvwNTpR858BbQx1nR+v5GfglbZUpuX+iGcmq3VqYxwTMJIzVuAoeBzzLZofnvosY3jIzh2iETpw5N76Ntl4qOdwAICfK/rsHiSm/miAmsY0RAtswIDMF1t7uhsYnrAvpJrAGqZfVesBgGSNSxDiljeWlQ5/YKisqKnWu3JNU
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 mu9-20020a056214328900b006862b537412sm515672qvb.123.2024.02.05.16.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 16:56:13 -0800 (PST)
Message-ID: <ed315f43-eb84-430f-bc41-f93f6e3efcd4@gmail.com>
Date: Mon, 5 Feb 2024 19:56:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.7.0
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Content-Language: en-CA, en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240130030413.2031009-1-matthew.brost@intel.com>
 <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com> <Zb1ll0rXlbaAaxKP@intel.com>
 <c5a7ae52-98e2-4edf-a539-71e4166fe3a4@amd.com> <ZcDjoek_l_cqE4Rr@intel.com>
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
In-Reply-To: <ZcDjoek_l_cqE4Rr@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ijt0AaZNZLtVJzCYPTfL6Xka"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ijt0AaZNZLtVJzCYPTfL6Xka
Content-Type: multipart/mixed; boundary="------------MdUIPO7QKebsCLJXQI6gxJ3H";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <ed315f43-eb84-430f-bc41-f93f6e3efcd4@gmail.com>
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
References: <20240130030413.2031009-1-matthew.brost@intel.com>
 <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com> <Zb1ll0rXlbaAaxKP@intel.com>
 <c5a7ae52-98e2-4edf-a539-71e4166fe3a4@amd.com> <ZcDjoek_l_cqE4Rr@intel.com>
In-Reply-To: <ZcDjoek_l_cqE4Rr@intel.com>

--------------MdUIPO7QKebsCLJXQI6gxJ3H
Content-Type: multipart/mixed; boundary="------------SjNEoye3eZoU1I05NF2Ll2mi"

--------------SjNEoye3eZoU1I05NF2Ll2mi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-02-05 08:33, Rodrigo Vivi wrote:
> On Mon, Feb 05, 2024 at 09:44:56AM +0100, Christian K=C3=B6nig wrote:
>> Am 02.02.24 um 22:58 schrieb Rodrigo Vivi:
>>> On Tue, Jan 30, 2024 at 08:05:29AM +0100, Christian K=C3=B6nig wrote:=

>>>> Am 30.01.24 um 04:04 schrieb Matthew Brost:
>>>>> Rather then loop over entities until one with a ready job is found,=

>>>>> re-queue the run job worker when drm_sched_entity_pop_job() returns=
 NULL.
>>>>>
>>>>> Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run=
 job worker")
>>> First of all there's a small typo in this Fixes tag that needs to be =
fixed.
>>> The correct one is:
>>>
>>> Fixes: 66dbd9004a55 ("drm/sched: Drain all entities in DRM sched run =
job worker")
>=20
> Cc: Dave Airlie <airlied@redhat.com>
>=20
>>>
>>> But I couldn't apply this right now in any of our drm-tip trees becau=
se it
>>> is not clear where this is coming from originally.
>>>
>>> likely amd tree?!
>>
>> No, this comes from Matthews work on the DRM scheduler.
>>
>> Matthews patches were most likely merged through drm-misc.
>=20
> the original is not there in drm-misc-next.
> it looks like Dave had taken that one directly to drm-next.
> So we either need the drm-misc maintainers to have a backmerge or
> Dave to take this through the drm-fixes directly.

This is indeed the case.

I was going to push this patch through drm-misc-next, but the original/ba=
se patch
(<20240124210811.1639040-1-matthew.brost@intel.com>) isn't there.

If drm-misc maintainers back merge drm-fixes into drm-misc-next,
I'll push this patch into drm-misc-next right away, so that it is complet=
e,
and people can run and test it fully.

Else, Dave will have to pull this patch directly into drm-fixes with our =
tags,
as was done for the base patch.

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

Regards,
Luben

>=20
>>
>> Regards,
>> Christian.
>>
>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Christian, if this came from the amd, could you please apply it there=
 and
>>> propagate through your fixes flow?
>>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
>>>>>    1 file changed, 9 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
>>>>> index 8acbef7ae53d..7e90c9f95611 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct w=
ork_struct *w)
>>>>>    	struct drm_sched_entity *entity;
>>>>>    	struct dma_fence *fence;
>>>>>    	struct drm_sched_fence *s_fence;
>>>>> -	struct drm_sched_job *sched_job =3D NULL;
>>>>> +	struct drm_sched_job *sched_job;
>>>>>    	int r;
>>>>>    	if (READ_ONCE(sched->pause_submit))
>>>>>    		return;
>>>>>    	/* Find entity with a ready job */
>>>>> -	while (!sched_job && (entity =3D drm_sched_select_entity(sched)))=
 {
>>>>> -		sched_job =3D drm_sched_entity_pop_job(entity);
>>>>> -		if (!sched_job)
>>>>> -			complete_all(&entity->entity_idle);
>>>>> -	}
>>>>> +	entity =3D drm_sched_select_entity(sched);
>>>>>    	if (!entity)
>>>>>    		return;	/* No more work */
>>>>> +	sched_job =3D drm_sched_entity_pop_job(entity);
>>>>> +	if (!sched_job) {
>>>>> +		complete_all(&entity->entity_idle);
>>>>> +		drm_sched_run_job_queue(sched);
>>>>> +		return;
>>>>> +	}
>>>>> +
>>>>>    	s_fence =3D sched_job->s_fence;
>>>>>    	atomic_add(sched_job->credits, &sched->credit_count);
>>

--=20
Regards,
Luben

--------------SjNEoye3eZoU1I05NF2Ll2mi
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

--------------SjNEoye3eZoU1I05NF2Ll2mi--

--------------MdUIPO7QKebsCLJXQI6gxJ3H--

--------------ijt0AaZNZLtVJzCYPTfL6Xka
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZcGDpAUDAAAAAAAKCRBMFUeUMaM0r760
AQDlNerlKLSALpN4ihGxucsVKzcvIZ8roMEYNHBRduIYlwD+NmonzcuVFhQF5mEc6zsBISLCk/9K
ARMbohz/2lZKowI=
=FXu5
-----END PGP SIGNATURE-----

--------------ijt0AaZNZLtVJzCYPTfL6Xka--
