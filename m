Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B68966A37
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFA010E158;
	Fri, 30 Aug 2024 20:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.b="sfO/igNI";
	dkim=pass (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="VaEBAgfY";
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="P7Vd6NkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 20:09:09 UTC
Received: from e3i12.smtp2go.com (e3i12.smtp2go.com [158.120.84.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0610E105
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1725047639; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=8ffM0oj/VoAWiRvIYhx2YzkqNpRjhG4e8iNPq0uer6M=;
 b=sfO/igNIj3rHJF7k+qXQrZXk/oxBtpfJzQIGEHKGIuMnzIXJ2e+p+bRI7Vfg2XM6JOxH7
 QDC0d6CtFzlgGIWcLvzmF0vG9HLEhfgzibd9+LWSpmfZNbJyXzrX23Ffd0vTsZkqjyK3nFJ
 trFY1dBwF2rYSQ6T9Xo2YVy+Irz3Elf+d6wcvHtu24PbAJ4eCSm0ov35v8XYXMqWQn5GWhb
 XU3U5qGDPzyHuA+8g7gCtwjdSyWUj3WpEWiRIQSjOS3U92JGRqL5MuyPsjiMTiIyWPwnf4N
 ymxmtwsjFbR3/4cg9H4ajjFt2ckrj4cYWfFuxEfoI1t9AZQTRNaHIy98Jxjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1725047639; h=from : subject :
 to : message-id : date;
 bh=8ffM0oj/VoAWiRvIYhx2YzkqNpRjhG4e8iNPq0uer6M=;
 b=VaEBAgfY7wQUS2dXXkkONDWJoe8C1zfdZaGvwOMRNl9iRWe9FnpDtS1VLJfA4Bo9bp3g7
 iuLqIG8uJSCi5sbCI+0QO95ZL7dVTp2Te9FwbOwmx0vOHE6jUaGqsPVmJiygtq9vEDR3rbQ
 ryPbvFkBDMuZZPAZccVOFv097rnAoSMs9N3qfW/loJDYiLnerLgUrrIAl4bwfhg0cEKG9/q
 XF3uVkIrzMVw7tmUQTsryO2SoOKYqQ2L0QAjjUseA5pA5laaZIoWOPFWRxd9PQ3v4S3CkhE
 uRGHalGGPRjRGar9Bz6Wzf6Im4KmdeSZNoq1S8R7Bqq3bwU2Jx6hGTL9r/6g==
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sk7gj-FnQW0hPpdBf-nWmg; Fri, 30 Aug 2024 19:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1725047604; bh=VrcLFN5tqkfWY7mTHOYKMf0e0KvomCFsMPrfJDAaMSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P7Vd6NkS50dZUF4ArGNPd4emC0HPqVDT3dc+nak6w/kyFZyIa7wpU0vTqmsiIkRep
 lFQ7rFhNaD2Mf9eA7RsNhjnIHPRkgubjb0TmusaqfHzYKQpJgQpvZs4tHW5Z4AT4vC
 fDqmIJfHaxoaJYo+8KfLKLIUurdYOyn4DfkqTbOE=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 423D3449B6; Fri, 30 Aug 2024 21:53:24 +0200 (CEST)
Date: Fri, 30 Aug 2024 21:53:24 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Finn Behrens <me@kloenk.dev>,
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
Message-ID: <ZtIjNBhqdxmMBxfM@fjasle.eu>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh>
 <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh>
 <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
 <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local>
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sfGQOlJjcl
X-smtpcorp-track: v5O6hNewHfhz.IPPCUgchacK3.W-nJtAkYWyC
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

On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > Also, as this is not internal for the kernel, but rather for userspace
> > > > > builds, shouldn't the include/ path be different?
> > > > 
> > > > Can you suggest an alternative path or provide documentation that could help
> > > > identify the correct location? Perhaps usr/include?
> > > 
> > > That is better than the generic include path as you are attempting to
> > > mix userspace and kernel headers in the same directory :(
> > 
> > Please keep in mind, that usr/include/ currently does not hold a single
> > header file but is used for dynamically composing the UAPI header tree.
> > 
> > In general, I do not like the idea of keeping a elf.h file here that
> > possibly is out-of-sync with the actual system's version (even though
> > elf.h should not see that much changes).  Might it be more helpful to
> > provide a "development kit" for Linux devs that need to build on MacOS
> > that provides necessary missing system header files, instead of merging
> > those into upstream?
> 
> I took this suggestion and tried pushing a Homebrew formula/package here [1].
> I think I chose a wrong name and maybe something like "development kit" would
> have been better. However, would it be possible instead to include the *.rb file
> in the scripts/ directory? So users of this can generate the development kit in
> their environments. I would maintain the script to keep it in sync with the
> required glibc version for the latest kernel version.
> 
> [1] https://github.com/Homebrew/homebrew-core/pull/181885

I think it sounds sensible to hold that formula file in the upstream tree.  But
I am not sure if scripts/ is the best location.

Masahiro, what do you think?

Kind regards,
Nicolas
