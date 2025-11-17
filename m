Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17238C65900
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 18:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AAA10E04F;
	Mon, 17 Nov 2025 17:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="JJVBBqIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3DE10E063
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 17:41:20 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8b21fa7b91bso421416585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763401279; x=1764006079; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1qJkF7xzNvfW27lcwrRkU63X6JYTODC8vdP0RYsotYs=;
 b=JJVBBqIioaQyOpOhwlAs2mg8eN8dvhqyIuuI3AQXDvebN+PMXPRw6W2luxwn7hvYFd
 Ri1ffMoNQs7ISh24XEnymS0iWEAxqnKAf+tcvgJbHotiBU+QqT8oLLHeFSb/VaynGqeH
 ofhdHZvWdUVFNQ/f6G4EDtrcpGPbNB2wOj9OLxauIT9vZyXJ2D3FuL3LPJhD0Am0O3ir
 AeAL1ikqb5wV9jW9pe5xPvVHUBc1jPBWM9COMpMZX9NQ42vaqc9NZjnz54lLVe+K7sL+
 4JdVGrjfhPe2YTa9mb4IRLNF/AgjsybWK+P9vQARosEARtCwSDYnOrTXMAQNAiDnciRZ
 jgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763401279; x=1764006079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qJkF7xzNvfW27lcwrRkU63X6JYTODC8vdP0RYsotYs=;
 b=PgzS2wUWTvhf0mQKIW5+u9sBbbFOXxYE8jrAt0X9XEE4oWoP+63N2wYffdA5SJ3hHu
 YTCXb1EvoidZ6IOxLkR7rMxyUK/Spyjj2+VDiSgqJakwf/B8r4bjYntcB446HrU+jIW4
 NL3H5ChJA1LNdJAIj7p1ZRsAV8iFwbt5MlNtyAwW/63JoSxBdegpFvKVM/zkP2NychZJ
 W97mDArS7i/N0hGIDbeYWCpzQBl7cW9NvmlM5iQeViyMD+QvPG3Kr9wSdw1xha7b/RDM
 Ig/jVWJ0iamZV+972TkrbzagetBDLzRBfmNiR9CRwXSreAi+pQIpUAyQt8Qzf2slHY82
 J4kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+dUS+zGBg089zW22WeXOezcZINcqqmGZq0pKjrTpWTA8qXsvfpvVJAQhImg9EsSMFFlaE75SFPcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt7IhxlrFXlB7vxHgGoxSis6uauB4pG2xnolEK//tdhAqK4nNw
 wSez5IYu+CZscK++jVXXaMw3Z/fpTs82C8uuXK6SsgQLl6eHsWXgw2u4gn1t/cD1eTc=
X-Gm-Gg: ASbGncvwK2XUaFeNofbfVsA/W+QD1cTlE2KMMzKyMk4W+IawAbFusKfAbg9LDPqkjHC
 HYa3BtauhLcHSXoRkzgvJcUkhDn3KYtcnv3VuwBdPiDjt6bEqM8GGBFmdgBs87H7s3ozoHIuL9z
 Gj364CZfooiEdnZ+BUqyj66yQsnh0mg3t6EYPoK0OJyVpP6k0lcMTXivAN4xejZWCELSRMPF0qM
 q248CUSXINc/sascDa5l4hrU/NZlAQ29q9xKemKWgW6mNDaK+Gs4itPQYtb+3rUpJ+0SGZFy6rI
 kIghx7F2bjaWgbjEDQk8Q5vWMh94iNUn5fiHVpQff2fYspPdngzGeblpyzeFWmDk239Jr810wNI
 YY9kEfqSQ2sNaO4g4JLVgNoBd7GO4P13Fo5cUYe9UhQhoq7ZHH3TG1OCiafvoEZZMmn041Pdhdj
 f0OoyblX7VrUNlRBSlQ/KTp/TI4mweslQGOXICc5+OLNiIcRTL8Cs9k5UZoEFpmi2Yttw=
X-Google-Smtp-Source: AGHT+IHUC2kQJmZzWtfj8JN4lQU2Yv/bM99hDpBURjfV9QCaErsZnrfxPgnm1j7nzf/zhiOEyak+vg==
X-Received: by 2002:a05:620a:4484:b0:8b2:f182:6941 with SMTP id
 af79cd13be357-8b2f1826c89mr417050685a.57.1763401278929; 
 Mon, 17 Nov 2025 09:41:18 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2aeeb541esm1003670385a.18.2025.11.17.09.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 09:41:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vL3E5-000000005dU-3LHI;
 Mon, 17 Nov 2025 13:41:17 -0400
Date: Mon, 17 Nov 2025 13:41:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Winiarski, Michal" <michal.winiarski@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <20251117174117.GD17968@ziepe.ca>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
 <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
 <DM4PR11MB52784CBB6C5AF6F19E373A278CCFA@DM4PR11MB5278.namprd11.prod.outlook.com>
 <ndd4kt4elbm7ixzyouhorgatjwv73ldyjo6bmrbipxvaqzccjs@ssavf6b5ric3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ndd4kt4elbm7ixzyouhorgatjwv73ldyjo6bmrbipxvaqzccjs@ssavf6b5ric3>
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

On Wed, Nov 12, 2025 at 02:46:08PM +0100, Winiarski, Michal wrote:
> > > I agree that it should be done in the core eventually.
> > > I didn't view it as something blocking next revision, as the discussion
> > > was in the context of converting every driver, which is something that
> > > probably shouldn't be done as part of this series.
> > 
> > well it doesn't make much sense to push a new driver specific
> > implementation when the core approach is preferred.
> 
> This would generally mean that accepting any new VFIO driver variant
> would be blocked until core approach materializes.
> 
> Jason, can you confirm that this is indeed what you have in mind?
> Just to determine how urgent the core-side changes are, and whether
> there's anything we can do to help with that.

A core approach would be nice, but I also haven't looked at what it
would be like.

I think if you post a small series trying to build one and convert
some of the existing drivers it would be sufficient to let this go
ahead.

Jason
