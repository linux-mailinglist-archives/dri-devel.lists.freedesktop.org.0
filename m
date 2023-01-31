Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51468351C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 19:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844E10E383;
	Tue, 31 Jan 2023 18:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72410E37A;
 Tue, 31 Jan 2023 18:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/rgvxGWnSIZxhDHA+PyLokEZEN7lUSjVRJmpoECKkU=; b=lUSTTmdbQWoWZwzGj1mvEpNaQt
 XhFhBiRXyEuUqewMvBHAeBS8OdSrxwb9VMj5UsRUI6QEsPj7W4MstfFRVQO6UqJ786jOslJmdLPZl
 jd7bqP43hfyaYpOhdQpXuF6+wrYFXfHFoRGSSckgzg9KdQ7/XNaGFAs1leyj4ir2ONE1Z7BglO5CG
 8lEs2dZesj9oi0cGEF7cH+fmXUBNKUjFN/MRg+3Wcicwgo7tfQSzjtM6xWhsRlQ/ARludP+rkijGZ
 p+snt7g9VyQ3Ml3rLah+kd7jqCnMuMeL5ZJWUOwyZoYE9HIO99kA7seWb4xV3n3c5KsVZRog2e6M2
 q3rWg/kA==;
Received: from [187.10.60.187] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pMvHm-005h7w-E1; Tue, 31 Jan 2023 19:23:18 +0100
Message-ID: <94f48675-54be-6d88-8940-86c90ebf1e1c@igalia.com>
Date: Tue, 31 Jan 2023 15:22:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <6a5bea62-b711-6f2e-b366-a1083bc7327f@igalia.com>
 <CADnq5_OdBJiDa9Y2s6orJu7Ez0Lkx37xceHhfDCDnKNKdvpT7g@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CADnq5_OdBJiDa9Y2s6orJu7Ez0Lkx37xceHhfDCDnKNKdvpT7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/01/2023 14:52, Alex Deucher wrote:
> [...]
>> (b) We can't use sched.ready, which would make sense...but amdgpu
>> overrides its meaning, the driver manipulates this value for its own
>> purposes of tracking ring init, or something like that.
>>
>> This is the tangential topic: what should we do here? My understanding
>> of Alex's message is that we could have a "ready" field in the ring
>> structure and stop messing with sched.ready - does it make sense Alex?
> 
> Yes, I think so.  The tricky part will be figuring out which current
> sched.ready checks are checking for the scheduler being ready vs.
> whether the ring itself is ready.
> 

Thanks, makes sense!

$ grep -nr "sched.ready" drivers/gpu/drm/amd/ | wc -l
83

Maybe not super tough, I hope heh

>>
>> Guchun / Christian, does it also make sense for you?
>>
>>
>> Regarding (a), I could re-submit having s/sched.name/sched.ops, no
>> biggies, I tested both to be fair, before sending...I just chose name
>> but any field that is proper initialized on drm_sched_init() would work.
> 
> Yeah, I think ops is fine.  You could even use sched.ready after we
> clean up the use of that in the driver.  There are already a bunch of
> places where we check sched.ready to check if the scheduler really is
> ready.

Hmm..unfortunately, doesn't work. This was a case in which sched.ready
was set to true in the ring init routine, but scheduler wasn't properly
initialized. So, a different key for comparison is required..I'll
re-submit with sched.ops.

After a potential rework of the driver to get rid of sched.ready
manipulation, then it could be fixed to properly use this flag...makes
sense to you?

Tnx again for the prompt review!
Cheers,


Guilherme
