Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74836DE71
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1246EC07;
	Wed, 28 Apr 2021 17:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72F86EC07
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:38:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619631511; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w1SNAwmP9ymkBodPmwQM2CGi5PEIfDQgcUqydD6PXFc=;
 b=T7BdsqzkjhQL4fRIGOxY2Q9e0SYHwcaKf1hzO+CbjWWzihLqEjkaRcStTD9IM8GO87iU3Egk
 wbBbllsHFWK4jy8ncMuvMjkxAlrY8N48eqRx7ab15izDiFNAhA9p+eZe05OqLibxOcfdAlVk
 oseLT2EOty1dtmgvzsdpy45rA6E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60899d85853c0a2c464fb86c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 17:38:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1CD73C43144; Wed, 28 Apr 2021 17:38:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 89BEFC4338A;
 Wed, 28 Apr 2021 17:38:11 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 28 Apr 2021 10:38:11 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: service only one irq_hpd if there are
 multiple irq_hpd pending
In-Reply-To: <CAE-0n53JNCc3JdONogGNArnsYLDr9E2fXZ2ODKBy7Jy3yVMr6g@mail.gmail.com>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
 <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
 <e3c3ef96ac507da6f138106f70c78ed2@codeaurora.org>
 <ddc1e372c5f864cd62c4e056ef2e6404@codeaurora.org>
 <CAE-0n53JNCc3JdONogGNArnsYLDr9E2fXZ2ODKBy7Jy3yVMr6g@mail.gmail.com>
Message-ID: <9ccdef6e1a1b47bd8d99594831f51094@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, dri-devel@lists.freedesktop.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-27 17:00, Stephen Boyd wrote:
> Quoting aravindh@codeaurora.org (2021-04-21 11:55:21)
>> On 2021-04-21 10:26, khsieh@codeaurora.org wrote:
>> >>
>> >>> +
>> >>>         mutex_unlock(&dp->event_mutex);
>> >>>
>> >>>         return 0;
>> >>> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp,
>> >>> struct drm_encoder *encoder)
>> >>>         /* stop sentinel checking */
>> >>>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> >>>
>> >>> +       /* link is down, delete pending irq_hdps */
>> >>> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
>> >>> +
>> >>
>> >> I'm becoming convinced that the whole kthread design and event queue
>> >> is
>> >> broken. These sorts of patches are working around the larger problem
>> >> that the kthread is running independently of the driver and irqs can
>> >> come in at any time but the event queue is not checked from the irq
>> >> handler to debounce the irq event. Is the event queue necessary at
>> >> all?
>> >> I wonder if it would be simpler to just use an irq thread and process
>> >> the hpd signal from there. Then we're guaranteed to not get an irq
>> >> again
>> >> until the irq thread is done processing the event. This would
>> >> naturally
>> >> debounce the irq hpd event that way.
>> > event q just like bottom half of irq handler. it turns irq into event
>> > and handle them sequentially.
>> > irq_hpd is asynchronous event from panel to bring up attention of hsot
>> > during run time of operation.
>> > Here, the dongle is unplugged and main link had teared down so that no
>> > need to service pending irq_hpd if any.
>> >
>> 
>> As Kuogee mentioned, IRQ_HPD is a message received from the panel and 
>> is
>> not like your typical HW generated IRQ. There is no guarantee that we
>> will not receive an IRQ_HPD until we are finished with processing of 
>> an
>> earlier HPD message or an IRQ_HPD message. For example - when you run
>> the protocol compliance, when we get a HPD from the sink, we are
>> expected to start reading DPCD, EDID and proceed with link training. 
>> As
>> soon as link training is finished (which is marked by a specific DPCD
>> register write), the sink is going to issue an IRQ_HPD. At this point,
>> we may not done with processing the HPD high as after link training we
>> would typically notify the user mode of the newly connected display,
>> etc.
> 
> Given that the irq comes in and is then forked off to processing at a
> later time implies that IRQ_HPD can come in at practically anytime. 
> Case
> in point, this patch, which is trying to selectively search through the
> "event queue" and then remove the event that is no longer relevant
> because the display is being turned off either by userspace or because
> HPD has gone away. If we got rid of the queue and kthread and processed
> irqs in a threaded irq handler I suspect the code would be simpler and
> not have to search through an event queue when we disable the display.
> Instead while disabling the display we would make sure that the irq
> thread isn't running anymore with synchronize_irq() or even disable the
> irq entirely, but really it would be better to just disable the irq in
> the hardware with a register write to some irq mask register.
> 
> This pushes more of the logic for HPD and connect/disconnect into the
> hardware and avoids reimplementing that in software: searching through
> the queue, checking for duplicate events, etc.

I wish we can implemented as you suggested. but it more complicate than 
that.
Let me explain below,
we have 3 transactions defined as below,

plugin transaction: irq handle do host dp ctrl initialization and link 
training. If sink_count = 0 or link train failed, then transaction 
ended. otherwise send display up uevent to frame work and wait for frame 
work thread to do mode set, start pixel clock and start video to end 
transaction.

unplugged transaction: irq handle send display off uevent to frame work 
and wait for frame work to disable pixel clock ,tear down main link and 
dp ctrl host de initialization.

irq_hpd transaction: This only happen after plugin transaction and 
before unplug transaction. irq handle read panel dpcd register and 
perform requesting action. Action including perform dp compliant 
phy/link testing.

since dongle can be plugged/unplugged at ant time, three conditions have 
to be met to avoid race condition,
1) no irq lost
2) irq happen timing order enforced at execution
3) no irq handle done in the middle transaction

for example we do not want to see
plugin --> unplug --> plugin --> unplug become plugin --> plugin--> 
unplug

The purpose of this patch is to not handle pending irq_hpd after either 
dongle or monitor had been unplugged until next plug in.




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
