Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1C6ED145
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 17:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E32710E52E;
	Mon, 24 Apr 2023 15:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9968910E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 15:27:11 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Q4ps71Hc2z9sS4;
 Mon, 24 Apr 2023 17:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1682350027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Tt+Y6RZe0zG2wcUcokq0BmxIDA6TLPrv0bGafz9ZRk=;
 b=ax9QB8v+MBZ09/fkr0Gtv/mTTeschHlTrgxNyJZLTrFpvdvcr0XiGWAmkoV5jNboBrFtvk
 ismmDYlkuhL67Z8R+LFKqH6YSxbX4+56V0mcq4xpwfHdiiKO35p4Cfdsv+JLj0dByeP+qv
 TlBv0c+08Ujf15zK20LFUiGoD04ZtfDu8q5+fmq5ubNyFCzk8rvypm8Ne1wWUPbQx5zUwK
 M09uZHXcQ5lWzRNPjXLoGJiFLxgIsvX4fnX+wR+NLU1YPYkmExQm2Cq16p8ibY0C52o+eu
 8F2bjF9yS3sAtK2VylxztJmklpdOa5fLkejwLOPFojm55F+PFe63L1lvMq/QfQ==
Message-ID: <ee66058d-0d2c-9665-d4ea-c07f9aca820f@mailbox.org>
Date: Mon, 24 Apr 2023 17:27:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <717b333b-7af6-063e-d50d-bb2b3bbcecb4@igalia.com>
Content-Language: de-CH-frami, en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <717b333b-7af6-063e-d50d-bb2b3bbcecb4@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 44fd1fd5febec46d579
X-MBO-RS-META: bbd7r41xaxjj4czat5xnca4663bb86cm
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/23 15:26, André Almeida wrote:
>>
>> Additional to that I currently didn't considered soft-recovered submissions as fatal and continue accepting submissions from that context, but already wanted to talk with Marek about that behavior.
>>
> 
> Interesting. I will try to test and validate this approach to see if the contexts keep working as expected on soft-resets.

FWIW, on this Thinkpad E595 with a Picasso APU, I've hit soft-resets (usually either in Firefox or gnome-shell) a number of times, and usually continued using the GNOME session for a few days without any issues.

(Interestingly, Firefox reacts to the soft-resets by falling back to software rendering, even when it's not guilty itself)


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

