Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF61BF16B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C981F6EB50;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822A76E061
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 11:19:13 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
 t=1588159147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imyH5i/2Y9yMNzm7UXaBN/+s9A++43Lu0do6gm4lZAo=;
 b=LrdIfbupDauYnhNB/LVW7socv26n2fC4hjUAyHuPXJNEkxTUwwClvoDTrPINu4HaMhyLgo
 2rAzNOU032gKGBlrYK/tFlmA75qh/N18BQ6tDUJLLelE+4b/sKqm4B7YwCj+vx8S6HsmSc
 AY1CCPyS+l3NPDGicr7OJQ8/QFbU5I0=
Date: Wed, 29 Apr 2020 11:19:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: kl@kl.wtf
Message-ID: <e8d385dbfbbb09acfe58d716c588722c@kl.wtf>
Subject: Re: [PATCH v2] drm: make drm_file use keyed wakeups
To: "Daniel Vetter" <daniel@ffwll.ch>
In-Reply-To: <20200428151410.GU3456981@phenom.ffwll.local>
References: <20200428151410.GU3456981@phenom.ffwll.local>
 <20200424162615.10461-1-kl@kl.wtf>
X-Spam-Score: -0.10
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

April 28, 2020 5:14 PM, "Daniel Vetter" <daniel@ffwll.ch> wrote:

> On Fri, Apr 24, 2020 at 06:26:15PM +0200, Kenny Levinsen wrote:
> 
>> Some processes, such as systemd, are only polling for EPOLLERR|EPOLLHUP.
>> As drm_file uses unkeyed wakeups, such a poll can receive many spurious
>> wakeups from uninteresting events if, for example, the file description
>> is subscribed to vblank events. This is the case with systemd, as it
>> polls a file description from logind that is shared with the users'
>> compositor.
>> 
>> Use keyed wakeups to allow the wakeup target to more efficiently discard
>> these uninteresting events.
>> 
>> Signed-off-by: Kenny Levinsen <kl@kl.wtf>
> 
> Hm I applied v1 and I'm not spotting what's different here, and there's no
> changelog explaining what changed ...
> 
> Please send a fixup if there's anything important missing.
> -Daniel
>

It's only the summary that differed as you and sravn requested in #dri-devel, so it's probably fine.

I should have explained the change. I'm still trying to get the hang of the email-based workflow. :)

Best regards,
Kenny Levinsen

>> ---
>> drivers/gpu/drm/drm_file.c | 6 ++++--
>> 1 file changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c4c704e01961..ec25b3d979d9 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -608,7 +608,8 @@ ssize_t drm_read(struct file *filp, char __user *buffer,
>> file_priv->event_space -= length;
>> list_add(&e->link, &file_priv->event_list);
>> spin_unlock_irq(&dev->event_lock);
>> - wake_up_interruptible(&file_priv->event_wait);
>> + wake_up_interruptible_poll(&file_priv->event_wait,
>> + EPOLLIN | EPOLLRDNORM);
>> break;
>> }
>> 
>> @@ -804,7 +805,8 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
>> list_del(&e->pending_link);
>> list_add_tail(&e->link,
>> &e->file_priv->event_list);
>> - wake_up_interruptible(&e->file_priv->event_wait);
>> + wake_up_interruptible_poll(&e->file_priv->event_wait,
>> + EPOLLIN | EPOLLRDNORM);
>> }
>> EXPORT_SYMBOL(drm_send_event_locked);
>> 
>> --
>> 2.26.1
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
