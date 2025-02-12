Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B85A323E2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE3610E849;
	Wed, 12 Feb 2025 10:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W97030vc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229B010E849
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739357471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NVWfHrBC3Lh67poyMCVhjWSuRg6nFdzuXOVckKcJ5M=;
 b=W97030vc7r8z9Ipmvj8FlMVfL+BidIEgXCT36ZGpUy8zrleH0Q0CchD2yGBjzzeMGSmYJx
 lRvjHSIorOxwOgszxdisr7Ym+y4KF9F7S/x1N82nRfV8MZXDwrPuheiLYDOF3f0zlHEd1G
 1VWOc1q9CcfUD0UG/gNESW+Ylanky28=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-0ck-J2VaNxuKpZFZkX6K3g-1; Wed, 12 Feb 2025 05:51:09 -0500
X-MC-Unique: 0ck-J2VaNxuKpZFZkX6K3g-1
X-Mimecast-MFC-AGG-ID: 0ck-J2VaNxuKpZFZkX6K3g
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab77e03f2c0so544893766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357469; x=1739962269;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+NVWfHrBC3Lh67poyMCVhjWSuRg6nFdzuXOVckKcJ5M=;
 b=tEpq7sB7uB6CP3weXkWWttJ7GzMXbpJUU48+pXSdN+GcgRtoLPpVTtBIenzQUi/3nr
 daXi7n7+8VuqiEbGmpqCkpPwdDmflJ+c86ZiJX7GYQJN4P5/subRCvLrHsAuM/JgM0Lm
 T2SF1AfDA40sNeMeNWeBj4LEdnSk/h2PR/Bz3EX8UMpp/8uhYgKlUV/C0zEsZykaX8Fm
 P/kkBG7RRsPor5oEoWXdZwuUgwrKKLug30CVA0+BCeiCb7taBWeJcvCElAm4BLSysxzG
 Bzez6RF4TDoJVfAKyBNJjwt014IWSU8k00k0SAnVpnwF4SKxKdZdJHRMBLdvOjGGQcJO
 ai1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMhndJkKg3tzUcYzsZgVP9FvGJrrSa1BvnIObxkBfaXYx6riX+3HFdfxWmyDZ2GIMepkre7/HEitY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq+FXH4JyyGEp1ZUN0GcGeXUfu1JnnCPfMiuY1xzpxP+w7And9
 NmQ7fZfVs9z4pNMuK3z14bbkB8C7PjRt/mX7iiKzpDwrbQ7QoTl1PIuzZso+dJEfwaDkAadWqfb
 h291tY2rPp13bGcafIZzUv3cnE1rdhRn2b4h71q/J/8rRaX9HdVOeoQ3HdncacVoWXQ==
X-Gm-Gg: ASbGncu0Ld6pvM8V9a/ytaOproXIH6Nqto2Lq1y5BZ1B/UFGhOAWwG3t4rYRnNaF02T
 NGQCvcbrYRcQR5BXqZ2pCethgmsAKR5gkBIXd3dnHj7AkLCuEA1ZwxtzEf99pNMyYsZz7q4r7n7
 kKHJUPPfo0d0uK+jhexZyNtpWu6Jf3kR/O47GqY9VRMojooaetYwgV7wpspcdI/s6DvaY8GW+R+
 Qxby1EH47NqBStJ//dIg9WW0mTc/qRiJoNoR9kW9ACrqmZbWOMZAefp0AfbT6jida72CN1fXqVq
 4ePyXGawZGW1ItfRNAnoy3HSSRgMEoeKsU5ZLuSVgOZO5JHTmw9+IzDbKXQB5Fb0Xb5qtaxjlbB
 A/71IOG/xXdKCDjPyDGCuM/+A2MHG/tHii0vOBh7iFEwm3S//PW+NtVM=
X-Received: by 2002:a17:907:720a:b0:ab7:b9b5:60e7 with SMTP id
 a640c23a62f3a-ab7f347e265mr223616566b.40.1739357468692; 
 Wed, 12 Feb 2025 02:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHs132jIFP9s0HY3xqKoTb1xOmtPbhJ3uXSXHZ17eVzFXXSL5pSxjUDItBcM4Rtwp/jiCtuA==
X-Received: by 2002:a17:907:720a:b0:ab7:b9b5:60e7 with SMTP id
 a640c23a62f3a-ab7f347e265mr223613966b.40.1739357468288; 
 Wed, 12 Feb 2025 02:51:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab794509fcesm996858566b.34.2025.02.12.02.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 02:51:07 -0800 (PST)
Message-ID: <6abc98bd-5ef9-491e-985b-7ed8a848c96e@redhat.com>
Date: Wed, 12 Feb 2025 11:51:07 +0100
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b3caa748-2dbd-4911-968f-878fcd118a9b@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 95I9ZBUtL6XlWTkOCzP0EFRwq-4jX9SE2coPI0oFkek_1739357469
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

Hi Thomas,

On 11-Feb-25 2:55 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.01.25 um 21:46 schrieb John Edwards:
>> Hello.
>>
>> I am submitting a small number of patches to add panel rotation quirks for
>> a few handheld gaming PCs.  These patches were created by the SteamFork
>> team and are in daily use by us and/or members of our community.
>>
>> The following devices are covered by these patches:
>> 1: AYANEO 2S
>> 2: AYANEO Flip DS, AYANEO Flip KB
>> 3: AYANEO Slide, Antec Core HS
>> 4: GPD Win 2 (with correct DMI strings)
>> 5: OneXPlayer Mini (Intel)
>>
>> Thank you for your consideration and for taking the time to review these
>> patches.
> 
> Did you ever receive any response to this series? If not, then
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I had the following remark for 3 new entries added in patches 2/5 + 3/5:

"Since this '}' is closing the .matches initializer it should be indented 2 tabs"

With that fixed, you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to the entire series.

> for the series. Let me know if you need assistance for getting the patch files merged.

Normally I pickup/merge these panel orientation quirks, but I've been swamped
which is why these have just been sitting on the list.

Thomas, I would appreciate it if you can merge the set into drm-misc-fixes, with
the 3 minor indentation issues fixed.

Regards,

Hans




>> v2:
>> - Minor rewording of commit messages
>> - Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
>> - Add OneXPlayer Mini (Intel) patch
>>
>> v1:
>> https://lore.kernel.org/dri-devel/20250116155049.39647-2-uejji@uejji.net/
>>
>> Andrew Wyatt (5):
>>    drm: panel-orientation-quirks: Add support for AYANEO 2S
>>    drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
>>    drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
>>    drm: panel-orientation-quirks: Add new quirk for GPD Win 2
>>    drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
>>
>>   .../gpu/drm/drm_panel_orientation_quirks.c    | 40 ++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
> 

