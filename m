Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE52349BB1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 22:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1896EE4C;
	Thu, 25 Mar 2021 21:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFAD6EE4C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 21:33:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v11so3711908wro.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=TXHI1OxX+D4iSzKCuoMMss3yjiQz/+KLKVrP99q3G2I=;
 b=frvH/QuNUnODqvtDdusaUFppblhOygLUWsC1ixB43GNG2Cc+yxM2WFbRWpgjN4Ju8Y
 95PeIsuDNMn98oqagJ3ef1Nu2yOkiL1vvMi/6inWwQyeTtLH5DD3GrBLCXNufjRYGMCK
 r/gFSHALeS9GIhicmr/nrrhcB3MijIi/RQZtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=TXHI1OxX+D4iSzKCuoMMss3yjiQz/+KLKVrP99q3G2I=;
 b=sPDkwyCWLY0VPu92K/IYqOoZsdFiT9FihtrScCeJJDLypec/2fLjFSXd1ssk2WFn7k
 JqziEzxzD3+P/q9wEYiszU3K+06suTNMIXzqT8kbPqqt7MYvEIHmEOR09+Jz0r9avPIx
 MaXDfzN9NMmZCk5A6jiujnLM8zhT6pXrxkJ/YyXxfAg8umW+RzKcbOmyI9gkK+r7lJ+H
 L6pHbvL5miS2QeE8phTAJSuFwWr2w91AGOnjoz+WTJemX3dL244uV1vPus0GN5cFd9sk
 j1aj69hBPkjOpd1QZn035QaFL8iejq9GyPVdFrOefYVAny7/+5dyDNCOj24RjxDVOpWZ
 /7yw==
X-Gm-Message-State: AOAM532W8Vu85HRSKhsvsawi5xlZeaPq0vBOjXVJ9wAlQGLGPcbWp0D/
 vz9sFBcMi3VFwppceMDFIkAhvw==
X-Google-Smtp-Source: ABdhPJwn8UAApYENGs0EsRiOl6kaa4IOv1NsIwYwvHs5ZhbA+T+EIOa3Ak0sCs/YbuNvp+I4gerYDg==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr10992298wrn.315.1616708036367; 
 Thu, 25 Mar 2021 14:33:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x13sm1115693wmp.39.2021.03.25.14.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 14:33:55 -0700 (PDT)
Date: Thu, 25 Mar 2021 22:33:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 3pvd@google.com, Jann Horn <jannh@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <YF0BwfzqpPLuFTw+@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 3pvd@google.com, Jann Horn <jannh@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210324125211.GA2356281@nvidia.com>
 <YFuQNj10P+uUHD4G@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFuQNj10P+uUHD4G@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 08:17:10PM +0100, Daniel Vetter wrote:
> On Wed, Mar 24, 2021 at 09:52:11AM -0300, Jason Gunthorpe wrote:
> > On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> > > Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> > > follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> > > follow_pte()")) have lost their callsites of follow_pfn(). All the
> > > other ones have been switched over to unsafe_follow_pfn because they
> > > cannot be fixed without breaking userspace api.
> > > 
> > > Argueably the vfio code is still racy, but that's kinda a bigger
> > > picture. But since it does leak the pte beyond where it drops the pt
> > > lock, without anything else like an mmu notifier guaranteeing
> > > coherence, the problem is at least clearly visible in the vfio code.
> > > So good enough with me.
> > > 
> > > I've decided to keep the explanation that after dropping the pt lock
> > > you must have an mmu notifier if you keep using the pte somehow by
> > > adjusting it and moving it into the kerneldoc for the new follow_pte()
> > > function.
> > > 
> > > Cc: 3pvd@google.com
> > > Cc: Jann Horn <jannh@google.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: kvm@vger.kernel.org
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  include/linux/mm.h |  2 --
> > >  mm/memory.c        | 26 +++++---------------------
> > >  mm/nommu.c         | 13 +------------
> > >  3 files changed, 6 insertions(+), 35 deletions(-)
> > 
> > I think this is the right thing to do.
> 
> Was just about to smash this into the topic branch for testing in
> linux-next. Feel like an ack on the series, or at least the two mm
> patches?

Pushed them to my topic branch for a bit of testing in linux-next,
hopefully goes all fine for a pull for 5.13.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
