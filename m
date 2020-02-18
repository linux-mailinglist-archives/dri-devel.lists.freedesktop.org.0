Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0E162A79
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 17:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339C06E33E;
	Tue, 18 Feb 2020 16:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA046E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582043336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jD6r5vsrK2inpyE/7zQ8fQY+x4uGHuexXAaQdSOZRs=;
 b=LgOfm1ui05jUBQoJ/hUTn83+MJM/y8Ds3JGsDiBRtF9gXvj/JzOrAuR67qIT5EF0tvLCX8
 329tx/6NLfUlPfUDp//hRqu8XqGjrLwA9Woo7VMeMt+A47oG6TGciHny1nBJN6k+UkheDU
 5BMFKKZ896tT92hTC0P/1Thf33wg/oU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-GxzlJhMlPKeTfvVz1uoETg-1; Tue, 18 Feb 2020 11:28:54 -0500
Received: by mail-wm1-f71.google.com with SMTP id u11so283630wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 08:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6jD6r5vsrK2inpyE/7zQ8fQY+x4uGHuexXAaQdSOZRs=;
 b=H1RDr0PRbmNnU8C+ydiK+BZFk7D9IxWD5+S/pA6RVahFf8jR4+M109VgoAl5IavUTP
 2aj2U4V66FeFDXplvLUVegi0QK2oCk6ZIOZ1xJrsGm3hC6KZynb9iakTMAx36ko28gBL
 TxBrnjCwbQGehu9gjBnqjRSZJqKue2RVQhRmT1fWY5JDm/sDZSpyG0DYV8t5x6S79k3A
 rjPwz0r86jsBjW0YTEMrA+k7KiyuKtrME4lDEVX3tIM+glA4Hz526L7iXGXER6Tz6Ewx
 nmjl8+d8Pqcu2rgZYCiKHakqMrnmg4/giTSji19HBJI9LBmVmPXdS+W/mLuuRPMwuxPr
 W0TQ==
X-Gm-Message-State: APjAAAU8H2Xcm03SfD8J2pwZui24p1AOh213Mq4QOr1iUYGr1o8tA7Ud
 GQI0nfmJXRnkkXoGhm4cCq6nGeCU1vSNTd5fN40nURjkupXUHRrw6sY5eHgUiDKlkvxwPGCfUSr
 E0u9wLpvkk5/9LU88/+5/h4xdqGV8
X-Received: by 2002:adf:cd92:: with SMTP id q18mr29373117wrj.261.1582043333340; 
 Tue, 18 Feb 2020 08:28:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxh1csn8D9Cr5lablaQwXqDBbOZ14tjlkRUptdOsuUNqh5YSNNequyVCeRecPRnZe+IBXn/+Q==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr29373091wrj.261.1582043333075; 
 Tue, 18 Feb 2020 08:28:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:59c7:c3ee:2dec:d2b4?
 ([2001:b07:6468:f312:59c7:c3ee:2dec:d2b4])
 by smtp.gmail.com with ESMTPSA id o7sm4001400wmh.11.2020.02.18.08.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 08:28:52 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Sean Christopherson <sean.j.christopherson@intel.com>,
 Jim Mattson <jmattson@google.com>
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <20200214195229.GF20690@linux.intel.com>
 <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
 <CALMp9eRwTxdqxAcobZ7sYbD=F8Kga=jR3kaz-OEYdA9fV0AoKQ@mail.gmail.com>
 <20200214220341.GJ20690@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
Date: Tue, 18 Feb 2020 17:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200214220341.GJ20690@linux.intel.com>
Content-Language: en-US
X-MC-Unique: GxzlJhMlPKeTfvVz1uoETg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/20 23:03, Sean Christopherson wrote:
>> On Fri, Feb 14, 2020 at 1:47 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>> AFAICT, it is currently allowed on ARM (verified) and AMD (not
>>> verified, but svm_get_mt_mask returns 0 which supposedly means the NPT
>>> does not restrict what the guest PAT can do).  This diff would do the
>>> trick for Intel without needing any uapi change:
>> I would be concerned about Intel CPU errata such as SKX40 and SKX59.
> The part KVM cares about, #MC, is already addressed by forcing UC for MMIO.
> The data corruption issue is on the guest kernel to correctly use WC
> and/or non-temporal writes.

What about coherency across live migration?  The userspace process would
use cached accesses, and also a WBINVD could potentially corrupt guest
memory.

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
