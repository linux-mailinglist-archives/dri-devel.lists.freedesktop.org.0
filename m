Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E49707FD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145E010E27B;
	Sun,  8 Sep 2024 14:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="Wd9kGipJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E8D10E27B;
 Sun,  8 Sep 2024 14:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DAE3C421F5;
 Sun,  8 Sep 2024 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1725804520;
 bh=wJum/JLf2GEZ8lHPuDokOJlL0/pcfxi+0okVEAon8AI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Wd9kGipJ8C6Xv7zMUvSGuKBGyKSjUYyjLR+pZbLCqiyD1tJG7elj/W3N8b1AwvTp+
 GTFDRGSlMM8jlb4YZLaTWVa2t4MI5ot4BTRysbukHv7bf9D6f0xZ9dUOnMBjl5sMmf
 LKdncYt2/a6fE3nSpsHVH1EliWYICUl6OcahhPQvwDmMtmR7HsdmLZg5gE3DjnIJNe
 JTezBEDXjW3visxU5Nir8iQgDPoo3gtT4AQVGqgme5W4S6Z1FuTH8sauFO22ukmQVa
 d9P76UjCCh/LTgLxVsYQwtmjGDerJ3+avrQoZGrOpNPHThIwIa9O0mcuYjPm4gY0b4
 zjZ4I0gmuU39g==
Message-ID: <4c9ce216-9762-4dfd-80c7-fe285cae05c2@asahilina.net>
Date: Sun, 8 Sep 2024 23:08:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <7ca931aa-986d-48d4-bcee-37c3badd91c8@asahilina.net>
 <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <x5kvnv6cdo6d2wdcsokvvsedzpr5crcncmmiqnkyomf4nez4mk@er3axfov44fc>
Content-Type: text/plain; charset=UTF-8
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



On 9/8/24 12:07 AM, Lucas De Marchi wrote:
> On Sat, Sep 07, 2024 at 08:38:30PM GMT, Asahi Lina wrote:
>>
>>
>> On 9/6/24 6:42 PM, Raag Jadav wrote:
>>> Introduce device wedged event, which will notify userspace of wedged
>>> (hanged/unusable) state of the DRM device through a uevent. This is
>>> useful especially in cases where the device is in unrecoverable state
>>> and requires userspace intervention for recovery.
>>>
>>> Purpose of this implementation is to be vendor agnostic. Userspace
>>> consumers (sysadmin) can define udev rules to parse this event and
>>> take respective action to recover the device.
>>>
>>> Consumer expectations:
>>> ----------------------
>>> 1) Unbind driver
>>> 2) Reset bus device
>>> 3) Re-bind driver
>>
>> Is this supposed to be normative? For drm/asahi we have a "wedged"
>> concept (firmware crashed), but the only possible recovery action is a
>> full system reboot (which might still be desirable to allow userspace to
>> trigger automatically in some scenarios) since there is no bus-level
>> reset and no firmware reload possible.
> 
> maybe let drivers hint possible/supported recovery mechanisms and then
> sysadmin chooses what to do?

How would we do this? A textual value for the event or something like
that? ("WEDGED=bus-reset" vs "WEDGED=reboot"?)

~~ Lina
