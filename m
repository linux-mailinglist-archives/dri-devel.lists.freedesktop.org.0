Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D31F4981A3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC7510E8F8;
	Mon, 24 Jan 2022 14:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2102110E7F5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:02:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso27622310wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 06:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=THU4jK8TMCvPkYwnRlwAVctd3mj6SQNDR24XQxhu4+0=;
 b=c1HiHh501vHfJygTq4pwY9rhyq7NUkUTo8SKMlDIdVV9o3QVo5dE5kBX86ECW7vD4W
 de8hP4zXBRGior3vNMWhsfhx5iKzEc12v1rbjJowYoKK/kNrGogeeWSVtlssUo1atXUx
 wHdOl1Nx0nqoLz+gvJ2RI7u3PeFnuf4gZMcvwOJ+8I3aGcKwJJ1nU9pru+wlgQvvsqiV
 TFvQ4uVx61dN/PVdeB2IuLebs0FOe+1OhuhdynNH5jIH20QYtZ1a+UsNXqU4moZ/w82X
 +mnHpcrERv5KHNbeFe/oX9/q7UI53xrWGGtz8Ew5Cka/5Fo80qlrh+0BYD/avncft3wI
 0iRQ==
X-Gm-Message-State: AOAM532QheUrGQ/j598Gs+FfnM8OULUkJdvMDUc14j68cBsZWSV0Gc6L
 6fbXybEbeB9xYK7zK4gDFBBEnPx2Qas=
X-Google-Smtp-Source: ABdhPJww5yfltt0+zq2PHbn2mD/HvnB+5pJIrqjhflb5W4S5NoJLdhhqq8/MabUEsqvCVzoBXrIvIA==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr1961082wmb.29.1643032950560;
 Mon, 24 Jan 2022 06:02:30 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b15sm13677648wrs.93.2022.01.24.06.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 06:02:30 -0800 (PST)
Date: Mon, 24 Jan 2022 14:02:28 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Message-ID: <20220124140228.ywtxgrx3jqngmbqt@liuwe-devbox-debian-v2>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
 <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
 <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
 <MWHPR21MB1593ED650DA82BC3009F66CED75D9@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20220123223030.ijdzrunduww76jiq@liuwe-devbox-debian-v2>
 <e396a22d-7e0e-73a4-d831-f69dc854bfa8@gmx.de>
 <20220124133119.3yxfr7ypmmdotm6h@liuwe-devbox-debian-v2>
 <cb4323b6-99f0-c813-502a-2fbe107353ee@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb4323b6-99f0-c813-502a-2fbe107353ee@gmx.de>
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
Cc: Wei Liu <wei.liu@kernel.org>, Wei Hu <weh@microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, hhei <hhei@redhat.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 02:48:57PM +0100, Helge Deller wrote:
> On 1/24/22 14:31, Wei Liu wrote:
[...]
> >>
> >> Linus hasn't pulled my tree yet, and he will probably not before the
> >> next merge window. So, if this is an urgent bugfix for you, I can offer
> >> to drop it from the fbdev tree and that you take it through the hyperv-fixes tree.
> >> In that case you may add an Acked-by: Helge Deller <deller@gmx.de>.
> >> Just let me know what you prefer.
> >
> > Hi Helge
> >
> > Yes, I would like to upstream it as soon as possible so that it can
> > propagate to stable trees and be backported by downstream vendors.
> >
> > I will pick it up in hyperv-fixes. Please drop it from your for-next
> > tree.
> 
> Dropped now from fbdev tree.

Thanks! I added your ack and pushed the patch to hyperv-fixes.

Wei.

> 
> Thanks!
> Helge
