Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F8592B5A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40FFAFC77;
	Mon, 15 Aug 2022 10:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2976011A288
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:09:16 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 76D4166016A1;
 Mon, 15 Aug 2022 11:09:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660558155;
 bh=IxA0RyRCASMAbomjQ2FWjdpXxwbEqxEzDpKA7fGLa7Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=go6c+u43kUxsC/J1y+p7RUVs759KcyhNIhYyXhunR6hhypP/9riSdcsuKp9xYkp9z
 zhxWZeGVtPTWSmnnhLpvXwmlqZUubpnEZ5Rn75kcnFUaMdCAuWKmi4tYq9T3Jwy6Y3
 2OZZQkT9PP/tBSmpvDs5SFHnzaPpglhOQkYAV3nbdIL+5J5nE6pKG9NVZO6vUuL7Rh
 7zCsGxGex5LS/fC62BDhwS6clWn0oioBq7sPlILr5ze//9trIq4GRbpsdv/U9Wgykt
 qR0xDhFOJK2vibBgqzspHgpag3ADM+XPkgfYvDrP7s4iXjtWFZQYCG5Iq/UML8QGTY
 GFlSyHuGlBNNQ==
Message-ID: <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
Date: Mon, 15 Aug 2022 13:09:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 13:05, Christian König wrote:
> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>> Higher order pages allocated using alloc_pages() aren't refcounted and
>> they
>> need to be refcounted, otherwise it's impossible to map them by KVM. This
>> patch sets the refcount of the tail pages and fixes the KVM memory
>> mapping
>> faults.
>>
>> Without this change guest virgl driver can't map host buffers into guest
>> and can't provide OpenGL 4.5 profile support to the guest. The host
>> mappings are also needed for enabling the Venus driver using host GPU
>> drivers that are utilizing TTM.
>>
>> Based on a patch proposed by Trigger Huang.
> 
> Well I can't count how often I have repeated this: This is an absolutely
> clear NAK!
> 
> TTM pages are not reference counted in the first place and because of
> this giving them to virgl is illegal.

A? The first page is refcounted when allocated, the tail pages are not.

> Please immediately stop this completely broken approach. We have
> discussed this multiple times now.

Could you please give me a link to these discussions?

-- 
Best regards,
Dmitry
