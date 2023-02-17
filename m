Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3969B344
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFA010E225;
	Fri, 17 Feb 2023 19:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6615B10E225;
 Fri, 17 Feb 2023 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HznwluzS0ZGoZBxqPywPydMAJ7rtE7A0nySFqvQCNKU=; b=ZdlZ/53k/mtRuNZKjJ/V0nzM18
 NQTuOZpFnJ1UXH8JSdVoqCOQuGuckB9rvIbuhwkxblJF8okMMFOe5fO3WQtWVGHG4W3e79OPKnUw9
 26h8mXYKiump0wSLoHk8KXdAuEEfYfdBdREBp+us9n7Z2hmECRNeFVpWFIilk3vMRaxhuTJV4VZ9T
 lyXv7TuLS4kOjbKcS11XQxqX98tEli6YJxVDyIJXKtCr4TyZCPmoqfY8Cy52o+qA3fha9fF2csXwu
 uYYs0E1ZnYV5NnP2hf0BS+FhyAxwbVmh4Q90+i8SWHbfPPkovS3KuJi2m7fLbdfZQXf8JuGL1QyBo
 QXdQ88XA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pT6fj-009a9i-Q7; Fri, 17 Feb 2023 19:45:31 +0000
Date: Fri, 17 Feb 2023 19:45:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
Message-ID: <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134422.14116-4-dakr@redhat.com>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org, corbet@lwn.net,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 boris.brezillon@collabora.com, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 02:44:09PM +0100, Danilo Krummrich wrote:
> \#define SAMPLE_ITER(name, __mgr) \
> 	struct sample_iter name = { \
> 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),

This is usually called MA_STATE_INIT()

> #define sample_iter_for_each_range(it__, start__, end__) \
> 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
> 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))

This is a bad iterator design.  It's usually best to do this:

	struct sample *sample;
	SAMPLE_ITERATOR(si, min);

	sample_iter_for_each(&si, sample, max) {
		frob(mgr, sample);
	}

I don't mind splitting apart MA_STATE_INIT from MA_STATE, and if you
do that, we can also use it in VMA_ITERATOR.
