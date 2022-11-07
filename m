Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC161FB9D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D51310E53D;
	Mon,  7 Nov 2022 17:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE2610E53C;
 Mon,  7 Nov 2022 17:37:58 +0000 (UTC)
Received: from [192.168.2.123] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AB1B366023A6;
 Mon,  7 Nov 2022 17:37:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667842676;
 bh=UMRS4vM/GE6IwT0ij75XZK2yxYOoTzS0D0RuPVqVLQ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=miwcwDXpS7Bbvd1kg8ufWW8EYMDu/fgcPle5PVDEc/B45ktlgqIx4KYYA7QJIH0/S
 by6GLLPhco/tY89MPdmT/s8ECZUVpumdsyezUNadhVFrBlk2dKSnpRR4YYHs5ifRqx
 kuVjLNaEObN6eE/lFu1N0kKKLb+Hg6OZXx6pYEFM8ctFWBT+AgibmceYq8kqFMCEG5
 kowqpdeAKxf0CNu91SEfqgK2XcDJWq/xRLM5BkdsTv9wWssGJ9nsGOSCQkZma8qL+/
 vHXhwraRJ7N/LdEZD26enrecVwg8djUWKheSt++aa2448mbVzh/odGXyBvPK2wEDIp
 kG1p1Gc0TCNDw==
Message-ID: <daebe990-6032-15a1-175a-84e9e1ce2ca0@collabora.com>
Date: Mon, 7 Nov 2022 20:37:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 18/21] dma-buf: Move dma_buf_mmap() to dynamic locking
 specification
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
 <20221017172229.42269-19-dmitry.osipenko@collabora.com>
 <CAKMK7uFFwTfNYT2BrubYvUMrH4fEmtF=yJshUck3-gKYLGqxCg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAKMK7uFFwTfNYT2BrubYvUMrH4fEmtF=yJshUck3-gKYLGqxCg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ruhl Michael J <michael.j.ruhl@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Russell King <linux@armlinux.org.uk>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 virtualization@lists.linux-foundation.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/22 20:25, Daniel Vetter wrote:
>> Move dma_buf_mmap() function to the dynamic locking specification by
>> taking the reservation lock. Neither of the today's drivers take the
>> reservation lock within the mmap() callback, hence it's safe to enforce
>> the locking.
>>
>> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Just noticed this while reading code ... this patch seems to have
> missed dma_buf_mmap_internal()?
> 
> Might be good if at least some drivers gain a dma_resv_assert_held in
> that path to make sure we're not quite this bad, together with fixing
> this issue.

Good catch! I'll prepare the patches.

-- 
Best regards,
Dmitry

