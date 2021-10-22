Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD943740C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0406E90A;
	Fri, 22 Oct 2021 08:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604036E900
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 08:40:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id 0C3391F44F5E
Subject: Re: drm/virtio: not pin pages on demand
To: dri-devel@lists.freedesktop.org
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
 <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
 <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
 <20211021115212.dk2kl2vbl6qotjwa@sirius.home.kraxel.org>
 <CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com>
From: Maksym Wezdecki <maksym.wezdecki@collabora.co.uk>
Message-ID: <6f2f970f-7348-f978-044d-1eee1fea13b8@collabora.co.uk>
Date: Fri, 22 Oct 2021 10:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------C2421621C57E8EF7ECC812D9"
Content-Language: en-US
X-Mailman-Approved-At: Fri, 22 Oct 2021 08:54:59 +0000
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
--------------C2421621C57E8EF7ECC812D9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 10/21/21 6:42 PM, Chia-I Wu wrote:
> On Thu, Oct 21, 2021 at 4:52 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>> On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
>>> I get your point. However, we need to make resource_create ioctl,
>>> in order to create corresponding resource on the host.
>> That used to be the case but isn't true any more with the new
>> blob resources.  virglrenderer allows to create gpu objects
>> via execbuffer.  Those gpu objects can be linked to a
>> virtio-gpu resources, but it's optional.  In your case you
>> would do that only for your staging buffer.  The other textures
>> (which you fill with a host-side copy from the staging buffer)
>> do not need a virtio-gpu resource in the first place.
> That's however a breaking change to the virgl protocol.  All virgl
> commands expect res ids rather than blob ids.
>
> Using VIRTGPU_BLOB_MEM_HOST3D could in theory work.  But there are a
> few occasions where virglrenderer expects there to be guest storage.
> There are also readbacks that we need to support.  We might end up
> using VIRTGPU_BLOB_MEM_HOST3D_GUEST, where pin-on-demand is still
> desirable.
>
> For this patch, I think the uapi change can be simplified.  It can be
> a new param plus a new field in drm_virtgpu_execbuffer
>
>   __u64 bo_flags; /* pointer to an array of size num_bo_handles, or NULL */
>
> The other changes do not seem needed.

My first approach was the same, as you mentioned. However, having "__u64 bo_flags"
needs a for loop, where only few of the bo-s needs to be pinned - this has
performance implications. I would rather pass bo handles that should be pinned than
having a lot of flags, where only 1-2 bos needs to be pinned.

>
>> take care,
>>   Gerd
>>

--------------C2421621C57E8EF7ECC812D9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/21 6:42 PM, Chia-I Wu wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Oct 21, 2021 at 4:52 AM Gerd Hoffmann <a class="moz-txt-link-rfc2396E" href="mailto:kraxel@redhat.com">&lt;kraxel@redhat.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I get your point. However, we need to make resource_create ioctl,
in order to create corresponding resource on the host.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That used to be the case but isn't true any more with the new
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

The other changes do not seem needed.</pre>
    </blockquote>
    <pre>My first approach was the same, as you mentioned. However, having "__u64 bo_flags"
needs a for loop, where only few of the bo-s needs to be pinned - this has
performance implications. I would rather pass bo handles that should be pinned than
having a lot of flags, where only 1-2 bos needs to be pinned.
</pre>
    <blockquote type="cite"
cite="mid:CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
take care,
  Gerd

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------C2421621C57E8EF7ECC812D9--
