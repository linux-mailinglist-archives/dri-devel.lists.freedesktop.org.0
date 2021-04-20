Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A1365505
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59EC6E4B6;
	Tue, 20 Apr 2021 09:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C136E4B6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:12:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618909955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/BmEPBKTeOFguvQ2qBlwcHcEEfovS+ifTPNFePUZCk=;
 b=R5GsHcSJibcbHlBRzrzGN94SKJ7cYaMlDSfB2NhAQZy1yVY6Sam2aaojFN8kuuVAmMeJvr
 MmqcwgqtHPe6i8jwmzp+WFbXpe+rwEkxBMmXP6nsLS80NKGRfSKxoHoA5B8kpg0wS40pT4
 AUy/xXjVA7r3cstTCTWGotHbxkta9rM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CEF61B4A6;
 Tue, 20 Apr 2021 09:12:34 +0000 (UTC)
Date: Tue, 20 Apr 2021 11:12:33 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter.Enderborg@sony.com
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH6bASnaRIV4DGpI@dhcp22.suse.cz>
References: <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
 <07ed1421-89f8-8845-b254-21730207c185@amd.com>
 <YH59E15ztpTTUKqS@dhcp22.suse.cz>
 <b89c84da-65d2-35df-7249-ea8edc0bee9b@amd.com>
 <YH6GyThr2mPrM6h5@dhcp22.suse.cz>
 <5efa2b11-850b-ad89-b518-b776247748a4@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5efa2b11-850b-ad89-b518-b776247748a4@sony.com>
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
Cc: willy@infradead.org, christian.koenig@amd.com, neilb@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 20-04-21 09:02:57, Peter.Enderborg@sony.com wrote:
> 
> >> But that isn't really system memory at all, it's just allocated device
> >> memory.
> > OK, that was not really clear to me. So this is not really accounted to
> > MemTotal? If that is really the case then reporting it into the oom
> > report is completely pointless and I am not even sure /proc/meminfo is
> > the right interface either. It would just add more confusion I am
> > afraid.
> >  
> 
> Why is it confusing? Documentation is quite clear:

Because a single counter without a wider context cannot be put into any
reasonable context. There is no notion of the total amount of device
memory usable for dma-buf. As Christian explained some of it can be RAM
based. So a single number is rather pointless on its own in many cases.

Or let me just ask. What can you tell from dma-bud: $FOO kB in its
current form?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
