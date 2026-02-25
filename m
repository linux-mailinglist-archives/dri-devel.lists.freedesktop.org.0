Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LSfEFcun2lXZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:16:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1CC19B5AD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9315E10E7C9;
	Wed, 25 Feb 2026 17:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emxViB2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41D10E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:16:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F9DB43CDC;
 Wed, 25 Feb 2026 17:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385F6C2BCB2;
 Wed, 25 Feb 2026 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772039761;
 bh=jJdzvVKMl5cn0QuJzc7vXdV0mAMHYhsXz6osLCyQqkg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=emxViB2PRoqwP7d4rpdwXv6bTCYQD9BI/qjOXLPFK0TrQPZzPJGxNADxmpSJnb37j
 YpsCB0CfrboereOvxHKjW58gmH5ODcAIpLzVpFXnau81eTf4/oEKThJrlILMhCa0NQ
 5KXqx6V3m4mzhaaCgKvjZnIPAFc1A3MM+tPLkeDQnMwSAaNBHqxx2xckYmt8WUdztq
 troKRrGbl8HVYsfLjzzNWQM6mHPPTvcSLErcfeQQlE16h8IMb6l34FJyk6p6w5IycN
 mOp7VkzMrw8hL5bq4l92ZUNJ4TxTjkX2Ko4X1faJJ5API/6d1qrpQHFL2aI7+/KUJD
 q1tpj4XcO9Tug==
Date: Wed, 25 Feb 2026 07:16:00 -1000
Message-ID: <a9027a23743a2ec1511d8555ce3ef382@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Natalie Vock <natalie.vock@gmx.de>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Koutny <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/6] cgroup/dmem: Add dmem_cgroup_common_ancestor helper
In-Reply-To: <20260225-dmemcg-aggressive-protect-v4-2-de847ab35184@gmx.de>
References: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
 <20260225-dmemcg-aggressive-protect-v4-2-de847ab35184@gmx.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[tj@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BC1CC19B5AD
X-Rspamd-Action: no action

Each cgroup already knows all its ancestors in cgrp->ancestors[] along with
its depth in cgrp->level (see cgroup_is_descendant() and cgroup_ancestor()).
This can be used to implement a generic cgroup_common_ancestor() a lot more
efficiently. Something like:

  static inline struct cgroup *cgroup_common_ancestor(struct cgroup *a,
                                                      struct cgroup *b)
  {
          int level;

          for (level = min(a->level, b->level); level >= 0; level--)
                  if (a->ancestors[level] == b->ancestors[level])
                          return a->ancestors[level];
          return NULL;
  }

This is O(depth) instead of O(n*m). Can you add a helper like the above in
include/linux/cgroup.h and use it here?

Thanks.
-- 
tejun
