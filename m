Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9AE84B76E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E89112C30;
	Tue,  6 Feb 2024 14:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="S5yY7zuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB4A112C1E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:03:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33b182249a1so703233f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707228188; x=1707832988; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZY3ZSy4MqyrWF0Gi/O8EdtJLuEtpnz4rpqRHN33pQM=;
 b=S5yY7zuLOwNQHVgsHkesRhTVpmRxLRTEqn6VrzzqVTLaGpaql4pV+bQIN9zwLCPCp3
 qgQ1BUFWrm2P206ALv9rntXyRtceNYq0gU11UdcH7L/q1Pt0IZzni2HcZ8oM7CQwf1/w
 aPL0eK/rrbkoh8m7SPE9iskJ+z7ya8cnlVdR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707228188; x=1707832988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZY3ZSy4MqyrWF0Gi/O8EdtJLuEtpnz4rpqRHN33pQM=;
 b=mPt7ocIH6P7u3Td61iw+aRwmjIUiWOSvKdc0a4UsV/VMVhdf7YvPqcLnvsXnRI/dnU
 Lx19AXvPDzVpAME26gssQ19H9YZyfSQmLorzwCFPbvtEHvJZpHNQjuQ6MkpjsqJc8Ljd
 VcC8QKgzchCF0GCpmSW+fR/pP+QaPeYORUrMBaQIElR9/L1rCLGG9IcilUw2xAovcGrm
 vI/wsO9Co2XHwtS7BXljq1Yrzl/+fwNu+qUWK6W80mYMOoHoDmvIU98Mfs3bRvIajFrz
 gjICV+fZZRDKc4dfrvP+vfu0BU7z9FWxWkqbO54ka7Th7/VzBPWDk6OXUkh4tqKFloab
 Ttbw==
X-Gm-Message-State: AOJu0Yyigpis7qhSw02trXsVSVK/aEP/IyB+XYZEfZzZSXHvi84le6eD
 CN1FAnvIW5jIiwb8NrrbacSi8J1MKLFks8eu8dirOzPC88td1jZmKYSBSeblJ5I=
X-Google-Smtp-Source: AGHT+IHg97DmEZfUt5yro36rUPzgT85vlHitOoX6kk2/ZXF2r5AcB0hK7+/bFdaZoamyoLkQOySFPA==
X-Received: by 2002:a05:6000:100c:b0:33b:364c:e83d with SMTP id
 a12-20020a056000100c00b0033b364ce83dmr2060497wrx.1.1707228187938; 
 Tue, 06 Feb 2024 06:03:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW1PdNA6fWUxsT1WcOtlPlmhKukj+wn7i8kA0huUecBZHIttCfVUorZtW+Vpt1uR4VL3XchjMBaRYX/zLSHaMX6iu9K5ZtcpRjITnl9NEaU+rwQMiQjGDi1T7HKfROABT+cd4eqSfo2YDkTDFFqMA==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d5148000000b0033b28a784dcsm2163863wrt.114.2024.02.06.06.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 06:03:07 -0800 (PST)
Date: Tue, 6 Feb 2024 15:03:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
Message-ID: <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-Mailman-Approved-At: Tue, 06 Feb 2024 14:08:39 +0000
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

On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
> On 2/5/24 22:08, Dave Airlie wrote:
> > On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
> > > 
> > > On 1/29/24 02:50, Dave Airlie wrote:
> > > > From: Dave Airlie <airlied@redhat.com>
> > > > 
> > > > This should break the deadlock between the fctx lock and the irq lock.
> > > > 
> > > > This offloads the processing off the work from the irq into a workqueue.
> > > > 
> > > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > 
> > > Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
> > > safe deferring fence signalling to the kernel global wq. However, I wonder
> > > if we could create deadlocks by building dependency chains into other
> > > drivers / kernel code that, by chance, makes use of the kernel global wq as
> > > well.
> > > 
> > > Admittedly, even if, it's gonna be extremely unlikely given that
> > > WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
> > > 
> > > Also, do we need to CC stable?
> > 
> > I pushed this to Linus at the end of last week, since the hangs in 6.7
> > take out the complete system and I wanted it in stable.
> > 
> > It might be safer to use a dedicated wq, is the concern someone is
> > waiting on a fence in a workqueue somewhere else so we will never
> > signal it?
> 
> Yes, if some other work is waiting for this fence (or something else in the same
> dependency chain) to signal it can prevent executing the work signaling this fence,
> in case both are scheduled on the same wq. As mentioned, with the kernel global wq
> this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
> but formally the race condition exists. I guess a malicious attacker could try to
> intentionally push jobs directly or indirectly depending on this fence to a driver
> which queues them up on a scheduler using the kernel global wq.

I think if you add dma_fence_signalling annotations (aside, there's some
patch from iirc Thomas Hellstrom to improve them and cut down on some
false positives, but I lost track) then I think you won't get any splats
because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
infinity to not matter.

I'm not sure we should care differently, but I guess it'd be good to
annotate it all in case the wq subsystem's idea of how much such deadlocks
are real changes.

Also Teo is on a mission to get rid of all the global wq flushes, so there
should also be no source of deadlocks from that kind of cross-driver
dependency. Or at least shouldn't be in the future, I'm not sure it all
landed.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
