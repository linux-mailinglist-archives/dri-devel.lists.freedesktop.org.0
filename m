Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45A6608C2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 22:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3810E0FE;
	Fri,  6 Jan 2023 21:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709AB10E0FE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 21:19:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m7so2441964wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8w9WwD8cU2sQXh0jUahrAS8aHOv0f+YBYRs6lEtmg5Y=;
 b=SwR0Sc5cdgkg+mkvu6a3CJHKQL0OejJJ1UVxD8va7F59QP/HTDoX7BJZMHJ4wA5cUu
 aHJJiex6JlUC2CVpCYbC6ubNLhZfKI+sODLh/OHlscJY5sOnEhpiYDVqrlIJEfelKfpP
 UcGIrGMBhr4baq4nUgAr5PdpyouKVr3EhkFjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8w9WwD8cU2sQXh0jUahrAS8aHOv0f+YBYRs6lEtmg5Y=;
 b=ULLHOqJi8QpCQh65o6K9t4RSukyg+K8exMB7fv7IBAF6Q8Hs5VXjfMEP2WVy3vwo5D
 RdC8kCzwdk5aSYEYXSNObxx9M9lzsYvekyYgxcR+5umWu2AZrRQjt11vdNpJyxH0loi6
 oacuAKSP5j+AZjyZkmnqZ0s8oDBv0xR+WbmXqWbIQILih9xGRPVmhbR3KFiKd9ybT6cJ
 4795HC+n4ONla00FdaqGiMI9NN3PzS8C6LVKeMgLfdsAfbgtcNsjWWskzwbf5Pn/tTFN
 9KT6Sr+5diex7TntvvXx6BC1ev6zFkxVch65thTdM3sQz7gBPMgLcIZofBcTimWl1sYd
 dL/A==
X-Gm-Message-State: AFqh2koyl7ujM6n72k+AD0tg2kfaqmUOoVksiQTTcdXQqbrrN/Gw+eww
 8+Q/IGQx8nlOyCAsfATbqfTB0g==
X-Google-Smtp-Source: AMrXdXua9Jskr4PiCR6lh7uqkSdITN6NhzScvm3xwzZMIh86YT0olwp/PfO66lwq/di/e5hf05XfBw==
X-Received: by 2002:adf:dc84:0:b0:29f:1d23:a4e9 with SMTP id
 r4-20020adfdc84000000b0029f1d23a4e9mr10695486wrj.21.1673039989904; 
 Fri, 06 Jan 2023 13:19:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm10079885wmq.18.2023.01.06.13.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 13:19:49 -0800 (PST)
Date: Fri, 6 Jan 2023 22:19:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hang Zhang <zh.nvgt@gmail.com>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
Message-ID: <Y7iQckF/6EMYVpQt@phenom.ffwll.local>
Mail-Followup-To: Hang Zhang <zh.nvgt@gmail.com>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20221230063528.41037-1-zh.nvgt@gmail.com>
 <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
 <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
 <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
 <Y7hvhtHeivfsnBtE@phenom.ffwll.local>
 <CAO2zrtb9H=OWPbrgmqTxQnHqETt-P4K6AxiwdtN7guxUYL2NCw@mail.gmail.com>
 <Y7h++5sU/hGJ/yTS@phenom.ffwll.local>
 <CAO2zrtaB3GZRSzgWu2kV_jTojwuhtL_kFz0gpzPPVGe9D8kVbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO2zrtaB3GZRSzgWu2kV_jTojwuhtL_kFz0gpzPPVGe9D8kVbQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 03:25:14PM -0500, Hang Zhang wrote:
> On Fri, Jan 6, 2023 at 3:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Fri, Jan 06, 2023 at 02:58:27PM -0500, Hang Zhang wrote:
> > > On Fri, Jan 6, 2023 at 1:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > BTW, if this is worthed a fix and the performance of console_lock() is a
> > > major concern, then I think there may be alternative solutions like adding
> > > a lock_fb_info() to the free call chain - if that's better in performance,
> > > or maybe selectively protect the matroxfb ioctl but not vblank ioctl as you
> > > mentioned.
> >
> > Please start out with explaining what kind of bug your checker is seeing,
> > and why. Not how you're trying to fix it. Because I'm pretty sure there
> > isn't a bug, but since I've already spent a pile of time looking at this,
> > I want to make sure.
> 
> We are sorry for the inconvenience caused, we'll follow these practices and
> guidelines in the future. Thank you!

Once more: Please explain what you're static checker is seeing. I want to
understanding this, and I'm hoping at least someone involved in this
static checker can explain what it thinks is going on.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
