Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1C6A5959
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8293910E6B1;
	Tue, 28 Feb 2023 12:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB6210E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677588387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AR9g0+21GGmCwkSUOYa0isQeV+cYWFL+wM4f9rZ618=;
 b=LPz+y+Slbw9VhMVrHFyE0vtbtP+wiS3LzTbE14TPJf9WQPjZ2sTrIRG0phDQxR1nU4F2sW
 QdCHkCZloS77Y7iRNkTF6tuVOIMmVt8+aHmYOkkktRyfSWNruUlxOPGCIPolR6g5SCBFtS
 jqn1qBkZtd0F8qKgmaFJZhTBi0aOE+c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-q4eF9EK2NU6fW6LtVkickg-1; Tue, 28 Feb 2023 07:46:22 -0500
X-MC-Unique: q4eF9EK2NU6fW6LtVkickg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC83838221C3;
 Tue, 28 Feb 2023 12:46:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EE90492B0E;
 Tue, 28 Feb 2023 12:46:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C10E180099A; Tue, 28 Feb 2023 13:46:20 +0100 (CET)
Date: Tue, 28 Feb 2023 13:46:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
Message-ID: <20230228124620.pfjvj372rifiljew@sirius.home.kraxel.org>
References: <20230227173800.2809727-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227173800.2809727-1-robdclark@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +		if (!vgdev->num_scanouts) {
> +			/*
> +			 * Having an EDID but no scanouts is non-sensical,
> +			 * but it is permitted to have no scanouts and no
> +			 * EDID (in which case DRIVER_MODESET and
> +			 * DRIVER_ATOMIC are not advertised)
> +			 */
> +			if (vgdev->has_edid) {
> +				DRM_ERROR("num_scanouts is zero\n");

That error message isn't very clear.

Also I'd suggest to just drop the edid check.  It's about commands
being supported by the device, not about the actual presence of an EDID
blob, so the check doesn't look very useful to me.

take care,
  Gerd

