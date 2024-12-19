Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9699F7154
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 01:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1484F10E0FA;
	Thu, 19 Dec 2024 00:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DqdWs9cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7F10E0FA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 00:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734567639;
 bh=prf7TDv+ZzDSouCu7iNVMMGBrUlxtYagyWBsCIU10jw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DqdWs9cTuJssmnkhOBSaP5pwY5atJu0qGsKDKLYVsan1FWUpchSEAYhFUXFlLZVdV
 pqQjq7ltwSga3OiYxLPLiMfGdpXhitRajivPOk569zB9074OeBN2BAl4fNCqatyGLZ
 t7N6ibWIeXknCmUoIHpTa6Elec3cvy/3HsWCw0BGbQfNTC7L2J6Vk6k3Uo1LyrBZUW
 /WCjLiznEiBvWKomZkwPGzxdiYXtPqqkib/zam8rc4OxqEoqJELMPg8OYq63oISE3C
 USLj9nhiVpeG57RYi/LashR56C1LI7qWv4nqaCNxc9hWazj1hdsTXRnEbBs7VmoLUx
 u9W/9duGOIMSg==
Received: from [192.168.7.37]
 (hlfxns017vw-47-55-142-63.dhcp-dynamic.fibreop.ns.bellaliant.net
 [47.55.142.63])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ericsmith)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3003E17E0DF0;
 Thu, 19 Dec 2024 01:20:38 +0100 (CET)
Message-ID: <f9dd18f5-c239-4d96-b0e8-e11e9712fc8a@collabora.com>
Date: Wed, 18 Dec 2024 20:20:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: add modifiers for MediaTek tiled formats
To: Daniel Stone <daniel@fooishbar.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241213184705.317138-1-eric.smith@collabora.com>
 <CAPj87rMT-YsUj2gyfoCUFUPx0BWxAhcz8LgvAhco0-JzhKeXxQ@mail.gmail.com>
Content-Language: en-US
From: Eric Smith <eric.smith@collabora.com>
In-Reply-To: <CAPj87rMT-YsUj2gyfoCUFUPx0BWxAhcz8LgvAhco0-JzhKeXxQ@mail.gmail.com>
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

On 18/12/2024 10.33, Daniel Stone wrote:

>> +/* MediaTek layouts */
>> +
>> +/*
>> + * MediaTek Tiled Modifier
>> + * This is a tiled layout using tiles of 16x32 pixels in a row-major layout.
>> + * For chroma planes this becomes 16x16 tiles.
>> + */
>> +#define DRM_FORMAT_MOD_MTK_16L_32S_TILE  fourcc_mod_code(MTK, (1ULL << 0))
> I think this probably wants to be something like the tiling mode
> defined in AMD/Arm modifiers, i.e. reserve a few bits in the range to
> select the tile size, rather than using a single bit here.

Thank you for taking the time, and for your suggestions. Are you 
thinking something along the lines of:

/* MediaTek modifiers
  * Bits  Parameter                Notes
  * ----- ------------------------ 
---------------------------------------------
  *   3:0 TILE LAYOUT              Values are MTK_FMT_MOD_TILE_*
  *   7:4 COMPRESSION              Values are MTK_FMT_MOD_COMPRESS_*
  *  12:8 10 BIT LAYOUT            Values are MTK_FMT_MOD_10BIT_LAYOUT_*
  *
  */

#define DRM_FORMAT_MOD_MTK(__flags)        fourcc_mod_code(MTK, __flags)

/*
  * MediaTek Tiled Modifier
  * The lowest 4 bits of the modifier is used to specify the tiling
  * layout. Only the 16L_32S tiling is used for now, but we define an
  * "untiled" version and leave room for future expansion.
  */
#define MTK_FMT_MOD_TILE_MASK     0xf
#define MTK_FMT_MOD_TILE_NONE     0x0
#define MTK_FMT_MOD_TILE_16L32S   0x1

/*
  * Bits 4-7 specify compression options
  */
#define MTK_FMT_MOD_COMPRESS_MASK (0xf << 4)
#define MTK_FMT_MOD_COMPRESS_NONE (0x0 << 4)
#define MTK_FMT_MOD_COMPRESS_V1   (0x1 << 4)

/*
  * Bits 8-11 specify how the bits of 10 bit formats are
  * stored out in memory
  */
#define MTK_FMT_MOD_10BIT_LAYOUT_MASK      (0xf << 8)
#define MTK_FMT_MOD_10BIT_LAYOUT_PACKED    (0x0 << 8)
#define MTK_FMT_MOD_10BIT_LAYOUT_LSBTILED  (0x1 << 8)
#define MTK_FMT_MOD_10BIT_LAYOUT_LSBRASTER (0x2 << 8)

Regards,

Eric

