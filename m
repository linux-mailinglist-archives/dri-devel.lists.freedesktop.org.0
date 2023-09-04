Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFEB791271
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9EC10E2BD;
	Mon,  4 Sep 2023 07:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64D2F10E2BD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:42:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD09711FB;
 Mon,  4 Sep 2023 00:42:48 -0700 (PDT)
Received: from [10.57.92.217] (unknown [10.57.92.217])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4B5E3F8A4;
 Mon,  4 Sep 2023 00:42:08 -0700 (PDT)
Message-ID: <fe1bd580-2c3e-555a-0c1f-34a9ac4bdf9a@arm.com>
Date: Mon, 4 Sep 2023 08:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/15] drm/panthor: Add uAPI
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-3-boris.brezillon@collabora.com>
 <20230901181039.417c9753@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230901181039.417c9753@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2023 17:10, Boris Brezillon wrote:
> On Wed,  9 Aug 2023 18:53:15 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> +/**
>> + * DOC: MMIO regions exposed to userspace.
>> + *
>> + * .. c:macro:: DRM_PANTHOR_USER_MMIO_OFFSET
>> + *
>> + * File offset for all MMIO regions being exposed to userspace. Don't use
>> + * this value directly, use DRM_PANTHOR_USER_<name>_OFFSET values instead.
>> + *
>> + * .. c:macro:: DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET
>> + *
>> + * File offset for the LATEST_FLUSH_ID register. The Userspace driver controls
>> + * GPU cache flushling through CS instructions, but the flush reduction
>> + * mechanism requires a flush_id. This flush_id could be queried with an
>> + * ioctl, but Arm provides a well-isolated register page containing only this
>> + * read-only register, so let's expose this page through a static mmap offset
>> + * and allow direct mapping of this MMIO region so we can avoid the
>> + * user <-> kernel round-trip.
>> + */
>> +#define DRM_PANTHOR_USER_MMIO_OFFSET		(0x1ull << 56)
> 
> I'm playing with a 32-bit kernel/userspace, and this is problematic,
> because vm_pgoff is limited to 32-bit there, meaning we can only map up
> to (1ull << (PAGE_SHIFT + 32)) - 1. Should we add a DEV_QUERY to let
> userspace set the mmio range?

Hmm, I was rather hoping we could ignore 32 bit these days ;) But while
I can't see why anyone would be running a 32 bit kernel, I guess 32 bit
user space is likely to still be needed.

I can't really think of anything better than letting user space set the
MMIO range. Having an ioctl which returned a special fd just for MMIO
would be one option (which would preserve the full 44 bit GPU VA) but
seems somewhat overkill. Hiding the mmap within an ioctl would of course
be bad as it breaks tools like Valgrind.

Oh and please do make it a range - user space submission will be adding
to the MMIO range ;)

Steve

>> +#define DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET	(DRM_PANTHOR_USER_MMIO_OFFSET | 0)

