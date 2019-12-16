Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C9120431
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 12:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09CE6E4CF;
	Mon, 16 Dec 2019 11:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D69D6E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576496536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tF3J5o1PPfUY0ZGM4Xzpt7UUZf+Ytex+QZplyE4Anlk=;
 b=Mhd571EKujE5I44yyFsZ6vWpUkDQuO60dqXXSVlWSxXIhIWbY8AkquG8VKCeUn3V34l+Za
 X9MW0tfcp0jJwqn5nVMeIQnPO5Yi1u9qVJ6qpwqGQ3HiotZfXioebSM8wMUX0lpoig24VO
 wTSsvDHzOFyBL2GDGonemvQu/a4FQxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75--M36LcxoPQOk_zwHzvDNdA-1; Mon, 16 Dec 2019 06:42:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C291800D7B;
 Mon, 16 Dec 2019 11:42:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61D616700B;
 Mon, 16 Dec 2019 11:42:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D04D9DA5; Mon, 16 Dec 2019 12:42:07 +0100 (CET)
Date: Mon, 16 Dec 2019 12:42:07 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] udmabuf: fix dma-buf cpu access
Message-ID: <20191216114207.g7afikcr4fssgx72@sirius.home.kraxel.org>
References: <20191213193359.1603-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191213193359.1603-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: -M36LcxoPQOk_zwHzvDNdA-1
X-Mimecast-Spam-Score: 0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 11:33:59AM -0800, Gurchetan Singh wrote:
> I'm just going to put Chia's review comment here since it sums
> the issue rather nicely:
> 
> "(1) Semantically, a dma-buf is in DMA domain.  CPU access from the
> importer must be surrounded by {begin,end}_cpu_access.  This gives the
> exporter a chance to move the buffer to the CPU domain temporarily.
> 
> (2) When the exporter itself has other means to do CPU access, it is
> only reasonable for the exporter to move the buffer to the CPU domain
> before access, and to the DMA domain after access.  The exporter can
> potentially reuse {begin,end}_cpu_access for that purpose.
> 
> Because of (1), udmabuf does need to implement the
> {begin,end}_cpu_access hooks.  But "begin" should mean
> dma_sync_sg_for_cpu and "end" should mean dma_sync_sg_for_device.
> 
> Because of (2), if userspace wants to continuing accessing through the
> memfd mapping, it should call udmabuf's {begin,end}_cpu_access to
> avoid cache issues."
> 
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Suggested-by: Chia-I Wu <olvaffe@gmail.com>
> Fixes: 284562e1f34 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")

Needs 12 hash digits.

Also your signed-off is missing ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
