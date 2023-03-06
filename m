Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB556AC3B4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCB310E0EB;
	Mon,  6 Mar 2023 14:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B8910E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678114007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ePnoIICLAgX5+yYDBioH0vdLJ6br42cKaUY5oT5Uciw=;
 b=Y2RDdAHSwbhMF4FWuM3uk1BtjZbj/mZjA8mwAs2/jiJG6vz5NvPI+7icdsKlI+iXpd/XPj
 mdkLButgANJvj14A5Oi22LrJOOdCsRaojr4uoCxTBmD7FKHjnGZyIr4wHoeP4j6NI+bLN4
 wg6mkT5x/7Bvk0Ju0tRA+zhVr9bdmPc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-su8vUQvyPQKmkMm2FULrTQ-1; Mon, 06 Mar 2023 09:46:43 -0500
X-MC-Unique: su8vUQvyPQKmkMm2FULrTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D50B229AA39C;
 Mon,  6 Mar 2023 14:46:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87CDE1410DD9;
 Mon,  6 Mar 2023 14:46:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 05829180062C; Mon,  6 Mar 2023 15:46:40 +0100 (CET)
Date: Mon, 6 Mar 2023 15:46:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS
 option
Message-ID: <20230306144640.ta7jca5iabg66uoy@sirius.home.kraxel.org>
References: <20230306143234.1561759-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306143234.1561759-1-dmitry.osipenko@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 05:32:34PM +0300, Dmitry Osipenko wrote:
> VirtIO-GPU got a new config option for disabling KMS. There were two
> problems left unnoticed during review when the new option was added:
> 
> 1. The IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) check in the code was
> inverted, hence KMS was disabled when it should be enabled and vice versa.
> 
> 2. The disabled KMS crashed kernel with a NULL dereference in
> drm_kms_helper_hotplug_event(), which shall not be invoked with a
> disabled KMS.
> 
> Fix the inverted config option check in the code and skip handling the
> VIRTIO_GPU_EVENT_DISPLAY sent by host when KMS is disabled in guest to fix
> the crash.
> 
> Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> Changelog:
> 
> v2: - Moved the "has_edid" under the "num_scanouts" condition, like was
>       suggested by Gerd Hoffmann.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

