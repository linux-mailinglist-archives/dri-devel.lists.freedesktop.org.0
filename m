Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEECBD4E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D76EBB2;
	Fri,  4 Oct 2019 14:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20075.outbound.protection.outlook.com [40.107.2.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471FF6EBB2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:33:08 +0000 (UTC)
Received: from AM4PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:205:2::16)
 by VI1PR0801MB1679.eurprd08.prod.outlook.com (2603:10a6:800:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 4 Oct
 2019 14:33:03 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by AM4PR08CA0045.outlook.office365.com
 (2603:10a6:205:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.23 via Frontend
 Transport; Fri, 4 Oct 2019 14:33:03 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 4 Oct 2019 14:33:03 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 04 Oct 2019 14:33:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b912dba5c777bff
X-CR-MTA-TID: 64aa7808
Received: from dee72b5fddc7.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8C3529F-4AFD-48A6-BB2C-356788D0EB51.1; 
 Fri, 04 Oct 2019 14:32:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dee72b5fddc7.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Oct 2019 14:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIatbTP6y9onINnKRQOl5c+lNuea//5un5M0thVigREP/UDUwlipUmk4IH8fv91INhucN5vvhqJhLZsSCF6DgWwVakVFj2R6GAhrPWZcSSTlZApdFePr6vTi5HEvkwPuO832ibqBB7KTlRBqKgY3QL26co4hL6JaTsc0QsvxxcWqxEY+lwNqsG0Dh7iD2fmHzHefzOeblQL0SRQ8iVXz+JVQ7Y5SZNbHUA6TGcqfQDh//Y1TImRUjHGhmT7APKOcPj3SKoQY4kegVqBRuqE7K3FgHY129WZHuyFSKWotOXmaJYWFHCXKImLe2Z7mzsnh0J0Ko1eowCwZIEW0UPDCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW3pBSJDcTPwwZCil2n1dfQN6Hz47RZy06NGmzqrXc8=;
 b=N5svdDPOZCfUYDgzm9kGa3ruVaNIajVb7bmy86t9PXdSp7O4g6grSkiH69CMaG32vSIptwGcthELuLF+Trxisb24etBPg0cqXX0HNVIpQEYlLnlu+yGGCRUd8G1Q1P/U3jeG7CYx+pQ2NgUoiWpm/pVg8Rgv4c57jEnb+WysBcTP/89ZuwWbxhdc6R0+BvejgD52KfPTG2JrPXKUp5H8N2qIFqTCymZfvKfZ5yNmkvnFw3Aju/vIqOKYmbOL7cAP+SgmvW48QfMSb3A/B3fhKZqjvRk0ORQltx2XHic+FC+Fe8C7ye/CLLqPl6IqduJj+zSppPMkoCvQgZGdOvc0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB4516.eurprd08.prod.outlook.com (20.179.33.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Fri, 4 Oct 2019 14:32:54 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::748f:576b:c962:6a46]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::748f:576b:c962:6a46%3]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 14:32:54 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "sean@poorly.run"
 <sean@poorly.run>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH v3] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVer3HxoO2jRYwYkCqyNFFHsjE5qdKi7qA
