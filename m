Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C1777679
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 13:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8D410E17E;
	Thu, 10 Aug 2023 11:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB62410E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 11:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691665595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0IFeeuF+cIxQq6C7nXmeNbgqBCARoParYC4mSgvmo4=;
 b=Yq1YXIvULsy09WUMeSMhhvUmjjzNQUGxwqtexBKZXxPdgQTPrkY2CfpAUSlIxSMgFB46nw
 S9KHttk6ch3eEY3rxjaq7sNZR+QjS1KzE6zGLhrjsu4ABSLn87+u22fuEypcvdgySPMWL/
 Kn1XcSRPS+l2O5F9KtWnxXbnGFbCwkw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-6N-XQIhSPIimSZm9sV148g-1; Thu, 10 Aug 2023 07:06:34 -0400
X-MC-Unique: 6N-XQIhSPIimSZm9sV148g-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-26820567a96so888025a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 04:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691665593; x=1692270393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0IFeeuF+cIxQq6C7nXmeNbgqBCARoParYC4mSgvmo4=;
 b=ei5QxQjcIscTBpLd+JbtHEAEuYs1kJXgNgvCaUjzjiVQtkZsAhhxzzjktqcPT5YcZz
 ezCR2q8Uk3Cs52avjUJRSwo0VKjjx+z31FFPFmRk6AIsnkIZ+y3pElXHQA++edHAjSWX
 YvJeZWh+VAAPBBQzzbUdR3rZ4eSGj0ZA2CrFis6n7bYHo1+Kq45Ijc3XQxe205pDJAGq
 idVWe6AtgDI+Mr5dCtOUYVggRMQFtP6FLfVscCjkB1aNkDVBb/XjH282C9tvNJ1s14e3
 5QBd4qfCI60rpV8JTEAj7qviyn6YDQaWEhm5UcvcHbcejqjKON3Rq4h2lpN2okcmLOh4
 nejQ==
X-Gm-Message-State: AOJu0YwaaNyoDQcAhaIQUVuXrEeXiE6mSqKxCzQiXdN3ol1w28dvhuJA
 x4UxOkgrn6y1TZ/yYxn7q7Yd32se6jGeRn9Sw7cKsFN1vA1V5WdpUdSfvmrzke/OGdYTx7XUyWf
 4q5YZz/CJg0a5guLA89m/I0EFUXCt/1AnfQca5l0/bBiY
X-Received: by 2002:a17:90a:4292:b0:268:314f:8f35 with SMTP id
 p18-20020a17090a429200b00268314f8f35mr1348790pjg.6.1691665593287; 
 Thu, 10 Aug 2023 04:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvVbGHTd4uQTjCJEhMZwL01sHeHxdOuV6dKSW1HIBqmXiFW6TTZyAlCEAfgnoK+FK4aqE9Qn4PbOKcvZv3Pr8=
X-Received: by 2002:a17:90a:4292:b0:268:314f:8f35 with SMTP id
 p18-20020a17090a429200b00268314f8f35mr1348773pjg.6.1691665592934; Thu, 10 Aug
 2023 04:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org>
 <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
 <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
 <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
 <YpGDUfd-_k9UGRn9xM-lwrWFXim3YiYG1wzgbk_lvSTQ2JL3zxxDuZef4ZTJe_NtOlwMMDy5OoDqK-Ia4VN3p-fibO_gaR7t6pH3oxyEI8Y=@emersion.fr>
 <b4f00adeeaec35aacd008fe7a6ca9283760f6421.camel@vmware.com>
 <Tgp5V2I8rIgxaVYHTqX5kWeyeqgaKygNFitQeObTXCR2hUDcaR-mAn_37bUhKrTxeqlwf2GlPIOmkSlOzZHQ5D-hkHu5jeYhEDm1x45oePw=@emersion.fr>
 <CADSE00Ld7D8E8MG6cc7HAgM_DbqXqYreik4ZZLUhkkJDW3B=Yg@mail.gmail.com>
In-Reply-To: <CADSE00Ld7D8E8MG6cc7HAgM_DbqXqYreik4ZZLUhkkJDW3B=Yg@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 10 Aug 2023 13:06:22 +0200
Message-ID: <CADSE00LtF4ofGUj2u6AO+fyfLvm7FMRdJJPAN8hFZZGphD58zQ@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
To: Simon Ser <contact@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000befccc06028f96d2"
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
Cc: Michael Banack <banackm@vmware.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000befccc06028f96d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 1:04=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:

