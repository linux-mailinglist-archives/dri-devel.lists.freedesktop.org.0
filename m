Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D1194BC4B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E3E10E02E;
	Thu,  8 Aug 2024 11:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Sc/xyviu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Thu, 08 Aug 2024 11:31:01 UTC
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975510E02E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723115751; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NmoWDyJHJvOIY3I9aFGH4B4qHLIdTkCYMAC0kf2ZbaPDJmyvEmtp7uXUneWPjKblrBu4zQ5wgb1HXnX/W8ZbTLEyjFfDVKHaRifGNnMWpzLmrorBRTixf+GsdhM488ffNUhIMAAbQDYUvbviIBh435Lpt0abRcDDywpEtm2XyLw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723115751;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=r6rU7KtJozi23kp1co+hrLn3/E9giDDQH5pgqpu/Kbk=; 
 b=JjMyn9cc0sqhwUMzRIB9d+iuSO+8OvqM+7uDdDKW89kMWgQ3GDjpmSPNuV1tS1Xcm2LH2re+gmGYcwJV3JvCWEcvXAsLNc0X+ttaGbnfYGqCdDZPrAM8wla1vz8OeAI6YxMAbaBOPHOs1bn9s0/trYvoXeqIxDal7cp2+tWwxGM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723115751; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=r6rU7KtJozi23kp1co+hrLn3/E9giDDQH5pgqpu/Kbk=;
 b=Sc/xyviub8Rihuny+btlNpBFekCiHMcZwhM3MuRYZVYvSIfUvpl7hvkDnpdiNzvP
 6aSo9Leg/D61BS75VTiGdm7hdMEyLrxBljJf5oIPiP2lzWz1ZAy5//EeulQU1FSY6wR
 gh8KiPiwKDAbh+E5Zy7W8vjtGcewgkEr9JqKsSq0=
Received: by mx.zohomail.com with SMTPS id 1723115749738452.2823392389888;
 Thu, 8 Aug 2024 04:15:49 -0700 (PDT)
Message-ID: <46a5ec89-be9b-4342-820d-019b595fa379@collabora.com>
Date: Thu, 8 Aug 2024 14:15:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Rob Clark <robdclark@gmail.com>
Cc: Sergio Lopez <slp@redhat.com>, gurchetansingh@chromium.org,
 tzimmermann@suse.de, mripard@kernel.org, olvaffe@gmail.com,
 kraxel@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 airlied@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAF6AEGvwrYiN6nMSsRAdc3qq+qQGWEvdW_3+xJh6y2iAyW6rkw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGvwrYiN6nMSsRAdc3qq+qQGWEvdW_3+xJh6y2iAyW6rkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/5/24 19:24, Rob Clark wrote:
> On Wed, Jul 24, 2024 at 12:00 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 7/23/24 14:49, Sergio Lopez wrote:
>>> There's an incresing number of machines supporting multiple page sizes
>>> and on these machines the host and a guest can be running, each one,
>>> with a different page size.
>>>
>>> For what pertains to virtio-gpu, this is not a problem if the page size
>>> of the guest happens to be bigger or equal than the host, but will
>>> potentially lead to failures in memory allocations and/or mappings
>>> otherwise.
>>
>> Please describe concrete problem you're trying to solve. Guest memory
>> allocation consists of guest pages, I don't see how knowledge of host
>> page size helps anything in userspace.
>>
>> I suspect you want this for host blobs, but then it should be
>> virtio_gpu_vram_create() that should use max(host_page_sz,
>> guest_page_size), AFAICT. It's kernel who is responsible for memory
>> management, userspace can't be trusted for doing that.
> 
> fwiw virtgpu native context would require this as well, mesa would
> need to know the host page size to correctly align GPU VA allocations
> (which must be a multiple of the host page size).
> 
> So a-b for adding this and exposing it to userspace.

In general, GPU page size has no connection to the CPU page size. It
happens that MSM driver uses same page size for both GPU and CPU. Likely
you could configure a different GPU page size if you wanted. dGPUs would
often use 64k pages.

-- 
Best regards,
Dmitry

