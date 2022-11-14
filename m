Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40F627A9A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 11:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD7D89664;
	Mon, 14 Nov 2022 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CB289664
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668422161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24zRJBMMX5r7D0TfP9H8IpSMNGkPGaDlufPYAnb9o3c=;
 b=I8O2Ni5fm5YhkBFZyMitiZmoyGg10HLrXJXSI8Tx28JMkOoc/JzGIB3TKLk/0UdisINQsn
 V2OBBMJsgQ12XsV9ZueiVKniYSbGRgwx6bBSG+lV5FQF+2kI+vni0sBE5WdOi7lTERnmaZ
 rXHWq3CrqgGySvqiP/We7Y5K8rZXCpA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-JlJr_H-mOM685RPv8-laSw-1; Mon, 14 Nov 2022 05:35:59 -0500
X-MC-Unique: JlJr_H-mOM685RPv8-laSw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf25-20020a1709077f1900b0078c02a23da3so5142109ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 02:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=24zRJBMMX5r7D0TfP9H8IpSMNGkPGaDlufPYAnb9o3c=;
 b=KhAIYy0rrqDmO7tu1DbmYFo+RjAgIAz/9iNGVChlgnnPb52Ts06GgA4Ln9vC+QcRXF
 cz+bo70VecsWft4vplsTSHRZZQg900whOTOK28XKPDP1LVIJJK12cOa9AMa058oIvGEV
 jfNQH+PkE1ingVrBikdFWBeVWL5cb2YuEyykf3UFQgvsik9aV3LANz3x3CSXDyzbsU3B
 MEJNC939HywJ6RQdfUjpZeuz0ilMU+lshniTc65DzTWVXSDppE+9AjtB5M5Wuj9K6sHP
 bQnLlCTfWiDuylJLeh0LRdsJVIe7AfiHjq9c/fzpyOuRjymW55ZgMukgl8GHQAUq2NpK
 XXWA==
X-Gm-Message-State: ANoB5plkm0Zszon5J2USDC9ctHSfLNTQVLxz+kzocQ+KAxv32HqHAMN4
 X7K6J9VQ4UneacLea0x16RCJagp7NDUmLfILdA8ASJbANhIqGrMZDkdv/LjEv50Vv4Sq9ryTeK/
 x9AFVWEjQjsp+chZhj354woqyVVmh
X-Received: by 2002:a05:6402:519:b0:467:6847:1ea7 with SMTP id
 m25-20020a056402051900b0046768471ea7mr9673847edv.237.1668422158719; 
 Mon, 14 Nov 2022 02:35:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ICCUSIbjUZ6xW1wwVWfNHWXpBEQHv6D03VDE1/OpgXEDSGOrXtsDchrX5iVx343T8ZpJuMQ==
X-Received: by 2002:a05:6402:519:b0:467:6847:1ea7 with SMTP id
 m25-20020a056402051900b0046768471ea7mr9673827edv.237.1668422158530; 
 Mon, 14 Nov 2022 02:35:58 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b00457b5ba968csm4581792edb.27.2022.11.14.02.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 02:35:57 -0800 (PST)
Message-ID: <57f57c29-cf48-67c1-b6b3-0e50e7105031@redhat.com>
Date: Mon, 14 Nov 2022 11:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221114102327.6d53341e@canb.auug.org.au>
 <33ef1207-aad7-b7cd-61ac-327e9afb0699@redhat.com> <87cz9p4zj6.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87cz9p4zj6.fsf@intel.com>
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/14/22 11:10, Jani Nikula wrote:
> On Mon, 14 Nov 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 11/14/22 00:23, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the drm-intel tree got a conflict in:
>>>
>>>   drivers/gpu/drm/i915/display/intel_backlight.c
>>>
>>> between commit:
>>>
>>>   b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>>>
>>> from Linus' tree and commit:
>>>
>>>   801543b2593b ("drm/i915: stop including i915_irq.h from i915_trace.h")
>>>
>>> from the drm-intel tree.
>>
>> This is weird, because the:
>>
>>    b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>>
>> commit is in 6.1-rc1, so there can only be a conflict it 6.1-rc1 has not
>> been back-merged into drm-intel yet ?
> 
> That's the reason it *is* a conflict, right?

Right what I was trying to say is that I am surprised that 6.1-rc1 has not
been back-merged into drm-intel yet even though it has been released
4 weeks ago.

I thought it was more or less standard process to backmerge rc1 soon after
it is released ?

Regards,

Hans

