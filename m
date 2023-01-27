Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5F67DED4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 09:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F21510E173;
	Fri, 27 Jan 2023 08:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DB810E173
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 08:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674806651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lr/rQnagNH++eb9Q6h7/tOeChv4rcjLXIX9dBLUgnQk=;
 b=QkHVoSWQb38tCVbrNEJr4Bs/OsavAtfcd1tO/OEFMvHrE6CUBGmrAYp6AfR0JNHovONHa/
 x1epWWPks2QK3b0psgqfmQNBrZuHgZgNrlN+9BZK73ooHWADcffglMBp+/MkbNj/nVad9K
 alhQ6znF9myvRRy1W9wl9jUlrnnl0Q4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-8pTM94K6PNWNl-kX6Pi9vg-1; Fri, 27 Jan 2023 03:04:04 -0500
X-MC-Unique: 8pTM94K6PNWNl-kX6Pi9vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B19D1C05EAF;
 Fri, 27 Jan 2023 08:04:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B857540C141B;
 Fri, 27 Jan 2023 08:04:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B7211800606; Fri, 27 Jan 2023 09:04:01 +0100 (CET)
Date: Fri, 27 Jan 2023 09:04:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 10/11] drm/virtio: Support memory shrinking
Message-ID: <20230127080401.aj6uruakajrconts@sirius.home.kraxel.org>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-11-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108210445.3948344-11-dmitry.osipenko@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 12:04:44AM +0300, Dmitry Osipenko wrote:
> Support generic drm-shmem memory shrinker and add new madvise IOCTL to
> the VirtIO-GPU driver. BO cache manager of Mesa driver will mark BOs as
> "don't need" using the new IOCTL to let shrinker purge the marked BOs on
> OOM, the shrinker will also evict unpurgeable shmem BOs from memory if
> guest supports SWAP file or partition.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

