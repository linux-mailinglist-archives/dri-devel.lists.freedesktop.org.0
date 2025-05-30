Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5AAC8AE3
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 11:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AC310E80B;
	Fri, 30 May 2025 09:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OsOA5HEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDF810E80B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748597631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3HsXX6R0HPP/biqLepMPHpr/VTNhNhquA8c3ePXroJI=;
 b=OsOA5HEF2k818s0fAygUVueKPJTmp+zsbpd/ZoHS6GfaAqroUa1jcLQlQJKk82VfAvv/Jz
 oTCx1D2XsmATDBAQMqENQvdvZoVUIlP+MwRlroKwmRsbWTu44OUZcBSy9TxRFv5YDqxOUT
 UhN0Hyu1m1LJWBcsOeeRKjny2u6RYwQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-he2kuGmDMheHqNtBYLd_aA-1; Fri, 30 May 2025 05:33:49 -0400
X-MC-Unique: he2kuGmDMheHqNtBYLd_aA-1
X-Mimecast-MFC-AGG-ID: he2kuGmDMheHqNtBYLd_aA_1748597628
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4cceb558aso879471f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748597628; x=1749202428;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3HsXX6R0HPP/biqLepMPHpr/VTNhNhquA8c3ePXroJI=;
 b=nPJq2IXxKfgGUhvWTKnrb2p06kChiemPADztJqvAfrbfEcDt93fntL2hmH4sHzYN38
 R1b/Xa9NryjXjqf45ZALxaGfVpjSQCeI/qbo8zIc1+OoLQ5jQBaeua4eOPXaKFkalu3f
 FeFbt8KQclZiVYZ0oBrRvOhIjZa4E7rdka+L6Dq0ydTH+jKzdc77+WClhyGs8BQ8dbzB
 X5FA9qyyluq0EcympjU2EJ91LuoDvD/ey0N9Bdq1aCvoCOOwoi4WTOWIlc82ZjjNQPVD
 lrXme/yvOjQK1OWKUPBCITfeGBxXLTa0mZQUJpBz5zlrxgx+SF1UKSO5WavfY/ZykKrN
 M4TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqNut/zdBJdkknwUOQ+SGcn96/22WAnljzKsy8ZOSqH9kn/Tf8xw0PjVpSflMgYPA04hu1ENVpaGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuMv4JOgIRD2mzy68xpBSyhrXISXEo79xWX6J8+whh9Htxq4dQ
 JN8Yqh5zhRRAu/Ws/krv+M3Q9Gjhn+uKO0NOHPhjIiF3OYt8GbLymgw24SlCCyjTC9FnCpH2Rnr
 GrJeEzuuG8THhMwcFocO49rkB1cMCHk+8e5GiP1QZ7YeFt58kfCtSZU5RfxrnFdgfhUB7dQ==
X-Gm-Gg: ASbGncsZJaPPSgd1xIk/TO6qAHFo2Q736dz3mAb8IhcAjv+eWxwgV1b/5ZXalJqN0j7
 zBkseeGZTKiK0L62cxFrnStctv4+L8lAabiXaQhmL25rBYAkwnBXytRlxd/Jkuy9x3Geb8BIRGA
 GvmMuLtnm0+NJFFeJ8W005K/KSBAC+f2kMarWJrTCpwx1k/HCAjKNybe9VxKOqNIwFHm191vNLO
 YKxKCXgi8ygmYTFAzJjJBG1C8jBxcjKh18RKWtif0J6A5dO/e1hQ3jLPhEihaby0LG5PEGbAiXJ
 Ar0O2WW2NXap+eYXrNffgyTI61F+HL1Q7cS3rS6cppNL6SS3fW154zmqkECZfEpaavMV6C16bWt
 sLp+lPta8eeIVQaIbMxYd3OIdHoaF7QWcQ6m4js8=
X-Received: by 2002:a05:6000:188b:b0:3a4:e393:11e2 with SMTP id
 ffacd0b85a97d-3a4f7a366bbmr2070888f8f.34.1748597628399; 
 Fri, 30 May 2025 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPLwoEcfpG65ruS1QubjzGQLrQH9J6REe/EFj1LtU5rHML/KjwauHHFCNN+LVLagp2fysdSQ==
X-Received: by 2002:a05:6000:188b:b0:3a4:e393:11e2 with SMTP id
 ffacd0b85a97d-3a4f7a366bbmr2070847f8f.34.1748597627996; 
 Fri, 30 May 2025 02:33:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee?
 (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de.
 [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00972d9sm4415633f8f.64.2025.05.30.02.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 02:33:47 -0700 (PDT)
Message-ID: <bbb19f59-54bc-4399-a387-1df9713fc621@redhat.com>
Date: Fri, 30 May 2025 11:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pl4vOdeyNqVCHyp2JQd3faQtC6TmqVWjJkdRvb8vEoI_1748597628
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.05.25 08:32, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---

With SPECIAL mentioned as well

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

