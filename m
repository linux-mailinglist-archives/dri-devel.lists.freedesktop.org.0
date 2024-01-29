Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF4D83FDC0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 06:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2715112472;
	Mon, 29 Jan 2024 05:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1A911246F;
 Mon, 29 Jan 2024 05:30:37 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-429f53f0b0bso28161841cf.2; 
 Sun, 28 Jan 2024 21:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706506176; x=1707110976; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wBQBbraRZw/0WCW3fokYhKF+zwEk3dpsbNrLYLHs3xY=;
 b=gFLHadj6om4yFWgln2gkLrpBFoxsw8erFdJZoaB3YJReTtDLtOME8PSaTkQW4Dr0+G
 FarwbaJeK78Do1KKPNMswtUwPYJHX1gGF698LHPqfYcsnQAmUmWKypdII2slN5ydRhyN
 XGZ1vIyS7aZgzdcN1WNzG3vUB3hJCPQTo2dHOoJNyEWX81p9tIds4Ns8kqVq4eXY20IB
 6GhxOvksDPBQIad1S7IOjy1dUUDROanXUojaMrmxFUkpkMCH/J4tTC/bZZ5XP3Cdhmv9
 2OA1zaxuS3fLNXAfg2fXvBgHYZf09AGkX7bY1rktXLOR2m6UJq78J1B98KaK7g16Kp9T
 BIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706506176; x=1707110976;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wBQBbraRZw/0WCW3fokYhKF+zwEk3dpsbNrLYLHs3xY=;
 b=HZuUiZ1hu7COgLsHLyjacVb3s1CfD2/stHdSDvcWu7z+P+bsdeBONUM6Nb1cQaQXUr
 N12+ssT8ho6m/5fPjaK/dTRAPOJZf6HwD2Kkin+UwXUtD/FN8Q8f7hQ+RSW28VQ4hJel
 S9tulueo5bCEPsCpcLJ9tTdIPozE7qIdMbVeVBTgF603sbAxWCkMOdBRBa0RxF1LkAON
 7cb7i/KT2HEU99phJc9mY8ZVz2ovXNnp8bWp0FY/LAMlcYmht/eQmTdzbXI3rX6B/dvB
 C2gquYgRsJqj6nM3WkIWIhdJbs1w4il5QxQ03KwKxpoTlMs2R75D1W8BO6q2ofzrdcKZ
 qzeQ==
X-Gm-Message-State: AOJu0YwQQl9UDdcSm1cEtL7e/PBvvmwl0XOWA5O3junnVvnCjE6yIL6o
 yfXao8N/HT51EwSt6d6E/Wyx+lvVYcdiVB7qS6hhhbwE62ZDWRRE
X-Google-Smtp-Source: AGHT+IF2GouVzTCFPpuF1NOInBEAds2ceEtCLJOxHIovID9gdDNxgrQUtBPXFxyWaAKh9bTdvgPFSg==
X-Received: by 2002:a05:6214:518b:b0:68c:484c:807d with SMTP id
 kl11-20020a056214518b00b0068c484c807dmr2736159qvb.76.1706506176501; 
 Sun, 28 Jan 2024 21:29:36 -0800 (PST)
Received: from [192.168.2.14] ([174.88.31.222])
 by smtp.gmail.com with ESMTPSA id
 cw13-20020ad44dcd000000b0068c423e8479sm1803730qvb.126.2024.01.28.21.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 21:29:36 -0800 (PST)
Message-ID: <8b06a021-8a80-4e39-a618-7b3630636b2b@gmail.com>
Date: Mon, 29 Jan 2024 00:29:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.7.0
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
Content-Language: en-CA, en-US
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
In-Reply-To: <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Nwq5NZ8hmkaVIlw3rkIld8Vs"
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
Cc: dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 intel-xe@lists.freedesktop.org, Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Nwq5NZ8hmkaVIlw3rkIld8Vs
Content-Type: multipart/mixed; boundary="------------Q1NB2p6bnyo00tMDmY2hGmuQ";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>
Message-ID: <8b06a021-8a80-4e39-a618-7b3630636b2b@gmail.com>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>

--------------Q1NB2p6bnyo00tMDmY2hGmuQ
Content-Type: multipart/mixed; boundary="------------mJJVLZaQCxKsPaANWCqyu751"

--------------mJJVLZaQCxKsPaANWCqyu751
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2024-01-26 11:29, Matthew Brost wrote:
> On Fri, Jan 26, 2024 at 11:32:57AM +0100, Christian K=C3=B6nig wrote:
>> Am 25.01.24 um 18:30 schrieb Matthew Brost:
>>> On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian K=C3=B6nig wrote:=

>>>>
>>>> Am 24.01.24 um 22:08 schrieb Matthew Brost:
>>>>> All entities must be drained in the DRM scheduler run job worker to=


Hi Matt,

Thanks for the patch. Under close review, let's use "checked" instead of =
"drained",
to read as follows,

All entities must be checked in the DRM scheduler run job worker to ...

>>>>> avoid the following case. An entity found that is ready, no job fou=
nd

Continue with the example given by using a colon, as follows,

=2E.. avoid the following case: an entity is found which is ready, yet
no job is returned for that entity when calling drm_sched_entity_pop_job(=
entity).
This causes the job worker to go idle. The correct behaviour is to loop
over all ready entities, until drm_sched_entity_pop_job(entity) returns n=
on-NULL,
or there are no more ready entities.

>>>>> ready on entity, and run job worker goes idle with other entities +=
 jobs
