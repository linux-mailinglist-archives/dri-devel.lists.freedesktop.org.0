Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F42228178
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFB86E265;
	Tue, 21 Jul 2020 13:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC66E265;
 Tue, 21 Jul 2020 13:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrZ3lIT9V0thjVmeLeA2jsEuUOlv0qye4upjsur2Pyt6i3JUWInQJrnPQ009x1IXMeJL/KQm03w/xLj7Gf9xzwZan+eqv48hWoS9NnwInVCoVsQYefDMyYtQWJicSfUi1/X0GMSjrkYgADqSxoycgKOYQhkko1YhDklIKN6bfSudHhwehZ/Md+BKMTGmb22FU0rT470RZYum3tuFrmEKt8LoH1bPjSWU17SQWtVQ4k7zhsI0ftaXhMJelJ656ly1chUUkc9M7fIvYfvQdVPLsniBywha3qhC2dgdp7PetofI2S15bVwTK3N2jgrzplyhHbc3VNwSci5N1/4IdJq50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1eSOFrKHl+ZoCrLbZQd20Pqo9TlM1qpLLV8LiD0BMg=;
 b=eYTbFRXIf78qcPCADEzTZXMqRiROgXU3PElfvJd0RC3Vkl5m6AHqOnHiUMEgW5ENQ073SNY6S2hWIj3/mDxQ3qHJMvHiI5+0HCVOusqgUhW7Jn0GAPuYCDvOk2b50RrZrnzMy1aKiSVDUbBZ3qIQO1isAJ9el9fFlIO/nhGdD+xQbga+WEH61kJuDPA4rkM1mnToj/dQSn5UxIAy14tpyPYJletzluGGqHU4NXlrPclD+HR6sbwQ4Uy3MapJs8AWQgG+02Qjc0q9RLxsSqpSE2gFNePI3stxLys1UjkkH/hpxjd7mkDQlCtYZ9x/4yGV4lVy23Iw2t6u28/N0sZEbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1eSOFrKHl+ZoCrLbZQd20Pqo9TlM1qpLLV8LiD0BMg=;
 b=z9NW9roCuoW1oYSl/GpWfxRhdlBHu9uPzqvIhS3xWcN4/bY+7wt04NNu548vvB0eSCZhlyknMjuVL1y7X7DEARJZxm34lBfHQFyWOnMc6k2JcSJAo9/skW5IsWAbaOGVEXJ2nFWccifjyeps6n8hnsf/J1MYpc/N/pNOFWxWFxo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2773.namprd12.prod.outlook.com (2603:10b6:a03:72::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 13:59:18 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::bc19:eb90:1151:fc7a]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::bc19:eb90:1151:fc7a%3]) with mapi id 15.20.3216.020; Tue, 21 Jul 2020
 13:59:18 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <2ca2c004-1e11-87f5-4bd8-761e1b44d21f@amd.com>
 <74727f17-b3a5-ca12-6db6-e47543797b72@shipmail.org>
 <CAKMK7uFfMi5M5EkCeG6=tjuDANH4=gDLnFpxCYU-E-xyrxwYUg@mail.gmail.com>
 <ae4e4188-39e6-ec41-c11d-91e9211b4d3a@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f8f73b9f-ce8d-ea02-7caa-d50b75b72809@amd.com>
