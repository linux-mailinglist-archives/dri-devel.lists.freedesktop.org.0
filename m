Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE8182E7A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 12:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91EF6E14C;
	Thu, 12 Mar 2020 11:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7ED6E139;
 Thu, 12 Mar 2020 11:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqKX/iLNvweK6TndTHeNAuqAedlRoxU1tS0l/yPT7IZ64wt93C0QpZElJu9ecYKAPvvaM9qxthXGz5jQKTxndTRCZZAC37WwJoyUbAqCDdHuF2K+q2ndozjujIwtWhy2TVIuTNDTVlONDvF0tJN2a87uoq0VUz0WtW5sa23lyEi0XP1yOx3e3xk9uifU5Otx18r6Xld9zq6roiuHkn5LYtbsk6q471jJdet67j9zfFM+uUXyCmOvWB7/yDgqIyq8t9MkFP+4Fwl4gvv5AC7bXq+wZyogKnVvrNvjjgy1DYfGoB6asPVH+7DWmog0yLOKECPDPeuPQL00+h3uPjh5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC3pqboiSVsQPai790zsGyCTCfFcg1DNR0C3nvti61s=;
 b=oWEV9D0rFrKx8AtVHWJ+SSLB8X2lUm18DrVIhA6tsmFUdCx8M05mwEGoRiIaHcRQ5xu7Hxx1Y/nDQlcCuQfRIRN97jBLZ/UX8iHcp6mgcn8U89I6L8KSBKWKXgq8S0V7EIYFHn4TdjLywSyvsqIjiuCfc8vSlx9Fl+d9Uuqi1s4IqRemw9MMsHizfFzs7Mw3Rv85PsB5xVR/GzoPDqTN8jOEtysTGjOqwck05UiIPbGnbos1zGqLuY8k4DggZon4y5eDmkG5gAxkYfAVrs8mfy4Q1cddMY5dg5cIoz0DwX0ZlHJtxNH3FB0lg8v4BaTtmebW7r2/PqngqNeBTbgPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC3pqboiSVsQPai790zsGyCTCfFcg1DNR0C3nvti61s=;
 b=IZSiO4837KWm2Qtk8+2Ea7pOaK7a0TtMr2R2+ln1ru4Si097tWMQ+5ocl/jdUEihZZVTShIxfy+y7BwiBECJDEGwUMrYP/fUBu0XRB0yPSLJqno/5IqjGGH0h+urRAUvGYmPQrP4fUnW6OhAy2UuxZd9gfzmhBq625FUcousM04=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1610.namprd12.prod.outlook.com (2603:10b6:4:3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Thu, 12 Mar 2020 11:02:15 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 11:02:15 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To: Christoph Hellwig <hch@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <211ea421-3621-b380-cada-c2432da45172@amd.com>
Date: Thu, 12 Mar 2020 12:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200312104729.GA26031@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14 via Frontend Transport; Thu, 12 Mar 2020 11:02:13 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42b0ee90-061a-49bd-c5eb-08d7c674d284
X-MS-TrafficTypeDiagnostic: DM5PR12MB1610:|DM5PR12MB1610:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1610AD032C98E9D7A26EF40B83FD0@DM5PR12MB1610.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(8676002)(6666004)(316002)(36756003)(4326008)(16526019)(186003)(86362001)(2616005)(5660300002)(6486002)(66946007)(66574012)(66556008)(66476007)(31696002)(478600001)(31686004)(81166006)(2906002)(6916009)(8936002)(81156014)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1610;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/1Vo6ncBD7szPceRnz7HddP7+yi/rLPdxfeDTllYzNY9H2brF5r7XShEahv9kW1Ez+S3YvLbVwa0nJTWAn1+5Dp0Z+XUk7XkXFCkYlX2e8v5iNP1pLk2xPdfxXRYP27Iv1Y/bhEiMR64aRmxKA8MR4Vhi6cwMPlBDh2LO16dhiNEeLfbwvPpedfEfNsJG8hYxvTvIuTaQRHmyRvPw5LJwt93QJSXxV/pdpgtdzY9OtnSrLrhQ+Uj1wAf4rIo60gCp55C/7vdhdtScUL4QeS8IGeZ3kGvx71thJAO7BGoIvntikZMXPOkOMHKGEx7684UKYGMxZLpE2ZxaoyAF+U4W336/4X2K8ZPtVTlH36kcDZmZk2YmcYQqhIxfr6wpgkZLgRz1+BVk7sc9KbGoT7B4L7jXVtlOdZXnZE8EAwEMY+iPjtPl+W4gQK3yL8H212
X-MS-Exchange-AntiSpam-MessageData: EZHZkPz4wRLMpUHq9B/EYLqc/jV1wyWHGdgQ/t24U8OiHQychZMWS6kgBoSDnFa4Jv8FAA2aVpFAekbF+dOolIfsHKhM71IB5CLXNR+O0O1hC5iO5WD7yuJvqMqaQlEPKotSNJUr2l5wBGog4HWRcw+nS4XcluaVH2Nn9Qp2STFXPDEJ/K1sPqvzPL+frgUsnJnuwUHGN5iYJ2m6+kfoGw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b0ee90-061a-49bd-c5eb-08d7c674d284
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 11:02:14.9236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA2eMtUYvUUeHcF0iRdQ3XWuiapRKGlX/ulhpzrLzdVuiFHSuvr4Rwn7xhlZ0uNT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1610
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDMuMjAgdW0gMTE6NDcgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoKPiBPbiBUaHUs
IE1hciAxMiwgMjAyMCBhdCAxMTozMTozNUFNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IFtTTklQXQo+PiBJIG1lYW4gd2UgY291bGQgY29tZSB1cCB3aXRoIGEgbmV3IHN0cnVjdHVy
ZSBmb3IgdGhpcywgYnV0IHRvIG1lIHRoYXQganVzdAo+PiBsb29rcyBsaWtlIHJlaW52ZW50aW5n
IHRoZSB3aGVlbC4gRXNwZWNpYWxseSBzaW5jZSBkcml2ZXJzIG5lZWQgdG8gYmUgYWJsZQo+PiB0
byBoYW5kbGUgYm90aCBJL08gdG8gc3lzdGVtIG1lbW9yeSBhbmQgSS9PIHRvIFBDSWUgQkFScy4K
PiBUaGUgc3RydWN0dXJlIGZvciBob2xkaW5nIHRoZSBzdHJ1Y3QgcGFnZSBzaWRlIG9mIHRoZSBz
Y2F0dGVybGlzdCBpcwo+IGNhbGxlZCBzdHJ1Y3QgYmlvX3ZlYywgc28gZmFyIG1vc3RseSB1c2Vk
IGJ5IHRoZSBibG9jayBhbmQgbmV0d29ya2luZwo+IGNvZGUuCgpZZWFoLCBJJ20gYXdhcmUgb2Yg
dGhpcy4KCj4gVGhlIHN0cnVjdHVyZSBmb3IgaG9sZGluZyBkbWEgYWRkcmVzc2VzIGRvZXNuJ3Qg
cmVhbGx5IGV4aXN0Cj4gaW4gYSBnZW5lcmljIGZvcm0sIGJ1dCB3b3VsZCBiZSBhbiBhcnJheSBv
ZiB0aGVzZSBzdHJ1Y3R1cmVzOgo+Cj4gc3RydWN0IGRtYV9zZyB7Cj4gCWRtYV9hZGRyX3QJYWRk
cjsKPiAJdTMyCQlsZW47Cj4gfTsKClNvIHRoZSB3aG9sZSBpZGVhIGlzIHRvIG51a2Ugc2NhdHRl
cmxpc3Qvc2dfdGFibGUgaW4gdGhlIGxvbmcgdGVybSBhbmQgCnN3aXRjaCBvdmVyIHRvIHVzaW5n
IGJpb192ZWMgYXMgaW5wdXQgYW5kIGRtYV9zZyBhcyBvdXRwdXQgZm9yIGEgRE1BIAptYXBwaW5n
IG9wZXJhdGlvbi4KCklzIHRoYXQgY29ycmVjdD8gSWYgeWVzIEkgY291bGQgbGl2ZSB3aXRoIHRo
YXQsIGJ1dCBpdCBtYWtlcyBteSBwYXRjaHNldCAKbXVjaCBtb3JlIGNvbXBsaWNhdGVkLgoKPiBL
ZWVwaW5nIHRoZW0gc2VwYXJhdGUgaXMgaW1wb3J0YW50IGFzIG1vc3QgSU9NTVUgZHJpdmVycyB3
aWxsIHJldHVybgo+IGxlc3MgZW50cmllcyB0aGFuIHlvdSBjYW4gZmVlZCB0aGVtLiAgRS5nLiBp
ZiB5b3VyIGlucHV0IGJvdW5kYXJpZXMKPiBhcmUgNGsgYWxpZ25lZCB5b3Ugd2lsbCB1c3VhbGx5
IGp1c3QgZ2V0IGEgc2luZ2xlIElPVkEgZW50cnkgYmFjay4KPiBJIHdpbGwgc29vbiBhbHNvIGhh
dmUgYSBkbWEgbWFwcGluZyBpbnRlcmZhY2UgdGhhdCB3aWxsIHRha2UgYWR2YW50YWdlCj4gb2Yg
dGhhdCBmYWN0LgoKWWVhaCwgSSBub3RpY2VkIGFzIHdlbGwgdGhhdCB0aGlzIGlzIG5vdCByZWFs
bHkgd2VsbCBoYW5kbGVkLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssCkNocmlzdGlhbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
