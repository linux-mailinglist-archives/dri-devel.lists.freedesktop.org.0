Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E1B17ED4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9206010E80E;
	Fri,  1 Aug 2025 09:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RN3BCOCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC3F10E80E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:08:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B64885C32DC;
 Fri,  1 Aug 2025 09:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009F9C4CEE7;
 Fri,  1 Aug 2025 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754039304;
 bh=Wwfm+ihnLV9eCgYXL5kz1l4gAiCLzl5ZWtUrD64XccE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RN3BCOCKUGAk6dG/E0WOE2BDThUQZReetOanIUk3s4HQessl1S1XjQ8Ibs1dI4vr+
 4D7Fugm6Pl948ZDIHIEU4pJGeoBCHFnoyIHkkawz01jIPHZgyJLpoXVPIgw+GPsscI
 PKWQLvYjreJ+KkQaJUWN6uWdTJOJLXwKww30Mab9me/bjYBEVtm+u/YF1E5wAx6pmJ
 P5X6izQPUw3CpAb0mzXdMMHIQDEOi9vB/d3pH/oX9LYAOQBiI9gzcz8yd9syo7omv4
 7G0o7ztD3+M5JxcuGqRNTnt0WM012BrgfVihovRBPx4yMuLlIFounVXjqfNhM3L0Op
 u2K9HeSbBM6jQ==
Message-ID: <cab8be18-1cb3-49d8-a967-767174b0dc79@kernel.org>
Date: Fri, 1 Aug 2025 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
To: Imre Deak <imre.deak@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250728101603.243788-3-imre.deak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/28/25 12:16 PM, Imre Deak wrote:
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.
> 
> The patch is based on the driver parts of the patchset at Link:
> below, which missed converting the nouveau driver.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
> Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
