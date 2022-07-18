Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B554357802A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 12:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974BD14AE64;
	Mon, 18 Jul 2022 10:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8549FAFF17
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 10:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658141437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GELRdaJJQzNGu42HwXNvH14oS2HiNBL5HZCcGuN9ch4=;
 b=HjG6XownoJIGB9yL6tcxVNkAa/mj2slwD0GF7RDg/AuUCHbonqGSa2lOjrE+zjMWPtGF6Q
 Qa29JmKrw2P5FI7C/1MpwoMDYvkhLON6GVhNDSmAV5LnuB5L62GdiN5RQjwcmGNDU5uXH8
 OSJAY1w7tQ2bbxrNdeVKxL0TI7sInQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-y3PHQDM0MZq4zGZyrO9bfg-1; Mon, 18 Jul 2022 06:50:36 -0400
X-MC-Unique: y3PHQDM0MZq4zGZyrO9bfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n21-20020a7bc5d5000000b003a2ff4d7a9bso4085038wmk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 03:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GELRdaJJQzNGu42HwXNvH14oS2HiNBL5HZCcGuN9ch4=;
 b=uDy+fLFuPDiRZ7dD7GuDZ3V0Cnq6zGo5QSNvjIsMP88FLMKeW97Lm29IDhu21SZn1S
 Bu3OC7oR4Y07bb+t8GhoOtkGTSUJVCrWh4QJGr+p/2RMsMi+6IcvHvvQOqAqhPDqsI3f
 7V+rj7aYOz4GQU49No3VQgrJcG40u/zVSexmv7L8V17K10I7Smfm+/0WxZipUid6K1xT
 74SWOPDpaB6R8iZxbH1Wasf+XP1w+PZq8hhoJPI6qV4mc3KAPuJ+Zh+QlhPHJJCEQuEd
 CNHQcmYQj8wf7N9t8kFhdldGVT72Gfr5iXyw7DejazSn8tXnAfkEfX9aqm2ltUAK4ZvX
 +IIw==
X-Gm-Message-State: AJIora+dqp/TzlWVsQ9ichRSe0FextlEIphbr3puSlWDIWeQbey/CZhC
 ImjZkR3FthuYMacELUDxRO7PU6C+vQd1bIzw4zjJLnTJlWj19sA87tlVHJ2coBQZwP6vJuJEqjL
 +RQrPj01ptGIFpxJDjW5QITuj12Gp
X-Received: by 2002:a05:600c:4f43:b0:3a2:ee79:2dd5 with SMTP id
 m3-20020a05600c4f4300b003a2ee792dd5mr25587649wmq.143.1658141435082; 
 Mon, 18 Jul 2022 03:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3TjHUzmOv6ybcclnybN9UPY7Bi+An5DlmuQSPxVe4SOYbaL5tYKsRuXtw0aDU3ti4mHhI6A==
X-Received: by 2002:a05:600c:4f43:b0:3a2:ee79:2dd5 with SMTP id
 m3-20020a05600c4f4300b003a2ee792dd5mr25587621wmq.143.1658141434838; 
 Mon, 18 Jul 2022 03:50:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:7400:6b3a:a74a:bd53:a018?
 (p200300cbc70574006b3aa74abd53a018.dip0.t-ipconnect.de.
 [2003:cb:c705:7400:6b3a:a74a:bd53:a018])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d6445000000b0021bae66362esm10526543wrw.58.2022.07.18.03.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:50:34 -0700 (PDT)
Message-ID: <12b40848-2e38-df0b-8300-0d338315e9b2@redhat.com>
Date: Mon, 18 Jul 2022 12:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 02/14] mm: move page zone helpers from mm.h to mmzone.h
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-3-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220715150521.18165-3-alex.sierra@amd.com>
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

On 15.07.22 17:05, Alex Sierra wrote:
> [WHY]
> It makes more sense to have these helpers in zone specific header
> file, rather than the generic mm.h
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>

Acked-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

