Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36835347AB2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9D96EA08;
	Wed, 24 Mar 2021 14:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631086EBB7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616596269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jtHaYpG/XZInPp8hHHKOOdzU2YSMvIuIW7BEJkipo8=;
 b=KqHRh/Wf0nk6pudXDypiBEZdt2ZySsNSFvB0+AwMW8iM9l8er6jJchvGa+bZCd0Y4XgpGB
 YOgogUzZbiMSn1adlCNR5db37w7xTrG+n7Dan2O8Y3fIKmyi8mh+o+hy1BEkak80RzOvXO
 CPKR/pfnFsYMdXU0gbmkwypkjF3r3PU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-udFRR28pMCGtie3v1BDmxA-1; Wed, 24 Mar 2021 10:31:07 -0400
X-MC-Unique: udFRR28pMCGtie3v1BDmxA-1
Received: by mail-wr1-f69.google.com with SMTP id h21so1143986wrc.19
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+jtHaYpG/XZInPp8hHHKOOdzU2YSMvIuIW7BEJkipo8=;
 b=rYL8XcL5ULLQWle3NdP4Byqs+/Jp15BjPuiQoeNoktIz/owGXhtz6JRIKRgUktUctc
 feAVjE56LE9W7KKBwRuMQRDIstza03neD1uk0Z/ZlhU86iF3+KcbI9sc5i+2PYkEgZ7h
 aM6fDr1FaISrJQ3YrBfcx49Yt11oRlzGIdVKzsUKDTeL62yVkXrUhpcKMF0MixJjdonX
 tY5fONVzyJW/D7d32U4TkvzIZS7NIGGdKlYIO/1wOgVAD/fwlqVh8NWn+a8z6tK8TC8s
 EH0bGFCLvkhsd2Ko1u5VNYqY0b4VkzEh+urSB+pB2Ax6tir6oU+qNwII8u52+S2p2YkC
 c/cw==
X-Gm-Message-State: AOAM532GQOS4gcwDTRdOZgHDhaTAEFXe8WTwtXr+dH/QEjq90ytpX87M
 H+g2FNqAOfuoEYZrrek4cpflSoF2CUSAyo4q08HPuU0lbK6MQI6/cZ35y6YOT86yYbfOBjKfVY/
 xuHwmhz1hDJswR/cO+3qsmGwhsRrF
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3977880wrw.247.1616596266460; 
 Wed, 24 Mar 2021 07:31:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIf+VryoTPSfwti+YSTkQ2E1C0/b6Xuw3ivYfNPK4a9PF7c1OO41KjvaTv9A51GLRMrRGgKA==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3977856wrw.247.1616596266249; 
 Wed, 24 Mar 2021 07:31:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm3366640wrr.42.2021.03.24.07.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 07:31:05 -0700 (PDT)
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
To: Jason Gunthorpe <jgg@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210324125211.GA2356281@nvidia.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b1a46866-cbc7-4e7f-0e17-79fee57b32a0@redhat.com>
Date: Wed, 24 Mar 2021 15:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324125211.GA2356281@nvidia.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Jann Horn <jannh@google.com>, Cornelia Huck <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 3pvd@google.com, Peter Xu <peterx@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/21 13:52, Jason Gunthorpe wrote:
> I think this is the right thing to do.
> 
> Alex is working on fixing VFIO and while kvm is still racy using
> follow pte, I think they are working on it too?

Yeah, or at least we have a plan.

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
