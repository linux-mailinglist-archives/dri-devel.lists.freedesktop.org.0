Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660742A4474
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721CD6E42D;
	Tue,  3 Nov 2020 11:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8E66E42D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604403933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMEk5KybsEicr3pj8UA3LfHVdNabv0XMBbykNpFrfjQ=;
 b=BPNSGhHBOAozdNi4R5F+hjibygfsILE3r0JLdnQfkeeglfc5jpd519w2o6ZcvdKUA34eCz
 NyfPOIzJBBpXhcng01bdwpXQWsixariCqJq9nVymKYMYdLx6uxV0XhDUlIhZkgWP/IZMmv
 2A0gCZ/jxu/FEFNhupQ1S7C5Pv/nT5E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-W7d3-Ar3PMu39i0WdkPF3Q-1; Tue, 03 Nov 2020 06:45:32 -0500
X-MC-Unique: W7d3-Ar3PMu39i0WdkPF3Q-1
Received: by mail-ej1-f72.google.com with SMTP id z25so5342273ejd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 03:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QMEk5KybsEicr3pj8UA3LfHVdNabv0XMBbykNpFrfjQ=;
 b=XOTahvjDlbWPBLrw3lOHshVDU+98N0tJpnBM3i4CZE0rdunHpqn3IFrOJyWWo1hLqj
 8KlvRJ1KMtLm9gqNTkNswf27OMHR1YApMlQsQDxLiMN7KniBWsJ2UU44OVIE0JBQ6YYn
 BLuew857YSx9iMyfVDONK/ZUGXPJwpeANdUZpeIv5YyM9R4t1asTYejTtMEQS3FoVP/2
 5e+BRJSDRsqa0Jsh4kDWd3tfQMDqre4B9cKsmMOQeOAUColcYfvzZKXaTAoPGP+j0+pg
 Xy32dUIvCCvuGASSMfxv0XyypQRkpCrnwDQDVY0ha8JFrq4+YBEFSDBnJgEbHBi76ZQX
 sAQw==
X-Gm-Message-State: AOAM530/JWK2WvYw64QsVxwDIXCEEv4ejhVFyBpNpc1Unxv3U1VjHm8R
 WwwIjQQ/Z4yVukGrqOf4FwBqOcqEroAfuDHwnIXKsqmgYjgiCYV+9IqZnHpz/sskerSl6hnEbdV
 ZruVw7M7Kls+3NdBSuetFfWyOd1pq
X-Received: by 2002:a17:906:1317:: with SMTP id
 w23mr12872747ejb.120.1604403930642; 
 Tue, 03 Nov 2020 03:45:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG5fNGItygKoV6istNsExg4eLpVuqcB501T1iBEvd2D9rmPfy7v482q/odToeq3PtXjTqspA==
X-Received: by 2002:a17:906:1317:: with SMTP id
 w23mr12872739ejb.120.1604403930459; 
 Tue, 03 Nov 2020 03:45:30 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
 by smtp.gmail.com with ESMTPSA id y12sm11800370ede.82.2020.11.03.03.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 03:45:29 -0800 (PST)
Subject: Re: [PATCH v2 0/3] drm: Store USB device in struct drm_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201103103656.17768-1-tzimmermann@suse.de>
 <635668cb-089b-9d56-7866-d28de61bce32@redhat.com>
 <fc86b5dc-d853-8514-bd94-496a19b85bde@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ee77ed6d-19c4-3ca5-e3b4-f37f42b6ee75@redhat.com>
Date: Tue, 3 Nov 2020 12:45:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <fc86b5dc-d853-8514-bd94-496a19b85bde@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/3/20 12:30 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.11.20 um 12:09 schrieb Hans de Goede:
>> Hi,
>>
>> On 11/3/20 11:36 AM, Thomas Zimmermann wrote:
>>> The drivers gm12u320 and udl operate on USB devices. They leave the PCI
>>> device in struct drm_device empty and store the USB device in their own
>>> driver structure. It's expected that DRM core and helpers only touch the
>>> PCI-device field for actual PCI devices.
>>>
>>> Fix this special case by upcasting struct drm_device.dev to the USB
>>> device. The drivers' udev variables are being removed.
>>>
>>> v2:
>>> 	* upcast USB device from struct drm_device.dev (Daniel)
>>>
>>> Thomas Zimmermann (3):
>>>   drm: Add USB helpers
>>>   drm/tiny/gm12u320: Retrieve USB device from struct drm_device.dev
>>>   drm/udl: Retrieve USB device from struct drm_device.dev
>>
>> Thanks.
>>
>> The entire series looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks!
> 
>>
>> Note you may want to wait with pushing this to drm-misc until the
>> first patch gets at least one other review.
> 
> Following Daniel's request, I'll drop the first patch and put the helper
> into the drivers.

Ok, that works for me.

>> Or at least give others some time to possibly react :)
> 
> Sure, I'll merge it later this week.

My remark was mostly to give Daniel time to react...

BTW I missed Daniel's reaction again. Now I have figured out why
though for some reason RH's email system is marking Daniels
mails as spam, so they were in my spam folder ?

Regards,

Hans




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
