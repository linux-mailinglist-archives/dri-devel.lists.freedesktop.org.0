Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FB26DEB1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B326EC3E;
	Thu, 17 Sep 2020 14:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE466EC3E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXpeKOKVZ7bQukCZKj+YAFWI8qGrAwLHuHNWSY/hyzqrM7p3YzzHQqXuJhps1xMaFQ8Lrbi//n4S5EUm9vTGsGOG7FtPYT7TP6HSvoGjo+TMWY75LxHFtHYLnuciXAQ+V9wReoP7eT2rsAqDTYc5a3tzmDmmMDZDe3XjSTj3iyZpnP16bLuxJlGajUsBQOSOEQhuTw0Uxf6ZHxt0r0NWAo2SmTK3KZs9IDI0XY1v8zH2rz+ZLx/RDsbxIoTHGxqNuSzkVme+9kwu4PRvs+gkLqYLd7u08yTJKDJXaHz2h1RISjjXtNIz+xeOxCp5VDE9yvT9oX5PHoebIVWmR+6OFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Otv1qgiBYtCP12kbT25zJphm5fHlafeAcT/ZbJff7BY=;
 b=DTxM7Ahi30eK75tNXh/7tmNBP5v/tCvoUrvZXiHuFMtk6CYewxUfNePoqsNkDMJ7vmctJap+q+kw7ouV4zZiVE/ELAyIk6o4qggo36KU+4PwSiqnDjOh4Kvi2oR7h5H6dceN50U9bVPinNA5nNWyUwMoCBVNOU/XZeDs4UEqsPk8FjS1f8wI0IFaf53ia9TmUTrWS3JfQJlPxbBCdMYp3HJ252iHUrYrYrixdv2bNuhs6pVWrwR3mrcbV4VhPIzk5oICZ10LojqKIrAOv8/hDjm3L7st9ZyWM5QtPU/FxZVd6bQoPGHAWZTXCYFaFdIn9I6kosi3bYwmj3R5FPz5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Otv1qgiBYtCP12kbT25zJphm5fHlafeAcT/ZbJff7BY=;
 b=M0qvpoRObN67hQelQXVSmGOwsALUr4/6HguOk6kTNNpAGldV3vRxDAn8qDk1bB1vJnFxfZ4Q9TGcW74Sd3ZeUX0YuqUBttmH60noBybEWX2P3lOn6vnC1sIElsubhCRmmkiSU+jl+twVakUkvCDXzjkP2yVB92VyzrJfNWHaWQ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 17 Sep
 2020 14:49:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 14:49:52 +0000
Subject: Re: Why can't ttm_tt_swapout() handle uncached or WC BOs?
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
 <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9181f6be-0da1-2f43-2014-7c3195147194@amd.com>
