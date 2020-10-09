Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBEF28833D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0862F6EC47;
	Fri,  9 Oct 2020 07:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C976EC46;
 Fri,  9 Oct 2020 07:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSoQjE8jcWXyE9LU3qewpe2fLxAyQIzUkOuyMmkuDNHFb+1AggmGOAUBm00L/bMiHhLUXB7XbJeVGAOJa2KU0mD+/+yWskglHAhK8tW/f6Oj2bMDQ0lF8WXJDzi/NZdrPyqTY47Yi8RjMtcI9Z8rxvoYMI0xcJcW4X+EbnUWmYfdO7r/QOuCqBjX72mhVgAZ/GuuqfTD+xQTePdaXd7x+hWc6i1cIupiE3k0DmySTcUn5YDFDw3DHfdqbXi3LJSUkxuIcsCgOAiCPjGHwe7w2TSx8JIU79PkiEN8ZRh9qggf7eewi8HHMchUsrg9gVVKU3P2thXX8a+OE0bWQ/n72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtSzWU8QqFxbw0Q+DmOQb0yEWY7U8XgzCyDFJ7Dgi3k=;
 b=Vo6rmXl773xStE0kV5TnaTltWs06vHd2iepBrNMiH84nU7ns67v+y+BKs2HKeIOD57otKOE1d5bQ3MJfMSoNkv1trTPqjuorFTOzsdF4vvLZayjU7YGocxW6B90tdbWh1ZO3abWhcnjCoUpbWvy3vKgJuC5VCD1LOp4YMu3+gbo445NH03Ryy3JrMTTt16B//ubFsvw6hA0l2s/spDdQqs/2ogy8yYsIpp0mwUoVQVOSxzcphljuP1QzOfitpPz4CCQWM/IxDwNr5affqHJd1FPpT6XD5T7n2RZEUn1BNrveHGAs1evSG5jOawTzDTcl6ox88h0wFR3JH439LY4F7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtSzWU8QqFxbw0Q+DmOQb0yEWY7U8XgzCyDFJ7Dgi3k=;
 b=zKNpE8wzC1amxULrLFcXgd1a60i1M251joYCmTXtx0MOaVxXrtw0MvStJviVT9EYJXwiAAKJhSsnBAZdFZirMbMOfaTUQu5ms2DLwmHuglDjUMYwAmFtjId7WZxOLfEh4u2cX3hQ/5ArpQPzOArXc7Gr2Pcu34dW3nEj7qeyOyQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 9 Oct
 2020 07:07:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 07:07:38 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Use struct_size() helper in kmalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20201008142305.GA21249@embeddedor>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <273fb8b5-61cc-d65e-bf4a-43767eaad348@amd.com>
