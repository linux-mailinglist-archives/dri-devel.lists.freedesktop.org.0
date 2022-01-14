Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAF948F04C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 20:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F7010E176;
	Fri, 14 Jan 2022 19:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBE610E176
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:13:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w26so7884949wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=80fbgApjgxRqmQ/SUBxRZx2r8MYqVc4l2XpDiV7SkBM=;
 b=kv+TMHgCK3QJMcFN705OxG87X3EX7wYL0QbAr0lC2UZ/TvXQ2QIGqEz/9le07mWxAz
 +JLTvoBP1j3w46RfmTrXFtX4h6VKU1vlaCtqiwbhd9Po8d7tx2cURAQn+P/KhhC8dRfu
 6pDhfYItoCg/StsgGA6v58CWaCb2KBQcb7aj53WbHbE67RL53EWFRU95E77h8qnEh4bj
 xEejdZHvVPUhNRtKFa+ZrvpsSN7vVS5O4UWhGSDEJCP+S0dG/Wg7stag5NKoWc/vcNfu
 8yMY8ubFo3JmvcSEHXxqWWN1U/66xHKSKHaMlqJorW5zRleqyUqKtkCyAAmpKpk0H0nv
 NPhQ==
X-Gm-Message-State: AOAM530gwxMYyIy4wJozfKgsfTGp348wyRxLlGlFqyOrtyS465PYv2zE
 0W0cjmhNzj2NRPSYvda9R4E=
X-Google-Smtp-Source: ABdhPJy6FfH4KDLMgZmC0MFcbsFJm4Zgm0/mXIWR4k8R0ydt6WvRRewAXvkkhnsGqSP3BX2Qwg91pg==
X-Received: by 2002:a05:600c:6020:: with SMTP id
 az32mr3830646wmb.149.1642187589431; 
 Fri, 14 Jan 2022 11:13:09 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z6sm7961353wmp.9.2022.01.14.11.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 11:13:08 -0800 (PST)
Date: Fri, 14 Jan 2022 19:13:07 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
Message-ID: <20220114191307.uu2oel7wbxhiqe56@liuwe-devbox-debian-v2>
References: <20220109095516.3250392-1-yanminglr@gmail.com>
 <20220110004419.GA435914@anparri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110004419.GA435914@anparri>
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
Cc: linux-fbdev@vger.kernel.org, sthemmin@microsoft.com, lkmlabelt@gmail.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org, haiyangz@microsoft.com,
 decui@microsoft.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yanming Liu <yanminglr@gmail.com>,
 drawat.floss@gmail.com, Wei Liu <wei.liu@kernel.org>, kys@microsoft.com,
 mikelley@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 01:44:19AM +0100, Andrea Parri wrote:
> (Extending Cc: list,)
> 
> On Sun, Jan 09, 2022 at 05:55:16PM +0800, Yanming Liu wrote:
> > Commit adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-V
> > out of the ring buffer") introduced a notion of maximum packet size in
> > vmbus channel and used that size to initialize a buffer holding all
> > incoming packet along with their vmbus packet header. Currently, some
> > vmbus drivers set max_pkt_size to the size of their receive buffer
> > passed to vmbus_recvpacket, however vmbus_open expects this size to also
> > include vmbus packet header. This leads to corruption of the ring buffer
> > state when receiving a maximum sized packet.
> > 
> > Specifically, in hv_balloon I have observed of a dm_unballoon_request
> > message of 4096 bytes being truncated to 4080 bytes. When the driver
> > tries to read next packet it starts from a wrong read_index, receives
> > garbage and prints a lot of "Unhandled message: type: <garbage>" in
> > dmesg.
> > 
> > The same mismatch also happens in hv_fcopy, hv_kvp, hv_snapshot,
> > hv_util, hyperv_drm and hyperv_fb, though bad cases are not observed
> > yet.
> > 
> > Allocate the buffer with HV_HYP_PAGE_SIZE more bytes to make room for
> > the descriptor, assuming the vmbus packet header will never be larger
> > than HV_HYP_PAGE_SIZE. This is essentially free compared to just adding
> > 'sizeof(struct vmpacket_descriptor)' because these buffers are all more
> > than HV_HYP_PAGE_SIZE bytes so kmalloc rounds them up anyway.
> > 
> > Fixes: adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-V out of the ring buffer")
> > Suggested-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> > Signed-off-by: Yanming Liu <yanminglr@gmail.com>
> 
> Thanks for sorting this out; the patch looks good to me:
> 
> Reviewed-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> 

Thanks. I will pick this up after 5.17-rc1 is out.

Wei.
