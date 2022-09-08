Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3E5B2EA8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DCA10EBD5;
	Fri,  9 Sep 2022 06:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3513 seconds by postgrey-1.36 at gabe;
 Thu, 08 Sep 2022 09:13:49 UTC
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com
 [IPv6:2a0c:5a00:149::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FCF10E9E3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:13:49 +0000 (UTC)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
 by mailtransmit04.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <martin.roukala@mupuf.org>)
 id 1oWCgK-0001r3-TX; Thu, 08 Sep 2022 10:14:40 +0200
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.roukala@mupuf.org>)
 id 1oWCgH-00085i-L9; Thu, 08 Sep 2022 10:14:37 +0200
Received: by submission01.runbox with esmtpsa [Authenticated ID (1057822)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1oWCg9-0000HB-VA; Thu, 08 Sep 2022 10:14:30 +0200
Message-ID: <cc9ff9ea-1f2e-16e9-a612-2ad4521440a6@mupuf.org>
Date: Thu, 8 Sep 2022 11:14:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: RaspberryPi4 Panic in net_ns_init()
To: Maxime Ripard <maxime@cerno.tech>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20220831144205.iirdun6bf3j5v6q4@houat>
 <20220905111832.73nqtlzpiuwpj7lx@houat>
Content-Language: en-US
From: Martin Roukala <martin.roukala@mupuf.org>
In-Reply-To: <20220905111832.73nqtlzpiuwpj7lx@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 14:18, Maxime Ripard wrote:
> On Wed, Aug 31, 2022 at 04:42:05PM +0200, Maxime Ripard wrote:
>> Sorry for the fairly broad list of recipients, I'm not entirely sure
>> where the issue lies exactly, and it seems like multiple areas are
>> involved.
>>
>> Martin reported me an issue discovered with the VC4 DRM driver that
>> would prevent the RaspberryPi4 from booting entirely. At boot, and
>> apparently before the console initialization, the board would just die.
>>
>> It first appeared when both DYNAMIC_DEBUG and DRM_VC4 were built-in. We
>> started to look into what configuration would trigger it.
>>
>> It looks like a good reproducer is:
>>
>> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make -j18 defconfig mod2yesconfig
>> ./scripts/config -e CONFIG_DYNAMIC_DEBUG
>> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make -j18 olddefconfig
> 
> Interestingly, this was making the kernel Image cross the 64MB boundary.
> I've compiled the same configuration but with -Os, and then tried to
> boot the failing configuration with U-Boot instead of the RaspberryPi
> firmware, and both of them worked. I guess that leaves us with a
> bootloader bug, and nothing related to Linux after all.
> 
> Sorry for the noise,
> Maxime

Thanks a lot for figuring this out, Maxime! The idea to use -Os is much 
nicer than what I was going for: padding a working kernel with 0s at the 
end!

I unfortunately did not try to reproduce your success with u-boot, but 
I'll get to it in the near future.

Thanks again to everyone involved for all the help and support!
Martin
