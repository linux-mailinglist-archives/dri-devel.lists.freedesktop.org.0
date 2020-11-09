Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27E2AC62D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 21:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EF6893EF;
	Mon,  9 Nov 2020 20:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7E893EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 20:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5NTmYUvdbBwHmmbQSMvd9PA9i893LqDfk+pssNpha/DLG1fbtd+3C3PGCxura7rTrdau9q6SP9qQ7Wz7/NzE4Yh6ZIu59nCIf1XIXPp2VKknkCUWNJsdRpi/cgtXypy2OlxHDAvGVEdS/w9+Mhp4Y7+1oKaFNtX0EfUH97hvUXMt6bVDTkuxq/UHLdOVNxUOprn5PSSneAXwBNrX45OuemxAma1xOCu5YRYXK7rvvwifXa5moYe0XK8HbevX+FYCwVWaFzpMwawcbJhKNwpXFPBUKxYa89l26fvAj0znky/ZVl/SKbIvxEk9XGU3nd5k1hCHViwPunDFh4x8DVyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoSCPAlSnUyoRL+NhYF/Fc6UTbwsvvcbTkYZWUetXHw=;
 b=nELYBxTW3O5mrdbn01VAQOrmecpIAoOvfTEjL95KO/QzN6CccBJewDFDcX4mlhWJ4F8gb9mL3hVaSWQEWYuvDF04f+CVJDqjotkipdHflpmFzjfhcq34Q0M2wQZZbjUor6G8v5WKdmhdG3tB1cKVF3BvT9E7zucDonWxH/S5B/vhpL/I5tQO2xpF78t07+W7WpRWNlZVn2AkYAHTU/rhCy/M9Vyb58ffrLZJ/csuDh5KE7wqIzN0qYYxiBObgwAS6dahcLqytD6h4s5gSOg8bErt1MisY1EBCfRGxpxl679Sz6ONnBj1CREQb8Xv/PzP6/l/OhONLYvzs333o5/o5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoSCPAlSnUyoRL+NhYF/Fc6UTbwsvvcbTkYZWUetXHw=;
 b=rIU2t2vOuC9FyYC7Q/W3sFZIzZxWi/YufkQn58LfoDCvVxnSwVGCH7dWGDsfHDxZojIcxj69+mvFNhHT9y/h5sTp/Bc0SC1iaJgenqoIF6RYBsIpT3gNUpvkSxOVwlWt5nlQ6ASOrDC1If9XBupnWjJ3U1Tb7uz+Msa+9iqVokA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 9 Nov
 2020 20:48:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 20:48:09 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
 <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
 <20201109164301.GI6112@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
