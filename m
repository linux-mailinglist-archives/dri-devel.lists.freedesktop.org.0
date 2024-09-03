Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B39696FE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6CC10E332;
	Tue,  3 Sep 2024 08:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WiGizyk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB1E10E307
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:27:27 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03E602D5;
 Tue,  3 Sep 2024 10:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725351974;
 bh=mb7DUuTIdDuNYNGrCBKnuKsZ+Tf6fjlRAdJlDx3T2KM=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=WiGizyk2mqGsQQfPjJJIUoKbyTleJCB2W/p0B/TcO5ek3C7Rk0JXWFEp3eNzt0pAX
 IjhBCYjKlFg4edsd5xwvMm/ZyC+KWn7rCDLS8f7v/sy33yvxyAAkjgrSVyHR92FccH
 RsvqcrUDdux4QI749rqfYgJhCcAgAd0k5hwNlJlU=
Message-ID: <d58f5dad-3f60-424f-bed4-460e2ac4b022@ideasonboard.com>
Date: Tue, 3 Sep 2024 11:27:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
To: Simona Vetter <simona.vetter@ffwll.ch>
References: <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
 <20240626-warping-nondescript-mustang-bfce27@houat>
 <b7cf71b8-76fd-4638-a7b6-cc8dbae635bf@ideasonboard.com>
 <20240702-bold-exotic-mamba-fdbba4@houat>
 <7293448e-e8cc-4522-b39c-5ad133e5f732@ideasonboard.com>
 <20240725-natural-giga-crane-d54067@houat>
 <4ed3791f-bc5a-46f1-88e1-2441c7f9c8d4@ideasonboard.com>
 <20240902-refined-smooth-mammoth-fbee81@houat>
 <ZtWYWuqhqvdWd0Q7@phenom.ffwll.local>
 <d411e79f-a22e-48e9-b135-5d7a0afa3cf3@ideasonboard.com>
 <Zta9h9QiL_OsV3FO@phenom.ffwll.local>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <Zta9h9QiL_OsV3FO@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/09/2024 10:40, Simona Vetter wrote:
