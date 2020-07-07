Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB67216E1C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 15:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877889F5B;
	Tue,  7 Jul 2020 13:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F25789F5B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 13:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg7y95ClQsvktnVvAXsMGsJY65FXTIwBLGVMAlIcwk22e7k55rS6c5EKG7qNb9v6od5Nxdj+y1TouDhuOIK+nn708iE2XRnjt3k1+C5H2wHw7bYoe0kjt/uih04YzMZKdFiQSD2ZhrpmKrlN1DeCjOoS93pOd2FZ0SD1pRwUvwZqMQBSWbzKlu6FYjz+Lp4MT2EcWjQhEAYGgsTWg4oCNDUwwcnnyw7ODaZXVARCAcUdivqZ0vhMq9XI/Gk/Josw9efYqdBWNSQ8siaRaqRckTJq9XwKnsrDRf+gHnQsjM0LI3Ss8hGSyjuXiYgUaGAGkQUab22xl/fgFbTaweFsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72O8c/+XKx7SajV4NxaROZFL0zA8zMME2/b4tOpA19U=;
 b=I9wkNZ1r3Et3oyI4+TTyV3A2zKCIYeapFhThbp9hDXzcVJpZXdAcRXyXSXZDD4Vy9zCW9krKxARldrxKIkoLudQZRGRQ6O0EBgwtLqlt6/kldnLuzYRqdSDT30bRttPuvd9SeZuW98VVUhPAonUclN0RflgIoGjKTN0xohxBMGFpsmZrRMWIShWHHAy8OZJ2Oytyqvxb6Kbr9Uc9TIrPi3Hy4UgscYq2YXGruJbsdbaU62qPNQoPM+5xVQNzSJQDS52kwNrQq6tZJzzn8tNQJ8LiWPjYt53vSiIvkZrqeZ/onPv17iSMkl6+1V8meGjICtFpBJWutahTV2Ve6iW5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72O8c/+XKx7SajV4NxaROZFL0zA8zMME2/b4tOpA19U=;
 b=FijKVlKVNz73DjH/dz5wgVqWWKPJ/lSFI/bh26NnVPA4N85lZfJuk0Mt+4Jhf8ZRexaz9SSEHxaLgJdqRYuUr5XNDNTSMCcD7r4eve7Ojfxo5q6IF9Lccm2Ul8NyxRbgvOP+BZvH+inMeJShd6aRCsl0c5t0IRaIeHz/hzVf3hw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Tue, 7 Jul
 2020 13:55:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.021; Tue, 7 Jul 2020
 13:55:47 +0000
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Lepton Wu <ytht.net@gmail.com>
References: <20200707042100.2550260-1-ytht.net@gmail.com>
 <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
 <2d933121-4067-e4ce-42d7-ad8a7a0ea274@amd.com>
 <159412007969.16814.9730037350128686915@build.alporthouse.com>
 <a0f8e299-da40-ddc9-3c97-a348a56d3408@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0feb1cee-ca75-938e-9752-c03eec18346d@amd.com>
