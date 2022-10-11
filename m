Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A45FB9B2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 19:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0C10E8D7;
	Tue, 11 Oct 2022 17:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7847610E835;
 Tue, 11 Oct 2022 17:31:53 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-114.nat.spd-mgts.ru
 [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BECC86602358;
 Tue, 11 Oct 2022 18:31:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1665509511;
 bh=FbjwvyBn8Jk5nWNvSwUKiVg917Dtcke8nkTgpCuxGHg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=j9FFZ8t9+K/yyb3uyYTMRMmOZwbPmrFNo2nLiwt+NaQZrbzcY4YA8uPgvq9KqKyKu
 qfSxAQSs3xdybENOLmYyju3gm2jzJes8ytBnen1UmrG70xGfL9X93PKjnudy4jAGU9
 gl+8JqZyTgX4VAz30gatLmK/w1aZ0uiSfREFVnx4BKEjtHICZB25vE8HLEsmHDTqCu
 yIpeJVFLrAb6mYjYFS9OIEMj1EcqLBHaz1mjNnYKGPhtHbHH9fs9DzhtYGqeU92wP3
 bGYgN3stcLAlbVz256MpW1wDubM6bGRxeP+1wxa5ae3PSGyqaSwxKah/5yl/VkpzQm
 rYhgIy9tlB8RA==
Message-ID: <fd3baeeb-2277-768c-e0d1-f3adcecb848a@collabora.com>
Date: Tue, 11 Oct 2022 20:31:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 00/21] Move all drivers to a common dma-buf locking
 convention
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
References: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 22:15, Dmitry Osipenko wrote:
> Hello,
> 
> This series moves all drivers to a dynamic dma-buf locking specification.
> From now on all dma-buf importers are made responsible for holding
> dma-buf's reservation lock around all operations performed over dma-bufs
> in accordance to the locking specification. This allows us to utilize
> reservation lock more broadly around kernel without fearing of a potential
> deadlocks.
> 
> This patchset passes all i915 selftests. It was also tested using VirtIO,
> Panfrost, Lima, Tegra, udmabuf, AMDGPU and Nouveau drivers. I tested cases
> of display+GPU, display+V4L and GPU+V4L dma-buf sharing (where appropriate),
> which covers majority of kernel drivers since rest of the drivers share
> same or similar code paths.

All the non-drm patches have been acked by the respective maintainers.
I'm now feeling comfortable to take this series into drm-misc-next and
going to do it later this week.

If anyone have more comments to add, then please do it now. It won't be
possible to drop out patches from drm-misc once they will be merged. All
further changes will have to be made on top of the applied patches.

Thanks to all who reviewed this patchset!

-- 
Best regards,
Dmitry

