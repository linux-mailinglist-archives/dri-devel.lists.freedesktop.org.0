Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B32456C85
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 10:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338D6EC21;
	Fri, 19 Nov 2021 09:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223D16EC22
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 09:42:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g14so40215471edb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 01:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KWWIeI9PGgVaTX610GDWgWc1GQOkVrwtBxY86SIt5pE=;
 b=gNQidrPtT3sidKpXZnPwkOdueOQukbmVqd9fw2Nyy1wIN1cAE4BpfzTqiqjfygh/Su
 auBBcsCz6OJ454ZjRKEo/RFIqKQ56ao1mG97dXqLeIZIq0ogHJ4KvA/JhOC+9WRFPisB
 QKJKsoRbDEWffqUgmlW5tx9xPPP8KkHMejm2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KWWIeI9PGgVaTX610GDWgWc1GQOkVrwtBxY86SIt5pE=;
 b=3sDr2UJnst9SZhAK305ZRBPVuamz/dzFi7km9JvKM07lEGJrulO1foLVvpaCHqmie2
 6OEvDNrtlFALLL7QgPVLf1rp+wJIMW3NAT54ZuUZHQjYPFBrShmn/mW0i85jNUb6NZ45
 q6gk4idXfOYkGaLyiAXeCkBrERy8NO41sjBIePoBZAELYQ5cujGW9p+s7H8g2Lp5atF8
 zzudjbUzrDnyUt5Zj79D3d2QzU6Mpio3Y4rPYEdkw8a7O2EQXyC/HfM/o2o6Dcl6hmDY
 7+hwz+pJrdF3MI/KuCUx5z2ldb7undfMtmY2/cAHVvetbHKCwNfuaPL2zjgkMN5vnbxs
 bcUQ==
X-Gm-Message-State: AOAM530syYBwteVxprBN3QKXsSrFc3VpENbA5Cb6FpdT1VYENyi34ryU
 SIe6r73kCEmQKsmJVjvYpQ/K7w==
X-Google-Smtp-Source: ABdhPJxKs/6TNxzIH34w7vaWQv3abX+yW0fkh7VyKi/GlE9vfqWyx90QiAok//A0Mt2pCmtj/83KKQ==
X-Received: by 2002:a05:6402:41a:: with SMTP id
 q26mr23025128edv.387.1637314925641; 
 Fri, 19 Nov 2021 01:42:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m6sm1249310edc.36.2021.11.19.01.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:42:05 -0800 (PST)
Date: Fri, 19 Nov 2021 10:42:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: George Kennedy <george.kennedy@oracle.com>
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <YZdxawCdP7V2dKq1@phenom.ffwll.local>
Mail-Followup-To: George Kennedy <george.kennedy@oracle.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ben.davis@arm.com, Liviu.Dudau@arm.com,
 Dan Carpenter <dan.carpenter@oracle.com>, nd@arm.com
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com>
 <26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com>
 <20211029141400.vcswmabtk5i3cvv7@000377403353>
 <4cfb985e-72da-173c-4818-c9c4af7d83a6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfb985e-72da-173c-4818-c9c4af7d83a6@oracle.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: nd@arm.com, ben.davis@arm.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Liviu.Dudau@arm.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 03:00:15PM -0500, George Kennedy wrote:
> 
> 
> On 10/29/2021 10:14 AM, Brian Starkey wrote:
> > Hi,
> > 
> > On Fri, Oct 29, 2021 at 09:15:28AM -0400, George Kennedy wrote:
> > > Asking if you have any input on how to deal with hsub and vsub = zero?
> > That's just a straight mistake on those formats - they should
> > be 1. My bad for not spotting it in review.
> > 
> > On the one hand, having formats in this table is a nice
> > machine-readable way to describe them. On the other, as drm_fourcc is
> > being used as the canonical repository for formats, including ones
> > not used in DRM, we can end up with situations like this.
> > (R10/R12 being another example of formats not used in DRM:
> > 20211027233140.12268-1-laurent.pinchart@ideasonboard.com)
> 
> Wondering if there is an alternate fix to the one proposed?

I think if the cost of defining formats correctly for everyone is that drm
carries a bunch of nice machine-readable entries in its tables that it
never uses, then we should do that. The very few bytes saved aren't worth
any headaches (because on any soc system you anyway have tons more formats
than what your driver is using).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
