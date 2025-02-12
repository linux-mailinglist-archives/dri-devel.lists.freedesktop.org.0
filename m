Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03267A32480
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 12:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C5D10E856;
	Wed, 12 Feb 2025 11:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RxnaPZ2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646A010E856
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 11:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739358856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CdmEC7WTpRZKbkzzTKfU8sOnmJXvCIvbDDplNyC0I14=;
 b=RxnaPZ2H8yCMpBL/EPsu3qVEjEm44p4UjYIcILTVC422QWywHByZhtV+cGZfOBDaD8GghE
 cAh/Jnu2yQSNVh5/d++uvqtcQ9yfJDjwoW8xOnJRBGZfYDn0fjpfvzBCBVzuiIOl9aLbbb
 gcAiMZmD3MSBvgdMujAbwvJLFNCArEc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-1qpvoiCgN7u7EQQyGQVwBg-1; Wed, 12 Feb 2025 06:14:15 -0500
X-MC-Unique: 1qpvoiCgN7u7EQQyGQVwBg-1
X-Mimecast-MFC-AGG-ID: 1qpvoiCgN7u7EQQyGQVwBg
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab77e03f2c0so547309466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 03:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739358854; x=1739963654;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CdmEC7WTpRZKbkzzTKfU8sOnmJXvCIvbDDplNyC0I14=;
 b=ZKBa6i432E88CNi1MPwFWP9mSXPexMX54ICS9detroV7P7DGFIroJxdGdYmB4b4rFA
 OVxmEZ2vnNA3DP14LSIazYjLCEJJqKLzjHhz2xPvwUqSPp4sQeabiKG0X0X33oaHNnP4
 B1POS3NJIVbSAHDFfv9lS88YmgyvCPZQRCsuDjPrCMSqfR4FNbshFPwc1BhaLANJqWGK
 WoD+yRXBd6BBnkcGshPZeUxhB9FkcPmCWkl1rCe4cfntRF/xK0nYaRPgzogeBLXdDr6q
 hsob0TY8dPofPawuA2X/kMltSrh4/NfhPI/ZE2vMK+xBHL6Lq7wS/CScVumW/mCkuumU
 59cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKV6M0/+QlHf3WvVqHtSeRVZ/f9rl/l8FQ6nA/K8vjUseJxjGyl0hdW6WkFqzIR62Nfzgo72X2Ybc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx13ThsZO+qGKnT/65enl7tKP+oW4vZ9vltuhURCQxvLKQ8aQlg
 XgCOZ8cABClhlXcZWRY+A9MwI6Bgmsoyg1i97bvD+Zcte9Z2jnRWpqzJR7jMkdRAArjGdgHR5gq
 +HrI5isyw8SZ04x+mu9OBKJL8q8cOpJFYF0y2SRmqsmC5L8pEu5XykvbbgpkdKwZK9Q==
X-Gm-Gg: ASbGncvUInwiqNtRPtjgF5AQrRJ1mtjLI8y8lGKGzmUV0KGqagd6LOVkYYkLGX62hnT
 HP/7n8ROaCtl6S4UQEsKZCVBOrEx33kyWgnTjblgq4LkGiG22xLmFak9T8uvJ86InxzbL5C0qfJ
 Q8hTOs9J/Cdm2diPYRyuFKrcJqGSJgEuzQnSdZ/LaPPWXkZpz6VH0m3aHd3X8Dog/d0op9vxnMi
 ipyqsoEmRdKvRa8I1gzKQBM/L2xOS4XbK+pq8WTzAG/JwG0dgiREGhr2Qmm+qEFu9X1I3LlB7i5
 UGESB48WscoKVMV/AjXxTuAYOqRlGY4aDSwmx8uvUmyUIL0/pz0P5VulmR16whsCNU2EaA3dkU5
 Gxt5C7CvIMtRMYqfsIVVW4P9DjqsdTeefLbAb4qCKbsNHdeaX8G3tW5A=
