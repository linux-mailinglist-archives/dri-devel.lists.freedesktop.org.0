Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15C86D23D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 19:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF78710E32E;
	Thu, 29 Feb 2024 18:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="MjAfSFtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8EF10E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 18:27:44 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tm0800W31z9s44;
 Thu, 29 Feb 2024 18:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709231264; bh=IikNFncDhPNUrs9XBc55FZA7mrIZS7IcplMg6eJzV7A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MjAfSFtJVXnD6HnmWPPMMZErbBYtoLGrI9hcVfkZ07iMsirYqaorXSxDZTOIObCgP
 DSR/pr+lcpV8Azrmmc4WwspDoW/RPAJOPhcIAwLkRctgd+6VN386CPvVvNKuu/N70n
 m9PQZJ/GqpAllSnrpcakRNrdyDYMllloY57VqUIs=
X-Riseup-User-ID: 11E8A1D120F8300CD2355ADB1F9C112F86711D07CF81ADFCBEBCA5B2B03849E4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tm07v1gxlzJsQh;
 Thu, 29 Feb 2024 18:27:38 +0000 (UTC)
Message-ID: <5f7618d1-d895-44ee-bb8d-ed591bf7ca55@riseup.net>
Date: Thu, 29 Feb 2024 15:27:35 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/7] Add YUV formats to VKMS
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
 <20240115150600.GC160656@toolbox>
 <9e6ed0e5-c9aa-4fb9-a6d8-4c3b1d658ef2@riseup.net>
 <20240229175211.GA166694@toolbox>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240229175211.GA166694@toolbox>
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



On 29/02/24 14:52, Sebastian Wick wrote:
> On Wed, Feb 28, 2024 at 08:42:41PM -0300, Arthur Grillo wrote:
>>
>>
>> On 15/01/24 12:06, Sebastian Wick wrote:
>>> On Wed, Jan 10, 2024 at 02:44:00PM -0300, Arthur Grillo wrote:
>>>> This patchset aims to add support for additional buffer YUV formats.
>>>> More specifically, it adds support to:
>>>>
>>>> Semi-planar formats:
>>>>
>>>> - NV12
>>>> - NV16
>>>> - NV24
>>>> - NV21
>>>> - NV61
>>>> - NV42
>>>>
>>>> Planar formats:
>>>>
>>>> - YUV440
>>>> - YUV422
>>>> - YUV444
>>>> - YVU440
>>>> - YVU422
>>>> - YVU444
>>>>
>>>> These formats have more than one plane, and most have chroma
>>>> subsampling. These properties don't have support on VKMS, so I had to
>>>> work on this before.
>>>>
>>>> To ensure that the conversions from YUV to RGB are working, I wrote a
>>>> KUnit test. As the work from Harry on creating KUnit tests on VKMS[1] is
>>>> not yet merged, I took the setup part (Kconfig entry and .kunitfile)
>>>> from it.
>>>>
>>>> Furthermore, I couldn't find any sources with the conversion matrices,
>>>> so I had to work out the values myself based on the ITU papers[2][3][4].
>>>> So, I'm not 100% sure if the values are accurate. I'd appreciate some
>>>> input if anyone has more knowledge in this area.
>>>
>>> H.273 CICP [1] has concise descriptions of the required values for most
>>> widely used formats and the colour python framework [2] also can be used
>>> to quickly get to the desired information most of the time.
>>>
>>> [1]: https://www.itu.int/rec/T-REC-H.273
>>> [2]: https://www.colour-science.org/
>>
>> I want to thank you for suggesting the python framework, it helped
>> immensely now that I'm changing the precision from 8-bit to 32-bit[1].
>>
>> If I'd known about this framework while developing this patch, I
>> would've saved myself a few weeks of pain and suffering recreating a
>> part of this library XD.
> 
> I'm glad this is useful for you! We also used it for our color-and-hdr
> project https://gitlab.freedesktop.org/pq/color-and-hdr/.

Cool project! I'll be sure to give look!

Best Regards,
~Arthur Grillo

> 
>> [1]: https://lore.kernel.org/all/b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net/
>>
>> Best Regards,
>> ~Arthur Grillo
>>
>>>
>>>> Also, I used two IGT tests to check if the formats were having a correct
>>>> conversion (all with the --extended flag):
>>>>
>>>> - kms_plane@pixel_format
>>>> - kms_plane@pixel_format_source_clamping.
>>>>
>>>> The nonsubsampled formats don't have support on IGT, so I sent a patch
>>>> fixing this[5].
>>>>
>>>> Currently, this patchset does not add those formats to the writeback, as
>>>> it would require a rewrite of how the conversions are done (similar to
>>>> what was done on a previous patch[6]). So, I would like to review this
>>>> patchset before I start the work on this other part.
>>>>
>>>> [1]: https://lore.kernel.org/all/20231108163647.106853-5-harry.wentland@amd.com/
>>>> [2]: https://www.itu.int/rec/R-REC-BT.601-7-201103-I/en
>>>> [3]: https://www.itu.int/rec/R-REC-BT.709-6-201506-I/en
>>>> [4]: https://www.itu.int/rec/R-REC-BT.2020-2-201510-I/en
>>>> [5]: https://lists.freedesktop.org/archives/igt-dev/2024-January/066937.html
>>>> [6]: https://lore.kernel.org/dri-devel/20230414135151.75975-2-mcanal@igalia.com/
>>>>
>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>>> ---
>>>> Changes in v2:
>>>> - Use EXPORT_SYMBOL_IF_KUNIT instead of including the .c test
>>>>   file (Maxime)
>>>> - Link to v1: https://lore.kernel.org/r/20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net
>>>>
>>>> ---
>>>> Arthur Grillo (7):
>>>>       drm/vkms: Use drm_frame directly
>>>>       drm/vkms: Add support for multy-planar framebuffers
>>>>       drm/vkms: Add range and encoding properties to pixel_read function
>>>>       drm/vkms: Add chroma subsampling
>>>>       drm/vkms: Add YUV support
>>>>       drm/vkms: Drop YUV formats TODO
>>>>       drm/vkms: Create KUnit tests for YUV conversions
>>>>
>>>>  Documentation/gpu/vkms.rst                    |   3 +-
>>>>  drivers/gpu/drm/vkms/Kconfig                  |  15 ++
>>>>  drivers/gpu/drm/vkms/Makefile                 |   1 +
>>>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>>>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>>>>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 156 ++++++++++++++++
>>>>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>>>>  drivers/gpu/drm/vkms/vkms_formats.c           | 247 ++++++++++++++++++++++----
>>>>  drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
>>>>  drivers/gpu/drm/vkms/vkms_plane.c             |  26 ++-
>>>>  drivers/gpu/drm/vkms/vkms_writeback.c         |   5 -
>>>>  11 files changed, 426 insertions(+), 49 deletions(-)
>>>> ---
>>>> base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
>>>> change-id: 20231226-vkms-yuv-6f7859f32df8
>>>>
>>>> Best regards,
>>>> -- 
>>>> Arthur Grillo <arthurgrillo@riseup.net>
>>>>
>>>
>>
> 
