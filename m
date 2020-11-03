Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E02A5F62
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3626E959;
	Wed,  4 Nov 2020 08:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645446ECDA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 17:03:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604422992; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FOhbWz4gRfs3rCg5R5uOtLqn0IGJgDb4wNO+hqzeXBk=;
 b=XoIhEkqYKp+gqen+756M/izxQX/vJlOzp2rXOJg1Dbg3poCJGGKrMEpn2FzAjWI9QlqPNLlG
 SWXR2F+NACI5zdSicSKDl8kCFnzGYP4hAfg+cemXCIU4epX4UNaiEb7iCxXiwxRxxRl1AkwB
 JtnBykV0FqO+Y4dJoiALM/63x5A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fa18d2e41e7c4fae75ebbb0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 17:02:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 070AAC43385; Tue,  3 Nov 2020 17:02:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 079D6C433C8;
 Tue,  3 Nov 2020 17:02:35 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 09:02:35 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: promote irq_hpd handle to handle link
 trainign correctly
In-Reply-To: <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
References: <20201030232324.11170-1-khsieh@codeaurora.org>
 <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
Message-ID: <2e63aa17a3b81f452b972160365b1f64@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: freedreno@lists.freedesktop.org, rnayak@codeaurora.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-02 11:29, Stephen Boyd wrote:
> Subject has a typo in "training".
> 
> Quoting Kuogee Hsieh (2020-10-30 16:23:24)
>> Some dongles, such as Apple, required link training done at irq_hpd
> 
> s/required/require/
> 
>> request instead of plugin request. This patch promote irq_hpd hanlder
> 
> s/hanlder/handler/
> 
>> to handle link training and setup hpd_state correctly.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Any Fixes tag?
> 
>>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 13b66266cd69..55627530957c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -483,10 +485,24 @@ static int dp_display_usbpd_attention_cb(struct 
>> device *dev)
>>                 return -ENODEV;
>>         }
>> 
>> +       hpd = dp->usbpd;
>> +
>>         /* check for any test request issued by sink */
>>         rc = dp_link_process_request(dp->link);
>> -       if (!rc)
>> -               dp_display_handle_irq_hpd(dp);
>> +       if (!rc) {
>> +               sink_request = dp->link->sink_request;
>> +               if (sink_request & DS_PORT_STATUS_CHANGED) {
>> +                       dp->hpd_state = ST_CONNECT_PENDING;
>> +                       hpd->hpd_high = 1;
>> +               }
>> +
>> +               rc = dp_display_handle_irq_hpd(dp);
>> +
>> +               if (rc && sink_request & DS_PORT_STATUS_CHANGED) {
> 
> Can you add parenthesis around this?
> 
> 		if (rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
> 
> 
> I honestly don't know what's going on in this patch. It talks about
> making link training happen during irq hpd handler but this is the
> attention handler and we're checking port status changed? This is
> related? The code is really not clear.
irq_hpd request is generated by sinker to ask host attention that 
something has changed.
POST_STATUS_CHNAGED bit set  by sinker to indicated link had loss of 
sync. Therefore
host need to restart link retaining to fix the link loss of sync 
problem.

> 
>> +                       hpd->hpd_high = 0;
>> +                       dp->hpd_state = ST_DISCONNECTED;
>> +               }
>> +       }
>> 
>>         return rc;
>>  }
>> 
>> base-commit: 0e162b10644605428cd2596c12f8ed410cf9d2d9
> 
> What commit is this?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
