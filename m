Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2134FA84
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 09:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A496E9FA;
	Wed, 31 Mar 2021 07:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C1C6E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617176515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FFrGhW64gARZeezTS1TDFmfI/cayC6jmuUvW0N7W42w=;
 b=QuHvJUkwlmu5bUtw2QrnVSFpPHjDrQl1ZwQ7qWvvc+wZFzJ/SECYs/rNr+BxYmKNQGh1vG
 OgdmNNyae/a3mgnQOLVjNgO+eH8AH+d/SePU9rN+N9u/piER/ESDqk9zfkUlipfwU4s0oG
 9mIrPnBKmGc6pjC/NmjgY2rIjUE70+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-sD00I4yaNHOh8LI6y0C9lw-1; Wed, 31 Mar 2021 03:41:52 -0400
X-MC-Unique: sD00I4yaNHOh8LI6y0C9lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C78107B82D;
 Wed, 31 Mar 2021 07:41:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C02575D9D0;
 Wed, 31 Mar 2021 07:41:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4DE51800842; Wed, 31 Mar 2021 09:41:49 +0200 (CEST)
Date: Wed, 31 Mar 2021 09:41:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/2] drm/virtio: Create Dumb BOs as guest Blobs
Message-ID: <20210331074149.jdvbdbvyilzfk6ua@sirius.home.kraxel.org>
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 08:04:38PM -0700, Vivek Kasireddy wrote:
> If support for Blob resources is available, then dumb BOs created
> by the driver can be considered as guest Blobs. And, for guest
> Blobs, there is no need to do any transfers or flushes

No.  VIRTGPU_BLOB_FLAG_USE_SHAREABLE means the host (aka device in
virtio terms) *can* create a shared mapping.  So, the guest sends still
needs to send transfer commands, and then the device can shortcut the
transfer commands on the host side in case a shared mapping exists.

flush commands are still needed for dirty tracking.

> but we do need to do set_scanout even if the FB has not changed as
> part of plane updates.

Sounds like you workaround host bugs.  This should not be needed with
properly implemented flush.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
