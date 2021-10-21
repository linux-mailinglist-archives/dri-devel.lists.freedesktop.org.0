Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86029435DDD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B602C6E422;
	Thu, 21 Oct 2021 09:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299DF6E422
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634808343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YJQKG503ZNKkyZmKV0Jhtz+/MLcMYe7jL+aDtTbLusA=;
 b=QZpSTGQv5gWPR6Ulu2qeJTCUTkh+PXaduhVUAXWdNGqdI4K49wZaXtzG0mWjCCOH+u5wCH
 pUCPrQ+7TRoIqiChgWZjN8AQCKaClaowjLvSggME5lUevUFnK9nrsip1QiExHPMwhULJmM
 EzOaX0U8umLlIQ0KWSA4O4MfDej08V0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-iixGFGxMPGSxaTRYOLSRlw-1; Thu, 21 Oct 2021 05:25:39 -0400
X-MC-Unique: iixGFGxMPGSxaTRYOLSRlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C49B1922960;
 Thu, 21 Oct 2021 09:25:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 373B15BAE0;
 Thu, 21 Oct 2021 09:25:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 616C31800796; Thu, 21 Oct 2021 11:25:35 +0200 (CEST)
Date: Thu, 21 Oct 2021 11:25:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Maksym Wezdecki <maksym.wezdecki@collabora.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 mwezdeck <maksym.wezdecki@collabora.co.uk>
Subject: Re: drm/virtio: not pin pages on demand
Message-ID: <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 09:44:45AM +0200, Maksym Wezdecki wrote:
> From: mwezdeck <maksym.wezdecki@collabora.co.uk>
> 
> The idea behind the commit:
>   1. when resource is created, let user space decide
>      if resource should be pinned or not
>   2. transfer_*_host needs pinned memory. If it is not
>      pinned, then pin it.
>   3. during execbuffer, decide which bo handles should
>      be pinned based on the list provided by user space

When you never need cpu access to your gpu object there is
no need to create a resource in the first place.

take care,
  Gerd

