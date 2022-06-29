Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24F5609B3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E1610EA7F;
	Wed, 29 Jun 2022 18:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D7010EA7F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656528516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZM4Ql5QJUmiVq6/iTZYAWyD16J7WFBV3CLn4iAwAjY=;
 b=BfvEZCNOTB+YF7/IhzVUlGb2PZwTIBKJxsjK8c4BNw6Nq5hsA6Hrox4Tfj6n67y80tY9pA
 uH199LONbusryETCmPSEWN9hs2mhjuYToFnGtqZJRQAvIt73lJeGzJFkJggi0G6uekbaXt
 GM1DMMShu2dLf5HOuL1sFXVyEJcJPZM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-4FJmIyi4Oz-lsIRgF-AGNg-1; Wed, 29 Jun 2022 14:48:33 -0400
X-MC-Unique: 4FJmIyi4Oz-lsIRgF-AGNg-1
Received: by mail-wm1-f71.google.com with SMTP id
 t20-20020a1c7714000000b003a032360873so146312wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ZM4Ql5QJUmiVq6/iTZYAWyD16J7WFBV3CLn4iAwAjY=;
 b=gfxP0RSWUlCQDmD7dmunzXSIsQESq8G83WO13jdfY7x+sDFIybZDeMtM75WOmyZim5
 SNNHHzVnat19x58rPE+ynN5NcavsS/DpcTa3NqhuKvDpgEMMxRWd6tDjw/XNvpfSGNp6
 QCkBR9R5gKOTDY7eRNAdfxP0PEWV/9+xLa7uDqbJs1MaY27YY09rl+8kj9PWMZdM1jeg
 w+MlZRI7OakE5oSfb0xSl30aZVPc+B2KC0wMbNcHbnUQvZlFtblHGoEhep2UjzvDaKCO
 JY9Ei+D4y1f0wbPxHiCrFmiE5HNkhoY+tCmqXcWMTCdK/nWhgvCxwYLbMkGqe2tZI/2N
 +5kw==
X-Gm-Message-State: AJIora9kkCBdxzGU/2aXwY4Jn7JIljP1cDqb95G5c7rCvwaL+WK26Rif
 wm15LtVNqfTHQwd2njhBSE5ZTzlMqAv+6d0iUj2WHbIMcS9aiiWHgHvx4PhM/TZiw55qQZI93VN
 ADAOLY3BG8wc8NGo3rvO/JAd1plak
X-Received: by 2002:a5d:688e:0:b0:21b:9d51:25d2 with SMTP id
 h14-20020a5d688e000000b0021b9d5125d2mr4756597wru.286.1656528511921; 
 Wed, 29 Jun 2022 11:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvKQZkINfbcfHGdv/ByN4E2v7ddXq6JGPQGqaW4FGF/wVw1dJjo/vdI/EF/pOq03d27lnmag==
X-Received: by 2002:a5d:688e:0:b0:21b:9d51:25d2 with SMTP id
 h14-20020a5d688e000000b0021b9d5125d2mr4756580wru.286.1656528511695; 
 Wed, 29 Jun 2022 11:48:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:e600:d4fa:af4b:d7b6:20df?
 (p200300cbc708e600d4faaf4bd7b620df.dip0.t-ipconnect.de.
 [2003:cb:c708:e600:d4fa:af4b:d7b6:20df])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c3ba300b003a039054567sm3206358wms.18.2022.06.29.11.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 11:48:31 -0700 (PDT)
Message-ID: <2e3e1050-7fa4-106b-9c80-6321afc5ac42@redhat.com>
Date: Wed, 29 Jun 2022 20:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 02/14] mm: add zone device coherent type memory support
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220629035426.20013-1-alex.sierra@amd.com>
 <20220629035426.20013-3-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220629035426.20013-3-alex.sierra@amd.com>
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
> Device memory that is cache coherent from device and CPU point of view.
> This is used on platforms that have an advanced system bus (like CAPI
> or CXL). Any page of a process can be migrated to such memory. However,
> no one should be allowed to pin such memory so that it can always be
> evicted.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> [hch: rebased ontop of the refcount changes,
>       removed is_dev_private_or_coherent_page]
> Signed-off-by: Christoph Hellwig <hch@lst.de>

From what I can tell, this looks good to me

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

