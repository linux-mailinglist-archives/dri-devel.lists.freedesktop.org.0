Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F54654312F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 15:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6B910FE8D;
	Wed,  8 Jun 2022 13:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F117210FE9F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654694223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35IFJYFxAzFnBmyN6TQCYl3GgLH/bjCkWr2t2lYzin8=;
 b=UlsMkEluEMHkrZ5LIXqFMRsdLhnI7eQdNmnYJ/vTU/1Vy1pPe+rsarb63I56zzpAbF+HHF
 pDprs6hluy+tcr8RCC6oVSbpa66vYWhxl4njo+MBCnU+pDVMeVDNv+naZgGHukY5hox0AR
 +nr5BQ/Oz0zelmO/vFZzdkq2yyw5tXk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-FQe8ik6dNcy3GbcZHtOpXg-1; Wed, 08 Jun 2022 09:17:02 -0400
X-MC-Unique: FQe8ik6dNcy3GbcZHtOpXg-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so2684512wrb.20
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=35IFJYFxAzFnBmyN6TQCYl3GgLH/bjCkWr2t2lYzin8=;
 b=lOYOZ3pxJDb2f9kpDcUeCdk54YkHxP5DxpFAprIpAKIfv3n2g6Sv6307a2LURSK+Yv
 negZ+k3G8kr3udCKQxhcS/E+F8QoQFb0+n5aTRLLVMmM1srA1078Nl6jvqHdVFtuk8Om
 gflfMOfnaHylORE/9T9fZb8vbG5s6DB2xyn1xIX+cUcJ8Y+HXdcCm3Fj0tN7SMttWtWN
 /sLPogOzEYyil9f1PrNSzCMzIOJl54hBfmyhQtXN8F7P0tbwkE8/8O1Mgii8CG2xVoBS
 +annHyJjPqpkbsre5i6vpxjlX16nuiWV23kfwDKMSkjCraL96KDOd/r4w/EKfgwUcIvs
 /rIw==
X-Gm-Message-State: AOAM532uCKkE1aQmP5/Ui/QyO2Di1LqhPcI0Ekm6reWd7nbfx1cCB13t
 rT+YomHsa9Mlrh3zVcu7iYikYK71TuG7MrkZPt2h0Fb5ZeJKMI4xeuvBIICfaQ4QK4FQrmd6wn3
 GqC+4tRKFPNKAvarNQP72ETQdNe6i
X-Received: by 2002:a5d:6786:0:b0:215:3cb5:b16c with SMTP id
 v6-20020a5d6786000000b002153cb5b16cmr26148268wru.6.1654694220528; 
 Wed, 08 Jun 2022 06:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb0xlaZX8diXj5CVPBq20XL/dK0cPt+ajXfdFa+Plm9ZItKdQioKLmDwJrsL0wIlM7Gr4S0g==
X-Received: by 2002:a5d:6786:0:b0:215:3cb5:b16c with SMTP id
 v6-20020a5d6786000000b002153cb5b16cmr26148250wru.6.1654694220293; 
 Wed, 08 Jun 2022 06:17:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfee47000000b002185631adf0sm3927529wro.23.2022.06.08.06.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 06:16:59 -0700 (PDT)
Message-ID: <c99f305f-ac4d-628b-b092-920af767a2e4@redhat.com>
Date: Wed, 8 Jun 2022 15:16:58 +0200
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <PSAPR06MB4805B23B053F80C0F23A8C6C8CA49@PSAPR06MB4805.apcprd06.prod.outlook.com>
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

On 08/06/2022 10:09, Kuo-Hsiang Chou wrote:
> Hi Thomas
> 
> Thanks for your suggestions!
> 
> I answer each revision inline that followed by [KH]:.

Thanks for reviewing this.
> 
> Regards,
> 
>          Kuo-Hsiang Chou
> 
> -----Original Message-----
> 
> From: Thomas Zimmermann [mailto:tzimmermann@suse.de]
> 
> Sent: Tuesday, June 07, 2022 8:03 PM
> 
> To: airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch; 
> jfalempe@redhat.com; regressions@leemhuis.info; Kuo-Hsiang Chou 
> <kuohsiang_chou@aspeedtech.com>
> 
> Subject: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
> 
> Include AST2600 in most of the branches for AST2500. Thereby revert most 
> effects of commit f9bd00e0ea9d ("drm/ast: Create chip AST2600").
> 
> The AST2600 used to be treated like an AST2500, which at least gave 
> usable display output. After introducing AST2600 in the driver without 
> further updates, lots of functions take the wrong branches.
> 
> Handling AST2600 in the AST2500 branches reverts back to the original 
> settings. The exception are cases where AST2600 meanwhile got its own 
> branch.
> 
> [KH]: Based on CVE_2019_6260 item3, P2A is disallowed anymore.
> 
> P2A (PCIe to AMBA) is a bridge that is able to revise any BMC registers.
> 
> Yes, P2A is dangerous on security issue, because Host open a backdoor 
> and someone malicious SW/APP will be easy to take control of BMC.
> 
> Therefore, P2A is disabled forever.
> 
> Now, return to this patch, there is no need to add AST2600 condition on 
> the P2A flow.
> 

[snip]
> 
> [KH]: Yes, the patch is "drm/ast: Create threshold values for AST2600" 
> that is the root cause of whites lines on AST2600
> 
> commit
> 
> 
> bcc77411e8a65929655cef7b63a36000724cdc4b 
> <https://cgit.freedesktop.org/drm/drm/commit/?id=bcc77411e8a65929655cef7b63a36000724cdc4b> (patch 
> <https://cgit.freedesktop.org/drm/drm/patch/?id=bcc77411e8a65929655cef7b63a36000724cdc4b>)
> 


So basically this commit should be enough to fix the white lines  and 
flickering with VGA output on AST2600 ?
I will try to have it tested, and if it's good, we may want to have it 
on stable kernel.

Best regards,

-- 

Jocelyn

