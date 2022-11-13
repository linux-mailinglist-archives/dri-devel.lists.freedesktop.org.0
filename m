Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E13E26270A0
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 17:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CA410E214;
	Sun, 13 Nov 2022 16:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCA110E214
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 16:35:26 +0000 (UTC)
Received: from [192.168.2.125] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E774366022FA;
 Sun, 13 Nov 2022 16:35:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668357324;
 bh=j9qUvJJp/X2OPgESZeNiGJ13HdOpsuZE/t5C9EOgn60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ebnk7x7WD+IAH7GwiTF4ZSDyeIVD58Reg5mAKWo/fnoy+gMY7V+jclZpRY1qDficD
 pSgjHK097TZP7s7QChi/ksj65ak0gf1TuSTBBnzLMYQr2qpXePth7QsDpV68dimgfC
 4IBS8MotxvmUB9rqqKi+/OOwxxpPuaaaWgNTY5xTKMkQ5MuFHeREpQINB1SmUSvV+H
 oYx8bQLzayLrj235JY+Bm9J2H77WkDCCZA4J860YY5yOFW5ctQqQhOgPskljYAeW3r
 oIpTX3FjkGka81pG0yKbEvboulAw5ITN6aKfC4zjrI4Ov8ZkOg4NraWwm1MccN5Ir2
 9s6lpcq03HDew==
Message-ID: <50cece73-a499-eba3-7018-9e92e0791c88@collabora.com>
Date: Sun, 13 Nov 2022 19:35:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] udmabuf: add vmap method to udmabuf_ops
Content-Language: en-US
To: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221113150511.8878-1-lukasz.wiecaszek@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221113150511.8878-1-lukasz.wiecaszek@gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/13/22 18:05, Lukasz Wiecaszek wrote:
> +static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +
> +	if (!ubuf->vaddr) {
> +		ubuf->vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> +		if (!ubuf->vaddr)
> +			return -EINVAL;
> +	}

Create a new mapping on each vmap_udmabuf() and add the corresponding
vunmap.

Otherwise persistent vmapping shall be released together with udmabuf.
It doesn't look that persistent vmapping is needed for udmabufs.

-- 
Best regards,
Dmitry

