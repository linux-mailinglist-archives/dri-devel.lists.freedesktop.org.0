Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5F8672E3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C910F068;
	Mon, 26 Feb 2024 11:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ8Koq38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77ED10F068;
 Mon, 26 Feb 2024 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708946420; x=1740482420;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ebfQqnPQVSD0OLSlfPoVFPLfxXa7rGkBnVgKvxWgKNQ=;
 b=fZ8Koq38Z7Pc7hpo3zWpcpXQ37ue4ImTrT+VVecqWW3cqMsboXbZps/t
 0VaaDeU0YJMLt/YVokx7KWU3lBrRGKUfsCtF1X+Sw3rHdNxxvi2byiPPZ
 Ei3UDvsvyA9LeqS5PjI6ePuC9OgUcvMl51uUybS80dixlze8P40UQI22i
 YW1TgSgyCzx55mblScDeVToiTPB2Q+PhuFYQgYsfghBzmWflmVILXo2Tx
 davhoS9n65p61211kngD4+4nbndbntFnuPz5Qof1S1jhRWJ9d6Le0YwsL
 K3ljV+c4M6oUL4SmSkiUDr1iIis1b9iGnfW6VQMXkdQiJ9j4SPiA4/B9F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28649290"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="28649290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="44117309"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:20:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Matthew
 Brost <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] drm/xe: skip building debugfs code for
 CONFIG_DEBUG_FS=n
In-Reply-To: <zospejkdqekbndbov3ubbbvr5skxwohezeslzciivhxakfjoek@oa5sp2ffcfix>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240213134817.3347574-1-arnd@kernel.org>
 <877cj88lck.fsf@intel.com>
 <17209419-093b-4674-8b43-06c92312ef61@app.fastmail.com>
 <ngu6vq5izal6suyr57p4vlxnrn4kxyii4ewdktxvw7k3uezlcz@6oevav3wpcjh>
 <20240221172117.243799cf@canb.auug.org.au>
 <zospejkdqekbndbov3ubbbvr5skxwohezeslzciivhxakfjoek@oa5sp2ffcfix>
Date: Mon, 26 Feb 2024 13:20:10 +0200
Message-ID: <87h6hvo4k5.fsf@intel.com>
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

On Wed, 21 Feb 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Looking at drm-intel and drm-misc, they are using a special
> for-linux-next. We may eventually adopt the same workflow, but I will
> have to check with other maintainers.

The idea is to try to better reflect what's actually going to next. For
example, drm-intel-next starts targeting "next next" after about
-rc6. But we haven't properly automated the cutoff point, it only kicks
in at release. So there's still a window when linux-next sees "next
next" stuff that gets dropped. Using drm-xe-next directly makes for a
longer window.

BR,
Jani.

-- 
Jani Nikula, Intel
