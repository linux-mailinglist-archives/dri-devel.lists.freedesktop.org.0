Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3DE84E907
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 20:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B171410EB5D;
	Thu,  8 Feb 2024 19:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="QNr9IyUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8BB10EA3F;
 Thu,  8 Feb 2024 19:38:50 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TW6jj2sM7z9x0K;
 Thu,  8 Feb 2024 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1707421129; bh=3uZZ663Iw8qOtEON6/E2sVP8Hg1calJtYzgS09ZkE/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QNr9IyUa7xGjs+511ocQOgMJ30Gu0SeKItSIGxYTeReClCCM2CQeZKNswKzoPLCTv
 00Sa1neh1Vft6m44BE211C70HD7QIaWwfi+91ZsO24API4eBEKiHfLdbrfDjHD/Ugd
 U80ujw06XTZD/QNNlqgsJoUCTD8QRC7t5C/gu9UM=
X-Riseup-User-ID: C33EC1A30DF1C9A757FC0A396E8030443A0ECEE42A09605A3245A6A47558C0A9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TW6jR0h87zFsZ0;
 Thu,  8 Feb 2024 19:38:34 +0000 (UTC)
Message-ID: <738490ac-56a9-4408-8de7-63de059d0a54@riseup.net>
Date: Thu, 8 Feb 2024 16:38:31 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] benchmarks: Add VKMS benchmark
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240207-bench-v1-1-7135ad426860@riseup.net>
 <20240208115050.73d04796@eldfell>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240208115050.73d04796@eldfell>
Content-Type: text/plain; charset=UTF-8
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



