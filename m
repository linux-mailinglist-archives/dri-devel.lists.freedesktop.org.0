Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5B912712
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E9B10F194;
	Fri, 21 Jun 2024 13:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mO5OOz3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5210F194
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7D1XSOiDMq3J20D9eCQjvYB35cnbWTU/PoTWWvCb8rY=; b=mO5OOz3SIWlYAssxOG0CRWoAp/
 L64OelAl2Iw5whZKQuTcpkXinUkOwVp6l9D5GRFVtsFuYWHJbBQqcL6FICt050IxsfQKfvDTuMZUl
 sg/akK8oWqgR8MYV/AbLrDQ+XphkyeSGmXCjIWigtkPjpD/CDpWQtAbhKMX40rz7r/GyVM0DxOx9+
 P/Iw1kTh7JIISPvnZNKF9qfyxMec91XW4JG7yjCBYqPKzTL2010UQ3WH533TC7+dN1/Xf253uALgo
 fhYiTSl6bxT3icrvO6qwt74jay6C/y7Vh1HtMRIeAsCDYzdVzh7C55AGfmBQlcK8p05Wp54FdJrQR
 CtGKSFng==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sKelH-00000007G58-0bUT;
 Fri, 21 Jun 2024 13:57:07 +0000
Date: Fri, 21 Jun 2024 14:57:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 06/11] mm/util: Deduplicate code in
 {kstrdup,kstrndup,kmemdup_nul}
Message-ID: <ZnWGsw4d9aq5mY0S@casper.infradead.org>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-7-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621022959.9124-7-laoar.shao@gmail.com>
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

On Fri, Jun 21, 2024 at 10:29:54AM +0800, Yafang Shao wrote:
> +++ b/mm/internal.h

Why are you putting __kstrndup in a header file when it's only used
in util.c?

Also, I think this function is actually __kmemdup_nul(), not
__kstrndup().

