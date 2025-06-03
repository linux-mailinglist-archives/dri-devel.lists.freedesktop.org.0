Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF5ACCFE0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 00:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913AA10E9C7;
	Tue,  3 Jun 2025 22:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="oZ74VURv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC78A10E919
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 22:29:55 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6f0cfbe2042so3907636d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748989793; x=1749594593; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+wx83DJsNUrK3WUrgC2gifdTqK+sHHcLtzdwykYlpj4=;
 b=oZ74VURvzfVPtzFybIsCDrH9AvEZS7KAeO0RsfEiAiaLB+xPbWfNAWEI/yc8lsChTH
 b51eg2xm376ZdxtDaydLm7g5cbDd0nKPvUmYxWNFFVKG06YyWQCjCpwnWoaGMQHSo5ex
 TjONgVdnzGkuzNGxEm5xUzT6pFwIfRzDqiJd+YJ2Kw/UXJx6TRVmWj4b2F2tSNfWtrS+
 xqdv2ZyoqOUY90lfS5GplIxEhpzgv6uEGNeMK4x3gev2H83mDAe8QDhzyOZb6IPqqzYG
 pNbIMy34hCrtsz8gkQW4v0aPuQu7SsFtY4EBDQYvHHsrJoK3unoPoE8SksywsGyhvhFC
 4aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748989793; x=1749594593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wx83DJsNUrK3WUrgC2gifdTqK+sHHcLtzdwykYlpj4=;
 b=WsvL34VR5zrP29avZOqKV4yfHEeXvUbhGEm7th9N64iDG1lwlwL97P/1jqJcmpQW8q
 YoaCPRqhieYPacjNFgFrxhc1w8EhCDQtr+WGCdplvKelF7/qPMesDRY3kuCg0Fkee4mP
 vuTTyaHGtCe6XmF5x4f0gq6UXdzKeuL1fMMhELRdidHp02e5hTZiR2KHsmHRNWzwFy7e
 CtshFpkzR+8HXwr1vP2+e5oTacjFsDkfF+yKysGMDrPb4hQBwPq64z7lhcb8dh94zBWx
 +qsGI4jWsurrFnAZnoYp7FQitjb44zd7cS1D6SoirdoXgeHokZE5ProD2/nJ3kVXuEzl
 UWVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4+WNpkCa/x6lYZbtbfRImhn+TqS1ErJCO0RKpnSFuvhOO4Vlu+mqZuJwwsQcclLZJFPyfuzpIzr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaZ9Eq2hrRivP+50zxRb4mf2GD5U5SUl9a3sI4mHmAW5cq21b7
 Fhy+uAtklkTywxNNAj5T9+V5Q2hs9UkTG8ULXelN50I2ziHxm8TmbhM8rtQhjgGrNmg=
X-Gm-Gg: ASbGncsfuYKroxCiG4Oq01obZmg7hHxy7iLanRbGRqruD5WNMupQRAw/ARUHD7XG7Ie
 +94g9zk28ER5Ce4kstMGu1+j+EwdY3l6UkJ7UoorSgv4dr0Wb7wmVytjQFKFVDMGWsvP2sXmZ+j
 qyTh6HuRP4Oha5aP0vcH4XiihvviDAK0OxFo+w0+BLeZxr0TSMppLxXL/9YXMMfaObVNzyZgJcR
 M8PV3K/H/jL9s96v3QixGplG6BAdh8YPvWc48z8a7E6jRt0oclTuCNC8+1vAkbpeGCSx9EFyHmL
 33dTitUEv/z8moUELRtPDVPqwFHTEWcq8lXYU/jAkaRInKWmtGlRTR9EdCj8X1NlKH3x+F/e0k0
 +TXmA8DK0cjdhV4oLFHU14wT1UNE=
X-Google-Smtp-Source: AGHT+IHTAQ5pjUjqQVR+1g/2QAx5qymMHrgO/DLw8kGHRUE/rakYfNkC86dFz+pI/+ZgUiJ0Csfy9w==
X-Received: by 2002:a05:6214:4c46:b0:6fa:a090:e23e with SMTP id
 6a1803df08f44-6faeede119emr58074826d6.1.1748989793538; 
 Tue, 03 Jun 2025 15:29:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a112ab1sm911878985a.63.2025.06.03.15.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 15:29:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMa8m-00000001s9I-1K6i;
 Tue, 03 Jun 2025 19:29:52 -0300
Date: Tue, 3 Jun 2025 19:29:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <20250603222952.GD407166@ziepe.ca>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
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

On Mon, May 26, 2025 at 10:15:17PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 26-05-2025 20:36, Dan Carpenter wrote:
> > Hello Himal Prasad Ghimiray,
> > 
> > Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
> > ranges") from May 13, 2025 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
> > 	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'
> 
> Hi Dan,
> 
> Thanks for pointing this out. I see there's a gap in how hmm_range_fault()
> adheres to its documented behavior. I believe the function should sanitize
> positive return values from walk_page_range() to ensure consistency.
> 
> Jason can comment further on same.

Yeah, I don't think it should return positive error code, whatever is
doing that should be fixed. Can you send a patch?

Jason
