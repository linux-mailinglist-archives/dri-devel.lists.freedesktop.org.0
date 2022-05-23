Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE827531535
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 19:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AE010E773;
	Mon, 23 May 2022 17:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71910E6EC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 17:19:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d22so13679531plr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VcVFk3FcEgzfyMwYD0aU10qnYcHMUzYlGb8aE1VELAQ=;
 b=sq3P/fw7RUx9aBXoSaVhkvBFulT5vCvnYlKSTPsTothpsy2pNOKALFyKKhn9W44OlL
 +cZjRjNgRJKzURqhNHFr0bUheleEFwIHlJUOjHe6+8/H6czcQuaTKrXLrynQfLXa1OF7
 yUB2nwoJ+3wh0pucpP+eqxwtGsKcnBiHhM/w+W1JdgmtzaTY+2NwOkQaG6/PtzHj0GWT
 bVT25LrcpTLBknZo92GNsZz5UoQm3/XU+3fhcdLnlT4+qGXOXOpf5/bXgmbXK5zaHcwr
 jCsXk2nSI0snXcDdnj6SEgHzF+u1KK7yHVrsA2Gf0yoGU3gPFccu7ykntQLChDo2pHOe
 QTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VcVFk3FcEgzfyMwYD0aU10qnYcHMUzYlGb8aE1VELAQ=;
 b=ZkRzi6q4LTFynvcOg6Yyuxp1xBxfzbm8z3LJpq2Koizgiky6cZn/GKfMT5MdvSulDL
 WdwCUfkqtP7DdOhQP7tbR9QNZ1b89791ppUuXPtO37V4yxUBx7ANw+Ll9IjqQNQ+RW4g
 WUFN13w5HMIAqoBOUtH+Hhk8TgwSwI0sJ4WmWHjPWP//jxm2RT6ZRS9Y3WxkMRDJIkWB
 G89DMVsBSh+Ht/iMHqyYA98oB661byuIdujyfGiB/6SmBhHHFWMK/qutkOolUcz/sZUk
 Np8i4mKIfR54Ux51mi7LPNscWiRvFYjGSpcv1ae2bfpryCxju3ydi9jwb7T0zi2ZnyVA
 z2RA==
X-Gm-Message-State: AOAM532E/a1VWVsDOYCGfqfOlAqojbBXT7pne/o5zPKAwm7UNnaFf8bx
 oINgFbag5vPM0MjHvycFYH5MFA==
X-Google-Smtp-Source: ABdhPJz0WtrjOJCip7mt3F57oMADC6YJYPp4ap9cajQlDw45E7nedRqS2OqtCHvUvpJcdnhIjwCnKw==
X-Received: by 2002:a17:902:8501:b0:15f:173:40e1 with SMTP id
 bj1-20020a170902850100b0015f017340e1mr23539994plb.74.1653326361089; 
 Mon, 23 May 2022 10:19:21 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 t2-20020a170902e84200b0015e8d4eb273sm5392051plg.189.2022.05.23.10.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:19:20 -0700 (PDT)
Date: Mon, 23 May 2022 17:19:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 03/19] KVM: x86: SVM: remove avic's broken code
 that updated APIC ID
Message-ID: <YovCFBn5cKcv3iwD@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-4-mlevitsk@redhat.com>
 <YoZr9wC2KjTFHrQ7@google.com>
 <d1df82a17e6e89ab58d5f6aa911ee2d532efee31.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1df82a17e6e89ab58d5f6aa911ee2d532efee31.camel@redhat.com>
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 22, 2022, Maxim Levitsky wrote:
> On Thu, 2022-05-19 at 16:10 +0000, Sean Christopherson wrote:
> > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > AVIC is now inhibited if the guest changes apic id, thus remove
> > > that broken code.
> > 
> > Can you explicitly call out what's broken?  Just something short on the code not
> > handling the scenario where APIC ID is changed back to vcpu_id to help future
> > archaeologists.  I forget if there are other bugs...
> > 
> 
> 
> Well, the avic_handle_apic_id_update is called each time the AVIC is uninhibited,
> because while it is inhibited, the AVIC code doesn't track changes to APIC ID and such.
> 
> Also there are many ways it is broken for example
> 
> 1. a CPU can't move its APIC ID to a free slot due to (!new) check
> 
> 2. If APIC ID is moved to a used slot, then the CPU that used that overwritten
> slot can't correctly move it, since its now not its slot, not to mention races.

The more the merrier :-)  Any/all of those examples are great, just so long as it's
obvious to future readers that the code truly is busted.

> BTW, if you see a value in it, I can fix this code instead - a lock + going over all the apic ids,
> should be quite easy to implement. In case of two vCPUs using the same APIC ID,
> I can write non present entry to the table, so none will be able to be addressed,
> hoping that the situation is only temporary.

Very strong "no", let's keep this as simple as possible without outright killing
the guest or breaking ABI.  Disabling APICv/AVIC is perfect.
