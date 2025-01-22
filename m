Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173DA190B1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 12:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587C10E6C9;
	Wed, 22 Jan 2025 11:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jan 2025 11:35:09 UTC
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD85C10E6CB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 11:35:09 +0000 (UTC)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
 by smtp.dudau.co.uk (Postfix) with SMTP id B87A241E2245;
 Wed, 22 Jan 2025 11:28:54 +0000 (GMT)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation);
 Wed, 22 Jan 2025 11:28:54 +0000
Date: Wed, 22 Jan 2025 11:28:54 +0000
From: Liviu Dudau <liviu@dudau.co.uk>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, james.qian.wang@arm.com, ayan.halder@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/komeda: Add check for
 komeda_get_layer_fourcc_list()
Message-ID: <Z5DWdtxrYjfIt+/F@bart.dudau.co.uk>
References: <20241219090256.146424-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219090256.146424-1-haoxiang_li2024@163.com>
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

Hi Haoxiang,

For reasons that I have not uncovered yet, the work email servers never
delivered your message, I have discovered it today accidentally while
looking in a backup I have at home.

On Thu, Dec 19, 2024 at 05:02:56PM +0800, Haoxiang Li wrote:
> Add check for the return value of komeda_get_layer_fourcc_list()
> to catch the potential exception.
> 
> Fixes: 5d51f6c0da1b ("drm/komeda: Add writeback support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index ebccb74306a7..f30b3d5eeca5 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -160,6 +160,10 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>  					       kwb_conn->wb_layer->layer_type,
>  					       &n_formats);
> +	if (!formats) {
> +		kfree(kwb_conn);
> +		return -ENOMEM;
> +	}
>  
>  	err = drm_writeback_connector_init(&kms->base, wb_conn,
>  					   &komeda_wb_connector_funcs,
> -- 
> 2.25.1
> 

-- 
Everyone who uses computers frequently has had, from time to time,
a mad desire to attack the precocious abacus with an axe.
       	   	      	     	  -- John D. Clark, Ignition!
