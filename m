Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A223B8BC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 12:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BC389F45;
	Tue,  4 Aug 2020 10:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC21F89FE3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 10:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/fbBDJVvUMnwl262siuKY+ytYPaZMLLr13KF0ka6Y8ztWnvPKHFYeTA7EJFjDePxQtlXPcsO5CYlxy0LJQzSEvXF/Bz1lAOt/2e9CEpqKiLFv81Mgxe7WJKAKW2fusiQfYSki3KLoONjpAH46qf4YxcX8MMiDhWM56uOF3J5Rds56rMx/j1QnXO0sriA2qCwQyJ1yF7yxWqO2ukZLyXHo47EeHw/UEi5h1QUfUFu8yWXkDOBYkPMGB3D1R63XR0QSVsC8eo9btSjD8kgmfldqpqOXr9x78HRGIyeHK0pQwjt+wWTowhHzSKSqy/a/5pAvuC46rYmk9AyCi4mlSsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duFyGUbmYhOfTLzJHS7k+wjf2gkGQHPSU/IOYE/M6XU=;
 b=lDBaoIyHos1xPD7BDtEy+f+tGa6qpzbs8hovK9h6Y7ik18leoPIKbR8FaQlo7GMW3d0jk/zjHZTgdk6Qs5QYqpwOXnLoV3q6qWEdV9HDncITeXuFn6fYd+I8EtUNx8uN6GK/Uj03VPxaI54yoKDqEvWn9Q0qkurRFynVU0+grg30ZGUt18RjBffKcERnkpdxmLJc+Y2T/3DQ8bAP0qcquEdJl94fFs+M52oJADDiQ57toMwZZL+SIBvSG8biLgryiB2RGkO7nMAyXoNri9au7ClD88tApZBgxNzaqgEGYdTQd2P7YSDXdHVw4EcP5NfS5iypSHjZ95i8MkOYPVBTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duFyGUbmYhOfTLzJHS7k+wjf2gkGQHPSU/IOYE/M6XU=;
 b=fJIVh+37eERMVK3dND1eZr3FfIoQNOzwYscuigkeXE1clKGsRilNvI9Hv4bJlpCNOyHTmIqaa09IIufSavIxxRMaR7lfVOnVbDDnHOBg0jGc3IIEUHAbbFSxW2xpY/WM73RZkg4b1n1DKfJDiHekWUmg4qrVqbIR0qDzORZMcz0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 10:26:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 10:26:32 +0000
Subject: Re: [PATCH 39/49] drm/ttm: make ttm_bo_man_init/takedown take type +
 args
To: Dave Airlie <airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-40-airlied@gmail.com>
 <ed4f79bc-d01e-bc78-77ef-5120ae70a64f@amd.com>
 <CAPM=9tydAjSwOWf_CRUYqM5HzuhWPH8HUYOmn0P1ufGFCB=Gvg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b39fd32c-0c22-70c6-5abd-22eea744c769@amd.com>
