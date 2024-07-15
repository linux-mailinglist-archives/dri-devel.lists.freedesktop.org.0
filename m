Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D793109F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A5810E058;
	Mon, 15 Jul 2024 08:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EdOJoxUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6E810E058
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:52:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ee844bb5d7so5121821fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721033548; x=1721638348; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zFtI2KoVZL8zpxDmxsiji21hGTTPGlau5bq5V67S++I=;
 b=EdOJoxUkmd1JwnInuo9g9eXYDVf9RpFEjTKaKQW2+qQveXQhcYF/k6/R0TzB4Noicr
 VKL/nB+oTrPdoOWPNvYHOlItugDFnKA7HzkKW86a6pbZQIFXNW9RE0XY+1gsFkDSJ1GQ
 5V8XQmMa61d7elLQhZFQlV8EeZ32EgCDpW/Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721033548; x=1721638348;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFtI2KoVZL8zpxDmxsiji21hGTTPGlau5bq5V67S++I=;
 b=GZg9/u/DrCHNNeGGK/PK9/91qvDmKivfoDgRsVjOaGxmAPmJGW/hDwhCHpSlWujhyH
 4CRovl5Q7iYITVLQeH7CVn/+f+pUt/WtXf16oqAmuQbSSB3KvGXSMIsEVCyXWUe3KWbH
 xOSPXN0o0PEzgAyDCbVq5fx50py64YmRWC0LOoTZeuM2L7Hu+sGGG+ylymmdkNUXwzUr
 Eb1n+HM2G5caPCKHbi7toKP5JVw6AdZzp0pehi5NXepOjie4p7sBArmcJSPDQSpQ81Iz
 XT8rySiuuZ1wsCBnBihsUkxda6b70a10uI5qRev+JUKuxyOB6gLJDtsBNPI5ElqM7EiS
 1Xug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV56DLmGUCex9vTsKrMccuUbhFIaDc6kvcAjvxVP+X0yNQTPoRZ/UHh7jFfBJGE4YM6T4Fh/k9P2F7kKm8zV/JsVAaItCJotvmvsl67Uni6
X-Gm-Message-State: AOJu0YxU4vuwemT1rMuecwVhqGnQfSPi4U6V89PrRRFhthxhnY8zRfLN
 2FSeWHpWv1wWwAfQ0tISgMfr+mJhXEc+vGIc4xEDBOSOWE6I/m8WyOlsYzR/Y98=
X-Google-Smtp-Source: AGHT+IHmjsFZ+qyY6qOuWBh0tmFYh3x5Sbnw2EXZYOBODf4NfNY2g4S0U+DdM2RcQHVCl5EcvZtu3w==
X-Received: by 2002:a05:651c:198b:b0:2ee:91b7:860 with SMTP id
 38308e7fff4ca-2eec98be531mr64924681fa.4.1721033546536; 
 Mon, 15 Jul 2024 01:52:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc306sm113442395e9.30.2024.07.15.01.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 01:52:26 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:52:23 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Lei Liu <liulei.rjpt@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrei Vagin <avagin@google.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Daniel Vetter <daniel@ffwll.ch>,
 "Vetter, Daniel" <daniel.vetter@intel.com>, opensource.kernel@vivo.com
Subject: Re: [PATCH 0/2] Support direct I/O read and write for memory
 allocated by dmabuf
Message-ID: <ZpTjR-7dabdyREXS@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Lei Liu <liulei.rjpt@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrei Vagin <avagin@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 opensource.kernel@vivo.com
References: <20240710135757.25786-1-liulei.rjpt@vivo.com>
 <5e5ee5d3-8a57-478a-9ce7-b40cab60b67d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e5ee5d3-8a57-478a-9ce7-b40cab60b67d@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Wed, Jul 10, 2024 at 04:14:18PM +0200, Christian König wrote:
> Am 10.07.24 um 15:57 schrieb Lei Liu:
> > Use vm_insert_page to establish a mapping for the memory allocated
> > by dmabuf, thus supporting direct I/O read and write; and fix the
> > issue of incorrect memory statistics after mapping dmabuf memory.
> 
> Well big NAK to that! Direct I/O is intentionally disabled on DMA-bufs.
> 
> We already discussed enforcing that in the DMA-buf framework and this patch
> probably means that we should really do that.

Last time I looked dma_mmap doesn't guarantee that the vma end sup with
VM_SPECIAL, and that's pretty much the only reason why we can't enforce
this. But we might be able to enforce this at least on some architectures,
I didn't check for that ... if at least x86-64 and arm64 could have the
check, that would be great. So might be worth it to re-audit this all.

I think all other dma-buf exporters/allocators do only create VM_SPECIAL
vmas.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
