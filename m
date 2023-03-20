Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56AE6C104B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 12:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A205D10E353;
	Mon, 20 Mar 2023 11:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A2910E353
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:08:15 +0000 (UTC)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by lithium.sammserver.com (Postfix) with ESMTPS id 80EA431181CC;
 Mon, 20 Mar 2023 12:08:13 +0100 (CET)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
 by mail.sammserver.com (Postfix) with ESMTP id 293123627D;
 Mon, 20 Mar 2023 12:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
 t=1679310493; bh=0jP3D3BZL68xe5B5D2b80NpReBfe6GPfvVjUNfacUbQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kpt6Ql8kbkfDS+tXED4XbdBTPyvaXOo0ZYMUX/Ee9AD7jGBalMDdh3r5iH+Pu3tib
 eotxR8eXf10HWKPgYyuMabFt8Y/6BE4tdbqbc8okHdwT62Y+QNUnvlY6WVqDZsQAfw
 XGdDhJ+NmQF0lDV2lViexqKZLDd8jnxO+MsuydB4=
MIME-Version: 1.0
Date: Mon, 20 Mar 2023 12:08:13 +0100
From: =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
 <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
Message-ID: <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
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

On 2023-03-20 11:13, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
> [...]
> 
>>>> +    /*
>>>> +     * If a driver asked to unregister a platform device registered 
>>>> by
>>>> +     * sysfb, then can be assumed that this is a driver for a 
>>>> display
>>>> +     * that is set up by the system firmware and has a generic 
>>>> driver.
>>>> +     *
>>>> +     * Drivers for devices that don't have a generic driver will 
>>>> never
>>>> +     * ask for this, so let's assume that a real driver for the 
>>>> display
>>>> +     * was already probed and prevent sysfb to register devices 
>>>> later.
>>>> +     */
>>>> +    sysfb_disable();
>>> 
>>> This call to sysfb_disable() has been causing trouble with regard to
>>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices 
>>> to
>>> get rid of any console drivers (d173780620792c) using the device in
>>> question, but now even unrelated drivers are getting killed. Example
>>> situation:
>> 
>> Which drivers do you use?

This happens with either no drivers loaded or the proprietary nvidia
driver. Nouveau is fine as it doesn't rely on efifb but brings its own.

>> 
> 
> Also, what kernel version?

I tried with 6.2.6, can build mainline and test there as well.

Thanks for help!

> 
> [...]
> 
>>> 
>>> Machine has two GPUs and uses efifb for the console. Efifb registers
>>> with the aperture system the efi framebuffer region, which is covered
>>> by a BAR resource of GPU 1. VFIO grabs GPU 2 and calls
>>> aperture_remove_conflicting_pci_devices(GPU 2). GPU 2 has no overlap
>>> with the efifb on GPU1 but the efifb is killed regardless due to
>>> the unconditional call to sysfb_disable(). The console switches
>>> to dummy and locks up from the user perspective.
>>> This seems unnecessary, as the device is unrelated.
>>> 
> 
> That's a bug indeed but I thought that was already fixed...
