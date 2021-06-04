Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36839B957
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B246E975;
	Fri,  4 Jun 2021 13:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610026F4D0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 13:00:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so5552282wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sDvJ/P2CUwJS1UkHCdeZqkrV0wm/XZF87IhduHAN14A=;
 b=jsDnwNjB0Zr5H/LLFtAAsv/FiXOmGWIlpOeK4xZOIAC4X8zP2PPa4xTxYiKhQKDPJg
 dZ9mBlCZvbpS6WqCfo420xvKH133nqyBfz/Nt9FlozGMITezu6QdqXZOOcy1DTdIqVRN
 xY7Q9xHUZtJpZrfDZ8YoLILmB0bulgkLP3TjHWwA7RowQDrksHFtpMg8QvZTkejmw9QD
 NqSXQa3rScxI77/bGSidp/wo4dQ0dUL6x55g7JK1NKYfXH4oEHrenyKrgQwJ1iRPS1K5
 0R3WVx8Dn+s8i1TYj4bFjnNk7vm02pip7Mh+q4lRaWBiohQtZeR8+bNNS3KduMq9knOZ
 BXNA==
X-Gm-Message-State: AOAM531gkEHoyG8OoasaNnaN1Ft6nGsOvnzet17J3f7lItuhA476+QP0
 /nM4wF1u/6pg4qxWNd3nMF0=
X-Google-Smtp-Source: ABdhPJyFEW9QabvckxrTXanJXK76Qm2nxTXcxOzdGCgtNeZIbg7MFr6vkW9qMHfgph8dhTL8s9wXuQ==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr3476024wmk.54.1622811617069; 
 Fri, 04 Jun 2021 06:00:17 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f14sm6499240wry.40.2021.06.04.06.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 06:00:16 -0700 (PDT)
Date: Fri, 4 Jun 2021 13:00:14 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Message-ID: <20210604130014.tkeozyn4wxdsr6o2@liuwe-devbox-debian-v2>
References: <87v96tzujm.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v96tzujm.fsf@vitty.brq.redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, wei.liu@kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-fbdev@vger.kernel.org,
 viremana@linux.microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 02:25:01PM +0200, Vitaly Kuznetsov wrote:
> Hi,
> 
> Commit ccf953d8f3d6 ("fb_defio: Remove custom address_space_operations")
> seems to be breaking Hyper-V framebuffer
> (drivers/video/fbdev/hyperv_fb.c) driver for me: Hyper-V guest boots
> well and plymouth even works but when I try starting Gnome, virtual
> screen just goes black. Reverting the above mentioned commit on top of
> 5.13-rc4 saves the day. The behavior is 100% reproducible. I'm using
> Gen2 guest runing on Hyper-V 2019. It was also reported that Gen1 guests
> are equally broken.
> 
> Is this something known?
> 

I've heard a similar report from Vineeth but we didn't get to the bottom
of this.

Wei.

> -- 
> Vitaly
> 
