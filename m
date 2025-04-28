Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD1A9F5B7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454ED10E60F;
	Mon, 28 Apr 2025 16:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MLJ4Hp8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3954210E60C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745857470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KRdiWHlG77Us6l2oFM6nu2eUggr09dOOElY1pvowm4s=;
 b=MLJ4Hp8F5RFKSW0BF7YO4Kn3HMm8Dq/wqN4YYrfN6kIq76H/xdt7XABVVWuwm8KYMFDAQd
 xWnvMAG8H3SFNNzMgIfxp64sYvDXC2Ofca6UTUmA45y6BBTGZA4KOGfjxaSDcFUNtaWZ7z
 uGhYVAvV+nn5qoaRf2bIOAzBr61EjAQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-WMx6BvS6PI-mEnntNB6MEg-1; Mon, 28 Apr 2025 12:24:27 -0400
X-MC-Unique: WMx6BvS6PI-mEnntNB6MEg-1
X-Mimecast-MFC-AGG-ID: WMx6BvS6PI-mEnntNB6MEg_1745857467
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4768488f4d7so70275521cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745857467; x=1746462267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRdiWHlG77Us6l2oFM6nu2eUggr09dOOElY1pvowm4s=;
 b=gOv+xrhnH6qv57cVe3HntBfSmBeOKtqDzKOudDHeOJOiCqxiahKgwZIAHdSyLBhYWL
 x4tKzVuQVmN5xBE0+nSjDWPe5ndgcXtmCYalIvuivxUdJeRvT/RpAEiaO/gIsntXEBCK
 Qgj/kdLxSKbQWMqtLVHxOdH/Z8F8INLbnZvXuFRodrMsklG66E8A+ege8EkoambE/fOO
 9z9XbFfMjAo1m9ybmt1U5US+MX+KjAZ4gYeh+gpIOT5DvvcerNQ1HaPc4F9pzHiPc3Hf
 eXNFk2J4oWtX2/ZPrGcARDKbkMz3NqnyOx721zOMKf70ECcvhg3kKv2LwvLw9SW47/jD
 HBDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOudEqbI5VM4sj8bAXFx0INGXI7lWUf7+yaB2hOE5wT9sVHaaTBBLJoL3viHPEVWFQ71n4hhIEOE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsuLBoqm/68ul2C2/e1HsXOq7TfvterMxHsilHMK9oINkuoE6s
 e0ceKgre0CstSNYDLx1C23r6wErHgqEoEXA6a7hIK0mK9KnO8iUWCmqeQGOu41/9/GrB5/sLzAw
 z+aLR/7xEni7y51rnkz92+pxLGc+GfydxpunYH91Kt6TwAL18ogcqTB7tRJjVw2K0lw==
X-Gm-Gg: ASbGncvsIgMRTTuDzlVcZmm/pfWbGU3Ah1KDRILAzSVBXX7RSXsGnQRn04CYiFlre09
 h7iyekgFtEczgbuvwnAXU5Qc+50okCkWtlyGnTpD/fR1hMVP6r0CrrY3sHH/fcZCkjpgB0CUE9g
 8cOQfHPt+hT+DKhomC5xs2NzxMbz4LVlfxOyfZsKY5qikTr9RGVWjGgbl9lHnAH2ai+OWfrZmOG
 u86I0z0+FnhUZwkAWIfV26P/fjjwQmgLyFqqVQZI7ARWOiumZvhu471Ll3l30oNzKzR5bPNW+Sb
 1Aw=
X-Received: by 2002:ac8:5885:0:b0:476:8ee8:d8a1 with SMTP id
 d75a77b69052e-48025238433mr189998971cf.45.1745857467155; 
 Mon, 28 Apr 2025 09:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbtfAYJXqWijuqC9qE1XAYSFE+Ms0Ul7NtVdmGjB5I/RjjP9FCiSLL88Eit0raUnSdKc6qiA==
X-Received: by 2002:ac8:5885:0:b0:476:8ee8:d8a1 with SMTP id
 d75a77b69052e-48025238433mr189998431cf.45.1745857466831; 
 Mon, 28 Apr 2025 09:24:26 -0700 (PDT)
Received: from x1.local ([85.131.185.92]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47e9eaf264dsm70223561cf.10.2025.04.28.09.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:24:26 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:24:22 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <aA-rtji7ujQgckbM@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
 <aA-n9hvSX9JLsRM-@x1.local>
 <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yNg8aKlbE_7ho8Nl0aqnFWSdm4N9RGoijjxcttV1Iv8_1745857467
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
> > Probably due to what config you have.  E.g., when I'm looking mine it's
> > much bigger and already consuming 256B, but it's because I enabled more
> > things (userfaultfd, lockdep, etc.).
> 
> Note that I enabled everything that you would expect on a production system
> (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable lockep.

I still doubt whether you at least enabled userfaultfd, e.g., your previous
paste has:

  struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */

Not something that matters.. but just in case you didn't use the expected
config file you wanted to use..

-- 
Peter Xu