Date: Thu, 17 Sep 2020 16:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0048.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Thu, 17 Sep 2020 14:49:50 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce395449-3ba7-47fb-b7cd-08d85b18eec1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125677475846D4A47C0BC10833E0@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhkeovoCcBhLhGtNlLR+4mzjN1ZwGsoVsBVOV7/yriOn2cuwVFLcy9ODXmBZVZKoDIi5yUxylAoeX6YkPFP3eyI73KdEo2LZNur1ds2AkMR64ouflg/qoAwDJ9qCCkADMxTvcqUUYdbGQEV7w1jBKOON7IFmeJggs/Cq0B/0suXgLJCUvcvt2iujDiU5HXfaC8fqv1ZGG/oSYSMVfeE7uUDuiujBtAYTqmOqJfLBLBKZRBleTp/tltB6FzL0//1AOSg3pnu7ZpsAK4gq9lXEOub1nwasj3SL/HcLewA53iusbGBarLDpkMF+wJSMlRFoDNmCcGPsPcLzyEp7Efqm8h/jWtdmfjz01IQqlIXQXaCvU6gd4XoI3fYId+bu1Zyn8P4l2oeYVzJsR9Y5ENkHdgc03zelKryYogde4Q2uAZUYqqE4ACPVF6b269uFViQu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(186003)(16526019)(2616005)(316002)(110136005)(86362001)(66574015)(31696002)(53546011)(6486002)(2906002)(31686004)(5660300002)(6666004)(52116002)(8676002)(8936002)(36756003)(66556008)(4326008)(66476007)(66946007)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: SMj4FZT6Ftr7IEEy/l4wYBNjdjU7Dsu14QuiTKJzPgCoPq1waMgH7vOad1d1RN658i8HpGtcnG0KAe9tvp+8LGmMGGfBLYm1aG4Glq9cw/iFABqnYmC3xoy78/gs6NP/+Wm8KrbOy1caXWHKu/tJrOdotLabOF36z91W2lWJGAt/1lWs6y8mkogkRN6NdOqfcIxMgsUfc6t3qV4rDnWptGTEe3C+/WzK1N2GhIL8BBhTjQnVC4u9PVSwbbmu2S0fbgva+/WiYKGqvcIvFQL3Smq5pByBXbGjqHD6/G5CwuXMomw9LEyP4xonJ3iO/FWje6x9BXuBQp5v9KXAMf8uwIogKoca6Vr1R656GWQCT+MrsU/axaZRXWwYK9D+FaSjIn6VLMeuQ8qtvkexndjnezy2u0x7nGXINn8Jx6DxDIWmralSUqukDuWX2GjGZh4xIXIccijEKBr3GjRrJYat5Qz96Oa9vnijQPeoIgYfloj5reMBxZwdouL+VuK7J43iaO2SjVvo0DgIEAOXzjkOSS+zKD54LF2gb8ENjC+VlInwgJjEgyAK1dOz48WHD2xdJncm+vwY15Ln/2t6J8bz9C/tKOCsa0bSjZ3dhsqRgG1GDj9mqMzBkGjq9d6wDoROBeYsKNmUIGTs3/FVwkCEgdaK99Ovj4dZl6An8dI4v6SZ+9sSSQZvgJH7sNybm3yY51Mabgu+/xb/8mkbh+6Ulw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce395449-3ba7-47fb-b7cd-08d85b18eec1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 14:49:51.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94XxyO+ad7VR4yogeOSMp0b2FItTzq7AdIa4lw6UfpMwRKd1ss04a7i6euYF5A6T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMTY6NDQgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTA5
LTE3IDI6MjAgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gSGkgZ3V5cywKPj4KPj4g
TWljaGVsIG9uY2Ugc3VibWl0dGVkIGEgcGF0Y2ggdG8gZml4IHRyaWdnZXJpbmcgdGhpcyBCVUdf
T04gaW4gCj4+IHR0bV90dF9zd2Fwb3V0KCk6Cj4+Cj4+PiBCVUdfT04odHRtLT5jYWNoaW5nX3N0
YXRlICE9IHR0X2NhY2hlZCk7Cj4+Cj4+IE5vdyBteSBxdWVzdGlvbiBpcyBkb2VzIGFueWJvZHkg
a25vdyB3aHkgd2UgaGF2ZSB0aGF0IGluIHRoZSBmaXJzdCAKPj4gcGxhY2U/Cj4+Cj4+IFRoZSBv
bmx5IHByb2JsZW1hdGljIHRoaW5nIEkgY2FuIHNlZSBpcyBjYWxsaW5nIGNvcHlfaGlnaHBhZ2Uo
KSBhbmQgCj4+IHRoYXQgb25lIGlzIGp1c3QgZG9pbmcgYSBrbWFwX2F0b21pYygpL2t1bm1hcF9h
dG9taWMoKSBvbiB0aGUgc291cmNlIAo+PiBhbmQgZGVzdGluYXRpb24uCj4+Cj4+IEkgY2FuJ3Qg
c2VlIHdoeSBpdCBzaG91bGQgYmUgcHJvYmxlbWF0aWMgZm9yIHRoaXMgdGVtcG9yYXJ5IG1hcHBp
bmcgCj4+IHRvIGJlIGNhY2hlZCBpbnN0ZWFkIG9mIHVuY2FjaGVkIG9yIFdDPwo+Pgo+PiBEb2Vz
IGFueWJvZHkgaGFzIGFueSBpZGVhPwo+Cj4gT25lIHRoaW5nIGlzIHRoYXQgQUZBSUsgc29tZSAo
QVJNPykgQ1BVcyBjYW4gZ2V0IHZlcnkgdXBzZXQgd2hlbiAKPiB0aGVyZSdzIGJvdGggYSBjYWNo
ZWQgYW5kIHVuY2FjaGVhYmxlIG1hcHBpbmcgZm9yIHRoZSBzYW1lIHBoeXNpY2FsIHBhZ2UuCgpH
b29kIHBvaW50LCBidXQgSSBhbHJlYWR5IGNvbnNpZGVyZWQgdGhpcy4KCklmIHRoZXJlIGlzIGFu
b3RoZXIgbWFwcGluZyBmb3IgdGhhdCBwYWdlIGxlZnQgd2UgYXJlIGNvbXBsZXRlbHkgYnVzdGVk
IAphbnl3YXkgc2luY2Ugd2UgYXJlIGN1cnJlbnRseSBjaGFuZ2luZyB0aGUgdW5kZXJseWluZyBz
dG9yYWdlLgoKSW4gb3RoZXIgd29yZHMgbm9ib2R5IGVsc2Ugc2hvdWxkIGhhdmUgYSBtYXBwaW5n
IGJlY2F1c2Ugd2UgYXJlIGFib3V0IHRvIApjb3B5IGFuZCB0aGVuIGZyZWUgdXAgdGhlIG1lbW9y
eS4KCkFueSBvdGhlciBpZGVhPyBJdCBpcyB0aGUgb25seSBwbGFjZSB3aGVyZSB3ZSBhY3R1YWxs
eSBoYXZlIHRvIGNoYW5nZSAKdGhlIGNhY2hpbmcgYXR0cmlidXRlcy4KCkNocmlzdGlhbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
