Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5FC906690
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA2110E258;
	Thu, 13 Jun 2024 08:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Hp1x7AWx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6704610E258
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718267175;
 bh=+jqe4V/X8c/P2i/iDVHFbcM7D2Q34xqr9KdThWtNit4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hp1x7AWx8Xqk3h9GV80PFt26aewD/3Xjz2sBgREE/eZIUzraVC0PSKLjUvMudo/5Q
 GiL5WY4usC3oN+IiqFubIQwPa2xAnfwG6L169pXeBBQJCJqCTYZNsRpxTpABtG4q9K
 2JQhLNsnthhb/GauuqbUH6aMYxWLLul85fR+txYPmIZk0onsggm2x9JHr68PLJl7KR
 Pq6CTR8Spff5Sys7vS+CCaEqe/IxLVbWBnAYKrhCXhVyV5r7IMvU/26F8HWv45EQVR
 2GXODbo2BERocWylVHZYITRjiNXFxhHNTTiPhxT9fhyQ6AsJlDepmUGzJEl2jyY1x+
 KEFbOgMvTfN8w==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6CB843782172;
 Thu, 13 Jun 2024 08:26:12 +0000 (UTC)
Message-ID: <bd430442-6074-44b1-ba62-d3fa9e7bf28e@collabora.com>
Date: Thu, 13 Jun 2024 13:56:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/ci: add tests on vkms
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mairacanal@riseup.net,
 hamohammed.sa@gmail.com, robdclark@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 daniels@collabora.com, helen.koike@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org
References: <20240611091037.558969-1-vignesh.raman@collabora.com>
 <20240613-bipedal-eccentric-locust-91632b@houat>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240613-bipedal-eccentric-locust-91632b@houat>
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

Hi Maxime,

On 13/06/24 13:07, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jun 11, 2024 at 02:40:37PM GMT, Vignesh Raman wrote:
>> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>> new file mode 100644
>> index 000000000000..56484a30aff5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>> @@ -0,0 +1,15 @@
>> +# Board Name: vkms
>> +# Bug Report: https://lore.kernel.org/dri-devel/61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com/T/#u
>> +# Failure Rate: 50
>> +# IGT Version: 1.28-g0df7b9b97
>> +# Linux Version: 6.9.0-rc7
>> +kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
>> +kms_flip@basic-flip-vs-wf_vblank
>> +kms_flip@flip-vs-expired-vblank-interruptible
>> +kms_flip@flip-vs-wf_vblank-interruptible
>> +kms_flip@plain-flip-fb-recreate-interruptible
>> +kms_flip@plain-flip-ts-check
>> +kms_flip@plain-flip-ts-check-interruptible
>> +kms_flip@flip-vs-absolute-wf_vblank
>> +kms_flip@flip-vs-absolute-wf_vblank-interruptible
>> +kms_flip@flip-vs-blocking-wf-vblank
> 
> We should have the header for every line here

All the flakes in these tests were observed with version 
6.9.0-rc7/1.28-g0df7b9b97. So can we group them together?

If we update this file for different IGT/kernel version, we can add a 
separate header for each test.

Regards,
Vignesh
