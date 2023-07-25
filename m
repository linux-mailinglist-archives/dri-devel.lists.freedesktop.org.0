Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A73760C84
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD810E3B7;
	Tue, 25 Jul 2023 07:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FE810E3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:58:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F2EB6606F97;
 Tue, 25 Jul 2023 08:58:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690271935;
 bh=EcBa51UDSzC9yoULUX6VrJ7gf1EtZAt7KrCQOJ4AZv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FUxRFjlbD+YFzZ9kzfmNA9K2+szybOMzGFar7er1WYgKYuf0eICkPTwI3dtJQSFF5
 FuqGy+0TAXaV1EXMGVvfRmqfqmMnu0IaRBZc8iJbtwdQ7YAq9N3K8IZrju2igz1YWx
 FQPDQbex+WYbg2Glf/s8K4ET646kxwzLvufhQYReJw0nUy+e11oLQ9b5ZXX0RyJsNb
 BGa9Y9YQbMMyvlqysVjDvaYEfOBbXI+Zf+sL9sC3cUPB0T8UJA/VaORLM6keETnsej
 opg6TRJJAfkym2E84FdocfKyPL92109gaiHoWbxr0gbCGenzPTPb5ziG5qdfV4ho68
 CjuBT5OK18TSQ==
Date: Tue, 25 Jul 2023 09:58:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v14 10/12] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <20230725095851.5cbd7b6d@collabora.com>
In-Reply-To: <20230725094702.4322fbb5@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-11-dmitry.osipenko@collabora.com>
 <20230725094702.4322fbb5@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jul 2023 09:47:02 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Sun, 23 Jul 2023 02:47:44 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
> > Add locked/unlocked postfixes to drm-shmem function names to make clear
> > where reservation lock is taken and where not.  
> 
> Uh, ignore my comment on patch 1 then...
> 
> > Add more common helpers to drm_gem_shmem_helper.h  
> 
> I'd do the renaming and exporting in separate patches.

Actually, I'd refrain from exporting functions until someone needs
them, as you rightfully pointed out in your previous reply.

> 
> > 
> > Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>  

