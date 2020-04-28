Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A21BBAC9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 12:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AD26E170;
	Tue, 28 Apr 2020 10:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EA16E170
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588068517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWZzpPWI309eQ5heatyd+Lh2e6+CyRm6BeOiXCHILg4=;
 b=PMyVKfdwWdeorNiJdgjOsm19onOJRaEQZQRVv+gHON85RJMOhi6ow2zcBKvUuPhZqGwi9C
 qpK5NJuk+/ExkevFtoZk7W6IqmAZwIUz9LBLHGUfkCRelBDq9LaUFKtBmzWqkAO8TSkweq
 w6t7zPvoUgIpn6OAax6yg1HzVJwxfYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-i9eRR77nP2uZiUf26ZEegg-1; Tue, 28 Apr 2020 06:08:34 -0400
X-MC-Unique: i9eRR77nP2uZiUf26ZEegg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE5921005510;
 Tue, 28 Apr 2020 10:08:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 885A55D9E2;
 Tue, 28 Apr 2020 10:08:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 62B4C9D98; Tue, 28 Apr 2020 12:08:31 +0200 (CEST)
Date: Tue, 28 Apr 2020 12:08:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH] drm/qxl: lost qxl_bo_kunmap_atomic_page in
 qxl_image_init_helper()
Message-ID: <20200428100831.a4525pdp335ffkgi@sirius.home.kraxel.org>
References: <d0d96600-b147-0c44-f551-97a66083518d@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d0d96600-b147-0c44-f551-97a66083518d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 10:55:27AM +0300, Vasily Averin wrote:
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
> ---
>  drivers/gpu/drm/qxl/qxl_image.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_image.c b/drivers/gpu/drm/qxl/qxl_image.c
> index 43688ecdd8a0..7270da62fc29 100644
> --- a/drivers/gpu/drm/qxl/qxl_image.c
> +++ b/drivers/gpu/drm/qxl/qxl_image.c
> @@ -212,6 +212,7 @@ qxl_image_init_helper(struct qxl_device *qdev,
>  		break;
>  	default:
>  		DRM_ERROR("unsupported image bit depth\n");
> +		qxl_bo_kunmap_atomic_page(qdev, image_bo, ptr);
>  		return -EINVAL; /* TODO: cleanup */

I guess you can ditch the TODO comment now, it's done ;)

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
