Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8574003B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 18:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA0210E311;
	Tue, 27 Jun 2023 16:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9243910E30B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687881642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pj+zOzmUOF0cqvoi71YUgGQfKZGwkYWd7D7VJ4Uthv0=;
 b=gHMh2i2DJ0dLqYgPkYXiiPECHtWhnvm6fUfAXjrrssVTwbBCQTDf7a57IrJ7E8x293e8S1
 yV4vMlRfnAYpJUl0N867KMVXIo9eu5lneCxdNN8z+MRdxO3BIu9bjfZIO0fX8CQGT+sIqc
 bhH9/szKdcaK5a/D0Q5KGldWMdkEpFQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-XSLSrQ-JNeuuAS1xRHWsiQ-1; Tue, 27 Jun 2023 12:00:41 -0400
X-MC-Unique: XSLSrQ-JNeuuAS1xRHWsiQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-47dccba4cbcso35159e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 09:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687881640; x=1690473640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pj+zOzmUOF0cqvoi71YUgGQfKZGwkYWd7D7VJ4Uthv0=;
 b=lIpxZ5PIBnhQ1R6Bp0L3qzQ9+xpprWfIAWQRxnae5gXhWLiCBxsNyQ8x+RCN2r8EWm
 Lj7UVEO1tOClvMqRsFbd6jHqepmBr0le+tOerMGtwYfmevLc5D458Jl67ZywGv31laAd
 WOhcIRSgmboK2ViV1e2s8/P2bHReC/AVKlSBtBnSjmnb7SHZ4G8RfjEiMJz1G2tjsgJh
 WlyWEvZAmGJMukwW+Osvq9v6NLX2wRWr4nPOQ4RE435FVaWRGL1HfNFl/2Xs+Wo58qVA
 YpTXHjGhiZb+l2hdb6o7CSHFvXrpYzpoomHg4n2XnypKj4QCbV/nYD5Kn7fwv33cZZbS
 ppZA==
X-Gm-Message-State: AC+VfDzHULd2jrL3HkPVejwa+eMw7e57lzvVahe4IRl0Nxv+CKKXgx+B
 8XKXiqjA1pvIE4dpUXo0eeXpQaTtFPzody2uE6IfZLe1oXMt1QNQw53SMhddjQ0MoHWkkXRNj6h
 HIeXOUSUzcV+R1k8WLDTHkWmzivcO
X-Received: by 2002:a05:6102:ed0:b0:440:b01a:5c1a with SMTP id
 m16-20020a0561020ed000b00440b01a5c1amr11686245vst.2.1687881640351; 
 Tue, 27 Jun 2023 09:00:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xVFFwcrphaqlcGPfMPVlXHfKmzWiSqArAVdBUA8Cx9G2oeekuo3uEn/YLT+Qi8i+897tJMQ==
X-Received: by 2002:a05:6102:ed0:b0:440:b01a:5c1a with SMTP id
 m16-20020a0561020ed000b00440b01a5c1amr11686193vst.2.1687881640022; 
 Tue, 27 Jun 2023 09:00:40 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 n10-20020a0cec4a000000b0060530c942f4sm4686678qvq.46.2023.06.27.09.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:00:39 -0700 (PDT)
Date: Tue, 27 Jun 2023 12:00:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJsHpmNEZH8ZhTAP@x1n>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n>
 <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
 <ZJnWiDhrmL0lnyUv@nvidia.com> <ZJnhNSmSv8ynHu3U@x1n>
 <ZJsFwis9edi3dWr7@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ZJsFwis9edi3dWr7@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 12:52:34PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 26, 2023 at 03:04:21PM -0400, Peter Xu wrote:
> > On Mon, Jun 26, 2023 at 03:18:48PM -0300, Jason Gunthorpe wrote:
> > > On Mon, Jun 26, 2023 at 08:14:27PM +0200, David Hildenbrand wrote:
> > > 
> > > > So we might have to implement the same page migration as gup does on
> > > > FOLL_LONGTERM here ... maybe there are more such cases/drivers that actually
> > > > require that handling when simply taking pages out of the memfd, believing
> > > > they can hold on to them forever.
> > > 
> > > In general I would like to see an interface to FOLL_LONGTERM pin pages
> > > from a memfd. I would quite happily use that in iommufd as well.
> > > 
> > > It solves some problems we have there with fork/exec/etc if the pages
> > > are not linked to a mm_struct.
> > 
> > Afaiu any fd based approach should mean it'll never work with private
> > memories, while mm-based should be able to work on any kind.  
> 
> Is there a significant use case to open a memfd and then use
> MAP_PRIVATE? Why would anyone want to do that instead of just using
> normal mmap anonymous memory?

I remember David Hildenbrand somewhere mentioned the use case where one
wants to snapshot a VM RAM into a file, then start multiple instances by
loading that VM RAM with MAP_PRIVATE, so it clones a bunch of snapshoted VM
running with a single RAM file shared as a template.  Not a generic use
case, I guess.

My question applies not only memfd but also in general - qemu by default
doesn't use memfd afaict, so it boils down to e.g. whether you'll target
the iommufd project to work in that case, where qemu uses anonymous memory.
Privately mapped file memory is only one of those kinds.

-- 
Peter Xu

