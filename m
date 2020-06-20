Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A0203043
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA026E56A;
	Mon, 22 Jun 2020 07:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Sat, 20 Jun 2020 09:44:32 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306766E02A;
 Sat, 20 Jun 2020 09:44:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,258,1589234400"; d="scan'208";a="455748139"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2020 11:37:19 +0200
Date: Sat, 20 Jun 2020 11:37:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2] drm/amdkfd: Fix memory leaks according to error
 branches
In-Reply-To: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
Message-ID: <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
References: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1246811221-1592645840=:2918"
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>,
 =?ISO-8859-15?Q?Felix_K=FChling?= <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1246811221-1592645840=:2918
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 20 Jun 2020, Markus Elfring wrote:

> > The function kobject_init_and_add alloc memory like:
> > kobject_init_and_add->kobject_add_varg->kobject_set_name_vargs
> > ->kvasprintf_const->kstrdup_const->kstrdup->kmalloc_track_caller
> > ->kmalloc_slab, in err branch this memory not free. If use
> > kmemleak, this path maybe catched.
> > These changes are to add kobject_put in kobject_init_and_add
> > failed branch, fix potential memleak.
>
> I suggest to improve this change description.
>
> * Can an other wording variant be nicer?

Markus's suggestion is as usual extremely imprecise.  However, I also find
the message quite unclear.

It would be good to always use English words.  alloc and err are not
English words.  Perhaps most people will figure out what they are
abbreviations for, but it would be better to use a few more letters to
make it so that no one has to guess.

Then there are a bunch of things that are connected by arrows with no
spaces between them.  The most obvious meaning of an arrow with no space
around it is a variable dereference.  After spending some mental effort,
one can realize that that is not what you mean here.  A layout like:

   first_function ->
     second_function ->
       third_function

would be much more readable.

I don't know what "this patch maybe catched" means.  Is "catched" supposed
to be "caught" or "cached"?  Overall, the sentence could be "Kmemleak
could possibly detect this issue", or something like that.  But I don't
know what this means.  Did you detect the problem with kmemleak?  if you
did not detect the problem with kmemleak, and overall you don't know
whether kmemleak would detect the bug or not, is this information useful
at all for the patch?

"These changes are to" makes a lot of words with no information.  While it
is perhaps not necessary to slavishly follow the rule about using the
imperative, if it is convenient to use the imperative, doing so eliminates
such meaningless phrases.

memleak is also not an English word.  Memory leak is only a few more
characters, and doesn't require the reader to make the small extra effort
to figure out what you mean.

julia

>
> * Will the tag “Fixes” become helpful for the commit message?
>
> Regards,
> Markus
>
--8323329-1246811221-1592645840=:2918
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--8323329-1246811221-1592645840=:2918--
