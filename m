Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC77527F1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F18410E709;
	Thu, 13 Jul 2023 16:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578F10E709;
 Thu, 13 Jul 2023 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=FGfECluQ+8FqgloN5y7njhMRYgbNQmkghpgv24LmuxM=; b=0XY4/FQJa9khQp7bFpbGplPtrB
 5SpA/Xwz1+y5xMC8TkQ/RIwD1YWvtpubNsS1DOufMRk8U8ZOw4QBT/2OcdaSsugIN7fvQtpI7FoTv
 cytb12hmpQ++kNkMjOGEjV3X0J/VuBhB9uSnfg9JjtfUZNml3TMudThtLyoBgiurIyPLTXfpsW1zN
 ZtXFfJPqxyrJBHJb3985aNxuQmUFSYt3wjhQoX2i+JeMJunamtLIY8iXJ5jgN3F/OMabSTImubkKK
 MN74NscjU6mryhy24nJ4dBieOuA4YvnVsMsArDKWNb60xY8A4s7oL4npScU177xtucZj0Dk4Lyl65
 o8/EadpQ==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJym9-003r1C-08; Thu, 13 Jul 2023 16:02:41 +0000
Message-ID: <801dbd65-ee7f-526d-6cd8-27cb0291c4ba@infradead.org>
Date: Thu, 13 Jul 2023 09:02:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 18/18] fbdev: Document that framebuffer_alloc() returns
 zero'ed data
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
 <20230713130338.31086-19-tzimmermann@suse.de>
 <CANiq72mbLmMKph8aiz4apNF9n3MtVO-nhM9rEWYApZbSVAO9Qw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CANiq72mbLmMKph8aiz4apNF9n3MtVO-nhM9rEWYApZbSVAO9Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-geode@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/13/23 06:21, Miguel Ojeda wrote:
> On Thu, Jul 13, 2023 at 3:03 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> Most fbdev drivers depend on framebuffer_alloc() to initialize the
>> allocated memory to 0. Document this guarantee.
>>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Helge Deller <deller@gmx.de>
> 
> Thanks for sending this! Maybe this would be best earlier in the
> series, so that later patches make more sense (since they use the
> guarantee), but it is not a big deal.
> 
>> + * aligned to sizeof(long). Both, the instance of struct fb_info and
>> + * the driver private data, are cleared to zero.
> 
> I think both commas may be best omitted (but I am not a native speaker).

Yes, it would be better to omit them.

> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Cheers,
> Miguel

-- 
~Randy
