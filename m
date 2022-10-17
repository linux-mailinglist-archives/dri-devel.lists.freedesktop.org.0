Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF1F6016EC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1604189D39;
	Mon, 17 Oct 2022 19:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3089D39
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666033692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilwCj0pj+SOs8iCCQ1o/T1oYMlaK8E4LhEeUqd7n7xM=;
 b=TkyDh4SOulAo8fIC1o2ll3u1oYlByEnhR9Cs3o2JZPnpUihrMBdGXgSWHK/IqYgNcVrbZe
 G8pfXUlqGvFqhg6gmkEGI8lLQ5RxxcsnI9D9wIp3dNvbZSRejm8ZA5pU8lSYOOuO5r8ZuF
 9WO2fonS/RltqV3rI1e26jHvd/d/fF0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-s5fPsSMQP3qi3hF5Sd6BIQ-1; Mon, 17 Oct 2022 15:08:04 -0400
X-MC-Unique: s5fPsSMQP3qi3hF5Sd6BIQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 q20-20020ad44354000000b004afb5a0d33cso7326532qvs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 12:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ilwCj0pj+SOs8iCCQ1o/T1oYMlaK8E4LhEeUqd7n7xM=;
 b=esCjtXiUElT5AzYMt+9saDouBv9Xu8wYCD03rY/ypCir7Q1tb6aRsG3t3VzZmHji8y
 7MjnC8RQuPLH4GmZAJ68xvd+HQe+NfP3my7+RqiZqYnvDssT/jcoqbbeq0uHKDPMLpee
 hC8ZKe2HoMN0ubi+4IhvkNBCavO7iWHO95fTM7XRGf7XyV7r3/wUKdoBJkPnzRBSywal
 liGUamxKAcgmeZdY72XCJ0IY09aLWstDQAl9fUvmY97jNnBfhiMsmfSy4L6G5h3hi5iG
 VIsyLbR4vFhwm5XpYVyCA9PCjU0VdFjamcq/apmFDPqgHCfWwK84cB4QZhUogZf3Fw1E
 NmQA==
X-Gm-Message-State: ACrzQf2b8BXkWQ+E2++P6TUs5PG7ue8VdgGe2q5okK1hQp18KBYlhIui
 r/prvKEddDSpUEt3DoKkifsbeCJdcok4Zol/RfYHsqJ1dlKrUDtadoK5albO05lKILUMGOKK5Ia
 adJQBnJ4y5HwqMaD0dFI+XzO984di
X-Received: by 2002:a05:622a:302:b0:39c:dc1f:db98 with SMTP id
 q2-20020a05622a030200b0039cdc1fdb98mr10226139qtw.467.1666033683379; 
 Mon, 17 Oct 2022 12:08:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76UvvScj47R2ZY2DxcytExeFmf9uLvqJju8KYn5YNtfF734a6NCoaPe+3Xtd00B4VrB5TRVQ==
X-Received: by 2002:a05:622a:302:b0:39c:dc1f:db98 with SMTP id
 q2-20020a05622a030200b0039cdc1fdb98mr10226114qtw.467.1666033683148; 
 Mon, 17 Oct 2022 12:08:03 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300::feb? ([2600:4040:5c68:4300::feb])
 by smtp.gmail.com with ESMTPSA id
 de38-20020a05620a372600b006ce30a5f892sm439488qkb.102.2022.10.17.12.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:08:02 -0700 (PDT)
Message-ID: <dd44a67411f0fc9065001696f231132ad85d9597.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/connector: send hotplug uevent on connector
 cleanup
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Date: Mon, 17 Oct 2022 15:08:01 -0400
In-Reply-To: <20221017153150.60675-2-contact@emersion.fr>
References: <20221017153150.60675-1-contact@emersion.fr>
 <20221017153150.60675-2-contact@emersion.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonas =?ISO-8859-1?Q?=C5dahl?= <jadahl@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM! Thank you for the help with this:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2022-10-17 at 15:32 +0000, Simon Ser wrote:
> A typical DP-MST unplug removes a KMS connector. However care must
> be taken to properly synchronize with user-space. The expected
> sequence of events is the following:
> 
> 1. The kernel notices that the DP-MST port is gone.
> 2. The kernel marks the connector as disconnected, then sends a
>    uevent to make user-space re-scan the connector list.
> 3. User-space notices the connector goes from connected to disconnected,
>    disables it.
> 4. Kernel handles the the IOCTL disabling the connector. On success,
>    the very last reference to the struct drm_connector is dropped and
>    drm_connector_cleanup() is called.
> 5. The connector is removed from the list, and a uevent is sent to tell
>    user-space that the connector disappeared.
> 
> The very last step was missing. As a result, user-space thought the
> connector still existed and could try to disable it again. Since the
> kernel no longer knows about the connector, that would end up with
> EINVAL and confused user-space.
> 
> Fix this by sending a hotplug uevent from drm_connector_cleanup().
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: stable@vger.kernel.org
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index e3142c8142b3..90dad87e9ad0 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -582,6 +582,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  	mutex_destroy(&connector->mutex);
>  
>  	memset(connector, 0, sizeof(*connector));
> +
> +	if (dev->registered)
> +		drm_sysfs_hotplug_event(dev);
>  }
>  EXPORT_SYMBOL(drm_connector_cleanup);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

