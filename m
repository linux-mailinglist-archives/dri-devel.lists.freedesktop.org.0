Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8662F3B2BAA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538CA6EB45;
	Thu, 24 Jun 2021 09:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716AE6EB42
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624527759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyD4vH5kMZavgg+0al23ybbW1mNcrfB3c+Wxr6kYX38=;
 b=Dg09Q1JBF1FT2yGNlpUzg5ZmMVjnOBAvUUr/3l3rEgNzCEWl6NxXAbpZOaTky7eftJRdKJ
 oLpHNwtWiHd3s5w1WybrIvw/U5xAXkcr7IYk7Yf6x3VaO8BxsZglrteqpEmK2bmTaeJjz8
 YWZIaYY8hOjiyj/sr/s0Lnv4p8Zlgy0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-UcvXtJnmP72q9Y35eXVUEQ-1; Thu, 24 Jun 2021 05:42:38 -0400
X-MC-Unique: UcvXtJnmP72q9Y35eXVUEQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso3057747edd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 02:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyD4vH5kMZavgg+0al23ybbW1mNcrfB3c+Wxr6kYX38=;
 b=TITGJtO9WqUYWnUnifMLoRCXHfdcFA12+b82ooFl0zKnclcyWIbSca9czhfNAkSQDp
 pmQspcBpw/L23optUjkkX5Zeo/R4tCH9EHuoPi5tHwAaaVuwFkzWyG9cU2oe3DAvYdOp
 GrSjHaRwD6FoTFJfFtDz4TpnA31aJFocP9eqvpNfYxWq5EGwmLDZcLQxuAdvsAz5NTvx
 kYUAM9irQd4nlUhNppXZFJ0tfaWoEU44fsPBIxB+QQ66P9sHeuZLylRi4WZUfI7tLUUm
 c68yJtZCOBjIcHk8AOIeUiOe/LKomd3UCblAWo0jIo1jkMvmoDsV02iqoBlMrKqVJymE
 BJUg==
X-Gm-Message-State: AOAM532j+cRlaPyb3+rdJ/EEiiW93UaGYupW6rbNtkfQWoA5mpORBpkR
 RjJun6f3y0ZbEe2NNgKnxf+MINLSAPGFaZOTEgEpNS7XSb56W2iA8fUA8fu5hg3mjerMW53pYjF
 oR3WOHhqFwJzsHgLtmqXvzJq0aF8E
X-Received: by 2002:a05:6402:54c:: with SMTP id
 i12mr5909993edx.64.1624527756959; 
 Thu, 24 Jun 2021 02:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUADYaxbQu5a0ZM6V5UX0tysDgP0Lb+XMxpzsUfVTNQ4yl7MEG7UQrmtC4bLiXvUVljS3Ohw==
X-Received: by 2002:a05:6402:54c:: with SMTP id
 i12mr5909945edx.64.1624527756727; 
 Thu, 24 Jun 2021 02:42:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jz27sm944475ejc.33.2021.06.24.02.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 02:42:35 -0700 (PDT)
Subject: Re: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
To: Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, David Stevens <stevensd@chromium.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-3-stevensd@google.com>
 <1624524331.zsin3qejl9.astroid@bobo.none>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <201b68a7-10ea-d656-0c1e-5511b1f22674@redhat.com>
Date: Thu, 24 Jun 2021 11:42:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624524331.zsin3qejl9.astroid@bobo.none>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 kvm-ppc@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/21 10:52, Nicholas Piggin wrote:
>> For now, wrap all calls to gfn_to_pfn functions in the new helper
>> function. Callers which don't need the page struct will be updated in
>> follow-up patches.
> Hmm. You mean callers that do need the page will be updated? Normally
> if there will be leftover users that don't need the struct page then
> you would go the other way and keep the old call the same, and add a new
> one (gfn_to_pfn_page) just for those that need it.

Needing kvm_pfn_page_unwrap is a sign that something might be buggy, so 
it's a good idea to move the short name to the common case and the ugly 
kvm_pfn_page_unwrap(gfn_to_pfn(...)) for the weird one.  In fact I'm not 
sure there should be any kvm_pfn_page_unwrap in the end.

Paolo