X-Received: by 2002:a17:906:c109:b0:ab7:5a5f:113 with SMTP id
 a640c23a62f3a-ab7f33bdba1mr213790266b.23.1739358853998; 
 Wed, 12 Feb 2025 03:14:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMykeARXPTVdNGJOlHWMvQ5H96eJcBP9W/uhbsF+jMaq3D1UX4G2MfdgOaNU4it0Ck0kMAdQ==
X-Received: by 2002:a17:906:c109:b0:ab7:5a5f:113 with SMTP id
 a640c23a62f3a-ab7f33bdba1mr213787066b.23.1739358853506; 
 Wed, 12 Feb 2025 03:14:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7f6064185sm106724966b.175.2025.02.12.03.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:14:12 -0800 (PST)
Message-ID: <e64c6778-9698-4970-a3c3-af3aabc232be@redhat.com>
Date: Wed, 12 Feb 2025 12:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Handheld gaming PC panel orientation quirks
To: Thomas Zimmermann <tzimmermann@suse.de>, John Edwards <uejji@uejji.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250124204648.56989-2-uejji@uejji.net>
 <b3caa748-2dbd-4911-968f-878fcd118a9b@suse.de>
 <6abc98bd-5ef9-491e-985b-7ed8a848c96e@redhat.com>
 <f0185bb4-4f43-4ae1-8f81-ec4185160a5b@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f0185bb4-4f43-4ae1-8f81-ec4185160a5b@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qu_Xm-xGBK8TE1ZxBL8JxWrM6FKaj6giM5yMfnWnlgk_1739358854
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 12-Feb-25 12:11 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.02.25 um 11:51 schrieb Hans de Goede:
>> Hi Thomas,
>>
>> On 11-Feb-25 2:55 PM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 24.01.25 um 21:46 schrieb John Edwards:
>>>> Hello.
>>>>
>>>> I am submitting a small number of patches to add panel rotation quirks for
>>>> a few handheld gaming PCs.  These patches were created by the SteamFork
>>>> team and are in daily use by us and/or members of our community.
>>>>
>>>> The following devices are covered by these patches:
>>>> 1: AYANEO 2S
>>>> 2: AYANEO Flip DS, AYANEO Flip KB
>>>> 3: AYANEO Slide, Antec Core HS
>>>> 4: GPD Win 2 (with correct DMI strings)
>>>> 5: OneXPlayer Mini (Intel)
>>>>
>>>> Thank you for your consideration and for taking the time to review these
>>>> patches.
>>> Did you ever receive any response to this series? If not, then
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> I had the following remark for 3 new entries added in patches 2/5 + 3/5:
>>
>> "Since this '}' is closing the .matches initializer it should be indented 2 tabs"
>>
>> With that fixed, you can add my:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> to the entire series.
>>
>>> for the series. Let me know if you need assistance for getting the patch files merged.
>> Normally I pickup/merge these panel orientation quirks, but I've been swamped
>> which is why these have just been sitting on the list.
>>
>> Thomas, I would appreciate it if you can merge the set into drm-misc-fixes, with
>> the 3 minor indentation issues fixed.
> 
> Sure, no problem. I'll wait for John to provide an update. Otherwise, I'll fix it myself while merging the series.

Great thank you.

Note in the review comments I said that we could likely fixup the indentation
issues while merging. If you prefer a new version from John that is fine too,
but we need to make clear to John what we want :)

Regards,

Hans




>>>> v2:
>>>> - Minor rewording of commit messages
>>>> - Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
>>>> - Add OneXPlayer Mini (Intel) patch
>>>>
>>>> v1:
>>>> https://lore.kernel.org/dri-devel/20250116155049.39647-2-uejji@uejji.net/
>>>>
>>>> Andrew Wyatt (5):
>>>>     drm: panel-orientation-quirks: Add support for AYANEO 2S
>>>>     drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
>>>>     drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
>>>>     drm: panel-orientation-quirks: Add new quirk for GPD Win 2
>>>>     drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
>>>>
>>>>    .../gpu/drm/drm_panel_orientation_quirks.c    | 40 ++++++++++++++++++-
>>>>    1 file changed, 38 insertions(+), 2 deletions(-)
>>>>
> 

