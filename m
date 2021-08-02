Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199A3DDD43
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 18:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A55B6E255;
	Mon,  2 Aug 2021 16:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA3E6E110
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 16:10:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627920638; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RcmCVefjMH6l9oNkIcTgBxKj15suM9Nyc7u4Bfq5P6s=;
 b=QBr6xI8zbdOCwtPX59Sj4i1WL596euM8+eO5cMqqX/V/acF0NAKXsN/MLm1FpIKIaWVMVjA7
 ZcdVDZNhLvbHhSyFGl+WjSDw+Qy4+WNotogGmCDFcO5sP1F4FiIEa4AI5Y4cIv/PsONMPgbg
 P10Pc2MDEK0BLUOYFXIQAdZgugk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 610818e1290ea35ee610911c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 16:10:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E37DC4338A; Mon,  2 Aug 2021 16:10:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 436C1C433D3;
 Mon,  2 Aug 2021 16:10:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 09:10:06 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: update is_connected status base on sink count
 at dp_pm_resume()
In-Reply-To: <CAE-0n51cNywB2ThQxqS4iX-d7wR+rYXt8P33o9cUq9J6tT915A@mail.gmail.com>
References: <1627507854-16733-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51cNywB2ThQxqS4iX-d7wR+rYXt8P33o9cUq9J6tT915A@mail.gmail.com>
Message-ID: <781ad3c4973b3f8dd83933a451b266b9@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-30 11:57, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-28 14:30:54)
>> Currently at dp_pm_resume() is_connected state is decided base on hpd 
>> connection
>> status only. This will put is_connected in wrongly "true" state at the 
>> scenario
>> that dongle attached to DUT but without hmdi cable connecting to it. 
>> Fix this
>> problem by adding read sink count from dongle and decided is_connected 
>> state base
>> on both sink count and hpd connection status.
>> 
> 
> Please add a Fixes tag.
> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 2b660e9..9bcb261 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1308,6 +1308,17 @@ static int dp_display_remove(struct 
>> platform_device *pdev)
>>         return 0;
>>  }
>> 
>> +static int dp_get_sink_count(struct dp_display_private *dp)
>> +{
>> +       u8 sink_count;
>> +
>> +       sink_count = drm_dp_read_sink_count(dp->aux);
> 
> drm_dp_read_sink_count() returns an int, not a u8. Comparing a u8 to
> less than zero doesn't make any sense as it isn't signed.
> 
>> +       if (sink_count < 0)
>> +               return 0;
>> +
>> +       return sink_count;
>> +}
> 
> We can drop this function and just have an int count in dp_pm_resume()
> that is compared to < 0 and then ignored.
> 
>> +
>>  static int dp_pm_resume(struct device *dev)
>>  {
>>         struct platform_device *pdev = to_platform_device(dev);
>> @@ -1327,14 +1338,22 @@ static int dp_pm_resume(struct device *dev)
>> 
>>         dp_catalog_ctrl_hpd_config(dp->catalog);
>> 
>> -       status = dp_catalog_link_is_connected(dp->catalog);
>> +       /*
>> +        * set sink to normal operation mode -- D0
>> +        * before dpcd read
>> +        */
>> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> 
>> +       if ((status = dp_catalog_link_is_connected(dp->catalog)))
>> +               dp->link->sink_count = dp_get_sink_count(dp);
> 
> Do we need to call drm_dp_read_sink_count_cap() as well?
no, we only need sink_count
> 
>> +       else
>> +               dp->link->sink_count = 0;
>>         /*
>>          * can not declared display is connected unless
>>          * HDMI cable is plugged in and sink_count of
>>          * dongle become 1
>>          */
>> -       if (status && dp->link->sink_count)
> 
> Is 'status' used anymore? If not, please remove it.
Yes, it still used which used to decided to perform dpcd read sink count 
or not
> 
>> +       if (dp->link->sink_count)
>>                 dp->dp_display.is_connected = true;
>>         else
>>                 dp->dp_display.is_connected = false;
