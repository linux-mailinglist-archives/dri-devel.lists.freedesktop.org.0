Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332DA36C7B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 08:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9212D10E42B;
	Sat, 15 Feb 2025 07:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bpr66Fo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFAD10E42B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 07:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739605107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWDjtb7Rhn51HfchEFLh7MLZr0T/SMf389ZL5QPUH0M=;
 b=Bpr66Fo/SoLa2xp5A5vCDQD8Eg9YuXyZGttJq1X3PHCKYZrwh9VHz7+mF/vLeaY8Pgy9PB
 gGIIuBxPMMQMh4KlBPoGEbFxVOj7yDjVcRPZ4ES57VB+3Iiz2/3p6N912Jim/IbysQrcHT
 vWb7rNXKMBrcU0p1zJwnUHp7UfV+4dk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-cD0PhqleMO-Kgk3eS80TYQ-1; Sat, 15 Feb 2025 02:38:25 -0500
X-MC-Unique: cD0PhqleMO-Kgk3eS80TYQ-1
X-Mimecast-MFC-AGG-ID: cD0PhqleMO-Kgk3eS80TYQ_1739605104
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5dc5369fad7so3275034a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 23:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739605104; x=1740209904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWDjtb7Rhn51HfchEFLh7MLZr0T/SMf389ZL5QPUH0M=;
 b=ihREpa0Qe6UpDKQHdDLHA0BjEdtJGoL9YmXfGrs93UsRYHvn1PptWmxOiB0YM88UM0
 nKrxKyjaSSBaUM76jiEp7esVmR4rPs55YZN/QhZoEWO/OJqnHG/nAr5jvoK0joxUkLgP
 /Ksxj1X63GpL1iFSp9TtCW27wolpwdOY06tyDG9s6Pzj6dosc6qX/8DtptObry4UbOzw
 Ft+CMCEGjxRI9ikynU9SLlLdB4QD1lVq2Qs9ywc/QDsOJgGqLLp9WFai1cibj/kQPKCd
 6L25NS35wkWqEBVOlCLDw8HfovtQZVkQfLww1X1mQNIrePLR9baRDLU9YA13f/VYt4ZF
 URVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc17pCfkH4qPeRdrFd/Idhg7RzxFSeUNJw5nadBkQr/kzTA0wdRXMaT8GwSO1Dj6k8tizCbDyInTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMCVzCCbqOWA/bM9W+bffojKupELcbdPx+1KMso3hJjeo4aMhp
 DSJWMs6HjJA2ysKhEKiG/bMS2Shb4+11ULHTptdw2KQxjQEFpnTCx038U/Dsxj+HEDDYLOgGqDR
 +bNoleJJOPzmPLFhiXzwjXtjRtcev4N9paE1UkrJby/2xqyFC7Awd3hcFlfbY0vxBXg==
X-Gm-Gg: ASbGncuq+QRb9Hp+g9JUZGy8BWi+grWkcqc0pOeEjvoavsve8xMx9RPr8HPGoeO9kYi
 csK7BMw1Jt6+ZUq19HM+r0V4gJQdMxgpXCtMCN289S5foGo2zKSOAm7x1YyGd/Zeb6Qb2e/coye
 sDbWaeMBU1XRSd1s7CytlW0lpgoigMMttAZeqaJT6LBrwIBQax0jC8BVoAi93IkY/v4Am4UCQ3u
 YGmHzuoAeGieDrMrj1FKsP3E/Yi7u+vRsy1hwMyp5vSPvwl4sgCPmU6gGuVK93YNwUQ7K55KlOh
 hdA=
X-Received: by 2002:a05:6402:2114:b0:5e0:2996:7300 with SMTP id
 4fb4d7f45d1cf-5e0361c8668mr1790111a12.20.1739605104315; 
 Fri, 14 Feb 2025 23:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY1Jd8Xn9OrRCkMKnwl4e4BSKlBOGfI4udUpcfDESdHQdqzAx+ErE8yPbXqncelWxpQRVCsg==
X-Received: by 2002:a05:6402:2114:b0:5e0:2996:7300 with SMTP id
 4fb4d7f45d1cf-5e0361c8668mr1789906a12.20.1739605098571; 
 Fri, 14 Feb 2025 23:38:18 -0800 (PST)
Received: from kherbst.lan ([188.192.20.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ded69e7c33sm3195322a12.61.2025.02.14.23.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 23:38:14 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 1/1] MAINTAINERS: Remove myself
Date: Sat, 15 Feb 2025 08:37:53 +0100
Message-ID: <20250215073753.1217002-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250215073753.1217002-1-kherbst@redhat.com>
References: <20250215073753.1217002-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AeRPtaT9Jix-V0_ZfkHta-VzOPNrfdNOQNojCeMHxUQ_1739605104
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

I was pondering with myself for a while if I should just make it official
that I'm not really involved in the kernel community anymore, neither as a
reviewer, nor as a maintainer.

Most of the time I simply excused myself with "if something urgent comes
up, I can chime in and help out". Lyude and Danilo are doing a wonderful
job and I've put all my trust into them.

However, there is one thing I can't stand and it's hurting me the most.
I'm convinced, no, my core believe is, that inclusivity and respect,
working with others as equals, no power plays involved, is how we should
work together within the Free and Open Source community.

I can understand maintainers needing to learn, being concerned on
technical points. Everybody deserves the time to understand and learn. It
is my true belief that most people are capable of change eventually. I
truly believe this community can change from within, however this doesn't
mean it's going to be a smooth process.

The moment I made up my mind about this was reading the following words
written by a maintainer within the kernel community:

	"we are the thin blue line"

This isn't okay. This isn't creating an inclusive environment. This isn't
okay with the current political situation especially in the US. A
maintainer speaking those words can't be kept. No matter how important
or critical or relevant they are. They need to be removed until they
learn. Learn what those words mean for a lot of marginalized people. Learn
about what horrors it evokes in their minds.

I can't in good faith remain to be part of a project and its community
where those words are tolerated. Those words are not technical, they are
a political statement. Even if unintentionally, such words carry power,
they carry meanings one needs to be aware of. They do cause an immense
amount of harm.

I wish the best of luck for everybody to continue to try to work from
within. You got my full support and I won't hold it against anybody trying
to improve the community, it's a thankless job, it's a lot of work. People
will continue to burn out.

I got burned out enough by myself caring about the bits I maintained, but
eventually I had to realize my limits. The obligation I felt was eating me
from inside. It stopped being fun at some point and I reached a point
where I simply couldn't continue the work I was so motivated doing as I've
did in the early days.

Please respect my wishes and put this statement as is into the tree.
Leaving anything out destroys its entire meaning.

Respectfully

Karol

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353de..ca31e57fa203c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7431,7 +7431,6 @@ F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
-M:	Karol Herbst <kherbst@redhat.com>
 M:	Lyude Paul <lyude@redhat.com>
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	dri-devel@lists.freedesktop.org
@@ -24062,7 +24061,6 @@ F:	tools/testing/selftests/ftrace/
 TRACING MMIO ACCESSES (MMIOTRACE)
 M:	Steven Rostedt <rostedt@goodmis.org>
 M:	Masami Hiramatsu <mhiramat@kernel.org>
-R:	Karol Herbst <karolherbst@gmail.com>
 R:	Pekka Paalanen <ppaalanen@gmail.com>
 L:	linux-kernel@vger.kernel.org
 L:	nouveau@lists.freedesktop.org
-- 
2.48.1

