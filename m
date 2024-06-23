Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C4C913779
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 05:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B8D10E043;
	Sun, 23 Jun 2024 03:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="gXVx8wQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30310E043
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 03:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=y9uWSeBXGFFkTKzpeCZedo92XcBKtugbjarhe/W3XfE=; b=gXVx8wQODxcvu5+RNSe4JuP8dx
 8YiG5Llm57Kofa9LcDUF50LviqbVQzF3RV/awxWZw3StuN4cblmBdraMszSMKhHYgo8cO22aBvBp/
 h8mbYDVzId4UL+Svlf+mV2XV5MBhLZC8ubx/yBcXGFp4e4uG1U+o70EKPrhti73Djzw7Ot1yur4Ya
 IWnDexW2JlS2AUlNYplSpJqG5twbYdclTTbJIu08AmIt37T3KYHrtiUMsKdxo26LwZmX4JhGtxGrT
 COledEBuTIjN8iUsEFVTQxiFX4ODRTnxF5NCfzVUnBw35s1gKe7cC24wLu48oGlWKYySg7vA4zgBk
 QclIweFQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sLDdQ-00000008lfC-1wDX;
 Sun, 23 Jun 2024 03:11:20 +0000
Date: Sun, 23 Jun 2024 04:11:20 +0100
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
Message-ID: <ZneSWDgijj3r0MMC@casper.infradead.org>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-7-laoar.shao@gmail.com>
 <ZnWGsw4d9aq5mY0S@casper.infradead.org>
 <CALOAHbC0ta-g2pcWqsL6sVVigthedN04y8_tH-cS9TuDGEBsEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbC0ta-g2pcWqsL6sVVigthedN04y8_tH-cS9TuDGEBsEg@mail.gmail.com>
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

On Sun, Jun 23, 2024 at 10:29:30AM +0800, Yafang Shao wrote:
> On Fri, Jun 21, 2024 at 9:57 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Fri, Jun 21, 2024 at 10:29:54AM +0800, Yafang Shao wrote:
> > > +++ b/mm/internal.h
> >
> > Why are you putting __kstrndup in a header file when it's only used
> > in util.c?
> 
> I want to make it always inlined. However, it is not recommended to
> define an inline function in a .c file, right ?

I'm not aware of any such recommendation.  Better than putting it in
a .h file that everybody has to look at but nobody uses.

