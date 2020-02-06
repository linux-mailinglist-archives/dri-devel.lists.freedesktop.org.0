Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E61542E3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 12:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23F6EA2A;
	Thu,  6 Feb 2020 11:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D7F6EA2A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580987854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcOFw0kS0tOXMwl8fehUsUXL6QSE/ZK82JHK6FDpPfs=;
 b=DVU1mAWoMOIDt3z82bKT2hbbJXjibZspnFrQz7AiLHJ8a3l9z2Q9A5E+L03hbV7Aw0waBy
 qd+J70qRRnc/zfVTiUp2dABR3wpSHrQpWQgtoUiS9CzjU/y7ZGcS/lconOLRxma1ACg3iJ
 8DBPNOOC1nK0WYnMHYhpUk4uo3uTa1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-P43sy3VlO8W4MubjKNek_g-1; Thu, 06 Feb 2020 06:17:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF8911005513;
 Thu,  6 Feb 2020 11:17:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8210A5C1D8;
 Thu,  6 Feb 2020 11:17:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE2B61747D; Thu,  6 Feb 2020 12:17:28 +0100 (CET)
Date: Thu, 6 Feb 2020 12:17:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH 00/11] drm/virtio: fixes and cleanups for vbuf queuing
Message-ID: <20200206111728.2zq6ytigknkqjdik@sirius.home.kraxel.org>
References: <20200205181955.202485-1-olvaffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: P43sy3VlO8W4MubjKNek_g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 05, 2020 at 10:19:44AM -0800, Chia-I Wu wrote:
> This series consists of fixes and cleanups for
> virtio_gpu_queue_fenced_ctrl_buffer, except for the last patch.  The fixes are
> for corner cases that were overlooked.  The cleanups make the last patch
> easier, but they should be good in themselves as well.

Pushed most patches.

> The last patch changes the disable_notify mechanism to call
> virtqueue_kick_prepare only once in virtio_gpu_enable_notify.  It should be
> more efficient than doing that after each command is queued.
> 
> There is a follow-up patch that replaces the global disable_notify state by
> command-level bools to disable notify for individual commands, so that one
> process cannot affect another process.  I can include it in v2 if you want to
> review it together with this series.

Can you rebase & resend so I can see all notify patches together?

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
