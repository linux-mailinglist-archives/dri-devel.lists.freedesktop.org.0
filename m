Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263BE135FC6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9E86E93D;
	Thu,  9 Jan 2020 17:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jan 2020 15:38:07 UTC
Received: from mail.daemonic.se (mail.daemonic.se [IPv6:2607:f740:d:20::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CF46E43F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 15:38:07 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 47tqkr4r63z3l8s;
 Thu,  9 Jan 2020 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=daemonic.se; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received; s=20151023; t=1578583699; bh=+Bq/Skzh2brYvuUEgK16FFW2
 urEOuah5bGs2NUrosZw=; b=K05cTLzc46M+4xGEeM4SjJH4GaVh0GEL7EoV+Anc
 rSJP7UvETWNQDgZpkUpSKIREwJJBHoxDki8/LYl5xcbal3nBbMPLAKZvZP7uMxiO
 bwX21Yh5ctB3B4Jmgp1Z3Ar8apqRLO6tX7Yk2ToTLt7j1AvN16Bunf4fW16G3V7i
 7/8=
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id wWjF_7u8LyI5; Thu,  9 Jan 2020 15:28:19 +0000 (UTC)
Received: from garnet.daemonic.se (unknown [95.202.48.196])
 by mail.daemonic.se (Postfix) with ESMTPSA id 47tqkp56ktz3l8C;
 Thu,  9 Jan 2020 15:28:18 +0000 (UTC)
Subject: Re: [PATCH] xf86drm: only include <sys/sysctl.h> for FreeBSD build
 case
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org
References: <CGME20200109092903epcas1p49de22b4892ff4c6e205fb098c83c76ae@epcas1p4.samsung.com>
 <1578562330-25594-1-git-send-email-sw0312.kim@samsung.com>
 <871rs8psjy.fsf@intel.com>
From: Niclas Zeising <zeising@daemonic.se>
Message-ID: <94d436b2-b4e0-3414-a2fc-9d58e5ad4c07@daemonic.se>
Date: Thu, 9 Jan 2020 16:28:17 +0100
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <871rs8psjy.fsf@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: eric.engestrom@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-09 16:18, Jani Nikula wrote:
> On Thu, 09 Jan 2020, Seung-Woo Kim <sw0312.kim@samsung.com> wrote:
>> The <sys/sysctl.h> header is only required FreeBSD and GNU libc
>> 2.30 starts to warn about Linux specific <sys/sysctl.h> header
>> deprecation. Only include <sys/sysctl.h> for FreeBSD.
>>
>> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
>> ---
>>   xf86drmMode.c |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/xf86drmMode.c b/xf86drmMode.c
>> index 207d7be..ff1d31d 100644
>> --- a/xf86drmMode.c
>> +++ b/xf86drmMode.c
>> @@ -42,9 +42,11 @@
>>   #include <stdint.h>
>>   #include <stdlib.h>
>>   #include <sys/ioctl.h>
>> +#if defined (__FreeBSD__) || defined (__FreeBSD_kernel__)
>>   #ifdef HAVE_SYS_SYSCTL_H
> 
> Not that I know anything about this, but shouldn't you instead fix
> HAVE_SYS_SYSCTL_H definition in configure stage to only be enabled on
> FreeBSD?
> 
> BR,
> Jani.
> 
>>   #include <sys/sysctl.h>
>>   #endif
>> +#endif /* defined (__FreeBSD__) || defined (__FreeBSD_kernel__) */
>>   #include <stdio.h>
>>   #include <stdbool.h>
> 

Hi!
This fix looks OK on FreeBSD (I haven't had time to test), however, as 
has been pointed out, perhaps the change should go into the meson build 
script or configure instead.
I don't know if other OSes (other BSDs primarily) need this as well. 
I'm pretty sure it's needed on DragonflyBSD at least.
Perhaps keep the include for everything except Linux for the time being?
Regards
-- 
Niclas Zeising
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
