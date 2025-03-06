Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0AA53F0C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 01:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AECA10E878;
	Thu,  6 Mar 2025 00:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="WZcVsfI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6826 seconds by postgrey-1.36 at gabe;
 Thu, 06 Mar 2025 00:24:30 UTC
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6010E878;
 Thu,  6 Mar 2025 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=7i7nfeayubfi5gqgovqg3wpoeq.protonmail; t=1741220667; x=1741479867;
 bh=zM6T0I1UDmm6pK0qaYYW60tPdabgjnBTsVC6Y/zI8KY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=WZcVsfI7qYj4WAZOGHfQb7lCbP1yZ1/lSOuNILHMFYSHa4/uZtr2x6VVCKmX2VSRu
 4XBLKSpZrd6O0S6t4dQWmMS4vzSqk8KfEBjBYNy+xrMRPHvbTHk+FY+DlSEhAFhw8S
 tnH8nfLTD3rXiSwAX+wQlw8xWBDJhUHJygGMCZVtsfDp3c7R9+t4xemK2xGtKISEsU
 ROPXFdpVUwKYFvQ3PpSr3mbXIZ3En3zvogFQRAFbw9PF01jBFml22Ig0KbnsXZaVol
 7+q8vjZJ3x9hAN+PzETkNgnZ3lVMOW/IqD7r5Qb5t2EKG1xZTL7ZJ1isqLqAzIX63o
 JyTa0JnlpcsEw==
Date: Thu, 06 Mar 2025 00:24:21 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/5] rust: firmware: introduce
 `firmware::ModInfoBuilder`
Message-ID: <D88R7HI1Z6GG.ZOQ9A1VQOR28@proton.me>
In-Reply-To: <Z8jk3qs6nCIJz-39@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org> <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me>
 <Z8jSV5CpZDcXrviY@pollux> <D88Q7503C8FF.2TMMBSEMOGKU1@proton.me>
 <Z8jk3qs6nCIJz-39@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: da2143f6321c35ea1a493628d2ba460ec60f7fa3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu Mar 6, 2025 at 12:57 AM CET, Danilo Krummrich wrote:
> On Wed, Mar 05, 2025 at 11:36:54PM +0000, Benno Lossin wrote:
>> On Wed Mar 5, 2025 at 11:38 PM CET, Danilo Krummrich wrote:
>> > On Wed, Mar 05, 2025 at 10:30:31PM +0000, Benno Lossin wrote:
>> >> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
>> >> > +    /// Push an additional path component.
>> >> > +    ///
>> >> > +    /// After a new [`ModInfoBuilder`] instance has been created, =
[`ModInfoBuilder::prepare`] must
>> >> > +    /// be called before adding path components.
>> >> > +    pub const fn push(self, s: &str) -> Self {
>> >> > +        if N !=3D 0 && self.n =3D=3D 0 {
>> >> > +            crate::build_error!("Must call prepare() before push()=
.");
>> >>
>> >> This will only prevent the first `prepare` call being missed, right?
>> >
>> > Correct, unfortunately there's no way to detect subsequent ones.
>>
>> Does it make sense to do that one in the constructor?
>>
>> (After looking at the example below) Ah maybe you can't do that, since
>> then you would have two `prepare()` calls for the example below...?
>
> Exactly.
>
>> >> If you always have to call this before `push`, why not inline it ther=
e?
>> >
>> > You can push() multiple times to compose the firmware path string (whi=
ch is the
>> > whole purpose :).
>>
>> Ah I see, I only looked at the example you have in the next patch. All
>> in all, I think this patch could use some better documentation, since I
>> had to read a lot of the code to understand what everything is supposed
>> to do...
>
> I can expand the example in module_firmware! to make things a bit more ob=
vious.
>
> Otherwise, what information do you think is missing?

Abstractly: what `ModInfoBuilder` *does*, concretely:
- why the generic constant `N` exists,
- what `prepare()` does,
- what happens with the `module_name` parameter of `new`
- answer the question "I want that the builder outputs the string `???`
  can it do that? If yes, how do I do it?"

>> It might also make sense to make this more generic, since one probably
>> also needs this in other places? Or do you think this will only be
>> required for modinfo?
>
> Currently, I don't think there's any more need for a generic const string
> builder. For now, I think we're good. Let's factor it out, once we have a=
ctual
> need for that.

Sounds good.

---
Cheers,
Benno

