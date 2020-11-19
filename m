Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A42B8D78
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469C96E593;
	Thu, 19 Nov 2020 08:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FF389944
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:27:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605749221; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=q4wBGCTc2xIs/+st3C1LkLsB6kJ97hFAKJo6hcjnmVo=;
 b=obyAy4OzJvPZLKgRJX251NfgNIgbgcwUotqbkAfE4ARuZkATc9hTwFgDCqOmfzgQm7alQ1jg
 /Tpn0+tNQhkKtiZd+NxOhJbdIeo38m4LokwAQdhI7eybfW/iLoafulq6np+vulbd1HNo+Tt9
 MzIyMmZ4HP6WPZmqVScin2sNTOY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fb5c9dce9b70886228a98fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 01:26:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 350A6C43469; Thu, 19 Nov 2020 01:26:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: veeras)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A47A7C43463;
 Thu, 19 Nov 2020 01:26:50 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 17:26:50 -0800
From: veeras@codeaurora.org
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RESEND 2/2] drm/drm_vblank: set the dma-fence timestamp
 during send_vblank_event
In-Reply-To: <20201113204525.GV401619@phenom.ffwll.local>
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
 <1605205643-12746-2-git-send-email-veeras@codeaurora.org>
 <20201113204525.GV401619@phenom.ffwll.local>
Message-ID: <a21bad2bd7b5583692535ea107d38872@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: airlied@linux.ie, gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 pdhaval@codeaurora.org, abhinavk@codeaurora.org, sean@poorly.run,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-13 12:45, Daniel Vetter wrote:
> On Thu, Nov 12, 2020 at 10:27:23AM -0800, Veera Sundaram Sankaran 
> wrote:
>> The explicit out-fences in crtc are signaled as part of vblank event,
>> indicating all framebuffers present on the Atomic Commit request are
>> scanned out on the screen. Though the fence signal and the vblank 
>> event
>> notification happens at the same time, triggered by the same hardware
>> vsync event, the timestamp set in both are different. With drivers
>> supporting precise vblank timestamp the difference between the two
>> timestamps would be even higher. This might have an impact on use-mode
>> frameworks using these fence timestamps for purposes other than simple
>> buffer usage. For instance, the Android framework uses the 
>> retire-fences
>> as an alternative to vblank when frame-updates are in progress Set the
>> fence timestamp during send vblank event to avoid discrepancies.
> 
> I think a reference to the exact source code in android that does this
> would be really useful. Something in drm_hwcomposer or whatever is 
> doing
> this.
> 

Thanks for the review. Sorry for not getting back earlier, was waiting
for the review on [patch 1/2], so that both comments can be addressed 
together.
Here is the reference for Android expecting retire-fence timestamp to
match exactly with hardware vsync as it is used for the dispsync model.

Usage: https://source.android.com/devices/graphics/implement-vsync
Code: 
https://android.googlesource.com/platform/frameworks/native/+/master/services/surfaceflinger/Scheduler/Scheduler.cpp#397
Will update the commit-text with the links as part of V2 patch.

Thanks,
Veera

> Aside from documenting why we want to do this I think this all looks
> reasonable.
> -Daniel
> 
>> 
>> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
>> ---
>>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_vblank.c 
>> b/drivers/gpu/drm/drm_vblank.c
>> index b18e1ef..b38e50c 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -24,6 +24,7 @@
>>   * OTHER DEALINGS IN THE SOFTWARE.
>>   */
>> 
>> +#include <linux/dma-fence.h>
>>  #include <linux/export.h>
>>  #include <linux/kthread.h>
>>  #include <linux/moduleparam.h>
>> @@ -999,6 +1000,14 @@ static void send_vblank_event(struct drm_device 
>> *dev,
>>  		e->event.seq.time_ns = ktime_to_ns(now);
>>  		break;
>>  	}
>> +
>> +	/*
>> +	 * update fence timestamp with the same vblank timestamp as both
>> +	 * are signaled by the same event
>> +	 */
>> +	if (e->base.fence)
>> +		e->base.fence->timestamp = now;
>> +
>>  	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
>>  	drm_send_event_locked(dev, &e->base);
>>  }
>> --
>> 2.7.4
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
