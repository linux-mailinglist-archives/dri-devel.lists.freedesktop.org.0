Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089126B71A2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCCB10E4A5;
	Mon, 13 Mar 2023 08:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A242910E0C7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678697546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rn0ZDN/u4ONTQp/tmI2ypE9T4TH7mmvAAf+chBeDHxQ=;
 b=csuT9/P13kq2InuNDHYONkJ2Tbm8+vln2f677I0IpzSkD7zdUn4ft1QBu6f5biNEYDdTcj
 ZSqkpZPQjJCO/baYPZmmkMCUXEYfZnl7VylWlpfXvNn0SBNR4TE7ArDXun/OZBpwE2xGyX
 bBMIyjwHwGlHTcLzRW6QFdS1c/BtrIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-j-eQXjg8ORK0ti-wx5PCJA-1; Mon, 13 Mar 2023 04:52:21 -0400
X-MC-Unique: j-eQXjg8ORK0ti-wx5PCJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71414800050;
 Mon, 13 Mar 2023 08:52:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3214D202701E;
 Mon, 13 Mar 2023 08:52:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 191791801CF6; Mon, 13 Mar 2023 09:52:20 +0100 (CET)
Date: Mon, 13 Mar 2023 09:52:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/virtio: Enable fb damage clips property for the
 primary plane
Message-ID: <20230313085220.fwvcul7sz7ycxtm4@sirius.home.kraxel.org>
References: <20230310125943.912514-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310125943.912514-1-javierm@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Enric Balletbo i Serra <eballetb@redhat.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Christian Hergert <chergert@redhat.com>, Albert Esteve <aesteve@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 01:59:42PM +0100, Javier Martinez Canillas wrote:
> Christian Hergert reports that the driver doesn't enable the property and
> that leads to always doing a full plane update, even when the driver does
> support damage clipping for the primary plane.
> 
> Don't enable it for the cursor plane, because its .atomic_update callback
> doesn't handle damage clips.
> 
> Reported-by: Christian Hergert <chergert@redhat.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

