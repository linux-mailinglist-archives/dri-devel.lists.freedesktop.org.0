Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B7FAE3EE4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920310E37F;
	Mon, 23 Jun 2025 12:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sv0HvcbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA29F10E36F;
 Mon, 23 Jun 2025 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750680138; x=1782216138;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Y5hDoV8L/G+XG/Mk2UP5nwzN7exrsEd+MJZCvR+m6uA=;
 b=Sv0HvcbAfS5jN+j7EWt8FX3n878gAmAyChOdGitu/7FVAEaXZIYALz5z
 SIh2jLXC7w8GcjTj2qs9DSh2ITI36xNESLR+YtC+UjTrbvxw/6rmx0s8t
 TJS/b52p3xrfptpFmRcMuPgVVFXojkniUe+0o5MmZUe1konX7hDrJTd2b
 aDKdzzuHSeaBXdpJUY43n35Y2FBOO4OSJt3NzzoLfseioR7RlIg7UuwMq
 HJx98wTSmoChpFdRUL0bnj5ICq0ClxfNV7OWAYYnKaCfI/VJQuy2SgSiJ
 fKoOFBLi79CttNXDCWxPYex3xglkXow58AtPY4ViyZw4R05JKOWgJuYyW Q==;
X-CSE-ConnectionGUID: b9eYNt0aQc+Rbzzkuhfs8A==
X-CSE-MsgGUID: 4gz7poQWRSGzQ4gIy722hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63575053"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="63575053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:02:18 -0700
X-CSE-ConnectionGUID: x9EzZMHTRbWoIMVvnxW2wA==
X-CSE-MsgGUID: I4ScjVvrRLGRQ8lgvOs7Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151732162"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.111])
 ([10.245.244.111])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:02:13 -0700
Message-ID: <cfbcb660-d102-4cca-afb4-4e88a4ef2d32@linux.intel.com>
Date: Mon, 23 Jun 2025 14:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] drm/i915: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <c28aad52-7977-4763-9690-9aed1910c834@linux.intel.com>
 <4d81cf64-7bf1-4a7d-8682-fc817d74c373@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <4d81cf64-7bf1-4a7d-8682-fc817d74c373@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 2025-06-23 12:10, Jocelyn Falempe wrote:
> On 23/06/2025 09:40, Maarten Lankhorst wrote:
>> Hey,
>>
>> Thanks for the series. I didn't see you on irc so I wanted to ask if you are planning to send a v11 with
>> the changes from void * to struct intel_panic_data and adding the VRAM support?
> 
> Yes, I'm preparing a v11, and I'm considering to do something like this, to allocate the panic data with the struct intel_framebuffer:
> 
> struct xe_framebuffer {
>     struct intel_framebuffer base;
>     struct xe_panic_data panic;
> };
> 
> struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
> {
>     struct xe_framebuffer *xe_fb;
> 
>     xe_fb = kmalloc(sizeof(struct xe_framebuffer), GFP_KERNEL);
>     return &xe_fb->base;
> }
> 
> (And the same for i915).
> That should allow you to add battlemage support.
> 
>>
>>
>> Other than that, I think the series looks good and I'll be able to test it on my battlemage.
>>

A private member is fine, but if you can get signoff from the i915 people for the xe_fb slpit, I would really like that for other things too. :)

Kind regards,
~Maarten