Date: Mon, 9 Nov 2020 21:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201109164301.GI6112@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0116.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0116.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 20:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e681370d-a519-420b-6aa2-08d884f0c403
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678C577CA19651E3E2F4D2F83EA0@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9xjGmGrHPdnrKyf8xdl+OZYqR48/pMQ7IdT0uiV5OpMFks400alCuTrYMebYZxpgLiaTYWLyTifkb5vczXdhXxh7qHJiZCdpmNqpQg9Zgm80+nm5SqrWV38VNk8RWuPKrYWhkZNDr20zs1uLocmPFTv0fnjoIh7Ng2JNc6ImCWqDGN+UjR7ds62ICf4/B4jm+evinBYVs+C2YCWvGNqUBAM45tvAe/llkQzH1lXBY1Qh0o8f1w10yeaSPNohoRwK3Kf/175DkcfcZrAp+APbhucP95tFjFXJsYOLCmgkJz1i5ixsaVW7CaivD2dOUU6kWlu8wBEHxHuPXzgMTbeLXKzfu1uumsWZ32Ow6YiyQW3LPCClhBPGOuv+OXzviWU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(6486002)(16526019)(8676002)(31696002)(316002)(6916009)(2906002)(52116002)(31686004)(66946007)(86362001)(478600001)(66556008)(6666004)(5660300002)(8936002)(2616005)(4326008)(186003)(83380400001)(36756003)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHRmZlZ4MEpZS1hKckFzbmhRaExPdWhTZkpudUR2bXo0SERZckd0U1kwZUJX?=
 =?utf-8?B?Z1d5WFZGUUZGSUsxSUQvbTFpNTBuU0V3UThtR1kvN0FLVEhnMlJHWERWQ05N?=
 =?utf-8?B?cXBKcFZGK01WdS9TWkRTN0E3WUJ5ODhDYm4zQStwMU14V0ltQkpScDhDQWxZ?=
 =?utf-8?B?ZmtFZSt2UTZhUEZPVExQOFBrbDYyZVpSbytOTG95OSs2Zlplbmh5TUg3NXlG?=
 =?utf-8?B?SGY5VmJhM0FIcXFYLzJRcTcwZnB0eDI3VnN5cXFwQjF5R0tOTDNvdXhJSHpv?=
 =?utf-8?B?THFJR3hCV00zRG9sbTY0c0gvbTUwOEZSTUF1Y09vVFkwVUkyd2pqeU8zTW1I?=
 =?utf-8?B?UGI2QTkxVlU2ZlNhTkRJakdCbE5aNUhPemkyaTZKQjZVT3ZHaUluSTBDZFdn?=
 =?utf-8?B?c0o5OXNZelNabnBmbUovamV2SFNTWFgyV0wrckx1dGNLQ0RRcEtrVlpENzdp?=
 =?utf-8?B?Y1JvSE9yd3BiOUlMK3J0OUxEMCt6ZlU1dVpXeUhhdjlJZFd0S3BRUmtmRFox?=
 =?utf-8?B?c0V6ZDFZbFJUcGpJWWtrdFhDTm5qN2FaenNqK1RpaXROV3ZrVTlQb3lQTWE0?=
 =?utf-8?B?Ny9ScEZ4YmxZcE1HTFh5QzRzeml2bUFtemRTTlN2OE9hMHpXNWw1d3YvdWtP?=
 =?utf-8?B?ZEErSGVlY0R4MmhOR0J2cEswMkVuc1UvOFZnK3dRMERJSExMZm5mV2dKbXg4?=
 =?utf-8?B?SlJxWFFMWS9vQ1FYRUNmcEcwbUoxWFhDNGFjbG1Tc0RpakV6V1F3T3JVNG5r?=
 =?utf-8?B?RldTR3QvUTQzWjFKMyttd2ZIZENlTnZtMENpZDJhNnhQaXdFRGVZOWtzeG9Q?=
 =?utf-8?B?UEpYSGc4ZmE2aGRPL3RyR05nSU5IaG9BZCtqcEY2UnN4dkNXbVhPeFJvcnZ4?=
 =?utf-8?B?ZmxGTWNKd3FVKzMzaHgwbk5PQ0Q0NzYzV0h3Rit3eituMmtFMHNEK2R6VWk0?=
 =?utf-8?B?OWh4WGFBcWdQeDRBWGQzRnUwaHdoYldnQUhMOStGQnZsOEhlRDF5aVdUQ2pQ?=
 =?utf-8?B?c3kwK0Nva1lYTE16aGd6Wm1LekFVRGZWdHRUK3U3RjZOTmR2ZVpLdUVDMUU0?=
 =?utf-8?B?L3BsdXBaSXBBbC85WHp2dmducXFPR0N6K2krY1BGd21INWpkcHhaS2YranFJ?=
 =?utf-8?B?UkRBeDhZUTZrTjFzQVh6R3pmL2xNRUc1TStpVDZsSWtpVnFYcXJhWW5EeXZr?=
 =?utf-8?B?dXY0WEd2SjlWYk9PRC9sRlhOeWNuaXdBZTRDQWc2YlkxTWRIbUN0cWtidlFI?=
 =?utf-8?B?STVybXlVcnhSenBxOXJpRTBvbE84U2xSSG9UeDk1dTJIK3VPQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e681370d-a519-420b-6aa2-08d884f0c403
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 20:48:09.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cB68CEDjjhejGQZMGgHFsPgudhoZmEe6AWO+qe8hNcLrTvZOTmcd/80kTcwuH+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTEuMjAgdW0gMTc6NDMgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gTW9uLCBO
b3YgMDksIDIwMjAgYXQgMDU6MjA6MTdQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMDkuMTEuMjAgdW0gMTc6MTggc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4+PiBPbiBN
b24sIE5vdiAwOSwgMjAyMCBhdCAwNDo1NzoyOVBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+IEFtIDA5LjExLjIwIHVtIDE2OjE2IHNjaHJpZWIgVmlsbGUgU3lyasOkbMOkOgo+
Pj4+PiBPbiBXZWQsIE5vdiAxMSwgMjAyMCBhdCAwNjoxMzowMlBNICswMTAwLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4+Pj4gQW0gMDkuMTEuMjAgdW0gMDE6NTQgc2NocmllYiBEYXZlIEFp
cmxpZToKPj4+Pj4+PiBAQCAtMTQzMiwxNSArMTQ3OSwxOCBAQCBpbnQgdHRtX2JvX3N3YXBvdXQo
c3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCj4+Pj4+Pj4gICAgICAJaWYgKGJvLT5tZW0u
bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkgewo+Pj4+Pj4+ICAgICAgCQlzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggY3R4ID0geyBmYWxzZSwgZmFsc2UgfTsKPj4+Pj4+PiAgICAgIAkJc3RydWN0
IHR0bV9yZXNvdXJjZSBldmljdF9tZW07Cj4+Pj4+Pj4gKwkJc3RydWN0IHR0bV9wbGFjZSBob3Ag
PSB7fTsKPj4+Pj4+IFBsZWFzZSBhbHdheXMgdXNlIG1lbXNldCgpIGlmIHlvdSB3YW50IHRvIHpl
cm8gaW5pdGlhbGl6ZSBzb21ldGhpbmcgaW4KPj4+Pj4+IHRoZSBrZXJuZWwsIHdlIGhhZCBlbm91
Z2ggdHJvdWJsZSB3aXRoIHRoYXQuCj4+Pj4+IFdoYXQgdHJvdWJsZSBpcyB0aGF0PyBJJ3ZlIG5v
dCBoZWFyZCBvZiBhbnl0aGluZywgYW5kIHdlIHVzZQo+Pj4+PiA9e30gcXVpdGUgZXh0ZW5zaXZl
bHkgaW4gZHJtIGxhbmQuCj4+Pj4gPXt9IGluaXRpYWxpemVzIG9ubHkgbmFtZWQgZmllbGRzLCBu
b3QgcGFkZGluZy4KPj4+IEhhcyB0aGF0IGFjdHVhbGx5IGhhcHBlbmVkPwo+PiBZRVMhIE51bWVy
b3VzIHRpbWVzIQo+IFlvdSB3b3VsZG4ndCBoYXBwZW4gdG8gaGF2ZSBsaW5rcy9ldGMuIHRvIHRo
ZSBkaXNjdXNzaW9uPwo+IEknZCBsaWtlIHRvIGNoZWNrIHRoZW0gb3V0LgoKVWZmLCB0aGF0IHdh
cyB5ZWFycyBhZ28uIEp1c3QgZ29vZ2xlIGZvciBzb21ldGhpbmcgbGlrZSAibWVzYSBtZW1zZXQg
Cmhhc2giLCB0aGVyZSB3YXMgcmVjZW50bHkgKH4gdGhlIGxhc3QgeWVhcikgYW5vdGhlciBkaXNj
dXNzaW9uIGJlY2F1c2UgCnNvbWVib2R5IHJhbiBpbnRvIGV4YWN0bHkgdGhhdCBwcm9ibGVtIG9u
Y2UgbW9yZS4KCkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
