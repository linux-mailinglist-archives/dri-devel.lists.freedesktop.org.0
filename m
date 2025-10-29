Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FDAC1CFE5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40610E208;
	Wed, 29 Oct 2025 19:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="eG6pf10s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6EA10E208
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761765932; x=1762370732; i=markus.elfring@web.de;
 bh=PggnXzkhetiF8XVSPKz3gVEmsscdfqc3b3AA9jaU5fA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eG6pf10sQEQuskwrVFuy65Pg8cfnaUSP6h4ZeoNbqDBHss7Q+RLS3Rd88PFoMI+y
 0oy/XrsxFzd6cooWJFqB4QvE/tiIm5oiKimZsuRbJBx5LqNbHkyBnOi/91ZNFd+h4
 gaRhdYunBRX3QMbK0tsm5HXKchSoBGtyS9+oaa6uDusX+wy4cRqrl9iOUWzWnzrbb
 /hVjQj/GSf+dehBSjWmNJvZM/MJHMWHW1TokmCfxQma/kKUhSJ4jChLpdEJ2abWqa
 oFs4Ma7c6MJAFGUNdTiesvpXJMhU6UkBcXD3kh76uJno9miax0JrM8EBMER+WNWGg
 AjyK6Hc2OC3moPdJFA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.249]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgub-1w84hf1f0p-011mWX; Wed, 29
 Oct 2025 20:25:32 +0100
Message-ID: <b7de2d4b-f876-429a-9ed0-7d826b9ed966@web.de>
Date: Wed, 29 Oct 2025 20:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
 <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
 <6238912a-8733-4b2c-a155-82bb081e6063@web.de>
 <e4c8b7be-588d-b0b7-00ca-e60cbde034a6@amd.com>
 <80fe1dd3-7541-4629-a540-021603d1f150@web.de>
 <260d8ab9-c986-9dab-a447-ebb55df302c9@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <260d8ab9-c986-9dab-a447-ebb55df302c9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZUSy0IPVT5AA5kwN1cVg8lBlI5PrtvmHQV98LDoevn5JFCozmuN
 kpl1ZZJvk7/z7tKI8qHPvhus3IQFT3vDqoVRDg2oxi7vStJomDg2VOcLUgare1UdQO5W7tX
 NxYbyox5pGDEWTL2/kDMCO+j6S/4QWw4RlfcgjatoBEcgixh506rLRo+U1b9hdhmQqgDuvm
 1ASXSvQLfEu3Dm3eEN9dA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z43RzW6dcfc=;rNXMVGwz/hjZfs4NnL8ZIwjruEt
 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
 U9hA/IvYWWVFY3zvCQSCsfla7jCVkvoLN/U=
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

> What do you mean here for "determine the state value before it would be passed to a concrete call?". What is your concern here?

How often are the (same) state values passed to amdxdna_cmd_set_state() calls?

Regards,
Markus
