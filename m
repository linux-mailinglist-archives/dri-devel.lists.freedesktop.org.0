Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25D6AD07B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 22:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F9110E0B8;
	Mon,  6 Mar 2023 21:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9567C10E267
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 21:32:00 +0000 (UTC)
Received: from arch-x395 (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net
 [82.24.248.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: evelikov)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B50106602F94;
 Mon,  6 Mar 2023 21:31:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678138319;
 bh=YrH6bxbNrFtdi0yd6A8KwEnooS8cgezW2ipk9avAKew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwjWeMJZoEf7ZvlqFl16a0Q/4cgjku3LoIRMX/8kzp5nJwSlgcslyMJSqSIweWwGu
 dFvX5PPO3o+w3fgkSCG9lM+VSYr4e1h8ZWSO/5dkwZ1OFoCPMrpvMxMc8K32H2P83o
 KC9m5yOpIY/22TrpXtZCMu+yVp5N/lKWW0TZMAB03rGkleuzGziH7qNhM1/wDrkEUo
 cg8H5eSGSHsNJYvhqVAjCSgQgGOKpqVqrr8VbY9M7BoxyD4fsPHajbxV1dN5rLpee3
 mHM2v8u6QZqyu2if/FeY1cHx+waWQgkdotktcrAAezoBU1xdFkp6aKnaZ/JCjjzxDH
 z8cjW8y4Y4qrw==
Date: Mon, 6 Mar 2023 21:31:55 +0000
From: Emil Velikov <emil.velikov@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v3] drm/virtio: Fix handling CONFIG_DRM_VIRTIO_GPU_KMS
 option
Message-ID: <ZAZbyyVQMkZq4f6H@arch-x395>
References: <20230306163916.1595961-1-dmitry.osipenko@collabora.com>
 <0341e228-a1a2-a42a-7b94-3509d17af56c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0341e228-a1a2-a42a-7b94-3509d17af56c@collabora.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/03/06, Dmitry Osipenko wrote:
> On 3/6/23 19:39, Dmitry Osipenko wrote:
> > VirtIO-GPU got a new config option for disabling KMS. There were two
> > problems left unnoticed during review when the new option was added:
> > 
> > 1. The IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) check in the code was
> > inverted, hence KMS was disabled when it should be enabled and vice versa.
> > 
> > 2. The disabled KMS crashed kernel with a NULL dereference in
> > drm_kms_helper_hotplug_event(), which shall not be invoked with a
> > disabled KMS.
> > 
> > Fix the inverted config option check in the code and skip handling the
> > VIRTIO_GPU_EVENT_DISPLAY sent by host when KMS is disabled in guest to fix
> > the crash.
> > 
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > Fixes: 72122c69d717 ("drm/virtio: Add option to disable KMS support")
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> 
> Added r-b from Emil and applied to misc-next
> 

For anyone wondering: I've sent that in private, adding here for posterity

Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
