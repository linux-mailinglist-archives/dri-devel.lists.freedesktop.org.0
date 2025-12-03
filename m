Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F46C9EB36
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137DA10E719;
	Wed,  3 Dec 2025 10:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TrME8E5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7553310E719
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764757746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qblXqn/QMpqYaXbwXzu9x9sZsuNG8VFo90RKrBLW2Kc=;
 b=TrME8E5TSXHtbu2w+Rl7nMDtZI2og1lS3njbwZMlCh/ALg8w5zFCulicezHar6ZOlvMGgp
 glsVzMFl+B7+lPjU3wyFdYCpKEZnUY28mqGnpraePKgB7MGAgw6SZeUVB3w8QPCkJY9V56
 l655N8JF2QaFo4cX/BnS6oBaJhWs5U8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-7pVevkTQM3Wz182_fjh0Yw-1; Wed, 03 Dec 2025 05:29:05 -0500
X-MC-Unique: 7pVevkTQM3Wz182_fjh0Yw-1
X-Mimecast-MFC-AGG-ID: 7pVevkTQM3Wz182_fjh0Yw_1764757744
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b895b520a2so6017423b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 02:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764757744; x=1765362544;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XGS+mHYG4PrWbToZur3MeIRA7pWGjQeZAp+77QWSays=;
 b=UmxasXhLPg65dbd29bu1sX3rNg4SyvJQMJYiMApYhEkjK8udm5CEHfdupPd0pRHZJ+
 Vu7Irl/k1iWcbvQBtL8maTq85RZyXb24y4bdlCgaAPk8Cvw62bFzyy1Bwwl9pRSEdCwk
 7re1pwgXd79FU5e706kzmddyxaFqOOKrE2KK/HaH0KOKKH6NWRXbrYTcPc4ieXHfvYjy
 hpHlXSmMpH9yr7SuuZRDFbahJOIaz86uC9AgzPypNxTlmgUQ/ceK3K5WVPp4aV331R4I
 hY98JOIEovOaAd0B5HlDohz4DIqu3DlNnfC7+74jAwyl4FSbl9YeApPxzvaL8kEgqlql
 q1gA==
X-Gm-Message-State: AOJu0YxfF/+SBwL2Og6pvo1MPNZEiZhsJ73lowHf3F3ORBxJpngh4gpH
 BL6Aeqph1LU2QoY4QMESvkZT6B82NiZtypLcC8igSBAgjqR7SnsgbztuA+sFsOg/xajXJ8RAWy0
 uJe7Y3WFygLhhPeOlgoP2mDGFE1XKbqF11yLxXTNZ5xYlhg779sVUrfklTj5vVVoCycAnng==
X-Gm-Gg: ASbGncvh1nVrxr8s5dpuEZsnzzHHPmsYhONu7uXlOMpequWHcn+LJj9URCpVdcv+7Wx
 Zzeisa9FV1wTvZJya+2v9VR4rdzbpNFXv1EpfjtxazsIF4iHM8SjS0aBZba1GYnUmM3VT1bTRZg
 yUnURQ0mZIGFaNzEcyYnRCGM57+dNu09z27RABlaHDTUMSGuLUrlRykEqnMhkseCGvtdanzSMQd
 cfxZFfIJXC+Fn82ME3VpTbYqwB/IC6OulPemM898pyvDaSU9b4tnX5gNgW9AcXSg9gN524FeVyR
 wCnoRBHcyAyAeDA4jtRS4G8YovPzJDLQCjoCzcnI7+PnBTYnyntew7aapyayZGczRKWSyp7un6S
 ZEXV0b1hUWLiL3FWnepQyVbBmoKWm5uzjGlXb
X-Received: by 2002:a05:6a21:999e:b0:35f:5fc4:d88c with SMTP id
 adf61e73a8af0-363f5d46ea5mr2380377637.13.1764757744195; 
 Wed, 03 Dec 2025 02:29:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjYpGTg+jJjhnKyQfPKG1ZG8GVqu/g7JqGfLsAio9vExnMALrh9T3CC5TQzWgOgAIPAFC6Eg==
X-Received: by 2002:a05:6a21:999e:b0:35f:5fc4:d88c with SMTP id
 adf61e73a8af0-363f5d46ea5mr2380357637.13.1764757743831; 
 Wed, 03 Dec 2025 02:29:03 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15e7db416sm19564819b3a.41.2025.12.03.02.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:29:03 -0800 (PST)
Message-ID: <56239a0c6f9a295d0124423c2701afb0de0da0a7.camel@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dakr@kernel.org
Date: Wed, 03 Dec 2025 11:28:54 +0100
In-Reply-To: <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LGV9WB5WaYt49svMiDlKfUk27CrRsf5-TAHSR8wMTlQ_1764757744
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

On Wed, 2025-12-03 at 10:07 +0100, Philipp Stanner wrote:
> +Cc Alex, Christian, Danilo
>=20
>=20
> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> >=20

[=E2=80=A6]

> > +
> > +/**
> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in=
 scheduler
> > + * @__job: Current pending job being iterated over
> > + * @__sched: DRM scheduler to iterate over pending jobs
> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no f=
ilter
> > + *
> > + * Iterator for each pending job in scheduler, filtering on an entity,=
 and
> > + * enforcing scheduler is fully stopped
> > + */
> > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)=09=09=
\
> > +=09scoped_guard(drm_sched_pending_job_iter, (__sched))=09=09=09\
> > +=09=09list_for_each_entry((__job), &(__sched)->pending_list, list)=09\
> > +=09=09=09for_each_if(!(__entity) || (__job)->entity =3D=3D (__entity))
> > +
> > =C2=A0#endif
>=20
>=20
> See my comments in the first patch. The docu doesn't mention at all why
> this new functionality exists and when and why users would be expected
> to use it.
>=20
> As far as I remember from XDC, both AMD and Intel overwrite a timed out
> jobs buffer data in the rings on GPU reset. To do so, the driver needs
> the timedout job (passed through timedout_job() callback) and then
> needs all the pending non-broken jobs.
>=20
> AFAICS your patch provides a generic iterator over the entire
> pending_list. How is a driver then supposed to determine which are the
> non-broken jobs (just asking, but that needs to be documented)?
>=20
> Could it make sense to use a different iterator which only returns jobs
> of not belonging to the same context as the timedout-one?

(forget about that comment, you do that with the entity-filter
obviously)

P.

