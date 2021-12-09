Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B325A46EE2E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3032610E5CE;
	Thu,  9 Dec 2021 16:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C54489ABE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:01:20 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n66so7278862oia.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 22:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4RvTOElFtjC6K+YtTFs0DQWYPsT5j+ievJDMuHacLoY=;
 b=gTDcbQcQviVXwGHqelMkl3tznVzOOD5dAldIOXwUNq+Wb1juxj6sy9VNnuyEWs/YxX
 tz3IyuWVcGMGCogH+EVFDY1oAMYdGobKJ8y3qO7McBYMVIakK40oIYrJP0Nf36vN1PVC
 r6kBOj5+1or6IhEa/Gd8Z9Anz82J5FcBxWq9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4RvTOElFtjC6K+YtTFs0DQWYPsT5j+ievJDMuHacLoY=;
 b=p01o3ALPe4LMPZ8xIgfwZr7G7nn0RozYnroTePWtg5nmGTTBrohmyTlJDikSQwxpi4
 RVJJeuIPQ+B+DlJH+S2g5rjccosMmt9iNf4DrIe50EhpjdNsAW9fSQ9fTfjMdshRgIZ3
 fBurHFs2/sm1QkrRe18wjGn1G3E8l9TkvhofHlUgyZ23FOni6mQrVj4njSMEV5OrnGWA
 vJpC2zDY0vdV3JS+EhFmLsMy4XkcWOxWNH/1+1ba9BhUb9ZI+L1W7AhD3LAaTCIzdGQi
 oG7OAVJixo3uaTl51IUpDdqhk8ZS2MQzLnvNft0hw5wSK0yAjVWmRv8YqkKvgGmbUBiS
 hC4Q==
X-Gm-Message-State: AOAM532zw0EPJ29xgFN7gVMRZFJN4mqpLcA/6F+605z4Bzozse62CeG/
 MS4hZtOK9eIbWzDWDjh4WXd7gfRFQ6IFGyut/MFCzp+Nujs=
X-Google-Smtp-Source: ABdhPJw8baMKy/6HPjiu44S1WLMWj6mF5r6iglZK7qkpnBQ5pEqKEVCpHcUPy2GTKqgvmEhssF1HWgZQSw1p/Flt/rI=
X-Received: by 2002:aca:2319:: with SMTP id e25mr3730698oie.164.1639020663186; 
 Wed, 08 Dec 2021 19:31:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Dec 2021 19:31:02 -0800
MIME-Version: 1.0
In-Reply-To: <20211105030434.2828845-15-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
 <20211105030434.2828845-15-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Dec 2021 19:31:02 -0800
Message-ID: <CAE-0n511nL2iwNztf=4900sYa-+W8V09c6G5uN=fo+Lr1Ws3HA@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sean Paul (2021-11-04 20:04:31)
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds HDCP 1.x support to msm DP connectors using the new HDCP

 $ git grep "This patch" -- Documentation/process/

> helpers.
>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-15-sean@poorly.run #v3
>
> Changes in v2:
> -Squash [1] into this patch with the following changes (Stephen)
>   -Update the sc7180 dtsi file
>   -Remove resource names and just use index (Stephen)
> Changes in v3:
> -Split out the dtsi change from v2 (Stephen)
> -Fix set-but-unused warning identified by 0-day
> -Fix up a couple of style nits (Stephen)
> -Store HDCP key directly in dp_hdcp struct (Stephen)
> -Remove wmb in HDCP key initialization, move an_seed (Stephen)
> -Use FIELD_PREP for bstatus/bcaps (Stephen)
> -#define read_poll_timeout values (Stephen)
> -Remove unnecessary parentheses in dp_hdcp_store_ksv_fifo (Stephen)
> -Add compatible string for hdcp (Stephen)
> -Rename dp_hdcp_write_* functions (Abhinav)
> -Add 1us delay between An reads (Abhinav)
> -Delete unused dp_hdcp_read_* functions
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
>
> [1] https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-14-sean@poorly.run

Looks mostly ok to me. One nit below but otherwise you can have my

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index da4323556ef3..c16fce17d096 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -198,6 +201,35 @@ static int dp_test_active_open(struct inode *inode,
>                         inode->i_private);
>  }
>
> +static ssize_t dp_hdcp_key_write(struct file *file, const char __user *ubuf,
> +                                size_t len, loff_t *offp)

I deem this API through debugfs no good, but I can see that opening the
can of worms that is programming the key other ways is worse, so alright.

> +{
> +       char *input_buffer;
> +       int ret;
> +       struct dp_debug_private *debug = file->private_data;
> +
> +       if (len != (DRM_HDCP_KSV_LEN + DP_HDCP_NUM_KEYS * DP_HDCP_KEY_LEN))
> +               return -EINVAL;
> +
[....]
> diff --git a/drivers/gpu/drm/msm/dp/dp_hdcp.c b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> new file mode 100644
> index 000000000000..03ea3a974576
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_hdcp.c
> @@ -0,0 +1,462 @@
[...]
> +
> +int dp_hdcp_attach(struct dp_hdcp *hdcp, struct drm_connector *connector)
> +{
> +       struct drm_device *dev = connector->dev;
> +       struct drm_hdcp_helper_data *helper_data;
> +       int ret;
> +
> +       /* HDCP is not configured for this device */
> +       if (!hdcp->parser->io.dp_controller.hdcp_key.base)
> +               return 0;
> +
> +       helper_data = drm_hdcp_helper_initialize_dp(connector, hdcp->aux,
> +                                                   &dp_hdcp_funcs, false);
> +       if (IS_ERR_OR_NULL(helper_data))

Just IS_ERR()?

> +               return PTR_ERR(helper_data);

Because PTR_ERR() on NULL is zero. Maybe return PTR_ERR_OR_ZERO() is
supposed to be here? Or I don't understand why
drm_hdcp_helper_initialize_dp() would return NULL.

> +
> +       ret = drm_connector_attach_content_protection_property(connector, false);
> +       if (ret) {
> +               drm_hdcp_helper_destroy(helper_data);
> +               drm_err(dev, "Failed to attach content protection prop %d\n", ret);
> +               return ret;
> +       }
