Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B3AA11AA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A11210E313;
	Tue, 29 Apr 2025 16:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Stywinjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7610E508
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745944597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=waEdyNuipqRc2FvA2naLTCSIIiKXgQ9HjpRrzr7KHVs=;
 b=Stywinjc33tKLUZAwNHyd7/dFRyzLSw6NZqYVzibb76DGnR6CEvJH1TSPhIkFo/37BMiSK
 1eHqdacXK5o0k3BFRzhS6eSqgVpDaRs1gCpKDCYySQxzUyw8HwgJiYEvihdwMfmWD+L5Zq
 WOJopZf6DBN87GnXny+8fIT9hUMSdow=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-Xdp7cNPBPBOcRkwFgYKmLw-1; Tue, 29 Apr 2025 12:36:36 -0400
X-MC-Unique: Xdp7cNPBPBOcRkwFgYKmLw-1
X-Mimecast-MFC-AGG-ID: Xdp7cNPBPBOcRkwFgYKmLw_1745944595
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeffdba0e2so127228646d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745944595; x=1746549395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waEdyNuipqRc2FvA2naLTCSIIiKXgQ9HjpRrzr7KHVs=;
 b=PEch5ix3lk1/QVz4relFBI3a8C6A3HgGQCNENGB8Nr04sw9UvDvnZRM2cpQISyLNas
 4gAjHtdvn855QYzcFqZf0UtVzrll0FV5AKUtGQWPj0Gy3Lu/CnDBjP/uj05RCc1jFe5z
 nkTCB1hUjYDgzzadEBlUf7G9z6z6zkGRVqDo2rqNMRCk/2sTPSHCWkLN7dEBuhNPnKKV
 4ZYuYtAXXU54W6iTHQ1ymjPy7u1pKj0zAYZIodUl9LCYV4J8ERrp9gxLIEB1d1mU3Qev
 os97/6RakNI9XvysnVQgKLx5blvvN2gaRDvfBpZkb99xnixFAZQeIDOKRaPQLQaRf/nN
 4tnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7/c7MoQQBbFWM05x/1uRvOreTWWpg+oMIQeWqUMipZW/4/aUnSRyUs0INlgKNs60fiO8GTYw+IW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3D0I4ZmcD2Ua+oKDvtB17/pyAb2jdGOam8OGU6d5bE8RHafSn
 IKzG5JJ3J3l7+ouzfFAQdtMyZuXnK8Wtl4ONkzNLLsRfzwh20mfkHDy5CQiIvllDp2k+W0Vpcvx
 AcKHh8e7N6DIX4Y+iARXSGqhL1l2uNAKk+FK3Mgsg7haHrMpFJFfRCraCgIZ7rHOcHg==
X-Gm-Gg: ASbGncsgjgjqi8uhTvcTeTX/WtzEPwZU3zY/f69GpQ8NarM19apHsj2PsGUPY8V4iIC
 wllpfBlQSgv0AlHT+MmqduWNR5CvBwVY9Ym2UBM7L6YSXckxKCGWYK+GEuyD1205mPRTW+ykO25
 3WK1mGYeiuguo8VstfvkC7EwezDgy/QY28ZTIHGRkIr0+/8rdpHOTtBoGcY/rMUQgeFAravymvT
 e/EMTVHKLN+EpP8DW7DTgeJM3c/XVWmACtpfiR3W9dDGlZstJQTFds5BVtSgEwE4az85Ks9wCpf
 B14=
X-Received: by 2002:a05:6214:1c42:b0:6e8:feae:9291 with SMTP id
 6a1803df08f44-6f4fcee30d1mr719276d6.24.1745944595673; 
 Tue, 29 Apr 2025 09:36:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrl8H4/5jtnrguKExXXuFCOERrcXvTboYVKeLXf20R7G+3egGDvxPBeabBwEPjBOiCsfK/vg==
X-Received: by 2002:a05:6214:1c42:b0:6e8:feae:9291 with SMTP id
 6a1803df08f44-6f4fcee30d1mr718716d6.24.1745944595247; 
 Tue, 29 Apr 2025 09:36:35 -0700 (PDT)
Received: from x1.local ([85.131.185.92]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f4c0934346sm73501926d6.33.2025.04.29.09.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 09:36:34 -0700 (PDT)
Date: Tue, 29 Apr 2025 12:36:31 -0400
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
Subject: Re: [PATCH v1 02/11] mm: convert track_pfn_insert() to
 pfnmap_sanitize_pgprot()
Message-ID: <aBEAD02B5CIzonwU@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-3-david@redhat.com>
 <aAvjJOmvm5GsZ-JN@x1.local>
 <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com>
 <aAwh6n058Hh490io@x1.local>
 <75998f7c-93d2-4b98-bb53-8d858b2c108e@redhat.com>
 <aA-q_PrThAw5v1PF@x1.local>
 <57f9480c-2f8c-4be8-864c-406fec917eb1@redhat.com>
 <aBDXr-Qp4z0tS50P@x1.local>
 <4a57e772-51f5-4341-a249-dd1b8fcf23b0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4a57e772-51f5-4341-a249-dd1b8fcf23b0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TgFAo4FeNGQBrOawexwbNUCQ57dcc1GHzxIKgT3S5CA_1745944595
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

On Tue, Apr 29, 2025 at 06:25:06PM +0200, David Hildenbrand wrote:
> I do wonder why we even have to lookup the memtype again if the caller
> apparently reserved it (which implied checking it). All a bit weird.

Maybe it's because the memtype info isn't always visible to the upper
layers, e.g. default pci_iomap() for MMIOs doesn't need to specify anything
on cache mode.  There's some pci_iomap_wc() variance, but still looks like
only the internal has full control..

-- 
Peter Xu