> On Mon, Sep 02, 2024 at 03:31:28PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 02/09/2024 13:50, Daniel Vetter wrote:
>>> On Mon, Sep 02, 2024 at 11:26:11AM +0200, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Wed, Aug 07, 2024 at 03:19:23PM GMT, Tomi Valkeinen wrote:
>>>>> On 25/07/2024 14:28, Maxime Ripard wrote:
>>>>>> On Mon, Jul 15, 2024 at 11:32:34AM GMT, Tomi Valkeinen wrote:
>>>>>>> On 02/07/2024 14:43, Maxime Ripard wrote:
>>>>>>>> Hi Tomi,
>>>>>>>>
>>>>>>>> On Wed, Jun 26, 2024 at 06:53:40PM GMT, Tomi Valkeinen wrote:
>>>>>>>>> On 26/06/2024 18:07, Maxime Ripard wrote:
>>>>>>>>>> On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
>>>>>>>>>>> On 26/06/2024 11:49, Maxime Ripard wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
>>>>>>>>>>>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> When a bridge driver uses devm_mipi_dsi_device_register_full() or
>>>>>>>>>>>>> devm_mipi_dsi_attach(), the resource management is moved to devres,
>>>>>>>>>>>>> which releases the resource automatically when the bridge driver is
>>>>>>>>>>>>> unbound.
>>>>>>>>>>>>>
>>>>>>>>>>>>> However, if the DSI host goes away first, the host unregistration code
>>>>>>>>>>>>> will automatically detach and unregister any DSI peripherals, without
>>>>>>>>>>>>> notifying the devres about it. So when the bridge driver later is
>>>>>>>>>>>>> unbound, the resources are released a second time, leading to crash.
>>>>>>>>>>>>
>>>>>>>>>>>> That's super surprising. mipi_dsi_device_unregister calls
>>>>>>>>>>>> device_unregister, which calls device_del, which in turn calls
>>>>>>>>>>>> devres_release_all.
>>>>>>>>>>>
>>>>>>>>>>> Hmm, right.
>>>>>>>>>>>
>>>>>>>>>>>> If that doesn't work like that, then it's what needs to be fixed, and
>>>>>>>>>>>> not worked around in the MIPI-DSI bus.
>>>>>>>>>>>
>>>>>>>>>>> Well, something causes a crash for both the device register/unregister case
>>>>>>>>>>> and the attach/detach case, and the call stacks and debug prints showed a
>>>>>>>>>>> double unregister/detach...
>>>>>>>>>>>
>>>>>>>>>>> I need to dig up the board and check again why the devres_release_all() in
>>>>>>>>>>> device_del() doesn't solve this. But I can probably only get back to this in
>>>>>>>>>>> August, so it's perhaps best to ignore this patch for now.
>>>>>>>>>>>
>>>>>>>>>>> However, the attach/detach case is still valid? I see no devres calls in the
>>>>>>>>>>> detach paths.
>>>>>>>>>>
>>>>>>>>>> I'm not sure what you mean by the attach/detach case. Do you expect
>>>>>>>>>> device resources allocated in attach to be freed when detach run?
>>>>>>>>>
>>>>>>>>> Ah, never mind, the devres_release_all() would of course deal with that too.
>>>>>>>>>
>>>>>>>>> However, I just realized/remembered why it crashes.
>>>>>>>>>
>>>>>>>>> devm_mipi_dsi_device_register_full() and devm_mipi_dsi_attach() are given a
>>>>>>>>> device which is used for the devres. This device is probably always the
>>>>>>>>> bridge device. So when the bridge device goes away, so do those resources.
>>>>>>>>>
>>>>>>>>> The mipi_dsi_device_unregister() call deals with a DSI device, which was
>>>>>>>>> created in devm_mipi_dsi_device_register_full(). Unregistering that DSI
>>>>>>>>> device, which does happen when the DSI host is removed, does not affect the
>>>>>>>>> devres of the bridge.
>>>>>>>>>
>>>>>>>>> So, unloading the DSI host driver causes mipi_dsi_device_unregister() and
>>>>>>>>> mipi_dsi_detach() to be called (as part of mipi_dsi_host_unregister()), and
>>>>>>>>> unloading the bridge driver causes them to be called again via devres.
>>>>>>>>
>>>>>>>> Sorry, that's one of the things I don't quite get. Both functions are
>>>>>>>> exclusively(?) called from I2C bridges, so the device passed there
>>>>>>>> should be a i2c_client instance, and thus the MIPI-DSI host going away
>>>>>>>> will not remove those i2c devices, only the MIPI-DSI ones, right?
>>>>>>>
>>>>>>> Yes.
>>>>>>>
>>>>>>>> So if we remove the host, the MIPI-DSI device will be detached and
>>>>>>>> removed through the path you were explaing with the i2c client lingering
>>>>>>>> around. And if we remove the I2C device, then devm will kick in and will
>>>>>>>> detach and remove the MIPI-DSI device.
>>>>>>>
>>>>>>> Right.
>>>>>>>
>>>>>>>> Or is it the other way around? That if you remove the host, the device
>>>>>>>> is properly detached and removed, but there's still the devm actions
>>>>>>>> lingering around in the i2c device with pointers to the mipi_dsi_device
>>>>>>>> that was first created, but since destroyed?
>>>>>>>>
>>>>>>>> And thus, if the i2c device ever goes away, we get a use-after-free?
>>>>>>>
>>>>>>> Hmm, I'm not sure I understand what you mean here... Aren't you describing
>>>>>>> the same thing in both of these cases?
>>>>>>>
>>>>>>> In any case, to expand the description a bit, module unloading is quite
>>>>>>> fragile. I do get a crash if I first unload the i2c bridge module, and only
>>>>>>> then go and unload the other ones in the DRM pipeline. But I think module
>>>>>>> unloading will very easily crash, whatever the DRM drivers being used are,
>>>>>>> so it's not related to this particular issue.
>>>>>>>
>>>>>>> In my view, the unload sequence that should be supported (for development
>>>>>>> purposes, not for production) is to start the unload from the display
>>>>>>> controller module, which tears down the DRM pipeline, and going from there
>>>>>>> towards the panels/connectors.
>>>>>>>
>>>>>>> Of course, it would be very nice if the module unloading worked perfectly,
>>>>>>> but afaics fixing all that's related to module unloading would be a
>>>>>>> multi-year project... So, I just want to keep the sequence I described above
>>>>>>> working, which allows using modules while doing driver development.
>>>>>>
>>>>>> FTR, I'm all for supporting module unloading. The discussion above was
>>>>>> about what is broken exactly, so we can come up with a good solution.
>>>>>
>>>>> Does that mean that you're ok with the patch, or that something should be
>>>>> improved?
>>>>
>>>> No, I meant that at the very least the commit log needs to be updated to
>>>> reflect what is actually going on, because at least my understanding of
>>>> it doesn't match what actually happens.
>>>>
>>>> We want a solution to the problem you're facing, but it's not clear to
>>>> me what the problem is exactly at this point, so it's hard to review a
>>>> solution.
>>>
>>> So I haven't looked at the full thing, but I think the proper fix is to
>>> make both detach and unregister cope with being called multiple times. I
>>> think devm_ here is a red herring, the underlying issues is that we can
>>> unregister/detach from two sides:
>>>
>>> - when the host dsi goes away
>>> - when individual dsi devices on a given host go away
>>>
>>> So there needs to be book-keeping and locking to make sure no matter which
>>> order things disappear, we don't try to unregister/detach a dsi device
>>> twice.
>>
>> I think that is what my patch does (for devm_).
> 
> Yep, except I think you should just do it for everyone, not just for the
> special case where one of the calls is done through devm.
> 
>> Some vocabulary first:
>>
>> dsi peripheral device - The device that represents the DSI peripheral. It is
>> a bridge or a panel, and (usually) an i2c or platform device.
>>
>> dsi peripheral driver - The driver handling the dsi peripheral device.
>>
>> dsi device - Runtime created device instance that represents the DSI
>> peripheral. So in my case we have the i2c bridge device, and a dsi device is
>> created for it in the setup code.
>>
>> dsi controller device - A device that has a DSI bus (usually a platform or
>> i2c device, I would guess).
>>
>> dsi controller driver - A driver for the dsi controller device. Creates the
>> dsi host.
>>
>> dsi host - represents the DSI host side, owned by the dsi controller driver.
>>
>> When a dsi peripheral driver uses devm_mipi_dsi_device_register_full() or
>> devm_mipi_dsi_attach(), the dsi device is created and attached to the dsi
>> host. When the dsi peripheral device-driver is unbound, devres will call
>> unregister and detach are called automatically. This works fine.
>>
>> But when the device-driver for the dsi controller is unbound, the dsi
>> controller driver will unregister the dsi host, and the unregistration will
>> also unregister and detach the dsi device. But the devres is not told about
>> that. So when the dsi peripheral is later unbound, its devres will again
>> unregister and detach.
>>
>> To fix that this patch uses devm_remove_action() to remove the devres action
>> when the host side goes away first.
>>
>> Now, after writing the above, I realized that all this won't help with the
>> non-devm versions: the host side has unregistered and detached the dsi
>> device, but if the dsi peripheral driver calls mipi_dsi_detach() or
>> mipi_dsi_device_unregister(), it will again crash.
>>
>> Handling the attach/detach should be quite easy, and in fact the code
>> already handles it, but it uses WARN_ON() there so that has to go. But
>> attach/detach will crash anyway if the dsi device has already been freed,
>> which happens when the dsi controller driver calls
>> mipi_dsi_device_unregister().
> 
> Hm I thought we have a full struct device, so refcounted, and also with
> struct device unregister should be separate from the final kfree when the
> last reference drops away. Hence I thought this should just work.
> 
> We might need to grab a reference in attach/detach to sort this out?

