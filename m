Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A86AF12B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 19:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EEE10E133;
	Tue,  7 Mar 2023 18:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765CF10E133;
 Tue,  7 Mar 2023 18:40:37 +0000 (UTC)
Received: from [192.168.2.57] (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FF316602081;
 Tue,  7 Mar 2023 18:40:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678214435;
 bh=kzZgEsXwj2D2bZ03kYGGGhV7+F4z+DUuitiRMuVlXeU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=JlISTHDejcbW8NV11WI1CuuJHLAVvg86nvzAHQUnlx9smrgfeepdwDLIw0neniFTj
 emP0FJY2JL2TzcVvPfCzr8ZFaO8OKtdRunCfJqGnzvjcVtlpJOFpp8cuheQ3OXbzs6
 V9N9BGpBN92sIZ5uNWI4YJ4/DiI7W4V2oIfJiVv4IMxBJ0nz/99Y24G/9+vtGd//4h
 oHtYSSKuxJeE9dlu7sBJepgBb2EYDmj094VB+dW7MFHpyPsVV8TsXvI120JVWipihx
 SyeAWoZl+XKIvkfD1SZPrtLr9ERswBo4rWgvIPsyPPghPQ5vX8vjAvTRTxDOmrIXNu
 7MxWNPThh9UeQ==
Message-ID: <a49fb815-1f02-e8c1-fd8e-128f3b43e490@collabora.com>
Date: Tue, 7 Mar 2023 21:40:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 10/11] drm/virtio: Support memory shrinking
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
 <20230305221011.1404672-11-dmitry.osipenko@collabora.com>
 <3afbc965-4117-7d45-9a8f-b726c04d1b0c@suse.de>
 <66ddf54c-8396-2eb4-49ae-da479a997219@collabora.com>
In-Reply-To: <66ddf54c-8396-2eb4-49ae-da479a997219@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/23 21:25, Dmitry Osipenko wrote:
>> Not really a problem with this patchset, but having such branches looks
>> like a bug in the driver's GEM design. Whatever your GEM object needs or
>> does, it should be hidden in the implementation. Why is virtio doing this?
> There is another "VRAM" VirtIO-GPU BO type that doesn't implement the
> pin/unpin callbacks. Perhaps another option was to add the callbacks.

Although, the pin/unpin are optional. So yes, there was no need for the
extra branch, good catch.

-- 
Best regards,
Dmitry

