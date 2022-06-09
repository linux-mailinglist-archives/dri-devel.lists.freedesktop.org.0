Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E93544273
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 06:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AD210F8E6;
	Thu,  9 Jun 2022 04:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CB110F8E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 04:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654748689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSVuoqBPD75E3qr8pbOUrlgQPBVekMZDYqvbR5nuvQk=;
 b=MzqEpz8Bwb+DOqUbfkEFK6gQPtaAR0yTfqxv7xKXCe0aJjH9yZtTugCH1LYGqPmBDHsqTx
 FNSQylM812lMicJ6POMl2eaDw0IBzgu+KyCYePESWW0I8Vq080zJXZq6izSxSY1iTaqTD6
 tYfKMHjgxfQ/M0YlswJAFSAnqjlH5YA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-UQnzExmLP32YwXfpwLeR0Q-1; Thu, 09 Jun 2022 00:24:45 -0400
X-MC-Unique: UQnzExmLP32YwXfpwLeR0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB161C0513E;
 Thu,  9 Jun 2022 04:24:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0745CC28118;
 Thu,  9 Jun 2022 04:24:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E3251800094; Thu,  9 Jun 2022 06:24:43 +0200 (CEST)
Date: Thu, 9 Jun 2022 06:24:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Message-ID: <20220609042443.giva3mt773fteaio@sirius.home.kraxel.org>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
 <20220603211849.27703-3-dongwon.kim@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220603211849.27703-3-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 02:18:49PM -0700, Dongwon Kim wrote:
> Having one fence for a vgfb would cause conflict in case there are
> multiple planes referencing the same vgfb (e.g. Xorg screen covering
> two displays in extended mode) being flushed simultaneously. So it makes
> sence to use a separated fence for each plane update to prevent this.
> 
> vgfb->fence is not required anymore with the suggested code change so
> both prepare_fb and cleanup_fb are removed since only fence creation/
> freeing are done in there.

The fences are allocated and released in prepare_fb + cleanup_fb for a
reason: atomic_update must not fail.

I guess virtio-gpu must be fixed to use drm_plane_state->fence
correctly ...

take care,
  Gerd

