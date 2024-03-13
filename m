Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9687A73A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 12:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F43510E1F3;
	Wed, 13 Mar 2024 11:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTKGT8Ol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EBE10E8AD;
 Wed, 13 Mar 2024 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710330477; x=1741866477;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7EL7NBFPSCPiSrkzYeMpOx6tQ6nmjhbSiQuN/1IINc0=;
 b=cTKGT8Olb0EulTEe3NERfUZblefyJ426JW3nMWZXOZk1sxGl8z7tD4dF
 GNhKA4jkEzSRq6mltUbfukZ6bmEoZFDPRnqNaiib2a5MsfikjfqvR68uS
 6fwLqmGiYa6k5XF9k1dnDMHh72oyOOBdpVblIHkWcLk4AJqbWaM7XxI3B
 eeliyZl3cZWjL8Z+bzDEsf1GhfuBTOqYXYOKgXKDri0TBIWqUvgCJxTra
 lQZszELgQKOPtyEvw0imrkqkuqJ5Sl/SorTcOVxbVLHC7i/6QSnx6BKjc
 +z+xUGQEddShFesk3yoQSyiBllO7w6rVYWVS79FyUJex71DqQyZgWrThg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5270071"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5270071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 04:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16551865"
Received: from jbakowsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 04:47:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm: fix .get_modes() return values
In-Reply-To: <f765ad88-d166-488c-a516-ccac462b6dbd@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709913674.git.jani.nikula@intel.com>
 <f765ad88-d166-488c-a516-ccac462b6dbd@suse.de>
Date: Wed, 13 Mar 2024 13:47:51 +0200
Message-ID: <878r2ms68o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 08 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> for the series.

Thanks, pushed the lot to drm-misc-next-fixes.

> Do you plan to make the return type an unsigned int eventually?

Not really. The hooks could still return -ENOMEM or something, with no
compiler warnings, and you'd be screwed because you wouldn't even have a
way of checking. You'd just get 4294967284 modes.


BR,
Jani.

-- 
Jani Nikula, Intel
