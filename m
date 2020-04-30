Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13751BFC30
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663F06E90A;
	Thu, 30 Apr 2020 14:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF706E90A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:04:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d17so7030147wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nR/4l2ev7gj1d0NQKfg0sKi3r/8R1EfLq6ZSdokkti0=;
 b=CLNLKg0o0uOpdjN9IbzQj/op7l2SGyu1cc9+t8YOcCk1v915ZlhWA/CqJ5FrIOiG9r
 x6iCMk9QkUl0bbJXAotNzObLcKX0Xb3ptTEm9gq12jm1aK0xWqkRGR8AIgQ5zkHR/b8E
 aBXt2CmDzyqI5yyv3UTaMogkUZixMnLM0gWzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nR/4l2ev7gj1d0NQKfg0sKi3r/8R1EfLq6ZSdokkti0=;
 b=Xskl9EAe5Nmm6El+To7G6gKtH7bMTbiUnm3ahc5MVCkr8Z3+AUIZ4CAQpWtkEMqvy6
 4JT/y1vjPjatz/Gt+BIEe/UQY5N7brjqZchVNCelPe8z0vqG4hDngVgp3oS+8l2SP/+/
 ZbWZ+vAy/YUv/+2Gc7gz/LScWHhESCTp3FDNWs4jNAF9i6eujX9sadrVQaTDlPyCYGuD
 PUirY6AA/iFYyEhUI7RVvG2j4OiZnng3riW05pDpzmQv2wf9y4PNLI+sAwXgiw1SIPhX
 phJkQoiY4o5j7ALdmTrkjLtXGBZA/aXOdW0fppQt4asYfjOXnxKyQeBKIaDTUoeqBw1m
 0ugw==
X-Gm-Message-State: AGi0PuZziSqFdJkwkm4AeIXgFIRR2TSOUY1RDbtjXHT+EPbVGow7dMPG
 /LtybMasogNd2UF3q8mpTHF8wQ==
X-Google-Smtp-Source: APiQypL0M5PkdpQFdPq72B3lypEZHvVXpjNaTNIr5PylaMj7pL4X2pMbQKG6KnwJtFVUx+06kk8Dvg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr4613274wrr.152.1588255459228; 
 Thu, 30 Apr 2020 07:04:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 17sm12146575wmo.2.2020.04.30.07.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 07:04:18 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:04:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: kl@kl.wtf
Subject: Re: [PATCH v2] drm: make drm_file use keyed wakeups
Message-ID: <20200430140416.GG10381@phenom.ffwll.local>
Mail-Followup-To: kl@kl.wtf, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org
References: <20200428151410.GU3456981@phenom.ffwll.local>
 <20200424162615.10461-1-kl@kl.wtf>
 <e8d385dbfbbb09acfe58d716c588722c@kl.wtf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8d385dbfbbb09acfe58d716c588722c@kl.wtf>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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

On Wed, Apr 29, 2020 at 11:19:07AM +0000, kl@kl.wtf wrote:
> April 28, 2020 5:14 PM, "Daniel Vetter" <daniel@ffwll.ch> wrote:
> 
> > On Fri, Apr 24, 2020 at 06:26:15PM +0200, Kenny Levinsen wrote:
> > 
> >> Some processes, such as systemd, are only polling for EPOLLERR|EPOLLHUP.
> >> As drm_file uses unkeyed wakeups, such a poll can receive many spurious
> >> wakeups from uninteresting events if, for example, the file description
> >> is subscribed to vblank events. This is the case with systemd, as it
> >> polls a file description from logind that is shared with the users'
> >> compositor.
> >> 
> >> Use keyed wakeups to allow the wakeup target to more efficiently discard
> >> these uninteresting events.
> >> 
> >> Signed-off-by: Kenny Levinsen <kl@kl.wtf>
> > 
> > Hm I applied v1 and I'm not spotting what's different here, and there's no
> > changelog explaining what changed ...
> > 
> > Please send a fixup if there's anything important missing.
> > -Daniel
> >
> 
> It's only the summary that differed as you and sravn requested in #dri-devel, so it's probably fine.
> 
> I should have explained the change. I'm still trying to get the hang of the email-based workflow. :)

Oops sorry, I generally run as a stateless maintainer so forgot :-/

And yes email based workflow is full of warts, it's a pain.
-Daniel

> 
> Best regards,
> Kenny Levinsen
> 
> >> ---
> >> drivers/gpu/drm/drm_file.c | 6 ++++--
> >> 1 file changed, 4 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> >> index c4c704e01961..ec25b3d979d9 100644
> >> --- a/drivers/gpu/drm/drm_file.c
> >> +++ b/drivers/gpu/drm/drm_file.c
> >> @@ -608,7 +608,8 @@ ssize_t drm_read(struct file *filp, char __user *buffer,
> >> file_priv->event_space -= length;
> >> list_add(&e->link, &file_priv->event_list);
> >> spin_unlock_irq(&dev->event_lock);
> >> - wake_up_interruptible(&file_priv->event_wait);
> >> + wake_up_interruptible_poll(&file_priv->event_wait,
> >> + EPOLLIN | EPOLLRDNORM);
> >> break;
> >> }
> >> 
> >> @@ -804,7 +805,8 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
> >> list_del(&e->pending_link);
> >> list_add_tail(&e->link,
> >> &e->file_priv->event_list);
> >> - wake_up_interruptible(&e->file_priv->event_wait);
> >> + wake_up_interruptible_poll(&e->file_priv->event_wait,
> >> + EPOLLIN | EPOLLRDNORM);
> >> }
> >> EXPORT_SYMBOL(drm_send_event_locked);
> >> 
> >> --
> >> 2.26.1
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
