Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D4C1F102
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A54910E8EE;
	Thu, 30 Oct 2025 08:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d8sqBFvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8588610E696
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:54:21 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-592f1f75c46so1047237e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761692060; x=1762296860; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aisF7ddVD9IhLbWjOfio7/ZCoiJu6awZBLaswdfgm+o=;
 b=d8sqBFvXP2wKZC4v6AV/Ms0Fy6029aNqSMcjm4CY5prp2FH3jgDvuyYc48C4H6fBs+
 UZeygGPLfDVxXyY9oT/84YWbE1YZjZlTXCORnwC4mjuclfFITJSFN8Vz+R5H9QAfv9wM
 6A7Q+e906BQqra1mlymYKTdzYkzvbs1giXomlhtylGZIrTMfMPEHLWFHvbgA5G0iJMST
 F7+OjemrL+AY1SrCF9xYER6wV0rQbLH77Dmbrmwxl+G5vXQ7Uq2tQZQmsR8zkuZCa/L1
 ZktNAGKofjNjieXhNtVZxNWze+05++TRYk1WHkImMiQnqUuRmWmF0SqyxGFQiYKSdqBW
 1vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761692060; x=1762296860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aisF7ddVD9IhLbWjOfio7/ZCoiJu6awZBLaswdfgm+o=;
 b=NUCWNerrPMdOGLsMdRQOv62Vmto4RKgn0U1huA31iiIA4F0Rc0B1AY96Z+tUThz0Qv
 MbTk+7oxipguIxIuTpsx6G7hyCL7O+3qOx2ZVSbH4tZdqxftOEbGECUSfsFQZVtcFcJJ
 EmHOOxunkwnyYz5p00DyuIyXmV47s+SHSWOYCn+PC075thzlmQt8JULaA/8VWkqCbd5T
 wYA4PEGS2xOlxvq4iujYHfrzwB6qUGwAl7ITx78cJ8RffMJYvckSkhxNp2dfGYCadAnR
 ykcMJKqNno0hrCaGLaDEVP/gUBAYU8cKaiq+FIG/pNRlxc+q1fAmD1cJE6n6TgVPJAyH
 aXUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU/rO2llo/JZK8bS6xc0C3fSvCGnn7PRUcuzQoNnHEpkmDF7kZyEccZvC3OsRRDaVqmoD2AqV0vss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCpt9Zm2UlEpqI9SeVmjEkyJT5/sFX6GiGsaElAtgWGswZKdka
 IGN37kARRbAQHL8bljpUCX8zQQw9RJa4FW/o8TCM40TtbXAfNgrtDUuuUgkPxA/Cy3f9hdrI6GY
 RQl6OyK69Ds7Y0i5DN7GInKjBKKLnsRD++i3A+qE86VCGQM9R4X0Vc4b86CqQLBcx1mROqfA=
X-Gm-Gg: ASbGncsycFnQm7uWvKvGM2pFJmr3in0VPzw9ted/t6RoTaE7GQz31+kxEw/ZXzSCS/c
 VmWNPNeHfHqRGqHfK+fsuPlOqzpxp9hoBs59EOceZO5HsNeEp0+T4j/FwkklKOAoNx+Pipw8+hv
 FeOLYUMs4nxTsJ4kQpNlgD2N9G59RiQRHNq0xPT8SYIXW5yk39wXY1s+km82Jvq34ocCctaN0Uk
 1MYIKiRNVTeMVVQNulaTN/FgI+qRz+eRlAiaGRRIZa+bhIj2H6tbV7FPX5u5GZk2JrfI/JNuSAV
 w8yaMz6xQ7CUBu4N3TLmKRFwsEqX
X-Google-Smtp-Source: AGHT+IGPblBkUhbF/C9fqA11UgoH3h3R0ywcPNKBX+oOHXySvsyd9xDFkvLlcgwY4yy3GlrK2Te1o4JriZX9QRldC+ybIzGZxz1m8djJ
X-Received: by 2002:a05:6512:3f0e:b0:57d:720:9eb0 with SMTP id
 2adb3069b0e04-594128e00b4mr202617e87.10.1761692059550; Tue, 28 Oct 2025
 15:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251019183508.20804-1-mercmerc961@gmail.com>
 <9e81bc14-39e6-419b-bb4f-67d8d2701025@gmx.de>
In-Reply-To: <9e81bc14-39e6-419b-bb4f-67d8d2701025@gmx.de>
From: merc merc <mercmerc961@gmail.com>
Date: Wed, 29 Oct 2025 04:24:06 +0530
X-Gm-Features: AWmQ_bnALF3VwLS9EVWSPODKqgy5w4OBK67jqykUHiHsz9xC96QNeUTkY0GV4vo
Message-ID: <CALLCVzXLhSwJ9a1z+LP8Lr0k6-dYsmmA1yT7d+TQJAzJon=HoQ@mail.gmail.com>
Subject: Re: [PATCH] video: fb: Fix typo in comment
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000069c62a06423fe511"
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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

--00000000000069c62a06423fe511
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=92=96

merc reacted via Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

On Wed, Oct 29, 2025, 02:42 Helge Deller <deller@gmx.de> wrote:

> On 10/19/25 20:35, PIYUSH CHOUDHARY wrote:
> > Fix typo: "verical" -> "vertical" in macro description
> >
> > Signed-off-by: PIYUSH CHOUDHARY <mercmerc961@gmail.com>
> > ---
> >   include/uapi/linux/fb.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
>
> applied.
>
> Thanks!
> Helge
>

--00000000000069c62a06423fe511
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=92=96",
  "version": 1
}
--00000000000069c62a06423fe511
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=92=96<=
/p><p style=3D"margin-top:10px;margin-bottom:0">merc reacted via <a style=
=3D"color:unset;text-decoration:underline" href=3D"https://www.google.com/g=
mail/about/?utm_source=3Dgmail-in-product&amp;utm_medium=3Det&amp;utm_campa=
ign=3Demojireactionemail#app">Gmail</a></p></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oc=
t 29, 2025, 02:42 Helge Deller &lt;<a href=3D"mailto:deller@gmx.de">deller@=
gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 10/19/25 2=
0:35, PIYUSH CHOUDHARY wrote:<br>
&gt; Fix typo: &quot;verical&quot; -&gt; &quot;vertical&quot; in macro desc=
ription<br>
&gt; <br>
&gt; Signed-off-by: PIYUSH CHOUDHARY &lt;<a href=3D"mailto:mercmerc961@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">mercmerc961@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/uapi/linux/fb.h | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
applied.<br>
<br>
Thanks!<br>
Helge<br>
</blockquote></div>

--00000000000069c62a06423fe511--
