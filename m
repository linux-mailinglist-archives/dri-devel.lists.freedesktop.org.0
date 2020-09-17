Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E024326D7D9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 11:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4697A6E0E7;
	Thu, 17 Sep 2020 09:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D5D6E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600335628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bx8f5r0AzEc+1pKeIgZVZRf40dmO6jysVcMGVhNl7v8=;
 b=BIREgHcq2rE4H9O1NY1vvtoR7lpdOMYiqdsvI4ONFkkrsFVwyK7s8AUUck6Bej4j6L8Fyw
 9ci45dAxExsbOSlXnGtonumClPJqUyDSd/Koryba0SpFr0dFnqle/8HhK2FG5yWtk0pQXF
 noDFJ3FstF4UJiI0AYXo8YJA1Lnj6tM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-2V0qrlEzPLCfl4oDtpwRGA-1; Thu, 17 Sep 2020 05:40:26 -0400
X-MC-Unique: 2V0qrlEzPLCfl4oDtpwRGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97FD58015A4;
 Thu, 17 Sep 2020 09:40:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C74860FC2;
 Thu, 17 Sep 2020 09:40:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A6EB9D5A; Thu, 17 Sep 2020 11:40:24 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:40:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v3 09/19] drm/virtio: implement blob resources: probe for
 host visible region
Message-ID: <20200917094024.3d5savf3pshlst7z@sirius.home.kraxel.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
 <20200917000838.735-9-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200917000838.735-9-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
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

  Hi,

> +		if (!devm_request_mem_region(&vgdev->vdev->dev,
> +					     vgdev->host_visible_region.addr,
> +					     vgdev->host_visible_region.len,
> +					     dev_name(&vgdev->vdev->dev))) {
> +			DRM_ERROR("Could not reserve host visible region\n");
> +			goto err_vqs;
> +		}

> +	if (vgdev->has_host_visible) {
> +		devm_release_mem_region(&vgdev->vdev->dev,
> +					vgdev->host_visible_region.addr,
> +					vgdev->host_visible_region.len);
> +	}

Hmm. isn't it the point of the managed apis that the release happens
automatically?  I think you don't need the devm_release_mem_region
call (it doesn't break things though).

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