>
>
> On Thu, Jul 20, 2023 at 9:32=E2=80=AFPM Simon Ser <contact@emersion.fr> w=
rote:
>
>> On Thursday, July 20th, 2023 at 21:28, Zack Rusin <zackr@vmware.com>
>> wrote:
>>
>> > On Thu, 2023-07-20 at 09:07 +0000, Simon Ser wrote:
>> >
>> > > !! External Email
>> > >
>> > > On Thursday, July 20th, 2023 at 10:50, Javier Martinez Canillas
>> > > javierm@redhat.com wrote:
>> > >
>> > > > > On Thursday, July 20th, 2023 at 07:03, Zack Rusin
>> zackr@vmware.com wrote:
>> > > > >
>> > > > > > I'll give this series a few more hours on the list and if no
>> one objects
>> > > > > > I'll push
>> > > > > > it to drm-misc later today. Thanks!
>> > > > >
>> > > > > Sorry, but this doesn't seem to be enough to satisfy the DRM mer=
ge
>> > > > > requirements. This introduces a new uAPI but is missing user-spa=
ce
>> > > > > patches and IGT. See 1 and 2.
>> > > >
>> > > > Albert (Cc'ed) wrote IGT tests for this new uAPI and was waiting f=
or
>> > > > Zack's patches to land to post them. I believe his branch is 0 but
>> > > > he can correct me if I'm wrong on that.
>> > > >
>> > > > Zack also has mutter patches and Albert has been testing those too=
.
>> > >
>> > > Ah, nice. Please do post all of these (without merging them) and
>> > > include links to them in the commit message. Posting is important
>> > > to make sure there are no gaps/mistakes in the tests and user-space
>> > > impl.
>> >
>> > What should those links point to? Because my private mutter repository
>> is definitely
>> > not going to last long so I'm not sure if there's any point in putting
>> that in a
>> > kernel commit log. Or would you like the links to those in the cover
>> letter?
>>
>> The kernel docs say: "The userspace side must be fully reviewed and
>> tested to the standards of that userspace project".
>>
>> So you need to open a merge request for mutter. Same for IGT.
>>
>>
> Hi,
>
> Here's the link to the IGT patch:
> https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
>

Hi,

The IGT patch series already got the Reviewed-by flags.

Here's the link https://patchwork.freedesktop.org/series/121225/

@zackr Is the mutter patch posted too? If so, IIUC the next step would be
to post a new revision
of this patch with the links to the igt and mutter patches.
Is there anything else missing?

BR,
Albert

--000000000000befccc06028f96d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 24, 2023 at 1:04=E2=80=AF=
PM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve@redhat.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_si=
gnature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 20, 2023 at 9:3=
2=E2=80=AFPM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=3D=
"_blank">contact@emersion.fr</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Thursday, July 20th, 2023 at 21:28, Zack Rus=
in &lt;<a href=3D"mailto:zackr@vmware.com" target=3D"_blank">zackr@vmware.c=
om</a>&gt; wrote:<br>
<br>
&gt; On Thu, 2023-07-20 at 09:07 +0000, Simon Ser wrote:<br>
&gt; <br>
&gt; &gt; !! External Email<br>
&gt; &gt; <br>
&gt; &gt; On Thursday, July 20th, 2023 at 10:50, Javier Martinez Canillas<b=
r>
&gt; &gt; <a href=3D"mailto:javierm@redhat.com" target=3D"_blank">javierm@r=
edhat.com</a> wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; On Thursday, July 20th, 2023 at 07:03, Zack Rusin <a hr=
ef=3D"mailto:zackr@vmware.com" target=3D"_blank">zackr@vmware.com</a> wrote=
:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I&#39;ll give this series a few more hours on the =
list and if no one objects<br>
&gt; &gt; &gt; &gt; &gt; I&#39;ll push<br>
&gt; &gt; &gt; &gt; &gt; it to drm-misc later today. Thanks!<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Sorry, but this doesn&#39;t seem to be enough to satisf=
y the DRM merge<br>
&gt; &gt; &gt; &gt; requirements. This introduces a new uAPI but is missing=
 user-space<br>
&gt; &gt; &gt; &gt; patches and IGT. See 1 and 2.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Albert (Cc&#39;ed) wrote IGT tests for this new uAPI and was=
 waiting for<br>
&gt; &gt; &gt; Zack&#39;s patches to land to post them. I believe his branc=
h is 0 but<br>
&gt; &gt; &gt; he can correct me if I&#39;m wrong on that.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Zack also has mutter patches and Albert has been testing tho=
se too.<br>
&gt; &gt; <br>
&gt; &gt; Ah, nice. Please do post all of these (without merging them) and<=
br>
&gt; &gt; include links to them in the commit message. Posting is important=
<br>
&gt; &gt; to make sure there are no gaps/mistakes in the tests and user-spa=
ce<br>
&gt; &gt; impl.<br>
&gt; <br>
&gt; What should those links point to? Because my private mutter repository=
 is definitely<br>
&gt; not going to last long so I&#39;m not sure if there&#39;s any point in=
 putting that in a<br>
&gt; kernel commit log. Or would you like the links to those in the cover l=
etter?<br>
<br>
The kernel docs say: &quot;The userspace side must be fully reviewed and<br=
>
tested to the standards of that userspace project&quot;.<br>
<br>
So you need to open a merge request for mutter. Same for IGT.<br>
<br></blockquote><div><br></div><div>Hi,</div><div><br></div><div>Here&#39;=
s the link to the IGT patch:=C2=A0=C2=A0<a href=3D"https://lists.freedeskto=
p.org/archives/igt-dev/2023-July/058427.html" target=3D"_blank">https://lis=
ts.freedesktop.org/archives/igt-dev/2023-July/058427.html</a></div></div></=
div></blockquote><div><br></div>Hi,<div><br></div><div>The IGT patch series=
 already got the Reviewed-by flags.=C2=A0</div><div><br></div><div>Here&#39=
;s the link=C2=A0<a href=3D"https://patchwork.freedesktop.org/series/121225=
/">https://patchwork.freedesktop.org/series/121225/</a></div><div><br></div=
><div>@zackr Is the mutter patch posted too? If so, IIUC the next step woul=
d be to post a new revision</div><div>of this patch with the links to the i=
gt and mutter patches.</div><div>Is there anything else missing?</div><div>=
<br></div><div>BR,</div><div>Albert=C2=A0</div></div></div>

--000000000000befccc06028f96d2--

