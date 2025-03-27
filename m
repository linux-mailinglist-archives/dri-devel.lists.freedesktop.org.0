Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779DA72E1D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA2D10E0CD;
	Thu, 27 Mar 2025 10:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OOD1fd6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418AF10E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743072458; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kKiWg6QUy451BUDU2CsSbDHKO4Ht/NOLLSEUguTpZhHNFg3+oy65McxxEsuJnSuidZ8g+QlF81kYERKuo878UxqIYugLBqFQdXDYfO5medDTzhLgS8XbpysEIDkiYmjyTGveEc4Qqc4D80YhWNfPwAcv9g2AqRD4WtuJ49xFbLQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743072458;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tso8tShyCAlR9Ojf8bTQYqSzBPMtPFXqnm1L3DLSMTc=; 
 b=Skhh5B89wVhUUHvrCTi0/M/EgOSvOIxwJFkkaVtCIqeim/YUb+8TWOtclWNXjBMSzSfUuXBL0i6zPGq6dPxKpPJKRVnxOb4fnV+ekjxI9RqdsOeMyBQsKPdsYwDq45S/4TPdvxhCPdqHSb5tBgbYtq3QUiyAJg9B+CEQJ49br80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743072458; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=tso8tShyCAlR9Ojf8bTQYqSzBPMtPFXqnm1L3DLSMTc=;
 b=OOD1fd6lS5WRaWgR6qM1Fd+JZdVZuY+tUwyjjo0nDItXqpnRxg1/DuROVt/P/YyZ
 5iRypRyCwyxtlhxMlV5e7wJ45zTmgjlST8LWDEIvfBWMuB7F1FSI3ft1BZX2huiB8N5
 dZh+zdUSOC22erPAjAp2ZP/k7KDXc6X9RUDrVaEo=
Received: by mx.zohomail.com with SMTPS id 1743072456214636.3840766945316;
 Thu, 27 Mar 2025 03:47:36 -0700 (PDT)
Message-ID: <c2c5db3c-ebb3-4448-b7ab-6133857da109@collabora.com>
Date: Thu, 27 Mar 2025 13:47:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Add generic DRM-shmem memory shrinker (part 1)
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <0e0686da-ae96-4a7a-81b2-b9ece1fa4837@suse.de>
 <1c9daef3-cd64-4f2f-8021-6ab2f17ae572@collabora.com>
 <20250327114520.5b470d8e@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250327114520.5b470d8e@collabora.com>
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

On 3/27/25 13:45, Boris Brezillon wrote:
> On Wed, 26 Mar 2025 23:08:55 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 3/25/25 17:17, Thomas Zimmermann wrote:
>>> I've looked through this before, so
>>>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.d>
>>>
>>> for the series.  
>>
>> Applied to misc-next, thanks!
> 
> Looks like the accel drivers were left behind. I just sent a patch
> series to address that [1].
> 
> [1]https://lore.kernel.org/r/dri-devel/20250327104300.1982058-1-boris.brezillon@collabora.com/

Accel drivers weren't on my radar, thanks a lot!

-- 
Best regards,
Dmitry
