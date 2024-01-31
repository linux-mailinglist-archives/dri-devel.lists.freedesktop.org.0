Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F08441DA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6851610F1BE;
	Wed, 31 Jan 2024 14:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933410F1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:28:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so5954289a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706711222; x=1707316022; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OeZhk9JphCYYMff7RoTbJ54B8cgaBzAdcxQolkBD6SQ=;
 b=BITkc5YRtmR0SYgFWULkPbLhnHp9J0DxO95JB5VVsYudpLJ9U1DTvPkpCaUV8FW9QY
 WD22iqAkAjmPjqV+f05dzZwXnZOKl+7at8wx4nDIwzlL19azW9TG55+8TzBoSOnDiHzg
 GPS8o1QiXEvfFU4uOYefdjG8k3SY1cHb/oawxVGj8Z1XQCJVRJRsYey+aWS2USdolCV/
 RyOVlLgDA2RL0Kop40+CgS1SRHIqZfJXlKYMH652InYPUTsez/5usMuDqke04kRb+Cxb
 V0BHMrvh/GK+/bbJHRgwA6X6F9WhBguLTyD/gzwBEBhsAa8xfKUijT/5nJN0UFoHUGH1
 OqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706711222; x=1707316022;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeZhk9JphCYYMff7RoTbJ54B8cgaBzAdcxQolkBD6SQ=;
 b=FEyAA7KMHI3S3FllMuByOhriqDcbjzsDLz5X0GA6ZOCaZ01C6Gz/CAc64aP0q8LyQf
 a3HIv4meuKDxvBAB7EAjNexmXbrNDQMon1Ib85D2oqGyd8Ycptd0LYS/wsMe24ggJAbJ
 Q9Im9bzFP+tj7t8m/6A2xkxWEhezHEXnI1cS1dFfSW3kpifKi3q5sjlVhE9pLJLMWYv0
 N3m9rk/IES5WRH1mlwGyuMNg8y+XGMTS3knI6KIjZrJYx4ccaDdCl2+RGSzUOxhDxgXY
 HYWCTbHiKXMEtYQJkZlXXAm8kOZKdiz3VSH/PhBvhiKGm4M3febHfuXACZ94axIOBaot
 KZcw==
X-Gm-Message-State: AOJu0Yzk7Syqx4DqE7rKGt8WqlrNruPl+BT7UjRXyVlY/alsOuDiJerM
 VZDLvsAFCMhnjn6CGiqGO1x88HWB3264qdS91BZIXXNskMFtfe2LpsDVOPzQ8o0MCDJVJoa+yG3
 R05rXHQawnRGGfbb6hl8SNJFNvpnNbwTlYkjOpA==
X-Google-Smtp-Source: AGHT+IFzY4aeNzPPtRi4I/P+0HsgxpbXl1Z6p1RuP6G0wTGJLY9yXhwO9Z/fDRffrhpDRT4DutQR0T4S92miQ4XswgI=
X-Received: by 2002:aa7:c759:0:b0:55f:1232:fbc7 with SMTP id
 c25-20020aa7c759000000b0055f1232fbc7mr1354471eds.37.1706711221701; Wed, 31
 Jan 2024 06:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20240117181141.286383-1-tjmercier@google.com>
 <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
In-Reply-To: <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 31 Jan 2024 19:56:50 +0530
Message-ID: <CAO_48GEHpij-_q85NaVHc9hH5bEoaWT6hcOe_LLZ2pNHsb8Jjw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under
 RssFile
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="0000000000001aa04106103eac13"
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
Cc: android-mm@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, minchan@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "T.J. Mercier" <tjmercier@google.com>, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, daniel@ffwll.ch,
 John Stultz <john.stultz@linaro.org>, Laura Abbott <labbott@redhat.com>,
 Sandeep Patil <sspatil@android.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001aa04106103eac13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi TJ,

On Thu, 18 Jan 2024 at 15:32, Christian K=C3=B6nig <christian.koenig@amd.co=
m>
wrote:

> Am 17.01.24 um 19:11 schrieb T.J. Mercier:
>
> DMA buffers allocated from the CMA dma-buf heap get counted under
> RssFile for processes that map them and trigger page faults. In
> addition to the incorrect accounting reported to userspace, reclaim
> behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
> this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
> VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
> dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
>
> The system dma-buf heap does not suffer from this issue since
> remap_pfn_range is used during the mmap of the buffer, which also sets
> VM_PFNMAP on the VMA.
>
>
> Mhm, not an issue with this patch but Daniel wanted to add a check for
> VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.
>
> I don't fully remember the discussion but for some reason that was never
> committed. We should probably try that again.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/mm/vmscan.c?id=3Dfb46e22a9e3863e08aef8815df9f17d0f4b9aede
>
> Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> Signed-off-by: T.J. Mercier <tjmercier@google.com> <tjmercier@google.com>
>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> <christian.koenig@amd.com>
>
Thanks for the patch; pushed to drm-misc-fixes.

