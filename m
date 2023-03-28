Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6146CC5E4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677410E489;
	Tue, 28 Mar 2023 15:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2037910E489
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:19:22 +0000 (UTC)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by lithium.sammserver.com (Postfix) with ESMTPS id D8A6631181F0;
 Tue, 28 Mar 2023 17:19:19 +0200 (CEST)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
 by mail.sammserver.com (Postfix) with ESMTP id 8312D3E17F;
 Tue, 28 Mar 2023 17:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
 t=1680016759; bh=mx/mn5CmoZNPWNQJv9YYiJHtkwhLf6qkZR5KBmJi3Dw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cq32m56zKkA6Mwb43Kwsrsip7a9NnTfnGWY9T3bsU/kd9pMPmfZdzrsVqBvNlyu/D
 uS7uRBfQKhh3ndMbl608cbdtqS9EkbcwkxeMLRt2E+rFm/sF3DE6G5amj7y4mA48Ue
 UzSD5GjxVjnu8cLQG/barPlWhn1eJG3MLEkmB1c8=
MIME-Version: 1.0
Date: Tue, 28 Mar 2023 17:19:19 +0200
From: =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <87v8ivoc3r.fsf@minerva.mail-host-address-is-not-set>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
 <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
 <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
 <87v8ivoc3r.fsf@minerva.mail-host-address-is-not-set>
Message-ID: <e556191a3cc9730f3d83c7aaea7d3b3e@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, deller@gmx.de,
 linux-staging@lists.linux.dev, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-20 13:12, Javier Martinez Canillas wrote:
> Samuel Čavoj <samuel@cavoj.net> writes:
> 
> [...]
> 
>>>>> This call to sysfb_disable() has been causing trouble with regard 
>>>>> to
>>>>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices
>>>>> to
>>>>> get rid of any console drivers (d173780620792c) using the device in
>>>>> question, but now even unrelated drivers are getting killed. 
>>>>> Example
>>>>> situation:
>>>> 
>>>> Which drivers do you use?
>> 
>> This happens with either no drivers loaded or the proprietary nvidia
>> driver. Nouveau is fine as it doesn't rely on efifb but brings its 
>> own.
>> 
> 
> Which is what all DRM drivers should do. If they want to make sure that 
> a
> fbdev will be present after the DRM driver probes, then should register 
> an
> emulated fbdev.

I don't see how this is specific to Nvidia or DRM drivers.

The efifb is killed if vfio-pci (or another driver which uses the
aperture system to remove conflicting drivers) is bound to ANY pci
device, regardless of whether it's nvidia's fault for not implementing
a framebuffer. Fair enough, I agree that they should, but
I for one expect my efifb to not die at a random time
when a random unrelated driver does a random thing with another
unrelated GPU.

Or is the efifb considered a stop-gap solution the only purpose of
which is early boot--before another GPU driver is loaded?

> 
> There was an attempt to workaround that in [0], in particular patch [1]
> but that effort was not continued since the only DRM driver that would 
> be
> affected is the Nvidia proprietary driver that relies on 
> efifb/simpledrm
> to have a VT.
> 
> [0]: 
> https://patchwork.kernel.org/project/dri-devel/list/?series=711019&archive=both
> [1]: 
> https://patchwork.kernel.org/project/dri-devel/patch/20230111154112.90575-11-daniel.vetter@ffwll.ch/
