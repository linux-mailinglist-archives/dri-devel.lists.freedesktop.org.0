Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494908B802E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 20:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D91112E64;
	Tue, 30 Apr 2024 18:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XsJNzxxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE9112E68
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 18:57:52 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-346407b8c9aso1301370f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714503471; x=1715108271; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mf09Ii49RKqdZdRDBWZ+S2qAns/t9VUczc0KsSwX7Dg=;
 b=XsJNzxxedHrwpDjQqsuZQH9WGYShgmKzMx9FdgfMsS1XrzU9XPXft2LlX7H8+iwWq6
 29nuhf+QJyQ3ix8zC0otKnF/iZvVcc2UpUE4gpHHVdoGXyNx8cwHelERfz41n3TQa+ZL
 9lJ0+VnQDwvS43N3pEzLQ4AJj5vsTvYGeD6n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714503471; x=1715108271;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mf09Ii49RKqdZdRDBWZ+S2qAns/t9VUczc0KsSwX7Dg=;
 b=TbDZdbnrQmY03LvRhs4QKedLoqxBvRSmr40xNtBfbAcWB66Pbvq8D3Kap1rjaN3NsT
 umJo/pq9ckoFCjSmrccXna8Ap4Jv87TuRcYOmdoZ+oxYowQp6VBiYHcsvt7lRe8oQVuG
 HDgeUFwnmwl/A/Dmivwq4nK2uKd0TIsI0IXSZv3Jw1hUhVNL5dujjA58mxRFFlTZbxJ1
 9wgtLkpUAnDwFvgoV4lrUeUCuSXWsiYxLgJhr5MNjH2XkZVv1JlkVz8xdhjF8u19/jh0
 G80OfGJVXA4IuWNPXkjapZIX9kg8YAS2LP94Rh0GribTtgvMxRqQwDvr6RPrUCHadXw2
 N8xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5tDgNttoFxJOckRCD9kT+Gk/6mVbjGQ8GOlZziKOCztseL/Hd12NIm9y657MimeyB9+BX9yf38bFO8K/FQTsZIlaW3WDdAQOVmDIoWnST
X-Gm-Message-State: AOJu0Yy6Joq4XMoLa5VbBQWVShitc1cFwd8UYAc0QjINEeaYf2c6OZ5p
 v4oecFyFdp+yQu8durpHG7DPSrMjjEeEBmDHlnM10wiwSpcDZDt0cqRv3MZEVv4=
X-Google-Smtp-Source: AGHT+IHNugruTVr76jvzG+rzeMeBpbbnChG2sXKsYk0c94q64l07t5rbWRrIDWL9Zec55jKEwv6onw==
X-Received: by 2002:a05:600c:3b08:b0:41a:c4fe:b0a5 with SMTP id
 m8-20020a05600c3b0800b0041ac4feb0a5mr259777wms.4.1714503471037; 
 Tue, 30 Apr 2024 11:57:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j42-20020a05600c1c2a00b0041bfa2171efsm11844484wms.40.2024.04.30.11.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 11:57:50 -0700 (PDT)
Date: Tue, 30 Apr 2024 20:57:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
References: <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430173002.GV941030@nvidia.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Apr 30, 2024 at 02:30:02PM -0300, Jason Gunthorpe wrote:
> On Mon, Apr 29, 2024 at 10:25:48AM +0200, Thomas Hellström wrote:
> 
> > > Yes there is another common scheme where you bind a window of CPU to
> > > a
> > > window on the device and mirror a fixed range, but this is a quite
> > > different thing. It is not SVA, it has a fixed range, and it is
> > > probably bound to a single GPU VMA in a multi-VMA device page table.
> > 
> > And this above here is exactly what we're implementing, and the GPU
> > page-tables are populated using device faults. Regions (large) of the
> > mirrored CPU mm need to coexist in the same GPU vm as traditional GPU
> > buffer objects.
> 
> Well, not really, if that was the case you'd have a single VMA over
> the entire bound range, not dynamically create them.
> 
> A single VMA that uses hmm_range_fault() to populate the VM is
> completely logical.
> 
> Having a hidden range of mm binding and then creating/destroying 2M
> VMAs dynamicaly is the thing that doesn't make alot of sense.

I only noticed this thread now but fyi I did dig around in the
implementation and it's summarily an absolute no-go imo for multiple
reasons. It starts with this approach of trying to mirror cpu vma (which I
think originated from amdkfd) leading to all kinds of locking fun, and
then it gets substantially worse when you dig into the details.

I think until something more solid shows up you can just ignore this. I do
fully agree that for sva the main mirroring primitive needs to be page
centric, so dma_map_sg. There's a bit a question around how to make the
necessary batching efficient and the locking/mmu_interval_notifier scale
enough, but I had some long chats with Thomas and I think there's enough
option to spawn pretty much any possible upstream consensus. So I'm not
worried.

But first this needs to be page-centric in the fundamental mirroring
approach.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
