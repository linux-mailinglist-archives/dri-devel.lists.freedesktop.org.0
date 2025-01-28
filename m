Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7EA20B39
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 14:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E30E10E1B4;
	Tue, 28 Jan 2025 13:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="jHRYBivV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD67110E63A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 13:20:36 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7b6ef047e9bso534808785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 05:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738070435; x=1738675235; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GOWXoYYRnWMsoeKK+VVuf/lMuv2V7GO+mfTTLFXfUSE=;
 b=jHRYBivVVkVDTe5D5aEc6CMgyOWp5Dnqomjl0jpUdtlsNZPWj9AsycMm3NKNDMVDL6
 ceAeDkv121kbek5mAlNZTfZ5uv5qKhfp0Ays7C+ZDJ9A2tNcmG71xAOCFGdL9Pmexz77
 rwVkSVhvIn1UJ5nJm1c8nmLpYyfLA0wTHVOGAvTKcouvERbH1pIZGo8onHF4Qe7TyRAf
 i5YAxNiAbF6ZOioNFSs7oZ5nSZMZLii6Hzbjj+TS8GUVnrvi5A7qrzfxpOFHYGbU5+sY
 kjjqDf511UIVp/71Sxg+KunyAYVnk8JoQb1JM3GdChhW5edBpfK8pQEkEBj2jZbnCbiA
 NWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738070435; x=1738675235;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOWXoYYRnWMsoeKK+VVuf/lMuv2V7GO+mfTTLFXfUSE=;
 b=WKuGPm7x7lI1O2694D5H0eZFjQR1OL7bLHyigPbtdM2hZ/nvIPMBl6QjwDmfhLZzGx
 yI7+QMByHaHDdmmOJVcqC8LSGbXkNNdSK/Ca7LaHW0ZBAUcnu9eaGjKLUDShCAZ/qc7u
 ONxDyIXhqMeK7Lt3IlOybwd2bc1pUZd/c4CyN5VU0zPhiAyUnmXAzyvuYnifyJXez4OZ
 7C3hyzXcRU9WqWXjqFkhJUKRf/a2eocUsm1LEYB5VXUNypYiKAcelB2daBbY65Oi6awX
 Wl8SuWr2sPnSo3ug/bRwESZHlyn57IcBf0oA564Qzzci9jZ1tHs+bpgEsvW9eFNj0ivL
 c5XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1MEwXDaqSwuYtot+IY9QXQySYZgIZiQPPZFj7gtOgmD00LMV9vNC4jL0BZmJT08i4N62u+lv7U7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1EmBgqPbVBTiho4sfBLK0ddcu8tkozEWR7MbSy0mnIcu8pNXF
 ThTRpO+PUpPTJTTkueuiZGnR4aoO+AoslGemY6NHSw2DkRmkwkMnjNZwQRm2Wjw=
X-Gm-Gg: ASbGnctbNpEi8Z9DRqc3yIL5PPQUwywg+pZfAOPbtrSfz3Le7gDxiQeqQPLJzrmK/q5
 HAqoWs2jMEVGDYJDjs6H5mLkn5J3q34Csi8zD6swsnQGGSuo1+Zmp23FGRh5UwACxqu3vdD32fy
 59jQnorBVjIEjb6ghHT8w9UgIoyONP/bD16+OEIBmcQy4S9LFvrKTA0XKek1/WWa0PG9E397Zvm
 OINIoAQtetl9JPQL1ftKXsmAV3SQrystp6gzFdjsK3tH6DC8D/wC3pAjCwHY85udpzvEhob68+2
 I2azKJJHKVhXejkdqDYbnJpikCZhOTnj2+6HmodfyGjSYw25rCSOIK2MyQ4bl2wSjQVa0B1FQLo
 =
X-Google-Smtp-Source: AGHT+IFfqsRD0FOVkdIg887UXRm977J4ky26yoqHXaGeXqELEj2EneWq+CuXUYKkdzvufPHaZSVAIg==
X-Received: by 2002:a05:620a:3910:b0:7b7:142d:53a8 with SMTP id
 af79cd13be357-7bff3fb4946mr402618885a.19.1738070435489; 
 Tue, 28 Jan 2025 05:20:35 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9aeedc68sm512887085a.74.2025.01.28.05.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 05:20:34 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tclW6-00000007TbE-14aw;
 Tue, 28 Jan 2025 09:20:34 -0400
Date: Tue, 28 Jan 2025 09:20:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250128132034.GA1524382@ziepe.ca>
References: <20241201103659.420677-1-ymaman@nvidia.com>
 <20241201103659.420677-2-ymaman@nvidia.com>
 <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
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

On Tue, Jan 28, 2025 at 09:51:52AM +0100, Thomas Hellström wrote:

> How would the pgmap device know whether P2P is actually possible
> without knowing the client device, (like calling pci_p2pdma_distance)
> and also if looking into access control, whether it is allowed?

The DMA API will do this, this happens after this patch is put on top
of Leon's DMA API patches. The mapping operation will fail and it will
likely be fatal to whatever is going on.
 
get_dma_pfn_for_device() returns a new PFN, but that is not a DMA
mapped address, it is just a PFN that has another struct page under
it.

There is an implicit assumption here that P2P will work and we don't
need a 3rd case to handle non-working P2P..

> but leaves any dma- mapping or pfn mangling to be done after the
> call to hmm_range_fault(), since hmm_range_fault() really only needs
> to know whether it has to migrate to system or not.

See above, this is already the case..

> One benefit of using this alternative
> approach is that struct hmm_range can be subclassed by the caller and
> for example cache device pairs for which p2p is allowed.

If you want to directly address P2P non-uniformity I'd rather do it
directly in the core code than using a per-driver callback. Every
driver needs exactly the same logic for such a case.

Jason
