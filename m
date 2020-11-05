Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CE2A7797
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 07:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3096E147;
	Thu,  5 Nov 2020 06:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0236E97C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604559162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K5R6JGiYe4/u2K6/yJ14UH2NO+ZUGFzIOqRPQLmETsU=;
 b=BZ9kYKJCYBqa3kerMr/hC7IXA5AkjQUBoYh1742a3PFVRDGCpJIk0g8bmkPmCqlb0qCQG+
 6qsCraPDw/vCpdJ1QQvZMltzfTh/PVe9Ratr3D35/E2XjForMsVys5Hs87b/qL2L8j/Xuc
 Dq7ih6MkAqZqPXjXXzUmM364cUuwAzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-s43WvTDkOEyEdii-a-OWkw-1; Thu, 05 Nov 2020 01:52:38 -0500
X-MC-Unique: s43WvTDkOEyEdii-a-OWkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4254E8015AD;
 Thu,  5 Nov 2020 06:52:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB1095D9D5;
 Thu,  5 Nov 2020 06:52:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DC06D16E18; Thu,  5 Nov 2020 07:52:33 +0100 (CET)
Date: Thu, 5 Nov 2020 07:52:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] drm/virtio: use kvmalloc for large allocations
Message-ID: <20201105065233.3td3zuyfmbypjtvq@sirius.home.kraxel.org>
References: <20201105014744.1662226-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105014744.1662226-1-senozhatsky@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> -	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
> -			      GFP_KERNEL);
> +	*ents = kvmalloc_array(*nents,
> +			       sizeof(struct virtio_gpu_mem_entry),
> +			       GFP_KERNEL);

Shouldn't that be balanced with a kvfree() elsewhere?

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
