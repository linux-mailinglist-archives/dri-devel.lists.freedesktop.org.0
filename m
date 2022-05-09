Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47EF51FAA4
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9FA10EBAE;
	Mon,  9 May 2022 10:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83AA10EBAE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652093830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFrPs9L4di1vV1xZJqP9rzxBR1+UAeDEbQHD/bxvJ7Y=;
 b=ObuCyNTC1Jw6TAQmSRNElFuZyUzNyh7ou6KjRhrpG8ErsnOkD9nL8J9zlrNH3vCukYoIB8
 88m5uH4gvT+AOn+RsRxZWq0QfCODuxHEn4N0RWDo9D7LPK6NunT3tJiveT4atCWNz1YYLe
 oObHYty1YwQsOq4755649oNzaradNOA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-UljU4N10OtWNHy1mWoozxw-1; Mon, 09 May 2022 06:57:10 -0400
X-MC-Unique: UljU4N10OtWNHy1mWoozxw-1
Received: by mail-ed1-f72.google.com with SMTP id
 a19-20020aa7d913000000b004284eecb34aso5455053edr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 03:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EFrPs9L4di1vV1xZJqP9rzxBR1+UAeDEbQHD/bxvJ7Y=;
 b=2f7LEuSkQcO99/tCl4mkTb1UB7mWwR6naM8/wzxtjjiDojxaxBAGY+6WO+koAQmLNS
 PYpAVu2aSXfLPqa/VaoUgQfJB1aSuv/KKZUMms93L4ABDSbeV4Mt5jhR8x2+Kju+Dp8D
 JtPzStSS/0oF9JiGOBKClmLac2wSBIapmcSU+OPKi9z6nx1gdXt+QTyEI5JXlvFFr5PN
 iCT1IpJYbh6wmct8y1yNCdtEiNTLZj02RsZO53gEZeZpRkuZ9ZE4swmu2xgu++LfjYCw
 m2c5IAJzRhewrpQiUjYxVhbkwx/j5McDSUlOYzPK1slc/WYFEibOadbHod51+IMba6XI
 FCVw==
X-Gm-Message-State: AOAM533OqlwiC/LvqK8iOn3na+GJt7Kj+UWBtYKUgy9EmsTb4WSz4egh
 ylin0hbZm7Gc4z3BE2MyZPPWyHR1m5oNxbzoCJRY3GpbW+FPZz3XWW3zsPf8vq2k87znLA0CfAJ
 K+9b4TZC9TP6QOoPwtkmW1e71Hmcf
X-Received: by 2002:a17:907:7da7:b0:6f4:f92b:3986 with SMTP id
 oz39-20020a1709077da700b006f4f92b3986mr13581738ejc.50.1652093828682; 
 Mon, 09 May 2022 03:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR2LyN1sGr/ku45VLAMUVTF9Djf8FtshH8TyrOMtMCisUpjWy4B6l9l3wolcFcqotZ7FxfuQ==
X-Received: by 2002:a17:907:7da7:b0:6f4:f92b:3986 with SMTP id
 oz39-20020a1709077da700b006f4f92b3986mr13581728ejc.50.1652093828504; 
 Mon, 09 May 2022 03:57:08 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d904000000b0042617ba6385sm6150956edr.15.2022.05.09.03.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 03:57:08 -0700 (PDT)
Message-ID: <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
Date: Mon, 9 May 2022 12:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

Hi Zack,

On 4/11/22 16:24, Zack Rusin wrote:
> On Mon, 2022-04-11 at 10:52 +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Fedora has received a bug report here:
>>
>> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2072556&amp;data=04%7C01%7Czackr%40vmware.com%7C3664ddfe25334b16109108da1b98a6af%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637852639719382480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GpkMy6OuPW06f%2Fzj%2FBGzoq8xT8pNsE6KtH0MTvN5FoA%3D&amp;reserved=0
>>
>> That Fedora rawhide VMs no longer boot under the VirtualBox
>> hypervisor
>> after the VM has been updated to a 5.18-rc# kernel.
>>
>> Switching the emulated GPU from vmwaregfx to VirtualBoxSVGA fixes
>> this, so this seems to be a vmwgfx driver regression.
>>
>> Note I've not investigated/reproduced this myself due to -ENOTIME.
> 
> Thanks for letting us know. Unfortunately we do not support vmwgfx on
> VirtualBox. I'd be happy to review patches related to this, but it's
> very unlikely we'd have to time to look at this ourselves.

I somewhat understand where you are coming from, but this is not
how the kernels "no regressions" policy works. For the end user
a regression is a regression and as maintainers we are supposed
to make sure any regressions noticed are fixed before a new
kernel hits end user's systems.

At a minimum it would have been good if you had tried to at least
reproduce this bug by installing Fedora rawhide inside an actual
vmware VM. I've just spend a couple of hours debugging this and
the bug definitely impacts vmware VMs too; and thus very likely
also reproduces there.

I've a patch fixing this, which I will send out right after this
email.

Regards,

Hans


