Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74819E504
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0E6E203;
	Sat,  4 Apr 2020 12:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729806EB74
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 12:10:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h9so8241821wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8mWBNkB1mpQPt43O1OjkI1/IjpLk3sF192gEDKaSPA4=;
 b=adKEPDUjtMciZxhtUKSncQ7uOdW5PzfVnh2wW0vPHlxbb0Ml6npH1wmP6l1/ebWuBS
 5/M5VhUcTla6U02FRhmujSlXleSg0bAFRAoWxxdJ0Qx6fNADKOuVf79CXGKVTQ4iusfD
 T1EsH0x15qgDefZ7+A0gVWWf4lDq43b4fr8fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8mWBNkB1mpQPt43O1OjkI1/IjpLk3sF192gEDKaSPA4=;
 b=GveQew6SYJ19L1PhusM+s0L7DNx823at6FBZWHXfAXvjHcRQRSRYi3QdafUazAsn3Z
 RhC9AcxwDq+un8BgOPZqrfNfceRwHm1xWvBQwnuRV+pFmT1QG+jQhhNMBJ7814K/mwiI
 YpzCIBR8sV911NwfHvbr6YTN3GVzBSSur7UXMaL2/h06e90BWUW3X8/ptUAadVFjAkDZ
 O3YnX7Dk3Oi20mequ2X9KdMROplvx/BBGRizZ4EwmTqF6AfSOpnrOJ/sTbM4UViNKQsZ
 MtWJrcUZi460/n4NVZgBsznNKDRbreeyZplM1ieos47VANDRGbeYN5v81uDYYC40yCa4
 ARnA==
X-Gm-Message-State: AGi0PuYd7rsq6D0T4TI5Lg/co0f2U7j16n0Z38cvXdNfbbdFnwfjM9W9
 Caz2VCYnccsQVwt5dm1RYupK5gAe+Ns0ZQ==
X-Google-Smtp-Source: APiQypIwIzyIDkSJbAVVEfkHzuQnbPI/gjaKiG9yy6P0l/Lc3z/sFLfAD9qOo6Z+TElh0cprhE+HOQ==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr1180275wrs.314.1585915855411; 
 Fri, 03 Apr 2020 05:10:55 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-116-45.cgn.fibianet.dk.
 [5.186.116.45])
 by smtp.gmail.com with ESMTPSA id z129sm11337245wmb.7.2020.04.03.05.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 05:10:54 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
Date: Fri, 3 Apr 2020 14:10:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2020 11.11, Sakari Ailus wrote:
> Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> the same implementation can be used.

This seems quite niche to me, I'm not sure that belongs in vsprintf.c.
What's wrong with having a

char *fourcc_string(char *buf, u32 x)

that formats x into buf and returns buf, so it can be used in a

char buf[8];
pr_debug("bla: %s\n", fourcc_string(buf, x))

Or, for that matter, since it's for debugging, why not just print x with
0x%08x?

At the very least, the "case '4'" in pointer() should be guarded by
appropriate CONFIG_*.

Good that Documentation/ gets updated, but test_printf needs updating as
well.


> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Improve documentation (add -BE suffix, refer to "FourCC".
> 
> - Use '%p4cc' conversion specifier instead of '%ppf'.

Cute. Remember to update the commit log (which still says %ppf).

> - Fix 31st bit handling in printing FourCC codes.
> 
> - Use string() correctly, to allow e.g. proper field width handling.
> 
> - Remove loop, use put_unaligned_le32() instead.
> 
>  Documentation/core-api/printk-formats.rst | 12 +++++++++++
>  lib/vsprintf.c                            | 25 +++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1af39..550568520ab6 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -545,6 +545,18 @@ For printing netdev_features_t.
>  
>  Passed by reference.
>  
> +V4L2 and DRM FourCC code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +	%p4cc
> +
> +Print a FourCC code used by V4L2 or DRM. The "-BE" suffix is added on big endian
> +formats.
> +
> +Passed by reference.

Maybe it's obvious to anyone in that business, but perhaps make it more
clear the 4cc is stored in a u32 (and not, e.g., a __le32 or some other
integer), that obviously matters when the code treats the pointer as a u32*.
> +
> +	put_unaligned_le32(*fourcc & ~BIT(31), s);
> +
> +	if (*fourcc & BIT(31))
> +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> +			sizeof(FOURCC_STRING_BE));

put_unaligned_le32(0x0045422d, s + 4) probably generates smaller code,
and is more in line with building the first part of the string with
put_unaligned_le32().

Rasmus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
