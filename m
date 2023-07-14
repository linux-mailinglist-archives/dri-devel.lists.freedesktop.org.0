Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D1753EBE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 17:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251FF10E8B0;
	Fri, 14 Jul 2023 15:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95DC10E8B2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 15:24:48 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a3efebcc24so1639679b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1689348287; x=1691940287;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KKCPDDjyadziwl2/AK/7bwW5AQLCnpdzpQfQJ+yWANU=;
 b=VkfHth5MNAZHQQpEhdDGh0pq0hoDNb/IkCyvJyfZlohZ7FEqc/tc2UlGQlp5P+ls2k
 LP4Az77bQs/0UVX1KSsNiwTlKtw8ZJErPfpgp4NpbjjW9RxzvWKdoj5q9JZGtbqYKyMw
 IkbeE1z0uT48kd4G5uv3BxnFhNNELaU6M+7XHRszPJ3LTmAtfce0FwO0kiq6qtWbZVLj
 +GaUqzfPkfSAQcQuVfYKAUHYwjH4iU0nqNSXmWkPMWsXsceycWdUU7PI1Bdr+PTPu7X6
 X/OpA3sg1LJmtBpK2xUftGMYHz3Z91vTuIVh4aBU1pURrsic+RJAvN3CFStnNYgOJO/U
 rXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689348287; x=1691940287;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKCPDDjyadziwl2/AK/7bwW5AQLCnpdzpQfQJ+yWANU=;
 b=LVEFqlXoxYHr2QBS1+uUApvOcd+UpTewQxt7bZDvFo50hoUzr7gpxvZkR32ge6qCV1
 mqT70K5zuZ6d5xBmxt43lhFQNCzu+zmnvXhxfzODAAiwPlUpLcboxHp8Va5iLlIITwXl
 GX/wbR+XwpRC19J7OnYY/GIeyZ9Zap35iaTYc3XNW9YvXPvjNFlN7zss/XrfOWDwayik
 aTqcB2dUCuNQXQX8cKuV0VwFQYewdRuXpWbuKxg2o1dWFw6ZhDigpdiLYOHuGmIlX2MB
 b1JhvFePsbS5VDy2BY6bzK/sJpEOx4XWA5T4jU5E29zLUvF+ImsVX2AZRTNbStN2EeMM
 ICYw==
X-Gm-Message-State: ABy/qLZh0jBA0Vqra3TvuIAmJpcL00y2ifl0OugHVLXFhaJww5zhL6WY
 pG+a1eN4TJB+FI82+No7F0WPKw==
X-Google-Smtp-Source: APBJJlH+MwWcaUVg/7akbj8keBMvf8gq7EKuq9vDRBoNFYJ4+ezTmB048XjMLkW7GX8JAT8v1K03Sg==
X-Received: by 2002:a05:6808:2226:b0:3a3:eceb:7bbc with SMTP id
 bd38-20020a056808222600b003a3eceb7bbcmr7147567oib.54.1689348287397; 
 Fri, 14 Jul 2023 08:24:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.25.194]) by smtp.gmail.com with ESMTPSA id
 x19-20020a17090aa39300b00263154aab24sm1230248pjp.57.2023.07.14.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:24:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1qKKez-0017NL-5i;
 Fri, 14 Jul 2023 12:24:45 -0300
Date: Fri, 14 Jul 2023 12:24:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <ZLFovYocElAD7gJ0@ziepe.ca>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>, jaz@semihalf.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, Halil Pasic <pasic@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Xu Yilun <yilun.xu@intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 netdev@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 linux-usb@vger.kernel.org, Peter Oberparleiter <oberpar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 09:05:21AM +0200, Christian Brauner wrote:

> I have no skin in the game aside from having to drop this conversion
> which I'm fine to do if there are actually users for this btu really,
> that looks a lot like abusing an api that really wasn't designed for
> this.

Yeah, I think so too. The ACPI thing should use its own FD if it wants
to feed actual data..

Jason

