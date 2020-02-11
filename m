Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0F158F50
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 13:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E436EA50;
	Tue, 11 Feb 2020 12:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E876EA50
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581425854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEgWQV1U8uiXJ01C6wgnpQQAiHJMhW44wAlwBnHe4dw=;
 b=fmn5qYf+P+8V4QeqF/VMhBAmzwQSqeCAKa7I1mADwDWbB4WgjsLg3C97d7ptaH1VymcrBR
 Zn0keFm/4LBv7v4isZqSBkDb24dCuFKyZ7X2+AQy+JcVK/OGF9cEr0I62xSsslCkbM9R9O
 Cr9furhsUosxoCgmcfluLu9/T1en+8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-tOGBoyh9OYaLn0BG3SNZzw-1; Tue, 11 Feb 2020 07:57:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4426100551A;
 Tue, 11 Feb 2020 12:57:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9CAE5D9E2;
 Tue, 11 Feb 2020 12:57:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E595B16E2D; Tue, 11 Feb 2020 13:57:29 +0100 (CET)
Date: Tue, 11 Feb 2020 13:57:29 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v2 2/3] drm/virtio: never kick in virtio_gpu_queue_ctrl_sgs
Message-ID: <20200211125729.nbf25rxrnt5rq4cw@sirius.home.kraxel.org>
References: <20200206192214.86818-1-olvaffe@gmail.com>
 <20200207221359.187340-1-olvaffe@gmail.com>
 <20200207221359.187340-3-olvaffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200207221359.187340-3-olvaffe@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tOGBoyh9OYaLn0BG3SNZzw-1
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
Cc: dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> @@ -541,6 +539,7 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
>  	cmd_p->resource_id = cpu_to_le32(resource_id);
>  
>  	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
> +	virtio_gpu_commit_ctrl(vgdev);
>  }

Well, I was more thinking about adding that to higher-level functions
so we get more actual batching out of it ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
