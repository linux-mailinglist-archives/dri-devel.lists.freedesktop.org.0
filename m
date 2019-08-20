Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91D95C49
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 12:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAC76E62D;
	Tue, 20 Aug 2019 10:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340E16E62D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 10:31:38 +0000 (UTC)
Received: from VI1PR0801CA0073.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::17) by DB6PR0801MB1846.eurprd08.prod.outlook.com
 (2603:10a6:4:35::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Tue, 20 Aug
 2019 10:31:34 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR0801CA0073.outlook.office365.com
 (2603:10a6:800:7d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 10:31:33 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 10:31:32 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Tue, 20 Aug 2019 10:31:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83a7ab6a20af4a12
X-CR-MTA-TID: 64aa7808
Received: from b22da5af5d15.1 (cr-mta-lb-1.cr-mta-net [104.47.13.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5B44930-460F-47B2-95C9-5A764B224246.1; 
 Tue, 20 Aug 2019 10:31:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b22da5af5d15.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 20 Aug 2019 10:31:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cgd2/ycIJ1bwxNwfVq5I9I3E7Rfi/cSjE3Ayu8VNL8kcDha1/ezGcKLbl2Myo2/46ezy9q1Yyon5/ZJAk8aSKAUXLppq8j4Ic2ICDBeCWbYlUhhXAtOXDJY+Z7c5C3a0kcGtAZ6lBvvLYOoYaxhM21ITH714mO9d6HfKrO1LYRqV9qBODjAMdE8KPu9agXwHQzeaV4sK/WVz2h976Xz8kFeiND0x2vSHbSDb/vpFPzxbrtXnhP/7Wg0eZKdg71kq4/KCP1iUQir5bPHuwuo3zS+WEgKn/hpCq3FQcS5tsnJOVqdstzEzvGk2G2Lpjeb/DN4eUcgz6Ov5NF4zp/RqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b7lqGuRSa50VuZO5PCO1BgkpGBGkRM9w/GlpC/EAJs=;
 b=n2zpk3EOwdW+ZMLDuWpUm9zyx9UkwSGtJdCAAG886I9uHm2ssB+5A8t/n3F2gBjQmIgzABK8pqEJkHegmO3qrPGGYTJPYkQIXqTyDee9EtqPuP2Bp+kwsrdOTAUNuT7hwO9wGp7hmi1+sf69x9cDjfq6RjglgKQqycTP6Ma1IiQJe0jPeNp6bCoqpmU+RDt9vtfvazg3wzlEMebO8FTNdGUKFbi+M+ldt7q6gmNBDy44QoD+Z2K0dRJIzDJ9kFbwRlAr6DWWTxqW88LBbSO7kDXy1gE7w7LALDIXtyTyhY1SxxqVJ/vcPXIy7XGZJrnIub2euVsPuMJZyfuNTrmw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB5075.eurprd08.prod.outlook.com (10.255.29.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Tue, 20 Aug 2019 10:31:21 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::7532:a9e4:63b6:6a55%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 10:31:21 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2.1] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Topic: [PATCH v2.1] drm/komeda: Add support for 'memory-region' DT node
 property
Thread-Index: AQHVS3QRJOSbL91lbUCdjgcCuZ6gZKbsVfmAgBeX74A=
Date: Tue, 20 Aug 2019 10:31:21 +0000
Message-ID: <20190820103121.GA676@arm.com>
References: <20190802143951.4436-1-mihail.atanassov@arm.com>
 <20190805095408.21285-1-mihail.atanassov@arm.com>
 <20190805101329.GA26357@jamwan02-TSP300>
In-Reply-To: <20190805101329.GA26357@jamwan02-TSP300>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::35) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 71ba1e6b-d805-4b0c-22e4-08d7255991fb
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR08MB5075; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB5075:|DB6PR0801MB1846:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1846B0454CBA3CB19C4F461EE4AB0@DB6PR0801MB1846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:272;OLM:272;
x-forefront-prvs: 013568035E
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(189003)(199004)(54906003)(4326008)(6862004)(25786009)(99286004)(66066001)(36756003)(6636002)(8676002)(81156014)(81166006)(6246003)(53936002)(6116002)(3846002)(256004)(71190400001)(71200400001)(8936002)(305945005)(7736002)(33656002)(6436002)(476003)(44832011)(66946007)(386003)(6506007)(26005)(102836004)(486006)(64756008)(66476007)(66556008)(66446008)(11346002)(229853002)(1076003)(86362001)(6486002)(2906002)(316002)(478600001)(14454004)(6512007)(446003)(5660300002)(186003)(6306002)(37006003)(52116002)(76176011)(966005)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5075;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: ZxF3liX1hQclDVV+Laq8IEPXfKXbVw+vvzc2Z+CUy5vUXL3IDODXS9tNBWmQXK8fPNryUOUaeZGouhmHM3BwiwYt7rmBLqp7Zfk9S90leRuhJm+wOoNxoTVIURPK/vXUImrK7hmX1uWtDoNZ5MtrzItiblv0IRHEbIlSNsTWhwV5a+sDFwSTUXy7Yf/QTS/DKD4WfZmceS8OK9vqL/RAQtFLnnHbWp9k+iMcMInGGYNrd0XrDW1096ChZ2MbsecCF+/YkEW0KPABaVy+mclZg4rfYG3T9qPT/qXIqVk+WW2UJwuhOSBFkoLj3GnLqIe1lacGk2CkQS2sld5OUXFFUoggYhCPm9/YtJQp4tymbLDdg+G0mfbFgDDFk9f+WcKk0nW+JD4aFeJHXXi1kLVr0AFbGE8xSuj2uwOKKxF/jII=
Content-ID: <5093786B163DAA47BFF4EA2B456E6A10@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5075
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(189003)(199004)(4326008)(6486002)(54906003)(66066001)(229853002)(102836004)(126002)(478600001)(2616005)(81156014)(1076003)(76176011)(6636002)(46406003)(76130400001)(2906002)(81166006)(966005)(186003)(25786009)(486006)(476003)(47776003)(33656002)(26826003)(316002)(8676002)(70586007)(70206006)(36906005)(336012)(14454004)(37006003)(99286004)(6246003)(63350400001)(63370400001)(6862004)(97756001)(36756003)(5660300002)(7736002)(50466002)(446003)(305945005)(386003)(86362001)(11346002)(6506007)(22756006)(23726003)(6116002)(6306002)(3846002)(356004)(26005)(8936002)(6512007)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1846;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 10d85748-2471-436f-765a-08d725598b5c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0801MB1846; 
NoDisclaimer: True
X-Forefront-PRVS: 013568035E
X-Microsoft-Antispam-Message-Info: 8+Xey2wugp/wcDSDkA7BcsZVhrGz6j1l+ENTb3JjwCtmzpIOdLmalYH2w6khgBGDRQTLb5c4TTlYLNxn+UhVbTv83qzk3MfUTqsmoa6p28avYVHd3YsUfChZg7xu8ppixXIxVsA3Sv7WVoY7yL9TfhplndQPKPEikngroXmPhHDTTsMKYsRt/NSuAG8dT8GcdUVDTDks0jZtcvgKMctMPXMVJWCNRvfQxmZY0Us/iP/IX5yUJeUHuTcB2V9ME7te1zvnn4dPk7M+JB1Z8HY/HHaYWH7u2UG2wm130hDx2/xhF8kTZEqX8HHSQmGFarA8hbA7aXEEe5+SxRm72lXuQDlZq6ZRAbWQIO9L703S23XxXfZLdWR8oexi7iP2IZBCEebe4uy6//hparFfYZfzE3AlFjLBb55W3yiqoFxEAS0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 10:31:32.6975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ba1e6b-d805-4b0c-22e4-08d7255991fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b7lqGuRSa50VuZO5PCO1BgkpGBGkRM9w/GlpC/EAJs=;
 b=AKY5e6vjaFoO/YKsRRGPBwuAtuP9J4tTjOc3rmZvgy3FZ4+uc8MSCIzCswNjIczzQRgvtjk1xO5yA4o7v44ruE5oU4IYnwBAC2SUTWrtEk246afFjdDj9AQIGIeORBOUMRtIwzxBpysEszZD/eYElJHskG5z5qx5YhTaqAfogfw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b7lqGuRSa50VuZO5PCO1BgkpGBGkRM9w/GlpC/EAJs=;
 b=AKY5e6vjaFoO/YKsRRGPBwuAtuP9J4tTjOc3rmZvgy3FZ4+uc8MSCIzCswNjIczzQRgvtjk1xO5yA4o7v44ruE5oU4IYnwBAC2SUTWrtEk246afFjdDj9AQIGIeORBOUMRtIwzxBpysEszZD/eYElJHskG5z5qx5YhTaqAfogfw=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTA6MTM6MzVBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQg
MDU6NTY6MjVQTSArMDgwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToKPiA+IFRoZSAnbWVtb3J5
LXJlZ2lvbicgcHJvcGVydHkgb2YgdGhlIGtvbWVkYSBkaXNwbGF5IGRyaXZlciBEVCBiaW5kaW5n
Cj4gPiBhbGxvd3MgdGhlIHVzZSBvZiBhICdyZXNlcnZlZC1tZW1vcnknIG5vZGUgZm9yIGJ1ZmZl
ciBhbGxvY2F0aW9ucy4gQWRkCj4gPiB0aGUgcmVxdWlzaXRlIG9mX3Jlc2VydmVkX21lbV9kZXZp
Y2Vfe2luaXQscmVsZWFzZX0gY2FsbHMgdG8gYWN0dWFsbHkKPiA+IG1ha2UgdXNlIG9mIHRoZSBt
ZW1vcnkgaWYgcHJlc2VudC4KPiA+IAo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ICAtIE1vdmUg
aGFuZGxpbmcgaW5zaWRlIGtvbWVkYV9wYXJzZV9kdAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDkgKysrKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gaW5kZXgg
MWZmN2Y0YjJjNjIwLi4wMTQyZWU5OTE5NTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiA+IEBAIC04LDYgKzgsNyBAQAo+
ID4gICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZp
Y2UuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvb2ZfcmVzZXJ2ZWRfbWVtLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ID4gICNpZmRlZiBDT05G
SUdfREVCVUdfRlMKPiA+IEBAIC0xNDYsNiArMTQ3LDEyIEBAIHN0YXRpYyBpbnQga29tZWRhX3Bh
cnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gPiAg
CQlyZXR1cm4gbWRldi0+aXJxOwo+ID4gIAl9Cj4gPiAgCj4gPiArCS8qIEdldCB0aGUgb3B0aW9u
YWwgZnJhbWVidWZmZXIgbWVtb3J5IHJlc291cmNlICovCj4gPiArCXJldCA9IG9mX3Jlc2VydmVk
X21lbV9kZXZpY2VfaW5pdChkZXYpOwo+ID4gKwlpZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQo+
ID4gKwkJcmV0dXJuIHJldDsKPiA+ICsJcmV0ID0gMDsKPiA+ICsKPiA+ICAJZm9yX2VhY2hfYXZh
aWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7Cj4gPiAgCQlpZiAob2Zfbm9kZV9jbXAo
Y2hpbGQtPm5hbWUsICJwaXBlbGluZSIpID09IDApIHsKPiA+ICAJCQlyZXQgPSBrb21lZGFfcGFy
c2VfcGlwZV9kdChtZGV2LCBjaGlsZCk7Cj4gPiBAQCAtMjkyLDYgKzI5OSw4IEBAIHZvaWQga29t
ZWRhX2Rldl9kZXN0cm95KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gIAo+ID4gIAltZGV2
LT5uX3BpcGVsaW5lcyA9IDA7Cj4gPiAgCj4gPiArCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVs
ZWFzZShkZXYpOwo+ID4gKwo+ID4gIAlpZiAoZnVuY3MgJiYgZnVuY3MtPmNsZWFudXApCj4gPiAg
CQlmdW5jcy0+Y2xlYW51cChtZGV2KTsKPiA+ICAKPiA+IC0tIAo+ID4gMi4yMi4wCj4gCj4gCj4g
VGhhbmsgeW91Lgo+IAo+IFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9s
b2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpQdXNoZWQgdG8gZHJtLW1pc2Mt
bmV4dCAtIGE4YzE2Yjc1OTNiZDFhNGU2MTMxNjRhNDdjNTI2Y2E5ZDFiZTc2NGIKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
