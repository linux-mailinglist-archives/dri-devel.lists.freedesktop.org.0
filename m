Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1B5B017A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6235C10E4DE;
	Wed,  7 Sep 2022 10:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D1210E4DE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662545778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SLJpV2WoX8SK2vuj4fI8Y4TMwvJeZNVPNe+ZDugqX0U=;
 b=G7oqIi9vXVXaEIwuiHhMylKdP8wYuThbnJPORvEu5wlTF8KvaCHSFliQE3lTtl5NSNfN+M
 xvWBKYqsVPCWhvHTC2jlbFEaH1hvxv6a6FXIseSfZDGd8/LQGOz8vpL6qhrb83Q5fXeNrT
 OLJB8jNDaaqDt1HJ/1tgfTqYH9yB2Vg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-9rAV9vdMN_uMEAynE-c_zg-1; Wed, 07 Sep 2022 06:16:15 -0400
X-MC-Unique: 9rAV9vdMN_uMEAynE-c_zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2238185A794;
 Wed,  7 Sep 2022 10:16:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE692166B26;
 Wed,  7 Sep 2022 10:16:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6EAF5180039B; Wed,  7 Sep 2022 12:16:12 +0200 (CEST)
Date: Wed, 7 Sep 2022 12:16:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: set fb_modifiers_not_supported
Message-ID: <20220907101612.wn5toutzsvi4l5tb@sirius.home.kraxel.org>
References: <20220831190601.1295129-1-olvaffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220831190601.1295129-1-olvaffe@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: Shao-Chuan Lee <shaochuan@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 virtualization@lists.linux-foundation.org, Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 12:06:01PM -0700, Chia-I Wu wrote:
> Without this, the drm core advertises LINEAR modifier which is
> incorrect.
> 
> Also userspace virgl does not support modifiers.  For example, it causes
> chrome on ozone/drm to fail with "Failed to create scanout buffer".
> 
> Fixes: 2af104290da5 ("drm: introduce fb_modifiers_not_supported flag in mode_config")
> Suggested-by: Shao-Chuan Lee <shaochuan@chromium.org>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Pushed to drm-misc-next.

thanks,
  Gerd

