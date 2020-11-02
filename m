Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843A2A3E86
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EE86EC24;
	Tue,  3 Nov 2020 08:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4D6E0DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 17:16:41 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a65so9894816qkg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 09:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nOooqOL2HAfCzA3WbZS617x/HCXK3f8ujSR4To+U+xs=;
 b=OzpU9SvL4LQMiSZU+/wC8SOY7Kd5nwVlGSTQjG9d88TeMJ4WpFyipjmaUdp1TxOYVn
 7vidwyiSRCZj33RSLCqu0pXEDxMU/dAAoukKMfQfZuIAjtLdwwP4N2zY3W8B92Z6AwFE
 OTED+BMjliDXrbRWrDsPovc1pCXjBe20TOvquBC1aoMM7tLd9pJLJZOtf/olLrbdulv4
 wmYRU9+3HhHbwX4F5ELPi2SPcx5nfQMbB/P20GVamTcL6w1vdCvhRKxx/L/E22ILoMnS
 rmp9SSiTbFRAYQDj9HHFQ8bEOTeAHdVsxV9Tfe2mGZkEyeAYsnLrRuqy6EC2kl3h/BMa
 5ZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nOooqOL2HAfCzA3WbZS617x/HCXK3f8ujSR4To+U+xs=;
 b=Lz+Fyxmx+SL9CNmnIGApF8NR1mpTgNDna7169QXVzLqNrwLjj4N90wDiKUlw82tO0y
 my53Q3/kj17vFjnDcHRDASR9EzfUrhcrpLlrIDUx1tSQsfghOJ40u8lrb8LhQdvjfTC+
 GthgCEAdHcXTOZh8T8DjeiGFT9dIRZNhC+9M5v6OzPLljhydzw/ISufcmCdBmpSutCWq
 YMUsCy95cjEHm1B/9awqwKwcQQyTeRv3PF8Odp9DhWGiF7IyGA11XisYonlHOkR/0cuL
 K7g+TnXyZGWdIru/EBn/MjfB8SHJ4gzMrMqlGW2hqIYVPGQ8fDqgP80mldJFrxBwh2U7
 caiQ==
X-Gm-Message-State: AOAM533VsnVMiuTulTZHyvSdRxG9HeAq1XTRhes+swlNz4e583HbQ7wY
 R0+qIMvEbjSLDY1NBoFUZxOaIA==
X-Google-Smtp-Source: ABdhPJzKAXEdRCm0W3ToJIDRDSewKlEjp6I2L8WD4tRBCiFlVxj0ALakWiSn3a8Exau8avpdo4ShfA==
X-Received: by 2002:a37:f503:: with SMTP id l3mr6457698qkk.160.1604337400730; 
 Mon, 02 Nov 2020 09:16:40 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id c76sm8677260qkb.20.2020.11.02.09.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:16:40 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kZdRf-00FI9F-Az; Mon, 02 Nov 2020 13:16:39 -0400
Date: Mon, 2 Nov 2020 13:16:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201102171639.GH36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
 <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
 <20201102155256.GG36674@ziepe.ca>
 <CAKMK7uFqkieBAXEmoeoBfnJBXcuHaNwrsaVyPsLQaXnrJo=scg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFqkieBAXEmoeoBfnJBXcuHaNwrsaVyPsLQaXnrJo=scg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
 KVM list <kvm@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 J??r??me Glisse <jglisse@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 05:42:20PM +0100, Daniel Vetter wrote:
> > Need to hold the lock to check that and there are two ways to register
> > notifiers these days, so it feels to expensive to me.
> 
> Uh I mixed stuff up all along, struct mmu_notifier *subcription that
> all the mmu notifier users use has the ->mm pointer we want right
> there. That's good enough I think.

Yah, if you can pass in one of those instead of the raw mm it would be
fine

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
