Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B6BC7836
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 08:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53A510E096;
	Thu,  9 Oct 2025 06:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="kYhhe1Qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9410E096
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 06:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759990437; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XgdDZCDNU+Fx7g1vU8sIbmbLxZ/0EWNmQsYB/+hx1PJ9ZBoS1KY0pmAk4kxftw8PD7BRNHHxCGuN3VFYnQEX/7XTUT1tkV+JPZyCqrPfHdBjU697x9XIkiX6XTjb54DJZPRd11Lrd1WTbEudKlWWXkhyS1bNJuMiw5KP/Dq29vs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759990437;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=J+cBXdB1ZMMli8mKVf2kyUjE3bvvgHzHmHesP6oSy7Q=; 
 b=hbiWQcVMogq2jcrCpjKzc46NrB0NUAKqvfyxnqEtM0konzAlzkIZr1+n+LLvgMl5k9so6nRoXKDiq2L0tIncy26hjAw/OyFjL2JBrXSxxtsX7ibPw4Xz2ozfPMX6udaNzbHJI/1xmniVhmBNFCXC+1my2rbVIsHK5FqafS2A7+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759990437; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=J+cBXdB1ZMMli8mKVf2kyUjE3bvvgHzHmHesP6oSy7Q=;
 b=kYhhe1QarZLzVWosy/RcuaYIs4Mg+JZtJ8//R9ecik/DL0Y1y2MkAZwBGJHWtJ+h
 8XBuA8Qc1bbRzKSwyvpYe2ukSGIGlcIcjjozLkMSVvm6H4Ifx68FTK5jKnHXkTncSMl
 S/pNAsT3xPLT53NkdYlq032/3vYjBbq1GA/QTibs=
Received: by mx.zohomail.com with SMTPS id 1759990435197633.6159650403903;
 Wed, 8 Oct 2025 23:13:55 -0700 (PDT)
Message-ID: <9aa83493-e036-4a89-825c-3ed95ab5ae30@collabora.com>
Date: Thu, 9 Oct 2025 09:13:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/9/25 06:23, Kasireddy, Vivek wrote:
> Hi Thomas,
> 
>> Subject: [PATCH] drm/virtgpu: Use vblank timer
>>
>> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
>> helpers provide an implementation on top of Linux' hrtimer. Virtgpu
>> enables and disables the timer as part of the CRTC. The atomic_flush
>> callback sets up the event. Like vblank interrupts, the vblank timer
>> fires at the rate of the display refresh.
>>
>> Most userspace limits its page flip rate according to the DRM vblank
>> event. Virtgpu's virtual hardware does not provide vblank interrupts, so
>> DRM sends each event ASAP. With the fast access times of virtual display
>> memory, the event rate is much higher than the display mode's refresh
>> rate; creating the next page flip almost immediately. This leads to
>> excessive CPU overhead from even small display updates, such as moving
>> the mouse pointer.
>>
>> This problem affects virtgpu and all other virtual displays. See [1] for
>> a discussion in the context of hypervdrm.
> When running Virtio-gpu with some of the UIs (gtk, spice, etc) in Qemu, the
> Guest display updates are synchronized with a timer (or repaint callback in
> the case of Gtk) the UI layer provides particularly when blob=true. In other
> words, the Guest's atomic commit does not complete until the Host signals
> (via a fence) that the update (or flush) is done.
> 
> This is because when blob=true, the Guest's FB is accessed by the Host without
> making any copies. So, to avoid tearing, the Guest needs to be prevented from
> accessing its FB until the Host is done. Therefore, I think for virtio-gpu, the virtual
> vblank timer can only be helpful when blob=false as this is the only case where
> Guest's display updates are unbounded (and Host makes a copy of the Guest's FB).
> 
> I am not sure how this would affect virgl use-cases but Dmitry can help explain if
> the vblank timer would be useful there or not.

The vblank timer should only limit framerate of virtio-gpu, I don't
expect it will cause new problems. Do you see tearing using this patch?

Vblank timer makes a big performance improvement for virtio-gpu KMS,
especially for a native context on QEMU. No tearing spotted with it.

-- 
Best regards,
Dmitry
