Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BD7AB8B9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F9E10E078;
	Fri, 22 Sep 2023 17:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBAF10E078
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695405452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZBGv+Crh/jWu9vOyxVrENlFfbfGQ/Jxzqgq7GTo2FLU=;
 b=WjgZQM7OK5ZUGE5EkPglNx3Dx3YH6iH7agZE4IUJ4pmuEw7wD91uDf2LuBLrcflAbtTbUN
 8qhW2F5nV8m3tW4WR/FdDUzmhkOFwY1QZ57ejBWYxd/Sqs6h80WKMJvbgkKjdL70ObIxq7
 We4vak5icpONh5hhmx5khhOsMwgUyak=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-0wZxW4BhPaSez9aml7GhLw-1; Fri, 22 Sep 2023 13:57:31 -0400
X-MC-Unique: 0wZxW4BhPaSez9aml7GhLw-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-57b637d9e4dso2201839eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695405450; x=1696010250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZBGv+Crh/jWu9vOyxVrENlFfbfGQ/Jxzqgq7GTo2FLU=;
 b=e8U9z8jM2qRubK4zDWEyyCZbXABvJbR5EDHr8M7s68KM4FCOpHmVsErGDx+sXrdQx4
 X5CeSWirmXkh8mfdjHWTWtuLkGcnqEyEtBHhs6nIrtkya4fUs1g2GdQ3qB5F6JO8kJui
 NxhrlCWNK2EJzdckcSB+rjB9e8iTYoYlpAYssINdqV7VL+0zgezhxwx1l7NljLfjL2iB
 5a9Kthy8dUNPZzOVBgPlKcH4um9ciV7LS2bTiXfRnbB8zX8SGemCGwxNty8Cpp2H47U0
 OW2Ky8PvTXI1mhKon4ige8hQpn+6wxBuxzsinBzlaWGdwYLQ1NJLCs9KtJBLSidAAEbR
 QA/w==
X-Gm-Message-State: AOJu0Yzt3LIhuGmxNPjZfaZPWQvq1Cm0WMJlDfte5jldleWtfAkKt8sR
 zGHPUiorsh30j8u6cX1cWfxcJn/qNxSQ7bBVo38LS3rqU9hlOJCWHExsr4MFIwKRN9K5cCyvFxF
 bXvt87QMs5PGB/yD4cP7SpJqcfAbOA1xHdjDJxJi9Mcf7
X-Received: by 2002:a4a:808e:0:b0:572:b659:a236 with SMTP id
 z14-20020a4a808e000000b00572b659a236mr252030oof.6.1695405450243; 
 Fri, 22 Sep 2023 10:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcc13f4mwr5o675OdlK0FUH0CN0x3KSdcd+wYGWWZGzZ2VJnEGKnNdPxH8g/z5UWjg7Al7Yxlas9A024QCXqE=
X-Received: by 2002:a4a:808e:0:b0:572:b659:a236 with SMTP id
 z14-20020a4a808e000000b00572b659a236mr252016oof.6.1695405449987; Fri, 22 Sep
 2023 10:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-5-sarah.walker@imgtec.com>
In-Reply-To: <20230906095542.3280699-5-sarah.walker@imgtec.com>
From: Adam Jackson <ajax@redhat.com>
Date: Fri, 22 Sep 2023 13:57:19 -0400
Message-ID: <CAD_bs+qdnVPYbmtzqcpCC8xdLVNvDb8uNccsd=P6YX+sgMG6Xg@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] drm/imagination/uapi: Add PowerVR driver UAPI
To: Sarah Walker <sarah.walker@imgtec.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000098e1390605f657e3"
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
Cc: matthew.brost@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, hns@goldelico.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, robh+dt@kernel.org,
 matt.coster@imgtec.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, krzysztof.kozlowski+dt@linaro.org,
 boris.brezillon@collabora.com, afd@ti.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000098e1390605f657e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 5:57=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.co=
m> wrote:

>
> + *    :BYPASS_CACHE: There are very few situations where this flag is
> useful.
> + *       By default, the device flushes its memory caches after every jo=
b.
>

Presumably BYPASS_CACHE does something other than "after every job". Is
that "never" or something else? Would be good if the comment was explicit.

- ajax

--00000000000098e1390605f657e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 6, 2023 at 5:57=E2=80=AFAM Sa=
rah Walker &lt;<a href=3D"mailto:sarah.walker@imgtec.com">sarah.walker@imgt=
ec.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
+ *=C2=A0 =C2=A0 :BYPASS_CACHE: There are very few situations where this fl=
ag is useful.<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0By default, the device flushes its memory cac=
hes after every job.<br></blockquote><div><br></div><div>Presumably BYPASS_=
CACHE does something other than &quot;after every job&quot;. Is that &quot;=
never&quot; or something else? Would be good if the comment was explicit.<b=
r></div><div>=C2=A0</div><div>- ajax<br></div></div></div>

--00000000000098e1390605f657e3--

