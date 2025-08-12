Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF6B22E81
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAAD10E0E9;
	Tue, 12 Aug 2025 17:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPQ4TyI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7810E0E9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:04:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C13A5A577E8;
 Tue, 12 Aug 2025 17:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1776C4CEF0;
 Tue, 12 Aug 2025 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755018287;
 bh=TaXN39wQlu2XcAIkf4Jqd33tt8qogJy/MlkjdkiPELc=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=hPQ4TyI0Z5a7uLYzDvDXSO6sLlBnVjmOEHv2o0dHeNEUeHVLf/wJTVUOMDI7vewW0
 kNcEzmQOjl4TaquG8R9X0ASHRHy05fCYbharglP4edcJqYVGksDNnPC6my3CPI++bV
 rqKcKv/8VFsZFFRWy4RdJFp0bPdoAOffoJPC+OnqA4kaAXjkSZslr5WQjzBOONx4+s
 k9B3mrhS5ncPCGdBJa1//fJOmRcdqc7QH9gFoymi7rSWgG3i6QstsAeAFA6jgGsL6c
 1KjebXOmV6cQ7GzWMImOFl5xRK7NouOC1nLSHfCWV1hq9xWnqTNw2VsPUcRVTGtaX/
 8obF2y/921s0Q==
Message-ID: <4abed396-5225-4b5c-a538-ced4f4619239@kernel.org>
Date: Tue, 12 Aug 2025 19:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
From: Danilo Krummrich <dakr@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
 <cab8be18-1cb3-49d8-a967-767174b0dc79@kernel.org>
Content-Language: en-US
In-Reply-To: <cab8be18-1cb3-49d8-a967-767174b0dc79@kernel.org>
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

On 8/1/25 11:08 AM, Danilo Krummrich wrote:
> On 7/28/25 12:16 PM, Imre Deak wrote:
>> Plumb the format info from .fb_create() all the way to
>> drm_helper_mode_fill_fb_struct() to avoid the redundant
>> lookup.
>>
>> The patch is based on the driver parts of the patchset at Link:
>> below, which missed converting the nouveau driver.
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Fixes: 41ab92d35ccd ("drm: Make passing of format info to 
>> drm_helper_mode_fill_fb_struct() mandatory")
>> Link: https://lore.kernel.org/all/20250701090722.13645-1- 
>> ville.syrjala@linux.intel.com
>> Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Any concerns if I just pick this one? It's a bit annoying to not have this fixed
in drm-misc-fixes and -next. I'd hope for -rc2 getting backmerged.
