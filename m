Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B388CCE2F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 10:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4523610E035;
	Thu, 23 May 2024 08:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LjpcW+1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B83A10E035
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716452894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0h4bSJx94/nThvDpf/w5J6MN/x07lJ8LeO0GMKh0RY=;
 b=LjpcW+1gOvdV+pm9WNMi/zRD8kwR6FGw3uXzirGanG3xR+ZlACb+P72KUdxxQRiRV7nDC1
 GeWDeqU6Bn8AUfyYz6li74YbiYoNa2tFax2HF4yFd9Km4xSWfJZiiLyyDLYOtUPwKxAD0i
 3rCyu/BBcYEIwUW3WM9xuBEAt+nNIjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-HZhnPYhhPM-aQLkYZK5Csg-1; Thu, 23 May 2024 04:28:09 -0400
X-MC-Unique: HZhnPYhhPM-aQLkYZK5Csg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1E7D185A783;
 Thu, 23 May 2024 08:28:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A92492BC6;
 Thu, 23 May 2024 08:28:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C50D1801000; Thu, 23 May 2024 10:28:07 +0200 (CEST)
Date: Thu, 23 May 2024 10:28:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, 
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 Dongwon Kim <dongwon.kim@intel.com>, Junxiao Chang <junxiao.chang@intel.com>
Subject: Re: [PATCH v14 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Message-ID: <awodz2vwnicscpyoqrp6bqdtgetv3h7wvifdxk4u7bvlczspog@qgy3isyuwkfp>
References: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
 <CAPM=9tyuX7DKxaQ1zT7b4NYqhnjA3uLHK-kxXgeiubTZcy42=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPM=9tyuX7DKxaQ1zT7b4NYqhnjA3uLHK-kxXgeiubTZcy42=w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 23, 2024 at 01:13:11PM GMT, Dave Airlie wrote:
> Hey
> 
> Gerd, do you have any time to look at this series again, I think at
> v14 we should probably consider landing it.

Phew.  Didn't follow recent MM changes closely, don't know much about
folios beyond LWN coverage.  The changes look sane to my untrained eye,
I wouldn't rate that a 'review' though.

The patch series structure looks a bit odd, with patch #5 adding hugetlb
support, with the functions added being removed again in patch #7 after
switching to folios.  But maybe regression testing the series is easier
that way ...

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