Date: Fri, 4 Oct 2019 14:32:54 +0000
Message-ID: <20191004143253.GA25948@arm.com>
References: <20191004141222.22337-1-ayan.halder@arm.com>
In-Reply-To: <20191004141222.22337-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::28) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 499a60d0-9862-4388-829c-08d748d7c3ab
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM0PR08MB4516:|AM0PR08MB4516:|VI1PR0801MB1679:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB167914C8EE253FA8B17C75F6E49E0@VI1PR0801MB1679.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 018093A9B5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(36756003)(6436002)(305945005)(446003)(5660300002)(478600001)(6116002)(7736002)(66946007)(386003)(2906002)(11346002)(1076003)(66446008)(66476007)(66556008)(64756008)(33656002)(44832011)(316002)(186003)(6486002)(6512007)(26005)(6506007)(102836004)(110136005)(54906003)(6246003)(229853002)(52116002)(71200400001)(2201001)(71190400001)(86362001)(256004)(14444005)(76176011)(99286004)(14454004)(476003)(2501003)(486006)(81166006)(8676002)(81156014)(8936002)(66066001)(2616005)(3846002)(25786009)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4516;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7H/oxKrINZi+BEY+Chx6EUIfxmQyzJwTvfkEDeEfDDihw4WLTekxhIRplSJDB/jZbNQkPXkCN8N5+kl09FX+KQMp/jqxpXH65zlcuBCivKslNkBxfrZtDjCMAKO1mAIjZABhcDbzqxANi5gun1aW5LQ8FeV4iBO0PD2weBPbGUX0eNhZxJOUbFxfjQN2nRZWhJT8+bfrGnjV5a8QVqhbRwTj7xITec/9tDrVs7NSO2EaI9UH2W8p1KTYBirvKB/vKbcKX4wu+LigC+17CjXpbFZ/cMj1HWtL0iQVGf5FUAI1Qn6BATtHXJtAdmrGeRDdIYh72gGdeSTmk9mADOkV0f7AzpWGCdSCh4FTPbAAKqWxMkY7HwWxX+gFGgrRMJ+sQdrw6jOInJ68VyHu3JGU0PrA7NPYYEvMc0bCq4/l/Qo=
Content-ID: <00F7C3F1F5BF814885CC73FA309B5C47@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4516
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(1110001)(339900001)(189003)(199004)(7736002)(26826003)(6246003)(107886003)(386003)(76130400001)(99286004)(126002)(102836004)(6486002)(486006)(70206006)(70586007)(76176011)(305945005)(2906002)(6506007)(5660300002)(4326008)(26005)(186003)(22756006)(14444005)(46406003)(110136005)(6116002)(356004)(50466002)(6512007)(2501003)(66066001)(476003)(47776003)(3846002)(36906005)(8746002)(316002)(478600001)(1076003)(8936002)(2616005)(11346002)(336012)(229853002)(86362001)(81166006)(8676002)(81156014)(97756001)(36756003)(2201001)(14454004)(446003)(33656002)(25786009)(54906003)(23726003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1679;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e3fca91-3a9d-492a-7a5b-08d748d7be74
NoDisclaimer: True
X-Forefront-PRVS: 018093A9B5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISuldAt2F9OfP+AcSqRU9Y95UXe8qCj4DU68ZyOX4M5OnpeFtB6g8+L9fgCs8kdqEYGHp9TnVV27IeGdzU7rmuP3P1F/wm5Se4ht49c5DGlfXB8nhPOFi5OdyUCt+skPn5Jd0NzKVPIJRBxGihZVfGd9Hx6U0+YX0CjpNTrFI2gRfX5979IKuLo93oUYbacbxen0gTdFSZm+kWREhdbG0C7TrmaKsp0CgIHrNe1mb3gyJCC8uak1fdywXiSyANe3DZfYXXk+eK+DJG1rq1gYsn7SO2rEvx6ggyeanuTkDBjzWoHisYfhJ//zCgUJ5L1YKkIjRAXNZxmS3eVu7k3gJ29Dw5ozDUWx+NS5nvmkidJH3v9nfTbDEGyPphSeVbhlVS3NcF/K1DtljpvXoMvsChVHTsYGyHTjxsISBLQ/Gus=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 14:33:03.3519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499a60d0-9862-4388-829c-08d748d7c3ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1679
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW3pBSJDcTPwwZCil2n1dfQN6Hz47RZy06NGmzqrXc8=;
 b=iyx4NprFhsJ5F8cSVXa953OkEMcqBCOF9Ddd7msjR1Ja0nD1BU0XeIKU6B1QctRz01Tgk+N5dStQBjR6xJx0jMwFlUqEHF8RE8yNTa+5ITCdFJTAvw1Nk82MvH9uMZlf6jNrp8xgei6GZZ2XxyqmOMd6COeCh5Tkif3szrAnjZk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW3pBSJDcTPwwZCil2n1dfQN6Hz47RZy06NGmzqrXc8=;
 b=iyx4NprFhsJ5F8cSVXa953OkEMcqBCOF9Ddd7msjR1Ja0nD1BU0XeIKU6B1QctRz01Tgk+N5dStQBjR6xJx0jMwFlUqEHF8RE8yNTa+5ITCdFJTAvw1Nk82MvH9uMZlf6jNrp8xgei6GZZ2XxyqmOMd6COeCh5Tkif3szrAnjZk=
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
Cc: nd <nd@arm.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDI6MTI6MzhQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gRnJvbTogUmF5bW9uZCBTbWl0aCA8cmF5bW9uZC5zbWl0aEBhcm0uY29tPgo+IAo+IEFk
ZCB0aGUgRFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJMRUFWRUQgbW9kaWZp
ZXIgdG8KPiBkZW5vdGUgdGhlIDE2eDE2IGJsb2NrIHUtaW50ZXJsZWF2ZWQgZm9ybWF0IHVzZWQg
aW4gQXJtIFV0Z2FyZCBhbmQKPiBNaWRnYXJkIEdQVXMuCj4gCj4gQ2hhbmdlcyBmcm9tIHYxOi0K
PiAxLiBSZXNlcnZlZCB0aGUgdXBwZXIgZm91ciBiaXRzIChvdXQgb2YgdGhlIDU2IGJpdHMgYXNz
aWduZWQgdG8gZWFjaCB2ZW5kb3IpCj4gdG8gZGVub3RlIHRoZSBjYXRlZ29yeSBvZiBBcm0gc3Bl
Y2lmaWMgbW9kaWZpZXJzLiBDdXJyZW50bHksIHdlIGhhdmUgdHdvCj4gY2F0ZWdvcmllcyBpZSBB
RkJDIGFuZCBNSVNDLgo+IAo+IENoYW5nZXMgZnJvbSB2MjotCj4gMS4gUHJlc2VydmVkIFJheSdz
IGF1dGhvcnNoaXAKPiAyLiBDbGVhbnVwcy9jaGFuZ2VzIHN1Z2dlc3RlZCBieSBCcmlhbgo+IDMu
IEFkZGVkIHItYnMgb2YgQnJpYW4gYW5kIFFpYW5nCj4gCj4gU2lnbmVkLW9mZi1ieTogUmF5bW9u
ZCBTbWl0aCA8cmF5bW9uZC5zbWl0aEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEF5YW4ga3Vt
YXIgaGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBCcmlhbiBTdGFy
a2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFFpYW5nIFl1IDx5dXE4
MjVAZ21haWwuY29tPgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQgLSBiYTJhMWM4NzA2MTUxYWMz
MjM0ZDJkMDIwODczZmVhYjQ5OGFiMWJiCj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2Zv
dXJjYy5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+
IGluZGV4IDNmZWVhYTNmOTg3YS4uMjM3NmQzNmVhNTczIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNj
LmgKPiBAQCAtNjQ4LDcgKzY0OCwyMSBAQCBleHRlcm4gIkMiIHsKPiAgICogRnVydGhlciBpbmZv
cm1hdGlvbiBvbiB0aGUgdXNlIG9mIEFGQkMgbW9kaWZpZXJzIGNhbiBiZSBmb3VuZCBpbgo+ICAg
KiBEb2N1bWVudGF0aW9uL2dwdS9hZmJjLnJzdAo+ICAgKi8KPiAtI2RlZmluZSBEUk1fRk9STUFU
X01PRF9BUk1fQUZCQyhfX2FmYmNfbW9kZSkJZm91cmNjX21vZF9jb2RlKEFSTSwgX19hZmJjX21v
ZGUpCj4gKwo+ICsvKgo+ICsgKiBUaGUgdG9wIDQgYml0cyAob3V0IG9mIHRoZSA1NiBiaXRzIGFs
bG90ZWQgZm9yIHNwZWNpZnlpbmcgdmVuZG9yIHNwZWNpZmljCj4gKyAqIG1vZGlmaWVycykgZGVu
b3RlIHRoZSBjYXRlZ29yeSBmb3IgbW9kaWZpZXJzLiBDdXJyZW50bHkgd2UgaGF2ZSBvbmx5IHR3
bwo+ICsgKiBjYXRlZ29yaWVzIG9mIG1vZGlmaWVycyBpZSBBRkJDIGFuZCBNSVNDLiBXZSBjYW4g
aGF2ZSBhIG1heGltdW0gb2Ygc2l4dGVlbgo+ICsgKiBkaWZmZXJlbnQgY2F0ZWdvcmllcy4KPiAr
ICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUoX190eXBlLCBfX3ZhbCkgXAo+
ICsJZm91cmNjX21vZF9jb2RlKEFSTSwgKChfX3U2NCkoX190eXBlKSA8PCA1MikgfCAoKF9fdmFs
KSAmIDB4MDAwZmZmZmZmZmZmZmZmZlVMTCkpCj4gKwo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9E
X0FSTV9UWVBFX0FGQkMgMHgwMAo+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX0FSTV9UWVBFX01J
U0MgMHgwMQo+ICsKPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fQUZCQyhfX2FmYmNfbW9k
ZSkgXAo+ICsJRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVf
QUZCQywgX19hZmJjX21vZGUpCj4gIAo+ICAvKgo+ICAgKiBBRkJDIHN1cGVyYmxvY2sgc2l6ZQo+
IEBAIC03NDIsNiArNzU2LDE2IEBAIGV4dGVybiAiQyIgewo+ICAgKi8KPiAgI2RlZmluZSBBRkJD
X0ZPUk1BVF9NT0RfQkNIICAgICAoMVVMTCA8PCAxMSkKPiAgCj4gKy8qCj4gKyAqIEFybSAxNngx
NiBCbG9jayBVLUludGVybGVhdmVkIG1vZGlmaWVyCj4gKyAqCj4gKyAqIFRoaXMgaXMgdXNlZCBi
eSBBcm0gTWFsaSBVdGdhcmQgYW5kIE1pZGdhcmQgR1BVcy4gSXQgZGl2aWRlcyB0aGUgaW1hZ2UK
PiArICogaW50byAxNngxNiBwaXhlbCBibG9ja3MuIEJsb2NrcyBhcmUgc3RvcmVkIGxpbmVhcmx5
IGluIG9yZGVyLCBidXQgcGl4ZWxzCj4gKyAqIGluIHRoZSBibG9jayBhcmUgcmVvcmRlcmVkLgo+
ICsgKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRFUkxF
QVZFRCBcCj4gKwlEUk1fRk9STUFUX01PRF9BUk1fQ09ERShEUk1fRk9STUFUX01PRF9BUk1fVFlQ
RV9NSVNDLCAxVUxMKQo+ICsKPiAgLyoKPiAgICogQWxsd2lubmVyIHRpbGVkIG1vZGlmaWVyCj4g
ICAqCj4gLS0gCj4gMi4yMy4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
