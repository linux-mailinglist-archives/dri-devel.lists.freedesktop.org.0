Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EAE38F16B
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 18:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926786E8C8;
	Mon, 24 May 2021 16:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA236E8C8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 16:22:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621873372; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4vyHAaYb4l1Q6HXO7hiHj8To6HZLipzt3FsV5THr0SE=;
 b=V54KzOGNkzPujqHs7hHgDGe67HrVvwRAgWIsLhojJnSTspfr7mBHGCsrxYzPBEDNRE7UKKSP
 NVEVBpo/LmSs808KBsf5M24aIv7Q8lJQSvzCRp5qDgSbrqN4iQmclbwxat1O79iO5Taq1fdq
 60UnzFTyizyGjM8LdhIhtdXz+3c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60abd2d567d156359a563745 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 16:22:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84239C43460; Mon, 24 May 2021 16:22:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E288AC43149;
 Mon, 24 May 2021 16:22:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 24 May 2021 09:22:43 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] drm/msm/dp: Shrink locking area of dp_aux_transfer()
In-Reply-To: <20210507212505.1224111-3-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-3-swboyd@chromium.org>
Message-ID: <d941f60adcac1cd7a55e1be252e890ae@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-07 14:25, Stephen Boyd wrote:
> We don't need to hold the lock to inspect the message we're going to
> transfer, and we don't need to clear the busy flag either. Take the 
> lock
> later and bail out earlier if conditions aren't met.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 91188466cece..b49810396513 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -329,30 +329,29 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
>  	ssize_t ret;
>  	int const aux_cmd_native_max = 16;
>  	int const aux_cmd_i2c_max = 128;
> -	struct dp_aux_private *aux = container_of(dp_aux,
> -		struct dp_aux_private, dp_aux);
> +	struct dp_aux_private *aux;
> 
> -	mutex_lock(&aux->mutex);
> +	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
>  	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & 
> DP_AUX_NATIVE_READ);
> 
>  	/* Ignore address only message */
> -	if ((msg->size == 0) || (msg->buffer == NULL)) {
> +	if (msg->size == 0 || !msg->buffer) {
>  		msg->reply = aux->native ?
>  			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
> -		ret = msg->size;
> -		goto unlock_exit;
> +		return msg->size;
>  	}
> 
>  	/* msg sanity check */
> -	if ((aux->native && (msg->size > aux_cmd_native_max)) ||
> -		(msg->size > aux_cmd_i2c_max)) {
> +	if ((aux->native && msg->size > aux_cmd_native_max) ||
> +	    msg->size > aux_cmd_i2c_max) {
>  		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
>  			__func__, msg->size, msg->request);
> -		ret = -EINVAL;
> -		goto unlock_exit;
> +		return -EINVAL;
>  	}
> 
> +	mutex_lock(&aux->mutex);
> +
>  	dp_aux_update_offset_and_segment(aux, msg);
>  	dp_aux_transfer_helper(aux, msg, true);
