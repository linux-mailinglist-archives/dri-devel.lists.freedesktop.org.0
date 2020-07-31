Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F0234667
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D46A89F08;
	Fri, 31 Jul 2020 13:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8C889F08
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihdavGv2hsQWgBydTkDhSrh0iZvCEUI0mP/adNQ751Qrkqt5XoGl7nLHBE7347tbP5p2mFsxoemIOO7QOMNC0FiMYvD6RkehBEtSLHGfpmE0ZSbvmS33I5B24qnuuq6+yw9Qg5ujqIjrNB/GCQMmx2sHN6XuO3wosjZDmOpfmr8pRQaLb26xwx7NKey+Z/Koi6EnViZVyOpAOUtKFHB52ATiq+7Gg3Mzmb1vxXc4Qqx61T/OMwV/94J+5IkwOFUCSFoawZJvJkDt3Kf3W7ny9U163pydbQSLJvK7QYjnjto9dxggoiHyuMRGWotbVY9Wtz2KhnPMYY06Xb/5i/wVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwewZf2Qaoe6FF9TCJkHvziO4HQp2msd+UOC2dn+3Mg=;
 b=Reqf+8tLkl3Zga3ttm0dFCeAcBqMYIdJtTNKwWmfdueqpD1FSGYUQbDdgAS+kfGbsMegUx+fLbY397Of01YvXVQoslbWTS/voUj3dKOCe7+ClQ14nebWbyW4BXA98vO1iIUldc009WzUhXfNlTs1R1aBgbNoJ5EAOkSbXhs0X9yUcAnuSQY+lRikaCplqP1Tw7thD78xGV2PymeSFjB7rGvwyKUndl6JTjLswhWlL/gPJ8Y+jPrn7woIgn+r1kxTcV/K6go2MGuDqgJM0e21hmKr/WbAeLCPMLhV8907rvMBXAz27S4YNwbkq/CME+Ik20N6zLKm45KkxAo3YPGtdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwewZf2Qaoe6FF9TCJkHvziO4HQp2msd+UOC2dn+3Mg=;
 b=X/8xUeEhHfRaFrZEgn5piEwM+WcpiMRMsFL7Fh89ZyTg66yHYr5FcabkbJ2AlnqqxJt+1+1eLcO5fCfRz0hnrEuujoysJ7nsgQ2pJmDvFviE7XReq/fRF1/v/zyqSXrm3lbKuJ9BbvjUkQryauGK3TlpRQNpCKI4+fl7TQWF+KU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Fri, 31 Jul
 2020 13:01:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:01:25 +0000
Subject: Re: [PATCH 00/49] ttm mem manager refactoring.
To: daniel@ffwll.ch
References: <20200731040520.3701599-1-airlied@gmail.com>
 <e4a040b5-8033-1f1d-7dbc-02341c0927e9@amd.com>
 <20200731092935.GZ6419@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1bfd286d-8107-195e-f91e-f17be67ad7ff@amd.com>
