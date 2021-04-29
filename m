Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65436EECC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEFB6F408;
	Thu, 29 Apr 2021 17:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B7D6F408
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:23:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619717015; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pvXdzkVfz5fgSIWOb+hqM4GsllkPEXOcoxireDKOK6U=;
 b=isvYQ7t8xO3pIvkLAfm6AlQmGFMC4FWXh6LNJrY1dDlcJ5YRfH5GZtJVZ6kDp04dC/TveZNZ
 QI20BcYD70WBQR1870LOcH/928lGEuO2ln6tmF+mecEtWs2Ui8cfXBtkNm4e8ROqfFqAGM9g
 2TH+fnPlFgFaJDJvpM0VwOOaCtA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 608aeb95febcffa80f95c3db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 17:23:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0A2B3C433F1; Thu, 29 Apr 2021 17:23:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5808FC433D3;
 Thu, 29 Apr 2021 17:23:31 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 10:23:31 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: service only one irq_hpd if there are
 multiple irq_hpd pending
In-Reply-To: <CAE-0n533ZCaQkP7+XN+Ee9CG-r7vJD7LHG7_H8v7sVpimmQabg@mail.gmail.com>
References: <1618604877-28297-1-git-send-email-khsieh@codeaurora.org>
 <161895606268.46595.2841353121480638642@swboyd.mtv.corp.google.com>
 <e3c3ef96ac507da6f138106f70c78ed2@codeaurora.org>
 <ddc1e372c5f864cd62c4e056ef2e6404@codeaurora.org>
 <CAE-0n53JNCc3JdONogGNArnsYLDr9E2fXZ2ODKBy7Jy3yVMr6g@mail.gmail.com>
 <9ccdef6e1a1b47bd8d99594831f51094@codeaurora.org>
 <CAE-0n533ZCaQkP7+XN+Ee9CG-r7vJD7LHG7_H8v7sVpimmQabg@mail.gmail.com>
Message-ID: <d88cd3e0af511ed60c12ce616ce22415@codeaurora.org>
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

On 2021-04-29 02:26, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-04-28 10:38:11)
>> On 2021-04-27 17:00, Stephen Boyd wrote:
>> > Quoting aravindh@codeaurora.org (2021-04-21 11:55:21)
>> >> On 2021-04-21 10:26, khsieh@codeaurora.org wrote:
>> >> >>
>> >> >>> +
>> >> >>>         mutex_unlock(&dp->event_mutex);
>> >> >>>
>> >> >>>         return 0;
>> >> >>> @@ -1496,6 +1502,9 @@ int msm_dp_display_disable(struct msm_dp *dp,
>> >> >>> struct drm_encoder *encoder)
>> >> >>>         /* stop sentinel checking */
>> >> >>>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> >> >>>
>> >> >>> +       /* link is down, delete pending irq_hdps */
>> >> >>> +       dp_del_event(dp_display, EV_IRQ_HPD_INT);
>> >> >>> +
>> >> >>
>> >> >> I'm becoming convinced that the whole kthread design and event queue
>> >> >> is
>> >> >> broken. These sorts of patches are working around the larger problem
>> >> >> that the kthread is running independently of the driver and irqs can
>> >> >> come in at any time but the event queue is not checked from the irq
>> >> >> handler to debounce the irq event. Is the event queue necessary at
>> >> >> all?
>> >> >> I wonder if it would be simpler to just use an irq thread and process
>> >> >> the hpd signal from there. Then we're guaranteed to not get an irq
>> >> >> again
>> >> >> until the irq thread is done processing the event. This would
>> >> >> naturally
>> >> >> debounce the irq hpd event that way.
>> >> > event q just like bottom half of irq handler. it turns irq into event
>> >> > and handle them sequentially.
>> >> > irq_hpd is asynchronous event from panel to bring up attention of hsot
>> >> > during run time of operation.
>> >> > Here, the dongle is unplugged and main link had teared down so that no
>> >> > need to service pending irq_hpd if any.
>> >> >
>> >>
>> >> As Kuogee mentioned, IRQ_HPD is a message received from the panel and
>> >> is
>> >> not like your typical HW generated IRQ. There is no guarantee that we
>> >> will not receive an IRQ_HPD until we are finished with processing of
>> >> an
>> >> earlier HPD message or an IRQ_HPD message. For example - when you run
>> >> the protocol compliance, when we get a HPD from the sink, we are
>> >> expected to start reading DPCD, EDID and proceed with link training.
>> >> As
>> >> soon as link training is finished (which is marked by a specific DPCD
>> >> register write), the sink is going to issue an IRQ_HPD. At this point,
>> >> we may not done with processing the HPD high as after link training we
>> >> would typically notify the user mode of the newly connected display,
>> >> etc.
>> >
>> > Given that the irq comes in and is then forked off to processing at a
>> > later time implies that IRQ_HPD can come in at practically anytime.
>> > Case
>> > in point, this patch, which is trying to selectively search through the
>> > "event queue" and then remove the event that is no longer relevant
>> > because the display is being turned off either by userspace or because
>> > HPD has gone away. If we got rid of the queue and kthread and processed
>> > irqs in a threaded irq handler I suspect the code would be simpler and
>> > not have to search through an event queue when we disable the display.
>> > Instead while disabling the display we would make sure that the irq
>> > thread isn't running anymore with synchronize_irq() or even disable the
>> > irq entirely, but really it would be better to just disable the irq in
>> > the hardware with a register write to some irq mask register.
>> >
>> > This pushes more of the logic for HPD and connect/disconnect into the
>> > hardware and avoids reimplementing that in software: searching through
>> > the queue, checking for duplicate events, etc.
>> 
>> I wish we can implemented as you suggested. but it more complicate 
>> than
>> that.
>> Let me explain below,
>> we have 3 transactions defined as below,
>> 
>> plugin transaction: irq handle do host dp ctrl initialization and link
>> training. If sink_count = 0 or link train failed, then transaction
>> ended. otherwise send display up uevent to frame work and wait for 
>> frame
>> work thread to do mode set, start pixel clock and start video to end
>> transaction.
> 
> Why do we need to wait for userspace to start video? HPD is indicating
> that we have something connected, so shouldn't we merely signal to
> userspace that something is ready to display and then enable the irq 
> for
> IRQ_HPD?
> 
yes, it is correct.
The problem is unplug happen after signal user space.
if unplug happen before user space start mode set and video, then it can 
just do nothing and return.
but if unplugged happen at the middle of user space doing mode set and 
start video?