>>>>> ready. Draining all ready entities (i.e. loop over all ready entiti=
es)

You see here how "drain" isn't clear enough, and you clarify in parenthes=
is
that we in fact "loop over all ready entities". So, perhaps let's not use=
 the
verb "drain" and simply use the sentence in the paragraph I've redacted a=
bove.

Also, let's please not use "drain" in the title, as it is confusing and m=
akes me
think of capacitors, transistors, or buckets with water and Archimedes sc=
rews and siphons,
and instead say,

[PATCH]: drm/sched: Really find a ready entity and job in DRM sched run-j=
ob worker

Which makes it really simple and accessible a description. :-)

>>>>> in the run job worker ensures all job that are ready will be schedu=
led.
>>>> That doesn't make sense. drm_sched_select_entity() only returns enti=
ties
>>>> which are "ready", e.g. have a job to run.
>>>>
>>> That is what I thought too, hence my original design but it is not
>>> exactly true. Let me explain.
>>>
>>> drm_sched_select_entity() returns an entity with a non-empty spsc que=
ue
>>> (job in queue) and no *current* waiting dependecies [1]. Dependecies =
for
>>> an entity can be added when drm_sched_entity_pop_job() is called [2][=
3]
>>> returning a NULL job. Thus we can get into a scenario where 2 entitie=
s
>>> A and B both have jobs and no current dependecies. A's job is waiting=

>>> B's job, entity A gets selected first, a dependecy gets installed in
>>> drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.
>>
>> And here is the real problem. run work doesn't goes idle in that momen=
t.
>>
>> drm_sched_run_job_work() should restarts itself until there is either =
no
>> more space in the ring buffer or it can't find a ready entity any more=
=2E
>>
>> At least that was the original design when that was all still driven b=
y a
>> kthread.
>>
>> It can perfectly be that we messed this up when switching from kthread=
 to a
>> work item.
>>
>=20
> Right, that what this patch does - the run worker does not go idle unti=
l
> no ready entities are found. That was incorrect in the original patch
> and fixed here. Do you have any issues with this fix? It has been teste=
d
> 3x times and clearly fixes the issue.

Thanks for following up with Christian.

I agree, the fix makes sense and achieves the original intention as descr=
ibed
by Christian. Also, thanks to all who tested it. Good work, thanks!

With the above changes to the patch title and text addressed, this patch =
would be then,

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

--=20
Regards,
Luben

=20
>=20
> Matt
>=20
>> Regards,
>> Christian.
>>
>>>
>>> The proper solution is to loop over all ready entities until one with=
 a
>>> job is found via drm_sched_entity_pop_job() and then requeue the run
>>> job worker. Or loop over all entities until drm_sched_select_entity()=

>>> returns NULL and then let the run job worker go idle. This is what th=
e
>>> old threaded design did too [4]. Hope this clears everything up.
>>>
>>> Matt
>>>
>>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sc=
heduler/sched_entity.c#L144
>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sc=
heduler/sched_entity.c#L464
>>> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sc=
heduler/sched_entity.c#L397
>>> [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sc=
heduler/sched_main.c#L1011
>>>
>>>> If that's not the case any more then you have broken something else.=

>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
>>>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>>>> Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in3=
7=3DbwuOWtoeeE+q26zE+Q@mail.gmail.com/
>>>>> Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.co=
m>
>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
>>>>> Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limon=
ciello@amd.com/
>>>>> Reported-by: Vlastimil Babka <vbabka@suse.cz>
>>>>> Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-8=
2179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
>>>>>    1 file changed, 7 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
>>>>> index 550492a7a031..85f082396d42 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct w=
ork_struct *w)
>>>>>    	struct drm_sched_entity *entity;
>>>>>    	struct dma_fence *fence;
>>>>>    	struct drm_sched_fence *s_fence;
>>>>> -	struct drm_sched_job *sched_job;
>>>>> +	struct drm_sched_job *sched_job =3D NULL;
>>>>>    	int r;
>>>>>    	if (READ_ONCE(sched->pause_submit))
>>>>>    		return;
>>>>> -	entity =3D drm_sched_select_entity(sched);
>>>>> +	/* Find entity with a ready job */
>>>>> +	while (!sched_job && (entity =3D drm_sched_select_entity(sched)))=
 {
>>>>> +		sched_job =3D drm_sched_entity_pop_job(entity);
>>>>> +		if (!sched_job)
>>>>> +			complete_all(&entity->entity_idle);
>>>>> +	}
>>>>>    	if (!entity)
>>>>> -		return;
>>>>> -
>>>>> -	sched_job =3D drm_sched_entity_pop_job(entity);
>>>>> -	if (!sched_job) {
>>>>> -		complete_all(&entity->entity_idle);
>>>>>    		return;	/* No more work */
>>>>> -	}
>>>>>    	s_fence =3D sched_job->s_fence;
>>

--------------mJJVLZaQCxKsPaANWCqyu751
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

--------------mJJVLZaQCxKsPaANWCqyu751--

--------------Q1NB2p6bnyo00tMDmY2hGmuQ--

--------------Nwq5NZ8hmkaVIlw3rkIld8Vs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZbc3twUDAAAAAAAKCRBMFUeUMaM0r4+Y
AQDKqRE64V846Z5n21tKO1jVL6xKZelPBoi1TBStQQG3FQD9GfxuZsdMOUdCRdNi4afM9FmYBeaz
T/S0Cus80rKc3Q0=
=zHlo
-----END PGP SIGNATURE-----

--------------Nwq5NZ8hmkaVIlw3rkIld8Vs--
