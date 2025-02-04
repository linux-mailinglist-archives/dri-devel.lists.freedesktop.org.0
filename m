Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4DA27AFC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 20:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921D710E6EF;
	Tue,  4 Feb 2025 19:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="J9+tpwVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0433710E6EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 19:16:03 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7b6f1be1daeso569884685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 11:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738696563; x=1739301363; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RbSThg2+IgOzUPVYO+O03rGdKt6FNxSQQgDDlA3zKuo=;
 b=J9+tpwVO+/pAXCH1VVlOSjZjhTEFmK7YfSYqNLw5g27HwlJWgNBkVtNwvQOyVe590p
 xtgEraHkkAMpdoCa1DAKsvWXcKadgQaBgW+fRp+meilxFHQqNzNNUz3FEOMZdrVPvUbc
 rae6uRiNZHARxoo6qQifdqQ5WTNHrlQfXU3unXLV9NbeLVM2xdQCohhI/BLLdJZGPxh2
 QkSdk3rme4yc2xLq19ub51GDQbVC1axAvXi8CP2ZxTHNM3E0wB3aJxWUlNN3YoMoqfOI
 2xgY7Qt5Ony4bIRrv8Vp+fQbj6RCwtMAM8gEM+UpC//uhTPXa+WGBpDHftMbrvtPoy/E
 nJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738696563; x=1739301363;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RbSThg2+IgOzUPVYO+O03rGdKt6FNxSQQgDDlA3zKuo=;
 b=w47fbi0QiEldwxmM+O6zjjyYg/3/hlTNEnzTUS3NnBIGmH/eZ2kvgVhBQogxkfWFBG
 jkuOLMyrW6cN3KRxywbJ72S30upnflZ+Jw+oZ+CWdirbEkVp5h8nfKWILCVesymo570p
 FBgeF1vRaQBcsubwDTuOXuPZ4Z1gUJiY1arT13DW0NITJ32DAkc68sJWbRmfv6NkHYmB
 hE1GhSHWwVrCEy0xHMhT6jIxigtu3PM5U+LiO7nGrk7kfnw+vIVTNkMxUPCQ6jMTwety
 JxXEgWK6wrhoZvex6drZ7jC0swyiE/omVXZ2IQ2pjd2f7+jiInjKc0e7f1fNMRilkHOw
 lsDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqGUrpcIf+WFf18BBQ+vFBv6Sj7vgutPhNlTV6fDVhZwJlRGd3jw1BcrFGgWexGSzZkvsC25rjP6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeR9vuISm4FgCiuMwtjJyDRmf8sqhSZWemcT3L5f6nLDfsDODo
 e6fjhMYA/eZHun+NNXhFfSqQAaAShr6M6h9QRUEacEMUb60aIu28lqdqdsHgcDk=
X-Gm-Gg: ASbGncuPlJf2g0Rj9FIHaXDK5F9xfi3mAbgNLwQxbb/zcuFmSKQXfwqIIMMrkhSzZSW
 janpuDi+5jQmf0DkxRT4ByanaErNrPqi5wpMhqlWh7KkqiMH0ExingjDZKq6cB9ZWqdIiiCeiP3
 hB9A65feW06g5mCrqmbg+fJf2HAbCCVU/1jvW6jswH0W8QHGCK9hAQkASdZ5tOl8RkyLpDxscqe
 7pfMOVmPzQuURTwxcYm9FU+KI9OeTCczhdCDs5LhtGAgEOFCnhiFFNPYGWuPduuFMxL+EsFQZGz
 AdNQ1IlHRp7TYBUBAzuDTVORMRubRhSYXBLuo+jEaT8ttI3QqLn3hQbYQd1DbO2c
X-Google-Smtp-Source: AGHT+IFDaDGZr7b/tFbMEfs7niyU8J8dtoT91Z8F6Kt1MP6P2VK98JCkXIPoyuzy/DdpTLj+ZRuWhQ==
X-Received: by 2002:a05:620a:2710:b0:7b6:ebc6:181a with SMTP id
 af79cd13be357-7bffcd9997amr4139068785a.41.1738696563125; 
 Tue, 04 Feb 2025 11:16:03 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c00a8d97c2sm670296085a.64.2025.02.04.11.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 11:16:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tfOOv-0000000CUOy-1LgY;
 Tue, 04 Feb 2025 15:16:01 -0400
Date: Tue, 4 Feb 2025 15:16:01 -0400
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
Message-ID: <20250204191601.GK2296753@ziepe.ca>
References: <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
 <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
 <20250204132615.GI2296753@ziepe.ca>
 <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>
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

On Tue, Feb 04, 2025 at 03:29:48PM +0100, Thomas Hellström wrote:
> On Tue, 2025-02-04 at 09:26 -0400, Jason Gunthorpe wrote:
> > On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellström wrote:
> > > 
> > 
> > > 1) Existing users would never use the callback. They can still rely
> > > on
> > > the owner check, only if that fails we check for callback
> > > existence.
> > > 2) By simply caching the result from the last checked dev_pagemap,
> > > most
> > > callback calls could typically be eliminated.
> > 
> > But then you are not in the locked region so your cache is racy and
> > invalid.
> 
> I'm not sure I follow? If a device private pfn handed back to the
> caller is dependent on dev_pagemap A having a fast interconnect to the
> client, then subsequent pfns in the same hmm_range_fault() call must be
> able to make the same assumption (pagemap A having a fast
> interconnect), else the whole result is invalid?

But what is the receiver going to do with this device private page?
Relock it again and check again if it is actually OK? Yuk.

> > > 3) As mentioned before, a callback call would typically always be
> > > followed by either migration to ram or a page-table update.
> > > Compared to
> > > these, the callback overhead would IMO be unnoticeable.
> > 
> > Why? Surely the normal case should be a callback saying the memory
> > can
> > be accessed?
> 
> Sure, but at least on the xe driver, that means page-table repopulation
> since the hmm_range_fault() typically originated from a page-fault.

Yes, I expect all hmm_range_fault()'s to be on page fault paths, and
we'd like it to be as fast as we can in the CPU present case..

Jason