remember we had run into problem system show in connect state when 
dongle unplugged, vice versa.




>> 
>> unplugged transaction: irq handle send display off uevent to frame
>> work and wait for frame work to disable pixel clock ,tear down main
>> link and dp ctrl host de initialization.
> 
> What do we do if userspace is slow and doesn't disable the display
> before the cable is physically plugged in again?
> 
plugin is not handle (re enter back into event q) until unplugged handle 
completed.
>> 
>> irq_hpd transaction: This only happen after plugin transaction and
>> before unplug transaction. irq handle read panel dpcd register and
>> perform requesting action. Action including perform dp compliant
>> phy/link testing.
>> 
>> since dongle can be plugged/unplugged at ant time, three conditions 
>> have
>> to be met to avoid race condition,
>> 1) no irq lost
>> 2) irq happen timing order enforced at execution
>> 3) no irq handle done in the middle transaction
>> 
>> for example we do not want to see
>> plugin --> unplug --> plugin --> unplug become plugin --> plugin-->
>> unplug
>> 
>> The purpose of this patch is to not handle pending irq_hpd after 
>> either
>> dongle or monitor had been unplugged until next plug in.
>> 
> 
> I'm not suggesting to block irq handling entirely for long running
> actions. A plug irq due to HPD could still notify userspace that the
> display is connected but when an IRQ_HPD comes in we process it in the
> irq thread instead of trying to figure out what sort of action is
> necessary to quickly fork it off to a kthread to process later.
> 
> The problem seems to be that this quick forking off of the real IRQ_HPD
> processing is letting the event come in, and then an unplug to come in
> after that, and then a plug in to come in after that, leading to the
> event queue getting full of events that are no longer relevant but 
> still
> need to be processed. If this used a workqueue instead of an open-coded
> one, I'd say we should cancel any work items on the queue if an unplug
> irq came in. That way we would make sure that we're not trying to do
> anything with the link when it isn't present anymore.
> 
is this same as we delete irq_hpd from event q?
What happen if the workqueue had been launched?

> But even then it doesn't make much sense. Userspace could be heavily
> delayed after the plug in irq, when HPD is asserted, and not display
> anything. The user could physically unplug and plug during that time so
> we really need to not wait at all or do anything besides note the state
> of the HPD when this happens. The IRQ_HPD irq is different. I don't
> think we care to keep getting them if we're not done processing the
> previous irq. I view it as basically an "edge" irq that we see, 
> process,
> and then if another one comes in during the processing time we ignore
> it. There's only so much we can do, hence the suggestion to use a
> threaded irq.
> 
I do not think you can ignore irq_hpd.
for example, you connect hdmi monitor to dongle then plug in dongle into 
DUT and unplug hdmi monitor immediatly.
DP driver will see plugin irq with sink_count=1 followed by irq_hpd with 
sink_count= 0.
Then we may end up you think it is in connect state but actually it 
shold be in disconnect state.
I do not think we can ignore irq_hpd but combine multiple irq_hpd into 
one and handle it.


> This is why IRQ_HPD is yanking the HPD line down to get the attention 
> of
> the source, but HPD high and HPD low for an extended period of time
> means the cable has been plugged or unplugged. We really do care if the
> line goes low for a long time, but if it only temporarily goes low for
> an IRQ_HPD then we either saw it or we didn't have time to process it
> yet.
> 
> It's like a person at your door ringing the doorbell. They're there 
> (HPD
> high), and they're ringing the doorbell over and over (IRQ_HPD) and
> eventually they go away when you don't answer (HPD low). We don't have
> to keep track of every single doorbell/IRQ_HPD event because it's 
> mostly
> a ping from the sink telling us we need to go do something, i.e. a
> transitory event. The IRQ_HPD should always work once HPD is there, but
> once HPD is gone we should mask it and ignore that irq until we see an
> HPD high again.

if amazon deliver ring the door bell 3 times, then we answer the door at 
the third time. this mean the first and second door bell ring can be 
ignored.
Also if door bell ring 3 times and left an package at door then deliver 
left, you saw deliver left form window then you still need to answer to 
find out there is package left at door. If you ignore doorbell, then you 
will missed the package.


I believe both thread_irq and event q works.
But I think event q give us more finer controller.
We are trying to fix an extreme case which generate un expected number 
of irq_hpd at an unexpected timing.
I believe other dp driver (not Qcom) will also failed on this particular 
case.







_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
