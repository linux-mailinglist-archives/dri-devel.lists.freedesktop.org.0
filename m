Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A32437F0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C356E1E5;
	Thu, 13 Aug 2020 09:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF946E1E5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:49:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r2so4675375wrs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0LlvHfm0fDcpoyyMaORTx/eYLC8CvpylDILZS1NvjiE=;
 b=lWi1FzHH1BV+EzmrSga7ApiENnWG4rnFNvY55jJnx4HEYYqFbLTyoosig8cHp1FiY+
 KzDuXOaac641oazK7Pj5mp5b/e6dsFLKNW4tORrAeiih1MKDWVWE0X2vuI1VAcIyx2P7
 Yyv67b5AUWBZMZM3ni5igMfct6/Px27rLKJM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0LlvHfm0fDcpoyyMaORTx/eYLC8CvpylDILZS1NvjiE=;
 b=M+lQ4q70dBw8TwZBuvX9ChBBv9PMzCtFYciWRbaqNoEQ7nh5aRrlM0qh7j6s8jjwZ3
 2DxGLs7PdzTyzJEn9w6FPAi9TEMGecxIv2xWC95AlTjeY5Fwr3XMItoZNMCHNqUlAEme
 omNKk6b/vF0RVaBT/bG/vI5DDphNP2xdpJAtj6lJZxj1tQwGS2vPfB7YpA3QjBzo0OTJ
 M7t1K8u57L/3bY+1ejkzcJqtGTfafzS2QXWFwCiqc9DGqPAOD5+tUGC8Lg00WFLY7J0l
 uknz0xfIEuus4MjP5tUCgOkM7HlnQte+nr9ZJyHdXev5hHH+etX5XJUWfkGm9owezzgs
 6+lA==
X-Gm-Message-State: AOAM530nPqn4DDTXZb8GMK4OpoDkEy9ezyo2AJt+k5r+RlOcQ+ia69P+
 505FuGh9EahQYVPO9HqMfvp07A==
X-Google-Smtp-Source: ABdhPJycUujEr7rVda86HPb+DkIE8Ht8J0MPhgd4scPfkc4FA7fTcodh9eVHq8K2RnSra1Me1/FpMg==
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr3037067wrq.327.1597312188920; 
 Thu, 13 Aug 2020 02:49:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 68sm9267182wra.39.2020.08.13.02.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 02:49:48 -0700 (PDT)
Date: Thu, 13 Aug 2020 11:49:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813094946.GJ2352366@phenom.ffwll.local>
Mail-Followup-To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813075420.GC975@Air-de-Roger>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monn=E9 wrote:
> On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> > On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > unpopulated physical memory ranges to map foreign pages, which is the
> > > correct thing to do in order to avoid mappings of foreign pages depend
> > > on memory hotplug.
> > =

> > So please just select ZONE_DEVICE if this is so much better rather
> > than maintaining two variants.
> =

> We still need to other variant for Arm at least, so both need to be
> maintained anyway, even if we force ZONE_DEVICE on x86.

Why does arm not have ZONE_DEVICE?
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
