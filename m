Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116A3492F5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC186ED29;
	Thu, 25 Mar 2021 13:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA806ED29
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGJV5WdUqYokgF3PmKfGf/Taqlp7pzI1hHCTHi+H2AXayLo+bjiKhTLZzFc1R+zte7Wm1gf9nPYymBiulvKm3DOwCNdoRwSZFY0ZLdnvalyrttj+vtefYjtX52FgCh1xmrNTMDYW1DMivBud9R7U05Jib6nf/u6ke8zjrv6qW8z7+YM97ISbHZFMzMfhMfwKUp3noUI12q5LhvVQxVWg8x/yK8n76bVCQft5v+G2amCdii8b7OMUoGtbQYkpn0lnzFc6DEeok/Ydej+stPy1Ve1yzxYzmPPnCoaWzjFfsZjmOyexHFFX5VXMHmqOFBkdnLAJokBkx0z9LqZq7Fk/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRkyjHxZUlcAT077NPEF8PND9tCtk8GVt/pOnSZeKLo=;
 b=bJlIyrJgwA5lhG1E9iOoEW7d3DXd+GinDlLL46UBw7Y59ggMQLOAhNKsYUQdtfO4pd/s6NP3eoMrdLeFB4t6z6IfWILbKkKusJJqHhaaPNjvKL/e0E1bG6L9dceVFeDLGz55phqEfn7DYoK/lkJUBUWZ5h8zC/dy6odcxT64yVAkuqzrlmt5yrDvtrr2Ks/4oLvQYcE9x/M8JMRJPnAAlnB8nX5seOmyIhJXkAV/omnvnzEBUXGjuKcHUyM8J3HcsY74xsCUWQkVjB5ZkCeND5zVj6MWHNSTUo6/BgRXBAd9LLr6JPzzKAtPE4SS8VYZjptM3Lr/Mge7+K1RwO6HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRkyjHxZUlcAT077NPEF8PND9tCtk8GVt/pOnSZeKLo=;
 b=Z6+hycIR97/VY9GqocIgxjzb5CXhN35Y+ko/Fl2FwDnsX2KXDaBrwoK9AhlPPNJKtPGKGuhmJoFS6NMFTThjpIcYNzdKIC1EhayyOaTXkZMQAynjUwyn9JAWrKkT5keuE+CvKwYMMY+l7zNXTbIL59Rj8ArmlldiR3yoWfya2uMcicVvoISADDbt+2lCYOwVGwNbzAQ1i7wMiEd+4Y4ctSFMVq/lg3pjJ4oi9BvSafsEOM5jtaEzjhHlaROY7bL0hmiK4Q5Vl8QBsrL1Jud8jSpnnVaXq6QPMMvc+UdrOE9Cz+EFhKzwmXgaaFs01oNUAiSFHMTTdwjLYzxhcgZuVA==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 13:17:58 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 13:17:58 +0000
Date: Thu, 25 Mar 2021 10:17:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325131756.GX2356281@nvidia.com>
References: <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
 <20210325124206.GA599656@nvidia.com>
 <00f79bae-75c4-d694-8dc9-35ac21cd1006@amd.com>
