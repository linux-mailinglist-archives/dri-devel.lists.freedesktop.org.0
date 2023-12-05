Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B2A805943
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EC310E00C;
	Tue,  5 Dec 2023 15:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5A210E00C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701791865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CvhR56av4gAhLVevaz2JSGCQQg2cTgXXoi36b5i8+VQ=;
 b=NjZkYsDNIa4pltbqey2DsFONQlPPYWbCnE49lcIRnBgEHYZxH8mEQwt/fi+4gRcv2LFmi/
 v8tpJun4DizXLiRIsxxkwNgu8Z/BtJPKxoj8MygptKBLzw6bdmd0/Wzf7XCBLxUyXNX37D
 RGL14SJW3Scc4bvFISssoMVs2jx9Dvo=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-ryM2W5PaNymHxySV4W6ppQ-1; Tue, 05 Dec 2023 10:57:24 -0500
X-MC-Unique: ryM2W5PaNymHxySV4W6ppQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-4abd0306062so2173864e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701791844; x=1702396644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CvhR56av4gAhLVevaz2JSGCQQg2cTgXXoi36b5i8+VQ=;
 b=aIbuZg6EP83F1NafvG1KA1mRC1pYntFViBrdq9p2OtWhBbNfeUGQt7CiIPt0C+AVwp
 hiwwrajbNWzxIJ7FRICnLK1HJ7vjI0x72+6GLcmDxxCNBCoeuPHwkAYtZj4Nbojkuima
 10IiLDBnPRiB427teyeLDV5zwGyzuAFbTrnsl328kzvZBIskK1TVmeQdeB/SMGIMId09
 AL5CGprcrKc0OqteB30lxKgsreM8DhmkdkOFXKd1aXpWdAdiUZblI5h2c26EDzMLSzqC
 aIvnA7+d740O/sMiaAtbDQthmp42who5fte7lqRfS936Rmj7yTsorxrcygtDjgkefH0N
 ImMQ==
X-Gm-Message-State: AOJu0YwOZAjbans2UC0OKqSzjo7JWYC1+hnzDo3gezZ274I4KDJcDT+q
 nIexOPKwim3t1hhVCbccL79Bi8OjqPfeglc3r9gn2LEW6rwYGLo67UJ4SXg1ref9O3i1EvZH2l1
 fAb+iZVPJt1UP1EW91U+wgk5kHiLX
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:f1f8 with SMTP id
 z12-20020a1709028f8c00b001d06ffdf1f8mr3364663plo.78.1701790850153; 
 Tue, 05 Dec 2023 07:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELbxy/B8D8Ivj8dQ1PJh4K071fTj0JsFrU+9jvYbDFFDHZQaJ5+JoV27NRmB6dO31mKVj6Mg==
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:f1f8 with SMTP id
 z12-20020a1709028f8c00b001d06ffdf1f8mr3364647plo.78.1701790849803; 
 Tue, 05 Dec 2023 07:40:49 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902a3c500b001cffe1e7374sm1567672plb.214.2023.12.05.07.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:40:49 -0800 (PST)
Date: Tue, 5 Dec 2023 16:40:40 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH drm-misc-next v2 0/2] PowerVR VM fixes
Message-ID: <ZW9EeFWWZ0BMWIPq@pollux>
References: <20231129220835.297885-1-dakr@redhat.com>
 <j6w6ccewlvoosop77ug56r3sqoi4hglj3ejkyfw4dj3s3pdsw5@b473njzq5u3d>
MIME-Version: 1.0
In-Reply-To: <j6w6ccewlvoosop77ug56r3sqoi4hglj3ejkyfw4dj3s3pdsw5@b473njzq5u3d>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: matt.coster@imgtec.com, sarah.walker@imgtec.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 04:35:00PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Nov 29, 2023 at 11:07:59PM +0100, Danilo Krummrich wrote:
> > Some major GPUVM changes landed just before v8 of the PowerVR series. Since v8
> > went in rather quickly (review process was finished otherwise) I haven't had the
> > chance to review the subsequent code changes.
> > 
> > Hence, this series with a few fixes in this context. Plus a minor GPUVM patch to
> > make the drm_gpuvm_prepare_* helpers useful for PowerVR.
> 
> This doesn't apply on drm-misc-next anymore, could you rebase and
> resend?

I already applied the two patches to drm-misc-next.

- Danilo

> 
> Thanks!
> Maxime


