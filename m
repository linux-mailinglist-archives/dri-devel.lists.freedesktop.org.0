Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57E2FD44A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 16:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887036E090;
	Wed, 20 Jan 2021 15:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC3946E090
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 15:44:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86265101E;
 Wed, 20 Jan 2021 07:44:46 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2A783F68F;
 Wed, 20 Jan 2021 07:44:45 -0800 (PST)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/komeda: Fix bit check to import to value of proper
 type
To: carsten.haitzler@foss.arm.com, dri-devel@lists.freedesktop.org
References: <20210118142013.277404-1-carsten.haitzler@foss.arm.com>
Message-ID: <400e2a79-aae6-33d7-4587-21e3c96ccf04@arm.com>
Date: Wed, 20 Jan 2021 15:44:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118142013.277404-1-carsten.haitzler@foss.arm.com>
Content-Language: en-GB
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
Cc: liviu.dudau@arm.com, Carsten Haitzler <carsten.haitzler@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2021 14:20, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> Another issue found by KASAN. The bit finding is bueried inside the

NIT: s/bueried/buried/

> dp_for_each_set_bit() macro (that passes on to for_each_set_bit() that
> calls the bit stuff. These bit functions want an unsigned long pointer
> as input and just dumbly casting leads to out-of-bounds accesses.
> This fixes that.

This seems like an underlying bug/lack of clear documentation for the
underlying find_*_bit() functions. dp_for_each_set_bit() tries to do the
right thing:

   #define dp_for_each_set_bit(bit, mask) \
   	for_each_set_bit((bit), ((unsigned long *)&(mask)), sizeof(mask) * 8)

i.e. passing the actual size of type. However because of the case to
unsigned long (and subsequent accesses using that type) the compiler is
free to make accesses beyond the size of the variable (and indeed this
is completely broken on big-endian). The implementation actually
requires that the bitmap is really an array of unsigned long - no other
type will work.

So I think the fix should also include fixing the dp_for_each_set_bit()
macro - the cast is bogus as it stands.

Doing that I also get warnings on komeda_pipeline::avail_comps and
komeda_pipeline::supported_inputs - although I note there are other
bitmasks mentioned.

The other option is to fix dp_for_each_set_bit() itself using a little hack:

-       for_each_set_bit((bit), ((unsigned long *)&(mask)), sizeof(mask) * 8)
+       for_each_set_bit((bit), (&((unsigned long){mask})), sizeof(mask) * 8)

With that I don't think you need any other change as the mask is actually
in a new unsigned long on the stack.

Steve

> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>   .../drm/arm/display/komeda/komeda_pipeline_state.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> index e8b1e15312d8..f7dddb9f015d 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> @@ -1232,7 +1232,8 @@ komeda_pipeline_unbound_components(struct komeda_pipeline *pipe,
>   	struct komeda_pipeline_state *old = priv_to_pipe_st(pipe->obj.state);
>   	struct komeda_component_state *c_st;
>   	struct komeda_component *c;
> -	u32 disabling_comps, id;
> +	u32 id;
> +	unsigned long disabling_comps;
>   
>   	WARN_ON(!old);
>   
> @@ -1262,7 +1263,6 @@ int komeda_release_unclaimed_resources(struct komeda_pipeline *pipe,
>   		st = komeda_pipeline_get_new_state(pipe, drm_st);
>   	else
>   		st = komeda_pipeline_get_state_and_set_crtc(pipe, drm_st, NULL);
> -

NIT: Random white space change

>   	if (WARN_ON(IS_ERR_OR_NULL(st)))
>   		return -EINVAL;
>   
> @@ -1287,7 +1287,8 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
>   	struct komeda_pipeline_state *old;
>   	struct komeda_component *c;
>   	struct komeda_component_state *c_st;
> -	u32 id, disabling_comps = 0;
> +	u32 id;
> +	unsigned long disabling_comps;
>   
>   	old = komeda_pipeline_get_old_state(pipe, old_state);
>   
> @@ -1297,7 +1298,7 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
>   		disabling_comps = old->active_comps &
>   				  pipe->standalone_disabled_comps;
>   
> -	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%x.\n",
> +	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%lx.\n",
>   			 pipe->id, old->active_comps, disabling_comps);
>   
>   	dp_for_each_set_bit(id, disabling_comps) {
> @@ -1331,13 +1332,14 @@ void komeda_pipeline_update(struct komeda_pipeline *pipe,
>   	struct komeda_pipeline_state *new = priv_to_pipe_st(pipe->obj.state);
>   	struct komeda_pipeline_state *old;
>   	struct komeda_component *c;
> -	u32 id, changed_comps = 0;
> +	u32 id;
> +	unsigned long changed_comps;
>   
>   	old = komeda_pipeline_get_old_state(pipe, old_state);
>   
>   	changed_comps = new->active_comps | old->active_comps;
>   
> -	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, changed: 0x%x.\n",
> +	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, changed: 0x%lx.\n",
>   			 pipe->id, new->active_comps, changed_comps);
>   
>   	dp_for_each_set_bit(id, changed_comps) {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
