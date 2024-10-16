Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984E9A04AE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BBB10E118;
	Wed, 16 Oct 2024 08:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="POqdPRWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378A810E118
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yzrBMk6ot53bLQz060u90maSa6RVtY5pzHKYu0yEUZU=; b=POqdPRWOIC3iJJWMVGhG3/qE7L
 15C1SyQFtMc9pCyoyryjjFttQJFlufULoVrY6W8NFbr+Tdqa3/GtbgdUjG1taIBk3WJKh3oPy7tA/
 NND4HTdjFA6g3im3eK0jWp9UNizXjt8EABimzfuCtRtc0iD2fd6l1f/0HqzlIS/Z9MLa4igP4mO8m
 Ill5AD3aD4ctGW/0392YGdG7Z8osySjH3XHnWkoD3mKU8kFDk7Pg0ccsHH0gFot9cDbrvOTEL8tWQ
 Lwjro/yf0Y1G4WrO5Kv7C8n0iYeT9/hDJQINynt/M8QUHd/s6hwRqb1JABqP5lkrANb/hulKOyFYw
 QexTAIJQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t0zkE-00000007QVP-11h5; Wed, 16 Oct 2024 08:51:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 13D6D300777; Wed, 16 Oct 2024 10:51:02 +0200 (CEST)
Date: Wed, 16 Oct 2024 10:51:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/5] perf: Add dummy pmu module
Message-ID: <20241016085102.GW17263@noisy.programming.kicks-ass.net>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008183501.1354695-2-lucas.demarchi@intel.com>
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

On Tue, Oct 08, 2024 at 01:34:57PM -0500, Lucas De Marchi wrote:
> +static int parse_device(const char __user *ubuf, size_t size, u32 *instance)
> +{
> +	char buf[16];
> +	ssize_t len;
> +
> +	if (size > sizeof(buf) - 1)
> +		return -E2BIG;
> +
> +	len = strncpy_from_user(buf, ubuf, sizeof(buf));
> +	if (len < 0 || len >= sizeof(buf) - 1)
> +		return -E2BIG;
> +
> +	if (kstrtou32(buf, 0, instance))
> +		return -EINVAL;
> +
> +	return size;
> +}

I had to change this to:

+static int parse_device(const char __user *ubuf, size_t size, u32 *instance)
+{
+       int ret = kstrtouint_from_user(ubuf, size, 0, instance);
+       if (ret) {
+               printk("suckage: %d\n", ret);
+               return ret;
+       }
+       return size;
+}

because otherwise it didn't want to work for me; I kept getting garbage
at the end and things failing. Specifically, it looked like the string
presented by userspace was not '\0' terminated, ubuf was pointing to
"1...garbage..." and size was 1.
