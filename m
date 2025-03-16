Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84094A636CE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 18:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5004A10E1E1;
	Sun, 16 Mar 2025 17:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="P3KqNpPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A5210E1E1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 17:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b6WkkaiuuLjaqXljr7IpKwAGH4H8pXqhQsZzPrwzbDU=; b=P3KqNpPxoUsgoJV5rGbqIRwVdh
 nf9N6kfIa4TXq6G6x2J2M4Il3fbflEUFtKwap1eLyGl4odkCJSDrwUn7aD93G5zxcl49wuwcK6bfy
 kGX0My/O831MkjW7oPBfb8eK76C03qc2cYiO1foofoJ4fBTueFzTCE76H7fYY+aD4T7DVjNVjAdzn
 fTZiQaBdLPdJWzoTHlxDvgxolIQKah1vdZbtbIL4pYM14pQxT7Me/muh07q1I5Bz62hoRJ4IILwGa
 P0N1AIc1ZG0o2sNTSjfH3JJyfnEqioHQ1BoRo5QOVYxObScN/80LnLoHM+z801cvAR76pl3kJhKSz
 s1rNLViA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ttrtZ-001AyB-On; Sun, 16 Mar 2025 18:35:30 +0100
Message-ID: <53123def-9b2f-48fb-8d91-803242debb58@igalia.com>
Date: Sun, 16 Mar 2025 14:35:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/v3d: Associate a V3D tech revision to all
 supported devices
To: Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
 <20250316-v3d-gpu-reset-fixes-v5-1-9779cdb12f06@igalia.com>
 <5dd6e477-989b-4a4a-b136-a1c863dbe2a4@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <5dd6e477-989b-4a4a-b136-a1c863dbe2a4@gmx.net>
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

Hi Stefan,

On 16/03/25 13:51, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 16.03.25 um 15:15 schrieb Maíra Canal:
>> The V3D driver currently determines the GPU tech version (33, 41...)
>> by reading a register. This approach has worked so far since this
>> information wasn’t needed before powering on the GPU.
>>
>> V3D 7.1 introduces new registers that must be written to power on the
>> GPU, requiring us to know the V3D version beforehand. To address this,
>> associate each supported SoC with the corresponding VideoCore GPU version
>> as part of the device data.
>>
>> To prevent possible mistakes, add an assertion to verify that the version
>> specified in the device data matches the one reported by the hardware.
>> If there is a mismatch, the kernel will trigger a warning.
>>
>> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_debugfs.c | 126 ++++++++++++++++++ 
>> +-------------------
>>   drivers/gpu/drm/v3d/v3d_drv.c     |  22 +++++--
>>   drivers/gpu/drm/v3d/v3d_drv.h     |  11 +++-
>>   drivers/gpu/drm/v3d/v3d_gem.c     |  10 +--
>>   drivers/gpu/drm/v3d/v3d_irq.c     |   6 +-
>>   drivers/gpu/drm/v3d/v3d_perfmon.c |   4 +-
>>   drivers/gpu/drm/v3d/v3d_sched.c   |   6 +-
>>   7 files changed, 101 insertions(+), 84 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/ 
>> v3d_debugfs.c
>> index 
>> 76816f2551c10026a775e4331ad7eb2f008cfb0a..7e789e181af0ac138044f194a29555c30ab01836 100644
>> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c

[...]

>> @@ -196,11 +196,11 @@ static int v3d_v3d_debugfs_ident(struct seq_file 
>> *m, void *unused)
>>           seq_printf(m, "  QPUs:         %d\n", nslc * qups);
>>           seq_printf(m, "  Semaphores:   %d\n",
>>                  V3D_GET_FIELD(ident1, V3D_IDENT1_NSEM));
>> -        if (v3d->ver <= 42) {
>> +        if (v3d->ver <= V3D_GEN_42) {
>>               seq_printf(m, "  BCG int:      %d\n",
>>                      (ident2 & V3D_IDENT2_BCG_INT) != 0);
>>           }
>> -        if (v3d->ver < 40) {
>> +        if (v3d->ver < V3D_GEN_41) {
> I had expected that such a behavior change was at least mentioned in the
> commit log.

I can add a comment about it in the commit message, but this isn't a
functional change. V3D 4.0 doesn't exist and hypothetically, if it did,
the driver doesn't support it. The driver only supports 33, 41, 42, and
71.

In the end, `v3d->ver < 40` means V3D 3.3.

Best Regards,
- Maíra

> 
> Except of this, look good to me.
> 

