Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3A39BCA0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 18:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA276E125;
	Fri,  4 Jun 2021 16:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91726E125
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 16:10:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622823056; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7OrD0eroTm8+Xh/p6MsHyA4aVI8DyLGbpiIhRk9+tQI=;
 b=Khj5HFqnEZGMHGrX5YKgARpFuweBT0h4DulJEuYy1+MU41cHBvlXcFTHx87X/ONyIj6UnpUJ
 NQyvAbqPNP4IMqGHrjRtveyxYwABQVl4v1v+gGFJcM0GbeNcDjI6wYY6E4+OQSI+xt1kIRWf
 PdH6pmH3a+Xy8nrW97CfJDou/5E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60ba5076e27c0cc77f3b9d59 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 16:10:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 971DAC43146; Fri,  4 Jun 2021 16:10:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC24EC433F1;
 Fri,  4 Jun 2021 16:10:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 04 Jun 2021 21:40:28 +0530
From: rajeevny@codeaurora.org
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 07/11] drm/panel: panel-simple: Stash DP AUX bus; allow
 using it for DDC
In-Reply-To: <20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
Message-ID: <6e0cd667a8a776e524b42f1535827208@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

>  	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>  	if (!panel->no_hpd) {
> @@ -708,6 +712,8 @@ static int panel_simple_probe(struct device *dev,
> const struct panel_desc *desc)
> 
>  		if (!panel->ddc)
>  			return -EPROBE_DEFER;
> +	} else if (aux) {
> +		panel->ddc = &aux->ddc;
>  	}

In panel_simple_probe(), the put_device(&panel->ddc->dev) call is 
causing issue when the aux->ddc is used to assign panel->ddc
It works well when "ddc-i2c-bus" is used to assign panel->ddc

static int panel_simple_probe(...)
{
...

free_ddc:
         if (panel->ddc)
                 put_device(&panel->ddc->dev);

         return err;
}

== Log start ==

[    2.393970] ------------[ cut here ]------------
[    2.398747] kobject: '(null)' ((____ptrval____)): is not initialized, 
yet kobject_put() is being called.
[    2.408554] WARNING: CPU: 7 PID: 7 at lib/kobject.c:752 
kobject_put+0x38/0xe0
...
...
[    2.528574] Call trace:
[    2.531092]  kobject_put+0x38/0xe0
[    2.534594]  put_device+0x20/0x2c
[    2.538002]  panel_simple_probe+0x4bc/0x550
[    2.542300]  panel_simple_dp_aux_ep_probe+0x44/0x5c
[    2.547305]  dp_aux_ep_probe+0x58/0x80

== Log end ==


Sincerely,
Rajeev
