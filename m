Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB7705798
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 21:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAFA10E364;
	Tue, 16 May 2023 19:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568C510E364
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 19:40:57 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QLRRr3wpzzDrc9;
 Tue, 16 May 2023 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1684266056; bh=cwdAsYgjSX0aqm0yzshew+pmzkV1jX6Walld7JEIyVY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tttu+dAqWVcWHjcqiqwVw8ckFGNMfpVjTeRugopwNma5UZ5MU3RoGsRMQF11Jfshg
 Pysr1IPykAcABy5Q5FKsw98SRS8kmPBIo1Q6T4Xf7KnE6hPxLSTf0jh9sY/yqIELC2
 EbPAOHYgJ4QjQP716yrT52BLUvCVh5vscFIY6RM0=
X-Riseup-User-ID: 9651786A3D415B0666D97C0C3D5873A71C31A94F515CC9C813C099A4BC4E4EAE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QLRRn5t9tzFqhv;
 Tue, 16 May 2023 19:40:53 +0000 (UTC)
Message-ID: <bc601be4-14e3-14f3-8d14-baea399150e2@riseup.net>
Date: Tue, 16 May 2023 16:40:50 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] drm/vkms: Minor Improvements
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230515135204.115393-1-mcanal@igalia.com>
Content-Language: en-US
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230515135204.115393-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/05/23 10:52, Maíra Canal wrote:
> This series addresses some minor improvements to the writeback
> functionality. The first patch intends to reduce the critical section
> of a spinlock by removing assignments that don't need to be protected
> by a lock. The second patch enables the support for ARGB8888 on the
> writeback. Finally, the third patch refactors the pixel conversion
> functions of the writeback functionality. This patch is a follow-up of
> a previous patchset [1], in which Melissa suggested to apply the same
> refactor to the writeback pixel conversion functions.
> 
> [1] https://lore.kernel.org/dri-devel/20230418130525.128733-1-mcanal@igalia.com/T/
> 
> Best Regards,
> - Maíra

On the entire patchset,

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> 
> Maíra Canal (3):
>   drm/vkms: Reduce critical section
>   drm/vkms: Enable ARGB8888 support for writeback
>   drm/vkms: Isolate writeback pixel conversion functions
> 
>  drivers/gpu/drm/vkms/vkms_composer.c  |   4 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |   4 +-
>  drivers/gpu/drm/vkms/vkms_formats.c   | 140 +++++++++++---------------
>  drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |   9 +-
>  5 files changed, 68 insertions(+), 91 deletions(-)
> 
