Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004773796DB
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2BC89D7B;
	Mon, 10 May 2021 18:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FF589D7B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 18:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620670419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Wf8f/F8o0r8V5l27inB82r07nwwlRw1f5EgRtSutt0=;
 b=PnkeUI62fNoGO46GR+exSxmwS817viaH7l+v8sdwQCU5s9IuGEUG0hGGJnpgWwm+YMGJ06
 48Ex1hZR+xpOoSMAMiQN5Eg4NeLYiWMonp7GMRExtsLXITZjpVTc//AqYaTo3DYvXKU28l
 qX8Z1osJlo6iOROTHGWZXCjWiShPEig=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Je63-kSpP120cgPKL5RKlw-1; Mon, 10 May 2021 14:13:34 -0400
X-MC-Unique: Je63-kSpP120cgPKL5RKlw-1
Received: by mail-wr1-f72.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso7784383wrk.14
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 11:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Wf8f/F8o0r8V5l27inB82r07nwwlRw1f5EgRtSutt0=;
 b=cBWkyTYzTIb0MXKRHyTDDQTRyF1tTwbwEOqQITTL2NFRQU30w/Z9bpe2ngH6ur8WN+
 io3igqEQkwEzWsVzmT1itkJw/rKJ/zFVTWKr6BsDxuKVJrZ2BwCPjb5NCRpTIRlhxgN0
 WLreTiHxP/UmAJYDgHilIW71PIMEFWUwFYgnhoyhVC9n1LUAdAmtaN6urE4aHc0fHUia
 ghLFPhE/CSupv6OXIxepkONtuVONvsSpYSnrIV7s8kOVUvZhvGcGaE8g/7PLCCB6qjbX
 KuhCACDa64jlO6oIXh8iernECzSSMr78SdiG9WDaat4HYq4MaB+IPYYtegNvSKec9xC9
 wUHA==
X-Gm-Message-State: AOAM5303qAvh4UTimOKx7gxBR5IKZzYx1vSdmbBZIYTOyKy3B4nc4q7/
 dx8G3ZSCxaiAsJZyJuadAKj7J07/ETwTbr0KxQdmVQEOvZvynC0gIu46XqH76GUv0fvQIsUs36F
 Azd5/qeZBrzMFcHzzaE8n+Rx3dSUQ
X-Received: by 2002:adf:fc11:: with SMTP id i17mr32538499wrr.368.1620670413539; 
 Mon, 10 May 2021 11:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGvjeRTScdahfNDHcrMa8YC+8YvhVA4fNTrW6yB7yOb/uXjCn86kTNe8u7Q2MyqQ4FAIUnCg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr32538485wrr.368.1620670413383; 
 Mon, 10 May 2021 11:13:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j7sm20597281wmi.21.2021.05.10.11.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 11:13:32 -0700 (PDT)
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To: Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
 <20210510153412.GG2047089@ziepe.ca> <YJlz+p787mK8tAh+@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dcdc8bea-ebe8-bbcb-b581-309d9acf1657@redhat.com>
Date: Mon, 10 May 2021 20:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJlz+p787mK8tAh+@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/21 19:57, Sean Christopherson wrote:
> +Paolo
> 
> On Mon, May 10, 2021, Jason Gunthorpe wrote:
>> On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:
>>
>>> yeah vfio is still broken for the case I care about. I think there's
>>> also some questions open still about whether kvm really uses
>>> mmu_notifier in all cases correctly,
>>
>> IIRC kvm doesn't either.
> 
> Yep, KVM on x86 has a non-trivial number of flows that don't properly hook into
> the mmu_notifier.  Paolo is working on fixing the problem, but I believe the
> rework won't be ready until 5.14.

Yeah, I like the way it's coming, but I'm at 20-ish patches and counting.

Paolo