Date: Fri, 9 Oct 2020 09:07:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201008142305.GA21249@embeddedor>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:205:1::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:205:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.11 via Frontend Transport; Fri, 9 Oct 2020 07:07:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c9c02f5-5fb7-47d7-027b-08d86c220147
X-MS-TrafficTypeDiagnostic: MN2PR12MB4343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43431C36D72BCA911B5DB0DF83080@MN2PR12MB4343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnUt1hMFnxnB8dqwHdnqWCr8N5fPoq2gCVuRBE8gbO1Zr0c9JOGZliqdFa5u2rmQgr966GbhGlkjJ3+rCDAcouj+NSai0ORsNoqwlatTYj4aTMeFPmrxD3SLr/qM2BXj/3Gr+zv6lkcbtWE+QFHLcahi9Q6hdfvidGo2hsXmJhZ1d7JK4FdQed2uSKs3wBxy4EWNb4Dm6hWBDVqqBQLDSByXsMTylGf0HDX5XepXd3Tqc2wgO94oSQTpsiwyfSY8X1qCPgYL0uE9/V3+t7DNCMxo47pz47X4P7aO4x0lvAHR/ht6SkTXBiWXdlDz1o/nA0fa2qkjlMdpgmWhuuEeVcwofj86Axh3nfMwq+CskNdgV4mU5SzMMpY4nsgn7XNR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(31696002)(31686004)(6486002)(66476007)(66946007)(86362001)(66556008)(478600001)(186003)(8936002)(16526019)(316002)(4326008)(2906002)(5660300002)(6666004)(4744005)(83380400001)(52116002)(110136005)(2616005)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: W4BG0qQ+aDL3aoXXT4+54HBCupW4rXEG/8Pcl/1nsZp7Xn3WG5+s/3eYeWlwzR8LIsDDxgvgZKtcqUFRlSRLJe66OQHn8rRCXgkFYdt4xzHoUt0uKBYLcaxgdEa5aVHALfTtJO4xKtRer28vMXt1UrAx4iVHz+pk+yCYfCvKze2f0ISt+GZxpXBdfiypmo0QMFv0PMHkiBvwL4U0cGA//DASHJ4bWsBKEIYNuPPCOxWsNju1EXtOtobe8Rs5BoohqfiD5GeqpmOWKrFF6a+xOWfj694O+6GAXEoCAB/Xf8ipGlxPtZFWfOrJI84ZUCjoMGgUX4gOUIxvSo1kpXtrhSxEbamlbiXWPxjsUz4kxJrba1MSK4J2BMrbWE1HeedfDyqqIyVgDUGmkFjwHKEpxbuKtMZKdWtYPHXcqaoIH+VymUjueNqu8sLLKiROQ/+u6yE9MTbRUUdpLpXlw93WqSDAirSZM/ByT29hp1Gyz59MPI0kfT8HbHGSGTZ14E2+vSf0dYpvIdGI7j40exRGxlktcrQrg2MahTeyBsSK1sFIS//P32Nwggt1QBrp4dB4RvJi766hGJz+p9eZ/YMEJ7e/MxPEONGkk85kgWD5FQy883B4yg9vJXz9hkNcI1nJok83D66M5cfU3Jc8iNhdD0B+vbewanuVlPupRdC0yeX9//S7SSsn0XN0Svd0MFVr94f7KTVe5uxBcTClqMj9tw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9c02f5-5fb7-47d7-027b-08d86c220147
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 07:07:38.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSI+iJ8F9QSv8pwLRrfVquVf2+Souzfp/vthJpqfWGtry+ZdQ+KoH2oH3tChJjr4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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
Cc: linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTAuMjAgdW0gMTY6MjMgc2NocmllYiBHdXN0YXZvIEEuIFIuIFNpbHZhOgo+IE1ha2Ug
dXNlIG9mIHRoZSBuZXcgc3RydWN0X3NpemUoKSBoZWxwZXIgaW5zdGVhZCBvZiB0aGUgb2Zmc2V0
b2YoKSBpZGlvbS4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rh
dm9hcnNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMyArLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBpbmRleCA1ZGE0ODdiNjRhNjYuLjMwMTkyZGNl
Nzc3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMKPiBAQCAtMjM5LDggKzIzOSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2FtZGtm
ZF9yZW1vdmVfZXZpY3Rpb25fZmVuY2Uoc3RydWN0IGFtZGdwdV9ibyAqYm8sCj4gICAJaWYgKCFv
bGQpCj4gICAJCXJldHVybiAwOwo+ICAgCj4gLQluZXcgPSBrbWFsbG9jKG9mZnNldG9mKHR5cGVv
ZigqbmV3KSwgc2hhcmVkW29sZC0+c2hhcmVkX21heF0pLAo+IC0JCSAgICAgIEdGUF9LRVJORUwp
Owo+ICsJbmV3ID0ga21hbGxvYyhzdHJ1Y3Rfc2l6ZShuZXcsIHNoYXJlZCwgb2xkLT5zaGFyZWRf
bWF4KSwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFuZXcpCj4gICAJCXJldHVybiAtRU5PTUVNOwo+
ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
