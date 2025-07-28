Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D19FB139C3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 13:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C0A10E4E4;
	Mon, 28 Jul 2025 11:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PK5wL2V3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F05010E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753701567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knoW5hXdYfxlMfaIaGdm6JpvBEpBbVPIky2WIJsx7bU=;
 b=PK5wL2V3jUtETv7arVhWZsV1b41Xr3EZeATE8kwrw3/V9SVAw00S/Xuf194PQ+winstPiY
 jhJH6lvP7rLFY/ZeNhBaiUFXCMBpM4el9D4OyFoE/1KrXl99v6V2RcASyMlzjiW8jNiM22
 yMwIYz2uBmdpN51qfp4A1YGS6gfH0TI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543--44W0NqjMvKqwaYArE_QxQ-1; Mon, 28 Jul 2025 07:19:23 -0400
X-MC-Unique: -44W0NqjMvKqwaYArE_QxQ-1
X-Mimecast-MFC-AGG-ID: -44W0NqjMvKqwaYArE_QxQ_1753701563
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4eeed54c2so2095978f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 04:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753701563; x=1754306363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=knoW5hXdYfxlMfaIaGdm6JpvBEpBbVPIky2WIJsx7bU=;
 b=oshC227hryc12u6TfFH34Xym+hkvJtXAE2LoLYgkFLEz2H3WvuXhOe+uk7J29NNW3U
 GTof9uotoCQbbTGtgLAMkneJlhqJQkCRcvau/NsT+BpsXPX65pioWCqxf5RRl8fKtj+J
 PsSWoQo3pHL/9gxWRuMbDgozOc+/8Qxp3OHeOePe5SGzVQv+BsAvjGTu16azQpSpOwZu
 sfjwACO7e6zFZPq6wjlNOFx3tvC/wFBiHq/hkN9D9sVTZ1t4LeG9t4tdgkwppfZL84LO
 zmzQI/covdOUDWKansluQaNIJWUgaPht+J18f+ex7eztUORPZoHWvfM+ObXX9gcAnvji
 OGaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe4zHOo2D+Hewo3oFGFPoEC2DWnC7/8nZz13FzuzWuskAO+NlQ0btPz7kgqEJ4MBHULmiHunuEmhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz14bKwg5iuRPEFeZ8PUUhc4W6IOskSVp3tQ/HnpV4eT4QCs43E
 5G8KttvhpaIiRdFy76M4P9KLYjgrZ410oLzeAS3/doadOamPPV633n1SUfG+/3XJzaAiK+9GmDu
 a6OrPr9nEUbS6UnkqveTcKWar5psqedxntJIuNJFqTRoUe1hoCASpAIz7eJqIXennbxg/cg==
X-Gm-Gg: ASbGnctqww72v6AgMJoo4nDTdqBalOEBo1IMjX+AsH+OJv1deR8BSW4eZ5PRI0m5EAb
 WdDasaOEUFu8cUtYDNNAljv9/aq77oCuMIgxxFugkrqwxWSl7GOUI+N84Mfg+7PEhgjs0jfWASC
 bys3DYjN1jANc+WGHLqNCipi0GAc9pI0BQXP8cZyDImah1hB/K831KN4uxr+1zw+TmF0PLk/wq4
 CjvH7meIZMbxt7svCPxheil2L7WGBst0HQDee+W+irC9LzsM8W8cZ4TggVxH/LMaEJvtR0A9P14
 txH3rziGPInyE6W/GnDNDt9U4AMXFUyGVsmRtn00e1GeXWmwdoRr2FIP6eX0ew3ENDKAH2nDp+N
 7Vl8=
X-Received: by 2002:a05:6000:188e:b0:3b7:6d95:56d2 with SMTP id
 ffacd0b85a97d-3b776726a56mr8486694f8f.7.1753701562462; 
 Mon, 28 Jul 2025 04:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuXibLYD4lVfKwwNJUe9jSKZO7qPSJvy9uo0aYNRx6AYDFqEJHDqBJXZr+qlT8lrhUVJX5RA==
X-Received: by 2002:a05:6000:188e:b0:3b7:6d95:56d2 with SMTP id
 ffacd0b85a97d-3b776726a56mr8486656f8f.7.1753701561737; 
 Mon, 28 Jul 2025 04:19:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac5816dsm94919535e9.17.2025.07.28.04.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 04:19:21 -0700 (PDT)
