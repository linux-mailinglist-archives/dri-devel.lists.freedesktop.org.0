Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D49188747
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E596E1E6;
	Tue, 17 Mar 2020 14:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C436E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 19:59:25 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id l20so15397304qtp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EAEH/7t5ubtIMhw4ZTeVgjQSlcx5QOWTPoLF4PtWhvw=;
 b=RmOqUe+R4l5H6YpqEib1W4LfA1h1/OZym/f9ehFr0qPoTlxgBeLu6AJhJEmNnQN1Dj
 VE0p9XlPU1CSB+PhFNJXeVAL1LDo4nVZlApvnbIOxbw+r/nV9Gg6fFNKzOdwP2Rv+Tcn
 jO4CyQOKGxDjCENXESz3JqP8SloGlWtsxFs4A+S9T2ZlNyxyjePg81CckrADJ18xntlN
 aHclWcT2nw64C3P/y74znOjO+t0uMLoSAJuwol49hiClFZErw7yVlf364WCNiDmO2nJm
 W+hBIi0t5YKyy6lPGMloSf+ZExCMZJ+fh4fYcxzQVhaJT+DK5PvzuCPkceNPvN3cAj8p
 AGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EAEH/7t5ubtIMhw4ZTeVgjQSlcx5QOWTPoLF4PtWhvw=;
 b=KHIecAmusIRCkM/olj0cVESddz/a+Ck5v9y0j5irW1yMVh7jaAnmCY2Du2hQh5ltBj
 6y3P0UIzhAkxzyVYXK2FFHcE+8ZISRW2Aab4AfQITw2LjN95paWDD3Z2pU9WCfeN8qLg
 diYYnsw7rEXqKmqX+7HFlvIQenvdlW8fFBK1DmWGZpBFqeb69a+LdX2yWRRTanr9bKOI
 v0w3Ij8O9QMa5CtOCvZjiba9ml1dQbRwrwqifaL87KDTNijLupYx+CYOcQ4KDS9e99dD
 myNZmDML1d5ORZe8lljewEFfB+hb4QcZz7GHslrhWLP+lDsU6snuIMlnyza9Az4+k/Iw
 eodA==
X-Gm-Message-State: ANhLgQ1p9MOK2t8PlRj2NodBzohLLoEkEpkcwGWKLV1tDK/MGN3kN7tf
 x59DHPmTN09mqQ1L29/bPlM+LQ==
X-Google-Smtp-Source: ADFU+vtbRUKVYcUI2Gq+ZWCB4v8nheFcrqCqLhbHdThlbs4ZekZNUobGzi4WVSGLSw/oM8Fkr1QlJA==
X-Received: by 2002:ac8:7396:: with SMTP id t22mr1961185qtp.182.1584388764690; 
 Mon, 16 Mar 2020 12:59:24 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x22sm488565qki.54.2020.03.16.12.59.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 12:59:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDvtT-00078y-K3; Mon, 16 Mar 2020 16:59:23 -0300
Date: Mon, 16 Mar 2020 16:59:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Message-ID: <20200316195923.GA26988@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316193216.920734-4-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 08:32:15PM +0100, Christoph Hellwig wrote:
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 180e398170b0..cfad65f6a67b 100644
> +++ b/mm/hmm.c
> @@ -118,15 +118,6 @@ static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
>  	/* We aren't ask to do anything ... */
>  	if (!(pfns & range->flags[HMM_PFN_VALID]))
>  		return;
> -	/* If this is device memory then only fault if explicitly requested */
> -	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> -		/* Do we fault on device memory ? */
> -		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
> -			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
> -			*fault = true;
> -		}
> -		return;
> -	}

Yes, this is an elegant solution to the input flags.

However, between patch 3 and 4 doesn't this break amd gpu as it will
return device_private pages now if not requested? Squash the two?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
