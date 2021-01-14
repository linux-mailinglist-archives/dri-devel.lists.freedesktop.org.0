Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177B2F74BC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53EB6E21D;
	Fri, 15 Jan 2021 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF22F6E027
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 17:13:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610644410; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qnsx3daK0QJOaPx77SAmwXpHyqM3YCWxidh/gbfT0KI=;
 b=oz/8Ne7jl4WbNNPeMFbpOoVYZjkWfgpl+fvTapDxXloxqHIsknNl77zMHPLAVa+/4Hzw82Mi
 /95NPUoc/owpHY6QwGHzADcQKT6mz51bIERWatc5rYW7wTHNiFfEGTc7dgff7x0cXgHGGh0g
 NQVPjbcUmhO6entb7dg+J0Gzipc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 60007bba8fb3cda82f981737 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 17:13:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 486ECC43466; Thu, 14 Jan 2021 17:13:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 50867C433CA;
 Thu, 14 Jan 2021 17:13:28 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 14 Jan 2021 09:13:28 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
In-Reply-To: <161058243505.3661239.4173340912311093207@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
 <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
 <b4a6e7695d12c3191bff75668f386da9@codeaurora.org>
 <161058243505.3661239.4173340912311093207@swboyd.mtv.corp.google.com>
Message-ID: <7093b80b9304d161259f5f3f4b12d3c1@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-13 16:00, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-01-13 15:44:32)
>> On 2021-01-13 12:22, Stephen Boyd wrote:
>> > Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
>> >> On 2021-01-11 11:55, Stephen Boyd wrote:
>> >> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
>> >> >> irq_hpd event can only be executed at connected state. Therefore
>> >> >> irq_hpd event should be postponed if it happened at connection
>> >> >> pending state. This patch also make sure both link rate and lane
>> >> >
>> >> > Why does it happen at connection pending state?
>> >> plug in need two state to complete it.
>> >> advance to connection pending state once link training completed and
>> >> sent uevent notification to frame work.
>> >> transition to connected state after frame work provided resolution
>> >> timing and start transmit video panel.
>> >> Therefore irq_hpd should not be handled if it occurred before
>> >> connected
>> >> state.
>> >
>> > Sure that's what's going on in the patch but you didn't answer my
>> > question. Why does irq_hpd happen before connected state?
>> 
>> I have no idea why it happen this way.
>> during debug
>> https://partnerissuetracker.corp.google.com/issues/170598152
>> I saw two different scenario
>> 1) irq_hpd followed by unplug with less than 20 ms in between. this 
>> one
>> fixed by this patch set.
>> 2) plug followed by irq_hpd around 300ms in between. it does not cause
>> problem. but it should be handled in order (after connected state).
> 
> Ok. So nobody understands why the hardware is acting this way and we're
> papering over the problem by forcing the HPD state to be what we think
> it should be? That's not great.

irq_hpd is issued from dongle.
it then go through EC ps8805 driver and reach DP driver finally.
Again, to duplicate problem #1 this at my set up, i have to 
intentionally wiggling type-c connector of dongle.
But I can not duplicate problem #2 and only saw it one time from Quantan 
provide logs.






_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
