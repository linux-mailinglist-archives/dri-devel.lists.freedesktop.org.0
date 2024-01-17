Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E2683035A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 11:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666310E65A;
	Wed, 17 Jan 2024 10:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CCB10E65A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705486582; x=1737022582;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=x+koo6dAJ9hcyhU9Em/uUTNoV9nSRdJZ/CCvxgeGLrw=;
 b=R7wBywrPL9atlvoE2uV1lsrSJR9krhwE8//LkeBdA73SYasv8rqNu00P
 zqMWK6zmldBfrFjvUVYbolkJuc69vDnxo+M55C+FS2uwbVWpIMdlmrA0e
 NOy0Bn/8WR4b6jx3VlH42Be9nPDo0A8uGOS9//+iDTFP4U2o0cwS0aVAD
 STi1tquRQ2oXcgR3mi6gWCYx38Ug1ZkjjvHNnsmloeM6U94Tw1gm2aVk4
 /EiAadpCP6TgAJ9Zv/I382czD86ZYglK/9x1LQEXLX6s+PK2H1fpnP5ec
 mCedfvefJ8ieUE2Me8uS+g1YDRIlPQluzIlPvveWwNBRziFBfsS84lmhG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="464412640"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="464412640"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787756854"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="787756854"
Received: from msznigir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:16:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC 0/4] Support for Simulated Panels
In-Reply-To: <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
Date: Wed, 17 Jan 2024 12:16:14 +0200
Message-ID: <87cyu0qn81.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Jan 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> On Tue, Jan 16, 2024 at 02:22:03PM -0800, Jessica Zhang wrote:
>> This series introduces a simulated MIPI DSI panel.
>> 
>> Currently, the only way to validate DSI connectors is with a physical
>> panel. Since obtaining physical panels for all possible DSI configurations
>> is logistically infeasible, introduce a way for DSI drivers to simulate a
>> panel.
>> 
>> This will be helpful in catching DSI misconfiguration bugs and catching
>> performance issues for high FPS panels that might not be easily
>> obtainable.
>> 
>> For now, the simulated panel driver only supports setting customized
>> modes via the panel_simlation.mode modparam. Eventually, we would like
>> to add more customizations (such as configuring DSC, dual DSI, etc.).
>
> I think that it's more complicated than it needs to be.

Both too complicated and not complicated enough! :p

> Why do we need to support (and switch to) both the actual and
> "simulated" panel?
>
> Wouldn't it be simpler if we had a vkms-like panel that we could either
> configure from DT or from debugfs that would just be registered the
> usual way and would be the only panel we register?

I get the idea of trying to test DSI code without panels, and looking at
the goals above, I think your vkms suggestion is going to fall short of
those goals.

However, my gut feeling is that creating a simulated panel to catch DSI
misconfiguration etc. is going to be insanely complicated, and this
series doesn't even scratch the surface.

I guess my questions are, what's the scope here really, are those goals
realistic, does more code already exist beyond this skeleton?

BR,
Jani.



-- 
Jani Nikula, Intel
