Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29455F914
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E4A1120B5;
	Wed, 29 Jun 2022 07:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331871120B8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656488013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dA2eoSPtGttWxJYZGlfOcE/QeU9denwWrEKtVHSFEyo=;
 b=RjZzRQXEzUevNSu6VfUPeENuCjiAflugBKE+0cfUCRlXIpBVdVIGS4YDmWkDHcNEnodF8+
 rIjdx3nEI740BDTAgJMA/+0Eq9MxsSwPgJmoxJV2IGg/6onWSsP2XnQQTSrJCucHYUEV26
 2byZZM5eTTqV2w9n0D+DuZ29VIHMCY8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-KPyezmHcPOOuxKldGddvpg-1; Wed, 29 Jun 2022 03:33:31 -0400
X-MC-Unique: KPyezmHcPOOuxKldGddvpg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so8342593wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dA2eoSPtGttWxJYZGlfOcE/QeU9denwWrEKtVHSFEyo=;
 b=f2nUciS7bo/NF7Dy5B/3zJkuhwI3aWRt7QtN4n6zv7iku2v/cvtBRqxtYEna68kTzA
 Fq69U03Oimc2vik5abLWauWH5RTQJBCMOGZvd8/W9Y95lgkgiwr1vCwdt6aSf4Fc0a5J
 TNOgvtTO38QRsXgUmGq89JMgjZanSGBiS3c87aMVpuwWXHCnYWNeMffNkMEY3hNBdWYn
 bgV6qzYofbEErEks2/RlLESymFOq+J20RBwjx584z3U9LzD1Cm+YeZya1moz5vtBmZfw
 KMqWDKryIOTyWHdtrx1b+5+Qp52NlPchNU6dMuwV1VuoY8n5G9IzMCK94TpfRb9d57ui
 kO+w==
X-Gm-Message-State: AJIora9FjWZPDUH2oVCs/ZWGHeCtjc7RzTxVejzAmTZNHQJw593LsjMn
 mf2rzXU/jE/IOpSyNNqV3XfVnQc02hpgUy1Yode7QQ4ULd1Zgo1sbSz1pE3cgv7KMFK+Brw0q7h
 aUdCRgvuqCFFP+9eqKo7FxK5beMd4
X-Received: by 2002:a05:600c:3591:b0:3a0:563a:49d3 with SMTP id
 p17-20020a05600c359100b003a0563a49d3mr1926452wmq.60.1656488010106; 
 Wed, 29 Jun 2022 00:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uum8Hx2eoXPmPEzIAfJI+bxpHTzM8+zWRZ0znb96530kqbhcZ9rF+BBXjqVzGxgQ61VtlDlw==
X-Received: by 2002:a05:600c:3591:b0:3a0:563a:49d3 with SMTP id
 p17-20020a05600c359100b003a0563a49d3mr1926431wmq.60.1656488009851; 
 Wed, 29 Jun 2022 00:33:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:e600:d4fa:af4b:d7b6:20df?
 (p200300cbc708e600d4faaf4bd7b620df.dip0.t-ipconnect.de.
 [2003:cb:c708:e600:d4fa:af4b:d7b6:20df])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a7bc4d5000000b0039c587342d8sm2175038wmk.3.2022.06.29.00.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 00:33:29 -0700 (PDT)
Message-ID: <f00f9c93-c115-d222-dc8c-11493ccd2567@redhat.com>
Date: Wed, 29 Jun 2022 09:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 01/14] mm: rename is_pinnable_pages to
 is_pinnable_longterm_pages
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220629035426.20013-1-alex.sierra@amd.com>
 <20220629035426.20013-2-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220629035426.20013-2-alex.sierra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.22 05:54, Alex Sierra wrote:
> is_pinnable_page() and folio_is_pinnable() were renamed to
> is_longterm_pinnable_page() and folio_is_longterm_pinnable()
> respectively. These functions are used in the FOLL_LONGTERM flag
> context.

Subject talks about "*_pages"


Can you elaborate why the move from mm.h to memremap.h is justified?

I'd have called it "is_longterm_pinnable_page", but I am not a native
speaker, so no strong opinion :)


-- 
Thanks,

David / dhildenb

