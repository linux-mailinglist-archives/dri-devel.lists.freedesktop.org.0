Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC9150377
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 10:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3A6EB7B;
	Mon,  3 Feb 2020 09:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC36EB7B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 09:40:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c84so16068913wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 01:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Jun4v0Y8OgEAY2zLGv+Re/EtkU8n60zpNHWxcp0S2ok=;
 b=CZu5LkOdQADBeKoarcii40bcLg5DixvMZqaOgVSVexhWCKpjW97W4R6DBldrqPlA2z
 /HXi3m2ZCrCypXPQVG0ILdVQu/GPR33jC42Y8eP/ViP9qBguZ5vOk2uk321HRn3MI3VS
 QCS5JclmH4ecTgQCtGDmJQuGMmqCVvY3Rebds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Jun4v0Y8OgEAY2zLGv+Re/EtkU8n60zpNHWxcp0S2ok=;
 b=fuyUhIs6CJY28MzazNFXyJvagx/GmgElVltGCQPX+QV1QBISlxhrVf2ahlVn+GqYgy
 PUxZn94YYnzWileQoRGaaQ8o35noLR8ifQQo5aJ7LdKyzA0laV8+8oj9+78txEvdrkfL
 LXRhBJP1Y8U8HVQKmTgR9yZ2p5zMhaD0WgquKIqo+oOiKhWUbt2r2r0zEdxOGJQ5Zp+3
 jCGisXdahxZLZr+lcSdxoaBrc0SjiCs57R/3U9TIEzvpinDWZSkRtHFUhwgf9Nqplk0S
 oM/4F/R3Q8lDFkQaWl2l/YwtV/lpx7wwqlAQ+BR8wtaxYV4h7WPXd0tw9/R2/0VTIntN
 bnyw==
X-Gm-Message-State: APjAAAX9eNdlvOeWtfxNt0G/m2DMkFmX0PaFNWAyxQH6FR9wRRkEySGV
 ZFuVLtahgrtXZTg9uuCOmIIbyQ==
X-Google-Smtp-Source: APXvYqy/Krxfe2RmIKcLszrxeHt62A0sSm0YaI/q+ttj5brYYV999VRextghxMacrz2Ki+eifvD9Sw==
X-Received: by 2002:a1c:a4c3:: with SMTP id n186mr28333929wme.25.1580722838511; 
 Mon, 03 Feb 2020 01:40:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g25sm28262597wmh.3.2020.02.03.01.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 01:40:37 -0800 (PST)
Date: Mon, 3 Feb 2020 10:40:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix W=1 warnings
Message-ID: <20200203094035.GR43062@phenom.ffwll.local>
Mail-Followup-To: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Dave Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191128135057.20020-1-benjamin.gaignard@st.com>
 <878snsvxzu.fsf@intel.com>
 <CA+M3ks5WvYoDLSrbvaGBbJg9+nnkX=xyCiD389QD8tSCdNqB+g@mail.gmail.com>
 <CA+M3ks4Y4LemFh=dQds91Z-LGJPK3vHKv=GeUNYHjNhdwz_m2g@mail.gmail.com>
 <CA+M3ks4yEBejzMoXPw_OK_LNP7ag5SNXZjvHqNeuZ8+9r2X-qw@mail.gmail.com>
 <b273036b10d8c2882800d01dcda7392e93b731fa.camel@redhat.com>
 <CA+M3ks5cuC5yJ-e0DCUiY1HtyyeU=mM9z56y4e_UduKaxcbw-A@mail.gmail.com>
 <08f4b69b1e48a81e90f28e7672da15cc5165969c.camel@redhat.com>
 <CAPM=9txafoQNfMFf0Ff1SnBTgq6jYyvjJyjCSJua6-SJVVkScQ@mail.gmail.com>
 <f64197e6-74bd-6577-2aa7-9c69cfdb9080@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f64197e6-74bd-6577-2aa7-9c69cfdb9080@st.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 08:08:34AM +0000, Benjamin GAIGNARD wrote:
> =

> On 1/31/20 12:22 AM, Dave Airlie wrote:
> >>>> hi-actually yes, we should probably be using this instead of just dr=
opping
> >>>> this. Also, I didn't write this code originally I just refactored a =
bunch
> >>>> of
> >>>> it - Dave Airlied is the original author, but the original version o=
f this
> >>>> code was written ages ago. tbh, I think it's a safe bet to say that =
they
> >>>> probably did mean to use this but forgot to and no one noticed until=
 now.
> >>> Hi,
> >>>
> >>> Any clue about how to use crc value ? Does it have to be checked
> >>> against something else ?
> >>> If crc are not matching what should we do of the data copied just bef=
ore ?
> >> We should be able to just take the CRC value from the sideband message=
 and
> >> then generate our own CRC value using the sideband message contents, a=
nd check
> >> if the two are equal. If they aren't, something went wrong and we didn=
't
> >> receive the message properly.
> >>
> >> Now as to what we should do when we have CRC mismatches? That's a bit =
more
> >> difficult. If you have access to the DP MST spec, I suppose a place to=
 start
> >> figuring that out would be checking if there's a way for us to request=
 that a
> >> branch device resend whatever message it sent previously. If there isn=
't, I
> >> guess we should just print an error in dmesg (possibly with a hexdump =
of the
> >> failed message as well) and not forward the message to the driver. Not=
 sure of
> >> any better way of handling it then that
> > Yeah I think this reflects what I wanted to do, I've no memory of a
> > retransmit option in the spec, but I've away from it for a while. But
> > we'd want to compare the CRC with what we got to make sure the are the
> > same.
> =

> Hmm, that far more complex than just fix compilation warnings :)
> =

> I will split the patch in two:
> =

> - one for of all other warnings, hopefully it can get reviewed
> =

> - one for this crc4 variable. Does checking crc value and print an error =

> should be acceptable ?
> =

> Something like:
> =

> if (crc4 !=3D msg->chunk[msg->curchunk_len - 1])
> =

>  =A0=A0=A0 print_hex_dump(KERN_DEBUG, "wrong crc", DUMP_PREFIX_NONE, 16, =
1, =

> msg->chunk,=A0 msg->curchunk_len, false);

Yeah I think that should be reasonable as a start. Then we'll see how much
the bug reports start flowing in ...
-Daniel
> =

> =

> Benjamin
> =

> =

> >
> > Dave.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
