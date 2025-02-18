Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0BAA3ACE8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425410E07D;
	Tue, 18 Feb 2025 23:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codeweavers.com header.i=@codeweavers.com header.b="beFRfKIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75A10E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=s1; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8V96M1dNZ/nDV9/9O0iW1J6fywepGaauBM99maMCPQ=; b=beFRfKIpyWei/AqaxjdVB1+t7R
 myVQ+O8u5GMBnjskUEmNlLfY2k+BjDYJ7w99yJukhUdZfNzVclUJYwTLt5ozKiqSyOnHHHUVnuATY
 s1PkyXMVtxNW1TaPbjkZ7DWF4CxFIQbBMieRn4zalDn8sDu321MTv6bk3r3O1ywLLMeFLEpXnYKrG
 g0KSQUirG3qstUAAXwr96d6E0RHjQojV8gp5Q58FIJ8fmjeY7HPsF+jufg2LFkgsHb/eMw1QZGMZm
 cObsCE9Uhe9+0UvFvVbB4PY8Y951NMvQIwx7/K41+Nd03w3YYn1vWo0cWFSBd0wgUwS7s1L3i7MLO
 wgotkd9g==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160]
 helo=camazotz.localnet)
 by mail.codeweavers.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <zfigura@codeweavers.com>) id 1tkXT1-00Agzb-2A;
 Tue, 18 Feb 2025 17:57:31 -0600
From: Elizabeth Figura <zfigura@codeweavers.com>
To: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Mike Lothian <mike@fireburn.co.uk>
Cc: Mike Lothian <mike@fireburn.co.uk>, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, wine-devel@winehq.org,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
Date: Tue, 18 Feb 2025 17:57:31 -0600
Message-ID: <2768333.mvXUDI8C0e@camazotz>
In-Reply-To: <20250214122759.2629-2-mike@fireburn.co.uk>
References: <20250214122759.2629-2-mike@fireburn.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 14 February 2025 06:28:00 CST Mike Lothian wrote:
> This allows ntsync to be usuable by non-root processes out of the box
> 
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> ---
>  drivers/misc/ntsync.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
> index 055395cde42b..586b86243e1d 100644
> --- a/drivers/misc/ntsync.c
> +++ b/drivers/misc/ntsync.c
> @@ -1208,6 +1208,7 @@ static struct miscdevice ntsync_misc = {
>  	.minor		= MISC_DYNAMIC_MINOR,
>  	.name		= NTSYNC_NAME,
>  	.fops		= &ntsync_fops,
> +	.mode		= 0666, // Setting file permissions to 0666
>  };
>  
>  module_misc_device(ntsync_misc);
> 

Reviewed-by: Elizabeth Figura <zfigura@codeweavers.com>

--

The comment seems rather redundant, but otherwise this is correct and prudent.


