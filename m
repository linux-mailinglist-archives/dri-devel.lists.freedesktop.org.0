Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5B7D900D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBC510E947;
	Fri, 27 Oct 2023 07:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9E010E947
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:39:48 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0152666071F1;
 Fri, 27 Oct 2023 08:39:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698392387;
 bh=j45biqkfxRiKG00fpgi7uRwnU46+FHWSLAeTKnn0EII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VcHWNHOXH+xh8+ZPNn4nQ3e2lFSd1AAuIZeXgZv4WMZVx/R1JOdoAB9PsQMtESjju
 wxwaSWYeCYciC0jijwlw98b7551TGzfOC07JpyqfHSMoBNqi55pzBfpf8er5ge+2NJ
 7PBGMRsJztf5fmUoJFFM28rNGCfOUELnLt0/3ygXbfksf2JmZF8FSQY+zGicvoYh3r
 DrNa5Tmz4hQDh0oCVEftINMYQwxMH2bs0SBQd2iSpJ7LSFQYMYH1GTuSx4E+W2urTX
 sr+qiIo6SfVvb0a/pPoYKtEW5v8OboTv4LCZKpJSkvVPj/NlvGVmdgUfWc9cGNpym8
 yKeAjgAVANyQQ==
Date: Fri, 27 Oct 2023 09:39:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027093943.3f0ae992@collabora.com>
In-Reply-To: <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 09:35:01 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 27.10.23 um 09:32 schrieb Boris Brezillon:
> > On Fri, 27 Oct 2023 09:22:12 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >>> +
> >>> +	/**
> >>> +	 * @update_job_credits: Called once the scheduler is considering th=
is
> >>> +	 * job for execution.
> >>> +	 *
> >>> +	 * Drivers may use this to update the job's submission credits, whi=
ch is
> >>> +	 * useful to e.g. deduct the number of native fences which have been
> >>> +	 * signaled meanwhile.
> >>> +	 *
> >>> +	 * The callback must either return the new number of submission cre=
dits
> >>> +	 * for the given job, or zero if no update is required.
> >>> +	 *
> >>> +	 * This callback is optional.
> >>> +	 */
> >>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job); =20
> >> Why do we need an extra callback for this?
> >>
> >> Just document that prepare_job() is allowed to reduce the number of
> >> credits the job might need.
> > ->prepare_job() is called only once if the returned fence is NULL, but =
=20
> > we need this credit-update to happen every time a job is considered for
> > execution by the scheduler. =20
>=20
> But the job is only considered for execution once. How do you see that=20
> this is called multiple times?

Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
will go look for another entity that has a job ready for execution, and
get back to this entity later, and test drm_sched_can_queue() again.
Basically, any time drm_sched_can_queue() is called, the job credits
update should happen, so we have an accurate view of how many credits
this job needs.
