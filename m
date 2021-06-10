Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A013A2430
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 08:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4894A89ECB;
	Thu, 10 Jun 2021 06:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EEC89ECB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JRw5lgrbA7fyrbkqiv9jB2Df65JgPP8snIVezls47GA=;
 b=DEBrlGmzNbh9SClfUCHHB6Fvre/qQQ035evkBGuVfVqMjWPXXkJVXWaMHy/wxUph6/VkTz
 /+86o/10+aZC/TZeqroWphMyyd7d4qufWax4F2Hn4Id0OIgJXi0n7YdtRAHwgKWtFGd8Kr
 Jyh+CbrFclAZFut3tZdHq+yLuA0iSWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Y2ikUTidPb6vAoy03MBV-A-1; Thu, 10 Jun 2021 02:01:21 -0400
X-MC-Unique: Y2ikUTidPb6vAoy03MBV-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 438298049C5;
 Thu, 10 Jun 2021 06:01:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B531610016F4;
 Thu, 10 Jun 2021 06:01:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 22A3E18000B2; Thu, 10 Jun 2021 08:01:18 +0200 (CEST)
Date: Thu, 10 Jun 2021 08:01:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] udmabuf: Add support for mapping hugepages (v4)
Message-ID: <20210610060118.hbkckbv5qsphgnq5@sirius.home.kraxel.org>
References: <20210609065640.an5vxoup7yesenwb@sirius.home.kraxel.org>
 <20210609182915.592743-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210609182915.592743-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 11:29:15AM -0700, Vivek Kasireddy wrote:
> If the VMM's (Qemu) memory backend is backed up by memfd + Hugepages
> (hugetlbfs and not THP), we have to first find the hugepage(s) where
> the Guest allocations are located and then extract the regular 4k
> sized subpages from them.
> 
> v2: Ensure that the subpage and hugepage offsets are calculated correctly
> when the range of subpage allocations cuts across multiple hugepages.
> 
> v3: Instead of repeatedly looking up the hugepage for each subpage,
> only do it when the subpage allocation crosses over into a different
> hugepage. (suggested by Gerd and DW)
> 
> v4: Fix the following warning identified by checkpatch:
> CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>

> +					hpage = find_get_page_flags(mapping,
> +							pgoff, FGP_ACCESSED);

checkpatch is still not happy.  Fixed that up & pushed to drm-misc-next.

thanks,
  Gerd

