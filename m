Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD28AE89C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2293D1133CF;
	Tue, 23 Apr 2024 13:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzWX+VMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BE51133CD;
 Tue, 23 Apr 2024 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713880191; x=1745416191;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=F5ZwzNOM8YYxa0GgmYoO/rKq3WxU/435xGcYnQ0eYjg=;
 b=PzWX+VMvPsRUWZ2dMw1gp9kehl0fE0RL9fYu1Tk0TKta+ioV0bUfkSoZ
 IoWYCzeENBSrjmiDQw4gB7CZQSN3s6zMw4yg6mPW14JqxXpz+MKisrCmh
 F85VKqC911Ag0+/k0+vNQkOJaG/yG46/DH37+22sa+0+Jlw5ZAwICUrfv
 CyesPUpFyOrJI8CihHPODE1xkzXF2ZHH00r7W+bKLoDvYmof69dsE44uq
 dyTQ1XcnO2RQ6RmgpnB2BQrgOetItz4xhVcUD7dJ2Nko/XX5+PzNoFE7V
 x+Aker0hxr0TFKd+xvPpkqi7NKPNwaOOCesNpC2jSXOKLUhvvuDbFzpCk Q==;
X-CSE-ConnectionGUID: sIi4O1rxQTeYM5BNmzaNAQ==
X-CSE-MsgGUID: 2QHVrWbgTGyVBIOdWkaOkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9328676"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9328676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:49:50 -0700
X-CSE-ConnectionGUID: XYVmQ3A3TiirawFUXYiPfQ==
X-CSE-MsgGUID: xcwfNnyjTre0QeCTDMC3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="61835295"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:49:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "javierm@redhat.com" <javierm@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Deak, Imre"
 <imre.deak@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 6/6] drm/{i915,xe}: Implement fbdev emulation as
 in-kernel client
In-Reply-To: <275e85aa8165204bcfe8ff6039356cd0f3577c61.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240409081029.17843-1-tzimmermann@suse.de>
 <20240409081029.17843-7-tzimmermann@suse.de>
 <d164f7d9b0fab2573c9c9781cab17b02c4cdce46.camel@intel.com>
 <1517673a-50da-4f66-958c-1222b1dfc4a6@suse.de>
 <275e85aa8165204bcfe8ff6039356cd0f3577c61.camel@intel.com>
Date: Tue, 23 Apr 2024 16:49:42 +0300
Message-ID: <87a5lkrxxl.fsf@intel.com>
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

On Tue, 23 Apr 2024, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> On Tue, 2024-04-23 at 13:13 +0200, Thomas Zimmermann wrote:
>> Thank you so much. All patches has R-bs. Can you add the series to
>> the intel tree?
>
> Is it ok to merge patch 01/06 via intel tree as well?
>
> Rodrigo, This set is containing Xe display changes as well. Is it ok to
> push this via drm-intel?

For that we'll need an ack from the xe maintainers; usually Lucas for
the display stuff.

BR,
Jani.


-- 
Jani Nikula, Intel
