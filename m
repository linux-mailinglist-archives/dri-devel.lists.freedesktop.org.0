Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B045C3B17FC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 12:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CBD6E8A0;
	Wed, 23 Jun 2021 10:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3886E8A7;
 Wed, 23 Jun 2021 10:17:42 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id BA174C800A7;
 Wed, 23 Jun 2021 12:17:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id cq-7LrBxmnzK; Wed, 23 Jun 2021 12:17:40 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:3156:839d:aed8:6ea6]
 (p200300e37f3949003156839Daed86eA6.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:3156:839d:aed8:6ea6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 2D4ABC8009D;
 Wed, 23 Jun 2021 12:17:40 +0200 (CEST)
Subject: Re: [PATCH v4 09/17] drm/uAPI: Add "active color range" drm property
 as feedback for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-10-wse@tuxedocomputers.com>
 <20210622100042.4041624a@eldfell>
 <56d079d4-841a-0ca5-b8a6-d2c10f91d211@tuxedocomputers.com>
 <k_QeCRpur3SNNIspBiTHOTT6Oj1pSteEO3MzyQFUG0lSXmEqJUI2tMXJ6wR9chzUHGahdQApJZrUxdJvIv6s8aXr2DBdoHg-2PsGH4kEMyA=@emersion.fr>
 <20210623103256.01d680ba@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <5947f768-dd87-6b39-ecfc-b7c4aaa88aca@tuxedocomputers.com>
Date: Wed, 23 Jun 2021 12:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623103256.01d680ba@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 23.06.21 um 09:32 schrieb Pekka Paalanen:
> On Tue, 22 Jun 2021 11:48:52 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
>> On Tuesday, June 22nd, 2021 at 11:50, Werner Sembach <wse@tuxedocomputers.com> wrote:
>>
>>> Unknown is when no monitor is connected or is when the
>>> connector/monitor is disabled.  
>> I think the other connector props (link-status, non-desktop, etc) don't
>> have a special "unset" value, and instead the value is set to a random
>> enum entry. User-space should ignore the prop on these disconnected
>> connectors anyways.
> That sounds fine to me.

Currently the only case for "not applicable" is when the monitor is disconnected, but sicne the properties are so
interdependent, there might be a case in the future where e.g. a color format that has no differentiation between full
and limited arises. When there is no special unset/not applicable option, the userspace has to know exactly when an
option is valid or not, possible requiring additional logic.

Setting a "not applicable" value allows userspace to be more dumb, without much hassle on the kernelspace side.

>
>
> Thanks,
> pq
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