On 08/02/24 06:50, Pekka Paalanen wrote:
> On Wed, 07 Feb 2024 17:17:15 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> 
>> Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
>> odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
>> frames flipping framebuffers in each plane.
>>
>> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
>> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>> This benchmark was suggested by Pekka Paalanen on [1] to better analyse
>> possible performance regression on the Virtual Kernel Modesetting(VKMS)
>> driver.
>>
>> With this benchmark I was able to determine two performance regression:
>>
>> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
>> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
>>
>> [1]: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
>> ---
>>  benchmarks/meson.build   |   1 +
>>  benchmarks/vkms_stress.c | 203 +++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 204 insertions(+)
>>
>> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
>> index c451268bc44f..3aa66d6dffe2 100644
>> --- a/benchmarks/meson.build
>> +++ b/benchmarks/meson.build
>> @@ -20,6 +20,7 @@ benchmark_progs = [
>>  	'kms_vblank',
>>  	'prime_lookup',
>>  	'vgem_mmap',
>> +	'vkms_stress',
>>  ]
>>  
>>  benchmarksdir = join_paths(libexecdir, 'benchmarks')
>> diff --git a/benchmarks/vkms_stress.c b/benchmarks/vkms_stress.c
>> new file mode 100644
>> index 000000000000..b9128c208861
>> --- /dev/null
>> +++ b/benchmarks/vkms_stress.c
>> @@ -0,0 +1,203 @@
>> +/*
>> + * Copyright © 2024 Arthur Grillo
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the next
>> + * paragraph) shall be included in all copies or substantial portions of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>> + * IN THE SOFTWARE.
>> + *
>> + * Authors:
>> + *    Arthur Grillo <arthurgrillo@riseup.net>
>> + *
>> + */
>> +
>> +#include "igt.h"
>> +
>> +#define FRAME_COUNT 100
>> +
>> +struct rect_t {
>> +	int x, y;
>> +	int width, height;
>> +};
>> +
>> +struct plane_t {
>> +	igt_plane_t *base;
>> +	struct rect_t rect;
>> +	uint32_t format;
>> +	struct igt_fb fbs[2];
>> +};
>> +
>> +struct kms_t {
>> +	struct plane_t primary;
>> +	struct plane_t overlay_a;
>> +	struct plane_t overlay_b;
>> +	struct plane_t writeback;
>> +};
>> +
>> +struct data_t {
>> +	int fd;
>> +	igt_display_t display;
>> +	igt_output_t *wb_output;
>> +	drmModeModeInfo *mode;
>> +	struct kms_t kms;
>> +};
>> +
>> +static void plane_create_fb(struct plane_t *plane, int fd, size_t index)
>> +{
>> +	igt_create_fb(fd, plane->rect.width, plane->rect.height,
>> +			plane->format, DRM_FORMAT_MOD_LINEAR,
>> +			&plane->fbs[index]);
>> +}
>> +
>> +static void plane_create_color_fb(struct plane_t *plane, int fd, size_t index, double r, double g,
>> +				   double b)
>> +{
>> +	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
>> +			plane->format, DRM_FORMAT_MOD_LINEAR,
>> +			r, g, b,
>> +			&plane->fbs[index]);
>> +}
>> +
>> +static void plane_setup(struct plane_t *plane, int index)
>> +{
>> +	igt_plane_set_size(plane->base, plane->rect.width, plane->rect.height);
>> +	igt_plane_set_position(plane->base, plane->rect.x, plane->rect.y);
>> +	igt_plane_set_fb(plane->base, &plane->fbs[index]);
>> +}
>> +
>> +static void gen_fbs(struct data_t *data)
>> +{
>> +	struct kms_t *kms = &data->kms;
>> +	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
>> +
>> +	for (int i = 0; i < 2; i++) {
>> +		plane_create_color_fb(&kms->primary, data->fd, i, !i, i, i);
>> +
>> +		plane_create_color_fb(&kms->overlay_a, data->fd, i, i, !i, i);
>> +
>> +		plane_create_color_fb(&kms->overlay_b, data->fd, i, i, i, !i);
>> +
>> +		kms->writeback.rect.width = mode->hdisplay;
>> +		kms->writeback.rect.height = mode->vdisplay;
>> +		plane_create_fb(&kms->writeback, data->fd, i);
>> +	}
>> +}
>> +
>> +static igt_output_t *find_wb_output(struct data_t *data)
>> +{
>> +	for (int i = 0; i < data->display.n_outputs; i++) {
>> +		igt_output_t *output = &data->display.outputs[i];
>> +
>> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>> +			continue;
>> +
>> +		return output;
>> +
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct kms_t default_kms = {
>> +	.primary = {
>> +		.rect = {
>> +			.x = 101, .y = 0,
>> +			.width = 3639, .height = 2161,
>> +		},
>> +		.format = DRM_FORMAT_XRGB8888,
>> +	},
>> +	.overlay_a = {
>> +		.rect = {
>> +			.x = 201, .y = 199,
>> +			.width = 3033, .height = 1777,
>> +		},
>> +		.format = DRM_FORMAT_XRGB16161616,
>> +	},
>> +	.overlay_b = {
>> +		.rect = {
>> +			.x = 1800, .y = 250,
>> +			.width = 1507, .height = 1400,
>> +		},
>> +		.format = DRM_FORMAT_ARGB8888,
>> +	},
>> +	.writeback = {
>> +		.rect = {
>> +			.x = 0, .y = 0,
>> +			// Size is to be determined at runtime
>> +		},
>> +		.format = DRM_FORMAT_XRGB8888,
>> +	},
>> +};
>> +
>> +
>> +igt_simple_main
>> +{
>> +	struct data_t data;
>> +	enum pipe pipe = PIPE_NONE;
>> +
>> +	data.kms = default_kms;
>> +
> 
> Hi Arthur,
> 
> all the above looks really good!
> 
> Some things below look strange to me, but I don't know the igt API.
> 
>> +	data.fd = drm_open_driver_master(DRIVER_ANY);
>> +
>> +	igt_display_require(&data.display, data.fd);
>> +
>> +	kmstest_set_vt_graphics_mode();
>> +
>> +	igt_display_require(&data.display, data.fd);
> 
> Are you supposed to call igt_display_require twice?
> 

Only this way the writeback connector appears. I took this from
`tests/kms_writeback.c`.

I now did a bit of lore.kernel.org archaeology and found why this is
necessary:

Rodrigo Siqueira sent this patch:
https://lore.kernel.org/all/20190306213005.7hvbnwl7dohr3vuv@smtp.gmail.com/

It places drmSetClientCap() before drmModeGetResources(). (The patch
description is wrong, as noted by [1])

Without this, you don't need to call igt_display_require() twice. I
don't know if this patch is wrong, but it is good to bring it up for
discussion.

[1]: https://lore.kernel.org/all/20190318104128.GH26454@e110455-lin.cambridge.arm.com/

>> +	igt_require(data.display.is_atomic);
>> +
>> +	igt_display_require_output(&data.display);
>> +
>> +	igt_require(data.wb_output);
>> +	igt_display_reset(&data.display);
>> +
>> +	data.wb_output = find_wb_output(&data);
> 
> Should igt_require(data.wb_output) be after find_wb_output?
> 
>> +
>> +	for_each_pipe(&data.display, pipe) {
>> +		igt_debug("Selecting pipe %s to %s\n",
>> +			  kmstest_pipe_name(pipe),
>> +			  igt_output_name(data.wb_output));
>> +		igt_output_set_pipe(data.wb_output, pipe);
> 
> Isn't this strange if there are multiple pipes?

Yeah, I forgot to place a `break;` there.

All the others comments will be addressed on v2.

Best Regards,
~Arthur Grillo

> 
>> +	}
>> +
>> +	igt_display_commit_atomic(&data.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> 
> What's this commit needed for?
> 
>> +
>> +	gen_fbs(&data);
>> +
>> +	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
>> +	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
>> +								  DRM_PLANE_TYPE_OVERLAY, 0);
>> +	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
>> +								  DRM_PLANE_TYPE_OVERLAY, 1);
>> +
>> +	for (int i = 0; i < FRAME_COUNT; i++) {
>> +		int fb_index = i % 2;
>> +
>> +		plane_setup(&data.kms.primary, fb_index);
>> +
>> +		plane_setup(&data.kms.overlay_a, fb_index);
>> +
>> +		plane_setup(&data.kms.overlay_b, fb_index);
>> +
>> +		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb_index]);
>> +
>> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
>> +	}
>> +
>> +	igt_display_fini(&data.display);
>> +	drm_close_driver(data.fd);
>> +}
> 
> Aside those questions, I'm already happy giving a
> 
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 
> Thanks,
> pq
