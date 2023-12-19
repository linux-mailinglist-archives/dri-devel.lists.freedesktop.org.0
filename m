Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA68186A2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 12:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0510E0AA;
	Tue, 19 Dec 2023 11:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E1DB310E0AA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 11:49:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1981FB;
 Tue, 19 Dec 2023 03:50:14 -0800 (PST)
Received: from [10.57.75.187] (unknown [10.57.75.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 742FC3F64C;
 Tue, 19 Dec 2023 03:49:28 -0800 (PST)
Message-ID: <cb31820e-4cd7-4495-977d-99f1da1fe602@arm.com>
Date: Tue, 19 Dec 2023 12:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] drm/panthor: Add the scheduler logical block
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-11-boris.brezillon@collabora.com>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20231204173313.2098733-11-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 18:33, Boris Brezillon wrote:

<snip>

> +static void
> +panthor_queue_put_syncwait_obj(struct panthor_queue *queue)
> +{
> +	if (queue->syncwait.kmap) {
> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(queue->syncwait.kmap);
> +
> +		drm_gem_vmap_unlocked(queue->syncwait.obj, &map);

pretty sure you mean vUNmap here...

> +		queue->syncwait.kmap = NULL;
> +	}
> +
> +	drm_gem_object_put(queue->syncwait.obj);
> +	queue->syncwait.obj = NULL;
> +}

<snip>

--
Thanks,
Ketil
