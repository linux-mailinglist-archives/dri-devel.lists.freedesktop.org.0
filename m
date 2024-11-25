Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B859B9D82F5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 11:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B34810E3C9;
	Mon, 25 Nov 2024 10:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b/d0flUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF210E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732528827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DEn3H7sA4YThDVCXh6Hlvh1uMxnLhykOCcAR8z1u5w=;
 b=b/d0flUBcZ9xL9N2GI6Phi4ypEy+QVIyDFMuYFc/FJxRyXPyPRLvN2VPp8hN954+6o2HEV
 SI0v4VSmGlOyx45DW1kJIYB087cYq2yIumxuXGppZ9tpJGS9IkIsnGFxHd4pHqRtR/wYaU
 EHamiIlRpXAT/0CPW+z+bhHuZMam0qM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-VzbM01juNYm2biJVvxE0xg-1; Mon, 25 Nov 2024 05:00:23 -0500
X-MC-Unique: VzbM01juNYm2biJVvxE0xg-1
X-Mimecast-MFC-AGG-ID: VzbM01juNYm2biJVvxE0xg
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa53116660fso160937666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732528822; x=1733133622;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3DEn3H7sA4YThDVCXh6Hlvh1uMxnLhykOCcAR8z1u5w=;
 b=JLPDTgHuPLQvv0dQneIKHXtjUKM758k0QJzxDpNK1W1xAAJ0spCax470We7xjdXtT0
 I/vi2sK99GkSZLQw2mmOJdwIBkS1owdY3dOCi4ybTbyoVPRClTZ2UCZYc4HS1Zds1CIj
 cSDtuc4aWFtYAdfhxkhw3oqsnSsAhgLQA8/q5bdT7zKkNnfPN8B5sWUacjh14zdiqlEg
 yMkUScH5QfcAuqXdQWJsUa/dUe4qQJaU+4I3fTx3cSnkVIhgiN1uQPUd2GQ1Cu/EX0H1
 71GFdxs6DmphgAzgjkJULSqf+mRjbCrTbq/E16w/YFxCHvl73NyEoraC9TC9JPls8yWx
 INKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVrv4YXyuo82J79A1W/EpmYwYRBIkToHbxYrnJPzTg3D9MdRFku4Dapo5gN6QyQjThfkJtiSMe41o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUETCR5VXRn0mjcEtu4lHQoQ++oGEbGwZXqry+r2kA526rq3NH
 cliAjg4+uTjdnuqCJ+dTBXc38eqCZ0Sg6yHIUx0LIUgh/EH7thzEeZI+ngYA4JZy06mWsIcMoN5
 D6A43EfFKW5HPKZCEKeUXt5QvPKfv87ISMTD0jRFieJUHkqy7ZvnyzdPl4Qk2gXd1LQ==
X-Gm-Gg: ASbGncsRjRqXgVdASUMDKIqJ56rs+EWBmiKgPd+5esB0WuyO5/KHvWJl31dNh5F0kFN
 ChVkjqWuzJwuQbrc3kVdOKOmM4Oujo309wzaRMi4RaPsE9Ik3FATNIsdELKNxeQtI6z3dgCmbDJ
 09R9kbD6sw9yo8TNl1uwiQHNwkA9o0u7GyA6dwaPViNyVl8R+Z53m+H6QRqbqfIrM6o8xnOkf05
 bG632bwfB2VBJ2bRARwh+NphheYWrIbrK5tbblns9CtdI62No3Hdi5NmKPBDHFxuxMwp2eZWsh0
 k4EAw2j4vW7866PpxFcpfPlh
X-Received: by 2002:a17:906:31c1:b0:aa5:226a:658f with SMTP id
 a640c23a62f3a-aa5226a65d5mr901180566b.2.1732528822198; 
 Mon, 25 Nov 2024 02:00:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjIwaKOeFJ52jcqkM4BmWh0ypszamdytF2th75k3h9D7KBAjJ7rAmUe7VKN5OqcAsR4y7eGQ==
X-Received: by 2002:a17:906:31c1:b0:aa5:226a:658f with SMTP id
 a640c23a62f3a-aa5226a65d5mr901178066b.2.1732528821863; 
 Mon, 25 Nov 2024 02:00:21 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d40:1c00:e57a:25ed:3c10:67c4?
 ([2001:16b8:3d40:1c00:e57a:25ed:3c10:67c4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa53683eafbsm286688166b.189.2024.11.25.02.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 02:00:21 -0800 (PST)
Message-ID: <a53b8e1576f66c87d652ff58de2a2305e721b418.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/sched: clarify the documentation on
 drm_sched_entity_error
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@kernel.org, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Mon, 25 Nov 2024 11:00:20 +0100
In-Reply-To: <20240918133956.26557-2-christian.koenig@amd.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <20240918133956.26557-2-christian.koenig@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jke95QvKQT2DLR9_h8VToae1UZGPGq3_6U9dX6sRb2o_1732528822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2024-09-18 at 15:39 +0200, Christian K=C3=B6nig wrote:
> Sima requested that in a discussion, just copy&paste my explanation
> from
> the mail.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 17 +++++++++++++++--
> =C2=A01 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..571e2f2365a1 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -166,8 +166,21 @@ bool drm_sched_entity_is_ready(struct
> drm_sched_entity *entity)
> =C2=A0 * drm_sched_entity_error - return error of last scheduled job
> =C2=A0 * @entity: scheduler entity to check

Please move the "Returns:" section to here, so we get a unified style
for the scheduler.

"Returns: the negative error code of the last scheduled job, 0 if there
has been no error, or no job yet."

Regarding your sentence from below:

> "Returns the error of the last scheduled job. Result can change any
> time when
> + * new jobs are pushed to the hw.

what does the last sentence mean? It seems you just want to say that
each time the function is called it can return a new error code?

IMO it should be relatively obvious that this function is racy. If you
want to emphasize it nevertheless I'd do that in a sentence separate
from the "Returns: " section

> =C2=A0 *
> - * Opportunistically return the error of the last scheduled job.
> Result can
> - * change any time when new jobs are pushed to the hw.
> + * Drivers should use this function in two ways:

maybe "in one of two ways" ?

> + *
> + * 1. In it's prepare callback so that when one submission fails all
> following

s/it's/their

> + * from the same ctx are marked with an error number as well.
> + *
> + * This is intentionally done in a driver callback so that driver
> decides if

s/so that driver/so that the driver

> + * they want subsequent submissions to fail or not. That can be
> helpful for
> + * example for in kernel paging queues where submissions don't

s/for in kernel/in kernel

> depend on each
> + * other and a failed submission shouldn't cancel all following.
> + *
> + * 2. In it's submission IOCTL to reject new submissions and inform
> userspace

s/In it's/In their

> + * that it needs to kick of some error handling.
> + *
> + * Returns the error of the last scheduled job. Result can change
> any time when
> + * new jobs are pushed to the hw.
> =C2=A0 */
> =C2=A0int drm_sched_entity_error(struct drm_sched_entity *entity)
> =C2=A0{

btw I talked to Dave about the other patch. I think if you provide a v2
with Janis suggestions and mine here we can merge this


Danke,
P.

