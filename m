Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA287A6ED1D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D86110E52C;
	Tue, 25 Mar 2025 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GjjdVxHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D3810E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yu2gJvS+tX5YNNKaHPVs+yfH40PotHSpZKGp6bdkPAY=; b=GjjdVxHAEIHQGMt8SxSIUxC/fk
 R6UtxLM7UeFydLBWa6wBi+G64aTvoTIzsJc4x2dyl5TiQpGe2P/rHvkJCnGFFnmX3Yg+wSC3r6tcE
 PgzlWjYC+IERMBBhA+Ba83alyFkO67YUKCL8GEyv0iB1HKZ8r4doVLk0sOc71QBCqg/AmG4xxu3kg
 Tvritf7CHYS/N+MkiV11NmatpYbsOSDN7Yr24cQ6pZrB8RHQb4qAjSIGF55B9pCpL5772ze6WEiIM
 s+FLjxykcrmOlLiThzQWKwKoFv7iGBbC3NsnCVGQIhp0SJJ3dmI8tLNiqJ7rcEMd8TKL8wMQRATBj
 Y9jRF+8w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tx12J-006621-EB; Tue, 25 Mar 2025 10:57:31 +0100
Message-ID: <9248901e-5eb2-4a3a-9db8-9dfeecc946de@igalia.com>
Date: Tue, 25 Mar 2025 09:57:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] A few drm_syncobj optimisations
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <977cb1c8-7f55-4e3e-bac3-30cb29dec4b3@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <977cb1c8-7f55-4e3e-bac3-30cb29dec4b3@igalia.com>
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


On 24/03/2025 23:17, Maíra Canal wrote:
> Hi Tvrtko,
> 
> Thanks for this patchset! I applied this patchset to the RPi downstream
> kernel 6.13.7 [1] and saw an FPS improvement of approximately 5.85%
> with "vkgears -present-mailbox" on the RPi 5.
> 
> I did five 100 seconds runs on each kernel and here are my results:
> 
> ### 6.13.7
> 
> |   Run    |   Min FPS   |   Max FPS   |   Avg FPS   |
> |----------|-------------|-------------|-------------|
> | Run #1   | 6646.52     | 6874.77     | 6739.313    |
> | Run #2   | 5387.04     | 6723.274    | 6046.773    |
> | Run #3   | 6230.49     | 6823.47     | 6423.923    |
> | Run #4   | 5269.678    | 5870.59     | 5501.858    |
> | Run #5   | 5504.54     | 6285.91     | 5859.724    |
> 
> * Overall Avg FPS: 6114.318 FPS
> 
> 
> ### 6.13.7 + DRM Syncobj optimisations
> 
> |   Run    |   Min FPS   |   Max FPS   |   Avg FPS   |
> |----------|-------------|-------------|-------------|
> | Run #1   | 6089.05     | 7296.27     | 6859.724    |
> | Run #2   | 6022.48     | 7264        | 6818.518    |
> | Run #3   | 5987.68     | 6188.77     | 6041.365    |
> | Run #4   | 5699.27     | 6448.99     | 6190.374    |
> | Run #5   | 6199.27     | 6791.15     | 6450.900    |
> 
> * Overall Avg FPS: 6472.176 FPS

Neat, thanks for testing! I am not surprised a slower CPU benefits more.

Btw if you have the raw data it would be nice to feed it to ministat too.

Regards,

Tvrtko

> [1] https://github.com/raspberrypi/linux/tree/rpi-6.13.y
> 
> Best Regards,
> - Maíra
> 
> On 18/03/25 12:54, Tvrtko Ursulin wrote:
>> A small set of drm_syncobj optimisations which should make things a 
>> tiny bit
>> more efficient on the CPU side of things.
>>
>> Improvement seems to be around 1.5%* more FPS if observed with "vkgears
>> -present-mailbox" on a Steam Deck Plasma desktop, but I am reluctant 
>> to make a
>> definitive claim on the numbers since there is some run to run 
>> variance. But, as
>> suggested by Michel Dänzer, I did do a five ~100 second runs on the 
>> each kernel
>> to be able to show the ministat analysis.
>>
>> x before
>> + after
>> +------------------------------------------------------------+
>> |                          x         +                       |
>> |                   x      x         +                       |
>> |                   x      xx      ++++                      |
>> |                 x x      xx x    ++++                      |
>> |                 x xx   x xx x+   ++++                      |
>> |                xxxxx   xxxxxx+   ++++ + +                  |
>> |                xxxxxxx xxxxxx+x  ++++ +++                  |
>> |              x xxxxxxxxxxx*xx+* x++++++++   ++             |
>> |        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
>> |       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
>> |x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
>> |               |_______A______|                             |
>> |                             |______A_______|               |
>> +------------------------------------------------------------+
>>      N           Min           Max        Median           Avg        
>> Stddev
>> x 135      21697.58     22809.467     22321.396     22307.707     
>> 198.75011
>> + 118     22200.746      23277.09       22661.4     22671.442     
>> 192.10609
>> Difference at 95.0% confidence
>>      363.735 +/- 48.3345
>>      1.63054% +/- 0.216672%
>>      (Student's t, pooled s = 195.681)
>>
>> Tvrtko Ursulin (7):
>>    drm/syncobj: Remove unhelpful helper
>>    drm/syncobj: Do not allocate an array to store zeros when waiting
>>    drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
>>    drm/syncobj: Use put_user in drm_syncobj_query_ioctl
>>    drm/syncobj: Avoid temporary allocation in
>>      drm_syncobj_timeline_signal_ioctl
>>    drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
>>    drm/syncobj: Add a fast path to drm_syncobj_array_find
>>
>>   drivers/gpu/drm/drm_syncobj.c | 281 ++++++++++++++++++----------------
>>   1 file changed, 147 insertions(+), 134 deletions(-)
>>
> 

