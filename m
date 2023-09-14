Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2417A0652
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46E110E12C;
	Thu, 14 Sep 2023 13:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6456710E12C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694699031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7g/3uMhl9MZDE/ThW7epr+QQ++XKktE4v6z5BQlLBX0=;
 b=Ywgb9CRfUC4AfovCXURIzTGAzL+xRPyQMO6CGHnPhAIAHDao49yheFzVVuQytWf55SDzMr
 JW6CijpIZZxX7SAEs1BbSOqZjfotX6Z8QqcwL5abcvlnnzm4i873PyTXZm38cWUqvvNp3G
 HorRXg92QrQj3lzfiiDJxjmN/6LJV0s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-aV7U56fKN9qIFF566K-zzA-1; Thu, 14 Sep 2023 09:43:48 -0400
X-MC-Unique: aV7U56fKN9qIFF566K-zzA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so592391f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 06:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694699027; x=1695303827;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7g/3uMhl9MZDE/ThW7epr+QQ++XKktE4v6z5BQlLBX0=;
 b=rddLss8xABbq5zhWV79MKKNqIqYhLF8+6WNDbH5LxBtClm5rRdl59W5TfCpmt1CIci
 JQtBNMGdOHv4X6XXAH+395n2e8Wgn/f3vitAbW/IYNJyBS+9fZZWntR8nzFV2VIjKASO
 KsAuw0qUUYq7Q9lRDZHpBHeWP0x3CCtLuDz5Q7ucTmeoyVx4KT6OMTIH8Jf3l/jP7mFg
 c9So0QSNlVr/bGlsOmohX6MHhZB3PQnIPsUAgzKGjiM4KFaFg7I+wjreNBnJghcVwkgy
 rwK5/EmJLt5Si9TIRvmQX+0vpP71fq8pwn4y2PchyCHeJRhc0iN5MyHk3MRzoxIZ+Wo4
 hk2A==
X-Gm-Message-State: AOJu0Yy5EReEdAmtX/WbIva2waNh5NGvYwJW+UsUg+rPchohm+rXpyv/
 3AsJq4hkIo5l1h22yPtvWPIE+ps1F8WJHOdpQ8Kp7hp9uSzq44gOjsEmW0OzEvSqdXag1AerzlD
 GIiqpVo8icKP55c1RnbNvNUvxk/jB
X-Received: by 2002:a5d:5489:0:b0:317:3a18:df26 with SMTP id
 h9-20020a5d5489000000b003173a18df26mr4798220wrv.39.1694699026759; 
 Thu, 14 Sep 2023 06:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl3gx0f8m6ucbY2oUSgYxRo2mV5lZMn5wTHlPG74xgWBAx8MD0rSNrk9s8t7gMoNBNYNBF3g==
X-Received: by 2002:a5d:5489:0:b0:317:3a18:df26 with SMTP id
 h9-20020a5d5489000000b003173a18df26mr4798199wrv.39.1694699026303; 
 Thu, 14 Sep 2023 06:43:46 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 r4-20020adfdc84000000b0031753073abcsm1810179wrj.36.2023.09.14.06.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 06:43:45 -0700 (PDT)
Message-ID: <d7b8d777-d97e-6465-01e7-9702efafab43@redhat.com>
Date: Thu, 14 Sep 2023 15:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
To: Jason Gunthorpe <jgg@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
 <ZOeh4x58eGel7WwI@nvidia.com>
 <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
 <ZOjlBGcj2VMP+ptd@nvidia.com>
 <IA0PR11MB71857A044B51DBEBD7D131F7F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB7185D5451D4DFBDFD4C258E6F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZO98rj4y0TA4+CfO@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZO98rj4y0TA4+CfO@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> I think it makes sense to have a generic (non-GUP) version of
>> check_and_migrate_movable_pages() available in migration.h that
>> drivers can use to ensure that they don't break memory hotunplug
>> accidentally.
> 
> Definately not.
> 
> Either use the VMA and pin_user_pages(), or implement
> pin_user_pages_fd() in core code.
> 
> Do not open code something wonky in drivers.

Agreed. pin_user_pages_fd() might become relevant in the context of 
vfio/mdev + KVM gmem -- don't mmap guest memory but instead provide it 
via a special memfd to the kernel.

So there might be value in having such a core infrastructure.

-- 
Cheers,

David / dhildenb

