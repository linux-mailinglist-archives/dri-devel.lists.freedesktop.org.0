Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BD32D4CD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 15:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1596C6E08C;
	Thu,  4 Mar 2021 14:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E916E08C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614866715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gi/yGajaf3SMna61+RAAFw6EekuINRnWYi2eY6pg8/4=;
 b=CfpoOMoHFs42B4I+KspJON+6XzaIFphcf4ZKvAcgpL11myQd2f9qfHf4V8dW868i6+OO1P
 vSUnCEpOzKyvjgY1IJolXJO3MicDafng8WCVSPr2ZHYk885JctdF1Lb8lPf4KYrR/49Ahl
 XO0rUQmW8MJN/xRBjOk3xNKORTYHVcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-N3kIRfZyOp-EMq-4lRO_FQ-1; Thu, 04 Mar 2021 09:05:13 -0500
X-MC-Unique: N3kIRfZyOp-EMq-4lRO_FQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5BF01019623;
 Thu,  4 Mar 2021 14:05:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9111760CCB;
 Thu,  4 Mar 2021 14:05:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A7A9018000A7; Thu,  4 Mar 2021 15:05:09 +0100 (CET)
Date: Thu, 4 Mar 2021 15:05:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: soften TTM warnings
Message-ID: <20210304140509.u33mxittujxubaaj@sirius.home.kraxel.org>
References: <20210303155757.82497-1-christian.koenig@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210303155757.82497-1-christian.koenig@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 03, 2021 at 04:57:57PM +0100, Christian K=F6nig wrote:
> QXL indeed unrefs pinned BOs and the warnings are spamming peoples log fi=
les.
> =

> Make sure we warn only once until the QXL driver is fixed.

> -	dma_resv_assert_held(bo->base.resv);
> +	if (!bo->deleted)
> +		dma_resv_assert_held(bo->base.resv);

Hmm?  I'm not aware of qxl having problems with this one.
Did I miss something?

> -		if (WARN_ON(bo->pin_count)) {
> +		if (WARN_ON_ONCE(bo->pin_count)) {

Well, as temporary thing this is rather pointless, qxl fix for this one
is already queued in drm-misc-fixes so this would only land after the
qxl fixes ...

But I think using WARN_ON_ONCE() is a good idea in general, especially
in a code path like this where a single bug can easily cause a flood of
stack traces.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
