Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8A3DB96D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 15:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629D6F447;
	Fri, 30 Jul 2021 13:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B146F447
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627652339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EmGXHr+ayTBqOcTSU/q4uNaisPxuN90WJkfR4DqumNE=;
 b=Uux4ce8ECURKP2rqc0i6CSFs7libWDCMiznlMSdFujq1Yyj8yc61RZb/aNt6ZVCuev4UBN
 X2ZLXpxSX2eEstTaxcUrSSDlYSkJEmnEfvqN2VI+ie+RgDUSHolzXteq7fEJMHY8wZCEb5
 xvrW3HMNEG1TnVEtpXEp9s/GuH5fUSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Ze8lyl9zNiCUmLKnEiH0NA-1; Fri, 30 Jul 2021 09:38:55 -0400
X-MC-Unique: Ze8lyl9zNiCUmLKnEiH0NA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DF75760CA;
 Fri, 30 Jul 2021 13:38:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5F735D6A1;
 Fri, 30 Jul 2021 13:38:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4EFA1800905; Fri, 30 Jul 2021 15:38:50 +0200 (CEST)
Date: Fri, 30 Jul 2021 15:38:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <20210730133850.bbje7uxvrvsmuopt@sirius.home.kraxel.org>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <YQPTo0D5SZfX44dn@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> - We fix virtio to send out the completion event at the end of this entire
>   pipeline, i.e. virtio code needs to take care of sending out the
>   crtc_state->event correctly.

That sounds sensible to me.  Fence the virtio commands, make sure (on
the host side) the command completes only when the work is actually done
not only submitted.  Has recently been added to qemu for RESOURCE_FLUSH
(aka frontbuffer rendering) and doing the same for SET_SCANOUT (aka
pageflipping), then send vblank events to userspace on command
completion certainly makes sense.

take care,
  Gerd

