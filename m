Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FCC3DA092
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7D6ED0D;
	Thu, 29 Jul 2021 09:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DC96ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627552237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k8qCqy6D9MqH7UW8JgkH4iPo0qZlRfgs6J7Mt6VZ8zE=;
 b=HusWssNmxRlbGRn6j+BJzr3lus4AIQp47ySIPCG2uCtJ8ZCz/iSoFwDKvhri7w9RaNKIvX
 S7wB9gO3qFgecRjwnEszVQRKuR5P520phSohu1rO3iBK0b3OxlvWlj1NyK9w5+TLHqM3e3
 g1GIHI82C/zIj+T6OTuUtuKKXAcUFSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-VZwuL3iLNkWtRSrGlMDvjA-1; Thu, 29 Jul 2021 05:50:35 -0400
X-MC-Unique: VZwuL3iLNkWtRSrGlMDvjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E35EB190A7A1;
 Thu, 29 Jul 2021 09:50:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD525100F49F;
 Thu, 29 Jul 2021 09:50:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 12C301800382; Thu, 29 Jul 2021 11:50:33 +0200 (CEST)
Date: Thu, 29 Jul 2021 11:50:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 2/4] virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
Message-ID: <20210729095033.js2i6bjk27itcvhg@sirius.home.kraxel.org>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <20210729081659.2255499-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210729081659.2255499-3-vivek.kasireddy@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 01:16:57AM -0700, Vivek Kasireddy wrote:
> This feature enables the Guest to wait to know when a resource
> is completely consumed by the Host.

virtio spec update?

What are the exact semantics?

Why a new command?  Can't you simply fence one of the commands sent
anyway (set_scanout probably for page-flip updates)?

(feature flag is probably needed even in case we don't need a new
command to make sure the host sends the completion when processing
the command is actually done, i.e. in case of qemu the recently added
fence support is there).

take care,
  Gerd

