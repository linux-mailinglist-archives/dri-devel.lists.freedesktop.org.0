Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C524975D5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 22:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA82610E153;
	Sun, 23 Jan 2022 21:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545A210E153
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 21:56:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e8so8402202wrc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 13:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vkJFe+YpdQY4B8W9DqTO7FJ3H0EJ0x5TwT+iBVw2iXM=;
 b=1Ub8z8dYxhcXfz8sS4ROf3BxKW79sVGAqi6T6JmZJxGbmJgTCDnORJJihIoB7laR7n
 rWSrruyo6E2qP2OIGIvQS3orKPDkXn6GQQoVdF4weO9c8DUs0fT0SrucVA/xJ+HKWZUC
 jP7T6Lm4KgzDEj7j5a0bO/8U2VCdIsHOrv+e49VXPw13RiwzZqcpqXH0Yxd7gX+g1hhe
 /a+Pp07l8ri/u9Sh+MPq270Tf1aG6xxld5knBHRbB00YIoBamJEEh3AmeaE+CFvRY+S2
 iR1DaLEVLg5fPq17cZoSKNjP9vdnKN34+j5RKmasKkzP304/Huzl5sEwUQ6jMwLc2S2P
 ry6g==
X-Gm-Message-State: AOAM532PlfUDZYaKeQONNjiz8pi0UKqaQC+6IrRMGTJLvJo9z3+nsoTk
 kichmjAfXO3u7/B1D8wdsTc=
X-Google-Smtp-Source: ABdhPJwhnlwrjUsCsa0+KILQxWz6IQlGaxe4OdxYSDfPAdjw5uuWKbL38sD7/aPt9aqlGF50rVLWKA==
X-Received: by 2002:a05:6000:1a8e:: with SMTP id
 f14mr12188363wry.518.1642974967958; 
 Sun, 23 Jan 2022 13:56:07 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i2sm2779615wmq.23.2022.01.23.13.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 13:56:07 -0800 (PST)
Date: Sun, 23 Jan 2022 21:56:06 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Haiyang Zhang <haiyangz@microsoft.com>
Subject: Re: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Message-ID: <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
 <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
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
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>, Wei Hu <weh@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, hhei <hhei@redhat.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 16, 2022 at 09:53:06PM +0000, Haiyang Zhang wrote:
> 
> 
> > -----Original Message-----
> > From: Michael Kelley (LINUX) <mikelley@microsoft.com>
> > Sent: Sunday, January 16, 2022 2:19 PM
> > To: KY Srinivasan <kys@microsoft.com>; Haiyang Zhang <haiyangz@microsoft.com>; Stephen
> > Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Wei Hu <weh@microsoft.com>; Dexuan
> > Cui <decui@microsoft.com>; drawat.floss@gmail.com; hhei <hhei@redhat.com>; linux-
> > kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-fbdev@vger.kernel.org; dri-
> > devel@lists.freedesktop.org
> > Cc: Michael Kelley (LINUX) <mikelley@microsoft.com>
> > Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
> > 
> > In the WIN10 version of the Synthetic Video protocol with Hyper-V,
> > Hyper-V reports a list of supported resolutions as part of the protocol
> > negotiation. The driver calculates the maximum width and height from
> > the list of resolutions, and uses those maximums to validate any screen
> > resolution specified in the video= option on the kernel boot line.
> > 
> > This method of validation is incorrect. For example, the list of
> > supported resolutions could contain 1600x1200 and 1920x1080, both of
> > which fit in an 8 Mbyte frame buffer.  But calculating the max width
> > and height yields 1920 and 1200, and 1920x1200 resolution does not fit
> > in an 8 Mbyte frame buffer.  Unfortunately, this resolution is accepted,
> > causing a kernel fault when the driver accesses memory outside the
> > frame buffer.
> > 
> > Instead, validate the specified screen resolution by calculating
> > its size, and comparing against the frame buffer size.  Delete the
> > code for calculating the max width and height from the list of
> > resolutions, since these max values have no use.  Also add the
> > frame buffer size to the info message to aid in understanding why
> > a resolution might be rejected.
> > 
> > Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen resolution from Hyper-V
> > host")
> > Signed-off-by: Michael Kelley <mikelley@microsoft.com>
[...]
> 
> Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
> 

Applied to hyperv-fixes. Thanks.
