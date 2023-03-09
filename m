Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA46B23AC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 13:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619810E7FB;
	Thu,  9 Mar 2023 12:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AB510E7FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aPUoKZqvfuD+mphoHGghF/IdQ3Fkrk+RW1l/3m7ZZk4=; b=scrrVscrgKXQEsbE7jZHR5v3Q4
 RObBukIVBALTABNThGPDZj/Z1rzsesFEndtXmk+Rm2hKoYC89fQMBWxoDgq463GNHzWOr+Te70X4X
 a2eCONRy4yYZjllIIeq1ZnkqDYU0W9rOPQVI3Qq8m8KPKhDY7J99MpuGAajTuuVprqNkuthzMLCsh
 shnALKY5Fjrtzi0ewUsOO4L3HWi9sQw9JcpVJbg8A1F8Tad2Lt5HhmRaaUemftBy501uVRiWVXqtP
 S6ZxRdgyxxsnskvJ8VCCtFqFymFNwXEUUb+3qkNkVb7J8bkV6cn92tOLVA0RDJ+xAdNuuF3CQ72Nm
 qafTtm4g==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1paF5J-001X5J-WF; Thu, 09 Mar 2023 13:09:26 +0100
Message-ID: <b0d69e2a-9ba6-df31-1887-0d1e69fd148b@igalia.com>
Date: Thu, 9 Mar 2023 09:09:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Asahi Lina <lina@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
 <c047e11f-33d0-6af4-21c3-adb384b68d8b@igalia.com>
 <93a57598-9deb-85f2-ebd9-8605404c1ef8@asahilina.net>
 <CAPM=9tw6aUUgL63EFhX6W_mQa1ssEmcPjJJHhrssasRVPt76rg@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <CAPM=9tw6aUUgL63EFhX6W_mQa1ssEmcPjJJHhrssasRVPt76rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, linux-media@vger.kernel.org,
 Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, linaro-mm-sig@lists.linaro.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/23 03:15, Dave Airlie wrote:
> On Thu, 9 Mar 2023 at 15:32, Asahi Lina <lina@asahilina.net> wrote:
>>
>> On 08/03/2023 00.32, Maíra Canal wrote:
>>> On 3/7/23 11:25, Asahi Lina wrote:
>>>> DRM drivers need to be able to declare which driver-specific ioctls they
>>>> support. This abstraction adds the required types and a helper macro to
>>>> generate the ioctl definition inside the DRM driver.
>>>>
>>>> Note that this macro is not usable until further bits of the
>>>> abstraction are in place (but it will not fail to compile on its own, if
>>>> not called).
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>    drivers/gpu/drm/Kconfig         |   7 ++
>>>>    rust/bindings/bindings_helper.h |   2 +
>>>>    rust/kernel/drm/ioctl.rs        | 147 ++++++++++++++++++++++++++++++++++++++++
>>>>    rust/kernel/drm/mod.rs          |   5 ++
>>>>    rust/kernel/lib.rs              |   2 +
>>>>    5 files changed, 163 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index dc0f94f02a82..dab8f0f9aa96 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -27,6 +27,13 @@ menuconfig DRM
>>>>         details.  You should also select and configure AGP
>>>>         (/dev/agpgart) support if it is available for your platform.
>>>>
>>>
>>> [...]
>>>
>>>> +
>>>> +/// Declare the DRM ioctls for a driver.
>>>> +///
>>>> +/// Each entry in the list should have the form:
>>>> +///
>>>> +/// `(ioctl_number, argument_type, flags, user_callback),`
>>>> +///
>>>> +/// `argument_type` is the type name within the `bindings` crate.
>>>> +/// `user_callback` should have the following prototype:
>>>> +///
>>>> +/// ```
>>>> +/// fn foo(device: &kernel::drm::device::Device<Self>,
>>>> +///        data: &mut bindings::argument_type,
>>>> +///        file: &kernel::drm::file::File<Self::File>,
>>>> +/// )
>>>> +/// ```
>>>> +/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
>>>> +///
>>>> +/// # Examples
>>>> +///
>>>> +/// ```
>>>> +/// kernel::declare_drm_ioctls! {
>>>> +///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
>>>> +/// }
>>>> +/// ```
>>>> +///
>>>> +#[macro_export]
>>>> +macro_rules! declare_drm_ioctls {
>>>> +    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
>>>> +        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
>>>> +            const _:() = {
>>>> +                let i: u32 = $crate::bindings::DRM_COMMAND_BASE;
>>>> +                // Assert that all the IOCTLs are in the right order and there are no gaps,
>>>> +                // and that the sizeof of the specified type is correct.
>>>
>>> I believe that not necessarily the IOCTLs need to be in the right order and
>>> with no gaps. For example, armada_drm.h has a gap in between 0x00 and
>>> 0x02 and exynos_drm.h also have gaps. Moreover, some drivers, like vgem and
>>> virtgpu, start their IOCTLs with 0x01.
>>
>> Yeah, we talked about this a bit... do you have any ideas about how to
>> design this? I think it should be possible with a const function
>> initializing an array entry by entry, we just need a two-pass macro
>> (once to determine the max ioctl number, then again to actually output
>> the implementation).
>>
>> I'm not sure why drivers would have gaps in the ioctl numbers though...
>> my idea was that new drivers shouldn't need that as far as I can tell
>> (you can't remove APIs after the fact due to UAPI stability guarantees,
>> so as long as you don't have gaps to begin with...). But I guess if
>> we're reimplementing existing drivers in Rust we'll need this... though
>> maybe it makes sense to just say it's not supported and require
>> reimplementations that have holes to just explicitly add dummy ioctls
>> that return EINVAL? We could even provide such a dummy generic ioctl
>> handler on the abstraction side, so drivers just have to add it to the
>> list, or make the macro take a special token that is used for
>> placeholder ioctls that don't exist (which then creates the NULL
>> function pointer that the drm core interprets as invalid)...
> 
> I can think of two reason for gaps having appeared:
> 
> a) developers wanted to group new uapis at a nice base number.
> This is never essential it's just makes things easier to read, and
> allows slotting other ioctls into the gaps later.
> 
> b) parallel feature development ends up conflicting then one thread never lands.
> I've got two-three devs each adding a uAPI, we assign them 0x10, 0x11,
> 0x12 while they work, then 0x11 never lands because it was a bad idea.
> 
> However I think you should be fine enforcing a non-sparse space here
> unless we want to handle replacing current drivers, as long as it's
> hard to screw up so you know early.

I guess it would be nice to support old UAPIs for cases of reimplementations.
Currently, I'm working on a reimplementation of vgem and I ended up having to
create a dummy IOCTL to deal with the sparse number space. Although creating
dummy IOCTLs works, I don't believe it is a nice practice.

Moreover, I believe that if we keep developing new drivers with Rust, cases
(a) and (b) will end up happening, and maybe the Rust abstractions should
work like DRM and allow it to happen.

Best Regards,
- Maíra Canal

> 
> Dave.
