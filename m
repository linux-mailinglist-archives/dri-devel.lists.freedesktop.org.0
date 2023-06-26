Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026673EAD7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 21:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDA910E244;
	Mon, 26 Jun 2023 19:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A0110E244
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687806268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ofupP4QvlSITqeJMJYxFiIT+658asuFzfl6YMOl3CI=;
 b=Cx38gZFtmesoyCJFad9EVzSYB/iXhPTZNlHTFtwwNyOIAuvbOW3qpct75stzUXz76zqAsl
 182fIoVAElpbLhSVaAYXuE7gkTlDiSUvN7LH9anMQHqI7TwKFOemXllNyZv8NRUCLQRU3A
 tSMQc6m2MTZbCYhGLxNsuZwoigZWSDo=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-I6QgP5tvNGWNqXw2E7Qocw-1; Mon, 26 Jun 2023 15:04:24 -0400
X-MC-Unique: I6QgP5tvNGWNqXw2E7Qocw-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-39eca17fc11so463574b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687806263; x=1690398263;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ofupP4QvlSITqeJMJYxFiIT+658asuFzfl6YMOl3CI=;
 b=ja/Uclo2FYd18vAVtmzRtUA5DjL4F5gvYez8MdLc/N7H3GfT8Ssl1bIdmHzHrs1S6e
 AAq9dMtRZ8JGhYsMceIJJaWX9nXYvJkcOva3HacMh57lOfxNOuGhXJWsoOS4T2jvUB4s
 LmXtdrM/8zTAlyFqpnvZqv/ZpTHRBaak9KI1m/d1tqiop39vOBw+ouEr9xOApIagbn9K
 I0tWTVIY0YqX7XF+A0h8iQSTH9ehffeKFI9zedS5uxpTxndOnh9uQBNSXXAR+zZdp6Su
 ujz5LdGFGXmGvm01dAw2vgLbGhG/OMtajCC2dD7FkE6oEV5uTyYqgvG8OUngDDtOWQhq
 U6dw==
X-Gm-Message-State: AC+VfDzP49siJUFfOZS6xhgfTg0aqxEMny86d4q6iu60kyAFiiDSq36a
 bBbONN6N3RcEzwWxQ1Xkg9DfqR/ewvu34r/a1Ro4I07OwA13hcr8o/YKej2GXPfsZqw7i1EDYoY
 SWQYzvOabpp8kxPNorCOaHOZs5O55
X-Received: by 2002:a05:6830:30a1:b0:6b7:1652:3b3c with SMTP id
 g33-20020a05683030a100b006b716523b3cmr8763068ots.3.1687806263584; 
 Mon, 26 Jun 2023 12:04:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7V6roZ8/MQOmJ54BohE4xp+1si7arBTh3odoYo8M/0sNEjaP/dvTQI+P3mM8i+MuqGw8QtFg==
X-Received: by 2002:a05:6830:30a1:b0:6b7:1652:3b3c with SMTP id
 g33-20020a05683030a100b006b716523b3cmr8763046ots.3.1687806263348; 
 Mon, 26 Jun 2023 12:04:23 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 k28-20020a05620a143c00b0075785052e97sm2992025qkj.95.2023.06.26.12.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 12:04:23 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:04:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJnhNSmSv8ynHu3U@x1n>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n>
 <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
 <ZJnWiDhrmL0lnyUv@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ZJnWiDhrmL0lnyUv@nvidia.com>
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

On Mon, Jun 26, 2023 at 03:18:48PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 26, 2023 at 08:14:27PM +0200, David Hildenbrand wrote:
> 
> > So we might have to implement the same page migration as gup does on
> > FOLL_LONGTERM here ... maybe there are more such cases/drivers that actually
> > require that handling when simply taking pages out of the memfd, believing
> > they can hold on to them forever.
> 
> In general I would like to see an interface to FOLL_LONGTERM pin pages
> from a memfd. I would quite happily use that in iommufd as well.
> 
> It solves some problems we have there with fork/exec/etc if the pages
> are not linked to a mm_struct.

Afaiu any fd based approach should mean it'll never work with private
memories, while mm-based should be able to work on any kind.  Maybe that's
not a problem - I assume at least udmabuf should just only work with shared
memories; not sure on iommufd, though.

-- 
Peter Xu

