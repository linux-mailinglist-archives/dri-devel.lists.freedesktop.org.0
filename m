Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLPXFifNjWlM7QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:52:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A812D969
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8110E72F;
	Thu, 12 Feb 2026 12:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="tv437FMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8610E26F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:52:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so62201665e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770900768; x=1771505568;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4Kxk/oZj66kgQZma0vQzJuBIOHCjFotulhU3mIzhZds=;
 b=tv437FMoDwgY/rIWrFtprjBf7K0Y3RiuvJSUj/VCdq5iFa0300LvYoN8SZUN2s25AP
 P2qTZ7odYdssX8Z6bJUgenMpPh1l2OXzGFMTJMzj1S+LZP592zjlK5MehWqAEeC469eo
 4Jl/W3ykf0xJyt6rbkQrYuHCWinemXeLycgwqSJMdJrh7WDdyLTtyeJ6YuDIsv8/0kuz
 777e5uxENaKRTWCWJPUkI9cf+rvOURHgPJk3UbaVb95lUTFqVDMDMJuz42DB807M7pFI
 4A65o793KklcELDVi5sj1Q/Vbj5Z93bFJoM/UITf6qJJGc85584nIs9IKs0FIrAfsrw7
 +jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770900768; x=1771505568;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Kxk/oZj66kgQZma0vQzJuBIOHCjFotulhU3mIzhZds=;
 b=iXRCUqAUsqZGf7IcHJia6jZ6c5c8DDSPCtsCkfk4hei9XI4hn9wdxFfnAJDkxtDRfr
 iwZ4GyaVNrc2bPkUp06V1d++zyMo44lJMag86Ljvw1xDr2M8zdZLEM7H8B6MXG9BgvsQ
 E+HNcdEirydJawyNknE8bYJ4Rtlal+vAqjViibmehlFXYG/JPNn9oElt2o+/zbYOrUc/
 m0hN685QAenFUnQx9zxO7aTrQfy8npvudipv24i/vSRDr96OWTKHRcjTUOatJgVpskrF
 sGq4XNljDdfv9HCy3/a+Nvib2UKs+GpQgb20pBrrfxACj5Cs9oO4lQj+proxjrsCaxxa
 zPVg==
X-Gm-Message-State: AOJu0Yzi2vnYKkUU8/bMjeOIS93lXK8Gc/z/OR1eJw2xA08hoNUHbjaX
 7NXOlc2S4LgnUnw2lshWjMY535zNHtdTX9Q8pVMoJIude/W5UanDQ49r1efYN9jkMDc=
X-Gm-Gg: AZuq6aIE6MzWzuhmWDOj5Tu9EeFwFwrnMSLSd0SeuCQNYTZAmJ3G5zj8NIFdqdSL9qq
 DiHpo2i/oqelp6hVzakCuqAydg6nH4Bc6r3E412BzdVnrsN1NDlPcTCDkBWc8VvgxbLS3hHt6NK
 D4g9asjH+lv+qLzBIhWhbIimsor4Ix528BsvSbyXvwo2YjDY02wykTkZoZPtPni1Xhu1aUWkLny
 GIUWtFy94c8ouIqz1KRZ09Bg5drYQXjIRG3hs0AGFL5240YP5hhUEi19PU9K4dBvkToOfqMQneU
 FiPkxDA/PrE2LkPEdr1YYaGUjkx/WIuAMvUUAGPq0oh3cwKszW69R3pERO3so3WdLwn0AjCahlo
 ys9n8OMfarh6FQm87+z5Hr58tfF5yHFoJdPUZR+Fn68mE5VlhK6XycJlD1k8BvnCh32FlA2QUGA
 2wRwR9GG2LUOe22XuS6GqQof/n6l+H2BQ=
X-Received: by 2002:a05:600c:348d:b0:475:dd9a:f791 with SMTP id
 5b1f17b1804b1-48365716704mr34218785e9.28.1770900768396; 
 Thu, 12 Feb 2026 04:52:48 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba7b8d9sm40786535e9.15.2026.02.12.04.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 04:52:47 -0800 (PST)
Date: Thu, 12 Feb 2026 13:52:44 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, 
 christian.koenig@amd.com, robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, 
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
 thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
 suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 1/5] dma-mapping: avoid random addr value print out on
 error path
Message-ID: <magsa5bqxraftni5z7ixrwfojh3htpws7bhiebj4rdtqn4ewce@rnf2rzfelqim>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <CGME20260209153816eucas1p22befaa2c5ef3c6d5e67956eea08424ed@eucas1p2.samsung.com>
 <20260209153809.250835-2-jiri@resnulli.us>
 <621783e8-d77d-4f29-bda0-ef487dd27b5b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <621783e8-d77d-4f29-bda0-ef487dd27b5b@samsung.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,samsung.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 8E3A812D969
X-Rspamd-Action: no action

Thu, Feb 12, 2026 at 12:03:49PM +0100, m.szyprowski@samsung.com wrote:
>On 09.02.2026 16:38, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> dma_addr is unitialized in dma_direct_map_phys() when swiotlb is forced
>> and DMA_ATTR_MMIO is set which leads to random value print out in
>> warning. Fix that by just returning DMA_MAPPING_ERROR.
>>
>> Fixes: e53d29f957b3 ("dma-mapping: convert dma_direct_*map_page to be phys_addr_t based")
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>I will take this patch when v7.0-rc1 is out, as this fix definitely has 
>to be applied regardless of the discussion about the remaining patches.

Makes sense. Thanks!
