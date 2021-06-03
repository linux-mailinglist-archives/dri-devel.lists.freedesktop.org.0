Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F79399DFA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B126ECA2;
	Thu,  3 Jun 2021 09:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126EE6E0EB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622713468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vC5rGzm6on6bXKfFOO2UymBEC8RbfHFYmhvbvZmpg4w=;
 b=V535i3AaZi52xJ2z6Zqkk8ZfGSPoELwKMGBdzxdSa53jsh1IJTWAjkaf+iQstCuaCu76Mc
 d5YYF05ZjMH/U0s0Z9M5ZpCEvjt4vrHn8iw9znyG4Tx/Am17nHgT8qHvEDXggPNFOp+OAo
 m0uQPZHGk+SO7FL+EGD/jw5mUZUkHsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-KwsqpEpPMKGCOjQ0kfwU4A-1; Thu, 03 Jun 2021 05:44:27 -0400
X-MC-Unique: KwsqpEpPMKGCOjQ0kfwU4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35F84106BB29;
 Thu,  3 Jun 2021 09:44:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0010861008;
 Thu,  3 Jun 2021 09:44:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B46B18000B2; Thu,  3 Jun 2021 11:44:24 +0200 (CEST)
Date: Thu, 3 Jun 2021 11:44:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] udmabuf: Add support for mapping hugepages
Message-ID: <20210603094424.p6hx7dx42nkmzoqz@sirius.home.kraxel.org>
References: <20210603085231.285768-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210603085231.285768-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

> +		if (is_file_hugepages(memfd)) {
> +			hpstate = hstate_file(memfd);
> +			pgoff = list[i].offset >> huge_page_shift(hpstate);
> +			subpgoff = (list[i].offset &
> +				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
> +			hpage = find_get_page_flags(
> +					file_inode(memfd)->i_mapping,
> +					pgoff, FGP_ACCESSED);
> +			if (IS_ERR(hpage)) {
> +				ret = PTR_ERR(hpage);
>  				goto err;
>  			}
> +		}
> +		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
> +			if (is_file_hugepages(memfd)) {
> +				page = hpage + subpgoff + pgidx;
> +				get_page(page);

Hmm.  Does this work in case the page range spans multiple huge pages?

take care,
  Gerd

