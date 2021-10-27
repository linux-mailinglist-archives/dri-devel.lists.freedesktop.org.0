Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA743C683
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 11:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D296E878;
	Wed, 27 Oct 2021 09:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB816E878
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 09:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id 0E19E1F43F1B
Subject: Re: drm/virtio: not pin pages on demand
From: Maksym Wezdecki <maksym.wezdecki@collabora.co.uk>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maksym Wezdecki <maksym.wezdecki@collabora.com>,
 David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET AND BLOCK DRIVERS"
 <virtualization@lists.linux-foundation.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
 <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
 <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
 <20211021115212.dk2kl2vbl6qotjwa@sirius.home.kraxel.org>
 <CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com>
 <d1b610f3-6a73-eda1-a35b-3efc85cbb582@collabora.co.uk>
Message-ID: <ff1f2f85-2f14-af01-3f57-ed5abb4e8a49@collabora.co.uk>
Date: Wed, 27 Oct 2021 11:34:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d1b610f3-6a73-eda1-a35b-3efc85cbb582@collabora.co.uk>
Content-Type: multipart/alternative;
 boundary="------------A760D4959662DBF1664DB019"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------A760D4959662DBF1664DB019
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Gerd,

Can we follow up on this issue?

The main pain point with your suggestion is the fact,
that it will cause VirGL protocol breakage and we would
like to avoid this.

Extending execbuffer ioctl and create_resource ioctl is
more convenient than having the protocol broken.

Blob resources is not a solution, too, because QEMU doesn't
support blob resources right now.

In ideal solution when both QEMU and crosvm support blob resources
we can switch to blob resources for textures.

I would like to introduce changes gradually and not make a protocol
breakage.

What do you think about that?

Maksym


On 10/22/21 10:44 AM, Maksym Wezdecki wrote:

> Once again with all lists and receivers. I'm sorry for that.
>
> On 10/21/21 6:42 PM, Chia-I Wu wrote:
>> On Thu, Oct 21, 2021 at 4:52 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>> On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
>>>> I get your point. However, we need to make resource_create ioctl,
>>>> in order to create corresponding resource on the host.
>>> That used to be the case but isn't true any more with the new
>>> blob resources.  virglrenderer allows to create gpu objects
>>> via execbuffer.  Those gpu objects can be linked to a
>>> virtio-gpu resources, but it's optional.  In your case you
>>> would do that only for your staging buffer.  The other textures
>>> (which you fill with a host-side copy from the staging buffer)
>>> do not need a virtio-gpu resource in the first place.
>> That's however a breaking change to the virgl protocol.  All virgl
>> commands expect res ids rather than blob ids.
>>
>> Using VIRTGPU_BLOB_MEM_HOST3D could in theory work.  But there are a
>> few occasions where virglrenderer expects there to be guest storage.
>> There are also readbacks that we need to support.  We might end up
>> using VIRTGPU_BLOB_MEM_HOST3D_GUEST, where pin-on-demand is still
>> desirable.
>>
>> For this patch, I think the uapi change can be simplified.  It can be
>> a new param plus a new field in drm_virtgpu_execbuffer
>>
>>   __u64 bo_flags; /* pointer to an array of size num_bo_handles, or NULL */
>>
>> The other changes do not seem needed.
> My first approach was the same, as you mentioned. However, having "__u64 bo_flags"
> needs a for loop, where only few of the bo-s needs to be pinned - this has
> performance implications. I would rather pass bo handles that should be pinned than
> having a lot of flags, where only 1-2 bos needs to be pinned.
>
>>> take care,
>>>   Gerd
>>>

--------------A760D4959662DBF1664DB019
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Gerd,</pre>
    <pre>Can we follow up on this issue?</pre>
    <pre>The main pain point with your suggestion is the fact,
that it will cause VirGL protocol breakage and we would
like to avoid this.

Extending execbuffer ioctl and create_resource ioctl is
more convenient than having the protocol broken.

Blob resources is not a solution, too, because QEMU doesn't
support blob resources right now.

In ideal solution when both QEMU and crosvm support blob resources
we can switch to blob resources for textures.

I would like to introduce changes gradually and not make a protocol
breakage.

What do you think about that?

Maksym


</pre>
    <div class="moz-cite-prefix">
      <pre>On 10/22/21 10:44 AM, Maksym Wezdecki wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:d1b610f3-6a73-eda1-a35b-3efc85cbb582@collabora.co.uk">
      <pre class="moz-quote-pre" wrap="">Once again with all lists and receivers. I'm sorry for that.

On 10/21/21 6:42 PM, Chia-I Wu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, Oct 21, 2021 at 4:52 AM Gerd Hoffmann <a class="moz-txt-link-rfc2396E" href="mailto:kraxel@redhat.com">&lt;kraxel@redhat.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I get your point. However, we need to make resource_create ioctl,
in order to create corresponding resource on the host.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">That used to be the case but isn't true any more with the new
blob resources.  virglrenderer allows to create gpu objects
via execbuffer.  Those gpu objects can be linked to a
virtio-gpu resources, but it's optional.  In your case you
would do that only for your staging buffer.  The other textures
(which you fill with a host-side copy from the staging buffer)
do not need a virtio-gpu resource in the first place.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">That's however a breaking change to the virgl protocol.  All virgl
commands expect res ids rather than blob ids.

Using VIRTGPU_BLOB_MEM_HOST3D could in theory work.  But there are a
few occasions where virglrenderer expects there to be guest storage.
There are also readbacks that we need to support.  We might end up
using VIRTGPU_BLOB_MEM_HOST3D_GUEST, where pin-on-demand is still
desirable.

For this patch, I think the uapi change can be simplified.  It can be
a new param plus a new field in drm_virtgpu_execbuffer

  __u64 bo_flags; /* pointer to an array of size num_bo_handles, or NULL */

The other changes do not seem needed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My first approach was the same, as you mentioned. However, having "__u64 bo_flags"
needs a for loop, where only few of the bo-s needs to be pinned - this has
performance implications. I would rather pass bo handles that should be pinned than
having a lot of flags, where only 1-2 bos needs to be pinned.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">take care,
  Gerd

</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A760D4959662DBF1664DB019--
