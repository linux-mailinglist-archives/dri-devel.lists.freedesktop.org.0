Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA60749677
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5351910E44C;
	Thu,  6 Jul 2023 07:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 481 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jul 2023 18:18:56 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC5510E0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 18:18:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Qx74j4Q8mz9t3C;
 Wed,  5 Jul 2023 20:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1688580645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgDQ8yBo/JIQ9nabFXz7PbiSlCXBn916dNYyzxZZE90=;
 b=hZYQ1PmQ4+UCPQb4lG/g/0VGatmUxKvCMtbdOuJVp19k2VFE+jBsiAovklW2S1p+R4avk3
 T6fRT2lnS6Pzt2Jfcavp9fPvSeD/ej71k5aHWo7qNChsp9/ooPe4MAQ0tXaLw3QfVdRURk
 BaV1FUYAooSLKBy3Aii7IdqYj3YyL6KTpVg4bTa0ELn/HagfWCbLV+HGp5gmVfXE+pceSp
 UB+ftUMPpPfT3f1IauPvilT8m/Tdw7/D6W/pmr/UHGbWpOlcvmpZ1Zf3o+4osQnr3H4PdP
 yqwuE8hIroccAJFVx80qTou6/A2l/TGJIf0RgRwMyAgWk9Kk1SwYcvflJZXJTA==
Message-ID: <072d786b-f10d-a7d6-163c-e70be4bad1f3@mailbox.org>
Date: Wed, 5 Jul 2023 20:10:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 07/17] drm/imagination: Add GPU ID parsing and firmware
 loading