Date: Tue, 4 Aug 2020 12:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tydAjSwOWf_CRUYqM5HzuhWPH8HUYOmn0P1ufGFCB=Gvg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0035.eurprd07.prod.outlook.com
 (2603:10a6:205:1::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:205:1::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.14 via Frontend Transport; Tue, 4 Aug 2020 10:26:31 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 769d7a1d-f674-4352-b97c-08d83860db93
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254B600CE8B1A4EEFE2D389834A0@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJHlAQyEkVoLuPyCERqNCK3RXE2vgKrP9+svhEAA2xD9pPcbT3uJpSMBuoDZK9qvhK7QCfyrR6S9Wdx+y+YLX7JMbBlUZWqRZ4c2ba6oTIjDmEAD7dkeI1AInqlcejnNNqtUTfybxVWLUNVXH5nInWTRgRLpARrerzh8R317Srt08uQIqCQEyOTqpcOZaeZIVLzhsFlj42WOBZ5oJy1O/NHlZLVqN7OIgX33vw8xJkrQ5RgrIXc+1ZxNQ2DlrxNDBrN07UTA2PV6gRb42KZIUInaI3ZeI3D59DEmZDmg+J2lzR0o2Vj6IoYoI96Pl7Y6G1eoPG+4tFgTsYMOMOTWTgx0dvDbtQ/JYY2/8fz7h0mpnL7wKxHF2jevbnJh9xn1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(66556008)(36756003)(66946007)(31686004)(16526019)(66476007)(186003)(8936002)(31696002)(66574015)(6486002)(83380400001)(54906003)(52116002)(4326008)(6916009)(2616005)(6666004)(316002)(86362001)(2906002)(478600001)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OhTDXlIfW238fbhcpzpsb3zn+k/fGEmBfbjZrTCLEj2PUWmIPA7YopHTnbOshMkQ4/Cv023FOBFNk74F0xe31cVNP7yr0zr/i3gygbfYbB2car9EjMsuOTj4lWtWV/yulZTYgu88wsZkMFooiuWIdxRhsl8obBpyECMZBGz1bATFN4bWYDtfZlCxtVrR7tOMfjgTj63lxG5FPQFTH+ZVI+R9jXMZRDl8TSV0UyjWj4bEl2IbU0qjnv3XqqcJmhKv29rVZHirHzE4kjzGzG6q2u54Zmgj1kxkBibkw/seTTQS+90Khn79+OuMRki+Rf8URAz8hZw2XbhfLPqso+Fiph1bAGDcq9+qSPfCIglQonlNtZeem6/nXrNPrH5QJtgHqixs+qB8B7LQ5ZCH8uj5W7mj0MyqSaf+xN28P7kI9Xja4UMMr+rkUhYvNPhYmzFd8Gya+JnO7TuaDVGowp1VzafFKTeV/7i5KpwxNudVSxpjWPYyXIZbV+P0mDFWPYVWs3BNaApYPrahthbhbvSRd9LqmWLf24CYoIE4pdxfpNifkuoS/DjoPqonXQMDHyKJA3EVir2tTvadNWtv+1VdiBgo6rW+3eIugfLYmRW8kDmYUIRzWSFoYUM4BoT7IOCHcFkVheeNgIKXoQh5TlWUV5J8e1df5KUNAsxcW9E2LT653Ta5v+E8uR+e5UtgFKLd2OHdsbRBFfVZupkujnLBFQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769d7a1d-f674-4352-b97c-08d83860db93
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 10:26:32.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNXxCKADp6ve7EOEtHkHdJ+PHdOj/4C5neSl+doRQeUakNj3ji896RDNU/yUQOBd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: Roland Scheidegger <sroland@vmware.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDM6NDIgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBGcmksIDMxIEp1
bCAyMDIwIGF0IDIzOjMyLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAzMS4wNy4yMCB1bSAwNjowNSBzY2hyaWViIERhdmUgQWlybGllOgo+
Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+Cj4+PiBUaGlzIG1h
a2VzIGl0IGVhc2llciB0byBtb3ZlIHRoZXNlIHRvIGEgZHJpdmVyIGFsbG9jYXRlZCBzeXN0ZW0K
Pj4gTm8sIHNvcnJ5IHRoYXQgbG9va3MgbGlrZSBnb2luZyBpbnRvIHRoZSB3cm9uZyBkaXJlY3Rp
b24gdG8gbWUuCj4+Cj4+IEkgYWxyZWFkeSB3YW50ZWQgdG8gc3VnZ2VzdCB0byBnZXQgcmlkIG9m
IHRoZSBzaXplIGFyZ3VtZW50IGluc3RlYWQuCj4gSSdtIG5vdCBzdXJlIGhvdyBpdCBzaG91bGQg
bG9vayB0aGVuLCBJIGRvbid0IHdhbnQgdGhlIGRyaXZlciBwb2tpbmcKPiBhcm91bmQgaW5zaWRl
IHRoZSByYW5nZSBtYW5hZ2VyIGNvZGUsIHRoZSByYW5nZSBtYW5hZ2VyIHNob3VsZCBiZSBhCj4g
Z2VuZXJpYyBvYmplY3QgdGhhdCBkcml2ZXIgaW5pdHMgYW5kIGxlYXZlcyBhbG9uZSwKPgo+IEkg
ZGVmaW5pdGVseSBkb24ndCB3YW50IHRoZSBkcml2ZXIgdG8gYmUgcG9raW5nIGNhY2hpbmcgYW5k
IHNpemUKPiB2YWx1ZXMgaW50byB0aGUgbWFuIG9iamVjdHMgZm9yIGl0LCBzaW5jZSBpdCBpc24n
dCBhIGRyaXZlciBvYmplY3QuCj4KPiBEbyB5b3UgaGF2ZSBzb21lIG90aGVyIHZpZXcgb24gaG93
IHRoZSBnZW5lcmljIHJhbmdlIG1hbmFnZXIgc2hvdWxkIHdvcms/CgpUaGF0IHdhcyBub3Qgd2hh
dCBJIHdhcyB0YWxraW5nIGFib3V0LiBUYWtlIGEgbG9vayBhdCB3aGF0IHRob3NlIGZpZWxkcyAK
YXJlIHVzZWQgZm9yIDopCgoKQXMgZmFyIGFzIEkgc2VlIHRoZSBvbmx5IHVzYWdlIG9mIHRoZSBz
aXplIGlzIGluIAp0dG1fcmVzb3VyY2VfbWFuYWdlcl9kZWJ1ZygpLiBCdXQgdGhpcyBzaXplIGlz
IGFjdHVhbGx5IHRvdGFsbHkgb3BhcXVlIAp0byBUVE0sIGl0IGNvdWxkIGJlIHBhZ2VzLCBieXRl
cywgZnJpZWQgY2hpY2tlbiB3aW5ncyBvciB3aGF0ZXZlci4gSW4gCm90aGVyIHdvcmRzIGl0IHdv
dWxkIGJlIG11Y2ggYmV0dGVyIHRvIHByaW50IGl0IGluIHRoZSBkZWJ1ZyBjYWxsYmFjayBvZiAK
ZWFjaCByZXNvdXJjZSBtYW5hZ2VyLgoKClRoZSBhdmFpbGFibGVfY2FjaGluZyBpcyBjb21wbGV0
ZWx5IHN1cGVyZmx1b3VzIGFzIHdlbGwuIFRoZSBvcmlnaW5hbCAKaWRlYSB3aGF0IHRoYXQgYSBk
cml2ZXIgY291bGQgc3BlY2lmeSBtdWx0aXBsZSBwbGFjZW1lbnRzIGFzIGZsYWdzIGluIApvbmUg
ZW50cnksIGJ1dCBubyBkcml2ZXIgZXZlciB1c2VkIHRoYXQgYXMgZmFyIGFzIEkga25vdyBhbmQg
aXQgYmVjYW1lIApjb21wbGV0ZWx5IGRlcHJlY2F0ZWQgaW4gMjAxNCB3aGVuIEkgbW92ZWQgdGhl
IGxwZm4gYW5kIGZwZm4gaW50byBlYWNoIApwbGFjZS4KCgpUaGUgZGVmYXVsdF9jYWNoaW5nIGlz
IHVzZWQgaW4gdHRtX2JvX3NlbGVjdF9jYWNoaW5nKCksIGJ1dCB0aGlzIGlzIApjb21wbGV0ZSB1
dHRlcmx5IG5vbnNlbnNlLiBJdCBqdXN0IHJlc3VsdHMgaW4gbXVsdGlwbGUgcG9zc2libGUgY2Fj
aGUgCmJlaGF2aW9ycyBiZWluZyBzZWxlY3RlZCwgd2hpY2ggYXJlIHRoZW4gZm9ydHVuYXRlbHkg
aWdub3JlZCBieSAKdHRtX3R0X3NldF9wbGFjZW1lbnRfY2FjaGluZyA6KQoKClRvIGJlIGhvbmVz
dCBJIHRoaW5rIGp1c3QgcmVtb3ZpbmcgdGhvc2UgcGFyYW1ldGVycyBhbmQgdGhlIGFzc29jaWF0
ZWQgCmNhY2hpbmcgZmxhZ3MgYWxsIHRvZ2V0aGVyIGlzIHRoZSBuZXh0IGxvZ2ljYWwgc3RlcC4K
ClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBEYXZlLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