Date: Tue, 7 Jul 2020 15:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <a0f8e299-da40-ddc9-3c97-a348a56d3408@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0080.eurprd03.prod.outlook.com
 (2603:10a6:208:69::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0080.eurprd03.prod.outlook.com (2603:10a6:208:69::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20 via Frontend Transport; Tue, 7 Jul 2020 13:55:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d7e7a44-f067-4838-5d24-08d8227d7370
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-Microsoft-Antispam-PRVS: <MN2PR12MB431842FF33B7888A26BA46A783660@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: njLrQEwR9pzf4x9GGsXYAjE8Zsq7xzIEzcB8pme1Okbrn8S82LWM2r6m7TmSg+JaYZn+wUvLIFXWor0hKGR7ugM4xJ0DwnQ3eUqsVn/NzRnEiPteUMti+Je908IQZUmECMBK4m7JzjHXIla70oyrZWUM4slYFMlXBiUEDYjZSebyueeG8lB2dyAH2UmwcpZtMPR1k/NjBj06UaPXLuap5bzIQW0tWsv28Fw8Ihnrny7Z+8zHNeVRSMVOgc+xf8YBlEQhJAZ2RQszezO5t5od8L5Ywalr9u9RoDcpa9X0BckeBhIM7R6qgyBE/yDAf2S12JUtPFnNxZZK2v14rbgurWw1q0YCK4iiRLB0Bg6TmXfIRLBuW0ifGfq7kwHVB+YdDRAyyrHpBUk0vICcOQQgEMrpNftuoIX1VMsIF+3mZZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(8936002)(66574015)(2616005)(53546011)(66946007)(66476007)(52116002)(36756003)(66556008)(110136005)(6486002)(83380400001)(6666004)(45080400002)(4326008)(316002)(478600001)(86362001)(8676002)(5660300002)(966005)(31696002)(31686004)(16526019)(186003)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4ZKCqHM8sR6uymJbXSUQcCrqcBtUudLn10QZcVC7GM4c0aPGyZFtN01FBxPCWWeg+7hUrz1rYUAkn9qgeBDZ+eMD9Krm6uNGiNYx5JJstgqkhJIdFqifbDf6HUWblQD1eQk47yGkWDJ8znvbZtkS+6C9M15WNnu5ka1QlFJRJ52/zspqbbLaF7q6X7/K0izU6cdWWN83lbMjReEJ3jJQTxmJ2d3bXi6UO0XBYjqB54zEnBfQNpbH12z5SNnZPZMzxFcRaKzdqwWJPEJrzhXbhsDlrK+cTxFVKqA8+cgDb1uC+7Q/UZYEc/pUtXQL6EZKhbVRrAb2bQ+bCBrnEczytmRG9zeFr+RohSFiUqJODvlGWTHuQmveio1GqpTBL9hqZvftJ0OHWQDd1rFGBbQvgM/JlK1JzwVVq/Cz5NzFXsiNskHZa+lluClZGqOMcyaNpl8tTAuKaYPqdNbf9m7Ve5XMm+A5870qGTDZ4VzBfFrBCf0wXijXfcGYeAfRASTaJ+42C4pBBMJ+GEwYz/6a1VJJwjO9eav0kqAy+MKycZv7uImz/6MWK+wdqrt4/N0K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7e7a44-f067-4838-5d24-08d8227d7370
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 13:55:47.8323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFq7Qk9EIiiSImjczIA1RU+vKNBPxXjHAseNmSw2c1rZxY9nZges1PhjtOxm1E01
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDcuMjAgdW0gMTQ6MDUgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
Cj4gT24gNy83LzIwIDE6MDcgUE0sIENocmlzIFdpbHNvbiB3cm90ZToKPj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDIwLTA3LTA3IDExOjU4OjI2KQo+Pj4gQW0gMDcuMDcuMjAgdW0gMTA6
NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+IE9uIFR1ZSwgSnVsIDcsIDIwMjAgYXQgOToy
NyBBTSBMZXB0b24gV3UgPHl0aHQubmV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+IEZvciBwYWdl
cyB3aGljaCBhcmUgYWxsb2NhdGVkIGluIHR0bSB3aXRoIHRyYW5zcGFyZW50IGh1Z2UgcGFnZXMs
Cj4+Pj4+IHRhaWwgcGFnZXMgaGF2ZSB6ZXJvIGFzIHJlZmVyZW5jZSBjb3VudC4gVGhlIGN1cnJl
bnQgdmdlbSBjb2RlIHVzZQo+Pj4+PiBnZXRfcGFnZSBvbiB0aGVtIGFuZCBpdCB3aWxsIHRyaWdn
ZXIgQlVHIHdoZW4gcmVsZWFzZV9wYWdlcyBnZXQgCj4+Pj4+IGNhbGxlZAo+Pj4+PiBvbiB0aG9z
ZSBwYWdlcyBsYXRlci4KPj4+Pj4KPj4+Pj4gSGVyZSBJIGF0dGFjaCB0aGUgbWluaW1hbCBjb2Rl
IHRvIHRyaWdnZXIgdGhpcyBidWcgb24gYSBxZW11IFZNIHdoaWNoCj4+Pj4+IGVuYWJsZXMgdmly
dGlvIGdwdSAoY2FyZDEpIGFuZCB2Z2VtIChjYXJkMCkuIEJUVywgc2luY2UgdGhlIHVwc3RyZWFt
Cj4+Pj4+IHZpcnRpbyBncHUgaGFzIGNoYW5nZWQgdG8gdXNlIGRybSBnZW0gYW5kIG1vdmVkIGF3
YXkgZnJvbSB0dG0uIFNvIHdlCj4+Pj4+IGhhdmUgdG8gdXNlIGFuIG9sZCBrZXJuZWwgbGlrZSA1
LjQgdG8gcmVwcm9kdWNlIGl0LiBCdXQgSSBndWVzcwo+Pj4+PiBzYW1lIHRoaW5nIGNvdWxkIGhh
cHBlbiBmb3IgYSByZWFsIEdQVSBpZiB0aGUgcmVhbCBHUFUgdXNlIHNpbWlsYXIgCj4+Pj4+IGNv
ZGUKPj4+Pj4gcGF0aCB0byBhbGxvY2F0ZSBwYWdlcyBmcm9tIHR0bS4gSSBhbSBub3Qgc3VyZSBh
Ym91dCB0d28gdGhpbmdzOiAKPj4+Pj4gZmlyc3QsIGRvIHdlCj4+Pj4+IG5lZWQgdG8gZml4IHRo
aXM/IHdpbGwgYSByZWFsIEdQVSBoaXQgdGhpcyBjb2RlIHBhdGg/IFNlY29uZCwgCj4+Pj4+IHN1
cHBvc2UgdGhpcwo+Pj4+PiBuZWVkIHRvIGJlIGZpeGVkLCBzaG91bGQgdGhpcyBiZSBmaXhlZCBp
biB0dG0gc2lkZSBvciB2Z2VtIHNpZGU/wqAgCj4+Pj4+IElmIHdlIHJlbW92ZQo+Pj4+PiAiaHVn
ZV9mbGFncyAmPSB+X19HRlBfQ09NUCIgZnJvbSB0dG1fZ2V0X3BhZ2VzLCB0aGVuIGdldF9wYWdl
IGluIAo+Pj4+PiB2Z2VtIHdvcmtzCj4+Pj4+IGZpbmUuIEJ1dCBpdCdzIHRoZXJlIGZvciBmaXgg
YW5vdGhlciBidWc6Cj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmJ1Z3MuZnJlZWRlc2t0b3Aub3JnJTJGc2hvd19i
dWcuY2dpJTNGaWQlM0QxMDMxMzgmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWcl
NDBhbWQuY29tJTdDNmM0MTcwNTU5YzBhNGQwZDVmNTcwOGQ4MjI2ZTBmOTclN0MzZGQ4OTYxZmU0
ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3Mjk3MjAzNDA0NzYxODQ2JmFtcDtz
ZGF0YT1xWEJRQkt2Qk03enZpNlBJa2NBUGZCam1PQzhVckttam5PMDNoV0t6TkhVJTNEJmFtcDty
ZXNlcnZlZD0wIAo+Pj4+Pgo+Pj4+PiBJdCBjb3VsZCBhbHNvIGJlICJmaXhlZCIgd2l0aCB0aGlz
IHBhdGNoLiBCdXQgSSBhbSByZWFsbHkgbm90IHN1cmUgCj4+Pj4+IGlmIHRoaXMgaXMKPj4+Pj4g
dGhlIHdheSB0byBnby4KPj4+PiBGb3IgaW1wb3J0ZWQgZG1hLWJ1ZiBvYmplY3RzLCB2Z2VtIHNo
b3VsZCBub3QgaGFuZGxlIHRoaXMgaXRzZWxmLCBidXQKPj4+PiBmb3J3YXJkIHRvIHRoZSBleHBv
cnRlciB0aHJvdWdoIHRoZSBkbWFfYnVmX21tYXAgc3R1ZmYuIFdlIGhhdmUKPj4+PiBoZWxwZXJz
IGZvciB0aGlzIGFsbCBub3csIHByb2JhYmx5IGp1c3Qgbm90IHdpcmVkIHVwIGNvcnJlY3RseS4g
VHJ5aW5nCj4+Pj4gdG8gZW5zdXJlIHRoYXQgYWxsIGNvbWJpbmF0aW9ucyBvZiBtbWFwIGNvZGUg
YWNyb3NzIGFsbCBkcml2ZXJzIHdvcmsKPj4+PiB0aGUgc2FtZSBkb2Vzbid0IHdvcmsuCj4+PiBZ
ZXMsIERhbmllbCBpcyByaWdodCB3aGF0IHZnZW0gZG9lcyBoZXJlIGlzIGZ1bmRhbWVudGFsbHkg
YnJva2VuIGluIAo+Pj4gbWFueQo+Pj4gd2F5cy4KPj4+Cj4+PiBGaXJzdCBvZiBhbGwgbm9ib2R5
IHNob3VsZCBldmVyIGNhbGwgZ2V0X3BhZ2UoKSBvbiB0aGUgcGFnZXMgVFRNIGhhcwo+Pj4gYWxs
b2NhdGVkLiBUaG9zZSBwYWdlcyBjb21lIG91dCBvZiBhIGJsb2NrIGJveCBhbmQgc2hvdWxkIG5v
dCBiZSAKPj4+IHRvdWNoZWQKPj4+IGJ5IGFueWJvZHkuCj4+IEl0IGRvZXNuJ3QuIEl0J3Mgb25s
eSB1c2VkIG9uIHRoZSBwYWdlcyB2Z2VtIGFsbG9jYXRlcyAoZnJvbSAKPj4gc2htZW1mcykuIFNv
Cj4+IEknbSByZWFsbHkgY29uZnVzZWQgYXMgdG8gaG93IHR0bSBnZXRzIGludm9sdmVkIGhlcmUu
Cj4+IC1DaHJpcwo+Cj4gU291bmRzIGxpa2UgdmdlbSBpcyBhbGxvd2luZyBtbWFwIG9mIGltcG9y
dGVkIGRtYS1idWZzPwoKWWVhaCBhZ3JlZSwgdGhpcyBpcyBtb3N0IGxpa2VseSB0aGUgdW5kZXJs
eWluZyBwcm9ibGVtIGFuZCBzaG91bGQgYmUgCmZpeGVkIGluc3RlYWQuCgpDaHJpc3RpYW4uCgo+
Cj4gL1Rob21hcwo+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJG
bGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWcl
NDBhbWQuY29tJTdDNmM0MTcwNTU5YzBhNGQwZDVmNTcwOGQ4MjI2ZTBmOTclN0MzZGQ4OTYxZmU0
ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3Mjk3MjAzNDA0NzYxODQ2JmFtcDtz
ZGF0YT1OeTRzZGlibzlvOCUyRjhVcXhkUDc0SGFPWFFqb0trbWQlMkZyUkFQSHN6cjNyayUzRCZh
bXA7cmVzZXJ2ZWQ9MCAKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
