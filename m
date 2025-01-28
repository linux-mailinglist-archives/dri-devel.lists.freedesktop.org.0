Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4CA2093E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 12:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EFB10E64E;
	Tue, 28 Jan 2025 11:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GqySkiFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447C610E64E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738062581;
 bh=FCzCdXDixomOPjcHMbLKXnIA0J7l3YwpyrSrtlH3Sns=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GqySkiFd/bE9lc9FiSczCh+QZI1Zw6gjiViMffGWZeL6JbZElP53tP1PMVej9NhFs
 rHdIvfS5z3uruMTyxiM/2kUoO53C09fJe4wMkaGZuMTrIZ8i4sedOjFRBPGcNpnYQz
 FDthnsSzoyLYrngVCvn6yTTdHn9Sve35pghxKhCepZyivbG8WR5AsWROS7/8SiGELJ
 cDudq4JQ46k3MM4cnnm6Nzitc11j2cX2xgy55eoAkDviKKetO+oSCQm2Z4CFqVkSyr
 SHVM+scxa64yOL0WsaWYZSc3hhuf5U+0mPmKR3gT9x3EUaFNxs63cxBBJK2bURkBPP
 GmJG8T+e/1pVg==
Received: from [192.168.1.90] (unknown [188.27.43.189])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5886417E0E6E;
 Tue, 28 Jan 2025 12:09:41 +0100 (CET)
Message-ID: <65dc1384-88cc-480c-a028-f927ed2419df@collabora.com>
Date: Tue, 28 Jan 2025 13:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fixup drm_atomic_helper_connector_hdmi_check()
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20250114-hdmi-conn-null-mode-v3-0-16bca91e11b0@collabora.com>
 <xbo2usn3yo4gvdng76nr2mdvvotsiqmler65kn2irwpywy4fin@wrxhoakcbmef>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <xbo2usn3yo4gvdng76nr2mdvvotsiqmler65kn2irwpywy4fin@wrxhoakcbmef>
Content-Type: text/plain; charset=UTF-8
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

On 1/28/25 11:58 AM, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jan 14, 2025 at 08:16:55PM +0200, Cristian Ciocaltea wrote:
>> Fix a NULL pointer dereference discovered while unloading a DRM module
>> and provide a test to make sure the helper works as expected in case the
>> connector's CRTC is shut down.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> I'm sorry, I didn't realize it at the time but it looks like it was made
> redundant by another series that got merged about the same time you were
> sending this one:
> 
> https://patchwork.freedesktop.org/series/143378/
> 
> Sorry again,

No worries.

I checked the merged series and I think some bits from this series are
still applicable:

* Simplify the NULL verification by considering only the return of
connector_state_get_mode(), which gets rid of the redundant
'new_conn_state->crtc' check, but also covers the additional checks
already performed in that function.

* Update the newly introduced test case to also verify
{mode|connectors|active}_changed.

I could send those as v4, but probably it makes sense to drop this
series and start a new one - please let me know if you have a preference
here.

Thanks,
Cristian
