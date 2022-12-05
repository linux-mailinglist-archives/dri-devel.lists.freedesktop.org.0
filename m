Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004C6420D6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 01:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C8410E0B1;
	Mon,  5 Dec 2022 00:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2696410E0B1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 00:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670201508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyOn0zCqUHzr00gkE+WrihCChip5DaN83C5WKz94T9o=;
 b=ZGfeHdpOHPKjJPAfo8szy/nlbyg+2gP++WhfwHuzoYqkxfPOPxX/p6L12d3RgIbffFU7Mk
 gGZxN1xwWOFvVROzdhzODyfDaPi+Vf2Xko/X4CfO3mFYoYDxnjoBggpHQ9MXGlS41NCd7K
 vJzy50xE5MWj0Q5rhf0VMrHlXAAhICw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196--w7BwqOpMRmZh3F4SBT1CQ-1; Sun, 04 Dec 2022 19:51:47 -0500
X-MC-Unique: -w7BwqOpMRmZh3F4SBT1CQ-1
Received: by mail-il1-f198.google.com with SMTP id
 s1-20020a056e021a0100b003026adad6a9so11095287ild.18
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 16:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jyOn0zCqUHzr00gkE+WrihCChip5DaN83C5WKz94T9o=;
 b=vpje/314GrUknMTkTd0sN0aIYQBspmMTIv4CMWofuKTJKCQ9fs7Gxyr0wU3P93maLT
 /NQhp2LL7f8AEAqW4yZNweWK0vAQQ/eJtF/RpRezhTWRAo0JuBMlrf/bXcH2IK/Mf1yX
 +TLYu48v/tpAX681JMAAi/A8mcu+mDKqAo65wULN1l7dHILDqnd1IEu1PDLsKNIXH4bt
 95t7S0gg4hAxwe6BKdhM5RSR4cUT17HSuFxX6rKT86EujmS7HgJUd3FFZxzZc+4gZhPq
 if0btmGR+3KD0vMFFqdRmA074KEOcWTELtJ8McSkvx2fdK6tMAtJEi7W90y+iiDAyePX
 Ahiw==
X-Gm-Message-State: ANoB5pk2p9umndunIKszZ/7kJi72ZwUkiz5h74J1VWOPTY1Q/mOWZW3c
 Uf7oAvHuNVswin5JcYigHVjFpXYw4Yq4OWMRl1pT97BZuzVruNICnQVo7/4Kn9U7bSpD+jQPzF0
 H4Spizr6AP3ZDtmtk0S5oxxgFAxwi
X-Received: by 2002:a05:6602:2143:b0:6bc:6352:9853 with SMTP id
 y3-20020a056602214300b006bc63529853mr35427220ioy.65.1670201505084; 
 Sun, 04 Dec 2022 16:51:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qBOm8mQO/x/Lw1rl0Iy6Xk4eFLp0sKfVqFatl9b10bhQP9TrpcKRN/3msQCFGy6Z8h84OCA==
X-Received: by 2002:a05:6602:2143:b0:6bc:6352:9853 with SMTP id
 y3-20020a056602214300b006bc63529853mr35427215ioy.65.1670201504802; 
 Sun, 04 Dec 2022 16:51:44 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h20-20020a056e020d5400b0030287ff00fesm4715510ilj.60.2022.12.04.16.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 16:51:44 -0800 (PST)
Date: Sun, 4 Dec 2022 17:51:42 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "mb@lab.how" <mb@lab.how>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Message-ID: <20221204175142.658d5c37.alex.williamson@redhat.com>
In-Reply-To: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tzimmermann@suse.de,
 lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 3 Dec 2022 17:12:38 -0700
"mb@lab.how" <mb@lab.how> wrote:

> Hi,
> 
> I hope it is ok to reply to this old thread.

It is, but the only relic of the thread is the subject.  For reference,
the latest version of this posted is here:

https://lore.kernel.org/all/20220622140134.12763-4-tzimmermann@suse.de/

Which is committed as:

d17378062079 ("vfio/pci: Remove console drivers")

> Unfortunately, I found a
> problem only now after upgrading to 6.0.
> 
> My setup has multiple GPUs (2), and I depend on EFIFB to have a working console.
> pre-patch behavior, when I bind the vfio-pci to my secondary GPU both
> the passthrough and the EFIFB keep working fine.
> post-patch behavior, when I bind the vfio-pci to the secondary GPU,
> the EFIFB disappears from the system, binding the console to the
> "dummy console".
> Whenever you try to access the terminal, you have the screen stuck in
> whatever was the last buffer content, which gives the impression of
> "freezing," but I can still type.
> Everything else works, including the passthrough.

This sounds like the call to aperture_remove_conflicting_pci_devices()
is removing the conflicting driver itself rather than removing the
device from the driver.  Is it not possible to unbind the GPU from
efifb before binding the GPU to vfio-pci to effectively nullify the
added call?
 
> I can only think about a few options:
> 
> - Is there a way to have EFIFB show up again? After all it looks like
> the kernel has just abandoned it, but the buffer is still there. I
> can't find a single message about the secondary card and EFIFB in
> dmesg, but there's a message for the primary card and EFIFB.
> - Can we have a boolean controlling the behavior of vfio-pci
> altogether or at least controlling the behavior of vfio-pci for that
> specific ID? I know there's already some option for vfio-pci and VGA
> cards, would it be appropriate to attach this behavior to that option?

I suppose we could have an opt-out module option on vfio-pci to skip
the above call, but clearly it would be better if things worked by
default.  We cannot make full use of GPUs with vfio-pci if they're
still in use by host console drivers.  The intention was certainly to
unbind the device from any low level drivers rather than disable use of
a console driver entirely.  DRM/GPU folks, is that possibly an
interface we could implement?  Thanks,

Alex

