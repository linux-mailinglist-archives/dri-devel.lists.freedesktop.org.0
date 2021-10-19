Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6A4336F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 15:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96216E15D;
	Tue, 19 Oct 2021 13:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC876E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 13:25:41 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n7so6153742ljp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X1jY2Qqxt6YWhnV3gpCcJZNEFbKKuJn17k39miNOmnw=;
 b=ER4eL+lj7rSgFqe1k9f7NP0Xedp2lyl0DbOhg2ocq5ghDZs3wJsUNzd2AxfVUBWgOX
 CldSEyp9jJ6MJxTT9k8h7QtJbdUZcUgPiO8zchszYrX3RAdO0HjkSKlpNCSq4cnW81ev
 uSnFWz5geOsAnr6dyKG0WG9IumnTGkz4OS1Eu993pMLhZvyeLoCVsldmcPUP60gfaPIX
 rf84owpPqdP+abE7HMt5cdmlMnWIKksTXnntXMAZfNEbcqyT/rFFi5pL/pqooVIdAdNi
 X+T88fR/Z13PWJhjH4WTFf14Zj49wJ46wE4OvsHc6GvO8DZx3AbqpzhX3zQCvxFf0TP/
 RczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1jY2Qqxt6YWhnV3gpCcJZNEFbKKuJn17k39miNOmnw=;
 b=NVL4p9TLytueQlB9d+FjLKBeNRlQI6Af0ft51HVwu/uQ4HSxzAM4pFhbF39e5vEG5/
 IOvHAPClsO07X2lvajd9k5jShvSuobjJsFk8rPgpZc6yX2GgnCYXXW8PvKbe89oYkCgv
 yon8MNQCCmLIap8v4ruFMZoSg2iWpX4JRMlqQtHVh/n8I3BPkFUv3hIyvzJoSOwzy/as
 uWUPk4h3TJtPDIgxSW3et1oHK/nXB63oHFPeYbYIpRkWR7U023qFF6rkvT5CN2V5ERS7
 m7RCumuDkTHxNxQXvI2gwYEXJvnEFd28OagsaZPkXJOEE+3uVlxjeb7kf6gvZ3AlGQKE
 QZAA==
X-Gm-Message-State: AOAM530gMFlFtGsIPtNreeU7Gno2lAiqX6rxbT4op2MKeUqxhVDyETB7
 qK8GDTwRPUo8jhRh4/3cOYmk6tl/Rm0=
X-Google-Smtp-Source: ABdhPJyEBGG7iDcVG31icdYRuoDVz7fUXzq7qVuT8pUeGj2UN5S1m4KOei5sbJ8rVY7PI/3BigmyhA==
X-Received: by 2002:a2e:b603:: with SMTP id r3mr6838475ljn.14.1634649940193;
 Tue, 19 Oct 2021 06:25:40 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id l11sm382318lfg.79.2021.10.19.06.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 06:25:39 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
Date: Tue, 19 Oct 2021 15:25:38 +0200
Message-ID: <1649107.a7JZP30qnB@archbook>
In-Reply-To: <b60c6edd-f5ef-d814-cd6d-ae3186758203@gmail.com>
References: <20211019112706.27769-1-christian.koenig@amd.com>
 <YW67iLFQ7ttCT54O@phenom.ffwll.local>
 <b60c6edd-f5ef-d814-cd6d-ae3186758203@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Dienstag, 19. Oktober 2021 15:06:31 CEST Christian K=F6nig wrote:
>=20
> Am 19.10.21 um 14:35 schrieb Daniel Vetter:
> > On Tue, Oct 19, 2021 at 01:27:06PM +0200, Christian K=F6nig wrote:
> >> Trivial fix since we now need to grab a reference to the fence we have
> >> added. Previously the dma_resv function where doing that for us.
> >>
> >> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> >> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job=
_add_implicit_dependencies v2")
> > Uh I completely missed checking for that. Did you review all other
> > conversions you've pushed for this kind of bug?
>=20
> Yeah, currently double checking that.
>=20
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Also
> >
> > Reported-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> > References: https://lore.kernel.org/dri-devel/2023306.UmlnhvANQh@archbo=
ok/
> >
> > It's important to credit bug reporters! Also upgrade to t-b if Nicolas
> > gets around to testing quickly.
>=20
> Yeah, the credit part is certainly correct. I just usually ask people=20
> before adding their mail address to kernel commits because of the spam=20
> you get :)
>=20
> Cheers,
> Christian.

No worries, I made this e-mail address specifically for kernel work due
to this. I wouldn't even dare posting on public mailing lists with my
regular e-mail address.

Regards,
Nicolas Frattaroli

>=20
> >
> > Cheers, Daniel
> >
> >> ---
> >>   drivers/gpu/drm/scheduler/sched_main.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/=
scheduler/sched_main.c
> >> index 5bc5f775abe1..94fe51b3caa2 100644
> >> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >> @@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct=
 drm_sched_job *job,
> >>   		ret =3D drm_sched_job_add_dependency(job, fence);
> >>   		if (ret)
> >>   			return ret;
> >> +
> >> +		/* Make sure to grab an additional ref on the added fence */
> >> +		dma_fence_get(fence);
> >>   	}
> >>   	return 0;
> >>   }
> >>
>=20
>=20




