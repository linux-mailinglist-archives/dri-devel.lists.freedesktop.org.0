Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8801D7D227E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 12:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBFD10E06E;
	Sun, 22 Oct 2023 10:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477410E061;
 Sun, 22 Oct 2023 10:12:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SCvJc010vz9sc8;
 Sun, 22 Oct 2023 12:12:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1697969552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9pCW3esi4cGD7GNRQGPwStAuhs4FyHDpTPRuNYfiwQ=;
 b=tc1k850Y28GbB7Cl2wR0AvUpKD7mgre+G/S1JH6+HThHgWTgY20W2td3ZGVPYKwOc+IrQ6
 lcw8W7BufgVozjqFwWWiZ3/GhtyYfTRVMpeCHjkxJZjv91Oq5O46of3h5BDn4dP8YyDi+R
 jbpTF2IpQDJNrblKoqa84AF3l8JLAhTvP7IgYBcn3wohHQH7TXGDQJcw94IKV6BCZyK5yU
 IjNh59RgtTX76msWZHMOWmQP6QGjU9HzpAH5AnQbmEk0gps/8VIaFVm13B44gRzICp3Usi
 6Ysr+5BWGHX110W0NQlU6xPhPkapbfUGQDRkdXjSZtoAJJ7uVeE2zOdGN2mokg==
Message-ID: <8c1641e4-a7e2-ecb2-ab7a-c6e2bb3e951b@mailbox.org>
Date: Sun, 22 Oct 2023 12:12:28 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v7 4/6] drm: Refuse to async flip with atomic prop changes
To: Simon Ser <contact@emersion.fr>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>
References: <20231017092837.32428-1-andrealmeid@igalia.com>
 <20231017092837.32428-5-andrealmeid@igalia.com>
 <CzEtDALWvF3EU4DDLLEmH3ms0B25PbsEHRU9b_IqwfyhzdG4zC-XXAU6fm2PnMcngAYmntH7s4iuew0vocN6cO8zUit8kgi-Sb1hBQXNYiw=@emersion.fr>
 <3r5-_03WC5dK3LaRt1Is78zD_bmT2aaGc5h9jpUGzo2o5GCtGP1zpQNzUxglsieewFklY7xwTrOS9jtI18YlNnnzHNx2Ccw9yM2NuJpDQZU=@emersion.fr>
Content-Language: de-CH-frami, en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <3r5-_03WC5dK3LaRt1Is78zD_bmT2aaGc5h9jpUGzo2o5GCtGP1zpQNzUxglsieewFklY7xwTrOS9jtI18YlNnnzHNx2Ccw9yM2NuJpDQZU=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s8qcypr51f1tfyaumquugzjaho4tpc7c
X-MBO-RS-ID: 1dd85632f82723d365f
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, christian.koenig@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/17/23 14:16, Simon Ser wrote:
> After discussing with André it seems like we missed a plane type check
> here. We need to make sure FB_ID changes are only allowed on primary
> planes.

Can you elaborate why that's needed?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

