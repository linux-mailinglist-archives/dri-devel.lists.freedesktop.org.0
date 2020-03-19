Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E6918B07C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 10:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C996E9C6;
	Thu, 19 Mar 2020 09:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5376E9C6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584611267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApjThLIcE4LB6JPjks8fWlGuf93oH+25mXjzUZ9Ed2o=;
 b=FH0HXkRpgY/EkFBzzTL0KRfG+wOYMHvrV7ztF/WjEuz+ZIasDQGbP2sRNjS3/ThvNHsGWt
 idIZLw1t5Da3LoMeDo4IE3jWAREvE9l+OAkuiEs7Z2VQj5VnUQ2puB8Ws2yeyxQGRANnhw
 1Dx5VT3boNnezcNss3qLE02BeHiJ54g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-BT4xJyWQNyeFJ-JBivD04A-1; Thu, 19 Mar 2020 05:47:42 -0400
X-MC-Unique: BT4xJyWQNyeFJ-JBivD04A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D83AA1361;
 Thu, 19 Mar 2020 09:47:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD4C60BEE;
 Thu, 19 Mar 2020 09:47:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5159917444; Thu, 19 Mar 2020 10:47:40 +0100 (CET)
Date: Thu, 19 Mar 2020 10:47:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/virtio: factor out the sg_table from
 virtio_gpu_object
Message-ID: <20200319094740.jmjijfj2zk3a4vic@sirius.home.kraxel.org>
References: <20200305013212.130640-1-gurchetansingh@chromium.org>
 <cc18ed7f-3264-0d38-b772-64d79244f52d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cc18ed7f-3264-0d38-b772-64d79244f52d@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 10:32:25AM +0100, Jiri Slaby wrote:
> On 05. 03. 20, 2:32, Gurchetan Singh wrote:
> > A resource will be a shmem based resource or a (planned)
> > vram based resource, so it makes sense to factor out common fields
> > (resource handle, dumb).
> > 
> > v2: move mapped field to shmem object
> 
> Hi,
> 
> I bisected the slab-out-of-bounds below to this patch. Is it known?

No.  I suspect sizeof(virtio_gpu_object) instead of
sizeof(virtio_gpu_object_shmem) for allocation, I'll have a look ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