Message-ID: <a7ada116-5613-4518-a151-7c8db9874ede@redhat.com>
Date: Mon, 28 Jul 2025 13:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] drm/i915/display/i9xx: Add a disable_tiling()
 for i9xx planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <20250618094011.238154-4-jfalempe@redhat.com> <aHviiKb0EnQbNksL@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <aHviiKb0EnQbNksL@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _wE7-KIi9cwDr7Fq0O53wIANFmEWWsz812-Ghfuw4B4_1753701563
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 19/07/2025 20:23, Ville Syrjälä wrote:
> On Wed, Jun 18, 2025 at 11:31:21AM +0200, Jocelyn Falempe wrote:
>> drm_panic draws in linear framebuffer, so it's easier to re-use the
>> current framebuffer, and disable tiling in the panic handler, to show
>> the panic screen.
>> This assumes that the alignment restriction is always smaller in
>> linear than in tiled.
>> It also assumes that the linear framebuffer size is always smaller
>> than the tiled.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v7:
>>   * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)
>>
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
>>   .../drm/i915/display/intel_display_types.h    |  2 ++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> index 8f15333a4b07..0807fae12450 100644
>> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
>> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> @@ -905,6 +905,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
>>   	.format_mod_supported_async = intel_plane_format_mod_supported_async,
>>   };
>>   
>> +static void i9xx_disable_tiling(struct intel_plane *plane)
>> +{
>> +	struct intel_display *display = to_intel_display(plane);
>> +	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
>> +	u32 dspcntr;
>> +	u32 reg;
>> +
>> +	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
>> +	dspcntr &= ~DISP_TILED;
>> +	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);
>> +
>> +	if (DISPLAY_VER(display) >= 4) {
>> +		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
>> +		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
>> +
>> +	} else {
>> +		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
>> +		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
>> +	}
>> +}
> 
> I thought I already shot this down before, but apparently this
> got merged now :(

Sorry for that. I replied to that thread, but I didn't get answer [1]

> 
> Just to reiterate why we don't want these 'disable tiling' hacks:
> - different tiling formats have different stride/alignment/watermark
>    requirements so one can't safely change from one tiling to another

I agree that going from one tiling format to another is not safe. But 
from my understanding, going from tiling to linear should be possible.
Do you have an example, where the stride/alignment/watermark requirement 
in tiled would be incompatible in Linear (for the same resolution)?

> - this completely fails to account for the TILEOFF vs. LINOFF stuff

Pardon my ignorance, can you explain what it is, and how it can break or 
make the output unreadable?

> - etc.
> 
> So IMO these hacks must be removed and instead the code must learn how
> to propetly write the tiled data. igt has all the code for that btw
> (twice over IIRC) so shouldn't be that hard.

Regarding the tiling format, I usually test on hardware to check that 
the image is correct. But I have only a few of them, and as the format 
is platform dependent, and sometime also depends on the memory 
configuration. For me it looks very hard to get it right.
I've done it only for Y-tile and 4-tile, but only when DPT is enabled 
(which means it's only the few latest generations).

> 
> I suppose the only hack we need to keep is to disable compression,
> mainly because (IIRC) on flat CCS systems the CPU doesn't have access
> to the AUX data to clear it manually.
> 
> I also wonder if there are actual igts for this? I think what is needed
> is a test that sets random things (different panning, rotation, pixel
> foramts, etc.) and triggers the dumper. Not quite sure how the test
> could validate that the output is correct though. CRCs might be a bit
> tricky since you need an identical reference image.

No, I didn't write igts for this yet. I test by triggering a kernel 
panic, as it's the only way to make sure it works.
Also I didn't consider rotation yet, I think if the panic screen is not 
rotated, it's still useful.

> 
> /me off to summer vacation. Good luck
> 

Sorry for that, my goal is just to have drm panic working on intel GPU.
Enjoy your vacation, and let's find a solution when you're back.

[1] 
https://lore.kernel.org/intel-gfx/72fa1da6-caaa-41c9-aef1-4e780bde6acf@redhat.com/

Best regards,

-- 

Jocelyn

