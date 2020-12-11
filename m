Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A92D93F2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3CA6E098;
	Mon, 14 Dec 2020 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569066EDDA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 12:46:25 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fd36a200000>; Fri, 11 Dec 2020 04:46:24 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 12:46:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 11 Dec 2020 12:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivPyWlQd99r1UrgnSqm6xLgsheC/nra+/7OZjMmKcX3nOaxS8gcLIlUkh6skY596Y9JJzSExzX22EksbUceI88uzkJJRGYBIUfO2pCBm7ElXrwrSfT4aTPaNYsrvvrs/2V0BFMBDdxpBMvIrb6tii87pBlHcnv8KIhnsWN4SbNhwITksms3LV9NibxG2/UkHLmdnVQsaCIAt94MLu4RzTc0cdh4SytcOBMLwcRyXIhnYevFVr4yC7jgLE4boT7D80KIg6aKyo84v++YObG8WVwwVYIkQSvIqlbyskjWd8zTaX89HKrJp97Cmd8aCF5+9mDViYF5jMoImUT6Zd/Q9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlTOcJjy+tb/vvRXYZ/i4R+Jr2FUjwvOEgszhdE10ps=;
 b=Ao7oDYly1JU36y8hcl87O0zuf2Fa4T6xAwVLAiOmPfVsAbAKOFdg5VK0js6K3vWHjUUkTrp2HIpf2ch9ZlbpfrkeEwHEcKi5tN+fy4JcZD7RjdNKhDLEqhFGYWX2/DP12m3whyt6o583KeCL4MpEQaq9bYbhfJK2LnVWVNSrQ1Fn93E2UXHKEPzbmELSqN9fwigB3gdT+Fm91cDsxrTAmeYtklyJDptbIw+kOU5kc6XonC6cM22oPY//JDMpxDsISMq2BCgF9X6oMCSwb8aH1q72wNv6BK4njj5YMYT7LWtcEGNZNssaY30Ww7i8uhXLuR+qF1aGydN3ouOlmOKSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 12:46:21 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1ce9:3434:90fe:3433]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1ce9:3434:90fe:3433%3]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 12:46:21 +0000
Date: Fri, 11 Dec 2020 08:46:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
Message-ID: <20201211124618.GC552508@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
 <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
Content-Disposition: inline
In-Reply-To: <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
X-ClientProxiedBy: MN2PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:208:236::31) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:208:236::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.9 via Frontend
 Transport; Fri, 11 Dec 2020 12:46:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1knhoQ-009CDo-S2; Fri, 11 Dec 2020 08:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607690784; bh=5nFZPrsQVooOQ+jIxwW0lHiaHYng3UX1KZ13Tenf0do=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=OILxA1t8t07/iobARPyHh4/JWbOpwIC+Dp1YslQAUshPXKtX2LlM+vu20qVwg2At0
 LRXx1aCGJY3o/YKNNOzfd9raX3teTrXYi9lLRZh58jydNbWShyyx0uks5Y87j/6g1f
 58llLWgr6MlAEQn+E8svmP3mLN48qOMAQbWG3AKFx8ympOAIyy+nVgpwqpxr6diU1K
 SHQCvKIxKnGQ0spISNBm0wR1MlQ7Qwd1Xmecoj6DcVBuSKl9EN9+P1f//pzXkNRqem
 xPnIOLZpu4G7AzSYnkpxxELy3NBee3/nTcyzE1k1pKGDMJOBg+wobLmHjCytVKDZs1
 jJjaSRjQKyCfA==
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMTEsIDIwMjAgYXQgMDg6NTA6NTNBTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKCj4gTXkgdW5kZXJzdGFuZGluZyBvZiB0aGlzIHBhcnRpY3VsYXIg
Y2FzZSBpcyB0aGF0IGhhcmR3YXJlIHdvdWxkIGNvbnRpbnVlIHRvCj4gRE1BIHRvIG9ycGhhbmVk
IHBhZ2VzIHRoYXQgYXJlIHBpbm5lZCB1bnRpbCB0aGUgZHJpdmVyIGlzIGRvbmUgd2l0aAo+IERN
QSwKCm1tdSBub3RpZmllciByZXBsYWNlcyBwaW5uaW5nIGFzIHRoZSBsb2NraW5nIG1lY2hhbmlz
bS4gRHJpdmVycyB1c2luZwptbXUgbm90aWZpZXIgc2hvdWxkIG5vdCBiZSB0YWtpbmcgcGlucy4K
CktlZXAgaW4gbWluZCB0aGlzIHdhcyBhbGwgYnVpbHQgZm9yIEhXIHdpdGggcmVhbCBzaGFkb3cg
cGFnZSB0YWJsZXMKdGhhdCBjYW4gZG8gZmluZSBncmFpbmVkIG1hbmlwdWxhdGlvbi4KClRoZSBH
UFUgdmVyc2lvbiBvZiB0aGlzIHRvIGluc3RlYWQgbWFuaXB1bGF0ZSBhIGNvbW1hbmQgcXVldWUg
aXMgYSBiaWcKYWJlcnJhdGlvbiBmcm9tIHdoYXQgd2FzIGludGVuZGVkLgoKSmFzb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
