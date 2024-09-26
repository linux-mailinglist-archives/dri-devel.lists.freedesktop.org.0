Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F39874C9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B688F10EB58;
	Thu, 26 Sep 2024 13:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YATTRnED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DB910EB58
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727358792; x=1758894792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ND/1xBvLBSuXe4AjzPrNWI9z84lQZHUe5JfMy6brvqQ=;
 b=YATTRnED+3bYUsPqYJdVLNmyAkKf0cG9ox+tznFP/6/sFGgFQYEH4CNa
 AN4hiyTYXpiTLntOdQH2wUsUtZTKlHzrw20pmBw/0ZAiDMy02V5n644R0
 Ewb3fyuGu0pJYS2VJQvGH+Nhx6CnjodREi5xjQHOFhytLbkuTgdxn6dL+
 XbW28lk4lXvXWdaGkrtpmSi7M/oC6ZzIjkWEmnhsXpgKy16yC+xL21PaP
 CM2ihI2XMeC30/KMpOcuV8UUmLv6formkTE/tRJZ8/Yzg0N4yEC09uoOG
 fq6cfq3pzDHTNB8DdRgBo4/Tn/ScAbjH/7OWowpLi0yIZrUUojnFWPdZ/ A==;
X-CSE-ConnectionGUID: l1/1z33fTzO2JrSMskpJhw==
X-CSE-MsgGUID: YVmvw9NSSbKQhQmfWj5FUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37834084"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37834084"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:53:09 -0700
X-CSE-ConnectionGUID: uSssNbZ4RS+xB+DmXFZ5kA==
X-CSE-MsgGUID: 9BM+1VfQTyW3py7BwSvSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="109638954"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:53:09 -0700
Date: Thu, 26 Sep 2024 06:53:07 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Print bad EDID notices only once
Message-ID: <ZvVnQ2Y6kZA1OtOO@tassilo>
References: <20240926133253.2623342-1-ak@linux.intel.com>
 <4c0879cf-d738-4651-8a06-6da0bf2c2c9b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c0879cf-d738-4651-8a06-6da0bf2c2c9b@amd.com>
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

> It may be a good opportunity to switch these over to drm_notice_once()
> instead.

I looked at it, but the callers to several levels don't have the
drm pointer that would be needed for that. It would require changing
them, and then all the drivers which call into the generic EDID code.
And even there the callers don't necessarily have
the pointer, so it would need more changes in drivers.

Maybe that's a good idea but I don't want to turn this into a gigantic
patch.

-Andi
