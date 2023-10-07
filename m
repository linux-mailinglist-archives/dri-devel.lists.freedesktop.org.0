Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C37BC5F6
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 10:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3814A10E009;
	Sat,  7 Oct 2023 08:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750CF10E009
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 08:09:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A513CCE01B7;
 Sat,  7 Oct 2023 08:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60862C433C8;
 Sat,  7 Oct 2023 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696666190;
 bh=sFMB5SgWf3EqgbKlwxbdjmSh8EIjVCyP9hzXo8O3DTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jk9wc+Cdi6UcxCc/oZbGNf37ZsszgQ7hNZ4ovJ7oGR7qRb9J8KyeWi8uFWGoaGD8A
 2dyi6PBv/ceT46bop2/8DWYhhr1x//ewK+AYrdB1nDlDrxWk+EDQ4CMjBko5YS+idS
 51rA9HLIhBquWI+Umh47ArR9me0PAdCfTYyusRK6jLkTKN0FGbVC0/CuH4cxlR0TCH
 f0IlqDl76bhNY9tNMrJDzyYlOaxklD/Geok+cVZsJIECiNxIBQbNOTVmyqRZ8a4Q6d
 5kr3HFsjYIBzU9DPymzKAQxD+Cfe5UPrrw63UO2pnks/aKLiMevPNoE6CFLgcxOygG
 FJL+wQGzEXIfQ==
Date: Sat, 7 Oct 2023 10:09:46 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 0/2] Add support for inlined documentation for kunit and
 kselftests
Message-ID: <20231007100946.396187d4@sal.lan>
In-Reply-To: <87pm1vd4kb.fsf@meer.lwn.net>
References: <cover.1693550658.git.mchehab@kernel.org>
 <87pm1vd4kb.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Tue, 03 Oct 2023 11:00:20 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab@kernel.org> writes:
> 
> > This is a follow-up of the discussions taken here:
> >
> >    https://lore.kernel.org/linux-doc/20230704132812.02ba97ba@maurocar-mobl2/T/#t
> >
> > I sent a previous version as RFC. This is basically what we had there, with some
> > improvements at test_list.py.
> >
> > It adds a new extension that allows documenting tests using the same tool we're
> > using for DRM unit tests at IGT GPU tools: https://gitlab.freedesktop.org/drm/igt-gpu-tools.
> >
> > While kernel-doc has provided documentation for in-lined functions/struct comments,
> > it was not meant to document tests.
> >
> > Tests need to be grouped by the test functions. It should also be possible to produce
> > other outputs from the documentation, to integrate it with test suites. For instance, 
> > Internally at Intel, we use the comments to generate DOT files hierarchically grouped
> > per feature categories.
> >
> > This is meant to be an initial series to start documenting kunit.  
> 
> I've played with this a bit...a couple of quick impressions:
> 
> - That's quite a chunk of Python code to be adding.  I've not yet had
>   the chance to read it through properly, will hopefully be able to do
>   so soon.  A bit more commenting would not have gone amiss here...

I'll try to add more comments when respin this series.

I guess I should also add a documentation similar to the one I wrote
for IGT [1]:
	https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/docs/test_documentation.md?ref_type=heads#documenting-tests-via-testplan

[1] this document is specific for the way IGT uses it; I'll write
    something similar to it considering the names we've agreed for
    KUnit.

> 
> - I kind of think that this should go under dev-tools rather than being
>   a new top-level directory.  Is there a reason not to put it there?

No particular reason. I'll change it to be under dev-tools/tests at
the next submission.

Should I wait for you to take a look at patch 1/2 before sending
a new version?

Regards,
Mauro
