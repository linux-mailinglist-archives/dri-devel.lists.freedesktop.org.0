Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC581A9158E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BCF10EA4D;
	Thu, 17 Apr 2025 07:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="g0892s9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713810EA52;
 Thu, 17 Apr 2025 07:45:45 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZdVLY0tS3z9snh;
 Thu, 17 Apr 2025 09:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744875941; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o01QhRRBt9kbGlZJekh53pp9WB+AZ1VXMfcDIjz0TJ4=;
 b=g0892s9BhUhMNN64iMQ6epD56Kl8AfSwwketorczIHbAL2mlAxPhjNk9ToLepZYUOpKzh4
 DSlDKbgZJjvtp3kzU9wBKftCRNySChuK8SbG6m34MI7DACrM2rxf5RDwkhjoh4zDex07+D
 HpFJQjBURim06m+Fq5OA7SNRQMRvyOAAOusKV5q24Br2cqywBbWNnxKIQ93gSLYAAR23dJ
 hvaioSVBjtF0AJdkMOtrsfgpKag7DATK59lSf/JYWm5ZwK4myuoqa9brQT9QgUc86TPN64
 9s2eavL7DOVxBwGHD+2XSiF/kE/rOBBPmK4glF8bDrT5CAMBN7CKBeW6ze/Uvg==
Message-ID: <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:45:35 +0200
In-Reply-To: <20250407152239.34429-5-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ht1k5cx6yf918cstjfpo94f1fsqmah66
X-MBO-RS-ID: 72d8f281a13a97fa464
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> drm_sched_fini() can leak jobs under certain circumstances.
>=20
> Warn if that happens.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 4 ++++

I hear a lot of amazed silence for this series ^_^

If there's no major pushback, my intention is to pull this in once the
blocking Nouveau-bug has been fixed (by pulling my patch).


In the mean time, let me review my own stuff:

> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 6b72278c4b72..ae3152beca14 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
> =C2=A0	sched->ready =3D false;
> =C2=A0	kfree(sched->sched_rq);
> =C2=A0	sched->sched_rq =3D NULL;
> +
> +	if (!list_empty(&sched->pending_list))
> +		dev_err(sched->dev, "%s: Tearing down scheduler
> while jobs are pending!\n",
> +			__func__);

The "%s" here will be removed since dev_err() alreday prints the
function name.

I find this dev_err() print more useful than the stack a WARN_ON prints
(telling you about invalid_asm_exec_op or stuff like that).

Plus, I guess the places where drivers call drm_sched_fini() are very
well defined and known, so a callstack wouldn't really be useful in the
first place.


P.

> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_fini);
> =C2=A0

