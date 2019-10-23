Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55498E1258
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44656E959;
	Wed, 23 Oct 2019 06:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A095E6E959
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:43:01 +0000 (UTC)
Received: from VI1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::28) by AM0PR08MB4545.eurprd08.prod.outlook.com
 (2603:10a6:208:138::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Wed, 23 Oct
 2019 06:42:58 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VI1PR0802CA0018.outlook.office365.com
 (2603:10a6:800:aa::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Wed, 23 Oct 2019 06:42:58 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Wed, 23 Oct 2019 06:42:58 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Wed, 23 Oct 2019 06:42:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 749f9fa2822c9903
X-CR-MTA-TID: 64aa7808
Received: from 412c556dc9cc.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0AD913C-C24C-4F21-BBAD-37BCAFC2CBED.1; 
 Wed, 23 Oct 2019 06:42:50 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 412c556dc9cc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Oct 2019 06:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD2Bl2q5fIQMLmQubbx+FqQGWv2Pw0bJt4EUi6ATZHpQo212nbD8PQmcPEW9Hqo01qClANMtgvem44TS0OypyHjPJ3rdw27emMZELL1wLznSe8lJPTPma+xErMLm7HPyMWVGa6aaTGhf4b8cr7EUj2ToSRfTusyOKhVjKXQ1fYevnKLR/DfK1VF/UTrgTmioQM//XkC/HmjcYUxxLm29S6jM6J0SkDGd4ATLxDbRXm0ckIhTh6eG+pT5UCXB7vY7UJgQs6FLaoVY55yfmCRnkx3cJtBbsH8EPYYjRgcJbGba7N9dxaHM3uh28DdMzhHtrd5SOVSi2dM92H+o//vC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lTSa4rYX3Lu+7lcq+ZpvV7iUcBTi5ViWo+mOBrwSCc=;
 b=Oi5R5p7gdP0PQVmrq2PHPJSxxHDYv2XULITj4qE6F/2jJGqXdzk64gk9cOcWIzhYLk2givbMd32XFaBDlunJaiuwUURnWCzggg1700mVDzwEycESaL3b84S/I7Uz0bjZdis2pRNf9ZL+Z/7xbwp4xa3e1I22fRPv1Y5HmdWiqzncnDMDf6lXjRCgsHL73HHU62e2YFbV+S4P+TBICxHifmU8drZewcqmNI2nzV5Spe1w54LRywO70kN1BVUpQNe/EIp9LBMU89IuV6cXntqCtjbNonBygctGOY85Aka2trUzPYCJCyCjEhtExR+6Bh9XwqmPKC3GyFXFFwrcZnOGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4672.eurprd08.prod.outlook.com (10.255.112.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 23 Oct 2019 06:42:48 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 06:42:48 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v7 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v7 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHViW0VA353AtWU20SzEX5jAx7+KQ==
Date: Wed, 23 Oct 2019 06:42:48 +0000
Message-ID: <20191023064226.10969-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21f9630b-ea32-42fe-e39d-08d757843dd6
X-MS-TrafficTypeDiagnostic: VE1PR08MB4672:|VE1PR08MB4672:|AM0PR08MB4545:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4545AE77420134E8891FE28FB36B0@AM0PR08MB4545.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 019919A9E4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(7736002)(25786009)(2906002)(386003)(71200400001)(4326008)(36756003)(305945005)(6506007)(66066001)(2201001)(71190400001)(102836004)(5660300002)(26005)(478600001)(52116002)(14444005)(55236004)(316002)(86362001)(186003)(6116002)(3846002)(256004)(2171002)(966005)(66446008)(66946007)(103116003)(64756008)(6512007)(1076003)(66556008)(50226002)(6306002)(66476007)(476003)(6436002)(8936002)(2501003)(2616005)(6486002)(14454004)(486006)(54906003)(99286004)(81166006)(8676002)(81156014)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4672;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P6jeJ0OFS6+P8ET+tc1BGhYCwoxta7oVSAVP7NSiye3CdXGviIPYVWklP8uBFXTJ/r6Ca3SmmqdRY5dDFf3VguN7yZuO7o5m3fciMd7afw63AzpUy+rvFHz9dSd6Xusg360Dig3CPL2tJVikYe2uQS3SgWxLKar5k4W0xm5YKVRrWUt6zfhCrwqKLgLNnPx0xKqVmd6rTKrHUK4YJOX/SZAJM0x2SlZ2mr4BTMU2Azk4B+znjm7ZJnFseu+FJwE5hLQom8t9UXD1/Qwraoa6Pk+xPz80PrMGUfhUxvtrW/4qHwrWW60xZk/VVXXagDWtQ100m9lVCU91r3kLUX+You5pS6/KZERoDmKeqT/emqs3/Ur7YbQcsC8jiwY+XedQxEL2nGT4sl16DkOk+sxsriezbYoQVmo367xtGGKqT4YVcRaZ1UlMgtcKd5E4T7qw
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4672
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(1110001)(339900001)(189003)(199004)(4326008)(8936002)(2501003)(6512007)(336012)(54906003)(356004)(2171002)(25786009)(6486002)(50466002)(386003)(23756003)(6506007)(99286004)(110136005)(66066001)(102836004)(50226002)(186003)(26005)(47776003)(81166006)(81156014)(6306002)(8746002)(8676002)(316002)(5660300002)(22756006)(14444005)(305945005)(1076003)(70586007)(105606002)(70206006)(476003)(2906002)(86362001)(2616005)(486006)(36756003)(76130400001)(26826003)(126002)(14454004)(966005)(7736002)(478600001)(103116003)(6116002)(2201001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4545;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 69611141-e065-4ee6-c747-08d7578437f9
NoDisclaimer: True
X-Forefront-PRVS: 019919A9E4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6K6QBPZo2+F15kJu0CZzBpamBy59ARnRvqLCW9Rr/SOOV4m9r4J865LOoFsoNfbEgzSS3f+YIcNJ+f6C7suZv5SHsb5I72aiB2wfuJk8DpKUx5fxgx1kW+MOtcOoYCFkjX2otjhaqzfa/W8EC4IM9epuYwIWvYQwQADZRpjZ121Cn88vYu1nLoNh16kr74I9mc+4OqXpNawVr0yokNYcbd7yrZ2BT0PGfRqfFCacc+b/MHqyj3iT0b8oWUbOvfueLlEUsLSg0rOh9lA6axQ0DecAf9twQZ/AsOrbQB1hoWDiROISM9w/sLHHUqBC8ORGBan2aWYcei5jC3yGfL7jPMXjDvPs30bsBU7q30fIStLgnjuOwgelS1MklqFVdxOzl6Nq13Zz02la19utr3AZVpNzcQ69qA+cpIBnbDrVtTRkmHqefKLMACRF9DY2M+9M2YrAENZCw2hFq6OpsRvnvl3s2V8ndHqGyoZACGhj/FQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 06:42:58.0476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f9630b-ea32-42fe-e39d-08d757843dd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lTSa4rYX3Lu+7lcq+ZpvV7iUcBTi5ViWo+mOBrwSCc=;
 b=Vxyi44lkeaJ1b892p5s60h+IFKaa7Lc70/7tw7lF04Z4R3Rf+MhAHUMYRc2TixzW9pwZlhC/GrW++qRV4GYY4I24RozPy9Q/rFcF6sziKoy/yI4xCId2nTSN4FS+z6CZH5yLmoSxXx/ny6/MU9/AMG3ehYwKw+vZINA1ev7ik6A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lTSa4rYX3Lu+7lcq+ZpvV7iUcBTi5ViWo+mOBrwSCc=;
 b=Vxyi44lkeaJ1b892p5s60h+IFKaa7Lc70/7tw7lF04Z4R3Rf+MhAHUMYRc2TixzW9pwZlhC/GrW++qRV4GYY4I24RozPy9Q/rFcF6sziKoy/yI4xCId2nTSN4FS+z6CZH5yLmoSxXx/ny6/MU9/AMG3ehYwKw+vZINA1ev7ik6A=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGk6CgpUaGlzIHNlcmllcyBlbmFibGUgQ1JUQyBjb2xvci1tZ210IGZvciBrb21lZGEgZHJpdmVy
LCBmb3IgY3VycmVudCBrb21lZGEgSFcKd2hpY2ggb25seSBzdXBwb3J0cyBjb2xvciBjb252ZXJz
aW9uIGFuZCBmb3J3YXJkIGdhbW1hIGZvciBDUlRDLgoKVGhpcyBzZXJpZXMgYWN0dWFsbHkgYXJl
IHJlZ3JvdXBlZCBmcm9tOgotIGRybS9rb21lZGE6IEVuYWJsZSBsYXllci9wbGFuZSBjb2xvci1t
Z210OgogIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA4OTMvCgot
IGRybS9rb21lZGE6IEVuYWJsZSBDUlRDIGNvbG9yLW1nbXQKICBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxMzcwLwoKRm9yIHJlbW92aW5nIHRoZSBkZXBlbmRlbmNl
IG9uOgotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMzA4NzYvCgpM
b3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgxKToKICBkcm0va29tZWRhOiBBZGRzIGdh
bW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBmb3IgRE9VLUlQUwoKamFtZXMgcWlhbiB3
YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOgogIGRybS9rb21lZGE6IEFkZCBhIG5ldyBo
ZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpCiAgZHJtL2tvbWVkYTogQWRkIGRy
bV9sdXRfdG9fZmdhbW1hX2NvZWZmcygpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9jdG1fdG9fY29l
ZmZzKCkKCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMxXzMy
X3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgp2NDoKICBBZGRy
ZXNzIHJldmlldyBjb21tZW50cyBmcm9tIE1paGFpLCBEYW5pZWwgYW5kIElsaWEuCgpWNToKLSBJ
bmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9mIG0gKFFtLm4pLgotIFJlYmFzZSB3
aXRoIGRybS1taXNjLW5leHQKCnY2OgogIEFsbG93cyBtID09IDAgYWNjb3JkaW5nIHRvIE1paGFp
bCdzIGNvbW1lbnRzLgoKTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJt
L2tvbWVkYTogQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1J
UFMKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm06IEFk
ZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpCiAgZHJtL2tvbWVk
YTogQWRkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcygpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9j
dG1fdG9fY29lZmZzKCkKCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMgICAgfCAyMCArKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21n
bXQuYyAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NvbG9yX21nbXQuaCAgICB8IDEwICsrLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKwogLi4uL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jICAgIHwgIDYgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5j
ICAgICAgICAgICAgICB8IDM2ICsrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210
LmggICAgICAgICAgICAgICAgICB8ICAyICsKIDggZmlsZXMgY2hhbmdlZCwgMTQ0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
