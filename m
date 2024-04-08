Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969889C4E0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B95711260C;
	Mon,  8 Apr 2024 13:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PrjqwTii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26324112602;
 Mon,  8 Apr 2024 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zLskL31CXPFw0hebd6a+B+/H6SKHs7F0aF3tsXv1DXw=; b=PrjqwTiiKXS2sVV7kImggR9U0M
 Nnc7Ga9g8FE2ln4QGStvt1hqttLjiBaza2lQzx2j6g7iOcvi+EGdRW2wQ3EtlI0iulgf+93Et7zeF
 AtEhQy5BjgUpknhHy1imTDRlUpdzI9DkMHgRrtvK66lSwQgFxjLUBs5qg9S7fcGTi/x4LYf9tXme+
 t8ZLOZRuKc4V8tBh2XyPIXfRd3FulxqNEhdXWfAot7WWZc0sb0qOk+VSHPXdNzaXer7lN8o16sJxC
 eUiEHnr4fjhk0n1PevjBQ3ea6pG8ZCcYDYFpPf3qV22thkCkp9324Swq3m7LwlSkzfPjCfqqD2EQX
 ArKT7XmQ==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rtpOh-002WH3-2I; Mon, 08 Apr 2024 15:50:55 +0200
Date: Mon, 8 Apr 2024 10:50:13 -0300
From: Melissa Wen <mwen@igalia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, 
 Alex Hung <alex.hung@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 airlied@gmail.com, 
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v3 0/6] drm/amd/display: switch amdgpu_dm_connector
 to use struct drm_edid
Message-ID: <tzk6ln5mgbxrjukfl624qvp5ejkxhcomfzsm44vuedtsbh5onb@w2sqvvfq2lxm>
References: <20240327214953.367126-1-mwen@igalia.com>
 <87zfuig19l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfuig19l.fsf@intel.com>
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

On 03/28, Jani Nikula wrote:
> On Wed, 27 Mar 2024, Melissa Wen <mwen@igalia.com> wrote:
> > 2. Most of the edid data handled by `dm_helpers_parse_edid_caps()` are
> >    in drm_edid halpers, but there are still a few that are not managed by
> >    them yet. For example:
> >    ```
> > 	edid_caps->serial_number = edid_buf->serial;
> > 	edid_caps->manufacture_week = edid_buf->mfg_week;
> > 	edid_caps->manufacture_year = edid_buf->mfg_year;
> >    ```
> >    AFAIU I see the same pending issue in i915/pnpid_get_panel_type() -
> >    that still uses drm_edid_raw().
> 
> See https://lore.kernel.org/r/cover.1711015462.git.jani.nikula@intel.com

Thanks!
I'll work on top of your series.

Melissa

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
