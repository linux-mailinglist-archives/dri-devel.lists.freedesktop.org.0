Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE3ACEA10
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB4C10E26F;
	Thu,  5 Jun 2025 06:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF48A10E26F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:21:04 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-LDVhy8I9ObC4a7QR6ZmgLA-1; Thu,
 05 Jun 2025 02:19:57 -0400
X-MC-Unique: LDVhy8I9ObC4a7QR6ZmgLA-1
X-Mimecast-MFC-AGG-ID: LDVhy8I9ObC4a7QR6ZmgLA_1749104396
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0FC3119560B0; Thu,  5 Jun 2025 06:19:56 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.101])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3C38919560AE; Thu,  5 Jun 2025 06:19:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: drm/ttm: port ttm pools to NUMA aware lru_list
Date: Thu,  5 Jun 2025 16:19:20 +1000
Message-ID: <20250605061951.1234583-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ehuVH4ZjUXm9EcO7QtwRfRfiAZFNETbzkiEE3ud_1qM_1749104396
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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

(RH email ate this the first time).

This is a bit of a tangent before continuing the tangent that is memcg awar=
e pools.

The pools code is already NUMA aware, but it rolls it's own numa awareness,=
 and
in order to move towards memcg awareness, I think a first step is porting t=
he pool
code to lru_list and making the current shrinker NUMA aware. Once this is d=
one
then the next step should be to make the pools/shrinker memcg aware.

I've done light testing of this on a single node rx7900xt and a 4 node MI30=
0A,
and it seems to operate the way I'd expect, but just wanted to get some fee=
dback on
the idea and if anyone can spot any big problems with the strategy.

Thanks,
Dave.

