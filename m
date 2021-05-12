Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC437BCD6
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 14:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C546EB90;
	Wed, 12 May 2021 12:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77CD6EB90
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 12:50:20 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:b9fa:a96e:cd12:fd9c:44d4] (unknown
 [IPv6:2804:431:e7dc:b9fa:a96e:cd12:fd9c:44d4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AED101F41DAA;
 Wed, 12 May 2021 13:50:18 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 1/2] drm/doc: document how userspace should find out CRTC
 index
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-2-leandro.ribeiro@collabora.com>
 <20210506115053.15741550@eldfell>
Message-ID: <f4cfbb53-bfc6-768f-461b-252380b5b5a6@collabora.com>
Date: Wed, 12 May 2021 09:50:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506115053.15741550@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/6/21 5:50 AM, Pekka Paalanen wrote:
> On Wed, 28 Apr 2021 18:36:50 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> 
>> In this patch we add a section to document what userspace should do to
>> find out the CRTC index. This is important as there are multiple places
>> in the documentation that need this, so it's better to just point to
>> this section and avoid repetition.
>>
>> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
>> ---
>>  Documentation/gpu/drm-uapi.rst    | 14 ++++++++++++++
>>  drivers/gpu/drm/drm_debugfs_crc.c |  9 +++++----
>>  include/uapi/drm/drm.h            |  3 ++-
>>  3 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 04bdc7a91d53..1aa52a6ac567 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -457,6 +457,20 @@ Userspace API Structures
>>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>>     :doc: overview
>>
>> +.. _crtc_index:
>> +
>> +CRTC index
>> +----------
>> +
>> +In some situations, it is important for userspace to find out the index of a
> 
> That could be said about everything, so this sentence has no
> information value. Instead, you could start by stating that CRTCs have
> both an object ID and an index, and they are not the same thing. CRTC
> index is used in cases where a densely packed identifier for a CRTC is
> needed, e.g. in bit-for-crtc masks, where using the object ID would not
> work.
>
>> +CRTC. The CRTC index should not be confused with its object id.
>> +
>> +In order to do this, userspace should first query the resources object
> 
> Instead of saying what userspace must do, you could just explain where
> it can be observed.
> 
>> +from the device that owns the CRTC (using the DRM_IOCTL_MODE_GETRESOURCES
> 
> So here you might start with: DRM_IOCTL_MODE_GETRESOURCES populates a
> structure with an array of CRTC IDs. CRTC's index is its index in that
> array.
> 
>> +ioctl). The resources object contains a pointer to an array of CRTC's, and also
>> +the number of entries of the array. The index of the CRTC is the same as its
>> +position in this array.
> 
> Anyway, the idea here is right.
> 

So what about:

CRTC's have both an object ID and an index, and they should not be
confused. The index is used in cases where a densely packed identifier
for a CRTC is needed, for instance in a bitmask of CRTC's. (maybe a link
to the possible_crtcs field of struct drm_mode_get_plane? as example)

DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC
id's, and the CRTC index is its position in this array.

>> +
>>  .. kernel-doc:: include/uapi/drm/drm.h
>>     :internal:
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
>> index 3dd70d813f69..9575188d97ee 100644
>> --- a/drivers/gpu/drm/drm_debugfs_crc.c
>> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
>> @@ -46,10 +46,11 @@
>>   * it reached a given hardware component (a CRC sampling "source").
>>   *
>>   * Userspace can control generation of CRCs in a given CRTC by writing to the
>> - * file dri/0/crtc-N/crc/control in debugfs, with N being the index of the CRTC.
>> - * Accepted values are source names (which are driver-specific) and the "auto"
>> - * keyword, which will let the driver select a default source of frame CRCs
>> - * for this CRTC.
>> + * file dri/0/crtc-N/crc/control in debugfs, with N being the index of the
>> + * CRTC. To learn how to find out the index of a certain CRTC, please see
>> + * :ref:`crtc_index`. Accepted values are source names (which are
> 
> This a bit verbose: "To learn..." It could be more concise, like
> making the words "the index" a hyperlink instead of adding a whole
> sentence.
> 

Nice, I'll apply this change.

>> + * driver-specific) and the "auto" keyword, which will let the driver select a
>> + * default source of frame CRCs for this CRTC.
>>   *
>>   * Once frame CRC generation is enabled, userspace can capture them by reading
>>   * the dri/0/crtc-N/crc/data file. Each line in that file contains the frame
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 67b94bc3c885..6944f08ab1a6 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -636,7 +636,8 @@ struct drm_gem_open {
>>   * DRM_CAP_VBLANK_HIGH_CRTC
>>   *
>>   * If set to 1, the kernel supports specifying a CRTC index in the high bits of
>> - * &drm_wait_vblank_request.type.
>> + * &drm_wait_vblank_request.type. To learn how to find out the index of a
>> + * certain CRTC, please see :ref:`crtc_index`.
> 
> The same here with "a CRTC index" turned into a hyperlink.
> 

I'll change this as well.

Thanks,
Leandro

> 
> Thanks,
> pq
> 
>>   *
>>   * Starting kernel version 2.6.39, this capability is always set to 1.
>>   */
>> --
>> 2.31.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
