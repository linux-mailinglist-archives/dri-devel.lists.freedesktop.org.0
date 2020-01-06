Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777E13183F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 20:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FF36E503;
	Mon,  6 Jan 2020 19:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED2A89A77;
 Mon,  6 Jan 2020 19:05:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1384eb0000>; Mon, 06 Jan 2020 11:05:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 06 Jan 2020 11:05:32 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 06 Jan 2020 11:05:32 -0800
Received: from [172.20.40.57] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Jan
 2020 19:05:31 +0000
Subject: Re: [Nouveau] [PATCH v2 2/3] drm/nouveau: Check framebuffer size
 against bo
To: Ben Skeggs <skeggsb@gmail.com>
References: <20191217004520.2404-1-jajones@nvidia.com>
 <20191217004520.2404-3-jajones@nvidia.com>
 <CACAvsv656x+PL7pP=_JVgkJXnLaoUJOD=-H_6k2-UVwXSsREnA@mail.gmail.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <d360691b-45f4-81db-3878-aeda5a3253ce@nvidia.com>
Date: Mon, 6 Jan 2020 11:06:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACAvsv656x+PL7pP=_JVgkJXnLaoUJOD=-H_6k2-UVwXSsREnA@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578337515; bh=qKqkw4UuJl2NVraGnffuNwrkxSz299GZwaxTIFm+rXQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KLztOeO36aKC58GNehEcKKpZa/EH6298eK/zfAHwhk1ZyOZWQSveymCbmYAMKjQYS
 3qq7Af4gfgFzZZWP31XJTWZM4IAcCvNZCKai5XTuKWi1DDU2jsxdYTnzV0xXoSKZmj
 Nr/82BW6Aw2lXHlwrPe0TuhhNH+XTquOepImVcOCzShmWwU9ICKRzIMAUhTCJpL58r
 e3gRhvW4VCduiQfZM6p4LlN/XxwqXr9y90mTR7ARuNatqUFKBhxTKB2Jx03pYd62//
 M+k8xjgyAZn1wkpqVXlqRqJRfMIKVrS+k2PgRrehiEKQKrr+XgJcX8iGNz0ZqfdOcU
 LNHieQYPuUOdQ==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/20 5:25 PM, Ben Skeggs wrote:
> On Tue, 17 Dec 2019 at 10:45, James Jones <jajones@nvidia.com> wrote:
>>
>> Make sure framebuffer dimensions and tiling
>> parameters will not result in accesses beyond the
>> end of the GEM buffer they are bound to.
>>
>> Signed-off-by: James Jones <jajones@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_display.c | 93 +++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index 6f038511a03a..f1509392d7b7 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -224,6 +224,72 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
>>          .create_handle = nouveau_user_framebuffer_create_handle,
>>   };
>>
>> +static inline uint32_t
>> +nouveau_get_width_in_blocks(uint32_t stride)
>> +{
>> +       /* GOBs per block in the x direction is always one, and GOBs are
>> +        * 64 bytes wide
>> +        */
>> +       static const uint32_t log_block_width = 6;
>> +
>> +       return (stride + (1 << log_block_width) - 1) >> log_block_width;
>> +}
>> +
>> +static inline uint32_t
>> +nouveau_get_height_in_blocks(struct nouveau_drm *drm,
>> +                            uint32_t height,
>> +                            uint32_t log_block_height_in_gobs)
>> +{
>> +       uint32_t log_gob_height;
>> +       uint32_t log_block_height;
>> +
>> +       BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
>> +
>> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
>> +               log_gob_height = 2;
>> +       else
>> +               log_gob_height = 3;
>> +
>> +       log_block_height = log_block_height_in_gobs + log_gob_height;
>> +
>> +       return (height + (1 << log_block_height) - 1) >> log_block_height;
>> +}
>> +
>> +static int
>> +nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
>> +                     uint32_t offset, uint32_t stride, uint32_t h,
>> +                     uint32_t tile_mode)
>> +{
>> +       uint32_t gob_size, bw, bh;
>> +       uint64_t bl_size;
>> +
>> +       BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
>> +
>> +       if (drm->client.device.info.chipset >= 0xc0)
>> +               tile_mode >>= 4;
>> +
>> +       BUG_ON(tile_mode & 0xFFFFFFF0);
> As far as I can tell, tile_mode can be fed into this function
> unsanitised from userspace, so we probably want something different to
> a BUG_ON() here.

Good catch.  I had assumed nouveau_bo::mode was validated at creation 
time.  I'll get this fixed up.

Thanks,
-James

>> +
>> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
>> +               gob_size = 256;
>> +       else
>> +               gob_size = 512;
>> +
>> +       bw = nouveau_get_width_in_blocks(stride);
>> +       bh = nouveau_get_height_in_blocks(drm, h, tile_mode);
>> +
>> +       bl_size = bw * bh * (1 << tile_mode) * gob_size;
>> +
>> +       DRM_DEBUG_KMS("offset=%u stride=%u h=%u tile_mode=0x%02x bw=%u bh=%u gob_size=%u bl_size=%llu size=%lu\n",
>> +                     offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
>> +                     nvbo->bo.mem.size);
>> +
>> +       if (bl_size + offset > nvbo->bo.mem.size)
>> +               return -ERANGE;
>> +
>> +       return 0;
>> +}
>> +
>>   int
>>   nouveau_framebuffer_new(struct drm_device *dev,
>>                          const struct drm_mode_fb_cmd2 *mode_cmd,
>> @@ -232,6 +298,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>   {
>>          struct nouveau_drm *drm = nouveau_drm(dev);
>>          struct nouveau_framebuffer *fb;
>> +       const struct drm_format_info *info;
>> +       unsigned int width, height, i;
>>          int ret;
>>
>>           /* YUV overlays have special requirements pre-NV50 */
>> @@ -254,6 +322,31 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>                  return -EINVAL;
>>          }
>>
>> +       info = drm_get_format_info(dev, mode_cmd);
>> +
>> +       for (i = 0; i < info->num_planes; i++) {
>> +               width = drm_format_info_plane_width(info,
>> +                                                   mode_cmd->width,
>> +                                                   i);
>> +               height = drm_format_info_plane_height(info,
>> +                                                     mode_cmd->height,
>> +                                                     i);
>> +
>> +               if (nvbo->kind) {
>> +                       ret = nouveau_check_bl_size(drm, nvbo,
>> +                                                   mode_cmd->offsets[i],
>> +                                                   mode_cmd->pitches[i],
>> +                                                   height, nvbo->mode);
>> +                       if (ret)
>> +                               return ret;
>> +               } else {
>> +                       uint32_t size = mode_cmd->pitches[i] * height;
>> +
>> +                       if (size + mode_cmd->offsets[i] > nvbo->bo.mem.size)
>> +                               return -ERANGE;
>> +               }
>> +       }
>> +
>>          if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>>                  return -ENOMEM;
>>
>> --
>> 2.17.1
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
