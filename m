Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1142793C74
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 14:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA20410E623;
	Wed,  6 Sep 2023 12:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59C7310E625
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 12:17:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C681106F;
 Wed,  6 Sep 2023 05:18:18 -0700 (PDT)
Received: from [10.57.36.163] (unknown [10.57.36.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE5323F67D;
 Wed,  6 Sep 2023 05:17:38 -0700 (PDT)
Message-ID: <89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d23@arm.com>
Date: Wed, 6 Sep 2023 14:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v2 02/15] drm/panthor: Add uAPI
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-3-boris.brezillon@collabora.com>
Content-Language: en-US
In-Reply-To: <20230809165330.2451699-3-boris.brezillon@collabora.com>
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
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/9/23 18:53, Boris Brezillon wrote:

> +enum drm_panthor_sync_op_flags {
> +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization handle type mask. */
> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
> +
> +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ: Synchronization object type. */
> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ: Timeline synchronization
> +	 * object type.
> +	 */
> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
> +
> +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> +	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
> +
> +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> +	DRM_PANTHOR_SYNC_OP_SIGNAL = 1 << 31,
> +};

We get an issue with --pedantic here:

warning: enumerator value for 'DRM_PANTHOR_SYNC_OP_SIGNAL' is not an 
integer constant expression [-Wpedantic]

Would be god to get rid of this, so user space can include this header 
without disabling pedantic. Either we can stop using the top most bit or 
a cast value like "(int)(1U << 31)"

> +	/**
> +	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
> +	 */
> +	DRM_PANTHOR_VM_BIND_OP_TYPE_MASK = 0xf << 28,

Same issue for this member. Either not use the top most bit or cast 
value like "(int)(0xfU << 28)" avoids the pedantic warning.

--
Regards,
Ketil Johnsen
