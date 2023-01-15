Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541766B3FF
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 21:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53B210E3B0;
	Sun, 15 Jan 2023 20:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sun, 15 Jan 2023 20:57:19 UTC
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797CD10E3B0;
 Sun, 15 Jan 2023 20:57:19 +0000 (UTC)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 55F981A0A53;
 Sun, 15 Jan 2023 20:52:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf10.hostedemail.com (Postfix) with ESMTPA id A6A8832; 
 Sun, 15 Jan 2023 20:52:11 +0000 (UTC)
Message-ID: <33ecbe8971bb9c90d72c67d43ca740abac160908.camel@perches.com>
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
From: Joe Perches <joe@perches.com>
To: Deepak R Varma <drv@mailo.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>,  amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Sun, 15 Jan 2023 12:52:10 -0800
In-Reply-To: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: A6A8832
X-Spam-Status: No, score=-0.11
X-Rspamd-Server: rspamout03
X-Stat-Signature: nmp5jzgs6mbr4ybrsoi3t7kdy77pzftq
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+vcIh7h853zIRDiyU/iVp2UCz25hch+jM=
X-HE-Tag: 1673815931-499090
X-HE-Meta: U2FsdGVkX1/EeyVIfaSREYkP20+/ZisoRlOpWZ33AFH9Y7nb5ddC0nDiZ8wdYjIk0gbCITI5svD3Yr3xHWrKTg==
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-01-15 at 15:30 +0530, Deepak R Varma wrote:
> The if / else block code has same effect irrespective of the logical
> evaluation.  Hence, simply the implementation by removing the unnecessary
> conditional evaluation. While at it, also fix the long line checkpatch
> complaint. Issue identified using cond_no_effect.cocci Coccinelle
> semantic patch script.
>=20
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Please note: The proposed change is compile tested only. If there are any
> inbuilt test cases that I should run for further verification, I will app=
reciate
> guidance about it. Thank you.

Preface: I do not know the code.

Perhaps Rodrigo Siqueira made a copy/paste error submitting the code for
commit 9114b55fabae ("drm/amd/display: Fix SubVP control flow in the MPO co=
ntext")
as the code prior to this change is identical.

Perhaps one of the false uses should be true or dependent on the
interdependent_update_lock state.

> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/a=
md/display/dc/core/dc.c
[]
> @@ -3470,14 +3470,9 @@ static void commit_planes_for_stream(struct dc *dc=
,
>  		/* Since phantom pipe programming is moved to post_unlock_program_fron=
t_end,
>  		 * move the SubVP lock to after the phantom pipes have been setup
>  		 */
> -		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
> -			if (dc->hwss.subvp_pipe_control_lock)
> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all=
_pipes, NULL, subvp_prev_use);
> -		} else {
> -			if (dc->hwss.subvp_pipe_control_lock)
> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all=
_pipes, NULL, subvp_prev_use);
> -		}
> -

Perhaps something like:

		if (dc->hwss.subvp_pipe_control_lock)
			dc->hwss.subvp_pipe_control_lock(dc, context,
							 should_lock_all_pipes &&
							 dc->hwss.interdependent_update_lock,
							 should_lock_all_pipes, NULL, subvp_prev_use);

> +		if (dc->hwss.subvp_pipe_control_lock)
> +			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_=
pipes,
> +							 NULL, subvp_prev_use);
>  		return;
>  	}
> =20

