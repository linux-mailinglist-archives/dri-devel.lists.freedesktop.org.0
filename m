Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E238C34AF0B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 20:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EB46F47A;
	Fri, 26 Mar 2021 19:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E276F47A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 19:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=erHlh/QTqIRNBeQcZ402/xZoPrZyyfh2s9Bmv0LbzRc=; b=idQ0hJQEM20zC1tvjCOgiHa/ax
 CYh5nEMkxBgbvHOBb0xNt7iA3W2YXioVGjSD4HwA+WOV+tY/57gRlO95JMJEtJKNKSGEUlrP5cAQQ
 eyCa6uR/9Ia9CG3IZHbz8yF561S1cuPbLEqgedCRoVum7wobkpvosK5IT1JlV1KsVdWt8gWVajX/8
 hIDW1BvMTwl50PVaDaIdlULeJ+O9mZS2960H8ArrsliQlG4FTamqKZbklrlP1G3uD6QkhUVtMwsC/
 b+M7x5sOKMaTu7xxqhjTxOPDuXmZMyvyH4wwYFci0IZLoVmK4kpK2eO9Cv3WcxUNMrNrJvl0kFzMK
 eMa8NJCw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lPrr6-0002vo-DZ; Fri, 26 Mar 2021 21:10:48 +0200
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
 <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <48367008-1786-6cb6-15a0-03b526f53fe9@kapsi.fi>
Date: Fri, 26 Mar 2021 21:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8yNi8yMSA4OjMxIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjYuMDMuMjAyMSAx
Nzo1NCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+Cj4+IExvY2tkZXAgZG9lc24ndCBz
ZWVtIHRvIGJlIGxpa2luZyBkZXZfbmFtZSgpIGZvciB0aGUgbmFtZSwgYW5kIEkgdGhpbmsKPj4g
YWxsb2NhdGluZyBhIHN0cmluZyBmb3IgdGhpcyBwdXJwb3NlIHNlZW1zIGEgYml0IG92ZXJraWxs
LCBzbyBJJ2xsIGtlZXAKPj4gdGhlIGxvY2sgbmFtZSBhcyBpcyBpZiB0aGVyZSBhcmUgbm8gb2Jq
ZWN0aW9ucy4KPiAKPiBXaGF0IGRvZXMgImxpa2luZyIgbWVhbj8KPiAKCmtlcm5lbC9sb2NraW5n
L2xvY2tkZXAuYzo4OTQgKG9uIG15IGxvY2FsIHRyZWUpOgoKICAgICAgICAgICAgICAgICAgICAg
ICAgV0FSTl9PTl9PTkNFKGNsYXNzLT5uYW1lICE9IGxvY2stPm5hbWUgJiYKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrLT5rZXkgIT0gCiZfX2xvY2tkZXBfbm9fdmFs
aWRhdGVfXyk7CgpNaWtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
