Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62207A6AF4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 20:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A10788E26;
	Tue, 19 Sep 2023 18:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E6F88E26
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 18:55:32 +0000 (UTC)
Received: from [192.168.1.103] (178.176.79.31) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 19 Sep
 2023 21:55:26 +0300
Subject: Re: [PATCH 1/2] video: fbdev: core: cfbcopyarea: fix sloppy typing
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20230918205209.11709-1-s.shtylyov@omp.ru>
 <20230918205209.11709-2-s.shtylyov@omp.ru>
 <d436d191-9580-c3ca-1583-02c9cff58494@gmx.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <03096350-c12a-b442-b695-3233a46d1008@omp.ru>
Date: Tue, 19 Sep 2023 21:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d436d191-9580-c3ca-1583-02c9cff58494@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [178.176.79.31]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/19/2023 18:39:25
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179974 [Sep 19 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 534 534 808c2ea49f7195c68d40844e073217da4fa0d1e3
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.79.31 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2; omp.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.79.31
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/19/2023 18:46:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/19/2023 4:23:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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
Cc: stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 9/19/23 10:05 AM, Helge Deller wrote:

>> In cfb_copyarea(), when initializing *unsigned long const* bits_per_line
>> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- which
>> might overflow __u32; multiplying by 8UL instead should fix that...
>> Also, that bits_per_line constant is used to advance *unsigned* src_idx
>> and dst_idx variables -- which might be overflowed as well; declaring
>> them as *unsigned long* should fix that too...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Cc: stable@vger.kernel.org
>> ---
>>   drivers/video/fbdev/core/cfbcopyarea.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
>> index 6d4bfeecee35..b67ba69ea2fb 100644
>> --- a/drivers/video/fbdev/core/cfbcopyarea.c
>> +++ b/drivers/video/fbdev/core/cfbcopyarea.c
>> @@ -382,10 +382,11 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
>>   {
>>       u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
>>       u32 height = area->height, width = area->width;
>> -    unsigned long const bits_per_line = p->fix.line_length*8u;
>> +    unsigned long const bits_per_line = p->fix.line_length * 8UL;
> 
> you wrote:
>> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- which
>> might overflow __u32; multiplying by 8UL instead should fix that...
> 
> This would only be true on 64-bit CPUs, where unsigned long is 64 bits,

   Right, Svace was run with the arm64 and x86_64 configs -- and I forgot
to make the emphasis on the 64-bit specifics here...

> while on 32-bit CPUs, it's still 32 bits (same as _u32).

   Yes, indeed. That *unsigned long const* doesn't seem justified
at all then...

> Instead we could make bits_per_line __u32 (or unsigned int) too.

   Yes. Will you accept such a patch? :-)

>>       unsigned long __iomem *base = NULL;
>>       int bits = BITS_PER_LONG, bytes = bits >> 3;
>> -    unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
>> +    unsigned long dst_idx = 0, src_idx = 0;
> 
> An "unsigned int" can address at least up to 4GB, which is fully sufficent here.

   Good to know! :-)

> So, both patches don't have any real effect.
> NAK.

   Thanks for your time!

> Helge

MBR, Sergey