Content-Disposition: inline
In-Reply-To: <00f79bae-75c4-d694-8dc9-35ac21cd1006@amd.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:610:e7::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0233.namprd03.prod.outlook.com (2603:10b6:610:e7::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Thu, 25 Mar 2021 13:17:57 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPPs4-002Wlz-DK; Thu, 25 Mar 2021 10:17:56 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c571664b-de84-45b8-9eaf-08d8ef906844
X-MS-TrafficTypeDiagnostic: DM5PR12MB1242:
X-Microsoft-Antispam-PRVS: <DM5PR12MB124217C7637662F2E51B9564C2629@DM5PR12MB1242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/fJHSQV9wVAYGrOmNBLGF2zcwNJ/sLWLLG2y9HpkLHZnLZIgsIYahySyoefBFbwKbBkuWUysvYT+zmZTBp77fKnSpwtZwZqbP56BAuT0siohgphbQ+WYqwTIvovd25J4CrseTEy0Ij70XOckqVay2g/+G0HaiaYGpafbw+NUqJAy4I2gIwDrfEZ508gRFbWb8j7Vps/m2XeSGJ4lI92w+kLQxNIU0LMbR0JaCH0XLEKFHhAVe5hPtSidNFOB3D7iLe8+sV+sCD1KeodLjOC7n39z2E6kqZRVi3OE2kIb65GOBKdep8xUc4B2QKBKaF8Ac0iwnF8hdR/gvSFy7wVO7dVLPFNxkxm5h8HDNDmSvou2X0D3RAe91kxhzumxwi2HESwGGQe+1RVV/dk15sVp8DjnLpuo3qtLA8wtQn1lNmxycVSGw/0trAv+76UP8zRwPlvHDfTaF5ZA2TtVWYJ21XFG2ajjx+mQbCw1ShrNB9JWYhB6BiufWM7HY6WKKj/uMAOdb0BnERRBhGqjIsOIj15NjWJ2xCnUXuq70CGcvohu6xFA4kR8RbdvmLgNUJ82X0Ynhjd07/Z1WRWb613bYDKhE6n+6q/7TD/Uf/zQPNvDBjLT7H6J9E7Iv7ifervXTc8Vv3wjfjVB6OUf8fr+2mp+V2sGd18ebNMI1Lgwg7c12C5ouVzNZQyhDTzTfab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(66946007)(2906002)(66556008)(66476007)(54906003)(33656002)(86362001)(186003)(6916009)(26005)(36756003)(9786002)(8676002)(1076003)(478600001)(426003)(2616005)(5660300002)(4326008)(8936002)(9746002)(38100700001)(316002)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXhTcEFhVlVvRjA5QkJXd0xuMkFISVdueURGRnRleHpvTm9YMlV1RnpSSjBa?=
 =?utf-8?B?Q2haeWtqMlVxb1F6V1duTS9zN3dSaksrNHQ0NlIrVUljOW03R2tiSXozLzlM?=
 =?utf-8?B?QkxaQ3p1eHBiSVBPZ3hLUkc1NmdKZ3RrQmlPTjJWVlF1amVsSk90NWdWbDla?=
 =?utf-8?B?aVR6R1F2emxUbVJqMXpEQmVYY2srSGdKVlZCbzd5Ymx4Znhzdm5iaktKK2Nq?=
 =?utf-8?B?eXBCUzgxaUlXV0EvZ2lxckNMZ1h1Z3JuTUlKV3l1S0FmT0g4SEdLRTJJSktZ?=
 =?utf-8?B?R2YyY2ZwaDkzQnFrY1Z1YzhTTzF0OHJ6MlBydHJYZjF1ZDFLZFV1cFVYZnVp?=
 =?utf-8?B?MEtqbzEzQndCQWxQYnVBTmpqWU8zT0ZmWWZpaUg2S25rbmVRUVkyd1V6TklP?=
 =?utf-8?B?ckNIYjBnbWlTYlpRWUQ1cWxUckVtQzVvRWNOOVEwVXEyRGErc3dFL1RLNkFQ?=
 =?utf-8?B?cU1NeXk4YkRzOUlaNFY1T2NQZG9TZVBDUG13VUFXWkk3WWo0UVlZYmJMelh2?=
 =?utf-8?B?WXY2NG5FQllBNGdRWnFubmF4ZUZzUHVnRExiSmdCS3pZVUNFRHNJTjRLKzRQ?=
 =?utf-8?B?QWdYVjlWdlhPbjBFZ0tXd3NlaWk3UE5rcDcvT2QxOGQ0MEg3dkpMMmpVUWJK?=
 =?utf-8?B?Zjl2RzRINHFpdEpZSlJ0MUdEWW9DTml3ZFlJV3BjRU9XMWxreWRLUlhXYUJT?=
 =?utf-8?B?TnYzYk1vZ2dwS3RXQ2h0RFdLaG5kUWk2bnV1NWdZcVk1V3d4bGF5aUNXNUtw?=
 =?utf-8?B?dUlwZlJNbFRCbnF5Q3lPTjBlb0hLQmRlekpkUi9XYUlPL3Q3Uy9VVk40ZlAv?=
 =?utf-8?B?bXBlYmE2emQyQzBGZ2dMR1VERlhnZjQyQ0hSTnEvSmxZMUFGUFhsMGZSd2tX?=
 =?utf-8?B?dDlWS1g0Q2JCRWg2Vk5kNm43R0ZQRG5XMzVzU05kMnFjTXYzOGZ4RC9oZTlS?=
 =?utf-8?B?Qk1pZlkzajlHSHZkTlA0N1A2bGkvemRSS3F5ZjJnbERSTGxsQlBRVVE4QnRy?=
 =?utf-8?B?WEF0SnJwUUZBRS9PRXlZMFgxNzBsQ3pDRk5jMU8vb21YazlUR1hsMENCOHNM?=
 =?utf-8?B?Q0ZvWjZSZUozbWRsdWg4VXo2T1NMZzMydzN5N0ZVaXowczIzT1RibVpvUVFD?=
 =?utf-8?B?RmpZT2xZd1k4d3gzR294OU8vMHlsNmQxRi84Y2UwWDNYVDZmTC9PeXpBM2dV?=
 =?utf-8?B?Q2I3T0lZclFaY3pYelQ1bU90bytDWDVscm1ieFNPdGVTLzNXWnYwR0dmZ0J4?=
 =?utf-8?B?dE5zSWpTYmV0c29ISGVkNWZQQWdqbUkrV2hjRkFvNC92dWQrL3VqWGFqWEZ0?=
 =?utf-8?B?eC9oMngrbjQzU3F4TWFrU1B5ci8vK09ERnJVcmVwTGVJNFlBYXh4dSthbTlI?=
 =?utf-8?B?YmUrK3ZPaHpUTDZRbTlIb2NWRkl5VksxTUZ3Rnl6eTVNL1NaM2E2V1ROazN6?=
 =?utf-8?B?RUxBM3VQM2laM2NYeFUyVlBDMEtaanFHSWpBc0RiQ1ZiZ2s5VDNERGxSSTlx?=
 =?utf-8?B?SFZVRTB5anRhT2plaUVpVG5sN1hlNHA3Q24xejlrdnlSbGYxM0VJbW1CWGxs?=
 =?utf-8?B?MkVmMU01dHJDQTBtUXpsU09aWjQrdW5vamJCRVNOclhiRGZucEZIdDZ3K2xB?=
 =?utf-8?B?Y1BZb0Z3S1JpcTBqSCtzVGRXZU5tTmtBN25XVnplRlYvRCtDaWFBNUFIQ2RJ?=
 =?utf-8?B?VDlIU0djUXkvanZXVU1KaTFyN1BkWS91QnlRbGVqNTNXSWVTZkFuTWp6bFFR?=
 =?utf-8?Q?2GfYbvLpW847rCKYlorCz6YdtGGFSVvjhpd6dKD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c571664b-de84-45b8-9eaf-08d8ef906844
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 13:17:58.2568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJiBEcVwUXtcm8ILbC8qgWVOTSPjctb7aJCkl6iCYvstuCokf8ydD1hcuhuJWbTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1242
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDI6MDU6MTRQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiAKPiAKPiBBbSAyNS4wMy4yMSB1bSAxMzo0MiBzY2hyaWViIEphc29uIEd1bnRo
b3JwZToKPiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDAxOjA5OjE0UE0gKzAxMDAsIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+IEFtIDI1LjAzLjIxIHVtIDEzOjAxIHNjaHJpZWIgSmFz
b24gR3VudGhvcnBlOgo+ID4gPiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDEyOjUzOjE1UE0g
KzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4g
PiBOb3BlLiBUaGUgcG9pbnQgaGVyZSB3YXMgdGhhdCBpbiB0aGlzIGNhc2UsIHRvIG1ha2Ugc3Vy
ZSBtbWFwIHVzZXMgdGhlCj4gPiA+ID4gPiBjb3JyZWN0IFZBIHRvIGdpdmUgdXMgYSByZWFzb25h
YmxlIGNoYW5jZSBvZiBhbGlnbmVtZW50LCB0aGUgZHJpdmVyIG1pZ2h0Cj4gPiA+ID4gPiBuZWVk
IHRvIGJlIGF3YXJlIG9mIGFuZCBkbyB0cmlja2VyeSB3aXRoIHRoZSBodWdlIHBhZ2UtdGFibGUt
ZW50cnkgc2l6ZXMKPiA+ID4gPiA+IGFueXdheSwgYWx0aG91Z2ggSSB0aGluayBpbiBtb3N0IGNh
c2VzIGEgc3RhbmRhcmQgaGVscGVyIGZvciB0aGlzIGNhbiBiZQo+ID4gPiA+ID4gc3VwcGxpZWQu
Cj4gPiA+ID4gT2YgY291cnNlIHRoZSBkcml2ZXIgbmVlZHMgc29tZSB3YXkgdG8gaW5mbHVlbmNl
IHRoZSBWQSBtbWFwIHVzZXMsCj4gPiA+ID4gZ2VybmFsbHkgaXQgc2hvdWxkIGFsaWduIHRvIHRo
ZSBuYXR1cmFsIHBhZ2Ugc2l6ZSBvZiB0aGUgZGV2aWNlCj4gPiA+IFdlbGwgYSBtbWFwKCkgbmVl
ZHMgdG8gYmUgYWxpZ25lZCB0byB0aGUgcGFnZSBzaXplIG9mIHRoZSBDUFUsIGJ1dCBub3QKPiA+
ID4gbmVjZXNzYXJpbHkgdG8gdGhlIG9uZSBvZiB0aGUgZGV2aWNlLgo+ID4gPiAKPiA+ID4gU28g
SSdtIHByZXR0eSBzdXJlIHRoZSBkZXZpY2UgZHJpdmVyIHNob3VsZCBub3QgYmUgaW52b2x2ZWQg
aW4gYW55IHdheSB0aGUKPiA+ID4gY2hvb3Npbmcgb2YgdGhlIFZBIGZvciB0aGUgQ1BVIG1hcHBp
bmcuCj4gPiBObywgaWYgdGhlIGRldmljZSB3YW50cyB0byB1c2UgaHVnZSBwYWdlcyBpdCBtdXN0
IGluZmx1ZW5jZSB0aGUgbW1hcAo+ID4gVkEgb3IgaXQgY2FuJ3QgZm9ybSBodWdlIHBnYWVzLgo+
IAo+IE5vLCB0aGF0J3MgdGhlIGpvYiBvZiB0aGUgY29yZSBNTSBhbmQgbm90IG9mIHRoZSBpbmRp
dmlkdWFsIGRyaXZlci4KClRoZSBjb3JlIG1tIGRvZXNuJ3Qga25vdyB0aGUgcGFnZSBzaXplIG9m
IHRoZSBkZXZpY2UsIG9ubHkgd2hpY2ggb2YKc2V2ZXJhbCBwYWdlIGxldmVscyB0aGUgYXJjaCBz
dXBwb3J0cy4gVGhlIGRldmljZSBtdXN0IGJlIGludm9sZXZkCmhlcmUuCgpKYXNvbgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
