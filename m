Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42976E904
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70E110E1B5;
	Thu,  3 Aug 2023 13:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507C610E1B5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691067747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJz+/0G2mEv6SI+dWI2RYHCp9SYOk0dQT4zCRlQD1ZE=;
 b=bh1x4ltIydpWaHU+1xWZZQurqwyCZO6j5fXJy7iiV0T7ULHha1HHpK7KmygmqnqDia6IF+
 jE2vnXnc6qLJBl83WQZKvu7Wz2EaC6+6lNMiN6uZ0cEPlqocswGVkHMRz+4RBjeUrOYAdR
 bo2UD5nYd3eAXgm+mknzC0teaKEYslU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-8sUmCotsOVuVrDd1cVg5YQ-1; Thu, 03 Aug 2023 09:02:26 -0400
X-MC-Unique: 8sUmCotsOVuVrDd1cVg5YQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-40fa24ab5c8so2592721cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 06:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691067745; x=1691672545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJz+/0G2mEv6SI+dWI2RYHCp9SYOk0dQT4zCRlQD1ZE=;
 b=Zw35tLL4YYc3d1iG3uZ3ZgjheF20XP4noLJHRooNMjTqh8K0oOgtMqYeMLXjNzcRSL
 na+Isu3WDDXHDEZ7g2su4eu8GfZz+ep7j9JNpJkuG0LGR18QJPQlXgjlI0a4hGD6KbLc
 MFVwMdF73EndVzsWupTD1fTKW3cqR7MuCLoIB9mrUdylTJtnLs1CHl4vpt543e2IcGn2
 q2FnlZw4XYreDHPiyO0zXmuimDSETA8SVYn59KruoU9DMRWE5KivupfNgojRE1zrh4UY
 QfI+Wa/czb30O1LK7hopLNlMl/u38pG2c+vShbNooyqSuPqGfDZMFAmah5zCCZ56nfg1
 sCJg==
X-Gm-Message-State: ABy/qLb6zH7a5nfIf1hXXqH1UR0BDb6zQrpqtvG/shZrfqT4R1Y00XD8
 Lb1m/es0SMOizEfxR+LspbbL7EE70ug2sfBQJi5+ud6CF1EQ3iI5NYXH6PLiPTwuByxc+U1EKnK
 tgNak4j3OpjtYje3ZDMjPodGZqEAY
X-Received: by 2002:a05:622a:13ce:b0:403:c2fa:83b with SMTP id
 p14-20020a05622a13ce00b00403c2fa083bmr22178492qtk.4.1691067745579; 
 Thu, 03 Aug 2023 06:02:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEFOQ3sw787k0lCO6xjA4QS65YLiEbg9JCaPwNWB3hN/9LsAvELPwMJgbLfqIg5ZsX++XxHpw==
X-Received: by 2002:a05:622a:13ce:b0:403:c2fa:83b with SMTP id
 p14-20020a05622a13ce00b00403c2fa083bmr22178455qtk.4.1691067745121; 
 Thu, 03 Aug 2023 06:02:25 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 bq22-20020a05622a1c1600b0040331a24f16sm6129081qtb.3.2023.08.03.06.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 06:02:24 -0700 (PDT)
Date: Thu, 3 Aug 2023 09:02:23 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMulX/3+QMMXy1oe@x1n>
References: <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
 <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMLk8aMmpkK7ZCsW@x1n>
 <CH3PR11MB7177832A92B4F550BF816E0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMfp3q/9osOV4wFO@x1n>
 <IA0PR11MB7185B093E86CB35EFDFF17EAF80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMl/4Z1b6ooeE/Pk@x1n>
 <IA0PR11MB7185830320B39330BFBCCE8FF808A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB7185830320B39330BFBCCE8FF808A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Vivek,

On Thu, Aug 03, 2023 at 08:08:41AM +0000, Kasireddy, Vivek wrote:
> > Isn't it already too late though to wait that notification until page is
> > installed?  Because here you pinned the page for DMA, I think it means
> > before a new page installed (but after the page is invalidated) the device
> > can DMA to an invalid buffer.
>
> The page is only invalidated in the memfd. Until the hole is written to,
> we (udmabuf) can choose to handle any reads (or DMA) using old pages
> if needed.

But what happens if there's DMA writes?  I don't see anything that will
stop the device from doing so - the whole design looks fully transparent, I
just still don't see how it can be done without synchronizing with the
device.

IIUC, we need to e.g. quiesce the device when any page got invalidated in
some way like hole punching, and should happen right before it happens
(comparing to the notification of new page update which should be right
after the installation OTOH).

I think the vfio use case currently face the same condition and challenge,
assuming there's currently no easy solution so that was just prohibited.  I
guess people are just waiting for hardware vendors to support device page
faults, like processors - then we can synchronize with the device using the
device IOMMU page tables (by clearing it at proper time and blocks DMA
writes).

Thanks,

-- 
Peter Xu

