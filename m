Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3542C7C43
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6BE6E405;
	Mon, 30 Nov 2020 01:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC606ED0E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 13:12:28 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d5so3194482qtn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4mUb8VH3/zjOcaB0prxZNOCyhHeWL/oDXOLcVhlQukA=;
 b=QeSI7USzNR/Hc9luEaErhq6plcg4go9/B0jTyGRabKffYek2H3en767PronC7EqjDo
 tCgS7Jhbq/jTPd1JA2RC1+NR/OOvLrIacAkIJ8YKjPzi8TLM6jIUDyYleoGFJMsnGrIu
 IkwSC4rBqYzreESJdoFCcmxCf1KhL7Q804smgB8quH8Lf/75GJJiLoa5Nyr5e5mYAfKc
 BcJqfQSAdhbk0lurSwVxP1bn9QGb2WJl7XxF1jN6gZXVhgcnF3O6YoOPMR6yE6JH8Sn7
 ++ZYzAAOIahg0CheN04AL1LTyUHtoiYaRgOesk1MY6c0vUqUuhIhc2liMY8W6WQhHlvA
 76tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4mUb8VH3/zjOcaB0prxZNOCyhHeWL/oDXOLcVhlQukA=;
 b=LXWX7L8f3slzTcCmw5fSouKcMQN3L2B3fZ8FW93T7NjsUIZ/rFxuNr9AV/AczhBoJ/
 Dq99PHXMyAmOzI5x/sm5YAsUNLGWUkpEsTo4Q/jHKMrl3MvyihOh7bz+hM7zIeCAAH6M
 arFZVlzu1U1+lQEMQLDGQdBjxUJX3ZyWscMpXdY4+9pc6nZ6SkHjWcVCCXOGhxccjPl9
 IqYIiDtKsIpKof38MxhDk67lt5kh846IrNU2UWt4eIeVumU0NdGuRY0328U4jBFNa4M6
 UqmyNmAH3fPmy87pqWWihT/qm7NjP/YG7h9/3czCAz5so4QQZ7g6shMEbvobbUEF6icK
 vwfw==
X-Gm-Message-State: AOAM532ddaILBHY0zWvuutKn4z7IMdT4BfheKct1L2xhte4uPPQRhE66
 ITB/HSrwgTICkA6EQpj31ORZWA==
X-Google-Smtp-Source: ABdhPJwdT9CaiC8171EVRdtYjL9xHQSUnZ3qtSTbobXQaW4gNhkgGlUa+eUk68y2VsuHP79oL1WzOg==
X-Received: by 2002:ac8:130d:: with SMTP id e13mr8308084qtj.3.1606482747424;
 Fri, 27 Nov 2020 05:12:27 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id t205sm6026453qke.35.2020.11.27.05.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 05:12:26 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kidY1-002Xfv-SN; Fri, 27 Nov 2020 09:12:25 -0400
Date: Fri, 27 Nov 2020 09:12:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v6 00/17] follow_pfn and other iomap races
Message-ID: <20201127131225.GX5487@ziepe.ca>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 03:41:29PM +0100, Daniel Vetter wrote:
> I feel like this is ready for some wider soaking. Since the remaining bits
> are all kinda connnected probably simplest if it all goes through -mm.

Did you figure out a sumbission plan for this stuff?

> Daniel Vetter (17):
>   drm/exynos: Stop using frame_vector helpers
>   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
>   misc/habana: Stop using frame_vector helpers
>   misc/habana: Use FOLL_LONGTERM for userptr
>   mm/frame-vector: Use FOLL_LONGTERM
>   media: videobuf2: Move frame_vector into media subsystem

At the very least it would be good to get those in right away.

>   mm: Add unsafe_follow_pfn
>   media/videbuf1|2: Mark follow_pfn usage as unsafe
>   vfio/type1: Mark follow_pfn as unsafe

I'm surprised nobody from VFIO has remarked on this, I think thety
won't like it

>   mm: Close race in generic_access_phys
>   PCI: Obey iomem restrictions for procfs mmap
>   /dev/mem: Only set filp->f_mapping
>   resource: Move devmem revoke code to resource framework
>   sysfs: Support zapping of binary attr mmaps
>   PCI: Revoke mappings like devmem

This sequence seems fairly stand alone, and in good shape as well

My advice is to put the done things on a branch and get Stephen to put
them in linux-next. You can send a PR to Lins. There is very little mm
stuff in here, and cross subsystem stuff works better in git land,
IMHO.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
