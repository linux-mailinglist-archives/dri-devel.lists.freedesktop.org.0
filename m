Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E96CB2EC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 02:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FCE10E03D;
	Tue, 28 Mar 2023 00:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DEB10E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 00:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679965056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AW30FnYIjWdLuO0x0jWm9YgXrMh7ej06XUZ+z260h6Y=;
 b=eUU0iZFPMl1nFRmQc6SNalp/EDc3lEoY8aScvPyEINpYXxNf4k/ygHJlqHQB1YZyQgZgkj
 Xo+mgR9zr1Dfp4d9lfem6NuAnwMH254h0i6QOuaCIEa3d7+cig8xhhUouC8pItIyWOxL7j
 lTyH5Tzm9/2VB9gBKJMBqJbBipEHgoQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-Ptp1Gdk8MMqPbXC6VKp_Kw-1; Mon, 27 Mar 2023 20:57:34 -0400
X-MC-Unique: Ptp1Gdk8MMqPbXC6VKp_Kw-1
Received: by mail-ed1-f72.google.com with SMTP id
 a40-20020a509eab000000b005024c025bf4so2574104edf.14
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 17:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679965053;
 h=content-transfer-encoding:organization:subject:from:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AW30FnYIjWdLuO0x0jWm9YgXrMh7ej06XUZ+z260h6Y=;
 b=2zoN/VUh9MyStQhndkCETqV3qJBI9lBypBoU4G4SCG9yJ6d2a8aU1nWQPpgjzUHDCf
 Gduqh8hlQeiM/mwpkCPuaXjvJw5sm0a/lblvfEhxJ/r3j5sBYOdVJvCPHta8IPQtLp9k
 70sdB/lZ8etaBpVxIvOAyTO+NzeBpZJZgq3QrY6mBjckRJhjuA91Rtvm8d+M6jlrH3Gx
 qWFOsel7JyTdy4+dvQYH5vuFiHouNuO/iaEZuG3gXorWRTiuNJErf8TD688FcI3u+b4S
 U0WDhBmefknLsSe0ZwyeSi4eQQdUhd/rQyThRUZi7BzzfTXuvdmel808ilblC3yFgFAd
 qApg==
X-Gm-Message-State: AAQBX9d+LYxpb0QknhOQSoEtDANPbTVoorGF6v27HNnCiuYtHKRXqFLK
 L4vqTY12aEuIGO5tvECaSrN+2pSCAOl0wvTPUR3K/C0v3tL7KobycZ8hLUUyZiUJgWL3TEGMTaj
 gcKg4kyrnpRuSKFN7cUt5xEJ1tMCs
X-Received: by 2002:a17:906:a117:b0:939:fb22:c4c7 with SMTP id
 t23-20020a170906a11700b00939fb22c4c7mr15196836ejy.43.1679965053569; 
 Mon, 27 Mar 2023 17:57:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZkAeHauFSbfm4BVv5TpPPd9MX5xcz+qhct+xSpNGIVDfnEUB6PnTbKqJ0zbPJu2h3sYMR1Ww==
X-Received: by 2002:a17:906:a117:b0:939:fb22:c4c7 with SMTP id
 t23-20020a170906a11700b00939fb22c4c7mr15196823ejy.43.1679965053285; 
 Mon, 27 Mar 2023 17:57:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a170906292200b009321cd80e15sm14264240ejd.73.2023.03.27.17.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 17:57:32 -0700 (PDT)
Message-ID: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
Date: Tue, 28 Mar 2023 02:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>, luben.tuikov@amd.com,
 l.stach@pengutronix.de, Bagas Sanjaya <bagasdotme@gmail.com>,
 andrey.grodzovsky@amd.com, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Danilo Krummrich <dakr@redhat.com>
Subject: [Regression] drm/scheduler: track GPU active time per entity
Organization: RedHat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Commit df622729ddbf ("drm/scheduler: track GPU active time per entity") 
tries to track the accumulated time that a job was active on the GPU 
writing it to the entity through which the job was deployed to the 
scheduler originally. This is done within drm_sched_get_cleanup_job() 
which fetches a job from the schedulers pending_list.

Doing this can result in a race condition where the entity is already 
freed, but the entity's newly added elapsed_ns field is still accessed 
once the job is fetched from the pending_list.

After drm_sched_entity_destroy() being called it should be safe to free 
the structure that embeds the entity. However, a job originally handed 
over to the scheduler by this entity might still reside in the 
schedulers pending_list for cleanup after drm_sched_entity_destroy() 
already being called and the entity being freed. Hence, we can run into 
a UAF.

In my case it happened that a job, as explained above, was just picked 
from the schedulers pending_list after the entity was freed due to the 
client application exiting. Meanwhile this freed up memory was already 
allocated for a subsequent client applications job structure again. 
Hence, the new jobs memory got corrupted. Luckily, I was able to 
reproduce the same corruption over and over again by just using 
deqp-runner to run a specific set of VK test cases in parallel.

Fixing this issue doesn't seem to be very straightforward though (unless 
I miss something), which is why I'm writing this mail instead of sending 
a fix directly.

Spontaneously, I see three options to fix it:

1. Rather than embedding the entity into driver specific structures 
(e.g. tied to file_priv) we could allocate the entity separately and 
reference count it, such that it's only freed up once all jobs that were 
deployed through this entity are fetched from the schedulers pending list.

2. Somehow make sure drm_sched_entity_destroy() does block until all 
jobs deployed through this entity were fetched from the schedulers 
pending list. Though, I'm pretty sure that this is not really desirable.

3. Just revert the change and let drivers implement tracking of GPU 
active times themselves.

In the case of just reverting the change I'd propose to also set a jobs 
entity pointer to NULL  once the job was taken from the entity, such 
that in case of a future issue we fail where the actual issue resides 
and to make it more obvious that the field shouldn't be used anymore 
after the job was taken from the entity.

I'm happy to implement the solution we agree on. However, it might also 
make sense to revert the change until we have a solution in place. I'm 
also happy to send a revert with a proper description of the problem. 
Please let me know what you think.

- Danilo

