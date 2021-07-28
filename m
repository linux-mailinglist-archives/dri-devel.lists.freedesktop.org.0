Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446153D8CAE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1C6E598;
	Wed, 28 Jul 2021 11:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42116E598
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:24:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q2so2643920ljq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wg+3/RRWhlXAdTdGrz6ZDOoqwDjAalfDgSMGfZRFy7c=;
 b=MqB2oQJrWErl4M3jysGVniDJ4xARTYUEk892vt+CXTsOghQBHfw+ROqpA+FWeMfNAw
 99HiHQl9pgCodpNZVcjBeusKVj1g8kcdEIy/ZsV7LY738G0Iid6EaBW2zhaAmZdiUtKc
 pOnrw2np1M0KCLNrhvFVpkrx8b6JNzJx5ukHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wg+3/RRWhlXAdTdGrz6ZDOoqwDjAalfDgSMGfZRFy7c=;
 b=bbgxC0lbkIf/ORzN7Ep5AAJgClxpNxyE68J/cNLcyMvcwoCeDYtsGgnd6zDrj0l2pK
 NppA8NV3sEyZ+5G++W+GOCuT/6ok+YwCqfcCE8+xWO05Z0bsWppCZwrs7my1h6OokLA7
 /Cl/F37jlTmdk1FpyFLmynFqAMz/XxsmW1Tq1gD/fn4UM+O58+6CX7RELmBQF05cr9j2
 XO06m0C8HCgP9WR5zD9hFFGJVS9WzzeMZt6aVHY+2Hl+OBYKmB/ZTXR0mnaK2HEDDBwj
 zB6N9XgrLSObbwvqILmZh5k5+FRBp9rCSpByHwhi3qZoiaZItO7PHrmQP+ZtUH/9aiAv
 eKsA==
X-Gm-Message-State: AOAM530UqN75SnFmza5uOeG5Fo+2wrzhH8g7M+ZnSHAQPriDp7Fo6M5L
 2nZr+2SRuBta1avv3UALalMj/g==
X-Google-Smtp-Source: ABdhPJzbJpuLwTQcj/uhUJ1FDab/S8wsNFZGfZq+HhHIgh+eTtqaebX9Ee+tEB7aFHczhnUT7I/eLg==
X-Received: by 2002:a05:651c:124f:: with SMTP id
 h15mr18566268ljh.4.1627471443108; 
 Wed, 28 Jul 2021 04:24:03 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id f14sm494569ljj.116.2021.07.28.04.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:24:02 -0700 (PDT)
Subject: Re: [PATCH 62/64] netlink: Avoid false-positive memcpy() warning
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-63-keescook@chromium.org> <YQDv+oG7ok0T1L+r@kroah.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d7251d92-150b-5346-6237-52afc154bb00@rasmusvillemoes.dk>
Date: Wed, 28 Jul 2021 13:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQDv+oG7ok0T1L+r@kroah.com>
Content-Type: text/plain; charset=windows-1252
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
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2021 07.49, Greg Kroah-Hartman wrote:
> On Tue, Jul 27, 2021 at 01:58:53PM -0700, Kees Cook wrote:
>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> field bounds checking for memcpy(), memmove(), and memset(), avoid
>> intentionally writing across neighboring fields.
>>
>> Add a flexible array member to mark the end of struct nlmsghdr, and
>> split the memcpy() to avoid false positive memcpy() warning:
>>
>> memcpy: detected field-spanning write (size 32) of single field (size 16)
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  include/uapi/linux/netlink.h | 1 +
>>  net/netlink/af_netlink.c     | 4 +++-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
>> index 4c0cde075c27..ddeaa748df5e 100644
>> --- a/include/uapi/linux/netlink.h
>> +++ b/include/uapi/linux/netlink.h
>> @@ -47,6 +47,7 @@ struct nlmsghdr {
>>  	__u16		nlmsg_flags;	/* Additional flags */
>>  	__u32		nlmsg_seq;	/* Sequence number */
>>  	__u32		nlmsg_pid;	/* Sending process port ID */
>> +	__u8		contents[];
> 
> Is this ok to change a public, userspace visable, structure?

At least it should keep using a nlmsg_ prefix for consistency and reduce
risk of collision with somebody having defined an object-like contents
macro. But there's no guarantees in any case, of course.

Rasmus
