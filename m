Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7523A327
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 13:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A85E6E042;
	Mon,  3 Aug 2020 11:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CA86E042
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 11:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgIc+VgzCxQhpCFmOJCfvT2nmI1A9hWZCiq8TCkmmZMJjEblvEhfWv+KV07WAWihZe3QuBuhW9PSKE5JpdD4wmoQj5xWI/BWjxMbOpKMQSjPo2jpltOymiB/dNGabB1XlgvNPK4kDjE4s6SPkhOm29IhqmcJ8sMDQJBOyLqKLF1hE3YxxQYhEvXgdYatYhH7d6EhBp6ROarfeYzLmTfYCevRUxEfikeN5KFBnAQoXkLOG5KwjWhUGSc9N2+dNBgwvqWEmHYmX5w4HubH6O2wSex3DcbGLwzfQqFo+BjElTNIv1Rp41YbJZ+a+dDppUquLQBT7NkbhT9NUDZVIdtj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5Dg/F7kJicsYVTTpYmqMx2YpAlFIvJw0I4NP1TWzdI=;
 b=c0SpePmjZaNAB4icpjN7d3/ugh5ImSR0Gh3NGOJSjNDApPLtQrUHygB9gQigZQcjVFERihqyOJMWstXtq3/kajVMOl1qbe29cKuO4XANXct0djFDk9pDflQFWJvnyIR4NC/Wdd0ntTXpYrQbEy8Tio/b40mTYzrxrV2GSiiULmHlEtGv0nEQ0A3Oz5KDiKrZFptF53rq03pQOKiwurigvKoyfk9CR+UhirK57E7bJQaphN04IrAvGSZlSF/6y4pc3MNUDQ/SRt5NCa9AeL+kazleoFL9Pe6EI9G4Mobm8LdmBLpajy+a6F+H/L29Q5i/VVE3Hey1xxHQeSRuVVe8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5Dg/F7kJicsYVTTpYmqMx2YpAlFIvJw0I4NP1TWzdI=;
 b=0HRplirHuFS5h7EdwtxL7jK1N0ly+ZRLerjb5Z3hK/n9Lw0y/3jvrivYMQyGHwYcmmmCZH8qvDOSlXLjHSno3P5Ape7HuZJhs6esnAfT0ZIYnd2BXz8cskYo/Hv4nAk7v/8RKF6j49rcldiIOZarC3sDpORflLAj+JINI5TIYYM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3967.namprd12.prod.outlook.com (2603:10b6:208:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 11:13:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 11:13:26 +0000
Subject: Re: [PATCH 00/49] ttm mem manager refactoring.
To: Dave Airlie <airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
 <CAPM=9tyqgtP3_CXSc_450X_Uuw5ZdUM1DEfvU3vff9kD5VBrKw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cf7718c6-9a90-b59c-0c71-0b00a8af8ae5@amd.com>
Date: Mon, 3 Aug 2020 13:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tyqgtP3_CXSc_450X_Uuw5ZdUM1DEfvU3vff9kD5VBrKw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0159.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0159.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Mon, 3 Aug 2020 11:13:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 87975597-c312-4ff1-94ce-08d8379e3e6d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3967:
X-Microsoft-Antispam-PRVS: <MN2PR12MB396773CCB8E9E8313A45DDD3834D0@MN2PR12MB3967.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xo7NmkEbq7QbKpAqH1kSwyvsVs2cmcP0LdS5Fe91eY40d8tDG9YIUVSZ6cIwFLISPF1PlUT/ye4Nw8wLII+UxvNi1SDsZdaoWjwmUNoq7rNDNiFAZfuk717evu6YFMDFHyiM0ZlEIAtJ8KJOGxpha2yahmsNvCgmWpwo491IOuMd999TTM5on0OAKJfPa7lgVZyCMmNXG7NvddX2HQpEvzj3ugqoCGhWYHfgOcvMLk/9r5aMhIGRoUoIZwySKdOziHpnCHthG3ysmLJa6pMc/Gn7vB3zdhkBbYLix+Ia913iuEmsvctY1KMF8TtoST2k932WR51ld7Pp1fiH/h2o0hv7kxOThvRvbIq7kofmkgLQPhyUZ/8xSu2YMRQNoH3uyC2ZUHBM8ikZF/dX9L7P0frHLkQvoaS0Ub0bvbJ5RkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(316002)(16526019)(66556008)(45080400002)(8936002)(186003)(52116002)(66476007)(54906003)(31696002)(66946007)(478600001)(36756003)(4326008)(6916009)(2616005)(6486002)(31686004)(83380400001)(2906002)(66574015)(966005)(5660300002)(8676002)(86362001)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b5NmAeLRV0H7OT1gsDLqD7zO4VevFc2YPyV6w6adkJkZ1zZytcoxYB61ncYsVLhyuhDUk3H6Sa8dn6Zra52O506klCG/OEU1TtZcLjnPq2nIfrwWqirYo9I0f31PDIaQ2uKjmZB+4Z6CyGk41caPBXUQe4cdq7Cj8fHPhfXimJJjWyunO/zVp380T6OLx8k8r3BBRRPxuRe4Qu6OW/UZ08JdvpD7Z754zSI+sze1XAv4MoigqQmKOMKncKQwAoy56WP+M7+aiN6quKegOF7Oa/g5uzyT2Fh6XSu0e9dW7KCvzmqkf0/ENZtl2dkKDanZXfc55C5IMqUYDXpr0qhGi2boP74OTu752wFFaZZD55XTN9x8cTtIK7u8F5m8yK9ELLLDqkytI47o8BMrRAX0j6VZdJo3GQ+WLIxeNuUSSQA/ckLARvoP9UvAacB+h93tiOCc/q7SNz+wOiKI313og2cU7sc4QnQVL8fMFs0x8dIyuIBo3RcVe6Wa1rMMSqtzyFDh9yZQRSVs2RDf0XGZkbZHkXlXSPfuPcbe3x897yV6MUT9GvFjWjPvitgVlRSnTkhk7zMzFe8AG5/eSm35NT5iwomFA8pP/TSFbPiWab3Ggrg0uoMJSRpJ/14qpWRmFDps2HH8onboXAD9imixUB9kPfqXgNXNj5aK/w4AdrxIO3FXrA0qWNg9A5iy4MwKYUDXa1ki+z3/Ue7lAQPWcw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87975597-c312-4ff1-94ce-08d8379e3e6d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 11:13:26.8212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /f5aX6pdqk+qq0b+srhzOb8l/PeaZXuvILbjX7hLu6OMR3tdAS4qsCVln5d2wzgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
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

QW0gMDMuMDguMjAgdW0gMDk6MTIgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBGcmksIDMxIEp1
bCAyMDIwIGF0IDE5OjE3LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAzMS4wNy4yMCB1bSAwNjowNCBzY2hyaWViIERhdmUgQWlybGllOgo+
Pj4gSSBzdGFydGVkIHB1bGxpbmcgb24gYSB0aHJlYWQsIGFuZCBpdCBsZWQgbWUgZG93biBhIGhv
bGUuCj4+IFdlIG1pZ2h0IHdhbnQgdG8gbWFrZSB0aGF0IGhvbGUgZXZlbiBiaWdnZXIgOikKPj4K
Pj4gSG93IGFib3V0IHdlIHJlbmFtZSB0aGUgdHRtX21lbV9yZWcgaW50byB0dG1fcmVzb3VyY2Ug
YW5kCj4+IHR0bV9tZW1fdHlwZV9tYW5hZ2VyIGludG8gdHRtX3Jlc291cmNlX21hbmFnZXIuCj4+
Cj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzOiUyRiUyRmNnaXQuZnJlZWRlc2t0b3Aub3JnJTJGfmFpcmxpZWQlMkZsaW51eCUyRmxvZyUy
RiUzRmglM0R0dG0tcmVmYWN0b3ItbWVtLW1hbmFnZXItcmVuYW1lJmFtcDtkYXRhPTAyJTdDMDEl
N0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2MxNDk4Y2UzNTJiZTRjNTZiMzA5MDhkODM3
N2NhZTYxJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzMy
MDM1NTkyNjAxMDIyMyZhbXA7c2RhdGE9cVhoS1A4Z212NlFzSmlTJTJCUHBydE0lMkJWbjh1RTFY
QUZiWkMwREkwMHpvbDglM0QmYW1wO3Jlc2VydmVkPTAKPgo+IGhhcyB0aGUgc2VyaWVzIHdpdGgg
c29tZSBzdHVmZiBtb3ZlZCBhcm91bmQgYnV0IDMgYWRkZWQgcmVuYW1lIHBhdGNoZXMKPiBhdCB0
aGUgZW5kLgo+Cj4gdHRtX2JvX21hbmFnZXIgLT4gdHRtX3JhbmdlX21hbmFnZXIKPiB0dG1fbWVt
X3R5cGVfbWFuYWdlciAtPiB0dG1fcmVzb3VyY2VfbWFuYWdlcgo+IHR0bV9tZW1fcmVnIC0+IHR0
bV9yZXNvdXJjZS4KPgo+IFRoZSBvbmUgc2xpZ2h0bHkgbWVzc3kgb25lIGlzIHdlIGhhdmUgYSBs
b3Qgb2YgdHRtX21lbV9yZWcgKm1lbQo+ICgqb2xkX21lbSBvciAqbmV3X21lbSkuCj4gICBJIGRp
ZG4ndCB0cnkgYW5kIHJlbmFtZSB0aG9zZSwgYnV0IEkgY291bGQgcHJvYmFibHkgZG8gaXQgaWYg
d2UKPiBkZWNpZGVkIGl0IHdhcyByZWFsbHkgbmVjZXNzYXJ5LgoKSSByZWFsbHkgd2FudCB0byBy
ZWR1Y2UgdGhlIHVzYWdlIG9mIHRob3NlIGluIHRoZSBsb25nIHRlcm0gZnJvbSB0aGUgCmRyaXZl
ciBhbnl3YXkuCgo+IEkndmUgZ290IHRvIGdvIGJhY2sgYW5kIGZvbGQgaW4gc29tZSByZXZpZXcg
Y29tbWVudHMgZnJvbSBwZW9wbGUgeWV0Cj4gYW5kIGFkZCByLWJzIEknbGwgdHJ5IGFuZCBnZXQg
dG8gdGhhdCB0b21vcnJvdy4KCkZlZWwgZnJlZSB0byBhZGQgbXkgQWNrZWQtYnkgdG8gdGhlIG9u
ZXMgd2hlcmUgSSBoYXZlbid0IGdpdmVuIGFuIApleHBsaWNpdCByYiBzbyBmb3IuCgpHb2luZyB0
byBwcmVwYXJlIG1vcmUgY2xlYW51cHMgb24gdG9wIG9mIHRoaXMgc2VyaWVzLgoKQ2hyaXN0aWFu
LgoKPgo+IERhdmUuCj4KPj4gTmVpdGhlciBhbWRncHUncyBPQS9HV1MgcmVzb3VyY2VzIG5vciB0
aGUgSURzIGluIFZNR0ZYIGFyZSByZWFsbHkgbWVtb3J5Lgo+Pgo+PiBJbiB0aGUgbG9uZyB0ZXJt
IEkgYWxzbyB3YW50IHRvIG1vdmUgdGhlIHdob2xlIGFkZHJlc3MgaGFuZGxpbmcgaW50bwo+PiBl
YWNoIGJhY2tlbmQuCj4+Cj4+IEdvaW5nIHRvIHNlbmQgY29tbWVudHMgb24gdGhlIGluZGl2aWR1
YWwgcGF0Y2hlcyBhcyB3ZWxsLgo+Pgo+Pj4gVGhpcyBzZXJpZXMgcmVmYWN0b3JzIHRoZSB0dG0g
dHRtX21lbV90eXBlX21hbmFnZXIgb2JqZWN0IGludG8KPj4+IGEgZHJpdmVyIG93bmVkLCBhbGxv
Y2F0ZWQsIHN1YmNsYXNzYWVkIG9iamVjdC4KPj4+Cj4+PiBJdCBzdGFydHMgd2l0aCB0d28gbWlu
b3IgZml4ZXMgZm9yIHNvbWUgYmFkIGFzc3VtcHRpb25zIGluIHR3byBkcml2ZXJzLgo+Pj4KPj4+
IEVuYWJsZXMgYSBuZXcgaW5pdCBwYXRoLCBwb3J0cyBhbGwgdGhlIGRyaXZlcnMgdG8gdGhlIG5l
dyBpbml0Cj4+PiBwYXRoLCBhbmQgY2xlYW5zIHVwIHRoZSBvbGQgaW5pdCBwYXRoLgo+Pj4gRW5h
YmxlcyBhIG5ldyB0YWtlZG93biBwYXRoLCBwb3J0cyBhbGwgdGhlIGRyaXZlcnMgdG8gdGhlIG5l
dyB0YWtlZG93bgo+Pj4gcGF0aCwgYW5kIGNsZWFucyB1cCB0aGUgb2xkIHRha2Vkb3duIHBhdGgK
Pj4+IFdyYXBzIGFsbCBhY2Nlc3MgdG8gdGhlIG1lbW9yeSBtYW5hZ2VycyBpbiB0aGUgYm9fZGV2
aWNlIGluIGEgd3JhcHBlcgo+Pj4gYWNyb3NzIGFsbCBkcml2ZXJzLgo+Pj4gTWFrZSBkZWJ1ZyBj
YWxsYmFjayBvcHRpb25hbAo+Pj4gRW5hYmxlcyBkcml2ZXIgdG8gcHJvdmlkZSB0aGVpciBvd24g
bWVtIG1hbmFnZXIgb2JqZWN0cwo+Pj4gU3ViY2xhc3NlcyB0aGUgb2JqZWN0cyBpbiBhbGwgZHJp
dmVycyBhbmQgbWFrZXMgdGhlbSBpbnRvIGRyaXZlciBvd25lZCBvYmplY3QKPj4+IERyb3BzIHRo
ZSBib19kZXZpY2UgYXJyYXlzIG9mIHBvaW50ZXJzLCBhbmQgc29tZSB1bm5lZWRlZCBsaW5rcyBh
bmQKPj4+IHN0cnVjdCBtZW1iZXJzCj4+PiBDbGVhbnMgdXAgb25lIGFwaS4KPj4+Cj4+PiBJIHRo
aW5rIEknZCBwcm9iYWJseSB3YW50IHRvIG1lcmdlIGFsbCB0aGlzIHZpYSBkcm0tbWlzYywgc28g
aWYgSSBjYW4gY29sbGVjdAo+Pj4gYWNrcy9yLWIgZnJvbSBkcml2ZXIgbWFpbnRhaW5lcnMgdGhh
dCB3b3VsZCBiZSBnb29kLgo+Pj4KPj4+IFRoaXMgaXMgYWxzbyBiYXNlZCBvbiBDaHJpc2l0YW4n
cyB3b3JrIHRvIHJlbW92ZSBpbml0X21lbV90eXBlLCBzbyBpdCB3b24ndAo+Pj4gYXBwbHkgdW50
aWwgaGUncyBmaW5pc2hlZCBnZXR0aW5nIGFsbCBvZiB0aGF0IGludG8gZHJtLW1pc2MuCj4+IFBy
ZXBhcmluZyB0byBwdXNoIHRoYXQgdG8gZHJtLW1pc2MtbmV4dCBqdXN0IG5vdy4KPj4KPj4gUmVn
YXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzOiUyRiUyRmNnaXQuZnJlZWRlc2t0b3Aub3JnJTJG
fmFpcmxpZWQlMkZsaW51eCUyRmxvZyUyRiUzRmglM0R0dG0tcmVmYWN0b3ItbWVtLW1hbmFnZXIm
YW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDYzE0OThjZTM1
MmJlNGM1NmIzMDkwOGQ4Mzc3Y2FlNjElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgz
ZCU3QzAlN0MwJTdDNjM3MzIwMzU1OTI2MDEwMjIzJmFtcDtzZGF0YT16clZZZ3lPYkVJOGF1U1o0
QVM3ZERPJTJCSjZXSFlNSVRtdURRJTJGMGxDeHQxSSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4gaXMg
dGhlIHRyZWUgSSd2ZSBidWlsdCB0aGlzIG9uIHRvcCBvZmYsIHNvIGl0J3MgcHJvYmFibHkgZ29p
bmcgdG8gZ2V0IHJlYmFzZWQKPj4+IGJ1dCB0aGUgY29kZSBzaG91bGQgc3RheSBtb3N0bHkgdGhl
IHNhbWUuCj4+Pgo+Pj4gSSd2ZSBkb25lIHNvbWUgYm9vdCB0ZXN0aW5nIG9uIG5vdXZlYXUsIGFu
ZCBJIGhvcGUgdG8gdGVzdCBpdCBvbiB2bXdnZnggYW5kCj4+PiBhbWRncHUgc29vbi4KPj4+Cj4+
PiBEYXZlLgo+Pj4KPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
