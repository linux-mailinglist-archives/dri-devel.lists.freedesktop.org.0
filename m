Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F54765DA1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 22:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FB610E603;
	Thu, 27 Jul 2023 20:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87B810E603
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690491249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1OcuPUaQjLUkSPF5ziwEuH1gdGw0Y2/mfnEGefK6PuA=;
 b=Bi1FGj0JMFtLtlZGh4/vnOgbj80L8Q+zUBFz3zfuzvQUJFbQ2iCPiVQzaKX5nFZ0Ix/XeK
 lRe5hrucPDD0QoHNj9vHOQprR6j8x3i+DjSNKrEFSKazlSVX2dWKHOBMEF4nYSy5jh4/YZ
 HaOSmx/vOAGRQVtc+tczU0rqO8s7WWU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-qeqgXp4eOi-E6VbTF0cH4A-1; Thu, 27 Jul 2023 16:54:06 -0400
X-MC-Unique: qeqgXp4eOi-E6VbTF0cH4A-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6364867fa8aso3392946d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690491246; x=1691096046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OcuPUaQjLUkSPF5ziwEuH1gdGw0Y2/mfnEGefK6PuA=;
 b=UD4ezl3sj143KQZ7verlYCPY/MjDb2hd9Q1W4+2GmoHRcUWhHfCfALL6mmNHzUqZHP
 8hpzjewSXTZM2zchkPlCWMMOw2lE5oE1R78Y8lwZSXYg5TAI/pWU7s8oay2XQiInii92
 j1XfWmesEtcxbcwYu0mEGkqKCeB/IuwJhhY6ZlI/t/7vWcrrJTCgPkzh8WLPLO8uEDa2
 +1CUgYXRUNK1z8IMnXW/E7INAfaFYsd8R98aCexk3C99o7s+oClVn0IKjoc3XBFfQxLi
 ArQSqDM2Yj9DWvAKUg0ppKe2NMhinokOuzskl6DIQ6nl6oIpCvpkavfqKHmQN0okhGj7
 r53A==
X-Gm-Message-State: ABy/qLaQ79b0eZb2szge2ScBaiEnGkdYVd/rKGONWnouDfr5Tnrl4QsH
 4dvprKyTBu8dpv3LxCPtiMPcja5Zq86sKg+M3226Mrd0aIe6ko5tlMeOF5ILsx4UGQm/mAcScWk
 0aWLdRqPTIDHAOz8YYodKfl0EYFqy
X-Received: by 2002:ad4:5d68:0:b0:636:dae2:dc4 with SMTP id
 fn8-20020ad45d68000000b00636dae20dc4mr573597qvb.5.1690491245776; 
 Thu, 27 Jul 2023 13:54:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEKlj6SzG8qCOOohZpbpp0o6XbCBjw+9tBDHZ+WPZ7+Z2U5Aj5njYlWBm4lviaIN+XPF+vG5A==
X-Received: by 2002:ad4:5d68:0:b0:636:dae2:dc4 with SMTP id
 fn8-20020ad45d68000000b00636dae20dc4mr573577qvb.5.1690491245484; 
 Thu, 27 Jul 2023 13:54:05 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 c14-20020a0ca9ce000000b00632191a70aesm690443qvb.88.2023.07.27.13.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 13:54:05 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:54:03 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 2/2] udmabuf: Add back support for mapping hugetlb
 pages (v2)
Message-ID: <ZMLZa2xF+tMg5t93@x1n>
References: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
 <20230718082605.1570740-3-vivek.kasireddy@intel.com>
 <20230718234436.GB10413@monkey>
 <IA0PR11MB7185E6C4F0B9F4666A7C5CF7F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB7185E6C4F0B9F4666A7C5CF7F839A@IA0PR11MB7185.namprd11.prod.outlook.com>
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
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 05:42:54AM +0000, Kasireddy, Vivek wrote:
> > > +			} else {
> > > +				page =
> > shmem_read_mapping_page(mapping, pgoff + pgidx);
> > 
> > It may not matter to your users, but the semantics for hugetlb and shmem
> > pages is different.  hugetlb requires the pages exist in the page cache
> > while shmem will create/add pages to the cache if necessary.
> Ok; got it.

Would it be nice to do the same for both (perhaps always try to allocate)?

Thanks,

-- 
Peter Xu

