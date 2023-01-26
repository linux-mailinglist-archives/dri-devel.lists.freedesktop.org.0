Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6A67CAB2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E0610E075;
	Thu, 26 Jan 2023 12:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5C510E075
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674735350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gAFZRWf2hYi1H5Lq+4Jh2HTfD/1dxY8GSsWYVsOH7F4=;
 b=RVuVMNTxIRT8WtrtixaXDAxvYu+hnaQ7nhaf2ZW1gmFDbCdneilhvanR3Of0ATb05SW0Ii
 NP/CVzzaTls43qhgzq7qn94el79e5U0tjzfUsC9+OjORh/WBSlBfWxx+KuxIhiabzLt5pT
 t3KlvKqyYL1180id3MRHTiYl4oNPIOM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-e75Uk5ddOlGq658uwK52ZA-1; Thu, 26 Jan 2023 07:15:44 -0500
X-MC-Unique: e75Uk5ddOlGq658uwK52ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EB333C42200;
 Thu, 26 Jan 2023 12:15:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 136651121330;
 Thu, 26 Jan 2023 12:15:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B5FBC180091C; Thu, 26 Jan 2023 13:15:40 +0100 (CET)
Date: Thu, 26 Jan 2023 13:15:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 05/11] drm/shmem: Switch to use drm_* debug helpers
Message-ID: <20230126121540.pso6amfugossjm56@sirius.home.kraxel.org>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-6-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108210445.3948344-6-dmitry.osipenko@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Mon, Jan 09, 2023 at 12:04:39AM +0300, Dmitry Osipenko wrote:
> f a multi-GPU system by using drm_WARN_*() and
> drm_dbg_kms() helpers that print out DRM device name corresponding
> to shmem GEM.

That commit message looks truncated ...

take care,
  Gerd

