Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8411AB9E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 14:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096706EB3F;
	Wed, 11 Dec 2019 13:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396946EB3F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576069810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9eYb2Zr4aouyWVOs1ApAsQoZVXyaK3L18xDM6NySAw=;
 b=iIJM83+zPt/YdffA9ZQqL2zC9qsoLR2MnEGbyfV960UOqc2f3oAZ+Ob2pi0TNGAPMv6zep
 wB5TfKjOHVKphh186++biJ7duBQkJJs3ZzQkLFbiv7efJcQN8HSsnDyKKb9/oRy7Hdiun0
 7Me3U0oZvf0Pvv14Liq4LeeIvROqGDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-Q1qPQcIRNgi3tQPSJY7csw-1; Wed, 11 Dec 2019 08:10:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6763A800EB5;
 Wed, 11 Dec 2019 13:10:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0999960BE2;
 Wed, 11 Dec 2019 13:10:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F16D716E05; Wed, 11 Dec 2019 14:10:05 +0100 (CET)
Date: Wed, 11 Dec 2019 14:10:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 gurchetansingh@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] drm: add pgprot callback to drm_gem_object_funcs
Message-ID: <20191211131005.ojbnsu3rvorlgnof@sirius.home.kraxel.org>
References: <20191211121957.18637-1-kraxel@redhat.com>
 <20191211121957.18637-2-kraxel@redhat.com>
 <20191211123835.GZ624164@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191211123835.GZ624164@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Q1qPQcIRNgi3tQPSJY7csw-1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +	/**
> > +	 * @pgprot:
> > +	 *
> > +	 * Tweak pgprot as needed, typically used to set cache bits.
> > +	 *
> > +	 * This callback is optional.
> > +	 *
> > +	 * If unset drm_gem_pgprot_wc() will be used.
> > +	 */
> > +	pgprot_t (*pgprot)(struct drm_gem_object *obj, pgprot_t prot);
> 
> I kinda prefer v1, mostly because this is a huge can of worms, and solving
> this properly is going to be real hard (and will necessarily involve
> dma-buf and dma-api and probably more). Charging ahead here just risks
> that we dig ourselves into a corner. You're v1 is maybe not the most
> clean, but just a few code bits here&there should be more flexible and
> easier to hack on and experiment around with.

Hmm.  Second vote for v1.

Problem with v1 is that it covers mmap() only, not vmap() ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
