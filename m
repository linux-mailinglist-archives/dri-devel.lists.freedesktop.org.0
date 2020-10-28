Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C036E29CF6B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044176E4C5;
	Wed, 28 Oct 2020 10:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD666E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yK+OKdbyUS7F1jSSdOFkvJ5OSev+to/69KyoRA46pBg=; b=PQD0EYeZHB1HH/6GcRg2JO+nup
 K556tnasiTmkuKibQycJStVYpXNIWTHpCbfUkrnJMiAI/4Ovza2oofAgQ5Zk+L80fH+mbQXNRFiuM
 MGVbr6erXGyptuH4RfwWQajmgdAUmImEt2t4kjlPGJbDTU/InIiiZaNj8jhS+9SmgNT4=;
Received: from [10.69.141.123]
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kXiOS-0006Ww-JU; Wed, 28 Oct 2020 05:09:26 -0500
Subject: Re: [PATCH libdrm] xf86drm.c: Use integer logarithm.
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20201026131120.1068959-1-pgofman@codeweavers.com>
 <20201028101842.041e8a02@eldfell>
From: Paul Gofman <pgofman@codeweavers.com>
Message-ID: <e41dc6bd-b32b-7876-fefd-168088353b5c@codeweavers.com>
Date: Wed, 28 Oct 2020 13:09:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028101842.041e8a02@eldfell>
Content-Language: en-GB
X-Spam-Score: -41.5
X-Spam-Report: Spam detection software,
 running on the system "mail.codeweavers.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/28/20 11:18,
 Pekka Paalanen wrote: > >> >> +static unsigned
 log2_int(unsigned x) >> +{ >> + unsigned l; >> + >> + if (x < 2) { >> + return
 0; >> + } >> + for (l = 2; ; l++) { >> + if ((unsigned) [...] 
 Content analysis details:   (-41.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
 -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
 -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 1.2 AWL AWL: Adjusted score from AWL reputation of From: address
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/28/20 11:18, Pekka Paalanen wrote:
>
>>  
>> +static unsigned log2_int(unsigned x)
>> +{
>> +    unsigned l;
>> +
>> +    if (x < 2) {
>> +        return 0;
>> +    }
>> +    for (l = 2; ; l++) {
>> +        if ((unsigned)(1 << l) > x) {
> Hi,
>
> wouldn't this loop fail to end when x >= 0x80000000?
>
> Sure, such value probably cannot occur where this is currently used,
> but it seems like a landmine for the next developer to step on.
>
Indeed, thanks. I've sent the patches for consideration which avoid
function duplication and potentially infinite loop.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
