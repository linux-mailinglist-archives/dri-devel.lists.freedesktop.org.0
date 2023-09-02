Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683F790981
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 22:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CF210E0CB;
	Sat,  2 Sep 2023 20:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3D10E0A3;
 Sat,  2 Sep 2023 20:22:32 +0000 (UTC)
Received: from [192.168.2.205] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DAB036607285;
 Sat,  2 Sep 2023 21:22:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693686150;
 bh=P/RoiQh/m5JLN0080yEWFysq1vNtbx1Z4bobDOQN5tU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QD63jM15RQ112hBL/Aa4GpuUrqWZmpHmRo17bQMiZD/6AoHCYW+LJSawuXr+ouYQh
 WKFzNrOvyd+hbn5T4C05oyMKyh4XuMRBMGh4xydTqNYc/ufouPGsCImsRgI2n4HNBF
 ZeWFOZO8xmgDUyuK8OjbE8qHBPQZod+oiu57mkT5DPXh2PJX3Y91zFgGOCAhRTD2pY
 Y2ZLW6aDSAMAMnQQhIuxGBWD9/Rcusg27THV8B/gYXGBNLH0YSSUjCR6FfIJLuFDhM
 3BY12+KuK0K7DA0l25Szx7SI9KRWWSZGPqx1rU198Zqq6Bu8qFLasCMxdq2QuFqMv8
 vifaHc2iXxFtw==
Message-ID: <9844875a-ee18-85ff-11bd-84bdb2333f6c@collabora.com>
Date: Sat, 2 Sep 2023 23:22:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 16/23] drm/shmem-helper: Use kref for vmap_use_count
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-17-dmitry.osipenko@collabora.com>
 <20230828120032.3d86cb15@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230828120032.3d86cb15@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/23 13:00, Boris Brezillon wrote:
> On Sun, 27 Aug 2023 20:54:42 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Use kref helper for vmap_use_count to make refcounting consistent with
>> pages_use_count and pages_pin_count that use kref. This will allow to
>> optimize unlocked vmappings by skipping reservation locking if refcnt > 1.
> 
> The core is taking the resv lock before calling ->v[un]map(), so
> switching to a kref sounds a bit premature/useless, unless there are
> plans to delegate the locking to the drivers. The only thing it brings
> is standard overflow/underflow checks. Not really sure it's worth
> transitioning to a kref for this field until we have a real use case.

The overflow checks worth transitioning. I'll mention them in the commit
message for v16.

-- 
Best regards,
Dmitry

