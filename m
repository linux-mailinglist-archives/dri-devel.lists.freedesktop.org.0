Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14DEBE60
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 08:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3978D6F734;
	Fri,  1 Nov 2019 07:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40081.outbound.protection.outlook.com [40.107.4.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACF76F734
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 07:17:15 +0000 (UTC)
Received: from VI1PR08CA0176.eurprd08.prod.outlook.com (2603:10a6:800:d1::30)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17; Fri, 1 Nov
 2019 07:17:13 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0176.outlook.office365.com
 (2603:10a6:800:d1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via Frontend
 Transport; Fri, 1 Nov 2019 07:17:13 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 07:17:12 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 01 Nov 2019 07:17:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29d78dff668dd3a0
X-CR-MTA-TID: 64aa7808
Received: from 144da546acf0.2 (cr-mta-lb-1.cr-mta-net [104.47.8.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 52E326CF-B048-4AFA-88C1-DD29D26F6648.1; 
 Fri, 01 Nov 2019 07:17:07 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 144da546acf0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 01 Nov 2019 07:17:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaH1o/DISyR7t6WD3gppWzo/5XfpEK5lcWEgkVSul2MDEMHnKheqqPHRyUdX+FRQ6sp8ffw1DZUFUrvTDJSmCJvYdxixFJvjIy6qxR6yUPcztxJWWUhRKPkj0lomVbg3C0nn+i4gjLDw+/goRRuFfuYy88WRaWrIJlFbxH5nXWs5WAte4BuARPfEGgmVDRhcjySRDw/D42dAtZO8O6vXYhf9NfPfb8dmqLaoNoS4neW0KqFdMDHCR3R0HgpWH98J/mXS+ljgldWYKdQdhijaG/ATp76DzWESvO5mvvPzQk9p0rF0gO7DB4wKH8TdHbfPsmlWsVutFsU/LRxPPM/n9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7nUPmbf/5TwYW064wsEhUXruAzCIoVKDDCEmziHApg=;
 b=GZlesaLmISxT7vsmd6TsbVG2AiIiGEGhFBd9dVVtvzJmlM0be3Oz9QgAWCI36ORLl+eY+O+R3siYLaK0Qqsoix90Xyzp8oRlGYbbVK9h5fGIePeI+2SJ0VFoUsyTrW2A9nwEOQKXSs55Mvi4lCvL3sqLIBDDwYcwcCsgjK+omCgQTec42wDHrZ5UkIYVS1Xmlos6ZhZVdAv7csbn54lVkQoK1qZqwGyAtwcb84peGFYwIZn9ZYk8nmhYR16BJTddppqfOWTmaz/Sf01HKfy7iPWh8olwdCBWXFyFgNIZvp9ss14SYkeSNDtq6yDX7i4TEEe8AXU23IGOeSH5CurCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4974.eurprd08.prod.outlook.com (10.255.158.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 07:17:06 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 07:17:06 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [3/5] drm/komeda: Optionally dump DRM state on interrupts
Thread-Topic: [3/5] drm/komeda: Optionally dump DRM state on interrupts
Thread-Index: AQHVkIRdkRYOh8AuQkiwt0Vv1/Eykw==
Date: Fri, 1 Nov 2019 07:17:06 +0000
Message-ID: <20191101071659.GA30189@jamwan02-TSP300>
References: <20191021164654.9642-4-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-4-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0068.apcprd03.prod.outlook.com
 (2603:1096:203:52::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ddf2c2b2-c991-4bd3-b371-08d75e9b845e
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:|VE1PR08MB4974:|AM6PR08MB5032:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032B16D242BE720C9A88F3BB3620@AM6PR08MB5032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(199004)(189003)(25786009)(8936002)(6486002)(6246003)(81166006)(229853002)(14444005)(7736002)(71190400001)(476003)(478600001)(5660300002)(486006)(256004)(8676002)(2906002)(3846002)(71200400001)(305945005)(81156014)(6116002)(64756008)(55236004)(66446008)(102836004)(66066001)(66556008)(86362001)(6506007)(4326008)(186003)(6512007)(66476007)(6436002)(316002)(386003)(6862004)(76176011)(99286004)(26005)(54906003)(14454004)(52116002)(33716001)(9686003)(446003)(11346002)(1076003)(58126008)(6636002)(33656002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4974;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v8iB8w+gQYQTyhPc1S2KQy1aXfUF/eIdc41px5QGbTyugAX/N5rLybWgY6XhAM9cO3GnXmOsAjzT3ka03ifzjP4Sgqh0LUVjo/9gmnZTjuzBHksgdbeF5yyKmW9FKt0aCIpmGFfFJddIafgwksTmHtWXnyMhW0mdjAkfb9Wp3VGePet4OV0lQwREcOCu+qmjvEwlL6s8/BkAJhW6uWqWg+N9s+Dw63EvVq+syhlo86fKe2yx8Uik2OszthB08nI4ignNPMdcrrZ4xomfsLBQpptpgLAVNu83IQ3ju8pabmGjg0/c6IizmldvS2qIZ/HES8nWfQeqj1LUEFkpiMDiwNMLBILz0B7TZApifyYIAfjkLNPM+ei9x6oPByEGnlpOyXSNMFb51jFCbwtWWKlEmDG+58WgI+sDRmIUqAHmXkvE8S5o/4GAEEJ2NeZ7y4xB
Content-ID: <C2C318B8364FB34CBE68D86FDE7FA9C2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4974
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(136003)(346002)(376002)(396003)(1110001)(339900001)(189003)(199004)(2906002)(36906005)(1076003)(316002)(336012)(99286004)(76176011)(6486002)(14454004)(478600001)(8746002)(4326008)(81166006)(8936002)(22756006)(8676002)(81156014)(6636002)(76130400001)(186003)(26005)(229853002)(5660300002)(58126008)(54906003)(70586007)(70206006)(6862004)(14444005)(11346002)(9686003)(446003)(126002)(6512007)(46406003)(486006)(476003)(86362001)(25786009)(386003)(3846002)(102836004)(356004)(6506007)(26826003)(23726003)(105606002)(6116002)(97756001)(7736002)(107886003)(33716001)(50466002)(6246003)(47776003)(305945005)(33656002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5032;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 26127c99-a39f-4146-88bb-08d75e9b8028
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyzo8OJ3YDTVbenyjOLMnaixrsIr9DbQbgempRRWum9Icysr3abbnXDtgz03YbNnSXSRMM9vQEsizGrTSbzOIT6FVaQ7uitrt216YxhaLqcSDdBTovvGL4hDfYJT3IXdYHzQC3x4/2xoP0911E/z+tu6p7dLQctd9qbGStgPDygVed+37hegrBs9iKlPQj1y7vzKJfn+D3X7xH+5V70kAJB8edfnrme2aNKL7YXDXKc3hetAZxoJZ7sEJsiTFFHzbp2hrD07bqoPvyWS3qE5h3eESkdOkMRhj0grU/IHH3xpRs2YxPukvJL5xvjK9tcbFi9h6YDSCB6O1RQf+X5YJ265+NX+Megc/t4LYyx6DrsezYN2dyeYQGvfMqqIotIgVhc9YJnO3qr06czVGn4NQyYx+V1WZ6Hp9g/ZbMxgTIrdMZdSat7Md1uG/R2ujg9s
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 07:17:12.8924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf2c2b2-c991-4bd3-b371-08d75e9b845e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7nUPmbf/5TwYW064wsEhUXruAzCIoVKDDCEmziHApg=;
 b=bpJzMIiyz6JCMLJZAuAl855Sisyje4inq+oCj7UiPf8GyZeeRPXgto+QNdU7FmPkFbjngVIt25iNLDjODEeHVRsIbFKY27hUyZgeMLtRfzPUi3B2u+RaKB7tpEcyb2lcaOQpf7IYpjqkYAMw5KMFgVVhKsSaebmvV4YBR+65cko=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7nUPmbf/5TwYW064wsEhUXruAzCIoVKDDCEmziHApg=;
 b=bpJzMIiyz6JCMLJZAuAl855Sisyje4inq+oCj7UiPf8GyZeeRPXgto+QNdU7FmPkFbjngVIt25iNLDjODEeHVRsIbFKY27hUyZgeMLtRfzPUi3B2u+RaKB7tpEcyb2lcaOQpf7IYpjqkYAMw5KMFgVVhKsSaebmvV4YBR+65cko=
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
Cc: "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDc6MjRQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBJdCdzIHBvdGVudGlhbGx5IHVzZWZ1bCBpbmZvcm1hdGlvbiB3aGVuIGRpYWdu
b3NpbmcgZXJyb3Ivd2FybiBJUlFzLCBzbwo+IGR1bXAgaXQgdG8gZG1lc2cgd2l0aCBhIGRybV9p
bmZvX3ByaW50ZXIuIEhpZGUgdGhpcyBleHRyYSBkZWJ1ZyBkdW1waW5nCj4gYmVoaW5kIGFub3Ro
ZXIga29tZWRhX2Rldi0+ZXJyX3ZlcmJvc2l0eSBiaXQuCj4gCj4gTm90ZSB0aGF0IHRoZXJlJ3Mg
bm90IG11Y2ggc2Vuc2UgaW4gZHVtcGluZyBpdCBmb3IgSU5GTyBldmVudHMsCj4gc2luY2UgdGhl
IFZTWU5DIGV2ZW50IHdpbGwgc3dhbXAgdGhlIGxvZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWhh
aWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+CgpSZXZpZXdlZC1ieTogSmFt
ZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuaCAgIHwgNSArKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9ldmVudC5jIHwgOCArKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBpbmRleCA4MzFjMzc1MTgwZjguLjQ4MDkwMDBjMWVm
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5oCj4gQEAgLTIwNSwxMSArMjA1LDE0IEBAIHN0cnVjdCBrb21lZGFfZGV2IHsKPiAgCS8q
Kgo+ICAJICogQGVycl92ZXJib3NpdHk6IGJpdG1hc2sgZm9yIGhvdyBtdWNoIGV4dHJhIGluZm8g
dG8gcHJpbnQgb24gZXJyb3IKPiAgCSAqCj4gLQkgKiBTZWUgS09NRURBX0RFVl8qIG1hY3JvcyBm
b3IgZGV0YWlscy4KPiArCSAqIFNlZSBLT01FREFfREVWXyogbWFjcm9zIGZvciBkZXRhaWxzLiBM
b3cgYnl0ZSBjb250YWlucyB0aGUgZGVidWcKPiArCSAqIGxldmVsIGNhdGVnb3JpZXMsIHRoZSBo
aWdoIGJ5dGUgY29udGFpbnMgZXh0cmEgZGVidWcgb3B0aW9ucy4KPiAgCSAqLwo+ICAJdTE2IGVy
cl92ZXJib3NpdHk7Cj4gIAkvKiBQcmludCBhIHNpbmdsZSBsaW5lIHBlciBlcnJvciBwZXIgZnJh
bWUgd2l0aCBlcnJvciBldmVudHMuICovCj4gICNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9FUlJf
RVZFTlRTIEJJVCgwKQo+ICsJLyogRHVtcCBEUk0gc3RhdGUgb24gYW4gZXJyb3Igb3Igd2Fybmlu
ZyBldmVudC4gKi8KPiArI2RlZmluZSBLT01FREFfREVWX1BSSU5UX0RVTVBfU1RBVEVfT05fRVZF
TlQgQklUKDgpCj4gIH07Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGJvb2wKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMKPiBpbmRleCA1NzVl
ZDRkZjc0ZWQuLjVkYTYxZTdkNzVkNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwo+IEBAIC00LDYgKzQsNyBAQAo+ICAgKiBB
dXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gICAqCj4g
ICAqLwo+ICsjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1f
cHJpbnQuaD4KPiAgCj4gICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCj4gQEAgLTExMyw2ICsxMTQs
NyBAQCB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMs
IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIAlzdGF0aWMgYm9vbCBlbl9wcmludCA9IHRydWU7
Cj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4gIAl1MTYg
Y29uc3QgZXJyX3ZlcmJvc2l0eSA9IG1kZXYtPmVycl92ZXJib3NpdHk7Cj4gKwl1NjQgZXZ0c19t
YXNrID0gZXZ0cy0+Z2xvYmFsIHwgZXZ0cy0+cGlwZXNbMF0gfCBldnRzLT5waXBlc1sxXTsKPiAg
Cj4gIAkvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHByaW50LCBvbmx5IHByaW50IHRoZSBmaXJzdCBl
dnQgZm9yIG9uZSBmcmFtZSAqLwo+ICAJaWYgKGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUo
ZXZ0cykpCj4gQEAgLTEyMyw5ICsxMjUsMTAgQEAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0
cnVjdCBrb21lZGFfZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJaWYg
KGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVOVFMpCj4gIAkJcHJpbnRf
ZXZ0cyB8PSBLT01FREFfRVJSX0VWRU5UUzsKPiAgCj4gLQlpZiAoKGV2dHMtPmdsb2JhbCB8IGV2
dHMtPnBpcGVzWzBdIHwgZXZ0cy0+cGlwZXNbMV0pICYgcHJpbnRfZXZ0cykgewo+ICsJaWYgKGV2
dHNfbWFzayAmIHByaW50X2V2dHMpIHsKPiAgCQljaGFyIG1zZ1syNTZdOwo+ICAJCXN0cnVjdCBr
b21lZGFfc3RyIHN0cjsKPiArCQlzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IGRybV9pbmZvX3ByaW50
ZXIoZGV2LT5kZXYpOwo+ICAKPiAgCQlzdHIuc3RyID0gbXNnOwo+ICAJCXN0ci5zeiAgPSBzaXpl
b2YobXNnKTsKPiBAQCAtMTM5LDYgKzE0Miw5IEBAIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhz
dHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCQll
dnRfc3RyKCZzdHIsIGV2dHMtPnBpcGVzWzFdKTsKPiAgCj4gIAkJRFJNX0VSUk9SKCJlcnIgZGV0
ZWN0OiAlc1xuIiwgbXNnKTsKPiArCQlpZiAoKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BS
SU5UX0RVTVBfU1RBVEVfT05fRVZFTlQpCj4gKwkJICAgICYmIChldnRzX21hc2sgJiAoS09NRURB
X0VSUl9FVkVOVFMgfCBLT01FREFfV0FSTl9FVkVOVFMpKSkKPiArCQkJZHJtX3N0YXRlX2R1bXAo
ZGV2LCAmcCk7Cj4gIAo+ICAJCWVuX3ByaW50ID0gZmFsc2U7Cj4gIAl9Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
