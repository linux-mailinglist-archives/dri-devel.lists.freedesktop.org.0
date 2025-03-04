Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53CDA4ED98
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAB310E6A9;
	Tue,  4 Mar 2025 19:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZETSK7a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3F710E27D;
 Tue,  4 Mar 2025 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741117262; x=1772653262;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zkedPHB75+ggSIUWcbvYFVY1/eUNfEgdMwE1ki4UjBI=;
 b=ZETSK7a0Sht+B2fzHIxbZ16iKzbcl+aMUtshBWQKQHhoSQOamgxW45mo
 Hn6G6vxOl9dVegluByzPOdQ91KuKh2nadxQ0bMwx6wkCQu3+HtJpEotFA
 8g1+Z/0KxjAKekHtKhuyArdjexjB6W5k6WCGzFkmHZoch9+bOT8Ykfkym
 yKaVBv6giDE2wsc0turNLzP/o8osaq4YaW30hU4TeCj00HjrPSC3Hngl5
 a9VzlHnSml7Q2VsK9QeU1kz7c35ISzUJjGPf6FDhQQQV6F9Pvv646woOT
 DQU/08MoKvHsU+TLZIYsvypOgyi10HKNkB0bD1i4TkBNyYtmyQ1TZWIbc g==;
X-CSE-ConnectionGUID: 6E8MQSVOTkm4SOv+44lLUA==
X-CSE-MsgGUID: pvre4JiBRXmkGSsPZXkh1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41235857"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41235857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 11:41:02 -0800
X-CSE-ConnectionGUID: TkkiaTDjRQG+ELZhB9g30A==
X-CSE-MsgGUID: jBqApPGvSkyq7Vm0ceFtoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119369228"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.239])
 ([10.245.245.239])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 11:40:59 -0800
Message-ID: <d85b9017-bf18-444e-8d94-8ff66a0d06d2@linux.intel.com>
Date: Tue, 4 Mar 2025 20:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/{i915,xe}: Convert to DRM client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <de8325a9-49b2-48ec-ba56-4349140564b1@suse.de>
 <7ca7be00-f6d9-43b7-b3d0-0984306ac302@linux.intel.com>
 <084ab2f7-240c-45c5-8bde-7c551546d1ca@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <084ab2f7-240c-45c5-8bde-7c551546d1ca@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On 2025-02-28 09:49, Thomas Zimmermann wrote:
> Hi Maarten
> 
> Am 12.02.25 um 08:28 schrieb Maarten Lankhorst:
>> Hey,
>>
>> I'll give it a spin on xe today. It seems someone already tried on i915,
>> so I expect no issues.
> 
> Did you get to test the series?
> Sorry, should have gotten back to you sooner. Xe was working with the 
series applied. :)

Cheers,
~Maarten
