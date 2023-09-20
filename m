Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEBD7A8D2C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 21:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2357E10E544;
	Wed, 20 Sep 2023 19:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84A510E545
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695239615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYRAQSJ/mIsjZ7lej8HuVZ7DoqHau0ERsGdB4RaFzfA=;
 b=jJe7ZrMk66aFiIfCYs4tKKDvW5+zecJOocsvdEN8Bq8KXPfBoSMTbRBvpgwutIfaEoIuoN
 5IiLAGnCBBhumtU1Ps1XXCDCkoOXB1Mx9p2AlRRgdqTR7CzXij6h6Lf2tWsJzkNyZyrQWT
 KVOwZdV+xd9Q77E2admLk8Sg+dpPLRM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-wb9oXTa0NsSNtNCGp1ggTA-1; Wed, 20 Sep 2023 15:53:32 -0400
X-MC-Unique: wb9oXTa0NsSNtNCGp1ggTA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c129cb765bso1656161fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695239611; x=1695844411;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OYRAQSJ/mIsjZ7lej8HuVZ7DoqHau0ERsGdB4RaFzfA=;
 b=QCj5WWJ46Jw2jxy8uyYBc0VuK6U4nm6aMjTeZ/DJhvfYqExlN87YrXhXVJsTPhceE/
 +BoTmRrqdLDOiIIYscHi5mjfy0JSaU5tXnPLhLQ5oiYnFA5+tHtIZMUXIUynQdzuToES
 fUEY/RIUgGUGz8ljYKaY9a/uvBbquZ1MtwWeFuDwEmJn7dqTZDybGsFeD5jt+BDyiD2T
 GLyDM3cymwEScOIse1f8l92pykRXedgIlUFTjvVU/WilUEm7MGvWcdEJNnQA9ZCrkPhR
 4j4F93K+Tuar9p2x/H7qoquZprECwsfr+gwzxlBxfOtjAuNvxgqRR961L6beYJjxzDdw
 vIsw==
X-Gm-Message-State: AOJu0YxMH+Tnl+COy0Cjtmy/fKpYwZcr1szC2E4T8c4RH2mzDVQQUzCi
 As6o4XTIWo4Uj2LiuwgAX5ECaNSKHAnAIqrZvRGZdaD2qXvxo0xFMJMiV8U4/jVKOVlLBQeNczI
 eCCFpTMsVATFVxIQajhfjfHkdzvku
X-Received: by 2002:a2e:b179:0:b0:2bd:19c5:3950 with SMTP id
 a25-20020a2eb179000000b002bd19c53950mr2909819ljm.33.1695239611281; 
 Wed, 20 Sep 2023 12:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2SewmoQQE7DH5Pzqth5cqA/NiHmCbMQ+cFvVeg7Wr0pjmaT+AV1yO/PxdyDUfNlARxIirZw==
X-Received: by 2002:a2e:b179:0:b0:2bd:19c5:3950 with SMTP id
 a25-20020a2eb179000000b002bd19c53950mr2909805ljm.33.1695239610904; 
 Wed, 20 Sep 2023 12:53:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a17090655cf00b00997d7aa59fasm10032008ejp.14.2023.09.20.12.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 12:53:30 -0700 (PDT)
Message-ID: <2069ba62-98a9-7d89-7bf2-bfade5c140d2@redhat.com>
Date: Wed, 20 Sep 2023 21:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] drm/i915/vlv_dsi: Add quirks for x86 android tablets
 (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230916125455.237325-1-hdegoede@redhat.com>
 <ZQgDmTO0PxvO0lhX@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZQgDmTO0PxvO0lhX@intel.com>
X-Mimecast-Spam-Score: 0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On 9/18/23 10:00, Ville Syrjälä wrote:
> On Sat, Sep 16, 2023 at 02:54:51PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Some vlv/chv tablets ship with Android as factory OS. The factory OS
>> BSP style kernel on these tablets does not use the normal x86 hw
>> autodetection instead it hardcodes a whole bunch of things including
>> using panel drivers instead of relying on VBT MIPI sequences to
>> turn the panel/backlight on/off.
>>
>> The normal i915 driver (which does not use panel drivers) mostly works
>> since the VBT still needs to contain valid info for the GOP, but because
>> of the Android kernel relying on panel drivers with various things
>> hardcoded some DMI quirks are necessary to fix some issues on these
>> devices.
>>
>> Some of these issues also are related to which I2C bus to use for
>> MIPI sequence elements which do I2C transfers. This series also
>> includes a patch adding some extra debugging to mipi_exec_i2c() to
>> help with debugging similar issues in the future.
>>
>> These patches have been posted before but back then I did not get around
>> to follow up on the series:
>> https://lore.kernel.org/intel-gfx/20220225214934.383168-1-hdegoede@redhat.com/
>>
>> Changes compared to this old version:
>> - Drop the changes how the I2C bus number is found, instead just have
>>   the quirks set the right number directly where necessary. This should
>>   avoid any chances of causing regressions on devices where the quirks
>>   do not apply.
>>
>> - New quirk for backlight control issues on Lenovo Yoga Tab 3
>>
>> - Address Jani Nikula's remark about __func__ being redundant when using
>>   drm_dbg_kms()
>>
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>> Hans de Goede (4):
>>   drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS on
>>     Asus TF103C (v2)
>>   drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size on
>>     Lenovo Yoga Tablet 2 series (v2)
>>   drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo
>>     Yoga Tab 3
> 
> Please file a bug for each of these and attach the usual drm.debug=0xe
> dmesg + VBT + any other relevant information there. Otherwise a few
> years from now I'll be cursing at these commits as well for not leaving
> a decent papertrail...

Ok. I've just completed filing 3 issues (1 per affected model) and
I've added Closes: tags to the patches pointing to the issues.

I'll send out a v3 of this series with the Closes tags.

Regards,

Hans



> 
>>   drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)
>>
>>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c |   3 +
>>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 124 +++++++++++++++++++
>>  2 files changed, 127 insertions(+)
>>
>> -- 
>> 2.41.0
> 

