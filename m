Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB3A5D49B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 04:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13B110E6AE;
	Wed, 12 Mar 2025 03:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A0Ki10Pk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91410E6AE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 03:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741748785;
 bh=NxWtveOedIz2/jaXP/aZXRUu4jabOktCckMz34Uj7Wg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A0Ki10PkPRnhNcY+anxDKfZ6/+s2M3nM0tBtcH7SIcFvRM2pf3mzc1t3WEEp6PoBG
 9gh1djWyHlPuYdu1XEJ+8HxyJvIkmYpLtp2Fi6a820oCDu5GNVNWmMAWPqWPyjsF7Z
 4yVrqTCl/ZpxkWv0hZkfS38a7NREG/0MEO2aZT/4OiLleER18KpRSewwvEy5K4JVf8
 mVcYSm4SVtVdh4ExCP4/vycPqc5dMhNsMN330824cfrSx+0+lVKywZ3fjWrA9rCo/u
 08uhM2tVLp05OESS9mS+Cl2NM/xaBhq/XQINnVE1w/pnKbdGqAaiDFsV1FR4ZnR7mU
 vFq+wstPl6pwQ==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E94E17E0F83;
 Wed, 12 Mar 2025 04:06:22 +0100 (CET)
Message-ID: <46f78829-a65a-4cd9-b35a-7608e547096d@collabora.com>
Date: Wed, 12 Mar 2025 08:36:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/ci: enable lockdep detection
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, boqun.feng@gmail.com, linux-kernel@vger.kernel.org
References: <20250217053719.442644-1-vignesh.raman@collabora.com>
 <CAPj87rNUMDMUtrfV=8c_+T5VQ0FykjpR5JW5dgO4grYXpabSdQ@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rNUMDMUtrfV=8c_+T5VQ0FykjpR5JW5dgO4grYXpabSdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Daniel,

On 10/03/25 13:53, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Mon, 17 Feb 2025 at 05:37, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> This patch series enables lockdep detection in drm-ci. Any lockdep
>> failures will be shown as warnings in the pipeline. This series
>> also enables CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex slowpath
>> debugging and refactors software-driver stage jobs.
>>
>> Test run with this series,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1366054
> 
> Series is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> 
> Please merge at will.

applied to drm-misc-next

Regards,
Vignesh

> 
> Cheers,
> Daniel

