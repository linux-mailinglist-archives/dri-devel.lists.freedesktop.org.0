Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47D23ED6E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 14:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02C6E0EF;
	Fri,  7 Aug 2020 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55A46E0EF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596804197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=273fiZa3j2YUsHYvjEo3xvFBeJLIY7mZ32ur6GZf0EM=;
 b=XqMkbfgO1hznnaFnBPwEKMfyBBDqWWWI76vPQteuDaUzCQgGOhTSjE7SckZM9stFbjdM6H
 IyPFUG3Mg9t/f37oIO6KQ7rKzlmNlGZKozmTL5sBQJ8k0mOL0z1OKljvhB9JtMdvYTZd1V
 nKgwHqnU5BPeAtk3NNrIHIlDCJWJ2Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-8ExUZS9hO7iDqC6bCcjDtg-1; Fri, 07 Aug 2020 08:43:14 -0400
X-MC-Unique: 8ExUZS9hO7iDqC6bCcjDtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 549B718A1DFB;
 Fri,  7 Aug 2020 12:43:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9E377B932;
 Fri,  7 Aug 2020 12:43:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 001E99CBC; Fri,  7 Aug 2020 14:43:10 +0200 (CEST)
Date: Fri, 7 Aug 2020 14:43:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xin He <hexin.op@bytedance.com>
Subject: Re: [PATCH] drm/virtio: fix memory leak in virtio_gpu_cleanup_object()
Message-ID: <20200807124310.cmhbj6bj76twdtaw@sirius.home.kraxel.org>
References: <20200722051851.72662-1-hexin.op@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722051851.72662-1-hexin.op@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Qi Liu <liuqi.16@bytedance.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 01:18:51PM +0800, Xin He wrote:
> Before setting shmem->pages to NULL, kfree() should
> be called.

>  			sg_free_table(shmem->pages);
> +			kfree(shmem->pages);
>  			shmem->pages = NULL;

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
