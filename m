Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47629972BB8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCC910E744;
	Tue, 10 Sep 2024 08:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.b="s0V4lT8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE8710E744
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:13:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so479567966b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.com; s=google; t=1725955983; x=1726560783; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZrAkDLaXld3+MjEVbLTf0QH6amL7yZTph2uE3DVa+eA=;
 b=s0V4lT8RenMbj6qWJic0GJ4vEi1tgmhK6teCVmI4h0+enUASU8QFqCRtkMuj2ytiO1
 np53BSPg34R/QWx7LCDIKuBfAJhLsCulhpxduKutg82HZZHGrKtIkSHgTx3CqGqj3HCz
 5mHex41YcViCJy5cEfqaufj7ZXyliUmjtbAnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725955983; x=1726560783;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrAkDLaXld3+MjEVbLTf0QH6amL7yZTph2uE3DVa+eA=;
 b=nzkmz+vahVh0cbPzLBFtIKf9QALkWkffzcY7g/TtGb/wDGB/ZVsvIJAIAQEjkYmkT0
 SRwy3n9HemQ/usaW1ogaHoH9yqRCsnzERXlN10Bg3DWavqRG07L+/mw49F8pVIUcY9XB
 /kUIv00zEDZ8jiuQcVdFz8JV02rnMVDLvZFwrB+CUgGFL/x6qBkkfUyL12TAwsTpx6HT
 hiuMJ3e5DgSd/b22YbdgmVFI+oWqxgU4uREqyupgCl+inGb99QuAIaDB+G1DKChFjTh8
 BTEYBD0ICVBVwUrHBu20b9pDh3Ftsscyc5Sk4ElRDP9VFrO1EIvLGkfs/SZkIdMkCBQL
 rjng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDWq3C1/UQQr9hmAWFHwZDcmqhKpgd7qN6HpwCCvB4CNU3FTm1zgIllgmabP4LIn9dlnF/F8VzFbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzChy3GG/AMQwl9eHOJBoMzvtviaBIZLsjkkhYWIXP4/7hVz6Zq
 tjGBI2RMFDgQ3saV+lkEmGWUpG1p9e6ZuyDFkWuU0PN4PxKy77m5gXH2MKViYsc=
X-Google-Smtp-Source: AGHT+IHiB9BjTCtXbGr3lRX9SELZFUb5HLAig7DxMwgiilncoD8W9NU5mPh05hS+XdfHoA6qWwrRQQ==
X-Received: by 2002:a17:907:1c23:b0:a8d:4d76:a75e with SMTP id
 a640c23a62f3a-a8d4d76a983mr600932766b.30.1725955982405; 
 Tue, 10 Sep 2024 01:13:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258354f7sm445482166b.2.2024.09.10.01.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 01:13:02 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:13:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jason Andryuk <jandryuk@gmail.com>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Message-ID: <Zt__jTESjI7P7Vkj@macbook.local>
References: <20240910020919.5757-1-jandryuk@gmail.com>
 <Zt_zvt3VXwim_DwS@macbook.local>
 <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>
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

On Tue, Sep 10, 2024 at 09:29:30AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.09.24 um 09:22 schrieb Roger Pau Monné:
> > On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > 
> > > Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> > > struct device is NULL since xen-fbfront doesn't assign it and the
> > > memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> > > 
> > > This was exposed by the conversion of fb_is_primary_device() to
> > > video_is_primary_device() which dropped a NULL check for struct device.
> > > 
> > > Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> > > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > CC: stable@vger.kernel.org
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > > ---
> > > The other option would be to re-instate the NULL check in
> > > video_is_primary_device()
> > I do think this is needed, or at least an explanation.  The commit
> > message in f178e96de7f0 doesn't mention anything about
> > video_is_primary_device() not allowing being passed a NULL device
> > (like it was possible with fb_is_primary_device()).
> > 
> > Otherwise callers of video_is_primary_device() would need to be
> > adjusted to check for device != NULL.
> 
> The helper expects a non-NULL pointer. We might want to document this.

A BUG_ON(!dev); might be enough documentation that the function
expected a non-NULL dev IMO.

Thanks, Roger.