Date: Fri, 31 Jul 2020 15:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731092935.GZ6419@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0100.eurprd05.prod.outlook.com
 (2603:10a6:207:1::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0100.eurprd05.prod.outlook.com (2603:10a6:207:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Fri, 31 Jul 2020 13:01:23 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45724665-f30b-4b04-b772-08d83551d489
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB410933E7ECFF9F57505A5C45834E0@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QW8/En0fruBEzWosiIzrNZ3ahnaJ9UAvyGZZIZKR75H41r4tWxvd6bzhvzFPundZLQny7keVIK8PvDNNrn0fuyX1dh/vTu4dqcyNfH9IzN6VqR5bw1bQcR2EOMNhInO/APDiMpUR9k6z5RdhceKTjnYQEBy0UxZ6u3u0Si9eKNSObgddJmZ5LT7amwuR2ZBNCeNbnqrrwp+Fer+9JiwWhB8Ixd92+2ZLmypFhfn/RRWnTTQ4jpcFLKMa9aIhyUzu6m4MMROLriSqgdhtUgWGRP1j+Dy08TuJ0r91JWPDH+sAwfnmbNOiKIV1KDHtXiUXomSwEVfoDdKU+gaf7RmE6sU7aSw49furEOO6NNuJ4kUn9gMu3ORPNUyZQUJBtiX//QFB58YulG98nHq1Hbh3Cexe/AVoDEZ3CQMauHAmz4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(36756003)(31696002)(52116002)(186003)(8936002)(16526019)(31686004)(6916009)(966005)(66574015)(2616005)(478600001)(8676002)(86362001)(6486002)(4326008)(5660300002)(2906002)(83380400001)(66476007)(66946007)(45080400002)(66556008)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qgeIsnu4EQOvQ6AIG+KGONN7ChRps40BsPc/Q3eWrDCdzXspV3xMVrbqNcetIFa3RJxjUW/+zx8AxU6fooojYDEjDyBLsSeFCGahXlzC1d9q/hfkyPW/8DbJjn1RUL9mRg2i9FLov/tjT8NoxZg2QVae9wbX1bsCso8I5clWJsPSuBQUwGmm2iINNHfcYMrQPnilsPDpogOE0sQaakvuEir9zb7Q8PhO+8dUuS5O+phfD6msxZU4l4Ay7EkHigHWmnT23Dq1PAGkDV/t6HuFEGSokiya2ubwck59gVKZRzaLLsd5v4V58bVFVhuacn+L4U5ztuo5bOx96cxn9cG3iaLXgHhyJesbb+p3qtXfyBleRvXAggdsHhzLr5w8ziseGOo7lOkYTNN0CZEbvNxJv0pRw6Txz4m2T7gbn19jhjJMiGuEOQO7S+v8Ibg4FPoddPGIGqaWYcsbO+lwQBDuK2WjAFGS6L9awELbA/JozXeSGZAafKApI47C3x7Uk4+LRddya0+4RFMLlv9z7kY/S2ZWmukmNzOWRp+7yb+mawijFJ5oxFsRopbfDVkJ15iZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45724665-f30b-4b04-b772-08d83551d489
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:01:25.5438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVcZ0nKa+j7E2tDVRx3ygWDdMiZZ15TI0gLqHNtaNUAxq3zdstkxWrfJ3JsqkdZ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
Cc: sroland@vmware.com, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMTE6Mjkgc2NocmllYiBkYW5pZWxAZmZ3bGwuY2g6Cj4gT24gRnJpLCBK
dWwgMzEsIDIwMjAgYXQgMTE6MTc6MjZBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMzEuMDcuMjAgdW0gMDY6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPj4+IEkgc3RhcnRl
ZCBwdWxsaW5nIG9uIGEgdGhyZWFkLCBhbmQgaXQgbGVkIG1lIGRvd24gYSBob2xlLgo+PiBXZSBt
aWdodCB3YW50IHRvIG1ha2UgdGhhdCBob2xlIGV2ZW4gYmlnZ2VyIDopCj4+Cj4+IEhvdyBhYm91
dCB3ZSByZW5hbWUgdGhlIHR0bV9tZW1fcmVnIGludG8gdHRtX3Jlc291cmNlIGFuZAo+PiB0dG1f
bWVtX3R5cGVfbWFuYWdlciBpbnRvIHR0bV9yZXNvdXJjZV9tYW5hZ2VyLgo+ICsxIG9uIG5hbWVz
IEkgY2FuIHVuZGVyc3RhbmQsIEkgYWx3YXMgZ2V0IGNvbmZ1c2VkIGFib3V0IHdoYXQgZXhhY3Rs
eSB0dG0KPiBtZWFucyB3aXRoIG1lbV9yZWcgYW5kIG1lbV90eXBlX21hbmFnZXIuCgpXZWxsIG1l
bV90eXBlX21hbmFnZXIgd2FzIG9idmlvdXMsIGJ1dCB0byBiZSBob25lc3QgSSBuZXZlciBmaWd1
cmVkIG91dCAKd2hhdCBfcmVnIG1lYW50IGVpdGhlciA6KQoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVs
Cj4KPj4gTmVpdGhlciBhbWRncHUncyBPQS9HV1MgcmVzb3VyY2VzIG5vciB0aGUgSURzIGluIFZN
R0ZYIGFyZSByZWFsbHkgbWVtb3J5Lgo+Pgo+PiBJbiB0aGUgbG9uZyB0ZXJtIEkgYWxzbyB3YW50
IHRvIG1vdmUgdGhlIHdob2xlIGFkZHJlc3MgaGFuZGxpbmcgaW50byBlYWNoCj4+IGJhY2tlbmQu
Cj4+Cj4+IEdvaW5nIHRvIHNlbmQgY29tbWVudHMgb24gdGhlIGluZGl2aWR1YWwgcGF0Y2hlcyBh
cyB3ZWxsLgo+Pgo+Pj4gVGhpcyBzZXJpZXMgcmVmYWN0b3JzIHRoZSB0dG0gdHRtX21lbV90eXBl
X21hbmFnZXIgb2JqZWN0IGludG8KPj4+IGEgZHJpdmVyIG93bmVkLCBhbGxvY2F0ZWQsIHN1YmNs
YXNzYWVkIG9iamVjdC4KPj4+Cj4+PiBJdCBzdGFydHMgd2l0aCB0d28gbWlub3IgZml4ZXMgZm9y
IHNvbWUgYmFkIGFzc3VtcHRpb25zIGluIHR3byBkcml2ZXJzLgo+Pj4KPj4+IEVuYWJsZXMgYSBu
ZXcgaW5pdCBwYXRoLCBwb3J0cyBhbGwgdGhlIGRyaXZlcnMgdG8gdGhlIG5ldyBpbml0Cj4+PiBw
YXRoLCBhbmQgY2xlYW5zIHVwIHRoZSBvbGQgaW5pdCBwYXRoLgo+Pj4gRW5hYmxlcyBhIG5ldyB0
YWtlZG93biBwYXRoLCBwb3J0cyBhbGwgdGhlIGRyaXZlcnMgdG8gdGhlIG5ldyB0YWtlZG93bgo+
Pj4gcGF0aCwgYW5kIGNsZWFucyB1cCB0aGUgb2xkIHRha2Vkb3duIHBhdGgKPj4+IFdyYXBzIGFs
bCBhY2Nlc3MgdG8gdGhlIG1lbW9yeSBtYW5hZ2VycyBpbiB0aGUgYm9fZGV2aWNlIGluIGEgd3Jh
cHBlcgo+Pj4gYWNyb3NzIGFsbCBkcml2ZXJzLgo+Pj4gTWFrZSBkZWJ1ZyBjYWxsYmFjayBvcHRp
b25hbAo+Pj4gRW5hYmxlcyBkcml2ZXIgdG8gcHJvdmlkZSB0aGVpciBvd24gbWVtIG1hbmFnZXIg
b2JqZWN0cwo+Pj4gU3ViY2xhc3NlcyB0aGUgb2JqZWN0cyBpbiBhbGwgZHJpdmVycyBhbmQgbWFr
ZXMgdGhlbSBpbnRvIGRyaXZlciBvd25lZCBvYmplY3QKPj4+IERyb3BzIHRoZSBib19kZXZpY2Ug
YXJyYXlzIG9mIHBvaW50ZXJzLCBhbmQgc29tZSB1bm5lZWRlZCBsaW5rcyBhbmQKPj4+IHN0cnVj
dCBtZW1iZXJzCj4+PiBDbGVhbnMgdXAgb25lIGFwaS4KPj4+Cj4+PiBJIHRoaW5rIEknZCBwcm9i
YWJseSB3YW50IHRvIG1lcmdlIGFsbCB0aGlzIHZpYSBkcm0tbWlzYywgc28gaWYgSSBjYW4gY29s
bGVjdAo+Pj4gYWNrcy9yLWIgZnJvbSBkcml2ZXIgbWFpbnRhaW5lcnMgdGhhdCB3b3VsZCBiZSBn
b29kLgo+Pj4KPj4+IFRoaXMgaXMgYWxzbyBiYXNlZCBvbiBDaHJpc2l0YW4ncyB3b3JrIHRvIHJl
bW92ZSBpbml0X21lbV90eXBlLCBzbyBpdCB3b24ndAo+Pj4gYXBwbHkgdW50aWwgaGUncyBmaW5p
c2hlZCBnZXR0aW5nIGFsbCBvZiB0aGF0IGludG8gZHJtLW1pc2MuCj4+IFByZXBhcmluZyB0byBw
dXNoIHRoYXQgdG8gZHJtLW1pc2MtbmV4dCBqdXN0IG5vdy4KPj4KPj4gUmVnYXJkcywKPj4gQ2hy
aXN0aWFuLgo+Pgo+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzOiUyRiUyRmNnaXQuZnJlZWRlc2t0b3Aub3JnJTJGfmFpcmxpZWQlMkZs
aW51eCUyRmxvZyUyRiUzRmglM0R0dG0tcmVmYWN0b3ItbWVtLW1hbmFnZXImYW1wO2RhdGE9MDIl
N0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNzk2NmI1NWQxZGZkNGZmZDM5Mzkw
OGQ4MzUzNDNmYWYlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdD
NjM3MzE3ODQ2MTIxNjczNjMwJmFtcDtzZGF0YT1tcWpkd2h1OW8zTGZZU2ElMkZnVzNHRER2MkFB
QmRkbUlQTVppQVhvYU52Nk0lM0QmYW1wO3Jlc2VydmVkPTAKPj4+IGlzIHRoZSB0cmVlIEkndmUg
YnVpbHQgdGhpcyBvbiB0b3Agb2ZmLCBzbyBpdCdzIHByb2JhYmx5IGdvaW5nIHRvIGdldCByZWJh
c2VkCj4+PiBidXQgdGhlIGNvZGUgc2hvdWxkIHN0YXkgbW9zdGx5IHRoZSBzYW1lLgo+Pj4KPj4+
IEkndmUgZG9uZSBzb21lIGJvb3QgdGVzdGluZyBvbiBub3V2ZWF1LCBhbmQgSSBob3BlIHRvIHRl
c3QgaXQgb24gdm13Z2Z4IGFuZAo+Pj4gYW1kZ3B1IHNvb24uCj4+Pgo+Pj4gRGF2ZS4KPj4+Cj4+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
ZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3
Qzc5NjZiNTVkMWRmZDRmZmQzOTM5MDhkODM1MzQzZmFmJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFh
ODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzMxNzg0NjEyMTY3MzYzMCZhbXA7c2RhdGE9JTJCaVpW
cXVINnRjN0Z3RXVid0RtcWtVNlBjd2RzZENDekRtMWxldXdPSWE0JTNEJmFtcDtyZXNlcnZlZD0w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
