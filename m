Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B72F5D89
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0326E6E17F;
	Thu, 14 Jan 2021 09:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CAB6ECAD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 23:44:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610581479; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8vGGmTsigGzkFUAuddb3DTMDXkW08K6re37CVJR/miI=;
 b=c2V/YchwwzWmkNdRZPhh+F0dMkMmrgjSc03XOQivjw/bKrt6puoR1YJMRp0mRsfvTjrOHqmd
 D/Yl18gkksowyvSgf72Adj8UB3nvuwFGbWgFRuErFbeBr7PRXQepBTfHLLZv/A70KsLqezyk
 FvHQvAB5o+nMWXA/ImCAfwfvqKE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fff85e28fb3cda82f07e8da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 23:44:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 00C0DC43465; Wed, 13 Jan 2021 23:44:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A44AC433C6;
 Wed, 13 Jan 2021 23:44:32 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 13 Jan 2021 15:44:32 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
In-Reply-To: <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
 <17a116011ae60194834210a4a0c877b3@codeaurora.org>
 <161056933099.3661239.9450322359293035316@swboyd.mtv.corp.google.com>
Message-ID: <b4a6e7695d12c3191bff75668f386da9@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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

On 2021-01-13 12:22, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-01-13 09:44:24)
>> On 2021-01-11 11:55, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-01-07 12:30:24)
>> >> irq_hpd event can only be executed at connected state. Therefore
>> >> irq_hpd event should be postponed if it happened at connection
>> >> pending state. This patch also make sure both link rate and lane
>> >
>> > Why does it happen at connection pending state?
>> plug in need two state to complete it.
>> advance to connection pending state once link training completed and
>> sent uevent notification to frame work.
>> transition to connected state after frame work provided resolution
>> timing and start transmit video panel.
>> Therefore irq_hpd should not be handled if it occurred before 
>> connected
>> state.
> 
> Sure that's what's going on in the patch but you didn't answer my
> question. Why does irq_hpd happen before connected state?

I have no idea why it happen this way.
during debug 
https://partnerissuetracker.corp.google.com/issues/170598152
I saw two different scenario
1) irq_hpd followed by unplug with less than 20 ms in between. this one 
fixed by this patch set.
2) plug followed by irq_hpd around 300ms in between. it does not cause 
problem. but it should be handled in order (after connected state).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
