Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFCE1B3818
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC23C6E9B2;
	Wed, 22 Apr 2020 06:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF7A06E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 15:55:42 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03LFtMkQ010973;
 Tue, 21 Apr 2020 10:55:22 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03LFtG0c010964;
 Tue, 21 Apr 2020 10:55:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 21 Apr 2020 10:55:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/5] powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
Message-ID: <20200421155516.GT26902@gate.crashing.org>
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <3911a86d6b5bfa7ad88cd7c82416fbe6bb47e793.1587407777.git.christophe.leroy@c-s.fr>
 <CACPK8XfqnqgkXcBzp=nqd=AJX1MK05eTNiyOdaEuRu3_6RsXSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XfqnqgkXcBzp=nqd=AJX1MK05eTNiyOdaEuRu3_6RsXSQ@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-fbdev@vger.kernel.org,
 kvm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Tue, Apr 21, 2020 at 01:04:05AM +0000, Joel Stanley wrote:
> On Mon, 20 Apr 2020 at 18:38, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > _ALIGN_DOWN() is specific to powerpc
> > ALIGN_DOWN() is generic and does the same
> >
> > Replace _ALIGN_DOWN() by ALIGN_DOWN()
> 
> This one is a bit less obvious. It becomes (leaving the typeof's alone
> for clarity):
> 
> -((addr)&(~((typeof(addr))(size)-1)))
> +((((addr) - ((size) - 1)) + ((typeof(addr))(size) - 1)) &
> ~((typeof(addr))(size)-1))
> 
> Which I assume the compiler will sort out?

[ This is line-wrapped, something in your mailer?  Took me a bit to figure
  out the - and + are diff -u things :-) ]

In the common case where size is a constant integer power of two, the
compiler will have no problem with this.  But why do so complicated?

Why are the casts there, btw?


Segher
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
