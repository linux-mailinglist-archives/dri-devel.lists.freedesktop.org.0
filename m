Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3839B24F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 07:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFDF6F584;
	Fri,  4 Jun 2021 05:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF506F584
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 05:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622786348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KI/lsD7YN3ayekIoF+Pf1rDxb805wLZOEQFROCAu0t8=;
 b=iFB8ALBDNLorGr8wQl+z2bJLdbDYil7Ul5J2+c3Uvm1EqVsMQnXLXvhXhtxld0JVXb+H0f
 V3pPJQn13T88ddeVS7XQCU74EBQ7WOlkJrfq6A35R7j0uh7r+cE74d+LR0J6VtHt8ygHdd
 91OXNIGu4u89TMWLQ7XNQrWZtSlUEgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-mqdNudtlNJStb9dvufHttQ-1; Fri, 04 Jun 2021 01:59:06 -0400
X-MC-Unique: mqdNudtlNJStb9dvufHttQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 681E2180FD70;
 Fri,  4 Jun 2021 05:59:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 327F65D743;
 Fri,  4 Jun 2021 05:59:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B2C4518007A2; Fri,  4 Jun 2021 07:59:03 +0200 (CEST)
Date: Fri, 4 Jun 2021 07:59:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] udmabuf: Add support for mapping hugepages (v2)
Message-ID: <20210604055903.g2bp4vuay2555omg@sirius.home.kraxel.org>
References: <20210603094424.p6hx7dx42nkmzoqz@sirius.home.kraxel.org>
 <20210603235955.341043-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210603235955.341043-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

>  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
> +			if (is_file_hugepages(memfd)) {
> +				hpage = find_get_page_flags(
> +						file_inode(memfd)->i_mapping,
> +						pgoff, FGP_ACCESSED);
> +				if (IS_ERR(hpage)) {
> +					ret = PTR_ERR(hpage);
> +					goto err;
> +				}
> +
> +				page = hpage + (subpgoff % maxsubpgs);
> +				get_page(page);
> +				put_page(hpage);

if (hpage && subpgoff == maxsubpgs) {
	put_page(hpage);
	hpage = NULL;
}
if (!hpage) {
	hpage = find_get_page_flags(...)
	[ ... ]
}

Only lookup the huge page when you cross a hugepage border.

take care,
  Gerd

