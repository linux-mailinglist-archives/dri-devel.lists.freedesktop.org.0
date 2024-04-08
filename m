Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5214A89BF0A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 14:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C9511252F;
	Mon,  8 Apr 2024 12:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TMNCsKqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92F911252F;
 Mon,  8 Apr 2024 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eDXHmg+hB54vfGTdBE+ySb38bToaOqoOHygvArB9zrc=; b=TMNCsKqolYs++0eSzKpvgD0CHp
 r1weVuYRLzSCZ94h8TlX8qdlhsgb1ZtDd7QBB7+dNI6qyheWqi37HWcyf2bS6FPKxR1tV9RGJ1wgl
 jkRIC99yQADOMke9mQBIQQda9rGRAOZaLanzpjDorMGBeFKFR1aBx9nnk6BRojzBbNQ7nm9EEU/Wd
 FbIxpo12NrDIv/o78jXhdRSvnKvQFvcG9eA2kfJkGf9wcRS5e1X/IbLZV9PYPnwyCkes0rtUkWUwm
 rLFOwmC7rwFdL2sHuIzmoOOVENrTqUj7j96cbvZA0GHJed8ayipszDpx5OVcZJhaephBsAMdaEGZR
 f7xhb4CA==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rtoDP-002V4D-HX; Mon, 08 Apr 2024 14:35:12 +0200
Date: Mon, 8 Apr 2024 09:34:43 -0300
From: Melissa Wen <mwen@igalia.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH 0/4] drm/edid & drm/i915: vendor and product id logging
 improvements
Message-ID: <2qptajfrvnotxjyymphzrqyjxcrof46rlnjto62j6wtkanzk5g@e6oek426opcj>
References: <cover.1711015462.git.jani.nikula@intel.com>
 <87zfucdu9v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfucdu9v.fsf@intel.com>
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

On 04/02, Jani Nikula wrote:
> On Thu, 21 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > Jani Nikula (4):
> >   drm/edid: add drm_edid_get_product_id()
> >   drm/edid: add drm_edid_print_product_id()
> >   drm/i915/bios: switch to struct drm_edid and struct
> >     drm_edid_product_id
> >   drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()
> 
> Ping for reviews please? This should be helpful in eradicating one class
> of drm_edid_raw() uses.

Hi Jani,

I took a look at the series. AFAIU your solution with
`drm_edid_product_id` mostly fits AMD display driver needs, except that
it needs the `product_code` split into two parts (like manufacturer
name) because the driver handles prod_code parts to configure a register
for audio, as in the path below:

1. https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c#L113
2. https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/drivers/gpu/drm/amd/display/dc/core/dc_stream.c#L90
3. https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c#L873

What do you think on keeping `prod_code` split into two part in
`drm_edid_product_id`?

(cc'ing some AMD devs that might have a better understanding of this use case)

Thanks a lot for addressing this pending issue!

Melissa

> 
> BR,
> Jani.
> 
> 
> >
> >  drivers/gpu/drm/drm_edid.c                | 50 +++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_bios.c | 49 ++++++++++------------
> >  include/drm/drm_edid.h                    | 28 ++++++++++---
> >  3 files changed, 94 insertions(+), 33 deletions(-)
> 
> -- 
> Jani Nikula, Intel
