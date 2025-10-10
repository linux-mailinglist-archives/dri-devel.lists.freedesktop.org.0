Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E894DBCC60A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3A810EBA1;
	Fri, 10 Oct 2025 09:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XP2/wLVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49510EB9E;
 Fri, 10 Oct 2025 09:38:12 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cjhW55Z5rz9t1l;
 Fri, 10 Oct 2025 11:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760089089; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSrdgFP16wE93Gc4nE2FjlcESrQHvjjM+kLFIjRbQnI=;
 b=XP2/wLVn5+ZtuyeREjqWPjufVx1LFAUzYNTMWAjBBtQS7OLrJ5o8XQZ8EizICS/79Ncx8F
 255qibR/8NcEGVJUOL+xjy1mxWgK+yjKIF3sbe1Sw35eM4olxDeAIF9og/xvP5iJNyoh/Y
 Ib9UFNfylCPUxfftHpMeq24/piwaiYFz0ieClqNTO+wJ9l69BCDML9d//aDVtm+VMScdgh
 4W9z6Ig8rd2aS23i+A0dtCwWnBzca97Ray4ZwheoZI0Dan3muEc7/0HwPiyX9UAnYgWxnj
 Hwros4wmK3FbWO8/RQWgjuqtU1863BQxC2AEL/ySQoWCSUDznZO3aqabs27iXw==
Message-ID: <22d13bb8c39123fe9ca12184981b1e2ab99efbda.camel@mailbox.org>
Subject: Re: [PATCH 02/28] drm/sched: Add some scheduling quality unit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Fri, 10 Oct 2025 11:38:06 +0200
In-Reply-To: <20251008085359.52404-3-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 377dd6dc6ba22def4e1
X-MBO-RS-META: tcejyrzq958n1mj79f5n3jo74sh3bzb8
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> To make evaluating different scheduling policies easier (no need for
> external benchmarks) and perfectly repeatable, lets add some synthetic
> workloads built upon mock scheduler unit test infrastructure.
>=20
> Focus is on two parallel clients (two threads) submitting different job
> patterns and logging their progress and some overall metrics. This is
> repeated for both scheduler credit limit 1 and 2.
>=20
> Example test output:
>=20
> =C2=A0 Normal and low:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pct1 cps1 qd1;=C2=A0 pct2 cps2 q=
d2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0 0ms:=
=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 0;=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 104ms: 100=C2=A0=
 1240=C2=A0 112; 100=C2=A0 1240=C2=A0 125
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 209ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 99; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 313ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 86; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 419ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 73; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 524ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 60; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 628ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 47; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 731ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 34; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 836ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 21; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 12=
5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 939ms: 100=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 8; 100=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=
=A0 125
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1043ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 120
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1147ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 107
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1252ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 94
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1355ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 81
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1459ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 68
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1563ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 55
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1667ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 42
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1771ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 29
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1875ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 16
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1979ms:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; 100=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 3
> =C2=A0=C2=A0=C2=A0 0: prio=3Dnormal sync=3D0 elapsed_ms=3D1015ms (ideal_m=
s=3D1000ms) cycle_time(min,avg,max)=3D134,222,978 us latency_time(min,avg,m=
ax)=3D134,222,978
> us
> =C2=A0=C2=A0=C2=A0 1: prio=3Dlow sync=3D0 elapsed_ms=3D2009ms (ideal_ms=
=3D1000ms) cycle_time(min,avg,max)=3D134,215,806 us latency_time(min,avg,ma=
x)=3D134,215,806 us
>=20
> There we have two clients represented in the two respective columns, with
> their progress logged roughly every 100 milliseconds. The metrics are:
>=20
> =C2=A0- pct - Percentage progress of the job submit part
> =C2=A0- cps - Cycles per second
> =C2=A0- qd=C2=A0 - Queue depth - number of submitted unfinished jobs

Could make sense to print a legend above the test table, couldn't it?
So new users don't have to search in the code what the output means.

>=20
> The cycles per second metric is inherent to the fact that workload
> patterns are a data driven cycling sequence of:
>=20
> =C2=A0- Submit 1..N jobs
> =C2=A0- Wait for Nth job to finish (optional)
> =C2=A0- Sleep (optional)
> =C2=A0- Repeat from start
>=20
> In this particular example we have a normal priority and a low priority
> clients both spamming the scheduler with 8ms jobs with no sync and no

