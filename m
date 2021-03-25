Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FD349310
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9B06ED65;
	Thu, 25 Mar 2021 13:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7239E6ED64
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:30:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g20so1178107wmk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 06:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1KxpzHpBzHIIR0d4+mLxk0ks65hJp0uLAyGQBVQSIeU=;
 b=b3nZzKwuxXpfgON1arUbLWyuWrxzsEhMJdw9Vk6z3IPOBTNXESSzeOj5rAlPLtmAS2
 figYI8AHLh4OHmB2VVvBh5LCJucwrslnS8JOJGl8dBHD0AP9Y/PI35Ny1DxV8d8SUk6N
 51Is4TG111or7c5brhHxqvy5qrJAhkFLXo3rkCsvwuLsnMdQR8FrBUm2sk+a3pYl5qvp
 wOXPSOd+49MMfXthEIJU+FPiMBXX0rxt4AdQDBrnsX37A7c3SUO3hLx6SImMsikjlQRG
 KSV+KUMyjXzyDfG9U39PsE+bWKJ6+se9jmmSEWKa/nJPQszjwpH3KNJAABgCRuVqNSMk
 bUVA==
X-Gm-Message-State: AOAM531av+UOLMAdeuhkl665AEPMM6x+ViX5sRFHubXeJWVj1MAnPJGB
 4luxarSwvfHm7byKEfdE3Ro=
X-Google-Smtp-Source: ABdhPJyzGQH/0Iivphr0ruNHgmB+wKVIcHSWa+rCvr/aADGIZVWt+a3LXw8EM4wj0nir7SJxq10PfQ==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr8045770wml.103.1616679038124; 
 Thu, 25 Mar 2021 06:30:38 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d18sm7685472wra.8.2021.03.25.06.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 06:30:37 -0700 (PDT)
Date: Thu, 25 Mar 2021 13:30:36 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH v2] video: hyperv_fb: Fix a double free in hvfb_probe
Message-ID: <20210325133036.rbriezf3v32wofkl@liuwe-devbox-debian-v2>
References: <20210324103724.4189-1-lyl2019@mail.ustc.edu.cn>
 <MWHPR21MB1593F19EE7AD10698582FA78D7639@MWHPR21MB1593.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR21MB1593F19EE7AD10698582FA78D7639@MWHPR21MB1593.namprd21.prod.outlook.com>
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
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 01:46:39PM +0000, Michael Kelley wrote:
> From: Lv Yunlong <lyl2019@mail.ustc.edu.cn> Sent: Wednesday, March 24, 2021 3:37 AM
> > 
> > In function hvfb_probe in hyperv_fb.c, it calls hvfb_getmem(hdev, info)
> > and return err when info->apertures is freed.
> > 
> > In the error1 label of hvfb_probe, info->apertures will be freed for the
> > second time in framebuffer_release(info).
> > 
> > My patch removes all kfree(info->apertures) instead of set info->apertures
> > to NULL. It is because that let framebuffer_release() handle freeing the
> > memory flows the fbdev pattern, and less code overall.
> 
> Let me suggest some clarifications in the commit message.  It's probably
> better not to reference the initial approach of setting info->apertures to
> NULL, since there won't be any record of that approach in the commit
> history.  Here's what I would suggest:
> 
> Function hvfb_probe() calls hvfb_getmem(), expecting upon return that
> info->apertures is either NULL or points to memory that should be freed
> by framebuffer_release().  But hvfb_getmem() is freeing the memory and
> leaving the pointer non-NULL, resulting in a double free if an error
> occurs or later if hvfb_remove() is called.
> 
> Fix this by removing all kfree(info->apertures) calls in hvfb_getmem().
> This will allow framebuffer_release() to free the memory, which follows
> the pattern of other fbdev drivers.
> 
> Modulo this revision to the commit message, which Wei Liu can
> probably incorporate,
> 

Yes. I surely can incorporate the changes.

I will also add the Fixes tag.

> Reviewed-by: Michael Kelley <mikelley@microsoft.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
