Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91A439778
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14289DCF;
	Mon, 25 Oct 2021 13:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC95C89DCF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 13:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 982FF20201B;
 Mon, 25 Oct 2021 15:24:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id hLnYRS65WIdU; Mon, 25 Oct 2021 15:24:34 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id F2F5120201A;
 Mon, 25 Oct 2021 15:24:33 +0200 (CEST)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mezxp-000X47-F6;
 Mon, 25 Oct 2021 15:24:33 +0200
Message-ID: <9e9ddab2-5bcd-f826-2343-d1db691a308e@daenzer.net>
Date: Mon, 25 Oct 2021 15:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-CA
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20211022144040.3418284-1-javierm@redhat.com>
 <YXMNOfBS5iFenmx8@intel.com>
 <c1d1f245-7bcf-16e5-c3f4-c13550843e02@redhat.com>
 <931230b4-1e73-948d-abaf-f1d62ea58239@daenzer.net>
 <f3c9f2e5-73f7-e7c9-dc97-8bfa7b294b0b@redhat.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
In-Reply-To: <f3c9f2e5-73f7-e7c9-dc97-8bfa7b294b0b@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 2021-10-25 14:28, Javier Martinez Canillas wrote:
> Hello Michel,
> 
> On 10/25/21 12:45, Michel Dänzer wrote:
>> On 2021-10-24 22:32, Javier Martinez Canillas wrote:
>>> Hello Ville,
>>>
>>> On 10/22/21 21:12, Ville Syrjälä wrote:
>>>> On Fri, Oct 22, 2021 at 04:40:40PM +0200, Javier Martinez Canillas wrote:
>>>>> The simpledrm driver allows to use the frame buffer that was set-up by the
>>>>> firmware. This gives early video output before the platform DRM driver is
>>>>> probed and takes over.
>>>>>
>>>>> But it would be useful to have a way to disable this take over by the real
>>>>> DRM drivers. For example, there may be bugs in the DRM drivers that could
>>>>> cause the display output to not work correctly.
>>>>>
>>>>> For those cases, it would be good to keep the simpledrm driver instead and
>>>>> at least get a working display as set-up by the firmware.
>>>>>
>>>>> Let's add a drm.remove_fb boolean kernel command line parameter, that when
>>>>> set to false will prevent the conflicting framebuffers to being removed.
>>>>>
>>>>> Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
>>>>> early in their probe callback, this will cause the drivers' probe to fail.
>>>>
>>>> Why is that better than just modprobe.blacklisting those drivers?
>>>
>>> Because would allow to deny list all native (as Thomas called it) DRM drivers
>>> and only allow the simpledrm driver to be probed. This is useful for distros,
>>> since could add a "Basic graphics mode" to the boot menu entries, that could
>>> boot the kernel passing a "drm.disable_native_drivers=1" cmdline option.
>>>
>>> That way, if there's any problem with a given DRM driver, the distro may be
>>> installed and booted using the simpledrm driver and troubleshoot why a native
>>> DRM driver is not working. Or try updating the kernel package, etc.
>>
>> For troubleshooting, it'll be helpful if this new parameter can be enabled for the boot via the kernel command line, then disabled again after boot-up. One simple possibility for this would be allowing the parameter to be changed via /sys/module
> 
> That's already the case with the current patch, i.e:
> 
> $ grep -o drm.* /proc/cmdline 
> drm.disable_native_drivers=1
> 
> $ cat /proc/fb 
> 0 simpledrm
> 
> $ modprobe virtio_gpu
> 
> $ dmesg
> [  125.731549] [drm] pci: virtio-vga detected at 0000:00:01.0
> [  125.732410] virtio_gpu: probe of virtio0 failed with error -16
> 
> $ echo 0 > /sys/module/drm/parameters/disable_native_drivers
> 
> $ modprobe virtio_gpu
> 
> $ dmesg 
> [  187.889136] [drm] pci: virtio-vga detected at 0000:00:01.0
> [  187.894578] Console: switching to colour dummy device 80x25
> [  187.897090] virtio-pci 0000:00:01.0: vgaarb: deactivate vga console
> [  187.899983] [drm] features: -virgl +edid -resource_blob -host_visible
> [  187.907176] [drm] number of scanouts: 1
> [  187.907714] [drm] number of cap sets: 0
> [  187.914108] [drm] Initialized virtio_gpu 0.1.0 0 for virtio0 on minor 1
> [  187.930807] Console: switching to colour frame buffer device 128x48
> [  187.938737] virtio_gpu virtio0: [drm] fb0: virtio_gpu frame buffer device
> 
> $ cat /proc/fb 
> 0 virtio_gpu
> 
> /drm/parameters/<name>, which I suspect doesn't work with the patch as is (due to the 0600 permissions).
>>
>>
> 
> I followed the convention used by other drm module parameters, hence the
> 0600. Do you mean that for this parameter we should be less restrictive ?

No, it was simply a brain fart on my part. :}

Thanks for confirming this works!


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
