Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F5AD8611
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7D510E05B;
	Fri, 13 Jun 2025 08:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RjWq9fLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6B810E05B;
 Fri, 13 Jun 2025 08:52:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBBEE6115D;
 Fri, 13 Jun 2025 08:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C62C4CEE3;
 Fri, 13 Jun 2025 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749803707;
 bh=8rfTI92v8X7cPjaWzRmyjEyTpeYwKs5RV927Ag42TLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RjWq9fLHGHxaq18aHrPeOI/fj/KlgMBUIQL6QXjLkzTB8n49SurjDPtCdlRPNd+RW
 wjK8f+SKcA52tmNtOfThOzaqziEDaifY0Y4rE9RLNArhNu6GO3N7n4O2z+enAYJRLl
 2h3hywxoQ1SFp700eznC4WS3Eo9cEMNR0dAuJre+PWvy5fOGmIJexIrRyagheJAmiM
 U1z4Ueb4j4Q5k0R6FuDnN6sJh9jP/QQWqQyTIYwkD0rY3LoIersAw7ch/CjCgjZL6G
 H1N5fwxAsyhfrfrsz5borDYOxuPmmPCsB2nGkX3mt3iJE11LuPPzXpiMtiK9yvKNER
 0U/vAi0q5OoSg==
Date: Fri, 13 Jun 2025 10:35:03 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEvitwoc_D6OxXCS@pollux>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
 <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
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

On Fri, Jun 13, 2025 at 10:23:15AM +0200, Christian König wrote:
> > Another option is to just add an interface to get a kernel client_id from the
> > same atomic / IDA.
> 
> That won't give us fixed numbers for in kernel clients.

That's fine, then let's come up with an API that reserves fixed numbers.

My main concern is that drivers silently rely on DRM API internals, i.e. that
client_id is an u64 atomic, etc.