I think there's a bit more to it. A non-dsi-device bridge driver would do:

(devm_)mipi_dsi_device_register_full()
...
(devm_)mipi_dsi_attach()

The DSI host side could unregister and free the dsi_device right after 
the call to mipi_dsi_device_register_full(), and mipi_dsi_attach() would 
probably just crash.

If I understand this correctly, the main issue is that the bridge driver 
doesn't own an exclusive reference to the dsi_device, even if it looks 
like it does, but rather both the dsi host and the bridge driver share 
the same reference. So, we could get an extra reference, so that each 
side has its own.

But I think there's more. The bridge driver will call 
mipi_dsi_device_unregister() (manually or via devres), and that does 
device_unregister(). However, the dsi host will also call 
mipi_dsi_device_unregister() when tearing down, which would result in 
another device_unregister().

The above is not a problem if the bridge does away first, as then the 
dsi bus won't contain the dsi_device anymore, and the dsi host will not 
unregister it. But if it's the other way around, the dsi host will do 
device_unregister, and later the bridge will do it too as it thinks it 
owns the dsi_device.

I presume that can be solved by tracking whether we have unregistered 
the dsi_device or not. However, what would happen if the bridge driver 
calls any of the other mipi_dsi_* functions with the dsi_device that has 
already been unregistered by the dsi host? Nothing good, probably. So 
all those functions should start to fail graciously when the dsi_device 
has been unregistered. Or the bridge driver should somehow get a 
notification about the unregistration so that it knows not to call those 
functions.

I have to say I feel a bit uncertain about the whole ownership model here.

  Tomi