s/clients/client

> sleeping. Hence they build a very deep queues and we can see how the low

s/a//

> priority client is completely starved until the normal finishes.
>=20
> Note that the PCT and CPS metrics are irrelevant for "unsync" clients
> since they manage to complete all of their cycles instantaneously.
>=20
> A different example would be:
>=20
> =C2=A0 Heavy and interactive:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pct1 cps1 qd1;=C2=A0 pct2 cps2 q=
d2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0 0ms:=
=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 0;=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 106ms:=C2=A0=C2=
=A0 5=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 3;=C2=A0=C2=A0 5=C2=A0=C2=A0=
=C2=A0 40=C2=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 209ms:=C2=A0=C2=
=A0 9=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0=C2=A0 9=C2=A0=C2=A0=
=C2=A0 40=C2=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 314ms:=C2=A0 14=
=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 3;=C2=A0 14=C2=A0=C2=A0=C2=A0 50=C2=
=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 417ms:=C2=A0 18=
=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0 18=C2=A0=C2=A0=C2=A0 40=C2=
=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 522ms:=C2=A0 23=
=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 3;=C2=A0 23=C2=A0=C2=A0=C2=A0 50=C2=
=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 625ms:=C2=A0 27=
=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0 27=C2=A0=C2=A0=C2=A0 40=C2=
=A0=C2=A0=C2=A0 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 729ms:=C2=A0 32=
=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 0;=C2=A0 32=C2=A0=C2=A0=C2=A0 50=C2=
=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 833ms:=C2=A0 36=
=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 1;=C2=A0 36=C2=A0=C2=A0=C2=A0 40=C2=
=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 937ms:=C2=A0 40=
=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0 40=C2=A0=C2=A0=C2=A0 40=C2=
=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1041ms:=C2=A0 45=C2=A0=
=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 0;=C2=A0 45=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1146ms:=C2=A0 49=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 1;=C2=A0 49=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1249ms:=C2=A0 54=C2=A0=
=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 0;=C2=A0 54=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1353ms:=C2=A0 58=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 1;=C2=A0 58=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1457ms:=C2=A0 62=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0 62=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1561ms:=C2=A0 67=C2=A0=
=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 0;=C2=A0 67=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1665ms:=C2=A0 71=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 1;=C2=A0 71=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1772ms:=C2=A0 76=C2=A0=
=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 0;=C2=A0 76=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1877ms:=C2=A0 80=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 1;=C2=A0 80=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 1981ms:=C2=A0 84=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0 84=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 2085ms:=C2=A0 89=C2=A0=
=C2=A0=C2=A0 50=C2=A0=C2=A0=C2=A0 0;=C2=A0 89=C2=A0=C2=A0=C2=A0 50=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 2189ms:=C2=A0 93=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 1;=C2=A0 93=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 2293ms:=C2=A0 97=C2=A0=
=C2=A0=C2=A0 40=C2=A0=C2=A0=C2=A0 0;=C2=A0 97=C2=A0=C2=A0=C2=A0 40=C2=A0=C2=
=A0=C2=A0 1
>=20
> In this case client one is submitting 3x 2.5ms jobs, waiting for the 3rd
> and then sleeping for 2.5ms (in effect causing 75% GPU load, minus the
> overheads). Second client is submitting 1ms jobs, waiting for each to
> finish and sleeping for 9ms (effective 10% GPU load). Here we can see
> the PCT and CPS reflecting real progress.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0.../gpu/drm/scheduler/tests/tests_scheduler.c | 694 +++++++++++++++=
+++
> =C2=A02 files changed, 696 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.=
c
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/Makefile b/drivers/gpu/drm/s=
cheduler/tests/Makefile
> index 5bf707bad373..9ec185fbbc15 100644
> --- a/drivers/gpu/drm/scheduler/tests/Makefile
> +++ b/drivers/gpu/drm/scheduler/tests/Makefile
> @@ -2,6 +2,7 @@
> =C2=A0
> =C2=A0drm-sched-tests-y :=3D \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mock_scheduler.o \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tests_basic.o
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tests_basic.o \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tests_scheduler.o
> =C2=A0
> =C2=A0obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) +=3D drm-sched-tests.o
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/=
gpu/drm/scheduler/tests/tests_scheduler.c
> new file mode 100644
> index 000000000000..c66c151a66d2
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> @@ -0,0 +1,694 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025 Valve Corporation */
> +
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/ktime.h>
> +#include <linux/math64.h>
> +
> +#include "sched_tests.h"
> +
> +/*
> + * DRM scheduler scheduler tests exercise load balancing decisions ie. e=
ntity
> + * selection logic.
> + */
> +
> +static int drm_sched_scheduler_init(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched;
> +
> +	sched =3D drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	sched->base.credit_limit =3D 1;
> +
> +	test->priv =3D sched;
> +
> +	return 0;
> +}
> +
> +static int drm_sched_scheduler_init2(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched;
> +
> +	sched =3D drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +	sched->base.credit_limit =3D 2;
> +
> +	test->priv =3D sched;
> +
> +	return 0;
> +}
> +
> +static void drm_sched_scheduler_exit(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +
> +	drm_mock_sched_fini(sched);
> +}
> +
> +static void drm_sched_scheduler_queue_overhead(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	const unsigned int job_us =3D 1000;
> +	const unsigned int jobs =3D 1000;
> +	const unsigned int total_us =3D jobs * job_us;
> +	struct drm_mock_sched_job *job, *first;
> +	ktime_t start, end;
> +	bool done;
> +	int i;
> +
> +	/*
> +	 * Deep queue job at a time processing (single credit).
> +	 *
> +	 * This measures the overhead of picking and processing a job at a time
> +	 * by comparing the ideal total "GPU" time of all submitted jobs versus
> +	 * the time actually taken.
> +	 */
> +
> +	KUNIT_ASSERT_EQ(test, sched->base.credit_limit, 1);
> +
> +	entity =3D drm_mock_sched_entity_new(test,
> +					=C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
> +					=C2=A0=C2=A0 sched);
> +
> +	for (i =3D 0; i <=3D jobs; i++) {
> +		job =3D drm_mock_sched_job_new(test, entity);
> +		if (i =3D=3D 0)
> +			first =3D job; /* Extra first job blocks the queue */
> +		else
> +			drm_mock_sched_job_set_duration_us(job, job_us);
> +		drm_mock_sched_job_submit(job);
> +	}
> +
> +	done =3D drm_mock_sched_job_wait_scheduled(first, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	start =3D ktime_get();
> +	i =3D drm_mock_sched_advance(sched, 1); /* Release the queue */
> +	KUNIT_ASSERT_EQ(test, i, 1);
> +
> +	/* Wait with a safe margin to avoid every failing. */
> +	done =3D drm_mock_sched_job_wait_finished(job,
> +						usecs_to_jiffies(total_us) * 5);
> +	end =3D ktime_get();
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	pr_info("Expected %uus, actual %lldus\n",
> +		total_us,
> +		ktime_to_us(ktime_sub(end, start)));
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
> +static void drm_sched_scheduler_ping_pong(struct kunit *test)
> +{
> +	struct drm_mock_sched_job *job, *first, *prev =3D NULL;
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_entity *entity[2];
> +	const unsigned int job_us =3D 1000;
> +	const unsigned int jobs =3D 1000;
> +	const unsigned int total_us =3D jobs * job_us;
> +	ktime_t start, end;
> +	bool done;
> +	int i;
> +
> +	/*
> +	 * Two entitites in inter-dependency chain.
> +	 *
> +	 * This measures the overhead of picking and processing a job at a time=
,
> +	 * where each job depends on the previous one from the diffferent
> +	 * entity, by comparing the ideal total "GPU" time of all submitted job=
s
> +	 * versus the time actually taken.
> +	 */
> +
> +	KUNIT_ASSERT_EQ(test, sched->base.credit_limit, 1);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		entity[i] =3D drm_mock_sched_entity_new(test,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched);
> +
> +	for (i =3D 0; i <=3D jobs; i++) {
> +		job =3D drm_mock_sched_job_new(test, entity[i & 1]);
> +		if (i =3D=3D 0)
> +			first =3D job; /* Extra first job blocks the queue */
> +		else
> +			drm_mock_sched_job_set_duration_us(job, job_us);
> +		if (prev)
> +			drm_sched_job_add_dependency(&job->base,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_get(&prev->base.s_fence->finish=
ed));
> +		drm_mock_sched_job_submit(job);
> +		prev =3D job;
> +	}
> +
> +	done =3D drm_mock_sched_job_wait_scheduled(first, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	start =3D ktime_get();
> +	i =3D drm_mock_sched_advance(sched, 1); /* Release the queue */
> +	KUNIT_ASSERT_EQ(test, i, 1);
> +
> +	/* Wait with a safe margin to avoid every failing. */
> +	done =3D drm_mock_sched_job_wait_finished(job,
> +						usecs_to_jiffies(total_us) * 5);
> +	end =3D ktime_get();
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	pr_info("Expected %uus, actual %lldus\n",
> +		total_us,
> +		ktime_to_us(ktime_sub(end, start)));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		drm_mock_sched_entity_free(entity[i]);
> +}
> +
> +static struct kunit_case drm_sched_scheduler_overhead_tests[] =3D {
> +	KUNIT_CASE_SLOW(drm_sched_scheduler_queue_overhead),
> +	KUNIT_CASE_SLOW(drm_sched_scheduler_ping_pong),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_overhead =3D {
> +	.name =3D "drm_sched_scheduler_overhead_tests",
> +	.init =3D drm_sched_scheduler_init,
> +	.exit =3D drm_sched_scheduler_exit,
> +	.test_cases =3D drm_sched_scheduler_overhead_tests,
> +};
> +
> +/*
> + * struct drm_sched_client_params - describe a workload emitted from a c=
lient
> + *
> + * A simulated client will create an entity with a scheduling @priority =
and emit
> + * jobs in a loop where each iteration will consist of:
> + *
> + * 1. Submit @job_cnt jobs, each with a set duration of @job_us.
> + * 2. If @sync is true wait for last submitted job to finish.
> + * 3. Sleep for @wait_us micro-seconds.
> + * 4. Repeat.
> + */
> +struct drm_sched_client_params {
> +	enum drm_sched_priority priority;
> +	unsigned int job_cnt;
> +	unsigned int job_us;
> +	bool sync;
> +	unsigned int wait_us;
> +};
> +
> +struct drm_sched_test_params {
> +	const char *description;
> +	struct drm_sched_client_params client[2];
> +};
> +
> +static const struct drm_sched_test_params drm_sched_cases[] =3D {
> +	{
> +		.description =3D "Normal and normal",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +	},
> +	{
> +		.description =3D "Normal and low",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +	},
> +	{
> +		.description =3D "High and normal",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_HIGH,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +	},
> +	{
> +		.description =3D "High and low",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_HIGH,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt =3D 1,
> +			.job_us =3D 8000,
> +			.wait_us =3D 0,
> +			.sync =3D false,
> +		},
> +	},
> +	{
> +		.description =3D "50 and 50",

I still think that this should have a more obvious description.

> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 1500,
> +			.wait_us =3D 1500,
> +			.sync =3D true,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 2500,
> +			.wait_us =3D 2500,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "50 and 50 low",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 1500,
> +			.wait_us =3D 1500,
> +			.sync =3D true,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt =3D 1,
> +			.job_us =3D 2500,
> +			.wait_us =3D 2500,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "50 high and 50",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_HIGH,
> +			.job_cnt =3D 1,
> +			.job_us =3D 1500,
> +			.wait_us =3D 1500,
> +			.sync =3D true,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 2500,
> +			.wait_us =3D 2500,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "Low hog and interactive",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_LOW,
> +			.job_cnt =3D 3,
> +			.job_us =3D 2500,
> +			.wait_us =3D 500,
> +			.sync =3D false,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 500,
> +			.wait_us =3D 10000,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "Heavy and interactive",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 3,
> +			.job_us =3D 2500,
> +			.wait_us =3D 2500,
> +			.sync =3D true,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 1000,
> +			.wait_us =3D 9000,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "Very heavy and interactive",
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 4,
> +			.job_us =3D 50000,
> +			.wait_us =3D 1,
> +			.sync =3D true,
> +		},
> +		.client[1] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 1,
> +			.job_us =3D 1000,
> +			.wait_us =3D 9000,
> +			.sync =3D true,
> +		},
> +	},
> +};
> +
> +static void
> +drm_sched_desc(const struct drm_sched_test_params *params, char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_scheduler_two_clients,
> +		=C2=A0 drm_sched_cases,
> +		=C2=A0 drm_sched_desc);
> +
> +/*
> + * struct test_client_stats - track client stats
> + *
> + * For each client executing a simulated workload we track some timings =
for
> + * which we are interested in the minimum of all iterations (@min_us), m=
aximum
> + * (@max_us) and the overall total for all iterations (@tot_us).
> + */
> +struct test_client_stats {
> +	unsigned int min_us;
> +	unsigned int max_us;
> +	unsigned long tot_us;
> +};
> +
> +/*
> + * struct test_client - a simulated userspace client submitting schedule=
r work
> + *
> + * Each client executing a simulated workload is represented by one of t=
hese.
> + *
> + * Each of them instantiates a scheduling @entity and executes a workloa=
ds as
> + * defined in @params. Based on those @params the theoretical execution =
time of
> + * the client is calculated as @ideal_duration, while the actual wall ti=
me is
> + * tracked in @duration (calculated based on the @start and @end client =
time-
> + * stamps).
> + *
> + * Numerical @id is assigned to each for logging purposes.
> + *
> + * @worker and @work are used to provide an independent execution contex=
t from
> + * which scheduler jobs are submitted.
> + *
> + * During execution statistics on how long it took to submit and execute=
 one
> + * iteration (whether or not synchronous) is kept in @cycle_time, while
> + * @latency_time tracks the @cycle_time minus the ideal duration of the =
one
> + * cycle.
> + *
> + * Once the client has completed the set number of iterations it will wr=
ite the
> + * completion status into @done.
> + */
> +struct test_client {
> +	struct kunit *test; /* Backpointer to the kunit test. */
> +
> +	struct drm_mock_sched_entity	*entity;
> +
> +	struct kthread_worker	*worker;
> +	struct kthread_work	work;

The formatting here is strange / differs from below.


P.

> +
> +	unsigned int id;
> +	ktime_t duration;
> +
> +	struct drm_sched_client_params params;
> +
> +	ktime_t ideal_duration;
> +	unsigned int cycles;
> +	unsigned int cycle;
> +	ktime_t	start;
> +	ktime_t	end;
> +	bool done;
> +
> +	struct test_client_stats cycle_time;
> +	struct test_client_stats latency_time;
> +};
> +
> +static void
> +update_stats(struct test_client_stats *stats, unsigned int us)
> +{
> +	if (us > stats->max_us)
> +		stats->max_us =3D us;
> +	if (us < stats->min_us)
> +		stats->min_us =3D us;
> +	stats->tot_us +=3D us;
> +}
> +
> +static unsigned int
> +get_stats_avg(struct test_client_stats *stats, unsigned int cycles)
> +{
> +	return div_u64(stats->tot_us, cycles);
> +}
> +
> +static void drm_sched_client_work(struct kthread_work *work)
> +{
> +	struct test_client *client =3D container_of(work, typeof(*client), work=
);
> +	const long sync_wait =3D MAX_SCHEDULE_TIMEOUT;
> +	unsigned int cycle, work_us, period_us;
> +	struct drm_mock_sched_job *job =3D NULL;
> +
> +	work_us =3D client->params.job_cnt * client->params.job_us;
> +	period_us =3D work_us + client->params.wait_us;
> +	client->cycles =3D
> +		DIV_ROUND_UP((unsigned int)ktime_to_us(client->duration),
> +			=C2=A0=C2=A0=C2=A0=C2=A0 period_us);
> +	client->ideal_duration =3D us_to_ktime(client->cycles * period_us);
> +
> +	client->start =3D ktime_get();
> +
> +	for (cycle =3D 0; cycle < client->cycles; cycle++) {
> +		ktime_t cycle_time;
> +		unsigned int batch;
> +		unsigned long us;
> +
> +		if (READ_ONCE(client->done))
> +			break;
> +
> +		cycle_time =3D ktime_get();
> +		for (batch =3D 0; batch < client->params.job_cnt; batch++) {
> +			job =3D drm_mock_sched_job_new(client->test,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 client->entity);
> +			drm_mock_sched_job_set_duration_us(job,
> +							=C2=A0=C2=A0 client->params.job_us);
> +			drm_mock_sched_job_submit(job);
> +		}
> +
> +		if (client->params.sync)
> +			drm_mock_sched_job_wait_finished(job, sync_wait);
> +
> +		cycle_time =3D ktime_sub(ktime_get(), cycle_time);
> +		us =3D ktime_to_us(cycle_time);
> +		update_stats(&client->cycle_time, us);
> +		if (ktime_to_us(cycle_time) >=3D (long)work_us)
> +			us =3D ktime_to_us(cycle_time) - work_us;
> +		else if (WARN_ON_ONCE(client->params.sync)) /* GPU job took less than =
expected. */
> +			us =3D 0;
> +		update_stats(&client->latency_time, us);
> +		WRITE_ONCE(client->cycle, cycle);
> +
> +		if (READ_ONCE(client->done))
> +			break;
> +
> +		if (client->params.wait_us)
> +			fsleep(client->params.wait_us);
> +		else if (!client->params.sync)
> +			cond_resched(); /* Do not hog the CPU if fully async. */
> +	}
> +
> +	client->done =3D drm_mock_sched_job_wait_finished(job, sync_wait);
> +	client->end =3D ktime_get();
> +}
> +
> +static const char *prio_str(enum drm_sched_priority prio)
> +{
> +	switch (prio) {
> +	case DRM_SCHED_PRIORITY_KERNEL:
> +		return "kernel";
> +	case DRM_SCHED_PRIORITY_LOW:
> +		return "low";
> +	case DRM_SCHED_PRIORITY_NORMAL:
> +		return "normal";
> +	case DRM_SCHED_PRIORITY_HIGH:
> +		return "high";
> +	default:
> +		return "???";
> +	}
> +}
> +
> +static bool client_done(struct test_client *client)
> +{
> +	return READ_ONCE(client->done); /* READ_ONCE to document lockless read =
from a loop. */
> +}
> +
> +static void drm_sched_scheduler_two_clients_test(struct kunit *test)
> +{
> +	const struct drm_sched_test_params *params =3D test->param_value;
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct test_client client[2] =3D { };
> +	unsigned int prev_cycle[2] =3D { };
> +	unsigned int i, j;
> +	ktime_t start;
> +
> +	/*
> +	 * Same job stream from two clients.
> +	 */
> +
> +	for (i =3D 0; i < ARRAY_SIZE(client); i++)
> +		client[i].entity =3D
> +			drm_mock_sched_entity_new(test,
> +						=C2=A0 params->client[i].priority,
> +						=C2=A0 sched);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(client); i++) {
> +		client[i].test =3D test;
> +		client[i].id =3D i;
> +		client[i].duration =3D ms_to_ktime(1000);
> +		client[i].params =3D params->client[i];
> +		client[i].cycle_time.min_us =3D ~0U;
> +		client[i].latency_time.min_us =3D ~0U;
> +		client[i].worker =3D
> +			kthread_create_worker(0, "%s-%u", __func__, i);
> +		if (IS_ERR(client[i].worker)) {
> +			for (j =3D 0; j < i; j++)
> +				kthread_destroy_worker(client[j].worker);
> +			KUNIT_FAIL(test, "Failed to create worker!\n");
> +		}
> +
> +		kthread_init_work(&client[i].work, drm_sched_client_work);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(client); i++)
> +		kthread_queue_work(client[i].worker, &client[i].work);
> +
> +	/*
> +	 * The clients (workers) can be a mix of async (deep submission queue),
> +	 * sync (one job at a time), or something in between. Therefore it is
> +	 * difficult to display a single metric representing their progress.
> +	 *
> +	 * Each struct drm_sched_client_params describes the actual submission
> +	 * pattern which happens in the following steps:
> +	 *=C2=A0 1. Submit N jobs
> +	 *=C2=A0 2. Wait for last submitted job to finish
> +	 *=C2=A0 3. Sleep for U micro-seconds
> +	 *=C2=A0 4. Goto 1. for C cycles
> +	 *
> +	 * Where number of cycles is calculated to match the target client
> +	 * duration from the respective struct drm_sched_test_params.
> +	 *
> +	 * To asses scheduling behaviour what we output for both clients is:
> +	 *=C2=A0 - pct: Percentage progress of the jobs submitted
> +	 *=C2=A0 - cps: "Cycles" per second (where one cycle is one complete
> +	 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iteration from the a=
bove)
> +	 *=C2=A0 -=C2=A0 qd: Number of outstanding jobs in the client/entity
> +	 */
> +
> +	start =3D ktime_get();
> +	pr_info("%s:\n\t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pct1 cps1 qd1;=C2=A0 pct2 cps2 qd2\n",
> +		params->description);
> +	while (!client_done(&client[0]) || !client_done(&client[1])) {
> +		const unsigned int period_ms =3D 100;
> +		const unsigned int frequency =3D 1000 / period_ms;
> +		unsigned int pct[2], qd[2], cycle[2], cps[2];
> +
> +		for (i =3D 0; i < ARRAY_SIZE(client); i++) {
> +			qd[i] =3D spsc_queue_count(&client[i].entity->base.job_queue);
> +			cycle[i] =3D READ_ONCE(client[i].cycle);
> +			cps[i] =3D DIV_ROUND_UP(100 * frequency *
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cycle[i] - prev_cycle[i]),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100);
> +			if (client[i].cycles)
> +				pct[i] =3D DIV_ROUND_UP(100 * (1 + cycle[i]),
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 client[i].cycles);
> +			else
> +				pct[i] =3D 0;
> +			prev_cycle[i] =3D cycle[i];
> +		}
> +
> +		if (client_done(&client[0]))
> +			pr_info("\t+%6lldms:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ; %3u %5u %4u\n",
> +				ktime_to_ms(ktime_sub(ktime_get(), start)),
> +				pct[1], cps[1], qd[1]);
> +		else if (client_done(&client[1]))
> +			pr_info("\t+%6lldms: %3u %5u %4u;\n",
> +				ktime_to_ms(ktime_sub(ktime_get(), start)),
> +				pct[0], cps[0], qd[0]);
> +		else
> +			pr_info("\t+%6lldms: %3u %5u %4u; %3u %5u %4u\n",
> +				ktime_to_ms(ktime_sub(ktime_get(), start)),
> +				pct[0], cps[0], qd[0],
> +				pct[1], cps[1], qd[1]);
> +
> +		msleep(period_ms);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(client); i++) {
> +		kthread_flush_work(&client[i].work);
> +		kthread_destroy_worker(client[i].worker);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(client); i++)
> +		KUNIT_ASSERT_TRUE(test, client[i].done);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(client); i++) {
> +		pr_info("=C2=A0=C2=A0=C2=A0 %u: prio=3D%s sync=3D%u elapsed_ms=3D%lldm=
s (ideal_ms=3D%lldms) cycle_time(min,avg,max)=3D%u,%u,%u us latency_time(mi=
n,avg,max)=3D%u,%u,%u us",
> +			i,
> +			prio_str(params->client[i].priority),
> +			params->client[i].sync,
> +			ktime_to_ms(ktime_sub(client[i].end, client[i].start)),
> +			ktime_to_ms(client[i].ideal_duration),
> +			client[i].cycle_time.min_us,
> +			get_stats_avg(&client[i].cycle_time, client[i].cycles),
> +			client[i].cycle_time.max_us,
> +			client[i].latency_time.min_us,
> +			get_stats_avg(&client[i].latency_time, client[i].cycles),
> +			client[i].latency_time.max_us);
> +		drm_mock_sched_entity_free(client[i].entity);
> +	}
> +}
> +
> +static const struct kunit_attributes drm_sched_scheduler_two_clients_att=
r =3D {
> +	.speed =3D KUNIT_SPEED_SLOW,
> +};
> +
> +static struct kunit_case drm_sched_scheduler_two_clients_tests[] =3D {
> +	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_two_clients_gen_pa=
rams,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_two_clients_attr),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_two_clients1 =3D {
> +	.name =3D "drm_sched_scheduler_two_clients_one_credit_tests",
> +	.init =3D drm_sched_scheduler_init,
> +	.exit =3D drm_sched_scheduler_exit,
> +	.test_cases =3D drm_sched_scheduler_two_clients_tests,
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_two_clients2 =3D {
> +	.name =3D "drm_sched_scheduler_two_clients_two_credits_tests",
> +	.init =3D drm_sched_scheduler_init2,
> +	.exit =3D drm_sched_scheduler_exit,
> +	.test_cases =3D drm_sched_scheduler_two_clients_tests,
> +};
> +
> +kunit_test_suites(&drm_sched_scheduler_overhead,
> +		=C2=A0 &drm_sched_scheduler_two_clients1,
> +		=C2=A0 &drm_sched_scheduler_two_clients2);

