Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F66EDBD7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 10:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EB989DD2;
	Mon,  4 Nov 2019 09:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10073.outbound.protection.outlook.com [40.107.1.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744E789DD2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 09:45:54 +0000 (UTC)
Received: from DB7PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:5:16::42) by
 AM0PR08MB4065.eurprd08.prod.outlook.com (2603:10a6:208:12d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Mon, 4 Nov
 2019 09:45:51 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by DB7PR08CA0029.outlook.office365.com
 (2603:10a6:5:16::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24 via Frontend
 Transport; Mon, 4 Nov 2019 09:45:51 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Mon, 4 Nov 2019 09:45:50 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Mon, 04 Nov 2019 09:45:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a3e5f307d717108
X-CR-MTA-TID: 64aa7808
Received: from 74d743bea6a7.1 (cr-mta-lb-1.cr-mta-net [104.47.8.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDFDAB03-446A-4DE4-9AF7-5A8A83FD76BF.1; 
 Mon, 04 Nov 2019 09:45:43 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74d743bea6a7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Nov 2019 09:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQcUk/st4ue8shQAQ3C6pNWuaOoUvR113rVCqsGJM9e9hizYG/DtbacTEv4mKKyXyjdKiGG3fnJLakuH94/DQdEkKBbMLiaHlWgNRqkckSMKGMyMAs5Q59murg954ZWSFXEZtb0vtVhQg8VIb3DZnZbiLxxElD0nEpJg6Q0OsLy7d3UabTdmeMSQM5WzuyE/KkrzR1tatV7frRC9fRD2w24VTh5MgYefTnoWNl8mGQQ9IsO0fUKYN3pNd4IjmVTdSBeG6pwUPGLO/nuwifAitdwyDi/LDS3YCRU5OnN4lRWWvkoB9TR89pCTGpHinihy6j0XwtOSC9v0vAl1u57HrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXDpE+nRkRv5PGGEvuAaRD2ag46feHLKiaCiX0dQTA4=;
 b=SuXBXCRlUyvjHXSoIxyOS3BQFrVcmRYLdr+On1vMINVohbP6aqFJCo4eb5tCWtSdDgOPlM8gQS6h7KJdQJKSZ6f9zExTyOX4puRD7FHK9MBpDShrCO3hDF/lhK5FzH6xczthw0fmXiP7q9NGqYu1laKh359TsXf5tkcNiZHjSeaqZhyV1reOoMSUvnNGj10aDYN/UeLWF2VYePw65Rici2+qdCJsxVNwpW8RqZj0+ADVx6f1tBhlPS8AatrncI1t0UkTMsl7JNJ8Y4A/8jb/Igs94aEwIy8N4kXHnQIGDxdnQ5jgxgd0mYRJqwUEdFaeSlJi5DgqmknjBXMWu7/nOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB2949.eurprd08.prod.outlook.com (52.135.167.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 09:45:42 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e%4]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 09:45:42 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Allow system & cma heaps to be
 configured as a modules
Thread-Topic: [RFC][PATCH 2/2] dma-buf: heaps: Allow system & cma heaps to be
 configured as a modules
Thread-Index: AQHVi4693yBg1FyyFkSgMcWi1Q79X6d60haA
Date: Mon, 4 Nov 2019 09:45:42 +0000
Message-ID: <20191104094533.zal4sjexrmtgaacn@DESKTOP-E1NTVVP.localdomain>
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-3-john.stultz@linaro.org>
In-Reply-To: <20191025234834.28214-3-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.51]
x-clientproxiedby: SN1PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:802:20::15) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a341ca0-4242-42a1-1541-08d7610bc72a
X-MS-TrafficTypeDiagnostic: AM6PR08MB2949:|AM0PR08MB4065:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
X-Microsoft-Antispam-PRVS: <AM0PR08MB40650E233130B49C4191E34AF07F0@AM0PR08MB4065.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0211965D06
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(199004)(189003)(6916009)(66946007)(9686003)(6512007)(66556008)(76176011)(99286004)(66446008)(64756008)(66476007)(256004)(186003)(54906003)(26005)(6506007)(6436002)(229853002)(386003)(52116002)(58126008)(316002)(486006)(476003)(44832011)(66066001)(7416002)(6246003)(102836004)(305945005)(5024004)(14444005)(6486002)(7736002)(3846002)(6116002)(478600001)(4326008)(14454004)(71190400001)(71200400001)(86362001)(5660300002)(1076003)(8676002)(2906002)(25786009)(8936002)(81156014)(81166006)(446003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB2949;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 146ZkeT18gUHe5TgT5cE50PahMAJA27oaLqeYoJ6BhXRTffcOcCItsWTlHmxnsehmXOFBLHCHmN90lnZWo+I8Bb9CJCKsWgckViC4w8TEDOUFAUkPYZW7jepTThGOd+GerILH9W2n0Y3q0gky6Wd9dGGePem5TDid3OCGy3SMc5SlsfEjxrRj6BMkzVn436QIok1jmfBILlkZAY20l4TZvnNDZg6VLrCdYd14EpxmkImy7UJz9Xh8YBMkEQH81kDYm8STPmTq8pyCSzvIlu+Zt1/fPLmqRiexnkKcRh7vaTl3+9w3lqYNs17cO1GYdosw5TbpExm881GzL802ujbggFtzDsUxvr7QM5OhdPtMHOgHpfO8yfUprj06db8Gj6Fc4Zn2wGCaK8QUbwmswUHN+qeeKB3tOFowkys7Nd5kVdgkahTFRO4Kiihl7En6GCE
x-ms-exchange-transport-forked: True
Content-ID: <53BABD4A2570FD43AE1D2D5C1FF1CEA9@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2949
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(1110001)(339900001)(189003)(199004)(7736002)(46406003)(186003)(5024004)(14444005)(6116002)(3846002)(1076003)(86362001)(25786009)(6512007)(105606002)(81166006)(6862004)(9686003)(305945005)(486006)(76130400001)(476003)(70206006)(126002)(8936002)(70586007)(8746002)(4326008)(23726003)(99286004)(5660300002)(8676002)(81156014)(336012)(11346002)(446003)(6246003)(478600001)(6506007)(50466002)(26005)(2906002)(6486002)(66066001)(76176011)(26826003)(316002)(54906003)(14454004)(47776003)(58126008)(229853002)(356004)(97756001)(102836004)(22756006)(386003)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4065;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 60135d11-fddf-4ae6-f91e-08d7610bc1dc
NoDisclaimer: True
X-Forefront-PRVS: 0211965D06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4lOhJJrEzowiTXbbDqbjpk0asLhpLob9vEZmPeiL0r65eK9eR/M8wwGCprqqlPuVC/tdnmnihVcxyc/IUKuMFUiPrw6PuuYY+b3vYpbIhtHLh3xv5lOmcltLHcWVjLP7BHtgLtrvrnBDBmIZ4LiWmoqZH9HPbTqNK6YGy2wYTd7yPNjx/ziuQKWaIRnfy4VVqyEMHLyXNkZAMta/sM3rRxOnUbXtJreb9F/klqivyUuOdZJPxKMKhwIREdgwMsdSx4W61GTU3O+Qo6GjZ/KYAlHh2ETxL6esUzLjWyrwKXySrwDqlRNdZ4RE5i7oHH+01EdZt0rSujCXDPjUbEwyZ3Ip0duN/ctw5GdCOcFrawg26PppUxuZpHgvptlb0dJmw/YLCg2C2MoWjMraDfkhTHZtcmH0oNqF8hWVxFTXOt9q7MOzrDQTLOjwdkwXQt2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2019 09:45:50.9062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a341ca0-4242-42a1-1541-08d7610bc72a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4065
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXDpE+nRkRv5PGGEvuAaRD2ag46feHLKiaCiX0dQTA4=;
 b=uoCNWgNWsmk81OHIwatqtI8841v25wkT0H+IggAdT5EYZEg1dyAcnV7f8FiPXdyYWo7hMeDjj2hyorDSOTvF+1/DTiq4+4KIZV/2YvHI9fNHg5C268M0NmRgy7wBXbsEmFszVvyzUSsBVmlrv9jUT8zA0zPCqONfUWWCkk5HITw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXDpE+nRkRv5PGGEvuAaRD2ag46feHLKiaCiX0dQTA4=;
 b=uoCNWgNWsmk81OHIwatqtI8841v25wkT0H+IggAdT5EYZEg1dyAcnV7f8FiPXdyYWo7hMeDjj2hyorDSOTvF+1/DTiq4+4KIZV/2YvHI9fNHg5C268M0NmRgy7wBXbsEmFszVvyzUSsBVmlrv9jUT8zA0zPCqONfUWWCkk5HITw=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 Sandeep Patil <sspatil@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 "huyue2@yulong.com" <huyue2@yulong.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDExOjQ4OjM0UE0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IEFsbG93IGxvYWRpbmcgc3lzdGVtIGFuZCBjbWEgaGVhcCBhcyBhIG1v
ZHVsZSBpbnN0ZWFkIG9mIGp1c3QgYXMKPiBhIHN0YXRpY2FsbHkgYnVpbHQgaW4gaGVhcC4KPiAK
PiBTaW5jZSB0aGVyZSBpc24ndCBhIGdvb2QgbWVjaGFuaXNtIGZvciBkbWFidWYgbGlmZXRpbWUg
dHJhY2tpbmcKPiBpdCBpc24ndCBzYWZlIHRvIGFsbG93IHRoZSBoZWFwIGRyaXZlcnMgdG8gYmUg
dW5sb2FkZWQsIHNvIHRoZXNlCj4gZHJpdmVycyBkbyBub3QgaW1wbGVtZW50IGFueSBtb2R1bGUg
dW5sb2FkaW5nIGZ1bmN0aW9uYWxpdHkgYW5kCj4gd2lsbCBzaG93IHVwIGluIGxzbW9kIGFzICJb
cGVybWFuZW50XSIuCgpDb29sLCB0aGF0IGFsbGV2aWF0ZXMgbXkgY29uY2VybnMgOi0pCgo+IAo+
IFRoaXMgcGF0Y2ggYWxzbyBleHBvcnRzIGtleSBmdW5jdGlvbnMgZnJvbSBkbWFidWYgaGVhcHMg
Y29yZSBhbmQKPiB0aGUgaGVhcCBoZWxwZXIgZnVuY3Rpb25zIHNvIHRoZXkgY2FuIGJlIGFjY2Vz
c2VkIGJ5IHRoZSBtb2R1bGUuCj4gCj4gQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQu
Y29tPgo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9y
Zz4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogTGlh
bSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KPiBDYzogUHJhdGlrIFBhdGVsIDxwcmF0aWtw
QGNvZGVhdXJvcmEub3JnPgo+IENjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5j
b20+Cj4gQ2M6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KPiBDYzogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogWXVlIEh1IDxodXl1ZTJAeXVsb25n
LmNvbT4KPiBDYzogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IENjOiBDaGVu
Ym8gRmVuZyA8ZmVuZ2NAZ29vZ2xlLmNvbT4KPiBDYzogQWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJh
Y2hhbkBnb29nbGUuY29tPgo+IENjOiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+
Cj4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpv
aG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5j
ICAgICAgICAgICB8IDIgKysKPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcgICAgICAg
IHwgNCArKy0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYyB8IDIgKysK
PiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVm
L2RtYS1oZWFwLmMKPiBpbmRleCA5YTQxYjczZTU0YjQuLjJjNGFjNzFhNzE1YiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtaGVhcC5jCj4gQEAgLTE2MSw2ICsxNjEsNyBAQCB2b2lkICpkbWFfaGVhcF9nZXRfZHJ2ZGF0
YShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXApCj4gIHsKPiAgCXJldHVybiBoZWFwLT5wcml2Owo+ICB9
Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRtYV9oZWFwX2dldF9kcnZkYXRhKTsKPiAgCj4gIHN0cnVj
dCBkbWFfaGVhcCAqZG1hX2hlYXBfYWRkKGNvbnN0IHN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5m
byAqZXhwX2luZm8pCj4gIHsKPiBAQCAtMjQzLDYgKzI0NCw3IEBAIHN0cnVjdCBkbWFfaGVhcCAq
ZG1hX2hlYXBfYWRkKGNvbnN0IHN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5mbyAqZXhwX2luZm8p
Cj4gIAlrZnJlZShoZWFwKTsKPiAgCXJldHVybiBlcnJfcmV0Owo+ICB9Cj4gK0VYUE9SVF9TWU1C
T0xfR1BMKGRtYV9oZWFwX2FkZCk7CgpNYXliZSBvdmVybHkgcGlja3kgLSBidXQgYWRkaW5nIHRo
ZSBub3RlIGFib3V0ICJubyBzYWZlIHdheSB0byByZW1vdmUsCnNvIHRoZXJlJ3Mgbm8gZG1hX2hl
YXBfcmVtb3ZlIiB0byBhIGNvbW1lbnQgb24gdGhpcyBmdW5jdGlvbiBtYXkgYmUKZWFzaWVyIHRv
IG5vdGljZSB0aGFuIGluIHRoZSBnaXQgbG9nIGFsb25lLgoKQ2hlZXJzLAotQnJpYW4KCj4gIAo+
ICBzdGF0aWMgY2hhciAqZG1hX2hlYXBfZGV2bm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVtb2Rl
X3QgKm1vZGUpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25m
aWcgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZwo+IGluZGV4IGE1ZWVmMDZjNDIyNi4u
ZTI3M2ZiMThmZWNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmln
Cj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcKPiBAQCAtMSwxMiArMSwxMiBA
QAo+ICBjb25maWcgRE1BQlVGX0hFQVBTX1NZU1RFTQo+IC0JYm9vbCAiRE1BLUJVRiBTeXN0ZW0g
SGVhcCIKPiArCXRyaXN0YXRlICJETUEtQlVGIFN5c3RlbSBIZWFwIgo+ICAJZGVwZW5kcyBvbiBE
TUFCVUZfSEVBUFMKPiAgCWhlbHAKPiAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIHRvIGVuYWJsZSB0
aGUgc3lzdGVtIGRtYWJ1ZiBoZWFwLiBUaGUgc3lzdGVtIGhlYXAKPiAgCSAgaXMgYmFja2VkIGJ5
IHBhZ2VzIGZyb20gdGhlIGJ1ZGR5IGFsbG9jYXRvci4gSWYgaW4gZG91YnQsIHNheSBZLgo+ICAK
PiAgY29uZmlnIERNQUJVRl9IRUFQU19DTUEKPiAtCWJvb2wgIkRNQS1CVUYgQ01BIEhlYXAiCj4g
Kwl0cmlzdGF0ZSAiRE1BLUJVRiBDTUEgSGVhcCIKPiAgCWRlcGVuZHMgb24gRE1BQlVGX0hFQVBT
ICYmIERNQV9DTUEKPiAgCWhlbHAKPiAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIHRvIGVuYWJsZSBk
bWEtYnVmIENNQSBoZWFwLiBUaGlzIGhlYXAgaXMgYmFja2VkCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9o
ZWFwLWhlbHBlcnMuYwo+IGluZGV4IDc1MGJlZjRlOTAyZC4uZmI5ODM1MTI2ODkzIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYwo+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9oZWFwLWhlbHBlcnMuYwo+IEBAIC0yNCw2ICsyNCw3IEBAIHZvaWQg
aW5pdF9oZWFwX2hlbHBlcl9idWZmZXIoc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqYnVmZmVy
LAo+ICAJSU5JVF9MSVNUX0hFQUQoJmJ1ZmZlci0+YXR0YWNobWVudHMpOwo+ICAJYnVmZmVyLT5m
cmVlID0gZnJlZTsKPiAgfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChpbml0X2hlYXBfaGVscGVyX2J1
ZmZlcik7Cj4gIAo+ICBzdHJ1Y3QgZG1hX2J1ZiAqaGVhcF9oZWxwZXJfZXhwb3J0X2RtYWJ1Zihz
dHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpidWZmZXIsCj4gIAkJCQkJICBpbnQgZmRfZmxhZ3Mp
Cj4gQEAgLTM3LDYgKzM4LDcgQEAgc3RydWN0IGRtYV9idWYgKmhlYXBfaGVscGVyX2V4cG9ydF9k
bWFidWYoc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqYnVmZmVyLAo+ICAKPiAgCXJldHVybiBk
bWFfYnVmX2V4cG9ydCgmZXhwX2luZm8pOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGhlYXBf
aGVscGVyX2V4cG9ydF9kbWFidWYpOwo+ICAKPiAgc3RhdGljIHZvaWQgKmRtYV9oZWFwX21hcF9r
ZXJuZWwoc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqYnVmZmVyKQo+ICB7Cj4gLS0gCj4gMi4x
Ny4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
