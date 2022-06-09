Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B97754446E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D703113EF1;
	Thu,  9 Jun 2022 07:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0325F113F09
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654758393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejJ+Ng78DSXpeboh/1Se2ZSB8MGGkShzLxeIkWVzXd4=;
 b=DBr1cYDo+X7iK+G6FSLlGMjRB0VVJOWZRbYjvTqrbwxqn0jO0scN+T2C+N4QSfU9bQMB7O
 104/WF2pTRPN4bCfLK/pIfktvdrgHyWWdy1gnTiV/p3CjezFiywSw1Q0a/hSJdx3/T4Gkx
 LdCEwLn2JaXZnu/clELSaHzqNkOZ8uw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-4-iBXMAaMjGkuW7mzocrEw-1; Thu, 09 Jun 2022 03:06:32 -0400
X-MC-Unique: 4-iBXMAaMjGkuW7mzocrEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso15580652wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ejJ+Ng78DSXpeboh/1Se2ZSB8MGGkShzLxeIkWVzXd4=;
 b=n8g4nZ44TvgloCh8tUiu5A13mYrldMTHEkj8HZyqt8dsiuAqQASuO+/JIXW1FvnluC
 LM1fg2B51IdPjlBh0iE7nickrX8PgwIuhB8SxxEmdq/Gzl+NCsIahtSu3fS9BxRjjpnK
 t7YvwNYMPKcuzciR0uxXfCngi/+YUFXE9jPGIworcfjuxHn61fGE3V4Jkvl1jVt1LtJI
 /JatXWXaltQqzHImvpZwsncqe7IsGpaEVGrpwQzQLN60fhi1lXnNUnqgFfSArtFKBT2Q
 LMnsOWLFdc0iLMEJHxsf/rSZ32TgSgkgsXzmGaTCx+btJ9GLaAx5O9CyO1xlfJiObJr8
 7hDA==
X-Gm-Message-State: AOAM533k/11uIKu2Wm6Qn+nL7Mun63bXJFwjQx7vEbfYlqROZX90u8B9
 RmEkml8mXgciFRZaH414jTWrJwQgRomwHyykkH3dbamgfDQFhohE/d1GCkfsdQG3uAN37hNESoH
 hvJz9TLBs/LgNUi5AqedeBiOgxzPV
X-Received: by 2002:a7b:cd83:0:b0:39c:46d2:6ebb with SMTP id
 y3-20020a7bcd83000000b0039c46d26ebbmr1796671wmj.187.1654758390072; 
 Thu, 09 Jun 2022 00:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzURfxSxbfQDUMi5WFVw7d975uJim2i12ha4ko3FuWfeZb9SYb/AKLdPPfeU/USfSlh7RiJSQ==
X-Received: by 2002:a7b:cd83:0:b0:39c:46d2:6ebb with SMTP id
 y3-20020a7bcd83000000b0039c46d26ebbmr1796634wmj.187.1654758389800; 
 Thu, 09 Jun 2022 00:06:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003942a244f51sm34189442wmq.42.2022.06.09.00.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 00:06:29 -0700 (PDT)
Message-ID: <91519070-5c5b-1337-3dab-10decb1b258d@redhat.com>
Date: Thu, 9 Jun 2022 09:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>
References: <20220607120248.31716-1-tzimmermann@suse.de>
 <PSAPR06MB4805B23B053F80C0F23A8C6C8CA49@PSAPR06MB4805.apcprd06.prod.outlook.com>
 <c99f305f-ac4d-628b-b092-920af767a2e4@redhat.com>
 <PSAPR06MB48051E6CA20163561BAD80298CA79@PSAPR06MB4805.apcprd06.prod.outlook.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <PSAPR06MB48051E6CA20163561BAD80298CA79@PSAPR06MB4805.apcprd06.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Charles Kuan <charles_kuan@aspeedtech.com>,
 Hungju Huang <hungju_huang@aspeedtech.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2022 04:32, Kuo-Hsiang Chou wrote:
> Hi Jocelyn Falempe,
> 
> -----Original Message-----
> From: Jocelyn Falempe [mailto:jfalempe@redhat.com]
> Sent: Wednesday, June 08, 2022 9:17 PM
> To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>; Thomas Zimmermann <tzimmermann@suse.de>; airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch; regressions@leemhuis.info
> Cc: dri-devel@lists.freedesktop.org; stable@vger.kernel.org; Luke Chen <luke_chen@aspeedtech.com>; Hungju Huang <hungju_huang@aspeedtech.com>; Charles Kuan <charles_kuan@aspeedtech.com>
> Subject: Re: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
> 
> On 08/06/2022 10:09, Kuo-Hsiang Chou wrote:
>> Hi Thomas
>>
>> Thanks for your suggestions!
>>
>> I answer each revision inline that followed by [KH]:.
> 
> Thanks for reviewing this.
>>
>> Regards,
>>
>>           Kuo-Hsiang Chou
>>
>> -----Original Message-----
>>
>> From: Thomas Zimmermann [mailto:tzimmermann@suse.de]
>>
>> Sent: Tuesday, June 07, 2022 8:03 PM
>>
>> To: airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch;
>> jfalempe@redhat.com; regressions@leemhuis.info; Kuo-Hsiang Chou
>> <kuohsiang_chou@aspeedtech.com>
>>
>> Subject: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
>>
>> Include AST2600 in most of the branches for AST2500. Thereby revert
>> most effects of commit f9bd00e0ea9d ("drm/ast: Create chip AST2600").
>>
>> The AST2600 used to be treated like an AST2500, which at least gave
>> usable display output. After introducing AST2600 in the driver without
>> further updates, lots of functions take the wrong branches.
>>
>> Handling AST2600 in the AST2500 branches reverts back to the original
>> settings. The exception are cases where AST2600 meanwhile got its own
>> branch.
>>
>> [KH]: Based on CVE_2019_6260 item3, P2A is disallowed anymore.
>>
>> P2A (PCIe to AMBA) is a bridge that is able to revise any BMC registers.
>>
>> Yes, P2A is dangerous on security issue, because Host open a backdoor
>> and someone malicious SW/APP will be easy to take control of BMC.
>>
>> Therefore, P2A is disabled forever.
>>
>> Now, return to this patch, there is no need to add AST2600 condition
>> on the P2A flow.
>>
> 
> [snip]
>>
>> [KH]: Yes, the patch is "drm/ast: Create threshold values for AST2600"
>> that is the root cause of whites lines on AST2600
>>
>> commit
>>
>>
>> bcc77411e8a65929655cef7b63a36000724cdc4b
>> <https://cgit.freedesktop.org/drm/drm/commit/?id=bcc77411e8a65929655ce
>> f7b63a36000724cdc4b> (patch
>> <https://cgit.freedesktop.org/drm/drm/patch/?id=bcc77411e8a65929655cef
>> 7b63a36000724cdc4b>)
>>
> 
> 
> So basically this commit should be enough to fix the white lines  and flickering with VGA output on AST2600 ?
> [KH]: Yes.
> 	You are welcome to tell me something if you consider there is other strange issue.
> 	Thanks for your efforts on drm/ast project!
> Regards,
> 	Kuo-Hsiang Chou

I've got confirmation that this commit is enough to fix the issue 
introduced with f9bd00e0ea9d.

So let's drop this patch, and submit bcc77411e8a6 "drm/ast: Create 
threshold values for AST2600" to stable kernel instead.

Thanks,

> 
> I will try to have it tested, and if it's good, we may want to have it on stable kernel.
> 
> Best regards,
> 

