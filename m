Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA40C52838
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6700F10E71F;
	Wed, 12 Nov 2025 13:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZknkPWpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9B210E71F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762954855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zo0h52kFGByoJx15vendATcJP10QUZQhbqLw2TQnnmU=;
 b=ZknkPWpikReuEaITU1jLNPo4pknzNhXz6+SGG6ZDJRgA3J0AoGzh1O8Trjq3QDG/yp/1Jq
 N2mn3UqimzPKYcEwZadRwFx9XxGuPRexSrIfnkCU1NY/ci6oMUpiarbiD0rjTijHqGlxGI
 HndZBv6xZrDacjFPb4hxioY2bdc+lN4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-AKsObxCtPMW9MGN_oHlRNg-1; Wed, 12 Nov 2025 08:40:54 -0500
X-MC-Unique: AKsObxCtPMW9MGN_oHlRNg-1
X-Mimecast-MFC-AGG-ID: AKsObxCtPMW9MGN_oHlRNg_1762954853
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429be5aee5bso337249f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 05:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762954853; x=1763559653;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zo0h52kFGByoJx15vendATcJP10QUZQhbqLw2TQnnmU=;
 b=oTwP1L6e7N19q1WuZRIWy5yz/M9oQ2rfIxQpGYt72del+eATnoFEE8jJslKDjHFySQ
 kXu23UcVIO1gTGNr6aXugOTmmtN4PkR25OFYjpW/gF1YZ2DNlTR9YcX+Q/2Coh62lJPH
 pphvfoSmbqEZqDoecgZmyZ4RDA2IfUKgsTcxQmH3Sc3KhnbRsRNVUqbXcexYTfjzWk3s
 wfG1J0N+N+zMMQfmeEIuV/XTZy8eoD0P18OH6Xk9e4G6bewrMvmtHHhNcUCRwGnutoUD
 Rqe4a/vn/qYxCyBJosu8UOi/5uUPWFQhtkpKV9edDIGOmYiH1kmg2eMOrasQvIqnF22L
 3S/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmXTh3DR3d3H/CcpoXtTLnDTht0G4GRRDNxgmICGueLdU2s6qyeM8lLt7Kml2GctTGgh6YMumTNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6mVJ+lEHttejTkzROus0KtdluBGC/6mfuFJG1NaKWoEsIFfk6
 aR6ZtsLdb776cqjmTxyJ82OBrKBNqwnnLWKVD5HKLw3KFJeCgj+Fhw+NAD302m0iUTdt9poCI4G
 S0Ux1b5XOp5L1cW3KB+D3OZMAtEzi8AIgb5Y0tzBFvRF+WJgcR368oY3TeymUeqIqGLj3jupCCD
 A9+Q==
X-Gm-Gg: ASbGnctsUKKMTYpaGF6NdvcEJZk5R8GFs5lkviZrnL5dzKYKtsawHK3kXGKjXSCuFwB
 aPqezsVDTS/3+Q3k2rLPK22zTwuEm1nAYOzkYnqmMnfi/PTwSTZI8DOw921ZLsFfZVgQY7i5d7D
 i0CZXJXXRwo+k1JVKpLt3KW5dfzfT5o655WVv2qZ4Ug0GdTCBkjoLnTjHHhC5fO+eLzXfW6RZUO
 l7eJb5DFnoeL2IOCM9e/ouVu0yeIRrmZvCI0IZz/W7iLYvBN0JdfOYZcVsnNGuHZA+3uFsOp/cD
 +DWOcpNAyDpft2Jlx7oLVR36/BzJQonYR+OSpFtO7RCRyVeBh5vqmt/FRFCDZ50b+jCxDEfRSZv
 r2KiDlru9Z1QkB6FA5Kg2eznp2g==
X-Received: by 2002:a05:6000:2086:b0:42b:31a5:f065 with SMTP id
 ffacd0b85a97d-42b4bba59b1mr2416778f8f.28.1762954852802; 
 Wed, 12 Nov 2025 05:40:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHQvr3sdtyf/svwbQl9kTY7KC1TptWeBxIN2QD5rZS3+/kK8hr4BKioYGyDpSE9tErmUbqVA==
X-Received: by 2002:a05:6000:2086:b0:42b:31a5:f065 with SMTP id
 ffacd0b85a97d-42b4bba59b1mr2416744f8f.28.1762954852412; 
 Wed, 12 Nov 2025 05:40:52 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b4789896esm8472389f8f.38.2025.11.12.05.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 05:40:51 -0800 (PST)
Message-ID: <9d9d3eac80bcd76e21f3d12d37426ec3b850ab50.camel@redhat.com>
Subject: Re: Questions regarding DRM Scheduler Priority Levels
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, "Chenna Kesava Raju (QUIC)"
 <quic_chennak@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
Date: Wed, 12 Nov 2025 14:40:50 +0100
In-Reply-To: <d1b97ed3-6beb-4564-9c53-616503b8c493@ursulin.net>
References: <4ac498dfbfeb4d4d837646f9e9492f28@quicinc.com>
 <d1b97ed3-6beb-4564-9c53-616503b8c493@ursulin.net>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I9bZG4FZ8nvZF9vgDOdhQhw0a_Mkc1ZQa6cJqmApbyA_1762954853
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2025-11-12 at 13:23 +0000, Tvrtko Ursulin wrote:
>=20
> Hi,
>=20
> On 12/11/2025 12:31, Chenna Kesava Raju (QUIC) wrote:
> > Hi All,
> >=20
> > We are currently developing a driver using the Accel framework to
> > enable=20
> > applications to offload their tasks to the NPU.
> >=20
> > As part of this effort, we are considering the use of the DRM
> > scheduler=20
> > for job management. These applications may have their own priority=20
> > levels to manage task execution efficiently on the NPU. However,
> > since=20
> > the DRM scheduler currently supports only a limited set of job
> > priority=20
> > levels (DRM_SCHED_PRIORITY_KERNEL, DRM_SCHED_PRIORITY_HIGH,=20
> > DRM_SCHED_PRIORITY_NORMAL, and DRM_SCHED_PRIORITY_LOW), we have a
> > couple=20
> > of questions:

Note that many users (Nouveau, Xe, =E2=80=A6) by now always use drm_sched w=
ith
a 1:1 relationship between sched_entity and sched itself. So there
isn't real scheduling anymore for many users and priority levels become
pointless.

With the industry apparently moving to firmware scheduling, I suppose
that big interest in features like more priority levels is little
(though not non-existent. See Tvrtko's link).

So I guess the most interesting question is what the ringbuffer layout
on your chip looks like. Nr of rings, way of creating them etc.


P.

