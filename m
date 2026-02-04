Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA11IIQFg2njggMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:38:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC668E33D4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7691310E17E;
	Wed,  4 Feb 2026 08:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zZ9wK3Dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D310E17E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 08:38:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 181DA43605;
 Wed,  4 Feb 2026 08:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0149C4CEF7;
 Wed,  4 Feb 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770194302;
 bh=lOydLdwq0DJFngTFiPOVACyhCV1v+oLvFmseBRZSl9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zZ9wK3DdZuQtbQgr8kmPZPfHhAnXOknf1rTetfhvDwCRs80vZL19iBD35iTyihxBy
 MKVki/wCr1XYG5hDoFk3Gn4d1h/VDij2I6C7clzDq1Snl8w66CPI9HxVB9Bp4dxGkl
 A7EexQ4Ns5AXdzDQO/bOn3TvmrIda650d51zEkGs=
Date: Wed, 4 Feb 2026 09:38:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
Message-ID: <2026020409-situated-icing-5a1a@gregkh>
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
 <2026020315-conch-trickle-2d84@gregkh>
 <CAGSQo03Ok1sv4myQk2Ch68rET19ypq4Mm-=82Ue-T-2Z8kaGmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03Ok1sv4myQk2Ch68rET19ypq4Mm-=82Ue-T-2Z8kaGmA@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mmaurer@google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,ffwll.ch,samsung.com,intel.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cve.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DC668E33D4
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:37:50AM -0800, Matthew Maurer wrote:
> On Tue, Feb 3, 2026 at 8:28 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Feb 03, 2026 at 03:46:35PM +0000, Matthew Maurer wrote:
> > > Convert the socinfo driver to Rust for a number of improvements:
> > > * Accessing IO mapped regions through the IO subsystem, rather than
> > >   through regular memory accesses.
> >
> > That's good, but the C code could also be "fixed" to do this, right?
> 
> Yes, nothing stops the C code from being fixed to do all of this - all
> of this is representable in C code.

Great!  How about sending fixes for that first so that older kernels can
benifit from those fixes :)

> > > * Binds the device as an auxiliary device rather than a platform device,
> > >   ensuring the mapped IO regions cannot be accessed after the smem
> > >   device is removed.
> >
> > I'm all for this, but is this really an aux device?  What is the
> > "parent" device of this aux device?  Where are the "siblings"?  What
> > does sysfs look like before/after this?
> 
> The parent of this aux device is qcom-smem. In the prior
> implementation, qcom-smem loads this device through
> `platform_device_register_data` and `platform_device_unregister`,
> holding a reference in its global struct to release it when being
> released. The probe table for the qcom-socinfo driver was empty, so it
> would not probe without an explicit registration.

So it's a "fake" platform device being created?  As Bjorn said, moving
this to aux today would probably be good first.

> > > * Adds bounds-checking to all accesses, hardening against a repeat of
> > >   CVE-2024-58007
> >
> > How do you now "know" that the bounds checking is correct?  The C
> > version also had this, it was just "not correct" :)
> 
> While it's technically possible for the Rust code to have an error
> here, the error would not be in the driver, but in the kernel crate.
> The advantage here is that the bounds checking is all centralized, so
> we get it right once, for the entire kernel, instead of needing to get
> it right every time.

I missed where the bounds checking is happening at all here.  I see
fields and sizes of fields, but what is verifying that those sizes are
actually correct?

> > And which accesses are you referring to?  From userspace?  From the
> > kernel?  That CVE looks very odd, it's probably not even a real one and
> > should be revoked, right?
> >
> 
> That CVE looks like this:
> 1. qcom_smem_get returns an object of size N
> 2. When initializing the `serial_number` field of
> soc_device_attributes, the offset of the serial number field was
> checked as <= N, rather than the *end* of the serial number field.
> 3. This resulted in the driver exposing through sysfs whatever data
> was mapped afterwards, interpreted as a number.
> 
> I agree that the severity seems oddly high, given that in practice,
> this will expose the remainder of the IO mapped page - I don't believe
> it crosses a page boundary, so it can't even *really* leak anything.

Where do you see this as "high"?  The kernel CNA does NOT give any
severity info for any CVEs that are issued.

If you are looking at the crap that NVD adds, well, it's just that,
crap, that has no actual relevance to anyone and is flat out wrong most
of the time.  We have asked them to stop doing this, but so far we have
not gotten a response:
	https://github.com/cisagov/vulnrichment/issues/262

In short, for kernel CVEs only look at the data provided by cve.org, or
the raw data provided by the kernel CNA team.

That being said, this seems like a basic "we are just displaying wrong
data in a sysfs file", so it probably should be rejected unless someone
can tell me how it fits the definition of a vulnerability?

As for why it's a CVE at all, it came in as part of the required GSD
import into CVE.org.

> > > +void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int host,
> > > +             unsigned int item, size_t *size)
> > > +{
> > > +     if (IS_ERR(__smem))
> > > +             return __smem;
> > > +     if (aux->dev.parent != __smem->dev)
> > > +             return ERR_PTR(-EINVAL);
> > > +     return qcom_smem_get(host, item, size);
> >
> > So you are returning a void pointer?  But don't you really know the
> > "type" of what is being asked here?  It's a memory chunk, so u8?  Or
> > something else?  void * feels "rough" here.
> >
> > > +}
> > > +EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
> > > +
> > >  /**
> > >   * qcom_smem_get() - resolve ptr of size of a smem item
> > >   * @host:    the remote processor, or -1
> > > @@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
> > >   * Looks up smem item and returns pointer to it. Size of smem
> > >   * item is returned in @size.
> > >   *
> > > + * It is up to the caller to ensure that the qcom_smem device remains
> > > + * loaded by some mechanism when accessing returned memory.
> >
> > What do you mean by "loaded"?  You are saying that the caller needs to
> > rely on this driver remaining in memory for that memory to be "valid"?
> >
> > If this is the case, why not take a reference count?
> >
> > > +impl Smem {
> > > +    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Option<&'a Mmio> {
> > > +        if *dev != *self.dev {
> >
> > How can this ever happen?

I think you missed these review comments?

thanks,

greg k-h
