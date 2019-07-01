Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A75C4B4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F789D66;
	Mon,  1 Jul 2019 20:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4A89BB2;
 Mon,  1 Jul 2019 18:37:47 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id A63C1607EB; Mon,  1 Jul 2019 18:37:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6398E6025A;
 Mon,  1 Jul 2019 18:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6398E6025A
Subject: Re: [PATCH 4/5] drm/msm/dsi: get the clocks into OFF state at init
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-5-robdclark@gmail.com>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <75a2921d-bf1a-c4c1-6d9a-122474eface4@codeaurora.org>
Date: Mon, 1 Jul 2019 12:37:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190630150230.7878-5-robdclark@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562006267;
 bh=8fNYQV/mX48XAQ/7BIca3VAe6+C0LHKpD0No3pF+wh8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AInBaBeCGy4MNIoUUIrby009e1q7FOqQZE9CK+ZBM71SHkJKCs53J+1OAAjLsYcPj
 20MbG4abYW9GyXm34jMgeKPXl4KT9Mz1eH+mG55rdTMu7CtybyEaR2frlAOOVhWro3
 jjzcWu1FfAcW7Q9/Rf6BXoAYVvP5bWRgAZNOb2pg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562006266;
 bh=8fNYQV/mX48XAQ/7BIca3VAe6+C0LHKpD0No3pF+wh8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g/aIB2b1vMtE9WRT9Ka77ODQA0C5O2r+3ZRQOHVvVF5yFyB5LFm15VD0vPNd245q9
 zInHPA/A8x/rGw6oJV73DB/7YKYsgPVGyNY6PznWRvDlQ3hhyhqARP6FoqP0UWj/R5
 mKcnwrMX+tky0L5Nte4vZnrpVNxLuO6fxVWoiVew=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jhugo@codeaurora.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Mamta Shukla <mamtashukla555@gmail.com>, Sibi Sankar <sibis@codeaurora.org>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8zMC8yMDE5IDk6MDEgQU0sIFJvYiBDbGFyayB3cm90ZToKPiBGcm9tOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gCj4gRG8gYW4gZXh0cmEgZW5hYmxlL2Rpc2FibGUg
Y3ljbGUgYXQgaW5pdCwgdG8gZ2V0IHRoZSBjbGtzIGludG8gZGlzYWJsZWQKPiBzdGF0ZSBpbiBj
YXNlIGJvb3Rsb2FkZXIgbGVmdCB0aGVtIGVuYWJsZWQuCj4gCj4gSW4gY2FzZSB0aGV5IHdlcmUg
YWxyZWFkeSBlbmFibGVkLCB0aGUgY2xrX3ByZXBhcmVfZW5hYmxlKCkgaGFzIG5vIHJlYWwKPiBl
ZmZlY3QsIG90aGVyIHRoYW4gZ2V0dGluZyB0aGUgZW5hYmxlX2NvdW50L3ByZXBhcmVfY291bnQg
aW50byB0aGUgcmlnaHQKPiBzdGF0ZSBzbyB0aGF0IHdlIGNhbiBkaXNhYmxlIGNsb2NrcyBpbiB0
aGUgY29ycmVjdCBvcmRlci4gIFRoaXMgd2F5IHdlCj4gYXZvaWQgaGF2aW5nIHN0dWNrIGNsb2Nr
cyB3aGVuIHdlIGxhdGVyIHdhbnQgdG8gZG8gYSBtb2Rlc2V0IGFuZCBzZXQgdGhlCj4gY2xvY2sg
cmF0ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0u
b3JnPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyAgICAgICAg
IHwgMTggKysrKysrKysrKysrKysrLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwv
ZHNpX3BsbF8xMG5tLmMgfCAgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL3BsbC9kc2lfcGxsXzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lf
cGxsXzEwbm0uYwo+IGluZGV4IGFhYmFiNjMxMTA0My4uZDAxNzJkOGRiODgyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYwo+IEBAIC0zNTQsNiArMzU0
LDcgQEAgc3RhdGljIGludCBkc2lfcGxsXzEwbm1fbG9ja19zdGF0dXMoc3RydWN0IGRzaV9wbGxf
MTBubSAqcGxsKQo+ICAgCWlmIChyYykKPiAgIAkJcHJfZXJyKCJEU0kgUExMKCVkKSBsb2NrIGZh
aWxlZCwgc3RhdHVzPTB4JTA4eFxuIiwKPiAgIAkJICAgICAgIHBsbC0+aWQsIHN0YXR1cyk7Cj4g
K3JjID0gMDsgLy8gSEFDSywgdGhpcyB3aWxsIGZhaWwgaWYgUExMIGFscmVhZHkgcnVubmluZy4u
CgpVbW0sIHdoeT8gIElzIHRoaXMgaW50ZW50aW9uYWw/CgoKLS0gCkplZmZyZXkgSHVnbwpRdWFs
Y29tbSBEYXRhY2VudGVyIFRlY2hub2xvZ2llcyBhcyBhbiBhZmZpbGlhdGUgb2YgUXVhbGNvbW0g
ClRlY2hub2xvZ2llcywgSW5jLgpRdWFsY29tbSBUZWNobm9sb2dpZXMsIEluYy4gaXMgYSBtZW1i
ZXIgb2YgdGhlCkNvZGUgQXVyb3JhIEZvcnVtLCBhIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3Jh
dGl2ZSBQcm9qZWN0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