Best,
Sumit

>
>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index ee899f8e6721..4a63567e93ba 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault =
*vmf)
>  	if (vmf->pgoff > buffer->pagecount)
>  		return VM_FAULT_SIGBUS;
>
> -	vmf->page =3D buffer->pages[vmf->pgoff];
> -	get_page(vmf->page);
> -
> -	return 0;
> +	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf-=
>pgoff]));
>  }
>
>  static const struct vm_operations_struct dma_heap_vm_ops =3D {
> @@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, stru=
ct vm_area_struct *vma)
>  	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
>  		return -EINVAL;
>
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +
>  	vma->vm_ops =3D &dma_heap_vm_ops;
>  	vma->vm_private_data =3D buffer;
>
>
>
>

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

--0000000000001aa04106103eac13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi TJ,</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 18 Jan 2024 at 15:32, Chris=
tian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">christian.k=
oenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><u></u>

 =20
  <div>
    Am 17.01.24 um 19:11 schrieb T.J. Mercier:<br>
    <blockquote type=3D"cite">
      <pre>DMA buffers allocated from the CMA dma-buf heap get counted unde=
r
RssFile for processes that map them and trigger page faults. In
addition to the incorrect accounting reported to userspace, reclaim
behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.

The system dma-buf heap does not suffer from this issue since
remap_pfn_range is used during the mmap of the buffer, which also sets
VM_PFNMAP on the VMA.</pre>
    </blockquote>
    <br>
    Mhm, not an issue with this patch but Daniel wanted to add a check
    for VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.<br=
>
    <br>
    I don&#39;t fully remember the discussion but for some reason that was
    never committed. We should probably try that again.<br>
    <br>
    <span style=3D"white-space:pre-wrap">
</span>
    <blockquote type=3D"cite">
      <pre>[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/linux.git/commit/mm/vmscan.c?id=3Dfb46e22a9e3863e08aef8815df9f17d0f=
4b9aede" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/=
torvalds/linux.git/commit/mm/vmscan.c?id=3Dfb46e22a9e3863e08aef8815df9f17d0=
f4b9aede</a>

Fixes: b61614ec318a (&quot;dma-buf: heaps: Add CMA heap to dmabuf heaps&quo=
t;)
Signed-off-by: T.J. Mercier <a href=3D"mailto:tjmercier@google.com" target=
=3D"_blank">&lt;tjmercier@google.com&gt;</a></pre>
    </blockquote>
    <br>
    Acked-by: Christian K=C3=B6nig <a href=3D"mailto:christian.koenig@amd.c=
om" target=3D"_blank">&lt;christian.koenig@amd.com&gt;</a></div></blockquot=
e><div>Thanks for the patch; pushed to drm-misc-fixes.</div><div><br></div>=
<div>Best,</div><div>Sumit=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div><br>
    <br>
    <blockquote type=3D"cite">
      <pre>---
 drivers/dma-buf/heaps/cma_heap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_h=
eap.c
index ee899f8e6721..4a63567e93ba 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *v=
mf)
 	if (vmf-&gt;pgoff &gt; buffer-&gt;pagecount)
 		return VM_FAULT_SIGBUS;
=20
-	vmf-&gt;page =3D buffer-&gt;pages[vmf-&gt;pgoff];
-	get_page(vmf-&gt;page);
-
-	return 0;
+	return vmf_insert_pfn(vma, vmf-&gt;address, page_to_pfn(buffer-&gt;pages[=
vmf-&gt;pgoff]));
 }
=20
 static const struct vm_operations_struct dma_heap_vm_ops =3D {
@@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct=
 vm_area_struct *vma)
 	if ((vma-&gt;vm_flags &amp; (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
 		return -EINVAL;
=20
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
 	vma-&gt;vm_ops =3D &amp;dma_heap_vm_ops;
 	vma-&gt;vm_private_data =3D buffer;
=20
</pre>
    </blockquote>
    <br>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Thanks and regards,<br><br>Sumit Semwal (he / him)<br>Tech L=
ead - LCG, Vertical Technologies<br>Linaro.org =E2=94=82 Open source softwa=
re for ARM SoCs</div></div></div>

--0000000000001aa04106103eac13--
