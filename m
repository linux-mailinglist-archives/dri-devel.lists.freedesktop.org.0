Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D64AD84E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D890110E54A;
	Tue,  8 Feb 2022 12:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D8A10E54A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 12:28:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id co28so10028992edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 04:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NoHwUXlnI/2+4GtIY3B1wFAlk61LjWDTsV6HYfSmeLw=;
 b=jStChDdMyGG/3ayUzbTzNYlnwxLMllmGeEpkJs6CGf6RRNXXrXPhGDRdHajcPbEmqE
 H2DdMc34jqTdSGv+yO9e+d1+mcAZAwF0dv23gQg7pAlGRBFhHcNaiq4ABOqAXmmsuiqc
 zqjXzEnlHvvLUC1fv4wlOHsvBg14LJ1hMK0Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NoHwUXlnI/2+4GtIY3B1wFAlk61LjWDTsV6HYfSmeLw=;
 b=6FEB8ssb7ho5c+GJb/ID99jphmYpHbV95xeZ/z6HY0ZWFQCrR2j/fzaIeI8C2jWXNj
 IMi8fVUXvbxJrbEibpJLatMH/I05nwn1YGuJn8jOQk+gNMkGsElbz3FnR/qavX2QrA/Y
 ooiPR0vV5PiV64n9up5dsjW1y71dbLXCGnuAuDvqS8gPEBOSLcvvzUUYxJGZ9L4ydZRD
 unaiU3Cnt2MTuu+JKBTys1om3KvblK7BNbYmydhlMnZqIR/GQImj9sz/rW0Csk/GcQmn
 FLK/WgX0vpNID5vH+I2R5SMcU99SO1uoiFmqijgw5+1Nj/jipXtehp6MSNAgRepP6LNI
 /Sgg==
X-Gm-Message-State: AOAM531ndw1T62x1C1YCtnukaF0GF6uW3gwnswZ0iGcJrqwS0v+aUqmb
 5gXvNG1Fijz5vrB14YgcFEw3dg==
X-Google-Smtp-Source: ABdhPJz8CNq0yQJBtVXBnnXD7f1N+EwgFfAJSauIO2DyR45BhacerVDpgbvWItlXedF2YCVy901D6A==
X-Received: by 2002:a05:6402:1601:: with SMTP id
 f1mr4223183edv.165.1644323316920; 
 Tue, 08 Feb 2022 04:28:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ee23sm4753981edb.19.2022.02.08.04.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:28:36 -0800 (PST)
Date: Tue, 8 Feb 2022 13:28:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Iouri Tarassov <iourit@linux.microsoft.com>
Subject: Re: [PATCH v1 9/9] drivers: hv: dxgkrnl: Implement DXGSYNCFILE
Message-ID: <YgJh8kdz47wmZJxH@phenom.ffwll.local>
Mail-Followup-To: Iouri Tarassov <iourit@linux.microsoft.com>,
 kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, spronovo@microsoft.com,
 gregkh@linuxfoundation.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 jenatali@microsoft.com
References: <cover.1641937419.git.iourit@linux.microsoft.com>
 <e04c8e820bc166d9d4fe8e388aace731bb3255b0.1641937420.git.iourit@linux.microsoft.com>
 <YeG6+Crv/Bg4h3u1@phenom.ffwll.local>
 <e472cbe8-44ec-110a-1ad7-bc561cd0be88@linux.microsoft.com>
 <CAKMK7uFkVvfXM7QsgSfP4OLk9b_cSwNsi3s3_7EFuL+Pa1s7eQ@mail.gmail.com>
 <deb33dd6-06c8-13c1-8d37-4c4f36248d96@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deb33dd6-06c8-13c1-8d37-4c4f36248d96@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 gregkh@linuxfoundation.org, haiyangz@microsoft.com, wei.liu@kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, spronovo@microsoft.com, jenatali@microsoft.com,
 kys@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 04, 2022 at 04:35:55PM -0800, Iouri Tarassov wrote:
> 
> On 1/17/2022 1:35 AM, Daniel Vetter wrote:
> > On Mon, Jan 17, 2022 at 9:34 AM Iouri Tarassov
> > <iourit@linux.microsoft.com> wrote:
> > >
> > >
> > btw another idea I had over the w/e: Another option might be to allow
> > different backends for sync_file, and then making sure that you cannot
> > ever mix dma_fence and hv_dxg_fence type sync_file up (in e.g. the
> > merge ioctl).
> > 
> > The issue is that fundamentally dma_fence and memory fences (or umf
> > for userspace memory fences as we tend to call them) aren't
> > compatible, but some of the interop plans we have is to allow stuffing
> > either of them into fence container objects like sync_file. So going
> > that route for wddm monitored fence support too could be a really
> > future-proof approach, plus it'd allow you to still share the
> > sync_file interface code. Not that it's going to be much code sharing,
> > since all the implementation code needs to be distinct.
> > -Daniel
> 
> Thanks Daniel!
> 
> I will remove the patch for dxgsyncfile from the next set of upstream
> patches.
> 
> It will be added later after a re-design.

Yeah sounds like a good plan forward to not hold up everything else
meanwhile.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
