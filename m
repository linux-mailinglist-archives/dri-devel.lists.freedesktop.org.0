Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCD2BAF5D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 16:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D246E8C2;
	Fri, 20 Nov 2020 15:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECBC6E8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605887707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rY2Rec5SHAHV9d9Nn2wvBLT2el7uEj1Kc43gm3aG5HM=;
 b=aDBidmS8ZDezP3V0VyZb4X+LdQps4UpqJwXr2rN3Md8oM5sBsOX+VwFXdnpcj9x7CXWNDM
 ZEaC18zMkfgjuCR8C6HiLYbLAfoRF1qnfTFpO0FqG8/lB2yhQCTR90uBaUGUx19shPpTd6
 QtuAm6GboANfaLr4ztLgltZl+vbdbCI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-Qb66IWJGOe6zH4CeS3Mlxg-1; Fri, 20 Nov 2020 10:55:03 -0500
X-MC-Unique: Qb66IWJGOe6zH4CeS3Mlxg-1
Received: by mail-ed1-f69.google.com with SMTP id i8so3882856edy.21
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 07:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rY2Rec5SHAHV9d9Nn2wvBLT2el7uEj1Kc43gm3aG5HM=;
 b=Vo/LdhcqZSfizutvGL+TjPG3S5FnqWomFBo6wjTL3902FgeSXlZAo4eghro0b0uze5
 AT3+n7RhqpYnuxfg1L60v25444NVP5wXHCyYZZ3E9oiOJh1LNAgFa5kUUxxW+wa0MfPp
 Ivfb2WrLiyDQCsbOHozq0LzfZ7TrvzLPz5nCERZOyq73JK3yP4bsj4O42D60huwneR/3
 pTEGY9BZK/vltUJhqhxHIITFoONgJM+TSOU3u598th8qLxH02uuK4I3G9CmQWPfthDy9
 3jP2d4iW2etqp5lM6HETCf15ZuiYmH11ZafAx8FUpuBQs+HC4C3klW6pW3xUnS9Sk+wn
 Rtww==
X-Gm-Message-State: AOAM533IzDo/3XFn6/dhlCH+lRuOjvMgmcHT8/Cejn+3osbJiV4mivJC
 SQFw2rAW5sfkPAjqdTVXHVRHrewTv/+7Esj1GqFdtqTzM/4MTCJ64ICu5bWrf7dKD07H/h7enn4
 4NQIc498pX8ClNXDusp3iy3fq8JRh
X-Received: by 2002:aa7:d2d9:: with SMTP id k25mr34928696edr.310.1605887702587; 
 Fri, 20 Nov 2020 07:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3gVlgwW/bmEajthpJVdpMUNtgPUbi/HFUtFVuvcpkMu9pSTRR3a9KC3tEdlGleoOWxNajPA==
X-Received: by 2002:aa7:d2d9:: with SMTP id k25mr34928681edr.310.1605887702427; 
 Fri, 20 Nov 2020 07:55:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r25sm1300693eji.8.2020.11.20.07.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:55:01 -0800 (PST)
Subject: Re: [PATCH v6 16/17] RFC: kvm: pass kvm argument to follow_pfn
 callsites
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-17-daniel.vetter@ffwll.ch>
 <cd56eb8a-fbec-e81f-9c14-d1256a193b68@redhat.com>
 <CAKMK7uHDrPDcsWyMgFgjf0+hdebSUT4hX5hKR=CnTH=soLU-Kg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3eca2dde-c78b-3eb4-8f61-7fdf16573419@redhat.com>
Date: Fri, 20 Nov 2020 16:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHDrPDcsWyMgFgjf0+hdebSUT4hX5hKR=CnTH=soLU-Kg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/11/20 16:44, Daniel Vetter wrote:
>> It's a bit of a pity, it's making an API more complex (the point of
>> gfn_to_pfn_memslot vs gfn_to_pfn is exactly that you don't need a
>> "struct kvm*" and it's clear that you've already done the lookup into
>> that struct kvm.
>
> Yeah I noticed that, I think pushing the lookups down should work, but
> that's a fairly large-scale change. I didn't want to do that for the
> RFC since it would distract from the actual change/goal.
> -Daniel

Pushing the lookups down would be worse code and possibly introduce 
TOC/TOU races, so better avoid that.  Your patch is fine. :)

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
