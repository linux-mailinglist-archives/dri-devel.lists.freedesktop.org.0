Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0FE44B8F0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 23:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D260F6EA22;
	Tue,  9 Nov 2021 22:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1B6E8BC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 22:46:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636497967; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v9VczQnFx9xswdyxP7IiTRh0CLZMg/o04Xjcgs+tOZg=;
 b=eOlkCxCPWn5JCgkiPkxpCly3ImHXfYjlv0Bp/168CJetAmxzTdSrQs4txF1zdrhmTS8NAAlk
 Y4cZRDPH9U8yiXUn649/9rJAL9Q7wU3254FfBvtBdEfV7bMeRyr5mi7xfTjdrbuLCcjOLIWW
 7TB6qtYprjdKryvK9u87gewvtfI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 618afa2ea4b510b38fb63786 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 22:46:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5C4D9C35A2F; Tue,  9 Nov 2021 22:46:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F11E3C359EE;
 Tue,  9 Nov 2021 22:46:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Nov 2021 14:46:01 -0800
From: khsieh@codeaurora.org
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: Avoid unpowered AUX xfers that caused crashes
In-Reply-To: <20211109100403.1.I4e23470d681f7efe37e2e7f1a6466e15e9bb1d72@changeid>
References: <20211109100403.1.I4e23470d681f7efe37e2e7f1a6466e15e9bb1d72@changeid>
Message-ID: <bc63c12983fd05bfb97e9a2ce00b0bd6@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-09 10:04, Douglas Anderson wrote:
> If you happened to try to access `/dev/drm_dp_aux` devices provided by
> the MSM DP AUX driver too early at bootup you could go boom. Let's
> avoid that by only allowing AUX transfers when the controller is
> powered up.
> 
> Specifically the crash that was seen (on Chrome OS 5.4 tree with
> relevant backports):
>   Kernel panic - not syncing: Asynchronous SError Interrupt
>   CPU: 0 PID: 3131 Comm: fwupd Not tainted 5.4.144-16620-g28af11b73efb 
> #1
>   Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
>   Call trace:
>    dump_backtrace+0x0/0x14c
>    show_stack+0x20/0x2c
>    dump_stack+0xac/0x124
>    panic+0x150/0x390
>    nmi_panic+0x80/0x94
>    arm64_serror_panic+0x78/0x84
>    do_serror+0x0/0x118
>    do_serror+0xa4/0x118
>    el1_error+0xbc/0x160
>    dp_catalog_aux_write_data+0x1c/0x3c
>    dp_aux_cmd_fifo_tx+0xf0/0x1b0
>    dp_aux_transfer+0x1b0/0x2bc
>    drm_dp_dpcd_access+0x8c/0x11c
>    drm_dp_dpcd_read+0x64/0x10c
>    auxdev_read_iter+0xd4/0x1c4
> 
> I did a little bit of tracing and found that:
> * We register the AUX device very early at bootup.
> * Power isn't actually turned on for my system until
>   hpd_event_thread() -> dp_display_host_init() -> dp_power_init()
> * You can see that dp_power_init() calls dp_aux_init() which is where
>   we start allowing AUX channel requests to go through.
> 
> In general this patch is a bit of a bandaid but at least it gets us
> out of the current state where userspace acting at the wrong time can
> fully crash the system.
> * I think the more proper fix (which requires quite a bit more
>   changes) is to power stuff on while an AUX transfer is
>   happening. This is like the solution we did for ti-sn65dsi86. This
>   might be required for us to move to populating the panel via the
>   DP-AUX bus.
> * Another fix considered was to dynamically register / unregister. I
>   tried that at <https://crrev.com/c/3169431/3> but it got
>   ugly. Currently there's a bug where the pm_runtime() state isn't
>   tracked properly and that causes us to just keep registering more
>   and more.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
>  drivers/gpu/drm/msm/dp/dp_aux.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index eb40d8413bca..6d36f63c3338 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -33,6 +33,7 @@ struct dp_aux_private {
>  	bool read;
>  	bool no_send_addr;
>  	bool no_send_stop;
> +	bool initted;
>  	u32 offset;
>  	u32 segment;
> 
> @@ -331,6 +332,10 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
>  	}
> 
>  	mutex_lock(&aux->mutex);
> +	if (!aux->initted) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> 
>  	dp_aux_update_offset_and_segment(aux, msg);
>  	dp_aux_transfer_helper(aux, msg, true);
> @@ -380,6 +385,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
>  	}
> 
>  	aux->cmd_busy = false;
> +
> +exit:
>  	mutex_unlock(&aux->mutex);
> 
>  	return ret;
> @@ -431,8 +438,13 @@ void dp_aux_init(struct drm_dp_aux *dp_aux)
> 
>  	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
> +	mutex_lock(&aux->mutex);
> +
>  	dp_catalog_aux_enable(aux->catalog, true);
>  	aux->retry_cnt = 0;
> +	aux->initted = true;
> +
> +	mutex_unlock(&aux->mutex);
>  }
> 
>  void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> @@ -441,7 +453,12 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> 
>  	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
> +	mutex_lock(&aux->mutex);
> +
> +	aux->initted = false;
>  	dp_catalog_aux_enable(aux->catalog, false);
> +
> +	mutex_unlock(&aux->mutex);
>  }
> 
>  int dp_aux_register(struct drm_dp_aux *dp_aux)
