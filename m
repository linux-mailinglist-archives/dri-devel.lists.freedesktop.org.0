Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5E7F5378
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 23:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958210E6A8;
	Wed, 22 Nov 2023 22:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DD910E6A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 22:37:25 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C3026602F39;
 Wed, 22 Nov 2023 22:37:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700692644;
 bh=oA2nBCHzVO7vORbhKuc1hw7s9MElyvfOLj3GkCbh8bU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aUszqkPc+23xNcf+t/hBq8Cz4BWyvelvz/wLA1riy4yq4Ox3uUYfjYBLcIoXEr//u
 hvEMMqRHQZlMX8TDgFtap930aukrBHNwzSQoJFpYSDqL6D6fpvAzEAuVpoftoM3PCF
 GRBAwb8yfP08TRp4l9U7hGZNK6KqcU/Hvrt2FVzmdvGu3ZOfS8V/53fpFU08Kw695J
 GxNN2mEmbqtE2Fs+Ptk3swbAjtgH3ys3/av5+ZJS4REZhMzK6XvNTsO0L6heVpekVh
 fPsCPdcdrUDNekAbI3y9ve1eyArRyscO61rcV0/NByi2iFkCyUGA2Gaeb1Jwh1VYH2
 LencPDwgJ9uyQ==
Message-ID: <fe7188d5-d70c-0f4a-7998-99f2efcffdb6@collabora.com>
Date: Thu, 23 Nov 2023 01:37:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 24/26] drm/virtio: Attach shmem BOs dynamically
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-25-dmitry.osipenko@collabora.com>
 <20231113105745.7543e8dd@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231113105745.7543e8dd@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/13/23 12:57, Boris Brezillon wrote:
> On Mon, 30 Oct 2023 02:02:03 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Prepare for addition of memory shrinker support by attaching shmem pages
>> to host dynamically on first use. Previously the attachment vq command
>> wasn't fenced and there was no vq kick made in the BO creation code path,
>> hence the attachment already was happening dynamically, but implicitly.
>> Making attachment explicitly dynamic will allow to simplify and reuse more
>> code when shrinker will be added. The virtio_gpu_object_shmem_init() now
>> works under the held reservation lock, which will be important to have for
>> shrinker to avoid moving pages while they are in active use by the driver.
> Ah, this commit might actually help getting rid of the workaround
> introduced in "drm/shmem-helper: Add common memory shrinker".

Not really. The virtio_gpu_free_object() is unchanged, it's only
allocation that is being deferred and it's only done for a one BO type
(virtio-gpu has multiple BO types).

-- 
Best regards,
Dmitry

