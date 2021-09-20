Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E836F4110D3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C796E418;
	Mon, 20 Sep 2021 08:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4066E418
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632125924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9hrk8C5FhsHt5Uf0cc3rsa2fa6Qte6s+4CwcCsttTk=;
 b=YWwREArf6izDDDNGLhv5MKVlnz/4CT9i5pAw1XLUM0dZugjf12lPhNDs0Am1fLivHhqqCX
 Myp4uYg4JsNDU+uZqsGn4nhy9ixysWAPUobd3HtIRbbLfFERDVn/CJsyzGtxRFRRlzpYIu
 P/PN7an7KEfjErnI6gd7ZAVIqrnDml4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-hvFEf4uoPrOXn_tpgPaDqA-1; Mon, 20 Sep 2021 04:18:41 -0400
X-MC-Unique: hvFEf4uoPrOXn_tpgPaDqA-1
Received: by mail-ed1-f69.google.com with SMTP id
 j6-20020aa7de86000000b003d4ddaf2bf9so14881649edv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 01:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M9hrk8C5FhsHt5Uf0cc3rsa2fa6Qte6s+4CwcCsttTk=;
 b=u+OGrGfowsoOf94Tx01pbRKL60LxlTuHFRVGVydF5W4R33SIFkQcjunKZUA8h+CMPx
 OHGt0Bx5CGk86RbioxJsjQ/WBff9l/opVHIQ3Hqk8Vdm7Q7YyFWaVLq25lQEazg4jj1j
 aXwR+X1lWUkyh10VIpKqfClEubOYeLiSXYf+Rw+8A3e8UUX7855Bo7jm2tLJXQ3nxQkO
 Jsy7RYYgi101Zu3rT4D+N2ZUd17AmeMbFm2bkK2nWJAh7l6pgrKKhu/eaPqA+je6poAn
 eRZIsBN/W6L3U/W0xYoWb5A2kBPFDzBJAWHwfTrit9cVHJtxwU4e+LhW4lV5UCA2J35Y
 0K/g==
X-Gm-Message-State: AOAM530tB0A8vGfN66dKSuJcGh46HpCW/ota6QAO+av4b44J1DvbIfwz
 CDCIF/QNZq1FXsxpn228ZoF83s+z7AIQoMbS+x4UMWdhQ5N+H3W1/BquuEEDNopgUoaMlZLtzsa
 522YFY3xahmoFfWB2E1AWGPe/ya/A
X-Received: by 2002:a17:906:2f10:: with SMTP id
 v16mr5399831eji.434.1632125920441; 
 Mon, 20 Sep 2021 01:18:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlErPDM1q4odTH/S6aensyrOxrk/2YSOq07b4Qv9xcGbmhn4P5ePtx1PcicybeKegkqz7TKA==
X-Received: by 2002:a17:906:2f10:: with SMTP id
 v16mr5399821eji.434.1632125920274; 
 Mon, 20 Sep 2021 01:18:40 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
 by smtp.gmail.com with ESMTPSA id dj8sm6694564edb.53.2021.09.20.01.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 01:18:39 -0700 (PDT)
Subject: Re: [PATCH 0/5] lib: devres: Add managed helpers for write-combine
 setup
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, marcan@marcan.st, maz@kernel.org,
 akpm@linux-foundation.org, npiggin@gmail.com, thunder.leizhen@huawei.com,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210916181601.9146-1-tzimmermann@suse.de>
 <9e5e73d1-bb7b-055f-8c48-a877a2e9c0fd@redhat.com>
 <70962c8d-ba1a-8c68-b509-393b6a2ecdca@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d465f057-cb5e-4913-fdce-41d4c1ed99ca@redhat.com>
Date: Mon, 20 Sep 2021 10:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <70962c8d-ba1a-8c68-b509-393b6a2ecdca@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 9/20/21 10:01 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.09.21 um 16:47 schrieb Hans de Goede:
>> Hi,
>>
>> On 9/16/21 8:15 PM, Thomas Zimmermann wrote:
>>> Add devm_arch_phys_wc_add() and devm_arch_io_reserve_memtype_wc() for
>>> automatic cleanup of writecombine setup.
>>>
>>> Several DRM drivers use the non-managed functions for setting their
>>> framebuffer memory to write-combine access. Convert ast, mgag200 and
>>> vboxvideo. Remove rsp clean-up code form drivers.
>>>
>>> Tested on mgag200 hardware.
>>>
>>> Thomas Zimmermann (5):
>>>    lib: devres: Add managed arch_phys_wc_add()
>>>    lib: devres: Add managed arch_io_reserve_memtype_wc()
>>>    drm/ast: Use managed interfaces for framebuffer write combining
>>>    drm/mgag200: Use managed interfaces for framebuffer write combining
>>>    drm/vboxvideo: Use managed interfaces for framebuffer write combining
>>
>> Thanks, the entire series looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> For the series.
> 
> Thanks. Let me know if I can review some DRM code for you, as Daniel suggested.

Thank you for the offer, ATM I don't have anything queued up in need of review,
but I will probably make use of your offer in the future :)
Regards,

Hans

