Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAF2BAEDF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 16:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360256E8C9;
	Fri, 20 Nov 2020 15:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB2A6E8C9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 15:33:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id q3so9913820edr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 07:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hu7c85Nnad/NCLFvwvmPMVk5vXB6RmH3f8h9eUOgl90=;
 b=BzmaIsz1H6BVAIbAH9IvLryH4vb8O/6UhSCRnp06XFQRDmxv8tRES8boF0UNRfcvJa
 FOQYceZ7HDFXHFQt5NrioQms4xLE57+3p5wE8nI+1qbLkHTEjG4ILQgPTJWQSryLN+vP
 Y7p77Sp5LGtKgdkXehar1Xf7r6Oxn40NWIGwTXFu4MREQ/+EBEZlXO6IKlRBR8u2NFct
 hfqT1x/qHOUJOp7jOZ28M/5kQ5lHwKvKlPEqugKopuo3E9Ea29B+MHZa9k5/bzlFuZw4
 cpV4WZ45p3JYrZOyq1l3kvJzajpgqZj+rHeJ+LT3hADUtWTfh021alrkCxAb6xX7zsAw
 XUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hu7c85Nnad/NCLFvwvmPMVk5vXB6RmH3f8h9eUOgl90=;
 b=NobHqtujJfdbdEUVtC7agO4XsHhkPxPlfvdv65ZSz6uHEUQvk5unWTyUgFYPle3aCD
 o1ZHgpl3zCVNADSubm7kWcOVDfp84Ua+vXvBya2Bds6zU/T+GnV/ODoXRjpBHWL+gikW
 G0y4rjhK9Z24xveW9zQBwKbVF4i0aN/iJpJ6Lk2Kod/T9uRE4T6eJf2RCdU9ghpaset8
 uEMQYDC54rdvYSj1QYYLzEuvGnfh08GSzJOXznVEaWbO46VttP7mcqZuf52P+qdw+gis
 H9NWiCWXuuCP2WLRmJjGKNOu2qsB/6mBdRw2+TUFEXL9dN9Z3HUHTFERAliEEfaByiCg
 nYeg==
X-Gm-Message-State: AOAM532LeS97O4oNiWulS9TjrRaCmM6SJVUhPjz5kQu4/azJE5NWFtlf
 QzsbKae1VWqxAqCdcnoW8CA=
X-Google-Smtp-Source: ABdhPJw731OYdrhHa2qWzQq4JOlXbH+fA7iL3hkHPnFGLmtrlwCQKxKF56MlTknU1rfyVnD6hVXqLg==
X-Received: by 2002:a50:e443:: with SMTP id e3mr37089342edm.160.1605886426571; 
 Fri, 20 Nov 2020 07:33:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id a10sm1235482edn.77.2020.11.20.07.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:33:45 -0800 (PST)
Subject: Re: [PATCH v6 16/17] RFC: kvm: pass kvm argument to follow_pfn
 callsites
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-17-daniel.vetter@ffwll.ch>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cd56eb8a-fbec-e81f-9c14-d1256a193b68@redhat.com>
Date: Fri, 20 Nov 2020 16:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119144146.1045202-17-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/11/20 15:41, Daniel Vetter wrote:
> Both Christoph Hellwig and Jason Gunthorpe suggested that usage of
> follow_pfn by modules should be locked down more. To do so callers
> need to be able to pass the mmu_notifier subscription corresponding
> to the mm_struct to follow_pfn().
> 
> This patch does the rote work of doing that in the kvm subsystem. In
> most places this is solved by passing struct kvm * down the call
> stacks as an additional parameter, since that contains the
> mmu_notifier.
> 
> Compile tested on all affected arch.

It's a bit of a pity, it's making an API more complex (the point of 
gfn_to_pfn_memslot vs gfn_to_pfn is exactly that you don't need a 
"struct kvm*" and it's clear that you've already done the lookup into 
that struct kvm.

But it's not a big deal, and the rationale at least makes sense.  So,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
