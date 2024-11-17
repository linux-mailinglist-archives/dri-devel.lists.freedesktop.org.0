Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016CC9D02B1
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 11:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96E410E233;
	Sun, 17 Nov 2024 10:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QQICdv8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7D510E233
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 10:03:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731837792; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZImCEZ/L7VdPIq1iHfScxG5gInaGjCyg00ocPujl+AJaa6mu90lxJ02Z8twhz89sbc4GArJZhSSbNdYZ26fmaegyZhMPb3IGdq337l9CiVjjA9usUd6wqpyXbQclQYyBqTq8pS40wFC/8r0fjb90LNnkdzdvy04hdVPbTpIpoWw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731837792;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4RDarTL7mHPGpvd0TmDOoV4a2AnLw64Zi8pnZTGtnV0=; 
 b=WytgpE5J3qlu3JDv+h5Y2pns3hYfuuhdFav1GzNh6+e2F+79X6f3GEcK/LOPlHxR8St0wDy+Oi/LzHAKN3jeQ8J21CPL3nm6w0IGBgNTgm26UzDzh2FS/26+zH1TqOzd0MfTy0B/eUFuORA2hLL1abuBjNQPEEUrqfVa/ss32YU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731837792; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4RDarTL7mHPGpvd0TmDOoV4a2AnLw64Zi8pnZTGtnV0=;
 b=QQICdv8ol5TN39OWIxZjkEQfbi2Odh0yyYZbnKXxQvj7TUh4oZaWuXshBhJhIAdW
 5918w11/hu63cI+QqEBZ8D2SjCsJ1qkzSLnjNAv3DQi7sCpgJgk9+RXgMMcOLycFXhV
 cJ+KHtlEfnqC2xDoMsNKvl10h1Bxek590Y2w3HKk=
Received: by mx.zohomail.com with SMTPS id 1731837790826978.8597482139137;
 Sun, 17 Nov 2024 02:03:10 -0800 (PST)
Message-ID: <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
Date: Sun, 17 Nov 2024 13:03:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 10/29/24 09:18, Kasireddy, Vivek wrote:
>>>> BTW, is any DG2 GPU suitable for testing of this patchset? Will I be
>>>> able to test it using a regular consumer A750 card?
>>> Yes, you can test with any DG2 dGPU as long as you can passthrough it to
>> the
>>> Guest VM. And, if there is an iGPU available on the Host, you can use
>> GTK/SDL UI
>>> for local display or Spice UI for remote display if there is no iGPU on the
>> Host.
>>> This is exactly how I started testing this patch series but I am now
>> predominantly
>>> testing this series with SRIOV enabled iGPUs and dGPUs.
>> Was hoping to try out SR-IOV on A750 if it's even possible at all.
> AFAIK, SRIOV is not supported on any versions of DG2 including A750.

I'm having trouble with getting it to work.

My testing setup:

1. Passthroughed A750 that uses XE driver
2. RaptorLake iGPU on host used for virtio-gpu, uses i915 driver
3. QEMU latest master branch + your QEMU vfio_dmabuf_2 patches applied
on top
4. Latest linux-next kernel on host
5. Latest linux-next kernel on guest + this v2 applied

In guest I'm running this:

  seatd-launch -- weston --drm-device=card1 --additional-devices=card0

where card1 is A750 and card0 is virtio-gpu.

I added printk's and see that virtio-gpu imports A750 dma-buf and gets
XE's SGT, but nothing shows on the QEMU display. I tried both GTK and
SPICE displays. If I connect HDMI display to passthroughed A750 while
running weston command above, then I get weston working on the A750 HDMI
display and still nothing is shown on virtio-gpu display.

I also had to force virtio-gpu driver to always probe before XE,
otherwise virtio-gpu gets PCI read errors and fails to probe because it
fails to detect virtio features.

Am I doing anything wrong? Suggestions are welcome.

-- 
Best regards,
Dmitry
