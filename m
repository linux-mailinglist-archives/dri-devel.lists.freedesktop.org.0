Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD15263C3
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 16:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E8610E2A2;
	Fri, 13 May 2022 14:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8789310E2A2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652451532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKm87Mcsz1gRjO/vgZI8bsojccP3AyaeyvUiZ4EPS6U=;
 b=NaPTDyDmPtdQw+ZvPmyxqrDIm41jj/ybuEg7xYQBHfP1NNS+n8Kl/HhAJsdlOzYY208G3R
 ZtZRRb44kHRbwVDrD2bRT2uwnb4/RqPOe6ffSzUan7e/v1UAHqDhhFlLT1olTq5oEXKTgh
 q17ju1/hbuQCVtVg4kg7V0FR5y0qKLs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-bZo8yxFUPm6RXRJknzKIpw-1; Fri, 13 May 2022 10:18:51 -0400
X-MC-Unique: bZo8yxFUPm6RXRJknzKIpw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r30-20020a50d69e000000b00425e1e97671so5024052edi.18
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 07:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KKm87Mcsz1gRjO/vgZI8bsojccP3AyaeyvUiZ4EPS6U=;
 b=NF/GXFcj5Ut8D7BUrpie2UazxVf1MoRDlJbKlnRsoX/9tqlGvB9A2xDpMyWFoxgfrL
 sQphWdrx6LnSrkS6Z3t0HChDAFqWAz/GXnJI40HVMok2PPuCXAHjn1fc2GHhNW73YwtC
 fUvFAP9WXVQo4bFIivlnMNDESGQZFg+h4h8gt5hXHR658W3cIwKIixQe+sYaaB9Snh4+
 kJ08XQ3IwFvJ4A72rPrBQBmoQ0FPM8a/UpvILL8K09ejRJmQOpCR9F//q+Tv3gPQqWPR
 j/Y/ct1eR0iU4UP4dwQG3w0umUaHyAwUE2jH3vlI25kOr2WO5JA6AiYtt6zEaX9rnEMw
 JW5Q==
X-Gm-Message-State: AOAM532llZyFqqgMhxx0sKCUR9dVmI7f6q0+X1tBiF0z37M3sXe3V7JV
 ZE0LcjGMVkNCNeYyYSjjp81h5JHo+l/jkLo+8c21jfDXx7hlRh2dyxX+zeEuOVp8Q/qiymLJT3x
 HVG1IesVc/n4oaThYzThUj9VuRZxF
X-Received: by 2002:a17:907:d16:b0:6f8:c054:29ac with SMTP id
 gn22-20020a1709070d1600b006f8c05429acmr4532693ejc.96.1652451529835; 
 Fri, 13 May 2022 07:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrUSMXO2fDIPmGqra6Xu0EadF2/1IplfDFLyJlG8rz7sF1/W8xaIsfgbc0SbjIodh22xdlCQ==
X-Received: by 2002:a17:907:d16:b0:6f8:c054:29ac with SMTP id
 gn22-20020a1709070d1600b006f8c05429acmr4532672ejc.96.1652451529568; 
 Fri, 13 May 2022 07:18:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6?
 (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a056402525400b0042617ba63ccsm1034617edd.86.2022.05.13.07.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:18:49 -0700 (PDT)
Message-ID: <0ee6bbce-f652-507c-902d-aa483f4880b5@redhat.com>
Date: Fri, 13 May 2022 16:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
To: Zack Rusin <zackr@vmware.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20220509110425.165537-1-hdegoede@redhat.com>
 <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
 <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
 <f460b87a-a53c-0570-9c87-9997519ebb97@redhat.com>
 <8719f148-7e28-c5a6-08c4-3fbb28138b1c@leemhuis.info>
 <D060DAC5-4F3A-4268-8E20-24A56DF3AAB1@vmware.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <D060DAC5-4F3A-4268-8E20-24A56DF3AAB1@vmware.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/13/22 15:25, Zack Rusin wrote:
> 
> 
>> On May 13, 2022, at 3:43 AM, Thorsten Leemhuis <regressions@leemhuis.info <mailto:regressions@leemhuis.info>> wrote:
>>
>> CCing airlied
>>
>> On 09.05.22 14:02, Javier Martinez Canillas wrote:
>>> On 5/9/22 13:55, Hans de Goede wrote:
>>> [snip]
>>>>>>
>>>>>> Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
>>>>>> BugLink: https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=LSQP%2Bqnf4p51QsF%2B7ZkvKlB5gSx0%2FgRUsgcIPChR33g%3D&amp;reserved=0 <https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=LSQP%2Bqnf4p51QsF%2B7ZkvKlB5gSx0%2FgRUsgcIPChR33g%3D&amp;reserved=0>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>>>>>> ---
>>>>>
>>>>> Zack fixed this already:
>>>>>
>>>>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D5405d25b9e8e6&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=IMtLj94VBo3Bv8oCGmbatBmT%2F2%2B9xkIptnlPTPuHMHc%3D&amp;reserved=0 <https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D5405d25b9e8e6&amp;data=05%7C01%7Czackr%40vmware.com%7Ca34647a1351748917ad608da34b459a0%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637880246471436744%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=IMtLj94VBo3Bv8oCGmbatBmT%2F2%2B9xkIptnlPTPuHMHc%3D&amp;reserved=0>
>>>>
>>>> I see, but it seems that this was never pushed to drm-misc-fixes,
>>>> so this is still broken in 5.18-rc#
>>>
>>> Indeed. Agreed that should be cherry-picked in -fixes as well.
>>
>> Looks to me like nobody did that and this regression fix is missing in
> 
> No, it has been done. It’s after rc6 so the patch is in drm-misc-next-fixes you can see it at:
> https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vmwgfx?h=drm-misc-next-fixes&id=5405d25b9e8e6e0d3bdb04833d528a9bb35fe7ce <https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vmwgfx?h=drm-misc-next-fixes&id=5405d25b9e8e6e0d3bdb04833d528a9bb35fe7ce>

Erm, the after rc6 rule is for fixes for the next cycle, if we want to
get this in this cycle (which IMHO we want) it should have been in
drm-misc-fixes before the PR which was send to Linus today.

At this point in the cycle the best thing is probably to just
send it directly to Linus. That or wait till 5.19, but it seems
that for some reason (likely changes elsewhere changing the stack)
this long standing bugs is hit 100% with 5.18, where as before
we seemed to be lucky and not hit it.

Regards,

Hans



