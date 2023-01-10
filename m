Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03136663CF2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5815F10E572;
	Tue, 10 Jan 2023 09:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6658110E572
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673343199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lcW6IvR/BGpFNkizqkXnU0KCWFFCgWFeQW7q1G/vfb4=;
 b=QAGs0SqCJkkYC7q67YMd5xoGg/UKPy0CNEy+8CriqRrdxeG6rn+CZZmRoqf1JwxxqINQ1Z
 9ef0yRUbxEIPyn+1i5fJXvk9gxYdWz3B2gvqLa9D5d7vvOiLYyXe3XI16SuSjMny447ZTp
 8hR0QwQ/+/jWSYgqPnFNEQGzoSWjqzs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-AcA05VpHOoSbmNjkYKla-A-1; Tue, 10 Jan 2023 04:33:16 -0500
X-MC-Unique: AcA05VpHOoSbmNjkYKla-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE2E33C0DDAB;
 Tue, 10 Jan 2023 09:33:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 925742166B29;
 Tue, 10 Jan 2023 09:33:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A49C18000B3; Tue, 10 Jan 2023 10:33:14 +0100 (CET)
Date: Tue, 10 Jan 2023 10:33:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 1/2] drm/virtio: Attach and set suggested_x/y
 properties for the connector
Message-ID: <20230110093314.d3zbz4k2oxypz5sm@sirius.home.kraxel.org>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-2-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20221118013054.182304-2-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +static void virtio_gpu_update_output_position(struct virtio_gpu_output *output)
> +{
> +	struct drm_connector *connector = &output->conn;
> +	struct drm_device *dev = connector->dev;
> +
> +	drm_object_property_set_value(&connector->base,
> +		dev->mode_config.suggested_x_property, output->info.r.x);
> +	drm_object_property_set_value(&connector->base,
> +		dev->mode_config.suggested_y_property, output->info.r.y);
> +}

This fails sparse checking

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le32 [usertype] x @@
   drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse:     expected unsigned long long [usertype] val
   drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse:     got restricted __le32 [usertype] x
>> drivers/gpu/drm/virtio/virtgpu_vq.c:656:70: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le32 [usertype] y @@
   drivers/gpu/drm/virtio/virtgpu_vq.c:656:70: sparse:     expected unsigned long long [usertype] val
   drivers/gpu/drm/virtio/virtgpu_vq.c:656:70: sparse:     got restricted __le32 [usertype] y

take care,
  Gerd

