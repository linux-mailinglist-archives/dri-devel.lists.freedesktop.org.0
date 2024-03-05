Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C118723C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D7E10F483;
	Tue,  5 Mar 2024 16:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1RlGBDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBC510F483
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709655044; x=1741191044;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RBsB1pM+37I1FKxyzuRkXY+Jt+SjFQNHWCKoI6kPgdQ=;
 b=a1RlGBDgHWcqtUH2fEc88lq2iei7HPYzEzWFNd8FQ0AsHgnMwFY8tfw2
 VjzCweMujd3eKW5GZkfoPFjyY73gfJWlTbl+rl046WHOi08h2Ff7u32f7
 Mzp3h9GzbjoHQc8pPQkEI6w7/nLHHpCR+Xat8udT8IXLryl4wYDNbUvBD
 yZqC/PPyl0l6ifjadOxtWCFa29qrSh+g5UqIvoD04cZiSKdAELJHsGfNh
 gvrQKuohnaL9XuhwxZ6Lk7Mnq06X+UiaOhHIPakeHlmrWoASt0B/0M4qG
 8aWUAQgLkSBL4D1oiy288pjw4ILGZSC4Xn9zoKkvjoREtBr7EnijMIYJR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4342176"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4342176"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:10:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9846621"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:10:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Robert Foss <rfoss@kernel.org>, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alvin@pqrs.dk>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v3 2/2] drm/bridge: adv7511: get edid in hpd_work to
 update CEC phys address
In-Reply-To: <CAN6tsi4WzRPKRFTFcK=DwdL_Z_gJPugM1BYaZAGEq2GEkAq_TQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
 <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
 <CAN6tsi4WzRPKRFTFcK=DwdL_Z_gJPugM1BYaZAGEq2GEkAq_TQ@mail.gmail.com>
Date: Tue, 05 Mar 2024 18:10:36 +0200
Message-ID: <87h6hk1wxv.fsf@intel.com>
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

On Tue, 05 Mar 2024, Robert Foss <rfoss@kernel.org> wrote:
> Sorry to ask for this again, but this series has non-trivial merge
> conflicts with upstream again.
>
> Could you rebase it and send out an updated version?

Not just rebase, but all of bridge has been switched over to struct
drm_edid based interfaces.

BR,
Jani.


-- 
Jani Nikula, Intel