Content-Language: en-US
To: Frank Binns <Frank.Binns@imgtec.com>,
 "aford173@gmail.com" <aford173@gmail.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-8-sarah.walker@imgtec.com>
 <CAHCN7xK9rDyeTCFz3nonvEnKWyFeqsPpvzHcoPA6SCXSbTYGkw@mail.gmail.com>
 <1863de9e89872a0330dea51afbef5efaa6a4b831.camel@imgtec.com>
 <CAHCN7x+Fep209VCBfaa8C8Q9sG5wZ==GHt2OGhfhLBRxpMX3kw@mail.gmail.com>
 <9c11a1afd5e568b3daebc0aff1cf71650adf3dca.camel@imgtec.com>
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <9c11a1afd5e568b3daebc0aff1cf71650adf3dca.camel@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4xof4eydc8ya4h56jmc7d63rgtny66ja
X-MBO-RS-ID: 3b7ad94815a380cb663
X-Mailman-Approved-At: Thu, 06 Jul 2023 07:37:10 +0000
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/23 15:13, Frank Binns wrote:
> On Mon, 2023-06-26 at 10:38 -0500, Adam Ford wrote:
>> On Mon, Jun 26, 2023 at 8:22 AM Frank Binns <Frank.Binns@imgtec.com> wrote:
>>> Hi Adam,
>>>
>>> On Sat, 2023-06-17 at 07:48 -0500, Adam Ford wrote:
>>>> On Tue, Jun 13, 2023 at 10:20 AM Sarah Walker <sarah.walker@imgtec.com> wrote:
>>>>> Read the GPU ID register at probe time and select the correct
>>>>> features/quirks/enhancements. Use the GPU ID to form the firmware
>>>>> file name and load the firmware.
>>>>
>>>> I have a Rogue 6250 variant, but the BVNC is returning a slightly
>>>> different revision than the firmware that's currently available, and
>>>> the older firmware for the vendor driver doesn't work with this new
>>>> code.
>>>>
>>>> Linux responds with Unsupported BVNC: 4.45.2.58.  From what I can
>>>> tell, the closest available firmware is 4.40.2.51.
>>>>
>>>> Will there be more firmware variants in the future or will there be
>>>> some options to build the firmware somehow?
>>>
>>> We don't plan to support the SoC vendor provided firmware binaries as this will
>>> mean having to deal with many different versions of the firmware and its
>>> interface. Specifically, the interface can change in backwards incompatible ways
>>> between releases, it changes based on the hardware feature set & bugs and it's
>>> split across userspace & the kernel. This makes these SoC provided firmware
>>> binaries very difficult to support in this new driver.
>>
>> Thanks for the response.
>>
>> That makes sense.  I would hope that various SoC vendors would jump on
>> the bandwagon to work with your group to get their hardware supported.
>>> As an alternative, we'll be releasing firmware binaries as we add support for
>>> more Rogue GPUs. We'll also release binaries upon request, in case others in the
>>> community want to work on support in the meantime - we're just getting things
>>> set up for this at the moment.
>>
>> The Mesa side of things appears to be missing some documentation, and
>> the power VR stuff still appears listed as experimental.  Is there
>> some documentation somewhere that would explain to someone how to go
>> about porting the Rogue 6250 to a different hardware variant of the
>> 6250?  I don't really know the difference between BVNC of 4.45.2.58
>> and 4.40.2.51, but I can't imagine they are drastically different.
> 
> One thing I forgot to mention is that, alongside the firmware binaries, we'll
> also provide the corresponding device info, e.g. for Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/e714b35301a33145399f8939ca864ffd14b49de9/src/imagination/common/pvr_device_info.c#L32-125
> 
> We don't have any specific porting documentation, but we did just send out a
> Mesa MR adding some initial (basic) documentation:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23992
> 
> In terms of differences between the two GX6250 variants, it doesn't seem that
> there's anything feature-wise that will require any driver changes that are
> specific to the 4.45.2.58 variant (the different firmware should in theory be
> sufficient). There are still some driver changes required, however.
> 
> Assuming the SoC you're interested in is already well supported upstream and the
> clocks, power controllers, etc needed by the GPU are also already supported then
> the following changes will be required at a minimum:
> 
> 1. A GPU node will need adding to the device tree source file for your specific
>     board
> 2. The compatible string for the GPU node will need adding to the list of
>     supported devices in the kernel driver (grep for "dt_match" in the driver
>     code)
> 3. The device info we provide alongside the firmware binary will need adding to
>     the kernel driver and Mesa
> 4. The compatible string for the GPU and display controller device tree nodes
>     will need adding to the Vulkan driver (grep for "pvr_drm_configs" in the Mesa
>     code to see existing examples)
>     
> Hopefully that covers everything, but no doubt I missed something!
> 
> With respect to the experimental status of the driver, I think there are three
> things that need to happen before we can drop this tag. Firstly, the kernel
> driver needs to be merged to the kernel. Secondly, we need to pass Khronos
> conformance on at least one of the devices we support (our current focus is on
> the AXE-1-16M). Finally, we need to upstream all our Mesa changes. This is
> something that we've been chipping away at, but we do have a big backlog in our
> public branch [1]. I expect it's going to be quite some time until all of this
> work is complete.
> 
> While so much code is sitting in downstream branches I think it's going to be
> somewhat painful for people to meaningfully contribute to the driver itself.
> Effort is probably best spent on getting the other drivers, which the GPU driver
> depends on, upstream for the platform(s) you're interested in.
> 
> Just to say that I'm by no means trying to put you off from contributing, but
> simply trying to warn you that until the driver is out of its experimental
> state, a lot of things are going to be in flux and the development process is
> currently a lot more complicated.
> 
> It's also worth highlighting that we're a small team tackling a very large job!
> We're doing our best to do things in the proper way and to lay good foundations
> for the future. We're also learning along the way, so please bear with us :-)

Last year I spent considerable amount of time trying to bring this up on 
R-Car M3-W, but that all failed due to unavailable firmware for this GPU 
revision. The GPU is also GX6250 , so supporting it should be basically 
trivial, considering how the R-Car Gen3 upstream support is all there 
and the driver already supports GX6250 .

Would it be possible for imgtec to provide suitable firmware for this 
GX6250 revision, so the bring up effort could be resumed ?

I think that would also yield a couple more reviewers of this driver, 
since without a suitable firmware, the kernel driver and user space 
stack can not be tested, so there is no point in reviewing or even 
merging such untestable code.
