Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4797D2D00
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E71310E189;
	Mon, 23 Oct 2023 08:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA3210E189;
 Mon, 23 Oct 2023 08:42:53 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SDTGd4JwDz9sTb;
 Mon, 23 Oct 2023 10:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1698050569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYr2H+MAjRLIImn6u5izyM0A6DQVXuI2FZoqu1Z6Zbo=;
 b=jdaPcrNcB0xPtWIjsdigdQ70FAWRJl6niRDY5quiNqwNwysBi+0kCJRpbvjn3YMhihAwO7
 HN/9HBOcph42sMLVmWNH5QGfZsUjlc2qCTmgsfmmRdcmG/qJvJMwhn9AeFcNzvvEsNIrXt
 LGIAtefpIutewUUSbk5o4NvQy/SYmxCMTgkrRHXpJVS2E8ftQNfUNq5gjh3/a+UzM9Dy9j
 ZBMrAzibEJh7QWT/OVTeTq18o/lHBd+VDuAHcbFTB8fZoVw6qLZH8SUeFp5rG77ntcV0wZ
 obfKOzZW3aTFipizNpD1UgzRmabU/SZvV9gY/kMWD8ZY29hPBkEd6zCRdwZagw==
Message-ID: <745e35ee-d617-9ce0-8b4e-795c84a5af48@mailbox.org>
Date: Mon, 23 Oct 2023 10:42:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v7 4/6] drm: Refuse to async flip with atomic prop changes
Content-Language: de-CH-frami, en-CA
To: Simon Ser <contact@emersion.fr>
References: <20231017092837.32428-1-andrealmeid@igalia.com>
 <20231017092837.32428-5-andrealmeid@igalia.com>
 <CzEtDALWvF3EU4DDLLEmH3ms0B25PbsEHRU9b_IqwfyhzdG4zC-XXAU6fm2PnMcngAYmntH7s4iuew0vocN6cO8zUit8kgi-Sb1hBQXNYiw=@emersion.fr>
 <3r5-_03WC5dK3LaRt1Is78zD_bmT2aaGc5h9jpUGzo2o5GCtGP1zpQNzUxglsieewFklY7xwTrOS9jtI18YlNnnzHNx2Ccw9yM2NuJpDQZU=@emersion.fr>
 <8c1641e4-a7e2-ecb2-ab7a-c6e2bb3e951b@mailbox.org>
 <Bi9El_nuZXA997YlVyCzD5s7KfP820IVUuYiB69mgXnjQbfCgOucCBe6aKvSFrMzB_9DwxO2lli_MqLzMuGZ-rmrRp57vePsTwUarEweLJs=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <Bi9El_nuZXA997YlVyCzD5s7KfP820IVUuYiB69mgXnjQbfCgOucCBe6aKvSFrMzB_9DwxO2lli_MqLzMuGZ-rmrRp57vePsTwUarEweLJs=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5f900b922b850b866e6
X-MBO-RS-META: wpapn7uy8zys441xyzy5gwxubqa7ewo4
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
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, christian.koenig@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/23/23 10:27, Simon Ser wrote:
> On Sunday, October 22nd, 2023 at 12:12, Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>> On 10/17/23 14:16, Simon Ser wrote:
>>
>>> After discussing with André it seems like we missed a plane type check
>>> here. We need to make sure FB_ID changes are only allowed on primary
>>> planes.
>>
>> Can you elaborate why that's needed?
> 
> Current drivers are in general not prepared to perform async page-flips
> on planes other than primary. For instance I don't think i915 has logic
> to perform async page-flip on an overlay plane FB_ID change.

That should be handled in the driver's atomic_check then?

Async flips of overlay planes would be useful e.g. for presenting a windowed application with tearing, while the rest of the desktop is tear-free.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

