Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F1163ED4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5EA6EB1F;
	Wed, 19 Feb 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7C36EA6E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 18:40:42 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id o18so9609655qvf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 10:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbCQVGIR0H/U5uX1C/LE/UiqByMUJDCNzvfZq53o630=;
 b=qQNHRxuL3vB+wi6m21mYrhTViPveHv6OjMbrg22VjfhtHWj53eHbLnVtIOOZAoB/sF
 Q5apQ5oA46/8XMUzWbO+hGKosrGEF4OfQML2HwZ08KD+Vb3NjN3rgAljzzHkOANMzg1o
 u+Wp7zBTC3LBF390lLLp+xdPGtLQriR+0Fndmf5KnO0h3fhse6JgPkehsySA4t/SuUBr
 kUG9gy5KxCNV6CxPK3Grtm5AcFIkwgtKK/+E01aivcJidcOlKs1P7lDObtNAdoP7RxsX
 3nSD/76PkWR8uwbchDHTxC+64UKpvF4ihy0vtqQMhilltkYMD8n7qlBZ0e/tHYEMJxPa
 AayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbCQVGIR0H/U5uX1C/LE/UiqByMUJDCNzvfZq53o630=;
 b=NZWflps2in6R3JjrOmRIT7XA0NwcqKutt6nUFLhQyGexa7Ownco9yU45tL0Sbpgerl
 mQBXzkB6GKJTg+rig6prmcA8KtpYK6zKxE7tzAbCso72KkDNZFupKLFwkQ12+BuLU3Qn
 gfyRImk6LlSEtG0YKNzaLzJjf59JpfgWzdKe8Dz4v0xWNkt6enotj6tvUjmwe/QM/ckn
 WF66JbLMdgvkM5yYvUdweftEI1Cvv6YJ1xUEy+o2pKmoQ8+hkrA09HL3zIjvRB0z9ahe
 OmyEcRWqk/ppNcYRflLCvD7a/0SNJs0HMagcLgQf+Jx1YJtVL8qxHXVC81pxJchCq+uG
 KsAA==
X-Gm-Message-State: APjAAAWr6cNWphYRMJDzIYwLAd0+tB02y1QAJ962hQ/9Rue9XE/K16Lq
 CHbojzj/ssfIH9iUNWbadW68KudRAKaZRNWsKpQImw==
X-Google-Smtp-Source: APXvYqw6vMI/vxj7jL5pg2KB1gWZPpYiNaBLVLijbDnbkZ1gzjnt3LZw6s5jYU1wdHlmsYh8H8PddqkNQ8tDsHDqPtA=
X-Received: by 2002:a05:6214:334:: with SMTP id
 j20mr1805029qvu.53.1582051241104; 
 Tue, 18 Feb 2020 10:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
In-Reply-To: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
From: Chenbo Feng <fengc@google.com>
Date: Tue, 18 Feb 2020 10:40:30 -0800
Message-ID: <CAMOXUJnYtUOTei02TePBRBh6tjgVuVNg_4H2QYML0ghaGYYzUg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
To: Cong Wang <xiyou.wangcong@gmail.com>
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1900715426=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1900715426==
Content-Type: multipart/alternative; boundary="0000000000003e81c6059ede02f2"

--0000000000003e81c6059ede02f2
Content-Type: text/plain; charset="UTF-8"

Acked-by: Chenbo Feng <fengc@google.com>

On Thu, Dec 26, 2019 at 10:32 PM Cong Wang <xiyou.wangcong@gmail.com> wrote:

> dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> it never gets freed.
>
> Free it in dma_buf_release().
>
> Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> Cc: Greg Hackmann <ghackmann@google.com>
> Cc: Chenbo Feng <fengc@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> ---
>  drivers/dma-buf/dma-buf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ce41cd9b758a..2427398ff22a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct
> file *file)
>                 dma_resv_fini(dmabuf->resv);
>
>         module_put(dmabuf->owner);
> +       kfree(dmabuf->name);
>         kfree(dmabuf);
>         return 0;
>  }
> --
> 2.21.0
>
>

--0000000000003e81c6059ede02f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Chenbo Feng &lt;<a href=3D"mailto:fengc@google.c=
om">fengc@google.com</a>&gt;<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 26, 2019 at 10:32 PM Cong Wang =
&lt;<a href=3D"mailto:xiyou.wangcong@gmail.com" target=3D"_blank">xiyou.wan=
gcong@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but onc=
e set<br>
it never gets freed.<br>
<br>
Free it in dma_buf_release().<br>
<br>
Fixes: bb2bb9030425 (&quot;dma-buf: add DMA_BUF_SET_NAME ioctls&quot;)<br>
Reported-by: <a href=3D"mailto:syzbot%2Bb2098bc44728a4efb3e9@syzkaller.apps=
potmail.com" target=3D"_blank">syzbot+b2098bc44728a4efb3e9@syzkaller.appspo=
tmail.com</a><br>
Cc: Greg Hackmann &lt;<a href=3D"mailto:ghackmann@google.com" target=3D"_bl=
ank">ghackmann@google.com</a>&gt;<br>
Cc: Chenbo Feng &lt;<a href=3D"mailto:fengc@google.com" target=3D"_blank">f=
engc@google.com</a>&gt;<br>
Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=3D"_=
blank">sumit.semwal@linaro.org</a>&gt;<br>
Signed-off-by: Cong Wang &lt;<a href=3D"mailto:xiyou.wangcong@gmail.com" ta=
rget=3D"_blank">xiyou.wangcong@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/dma-buf/dma-buf.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
index ce41cd9b758a..2427398ff22a 100644<br>
--- a/drivers/dma-buf/dma-buf.c<br>
+++ b/drivers/dma-buf/dma-buf.c<br>
@@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct =
file *file)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_fini(dmabu=
f-&gt;resv);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_put(dmabuf-&gt;owner);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dmabuf-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(dmabuf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div>

--0000000000003e81c6059ede02f2--

--===============1900715426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1900715426==--
