Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23974242B2B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 16:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E39B6E8E8;
	Wed, 12 Aug 2020 14:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86BD6E8E8;
 Wed, 12 Aug 2020 14:18:03 +0000 (UTC)
Received: from home.goodmis.org (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA5B420781;
 Wed, 12 Aug 2020 14:18:02 +0000 (UTC)
Date: Wed, 12 Aug 2020 10:17:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: adjust the pid in the grab_id trace point
Message-ID: <20200812141755.GA8136@home.goodmis.org>
References: <20200807133658.1866-1-christian.koenig@amd.com>
 <20200807133658.1866-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807133658.1866-2-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Shashank.Sharma@amd.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 03:36:58PM +0200, Christian K=F6nig wrote:
> Trace something useful instead of the pid of a kernel thread here.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_trace.h
> index 5da20fc166d9..07f99ef69d91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -228,6 +228,7 @@ TRACE_EVENT(amdgpu_vm_grab_id,
>  			     ),
>  =

>  	    TP_fast_assign(
> +			   __entry->ent.pid =3D vm->task_info.pid;

If the ent.pid is not the pid you are interested in for this trace event, j=
ust
add a "pid" field to the trace event and place it there. Do not modify the
generic pid that is recorded, as we would like that to be consistent for all
trace events.

The "ent.pid" turns into "common_pid" in the field, leaving "pid" free to u=
se.
Other trace events (like sched_waking) record a pid field that is not the s=
ame
as the pid of the executing task.

The "ent.pid" should always be the pid of the task that executed the event.

-- Steve


>  			   __entry->pasid =3D vm->pasid;
>  			   __assign_str(ring, ring->name)
>  			   __entry->vmid =3D job->vmid;
> -- =

> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
