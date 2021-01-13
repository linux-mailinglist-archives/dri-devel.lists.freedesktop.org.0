Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C62F5057
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 17:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18C6EB43;
	Wed, 13 Jan 2021 16:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC296EB33
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610556475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMP7Uu1omhLwuQabuN/ve5GPqmI9hcJSvp6O8aAN+hk=;
 b=F/V9/nNYQpSTz2M7dfWPwvHbi5StfvzYLZtMzUzlOFZ0cwOa0/pUp7IHvg97p78e9gD018
 NzwT9WwUeXHp0sFkLAQJg3wL6At43/Dy1sPge0EMGZfChe5dGcWNmXBasIt/IV52KeBRG2
 OvgW4mrqTWe7Kz3c49rHNwmiyu3k2To=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-OEGxfA5QMVy3HCehMr_M6A-1; Wed, 13 Jan 2021 11:47:51 -0500
X-MC-Unique: OEGxfA5QMVy3HCehMr_M6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6BA7806660;
 Wed, 13 Jan 2021 16:47:49 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.rdu2.redhat.com [10.10.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 431A81001901;
 Wed, 13 Jan 2021 16:47:49 +0000 (UTC)
Date: Wed, 13 Jan 2021 11:47:47 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
Message-ID: <20210113164747.GA521755@redhat.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jglisse@redhat.com
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
Cc: alex.sierra@amd.com, philip.yang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 10:00:52PM -0500, Felix Kuehling wrote:
> This is the first version of our HMM based shared virtual memory manager
> for KFD. There are still a number of known issues that we're working thro=
ugh
> (see below). This will likely lead to some pretty significant changes in
> MMU notifier handling and locking on the migration code paths. So don't
> get hung up on those details yet.

[...]

> Known issues:
> * won't work with IOMMU enabled, we need to dma_map all pages properly
> * still working on some race conditions and random bugs
> * performance is not great yet

What would those changes looks like ? Seeing the issue below i do not
see how they inter-play with mmu notifier. Can you elaborate.

Cheers,
J=C3=A9r=C3=B4me

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