Date: Tue, 21 Jul 2020 15:59:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <ae4e4188-39e6-ec41-c11d-91e9211b4d3a@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:208:55::42) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0137.eurprd04.prod.outlook.com (2603:10a6:208:55::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Tue, 21 Jul 2020 13:59:14 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3347e7f9-b40c-406a-8fb5-08d82d7e427d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB27734EB7C6155426A96AC46883780@BYAPR12MB2773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l14VUsFKTFKWT74xk6GoxHgXX898LKQi8MfCTMcCFN0k5uEeh8edSKb/4fElkkc0zNn94jA9ISjOvGo0XgyW5XelmJgx3SJrxK8mM7o2uWctxQGtWtKRQzu8iVwI+ZMOwto9l5vynFhllT5V7YA30XFf5Mtq/Sx39zXIG6GFXVekvauCiUH+paIay4yZhmdIWmUMgDtwYZj/wi+4zN91AAC0PmfGZDSDT/8yMPTNvJjML1t9buA/kXR726nu/foRd3n5NRmwB4uQLN3+Sxr4POjQrE2UWKbi2feRj0xR3Iev/Q2dG7110Pt62s82Qfc1D7aH2TzNcwfCJz2n/ogxc1UuKmQYptvc2hBmeWvHTcXyQEuDqi4oBhoOrzkbX12ARwCI+4ZRsgrr7r+MDD1CgDKbAXxP3SdnQmpDHf9BEv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(6666004)(53546011)(186003)(2906002)(5660300002)(478600001)(16526019)(6486002)(966005)(4326008)(110136005)(316002)(54906003)(66574015)(31696002)(2616005)(8936002)(7416002)(52116002)(8676002)(66556008)(36756003)(45080400002)(86362001)(31686004)(83380400001)(66476007)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: R9h9Cz9RrQMijEwUA8iSn5Gm2Lw/lP2HTrlD5UFcraikwTq4yL6ZmwOdCkUumPNvynvc+ZKwrDohMCMaEV+mr3zRnenXjIfiuLmcs6VVR25W/mK4TCVnsUDjz5/MF938ffuMdo/+sNpkVKi3ZiNwcb/Z3CXVQ7nk+J21cbtJ6h2W95Zu6kvt1AGug5qclWKHqPnNto2Yzjpnv6ZAa5SOaIq43Nqdn3efMi5H5i83aKx0DnxSusfwQWk/EVY3CaZZjzqPGaAigE30zLmg0uKuekJHz71HaDpX/5M+QdLjrgyIenlVnekSoIcj4ps3T6g3TruoWeq9Gh5bn95UYDgZ0EcwC91w19Hzl18t5IuJJcgRW5OvwdpgAwu4Jux7e7gYd5vFrT01kMbYmISUupfYmW+bsyoHAQbRroThVIeRpflMZgXbmpS+xibQ9gtUdoO9mxCrHWRTfOSG7LYcamJP13+yfLCE1kZDHWF1CWneApg3tZ+KuAYGPydT/vWLKUFFP1qBfRDN5HI/BOTimEoT6XtYoBb8ZKXpm9IoT5rnouPn0vyMjCWcszdkPa17OKkc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3347e7f9-b40c-406a-8fb5-08d82d7e427d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 13:59:18.1836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoS/lQrY0iANUX1xcFX7Vi6ZTlrLiIpdprkt4yQipAm6KvDT902qsDDF8R4ulGj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2773
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
Cc: Daniel Stone <daniels@collabora.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDcuMjAgdW0gMTI6NDcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
Cj4gT24gNy8yMS8yMCAxMTo1MCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24gVHVlLCBK
dWwgMjEsIDIwMjAgYXQgMTE6MzggQU0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+PiA8dGhv
bWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gT24gNy8yMS8yMCAxMDo1NSBBTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAyMS4wNy4yMCB1bSAxMDo0NyBzY2hyaWVi
IFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6Cj4+Pj4+IE9uIDcvMjEvMjAgOTo0NSBBTSwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+IEFtIDIxLjA3LjIwIHVtIDA5OjQxIHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPj4+Pj4+PiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCAwMToxNToxN1BN
ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4+Pj4+Pj4gd3JvdGU6Cj4+Pj4+Pj4+
IEhpLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiA3LzkvMjAgMjozMyBQTSwgRGFuaWVsIFZldHRlciB3
cm90ZToKPj4+Pj4+Pj4+IENvbWVzIHVwIGV2ZXJ5IGZldyB5ZWFycywgZ2V0cyBzb21ld2hhdCB0
ZWRpb3VzIHRvIGRpc2N1c3MsIGxldCdzCj4+Pj4+Pj4+PiB3cml0ZSB0aGlzIGRvd24gb25jZSBh
bmQgZm9yIGFsbC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBXaGF0IEknbSBub3Qgc3VyZSBhYm91dCBp
cyB3aGV0aGVyIHRoZSB0ZXh0IHNob3VsZCBiZSBtb3JlCj4+Pj4+Pj4+PiBleHBsaWNpdCBpbgo+
Pj4+Pj4+Pj4gZmxhdCBvdXQgbWFuZGF0aW5nIHRoZSBhbWRrZmQgZXZpY3Rpb24gZmVuY2VzIGZv
ciBsb25nIHJ1bm5pbmcKPj4+Pj4+Pj4+IGNvbXB1dGUKPj4+Pj4+Pj4+IHdvcmtsb2FkcyBvciB3
b3JrbG9hZHMgd2hlcmUgdXNlcnNwYWNlIGZlbmNpbmcgaXMgYWxsb3dlZC4KPj4+Pj4+Pj4gQWx0
aG91Z2ggKGluIG15IGh1bWJsZSBvcGluaW9uKSBpdCBtaWdodCBiZSBwb3NzaWJsZSB0byBjb21w
bGV0ZWx5Cj4+Pj4+Pj4+IHVudGFuZ2xlCj4+Pj4+Pj4+IGtlcm5lbC1pbnRyb2R1Y2VkIGZlbmNl
cyBmb3IgcmVzb3VyY2UgbWFuYWdlbWVudCBhbmQgZG1hLWZlbmNlcwo+Pj4+Pj4+PiB1c2VkIGZv
cgo+Pj4+Pj4+PiBjb21wbGV0aW9uLSBhbmQgZGVwZW5kZW5jeSB0cmFja2luZyBhbmQgbGlmdCBh
IGxvdCBvZiByZXN0cmljdGlvbnMKPj4+Pj4+Pj4gZm9yIHRoZQo+Pj4+Pj4+PiBkbWEtZmVuY2Vz
LCBpbmNsdWRpbmcgcHJvaGliaXRpbmcgaW5maW5pdGUgb25lcywgSSB0aGluayB0aGlzCj4+Pj4+
Pj4+IG1ha2VzIHNlbnNlCj4+Pj4+Pj4+IGRlc2NyaWJpbmcgdGhlIGN1cnJlbnQgc3RhdGUuCj4+
Pj4+Pj4gWWVhaCBJIHRoaW5rIGEgZnV0dXJlIHBhdGNoIG5lZWRzIHRvIHR5cGUgdXAgaG93IHdl
IHdhbnQgdG8gbWFrZSAKPj4+Pj4+PiB0aGF0Cj4+Pj4+Pj4gaGFwcGVuIChmb3Igc29tZSBjcm9z
cyBkcml2ZXIgY29uc2lzdGVuY3kpIGFuZCB3aGF0IG5lZWRzIHRvIGJlCj4+Pj4+Pj4gY29uc2lk
ZXJlZC4gU29tZSBvZiB0aGUgbmVjZXNzYXJ5IHBhcnRzIGFyZSBhbHJlYWR5IHRoZXJlICh3aXRo
Cj4+Pj4+Pj4gbGlrZSB0aGUKPj4+Pj4+PiBwcmVlbXB0aW9uIGZlbmNlcyBhbWRrZmQgaGFzIGFz
IGFuIGV4YW1wbGUpLCBidXQgSSB0aGluayBzb21lIGNsZWFyCj4+Pj4+Pj4gZG9jcwo+Pj4+Pj4+
IG9uIHdoYXQncyByZXF1aXJlZCBmcm9tIGJvdGggaHcsIGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB3
b3VsZCBiZSAKPj4+Pj4+PiByZWFsbHkKPj4+Pj4+PiBnb29kLgo+Pj4+Pj4gSSdtIGN1cnJlbnRs
eSB3cml0aW5nIHRoYXQgdXAsIGJ1dCBwcm9iYWJseSBzdGlsbCBuZWVkIGEgZmV3IGRheXMKPj4+
Pj4+IGZvciB0aGlzLgo+Pj4+PiBHcmVhdCEgSSBwdXQgZG93biBzb21lICh2ZXJ5KSBpbml0aWFs
IHRob3VnaHRzIGEgY291cGxlIG9mIHdlZWtzIGFnbwo+Pj4+PiBidWlsZGluZyBvbiBldmljdGlv
biBmZW5jZXMgZm9yIHZhcmlvdXMgaGFyZHdhcmUgY29tcGxleGl0eSBsZXZlbHMgCj4+Pj4+IGhl
cmU6Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3RvcC5vcmclMkZ0aG9tYXNo
JTJGZG9jcyUyRi0lMkZibG9iJTJGbWFzdGVyJTJGVW50YW5nbGluZyUyNTIwZG1hLWZlbmNlJTI1
MjBhbmQlMjUyMG1lbW9yeSUyNTIwYWxsb2NhdGlvbi5vZHQmYW1wO2RhdGE9MDIlN0MwMSU3Q2No
cmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMGFmMzk0MjJjNGU3NDRhOTMwM2IwOGQ4MmQ2Mzdk
NjIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MzA5MjUy
NjY1MzI2MjAxJmFtcDtzZGF0YT1aazNMVlg3YmJNcGZBTXNxJTJGczJqeUEwcHVSUU5janpsaUpT
JTJCQzd1RExNbyUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Pj4KPj4+Pj4KPj4+PiBJIGRvbid0IHRo
aW5rIHRoYXQgdGhpcyB3aWxsIGV2ZXIgYmUgcG9zc2libGUuCj4+Pj4KPj4+PiBTZWUgdGhhdCBE
YW5pZWwgZGVzY3JpYmVzIGluIGhpcyB0ZXh0IGlzIHRoYXQgaW5kZWZpbml0ZSBmZW5jZXMgYXJl
IGEKPj4+PiBiYWQgaWRlYSBmb3IgbWVtb3J5IG1hbmFnZW1lbnQsIGFuZCBJIHRoaW5rIHRoYXQg
dGhpcyBpcyBhIGZpeGVkIGZhY3QuCj4+Pj4KPj4+PiBJbiBvdGhlciB3b3JkcyB0aGUgd2hvbGUg
Y29uY2VwdCBvZiBzdWJtaXR0aW5nIHdvcmsgdG8gdGhlIGtlcm5lbAo+Pj4+IHdoaWNoIGRlcGVu
ZHMgb24gc29tZSB1c2VyIHNwYWNlIGludGVyYWN0aW9uIGRvZXNuJ3Qgd29yayBhbmQgbmV2ZXIg
Cj4+Pj4gd2lsbC4KPj4+IFdlbGwgdGhlIGlkZWEgaGVyZSBpcyB0aGF0IG1lbW9yeSBtYW5hZ2Vt
ZW50IHdpbGwgKm5ldmVyKiBkZXBlbmQgb24KPj4+IGluZGVmaW5pdGUgZmVuY2VzOiBBcyBzb29u
IGFzIHNvbWVvbmUgd2FpdHMgb24gYSBtZW1vcnkgbWFuYWdlciBmZW5jZQo+Pj4gKGJlIGl0IGV2
aWN0aW9uLCBzaHJpbmtlciBvciBtbXUgbm90aWZpZXIpIGl0IGJyZWFrcyBvdXQgb2YgYW55Cj4+
PiBkbWEtZmVuY2UgZGVwZW5kZW5jaWVzIGFuZCAvb3IgdXNlci1zcGFjZSBpbnRlcmFjdGlvbi4g
VGhlIHRleHQgCj4+PiB0cmllcyB0bwo+Pj4gZGVzY3JpYmUgd2hhdCdzIHJlcXVpcmVkIHRvIGJl
IGFibGUgdG8gZG8gdGhhdCAoc2F2ZSBmb3IgCj4+PiBub24tcHJlZW1wdGlibGUKPj4+IGdwdXMg
d2hlcmUgc29tZW9uZSBzdWJtaXRzIGEgZm9yZXZlci1ydW5uaW5nIHNoYWRlcikuCj4+IFllYWgg
SSB0aGluayB0aGF0IHBhcnQgb2YgeW91ciB0ZXh0IGlzIGdvb2QgdG8gZGVzY3JpYmUgaG93IHRv
Cj4+IHVudGFuZ2xlIG1lbW9yeSBmZW5jZXMgZnJvbSBzeW5jaHJvbml6YXRpb24gZmVuY2VzIGdp
dmVuIGhvdyBtdWNoIHRoZQo+PiBodyBjYW4gZG8uCj4+Cj4+PiBTbyB3aGlsZSBJIHRoaW5rIHRo
aXMgaXMgcG9zc2libGUgKHVudGlsIHNvbWVvbmUgY29tZXMgdXAgd2l0aCBhIGNhc2UKPj4+IHdo
ZXJlIGl0IHdvdWxkbid0IHdvcmsgb2YgY291cnNlKSwgSSBndWVzcyBEYW5pZWwgaGFzIGEgcG9p
bnQgaW4gCj4+PiB0aGF0IGl0Cj4+PiB3b24ndCBoYXBwZW4gYmVjYXVzZSBvZiBpbmVydGlhIGFu
ZCB0aGVyZSBtaWdodCBiZSBiZXR0ZXIgb3B0aW9ucy4KPj4gWWVhaCBpdCdzIGp1c3QgSSBkb24n
dCBzZWUgbXVjaCBjaGFuY2UgZm9yIHNwbGl0dGluZyBkbWEtZmVuY2UgaXRzZWxmLgoKV2VsbCB0
aGF0J3MgdGhlIHdob2xlIGlkZWEgd2l0aCB0aGUgdGltZWxpbmUgc2VtYXBob3JlcyBhbmQgd2Fp
dGluZyBmb3IgCmEgc2lnbmFsIG51bWJlciB0byBhcHBlYXIuCgpFLmcuIGluc3RlYWQgb2YgZG9p
bmcgdGhlIHdhaXQgd2l0aCB0aGUgZG1hX2ZlbmNlIHdlIGFyZSBzZXBhcmF0aW5nIHRoYXQgCm91
dCBpbnRvIHRoZSB0aW1lbGluZSBzZW1hcGhvcmUgb2JqZWN0LgoKVGhpcyBub3Qgb25seSBhdm9p
ZHMgdGhlIGluZGVmaW5pdGUgZmVuY2UgcHJvYmxlbSBmb3IgdGhlIHdhaXQgYmVmb3JlIApzaWdu
YWwgY2FzZSBpbiBWdWxrYW4sIGJ1dCBhbHNvIHByZXZlbnRzIHVzZXJzcGFjZSB0byBzdWJtaXQg
c3R1ZmYgd2hpY2ggCmNhbid0IGJlIHByb2Nlc3NlZCBpbW1lZGlhdGVseS4KCj4+IFRoYXQncyBh
bHNvIHdoeSBJJ20gbm90IHBvc2l0aXZlIG9uIHRoZSAibm8gaHcgcHJlZW1wdGlvbiwgb25seQo+
PiBzY2hlZHVsZXIiIGNhc2U6IFlvdSBzdGlsbCBoYXZlIGEgZG1hX2ZlbmNlIGZvciB0aGUgYmF0
Y2ggaXRzZWxmLAo+PiB3aGljaCBtZWFucyBzdGlsbCBubyB1c2Vyc3BhY2UgY29udHJvbGxlZCBz
eW5jaHJvbml6YXRpb24gb3Igb3RoZXIKPj4gZm9ybSBvZiBpbmRlZmluaXRlIGJhdGNoZXMgYWxs
b3dlZC4gU28gbm90IGdldHRpbmcgdXMgYW55IGNsb3NlciB0bwo+PiBlbmFibGluZyB0aGUgY29t
cHV0ZSB1c2UgY2FzZXMgcGVvcGxlIHdhbnQuCgpXaGF0IGNvbXB1dGUgdXNlIGNhc2UgYXJlIHlv
dSB0YWxraW5nIGFib3V0PyBJJ20gb25seSBhd2FyZSBhYm91dCB0aGUgCndhaXQgYmVmb3JlIHNp
Z25hbCBjYXNlIGZyb20gVnVsa2FuLCB0aGUgcGFnZSBmYXVsdCBjYXNlIGFuZCB0aGUgS0ZEIApw
cmVlbXB0aW9uIGZlbmNlIGNhc2UuCgo+Cj4gWWVzLCB3ZSBjYW4ndCBkbyBtYWdpYy4gQXMgc29v
biBhcyBhbiBpbmRlZmluaXRlIGJhdGNoIG1ha2VzIGl0IHRvIAo+IHN1Y2ggaGFyZHdhcmUgd2Un
dmUgbG9zdC4gQnV0IHNpbmNlIHdlIGNhbiBicmVhayBvdXQgd2hpbGUgdGhlIGJhdGNoIAo+IGlz
IHN0dWNrIGluIHRoZSBzY2hlZHVsZXIgd2FpdGluZywgd2hhdCBJIGJlbGlldmUgd2UgKmNhbiog
ZG8gd2l0aCAKPiB0aGlzIGFwcHJvYWNoIGlzIHRvIGF2b2lkIGRlYWRsb2NrcyBkdWUgdG8gbG9j
YWxseSB1bmtub3duIAo+IGRlcGVuZGVuY2llcywgd2hpY2ggaGFzIHNvbWUgYmVhcmluZyBvbiB0
aGlzIGRvY3VtZW50YXRpb24gcGF0Y2gsIGFuZCAKPiBhbHNvIHRvIGFsbG93IG1lbW9yeSBhbGxv
Y2F0aW9uIGluIGRtYS1mZW5jZSAobm90IG1lbW9yeS1mZW5jZSkgCj4gY3JpdGljYWwgc2VjdGlv
bnMsIGxpa2UgZ3B1IGZhdWx0LSBhbmQgZXJyb3IgaGFuZGxlcnMgd2l0aG91dCAKPiByZXNvcnRp
bmcgdG8gdXNpbmcgbWVtb3J5IHBvb2xzLgoKQXZvaWRpbmcgZGVhZGxvY2tzIGlzIG9ubHkgdGhl
IHRpcCBvZiB0aGUgaWNlYmVyZyBoZXJlLgoKV2hlbiB5b3UgYWxsb3cgdGhlIGtlcm5lbCB0byBk
ZXBlbmQgb24gdXNlciBzcGFjZSB0byBwcm9jZWVkIHdpdGggc29tZSAKb3BlcmF0aW9uIHRoZXJl
IGFyZSBhIGxvdCBtb3JlIHRoaW5ncyB3aGljaCBuZWVkIGNvbnNpZGVyYXRpb24uCgpFLmcuIHdo
YXQgaGFwcGVucyB3aGVuIGFuIHVzZXJzcGFjZSBwcm9jZXNzIHdoaWNoIGhhcyBzdWJtaXR0ZWQg
c3R1ZmYgdG8gCnRoZSBrZXJuZWwgaXMga2lsbGVkPyBBcmUgdGhlIHByZXBhcmVkIGNvbW1hbmRz
IHNlbmQgdG8gdGhlIGhhcmR3YXJlIG9yIAphYm9ydGVkIGFzIHdlbGw/IFdoYXQgZG8gd2UgZG8g
d2l0aCBvdGhlciBwcm9jZXNzZXMgd2FpdGluZyBmb3IgdGhhdCBzdHVmZj8KCkhvdyB0byB3ZSBk
byByZXNvdXJjZSBhY2NvdW50aW5nPyBXaGVuIHByb2Nlc3NlcyBuZWVkIHRvIGJsb2NrIHdoZW4g
CnN1Ym1pdHRpbmcgdG8gdGhlIGhhcmR3YXJlIHN0dWZmIHdoaWNoIGlzIG5vdCByZWFkeSB3ZSBo
YXZlIGEgcHJvY2VzcyB3ZSAKY2FuIHB1bmlzaCBmb3IgYmxvY2tpbmcgcmVzb3VyY2VzLiBCdXQg
aG93IGlzIGtlcm5lbCBtZW1vcnkgdXNlZCBmb3IgYSAKc3VibWlzc2lvbiBhY2NvdW50ZWQ/IEhv
dyBkbyB3ZSBhdm9pZCBkZW55IG9mIHNlcnZpY2UgYXR0YWNrcyBoZXJlIHdlcmUgCnNvbWVib2R5
IGVhdHMgdXAgYWxsIG1lbW9yeSBieSBkb2luZyBzdWJtaXNzaW9ucyB3aGljaCBjYW4ndCBmaW5p
c2g/Cgo+IEJ1dCBhZ2Fpbi4gSSdtIG5vdCBzYXlpbmcgd2Ugc2hvdWxkIGFjdHVhbGx5IGltcGxl
bWVudCB0aGlzLiBCZXR0ZXIgdG8gCj4gY29uc2lkZXIgaXQgYW5kIHJlamVjdCBpdCB0aGFuIG5v
dCBjb25zaWRlciBpdCBhdCBhbGwuCgpBZ3JlZWQuCgpTYW1lIHRoaW5nIGFzIGl0IHR1cm5lZCBv
dXQgd2l0aCB0aGUgV2FpdCBiZWZvcmUgU2lnbmFsIGZvciBWdWxrYW4sIAppbml0aWFsbHkgaXQg
bG9va2VkIHNpbXBsZXIgdG8gZG8gaXQgaW4gdGhlIGtlcm5lbC4gQnV0IGFzIGZhciBhcyBJIGtu
b3cgCnRoZSBzb2x1dGlvbiBpbiB1c2Vyc3BhY2Ugbm93IHdvcmtzIHNvIHdlbGwgdGhhdCB3ZSBk
b24ndCByZWFsbHkgd2FudCAKdGhlIHBhaW4gZm9yIGEga2VybmVsIGltcGxlbWVudGF0aW9uIGFu
eSBtb3JlLgoKQ2hyaXN0aWFuLgoKPgo+IC9UaG9tYXMKPgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
