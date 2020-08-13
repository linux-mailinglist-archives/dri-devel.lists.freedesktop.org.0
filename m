Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BF243459
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB616E45E;
	Thu, 13 Aug 2020 07:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB196E452;
 Thu, 13 Aug 2020 07:05:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A22C1B163;
 Thu, 13 Aug 2020 07:05:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <7c8cb6e9-8270-d27a-6480-793ef5599d09@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <231ee1e7-c2fa-3c2a-f444-f9f813fc906d@suse.com>
Date: Thu, 13 Aug 2020 09:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c8cb6e9-8270-d27a-6480-793ef5599d09@epam.com>
Content-Language: en-US
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.08.20 08:32, Oleksandr Andrushchenko wrote:
> Juergen, Boris,
> 
> can we please merge these via Xen Linux tree as I have collected enough Ack/R-b?
> 
> The series has DRM patches, but those anyway are Xen related, so I think
> 
> this should be fine from DRI point of view.

Yes, fine with me.


Juergen

> 
> Thank you,
> 
> Oleksandr
> 
> On 8/13/20 9:21 AM, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Hello,
>>
>> This series contains an assorted set of fixes and improvements for
>> the Xen para-virtualized display driver and grant device driver which
>> I have collected over the last couple of months:
>>
>> 1. Minor fixes to grant device driver and drm/xen-front.
>>
>> 2. New format (YUYV) added to the list of the PV DRM supported formats
>> which allows the driver to be used in zero-copying use-cases when
>> a camera device is the source of the dma-bufs.
>>
>> 3. Synchronization with the latest para-virtualized protocol definition
>> in Xen [1].
>>
>> 4. SGT offset is now propagated to the backend: while importing a dmabuf
>> it is possible that the data of the buffer is put with offset which is
>> indicated by the SGT offset. This is needed for some GPUs which have
>> non-zero offset.
>>
>> Thank you,
>> Oleksandr Andrushchenko
>>
>> [1] https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0__;!!GF_29dbcQIUBPA!iAHOdk4M167VNM1AypMGVmyKJu-iqC9e5cXyu6N595Np3iyIZDnZl0MIBX3IROJSD1GSMX_GfQ$ [xenbits[.]xen[.]org]
>>
>> Changes since v1:
>> =================
>>
>> 1. Removed patch which adds EDID to PV DRM as it needs more time for review:
>> "5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
>> request which allows frontends to request EDID structure per
>> connector. This request is optional and if not supported by the
>> backend then visible area is still defined by the relevant
>> XenStore's "resolution" property.
>> If backend provides EDID with XENDISPL_OP_GET_EDID request then
>> its values must take precedence over the resolutions defined in
>> XenStore."
>> I will send this as a dedicated patch.
>>
>> 2. Added missing CC stable for the patches with fixes
>>
>> Oleksandr Andrushchenko (5):
>>     xen/gntdev: Fix dmabuf import with non-zero sgt offset
>>     drm/xen-front: Fix misused IS_ERR_OR_NULL checks
>>     drm/xen-front: Add YUYV to supported formats
>>     xen: Sync up with the canonical protocol definition in Xen
>>     drm/xen-front: Pass dumb buffer data offset to the backend
>>
>>    drivers/gpu/drm/xen/xen_drm_front.c      | 10 +--
>>    drivers/gpu/drm/xen/xen_drm_front.h      |  2 +-
>>    drivers/gpu/drm/xen/xen_drm_front_conn.c |  1 +
>>    drivers/gpu/drm/xen/xen_drm_front_gem.c  | 11 +--
>>    drivers/gpu/drm/xen/xen_drm_front_kms.c  |  2 +-
>>    drivers/xen/gntdev-dmabuf.c              |  8 +++
>>    include/xen/interface/io/displif.h       | 91 +++++++++++++++++++++++-
>>    7 files changed, 111 insertions(+), 14 deletions(-)
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
