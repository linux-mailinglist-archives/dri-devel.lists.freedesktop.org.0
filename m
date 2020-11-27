Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453092C68F7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 16:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323516EE45;
	Fri, 27 Nov 2020 15:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0325C6EE45
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 15:52:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA4D31516;
 Fri, 27 Nov 2020 07:52:02 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 173CB3F71F;
 Fri, 27 Nov 2020 07:52:01 -0800 (PST)
Subject: Re: [PATCH] drm/komeda: Handle NULL pointer access code path in error
 case
To: carsten.haitzler@foss.arm.com, dri-devel@lists.freedesktop.org
References: <20201127110054.133686-1-carsten.haitzler@foss.arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <d815594f-e6b6-92bf-e674-73d90a447ad9@arm.com>
Date: Fri, 27 Nov 2020 15:52:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127110054.133686-1-carsten.haitzler@foss.arm.com>
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

On 27/11/2020 11:00, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> komeda_component_get_old_state() technically can return a NULL
> pointer. komeda_compiz_set_input() even warns when this happens, but
> then proceeeds to use that NULL pointer tocompare memory content there
> agains the new sate to see if it changed. In this case, it's better to
> assume that the input changed as there is no old state to compare
> against and thus assume the changes happen anyway.
> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> index 8f32ae7c25d0..e8b1e15312d8 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> @@ -707,7 +707,8 @@ komeda_compiz_set_input(struct komeda_compiz *compiz,
>   	WARN_ON(!old_st);
>   
>   	/* compare with old to check if this input has been changed */
> -	if (memcmp(&(to_compiz_st(old_st)->cins[idx]), cin, sizeof(*cin)))
> +	if (!old_st ||
> +	    memcmp(&(to_compiz_st(old_st)->cins[idx]), cin, sizeof(*cin)))
>   		c_st->changed_active_inputs |= BIT(idx);

Even better, you can move the WARN_ON into the if:

	if (WARN_ON(!old_st) || ...

Either way:

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

>   
>   	komeda_component_add_input(c_st, &dflow->input, idx);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
