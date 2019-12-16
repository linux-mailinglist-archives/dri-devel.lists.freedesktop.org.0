Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74811FD91
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 05:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5706E42A;
	Mon, 16 Dec 2019 04:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB84D6E125;
 Mon, 16 Dec 2019 04:24:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 20:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="266149445"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2019 20:24:37 -0800
Date: Sun, 15 Dec 2019 20:13:26 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191216041326.GT14488@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <CAOFGe95rC8A4SuwWtd1tbikw8HGm-TU52_O8iBSJKpDyY0gWNw@mail.gmail.com>
 <20191213231322.GS14488@nvishwa1-DESK.sc.intel.com>
 <CAOFGe97yh5CGTwoP-f3wRGWoTLuWMvMwYFc5Hx3KOkT9XkOxkw@mail.gmail.com>
 <157631949753.7535.12359359451927943176@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157631949753.7535.12359359451927943176@skylake-alporthouse-com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>, sanjay.k.kumar@intel.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>, dave.hansen@intel.com,
 jglisse@redhat.com, jgg@mellanox.com, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>, dan.j.williams@intel.com,
 ira.weiny@intel.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 10:31:37AM +0000, Chris Wilson wrote:
>Quoting Jason Ekstrand (2019-12-14 00:36:19)
>> On Fri, Dec 13, 2019 at 5:24 PM Niranjan Vishwanathapura <
>> niranjana.vishwanathapura@intel.com> wrote:
>>
>>     On Fri, Dec 13, 2019 at 04:58:42PM -0600, Jason Ekstrand wrote:
>>     >
>>     >=A0 =A0 =A0+/**
>>     >=A0 =A0 =A0+ * struct drm_i915_gem_vm_bind
>>     >=A0 =A0 =A0+ *
>>     >=A0 =A0 =A0+ * Bind an object in a vm's page table.
>>     >
>>     >=A0 =A0First off, this is something I've wanted for a while for Vul=
kan, it's
>>     just
>>     >=A0 =A0never made its way high enough up the priority list.=A0 Howe=
ver, it's
>>     going
>>     >=A0 =A0to have to come one way or another soon.=A0 I'm glad to see =
kernel API
>>     for
>>     >=A0 =A0this being proposed.
>>     >=A0 =A0I do, however, have a few high-level comments/questions abou=
t the API:
>>     >=A0 =A0 1. In order to be useful for sparse memory support, the API=
 has to go
>>     the
>>     >=A0 =A0other way around so that it binds a VA range to a range with=
in the BO.=A0
>>     It
>>     >=A0 =A0also needs to be able to handle overlapping where two differ=
ent VA
>>     ranges
>>     >=A0 =A0may map to the same underlying bytes in the BO.=A0 This like=
ly means that
>>     >=A0 =A0unbind needs to also take a VA range and only unbind that ra=
nge.
>>     >=A0 =A0 2. If this is going to be useful for managing GL's address =
space where
>>     we
>>     >=A0 =A0have lots of BOs, we probably want it to take a list of rang=
es so we
>>     >=A0 =A0aren't making one ioctl for each thing we want to bind.
>>
>>     Hi Jason,
>>
>>     Yah, some of these requirements came up.
>>
>> =A0
>> Yes, I have raised them every single time an API like this has come acro=
ss my
>> e-mail inbox for years and they continue to get ignored.=A0 Why are we l=
anding an
>> API that we know isn't the API we want especially when it's pretty obvio=
us
>> roughly what the API we want is?=A0 It may be less time in the short ter=
m, but
>> long-term it means two ioctls and two implementations in i915, IGT tests=
 for
>> both code paths, and code in all UMDs to call one or the other depending=
 on
>> what kernel you're running on, and we have to maintain all that code goi=
ng
>> forward forever.=A0 Sure, that's a price we pay today for a variety of t=
hings but
>> that's because they all seemed like the right thing at the time.=A0 Land=
ing the
>> wrong API when we know it's the wrong API seems foolish.
>
>Exactly. This is not even close to the uAPI we need. Reposting an RFC
>without taking in the concerns last time (or the time before that, or
>the time before that...) suggests that you aren't really requesting for
>comments at all.

Thanks Jason for detailed exlanation.
Chris, all comments and guidance are much appreciated :)

I haven't looked in detail, but my concern is that implementing
partial object binding (offset, lenght) from vma down to [un]binding
in ppgtt might be a lot of work to include in this SVM patch series.
I believe we need the partial object binding in non-SVM scenario
as well?

Ok, let me change the interface as below.

struct drm_i915_gem_vm_bind_va
{
        /** VA start to bind **/
        __u64 start;

        /** Offset in Object to bind for I915_GEM_VM_BIND_SVM_OBJ type **/
        __u64 offset;

        /** VA length to [un]bind **/
        __u64 length;

        /** Type of memory to [un]bind **/
        __u32 type;
#define I915_GEM_VM_BIND_SVM_OBJ      0
#define I915_GEM_VM_BIND_SVM_BUFFER   1

        /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type **/
        __u32 handle;

        /** Flags **/
        __u32 flags;
#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
#define I915_GEM_VM_BIND_READONLY    (1 << 1)
}

struct drm_i915_gem_vm_bind {
        /** vm to [un]bind **/
        __u32 vm_id;

	/** number of VAs to bind **/
	__u32 num_vas;

	/** Array of VAs to bind **/
	struct drm_i915_gem_vm_bind_va *bind_vas;

	/** User extensions **/
        __u64 extensions;
};

When synchronization control is added as extension, it applies to all VAs i=
n the array.
Does this looks good?

Niranjana

>-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
