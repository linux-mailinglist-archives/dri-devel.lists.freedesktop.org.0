Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5E852D96
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 11:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1199F10E2D7;
	Tue, 13 Feb 2024 10:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEPCaTcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2710E2CD;
 Tue, 13 Feb 2024 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818672; x=1739354672;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Px1tO108kwsPJ6U65huMvd+r3RV/AbvUwkCsL4j2gBM=;
 b=iEPCaTcGZMcKnZV7UIHnUJhTNKloKfT1HVxwdET8ngkv8xxdwdDLsHN3
 OeDb8LMWfbb8WfU7yIrAoPn78OaPYQZDtPsc5SoaeHPASx0jIXWWI4Mq0
 GFAEuWyhKa2iMhHELSMUEaI+Z4Vt5gJgllH/VSKGErMghjqqoRgSnfgJq
 uSojj3IWRaTv8Cdbqour6r5DsWmyok85zr224lqj7wLQVBgmHHSac3Fuy
 u453ithBxc3H0te9N6LLNu5o9JrUDEeKz/FMLYA7h9QQKPcQisUf9g+gS
 b/P5Coi18SfLSc0gvwfVkd/S+yNjezMPZTfgl1tY0lV5tNYThT1N5hkNw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12908639"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="12908639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2890110"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:04:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Luca Coelho
 <luciano.coelho@intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH drm-misc-next] drm/xe: fix arguments to drm_err_printer()
In-Reply-To: <46f95691c86388a510f78187855d69a3d0132b82.camel@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240213084954.878643-1-jani.nikula@intel.com>
 <46f95691c86388a510f78187855d69a3d0132b82.camel@linux.intel.com>
Date: Tue, 13 Feb 2024 12:04:24 +0200
Message-ID: <87h6ic8ytz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 13 Feb 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> On Tue, 2024-02-13 at 10:49 +0200, Jani Nikula wrote:
>> The commit below changed drm_err_printer() arguments, but failed to
>> update all places.
>>=20
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes:
>> https://lore.kernel.org/r/20240213120410.75c45763@canb.auug.org.au
>> Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device
>> specific by using drm_err()")
>> Cc: Luca Coelho <luciano.coelho@intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.


--=20
Jani Nikula, Intel
